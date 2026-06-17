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

function filtrar(categoria) {
    document.querySelectorAll('.produto-item').forEach(item => {
        if (categoria === 'todos' || item.dataset.categoria === categoria) {
            item.classList.remove('oculto');
        } else {
            item.classList.add('oculto');
        }
    });
}

function abrirGaleria(imagens, titulo) {
        const inner = document.getElementById('carouselInner');
        inner.innerHTML = '';

        imagens.forEach((url, i) => {
            inner.innerHTML += `
                <div class="carousel-item ${i === 0 ? 'active' : ''}">
                    <img src="${url}" alt="${titulo}">
                </div>`;
        });

        document.getElementById('modalTitulo').textContent = titulo;
        document.getElementById('contadorFotos').textContent = `1 / ${imagens.length}`;

        const carouselEl = document.getElementById('carouselGaleria');
        
        const novoCarousel = carouselEl.cloneNode(true);
        carouselEl.parentNode.replaceChild(novoCarousel, carouselEl);

        novoCarousel.addEventListener('slid.bs.carousel', function(e) {
            document.getElementById('contadorFotos').textContent = `${e.to + 1} / ${imagens.length}`;
        });

        new bootstrap.Modal(document.getElementById('modalGaleria')).show();
    }
