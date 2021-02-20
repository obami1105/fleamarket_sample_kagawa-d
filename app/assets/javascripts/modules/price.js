
$(function(){
  $('.Form__input__price').keydown(function(){
    var data = $('.Form__input__price').val();
      // "販売価格"をdata変数に代入
    let fee = Math.round(data * 0.1)
    if(Number.isInteger(fee)){
      let profit = (data - fee)
      let formatter = new Intl.NumberFormat();
        // ３桁ごとにカンマ区切りをする。
      $('.Value1').html(formatter.format(fee))
      $('.Value1').prepend('¥')
      $('.Value2').html(formatter.format(profit))
      $('.Value2').prepend('¥')
      if(fee == '') {
        $('.Value1').html('ー');
        $('.Value2').html('ー');
      }
    } else{
      $('.Value1').html('ー');
      $('.Value2').html('ー');
    }
      // 販売手数料が""円の時、販売手数料、販売利益を"ー"表示にする。
  });
});