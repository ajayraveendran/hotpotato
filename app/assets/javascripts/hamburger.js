var navBar = document.querySelector('.nav-bar');

var navBarToggle = document.querySelector('.header-toggle');

navBarToggle.addEventListener('click', function() {
  navBar.classList.toggle('active');
});