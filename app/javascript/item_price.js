window.addEventListener('turbo:load', () => {

  const priceInput = document.getElementById("item-price");

    priceInput.addEventListener("input", () => {

      const addTaxDom = document.getElementById("add-tax-price");
  // addTaxDom.innerHTML = "入力した金額をもとに販売手数料を計算する処理"
      addTaxDom.innerHTML = Math.round(priceInput.value * 0.1 ).toLocaleString();;

      const addPofitDom = document.getElementById("profit");
      addPofitDom.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 )).toLocaleString();
    })
});
