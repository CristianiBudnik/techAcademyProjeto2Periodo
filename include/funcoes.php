<?php

function buscarProdutos(PDO $pdo): array
{
    $consulta = $pdo->query("
        SELECT p.*, c.nome AS categoria
        FROM produto p
        INNER JOIN categoria c ON c.id = p.id_categoria
        ORDER BY c.nome, p.nome
    ");

    $produtos = [];
    while ($linha = $consulta->fetch(PDO::FETCH_ASSOC)) {
        $produtos[] = $linha;
    }

    return $produtos;
}

function buscarCategorias(PDO $pdo): array
{
    $consulta = $pdo->query("SELECT * FROM categoria ORDER BY nome");
    return $consulta->fetchAll(PDO::FETCH_ASSOC);
}

function buscarImagensPorProduto(PDO $pdo, int $id): array
{
    if ($id <= 0) {
        return [];
    }

    $consulta = $pdo->query("
        SELECT url FROM imagem
        WHERE id_produto = $id
        ORDER BY ordem
    ");
    return $consulta->fetchAll(PDO::FETCH_ASSOC);
}

function buscarAtributosPorProduto(PDO $pdo, int $id): array
{
    if ($id <= 0) {
        return [];
    }

    $consulta = $pdo->query("
        SELECT a.nome, pa.valor
        FROM produto_atributo pa
        INNER JOIN atributo a ON a.id = pa.id_atributo
        WHERE pa.id_produto = $id
    ");
    return $consulta->fetchAll(PDO::FETCH_ASSOC);
}



function formatarParaFiltro(string $texto): string
{
    return strtolower(preg_replace('/\s+/', '-', $texto));
}

function filtrarProdutosPorCategoria(array $produtos, string $categoria): array
{
    if (empty($produtos)) {
        return [];
    }

    if ($categoria === 'todos') {
        return $produtos;
    }

    return array_filter($produtos, function ($p) use ($categoria) {
        return formatarParaFiltro($p['categoria']) === $categoria;
    });
}


function apresentarOpcoesFiltro(PDO $pdo, string $categoriaAtual = 'todos'): void
{
    $categorias = buscarCategorias($pdo);
    foreach ($categorias as $cat):
        $filtro = formatarParaFiltro($cat['nome']);
        $selecionado = $filtro === $categoriaAtual ? 'selected' : '';
?>
        <option value="<?= $filtro ?>" <?= $selecionado ?>>
            <?= htmlspecialchars($cat['nome']) ?>
        </option>
<?php
    endforeach;
}

function apresentarImagemProduto(array $imagens, array $p): void
{
    $imagem_principal = $imagens[0] ?? null;
    $urls = array_column($imagens, 'url');
    $imagens_json = htmlspecialchars(json_encode($urls));
?>
    <div class="produto-img"
         style="<?= count($imagens) ? 'cursor:pointer' : '' ?>"
         <?php if (count($imagens)): ?>
             onclick="abrirGaleria(<?= $imagens_json ?>, '<?= htmlspecialchars($p['nome']) ?>')"
         <?php endif; ?>>

        <?php if ($imagem_principal): ?>
            <img src="<?= htmlspecialchars($imagem_principal['url']) ?>" alt="<?= htmlspecialchars($p['nome']) ?>">
            <?php if (count($imagens) > 1): ?>
                <div class="produto-img-count">
                    <i class="fa fa-images"></i> <?= count($imagens) ?>
                </div>
            <?php endif; ?>
        <?php else: ?>
            <div class="produto-sem-img"><span>Sem imagem</span></div>
        <?php endif; ?>

        <span class="produto-categoria-badge"><?= htmlspecialchars($p['categoria']) ?></span>
    </div>
<?php
}

function apresentarBodyProduto(array $p, array $atributos): void
{
?>
    <div class="produto-body">
        <h3><?= htmlspecialchars($p['nome']) ?></h3>
        <p><?= htmlspecialchars($p['descricao'] ?? '') ?></p>

        <?php if (!empty($atributos)): ?>
            <div class="produto-atributos">
                <?php foreach ($atributos as $attr): ?>
                    <span class="produto-tag">
                        <?= htmlspecialchars($attr['nome']) ?>: <?= htmlspecialchars($attr['valor']) ?>
                    </span>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
    </div>
<?php
}

?>