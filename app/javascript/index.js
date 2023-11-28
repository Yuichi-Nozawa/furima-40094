function priceCalc() {
  const price = document.getElementById("item-price");
  const addTax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  price.addEventListener('input', function(){
    const priceValue = parseFloat(price.value);

    if (!isNaN(priceValue)) {
      const calculatedTax = priceValue * 0.1;
      addTax.innerHTML = calculatedTax.toFixed(0);
      profit.innerHTML = (priceValue - calculatedTax).toFixed(0);
    } else {
      addTax.innerHTML = "0.00";
      profit.innerHTML = "0.00";
    }
  });
}

window.addEventListener('load', priceCalc);