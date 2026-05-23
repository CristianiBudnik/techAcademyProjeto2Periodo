AOS.init({ duration: 700, once: true, offset: 60 });


const navbar = document.querySelector('.navbar');

window.addEventListener('scroll', () => {
    if (window.scrollY > 50) {
        navbar.classList.add('scrolled');
    } else {
        navbar.classList.remove('scrolled');
    }
});


const navCollapse = document.getElementById('navbarBDK');
const menuIcon = document.getElementById('menu-icon');

navCollapse.addEventListener('show.bs.collapse', () => {
    navbar.classList.add('menu-aberto');
    menuIcon.classList.replace('fa-bars', 'fa-xmark');
});

navCollapse.addEventListener('hide.bs.collapse', () => {
    navbar.classList.remove('menu-aberto');  // ← e esse
    menuIcon.classList.replace('fa-xmark', 'fa-bars');
});