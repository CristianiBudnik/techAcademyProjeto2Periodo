<?php
    $paginaAtual = $_GET["page"] ?? "inicio";
    $page = "paginas/{$paginaAtual}.php";

    include "include/conexao.php";
    include "include/funcoes.php";
?>

<?php include "include/header.php"; ?>

<?php
    if (file_exists($page))
        include $page;
    else
        include "paginas/erro.php";
?>

<?php include "include/footer.php"; ?>
