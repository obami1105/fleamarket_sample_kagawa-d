$(function () {
  function buildImage(url) {
    const imageEl = `
      <img src="${url}" class="ImageBox__group__form__element">
      `;
    return imageEl;
  }

  $('.ImageBox__field').on('change', '.ImageBox__group__form', function (e) {
    const file = e.target.files[0];
    const url = URL.createObjectURL(file);

    const imageElement = buildImage(url);
    const target = $(".image-select");
    target.append(imageElement);
  });
});