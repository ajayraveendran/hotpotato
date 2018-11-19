var categoryArray = ['All', 'Cars', 'Gift Cards', 'Laptops', 'Vouchers'];

var categories = document.querySelector('#categories');

for (var i = 0; i < categoryArray.length; i++) {
  var option = document.createElement('option');
  category = document.createTextNode(categoryArray[i]);
  option.appendChild(category);
  categories.insertBefore(option, categories.lastChild);
};

function filterCategories(event) {
  window.location.href = `/filter/${event.target.value.toLowerCase()}`
}

categories.addEventListener('change', filterCategories)