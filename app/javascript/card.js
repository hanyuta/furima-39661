const pay = () => {
  const payjp = Payjp(``)
  const elements = payjp.elements();
  const numberElement = elements.create(`cardNumber`);
  const form = document.getElementById(`charge-form`);
  form.addEventListener("submit",(e) => {
    console.log("フォーム送信時にイベント発火");
    e.preventDefault();
  });
}

window.addEventListener("turbo:load",pay);