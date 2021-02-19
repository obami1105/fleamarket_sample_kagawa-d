class CreditCardsController < ApplicationController
  require 'payjp'
  before_action :authenticate_user!, only: [:show,:new]
  before_action :set_card, only: [:destroy, :show]

  def new
    card = CreditCard.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    if params['payjp_token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp_token'],
      metadata: {user_id: current_user.id}
      )
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
      else
        redirect_to action: "new"
      end
    end
  end

  def show
    unless @card.blank?
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(@card.card_id)
      @card_num = "**** **** **** " + @card_info.last4
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2, 3)
      @card_brand = @card_info.brand
      case @card_brand
      when "Visa"
        @card_src = "visa.svg"
      when "MasterCard"
        @card_src = "master.svg"
      when "JCB"
        @card_src = "jcb.svg"
      when "American Express"
        @card_src = "american_express.svg"
      when "Diners Club"
        @card_src = "dinersclub.svg"
      when "Discover"
        @card_src = "discover.svg"
      end
    end
  end

  def destroy
    @card = CreditCard.find_by(user_id: current_user.id)
    unless @card.blank?
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
      unless @card.destroy
        redirect_to credit_card_path, alert: "削除できませんでした。"
      end
    end
  end

  private

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end

end
