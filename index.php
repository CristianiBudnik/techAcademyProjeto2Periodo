<?php 
  include "include/header.php"
?>
    <main>
        <div class="main" data-aos="fade-up">
            <h3>Desde 2008 · Vidro & Alumínio</h3>
            <h1>Precisão em cada milímetro, <br>
                transparência em cada projeto.</h1>

            <p>A BDK Esquadrias projeta, fabrica e instala soluções em vidro<br> temperado e alumínio sob medida — para residências,<br>comércios e obras de grande porte.</p>

            <a class="btn btn-primary disabled" role="button">
                Solicitar orçamento
            </a>
            <a class="btn btn-secondary disabled" role="button">
                Ver serviços
            </a>

        </div>

        <section class="secao-img" data-aos="fade-up">
            <div class="secao-img-wrapper">
                <img src="img/banner.png" alt="Vidro">
                <div class="secao-img-texto">
                    <div class="stat">
                        <h2>+17</h2>
                        <p>ANOS DE MERCADO</p>
                    </div>
                    <div class="stat">
                        <h2>+1.2K</h2>
                        <p>OBRAS ENTREGUES</p>
                    </div>
                </div>
            </div>
        </section>
        <section class="servicos" data-aos="fade-up">
    <div class="servicos-header">
        <div>
            <p class="servicos-label">O QUE FAZEMOS</p>
            <h2>Soluções completas em vidro<br>e alumínio.</h2>
        </div>
        <a href="index.php?page=servico" class="servicos-ver-todos">Ver todos →</a>
    </div>

    <div class="servicos-grid">
        <div class="servico-card">
            <span class="servico-num">01</span>
            <h3>Esquadrias de Alumínio</h3>
            <p>Janelas, portas e fachadas em alumínio sob medida, com acabamento de alta durabilidade e perfis de linha completa.</p>
            <div class="servico-tags">
                <span>Linha Suprema</span>
                <span>Pintura eletrostática</span>
                <span>Vedação acústica</span>
            </div>
        </div>

        <div class="servico-card">
            <span class="servico-num">02</span>
            <h3>Box para Banheiro</h3>
            <p>Box em vidro temperado 8mm com ferragens em aço inox. Modelos de correr, articulado e frontal.</p>
            <div class="servico-tags">
                <span>Vidro 8mm temperado</span>
                <span>Inox 304</span>
                <span>Instalação inclusa</span>
            </div>
        </div>
        <div class="servico-card">
            <span class="servico-num">03</span>
            <h3>Espelhos sob Medida</h3>
            <p>Espelhos cristal, bronze e fumê com lapidação e bisotê. Projetos para residências, lojas e academias.</p>
            <div class="servico-tags">
                <span>Lapidação fina</span>
                <span>Bisotê</span>
                <span>Fixação invisível</span>
            </div>
        </div>
        <div class="servico-card">
            <span class="servico-num">04</span>
            <h3>Coberturas de Vidro</h3>
            <p>Coberturas em vidro laminado para áreas externas, sacadas e pergolados. Estrutura em alumínio anodizado.</p>
            <div class="servico-tags">
                <span>Laminado refletivo</span>
                <span>Estrutura inôx</span>
                <span>Calhas embutidas</span>
            </div>
        </div>
    </div>
</section>

    </main>
    <section class="cta" data-aos="fade-up">
      <h2>Pronto para começar seu projeto?<br>Vamos conversar sobre as medidas.</h2>
      <a href="index.php?page=contato" class="cta-btn">Falar com a BDK →</a>
    </section>

    <?php
    //recuperar a variável page por GET
    $page = $_GET["page"] ?? "inicio"; 
    //home/sobre/ajuda -> paginas/home.php
    $page = "paginas/{$page}.php";

    //incluir o arquivo
    if (file_exists($page))
      include $page;
    else
      include "paginas/erro.php";

    ?>

    <?php
      include "include/footer.php"
    ?>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>

</body>