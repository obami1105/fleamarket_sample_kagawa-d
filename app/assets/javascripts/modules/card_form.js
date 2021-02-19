$(window).bind('load', function () {
  if (!$('#info_submit')[0]) return false;
  const payjp = Payjp('pk_test_776d589fe4bc495507e8a5f0');

  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const submit_btn = $('#info_submit');
  submit_btn.click(function (e) {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      const elem = document.getElementById('Card__new');

      if (response.error) {
        document.querySelector('#err_message').innerText =
          response.error.message;
        elem.classList.add('card_error');
      } else {
        $('#card_token').append(
          `<input type="hidden" name="payjp_token" value=${response.id}>
            <input type="hidden" name="card_token" value=${response.card.id}>`
        );
        $('#card_form')[0].submit();
      }
    });
  });
});
