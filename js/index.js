const links = document.querySelectorAll("nav a");
let paginaAtual = window.location.pathname.split("/").pop();

if(paginaAtual === ""){
    paginaAtual = "index.html";
}

links.forEach(link => {
    if(link.getAttribute("href") === paginaAtual){
        link.classList.add("ativo");
    }
});