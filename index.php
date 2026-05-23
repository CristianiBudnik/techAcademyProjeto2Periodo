<?php include "include/header.php"; ?>

<?php

    $page = $_GET["page"] ?? "inicio";
    $page = "paginas/{$page}.php";

    if (file_exists($page))
        include $page;
    else
        include "paginas/erro.php";
?>

<?php include "include/footer.php"; ?>