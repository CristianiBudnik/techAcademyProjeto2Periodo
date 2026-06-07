AOS.init({ duration: 700, once: true, offset: 60 });

const marcarLinkAtivo = () => {
    const links = document.querySelectorAll('.navbar .nav-link');

    links.forEach(link => {
        if (link.href.includes(window.location.search)) {
            link.classList.add('active');
        }
    });
};

marcarLinkAtivo();
