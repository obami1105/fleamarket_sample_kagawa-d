#ルート
crumb :root do
  link "フリマ", root_path
end

#マイページ_親
crumb :mypage do
  link "マイページ", mypage_path
  parent :root
end
# マイページ_子
crumb :credit_cards do
  link "支払い方法", credit_cards_path
  parent :mypage
end

# 商品詳細
crumb :item do
  link Item.find(params[:id]).name, item_path
  parent :root
end

crumb :search do
  link "検索結果", search_items_path
  parent :root
end

crumb :done do
  link "フリマ", root_path
  parent :root
end
