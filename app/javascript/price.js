function SalesProfit(){

  const sellingPrice=document.getElementById("item-price").value;

  if (sellingPrice === ''){
    document.getElementById('add-tax-price').textContent='0';
    document.getElementById('profit').textContent='0';
  }else if (!isNaN(sellingPrice)){
    const price=parseFloat(sellingPrice);
    const tax= Math.floor(0.1*price);
    const profit= price -tax;

    document.getElementById('add-tax-price').textContent=tax;
    document.getElementById('profit').textContent=profit;
  }else{
    document.getElementById('add-tax-price').textContent='NaN';
    document.getElementById('profit').textContent='NaN';
  }
}

window.addEventListener('input',SalesProfit)