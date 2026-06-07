<section class="servicos" style="padding-top: 120px;">
    <div class="container">

        <div class="row mb-5">
            <div class="col-12">
                <p class="servicos-label">Nossos Produtos</p>
                <h2>Catálogo completo</h2>
            </div>
        </div>

        <div class="row g-3">
            <?php
                $stmt = $pdo->query("
                    SELECT p.*, c.nome AS categoria
                    FROM produto p
                    JOIN produto_categoria pc ON pc.id_produto = p.id
                    JOIN categoria c ON c.id = pc.id_categoria
                ");
                $produtos = $stmt->fetchAll(PDO::FETCH_ASSOC);

                foreach ($produtos as $p) {
            ?>
                <div class="col-12 col-md-4">
                    <div class="servico-card">
                        <span class="servico-num"><?= $p['categoria'] ?></span>
                        <h3><?= $p['nome_produto'] ?></h3>
                        <p><?= $p['descricao'] ?></p>
                    </div>
                </div>
            <?php } ?>
        </div>

    </div>
</section>