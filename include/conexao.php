<?php
$httpHost = $_SERVER['HTTP_HOST'];

if (str_contains($httpHost, ':8080') || str_contains($httpHost, '192.168.56.101')) {

    $host   = "192.168.56.101";
    $dbname = "bdkesquadrias";
    $user   = "cristiani";
    $pass   = "260896";
} else {

    $host   = "sql309.ezyro.com";
    $dbname = "ezyro_42232199_bdkesquadrias";
    $user   = "ezyro_42232199";
    $pass   = "260896";
}

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erro na conexão: " . $e->getMessage());
}
?>