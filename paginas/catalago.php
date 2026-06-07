<section class="servicos" style="padding-top: 120px;">
    <div class="container">

        <div class="row mb-5">
            <div class="col-12">
                <p class="servicos-label">Nossos Produtos</p>
                <h2>Catálogo completo</h2>
            </div>
        </div>

        <div class="row mb-4">
            <div class="col-12 d-flex flex-wrap gap-2">
                <button class="btn btn-filtro active" onclick="filtrar('todos', this)">Todos</button>
                <?php
                    $cats = $pdo->query("SELECT * FROM categoria ORDER BY nome");
                    foreach ($cats->fetchAll(PDO::FETCH_ASSOC) as $cat) {
                        $slug = strtolower(preg_replace('/\s+/', '-', $cat['nome']));
                        echo "<button class='btn btn-filtro' onclick=\"filtrar('{$slug}', this)\">{$cat['nome']}</button>";
                    }
                ?>
            </div>
        </div>

        <div class="row g-3" id="lista-produtos">
            <?php
                $stmt = $pdo->query("
                    SELECT
                        p.*,
                        c.nome AS categoria,
                        (
                            SELECT GROUP_CONCAT(pi.url ORDER BY pi.ordem SEPARATOR ',')
                            FROM produto_imagem pi
                            WHERE pi.id_produto = p.id
                        ) AS imagens,
                        (
                            SELECT GROUP_CONCAT(CONCAT(a.nome, ': ', pa.valor) SEPARATOR ' | ')
                            FROM produto_atributo pa
                            JOIN atributo a ON a.id = pa.id_atributo
                            WHERE pa.id_produto = p.id
                        ) AS atributos
                    FROM produto p
                    JOIN categoria c ON c.id = p.id_categoria
                    ORDER BY c.nome, p.nome
                ");
                $produtos = $stmt->fetchAll(PDO::FETCH_ASSOC);

                foreach ($produtos as $p):
                    $slug = strtolower(preg_replace('/\s+/', '-', $p['categoria']));
                    $imagens = $p['imagens'] ? explode(',', $p['imagens']) : [];
                    $imagem_principal = $imagens[0] ?? null;
                    $imagens_json = htmlspecialchars(json_encode($imagens));
            ?>
                <div class="col-12 col-md-4 produto-item" data-categoria="<?= $slug ?>">
                    <div class="produto-card">

                        <div class="produto-img"
                             style="<?= count($imagens) ? 'cursor:pointer' : '' ?>"
                             <?php if (count($imagens)): ?>
                                 onclick="abrirGaleria(<?= $imagens_json ?>, '<?= htmlspecialchars($p['nome']) ?>')"
                             <?php endif; ?>>

                            <?php if ($imagem_principal): ?>
                                <img src="<?= htmlspecialchars($imagem_principal) ?>" alt="<?= htmlspecialchars($p['nome']) ?>">
                                <?php if (count($imagens) > 1): ?>
                                    <div class="produto-img-count">
                                        <i class="fa fa-images"></i> <?= count($imagens) ?>
                                    </div>
                                <?php endif; ?>
                            <?php else: ?>
                                <div class="produto-sem-img">
                                    <span>Sem imagem</span>
                                </div>
                            <?php endif; ?>
                            <span class="produto-categoria-badge"><?= htmlspecialchars($p['categoria']) ?></span>
                        </div>

                        <div class="produto-body">
                            <h3><?= htmlspecialchars($p['nome']) ?></h3>
                            <p><?= htmlspecialchars($p['descricao']) ?></p>

                            <?php if ($p['atributos']): ?>
                                <div class="produto-atributos">
                                    <?php foreach (explode(' | ', $p['atributos']) as $attr): ?>
                                        <span class="produto-tag"><?= htmlspecialchars($attr) ?></span>
                                    <?php endforeach; ?>
                                </div>
                            <?php endif; ?>
                        </div>

                    </div>
                </div>
            <?php endforeach; ?>
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
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselGaleria" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselGaleria" data-bs-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </button>
                </div>
                <div class="text-center mt-2" id="contadorFotos" style="color:#adb5bd; font-size:0.85rem;"></div>
            </div>
        </div>
    </div>
</div>