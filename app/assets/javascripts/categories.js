var categoryArray = ['vouchers', 'gift cards', 'laptops', 'cars'];

var categories = document.querySelector('#categories');

for (var i = 0; i < categoryArray.length; i++) {
  var option = document.createElement('option');
  category = document.createTextNode(categoryArray[i]);
  option.appendChild(category);
  categories.insertBefore(option, categories.lastChild);
};

function filterCategories(event) {
  if (event.target.value == 'vouchers') {
    
  }
}