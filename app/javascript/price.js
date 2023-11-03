function SalesProfit(){

  const sellingPrice=document.getElementById("item-price").value;

  if (sellingPrice === ''){
    document.getElementById('add-tax-price').textContent='0';
    document.getElementById('profit').textContent='0';
  }else if (!isNaN(sellingPrice)){
    const price=parseFloat(sellingPrice);
    const tax= 0.1*price;
    const profit= price -tax;

    document.getElementById('add-tax-price').textContent=tax.toFixed(0);
    document.getElementById('profit').textContent=profit.toFixed(0);
  }else{
    document.getElementById('add-tax-price').textContent='NaN';
    document.getElementById('profit').textContent='NaN';
  }
}

window.addEventListener('input',SalesProfit)