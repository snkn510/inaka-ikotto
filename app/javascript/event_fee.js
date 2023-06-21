window.addEventListener('load', () => {
  const eventPriceElement = document.querySelector("[data-event-price]");
  const eventPrice = parseInt(eventPriceElement.dataset.eventPrice);
  const adultNumberInput = document.getElementById("adult_number");
  const childNumberInput = document.getElementById("child_number");
  const sumFeeElement = document.getElementById("sum_fee");

  const calculateTotalFee = () => {
    const adultNumber = parseInt(adultNumberInput.value) || 0;
    const childNumber = parseInt(childNumberInput.value) || 0;

    const totalFee = (adultNumber + childNumber) * eventPrice;

    sumFeeElement.textContent = totalFee;
  };

  adultNumberInput.addEventListener("input", calculateTotalFee);
  childNumberInput.addEventListener("input", calculateTotalFee);
});
