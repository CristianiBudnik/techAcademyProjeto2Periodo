<?php

function buscarProdutos(PDO $pdo): array {
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
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}


function buscarCategorias(PDO $pdo): array {
    $stmt = $pdo->query("SELECT * FROM categoria ORDER BY nome");
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}


function gerarSlug(string $texto): string {
    return strtolower(preg_replace('/\s+/', '-', $texto));
}

function filtrarProdutosPorCategoria(array $produtos, string $categoria): array {
    if ($categoria === 'todos') {
        return $produtos;
    }
    return array_filter($produtos, function($p) use ($categoria) {
        return gerarSlug($p['categoria']) === $categoria;
    });
}


function obterImagensProduto(array $produto): array {
    if (empty($produto['imagens'])) {
        return [];
    }
    return explode(',', $produto['imagens']);
}


function obterAtributosProduto(array $produto): array {
    if (empty($produto['atributos'])) {
        return [];
    }
    return explode(' | ', $produto['atributos']);
}