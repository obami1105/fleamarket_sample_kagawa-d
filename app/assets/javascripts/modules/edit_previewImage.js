$(function () {
  function buildImage(url) {
    const imageEl = `
      <img src="${url}" class="ItemIMG">
      `;
    return imageEl;
  }

  $('.ImageBox__fieldE').on('change', '.ImageBox__group__form', function (e) {
    const file = e.target.files[0];
    const url = URL.createObjectURL(file);
   
    const imageElement = buildImage(url);
    let ItemImg = $(".ItemIMG");
    ItemImg.remove();
    const target = $(".ImageBox__Photo");
    target.append(imageElement);
  });
});