$(function () {
  $('.MypageTabs__menu li').click(function () {
    // クリックした要素の親要素を、groupで宣言
    const group = $(this).parents('.Mypage__info');
    group.find('.active').removeClass('active');
    $(this).addClass('active');
    group.find('.show').removeClass('show');
    // クリックしたタブからインデックス番号を取得
    const index = $(this).index();
    group.find('.MypageTabs__contents').eq(index).addClass('show');
  });
});
