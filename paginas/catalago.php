<section class="servicos" style="padding-top: 120px;">
    <div class="container">

        <div class="row mb-5">
            <div class="col-12">
                <p class="servicos-label">Nossos Produtos</p>
                <h2>Catálogo completo</h2>
            </div>
        </div>

        <div class="row mb-4 ">
            <div class="col-3">
                <select class="form-select fw-bold text-uppercase" onchange="filtrar(this.value)">
                    <option value="todos">Filtar por Categoria</option>
                    <?php apresentarOpcoesFiltro($pdo); ?>
                </select>
            </div>
        </div>

        <div class="row g-3 text-center text-uppercase" id="lista-produtos">
            <?php $produtos = buscarProdutos($pdo); ?>

            <?php if (empty($produtos)): ?>
                <div class="col-12 text-center text-white">
                    <p>Nenhum produto encontrado.</p>
                </div>
            <?php else: ?>

                <?php foreach ($produtos as $p):
                    $filtro = formatarParaFiltro($p['categoria']);
                    $imagens = buscarImagensPorProduto($pdo, $p['id']);
                    $atributos = buscarAtributosPorProduto($pdo, $p['id']);
                    ?>
                    <div class="col-12 col-md-4 produto-item" data-categoria="<?= $filtro ?>">
                        <div class="produto-card">
                            <?php apresentarImagemProduto($imagens, $p); ?>
                            <?php apresentarBodyProduto($p, $atributos); ?>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>

    </div>
</section>

<div class="modal fade" id="modalGaleria" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content bg-dark border-0">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title text-white" id="modalTitulo"></h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body p-2">
                <div id="carouselGaleria" class="carousel slide">
                    <div class="carousel-inner" id="carouselInner"></div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselGaleria"
                        data-bs-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselGaleria"
                        data-bs-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </button>
                </div>
                <div class="text-center mt-2" id="contadorFotos" style="color:#adb5bd; font-size:0.85rem;"></div>
            </div>
        </div>
    </div>
</div>