let navBar = document.querySelector('.nav-bar');

let navBarToggle = document.querySelector('.header-toggle');

navBarToggle.addEventListener('click', function() {
  navBar.classList.toggle('active');
});