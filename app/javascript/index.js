function priceCalc() {
  const price = document.getElementById("item-price");
  const addTax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  price.addEventListener('input', function(){
    const priceValue = parseFloat(price.value);

    if (!isNaN(priceValue)) {
      const calculatedTax = priceValue * 0.1;
      addTax.innerHTML = Math.floor(calculatedTax).toFixed(0);
      profit.innerHTML = Math.floor(priceValue - calculatedTax).toFixed(0);
    } else {
      addTax.innerHTML = "0";
      profit.innerHTML = "0";
    }
  });
}

window.addEventListener('load', priceCalc);