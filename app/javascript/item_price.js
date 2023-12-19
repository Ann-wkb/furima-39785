window.addEventListener('turbo:load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  console.log("イベント発火");
});

const taxPriceInput = document.getElementById("add-tax-price");
console.log(taxPriceInput);

const profitInput = document.getElementById("profit");
console.log(profitInput);
});
