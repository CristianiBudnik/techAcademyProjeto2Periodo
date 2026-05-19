<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cutive+Mono&family=Epilogue:ital,wght@0,100..900;1,100..900&family=Mozilla+Text:wght@200..700&family=Urbanist:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">

    <link rel="shortcut icon" href="img/logoSemFundo.png" type="image/x-icon">

    <link rel="stylesheet" href="css/style.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <title>BDK Esquadrias</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">


</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">

  <div class="container-fluid">

    <a class="navbar-brand" href="index.php">
        <img src="img/logoSemFundo.png" alt="BDK Esquadrias">
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">

      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.php?page=inicio">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="sobre.php?page=sobre">Sobre</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="servico.php?page=servico">Serviços</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="galeria.php?page=galeria">Galeria</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contato.php?page=contato">Contato</a>
        </li>
      </ul>
      
    </div>
  </div>
</nav>

    <main>
        <div class="main">
            <h3>Desde 2008 · Vidro & Alumínio</h3>
            <h1>Precisão em <br>
                cada milímetro,<br>
                transparência<br>
                em cada projeto.</h1>
            <p>A BDK Esquadrias projeta, fabrica e instala soluções em vidro<br> temperado e alumínio sob medida — para residências,<br>comércios e obras de grande porte.</p>

            <a class="btn btn-primary disabled" role="button">
                Solicitar orçamento
            </a>
            <a class="btn btn-secondary disabled" role="button">
                Ver serviços
            </a>

        </div>

        <section>
  <!-- Hero com imagem de fundo e estatísticas -->
  <div class="position-relative overflow-hidden rounded-3" style="height: 360px;">
    <img src="img/vidro.png" class="w-100 h-100 object-fit-cover" 
         style="filter: brightness(0.75);" alt="Fachada de vidro temperado">

    <div class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between align-items-end p-4">
      <div>
        <div class="text-white fw-bold" style="font-size: 3.5rem; line-height: 1;">17</div>
        <div class="text-white text-uppercase" style="font-size: 0.7rem; letter-spacing: 3px; opacity: .75;">Anos de mercado</div>
      </div>
      <div class="text-end">
        <div class="text-white fw-bold" style="font-size: 3.5rem; line-height: 1;">+1.2k</div>
        <div class="text-white text-uppercase" style="font-size: 0.7rem; letter-spacing: 3px; opacity: .75;">Obras entregues</div>
      </div>
    </div>
  </div>

  <!-- Features abaixo do hero -->
  <div class="row g-0 border-top">
    <div class="col-4 border-end p-4 d-flex gap-3">
      <i class="ti ti-scissors fs-5 text-secondary mt-1 flex-shrink-0"></i>
      <div>
        <p class="fw-semibold mb-1">Sob medida</p>
        <p class="text-secondary small mb-0">Cada peça projetada e fabricada para o seu espaço.</p>
      </div>
    </div>
    <div class="col-4 border-end p-4 d-flex gap-3">
      <i class="ti ti-shield fs-5 text-secondary mt-1 flex-shrink-0"></i>
      <div>
        <p class="fw-semibold mb-1">Norma ABNT</p>
        <p class="text-secondary small mb-0">Vidros temperados e laminados com certificação.</p>
      </div>
    </div>
    <div class="col-4 p-4 d-flex gap-3">
      <i class="ti ti-sparkles fs-5 text-secondary mt-1 flex-shrink-0"></i>
      <div>
        <p class="fw-semibold mb-1">Acabamento fino</p>
        <p class="text-secondary small mb-0">Lapidação, bisotê e ferragens em aço inox.</p>
      </div>
    </div>
  </div>
</section>

    </main>

    <footer>

    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

</body>