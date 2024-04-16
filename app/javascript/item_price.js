// window.addEventListener('turbo:load', () => {
//   // const priceInput = document.getElementById("item-price");
//   const priceInput = document.getElementById("item-price");
window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitNum = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    addTaxDom.innerHTML = Math.floor(inputValue * 0.1); // 手数料を10%とする場合
    profitNum.innerHTML = Math.floor(inputValue * 0.9); // 手数料が10%なら利益は90%
  })
});

