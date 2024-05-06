// document.addEventListener('turbolinks:load', () => { 
window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitNum = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    let fee = Math.floor(inputValue * 0.1); // 手数料を10%とする場合
    addTaxDom.innerHTML = fee; 
    profitNum.innerHTML = inputValue - fee; // 利益は入力金額から手数料を差し引いたもの
  })
});

