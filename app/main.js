let nav = document.querySelector("nav");  
let hamburger =  document.querySelector("#hamburger");
hamburger.addEventListener("click", () => {
        nav.classList.toggle("open");
});

let liens = document.querySelectorAll(".liens");
liens.forEach((liens) => {
    liens.addEventListener("click", () => {
    nav.classList.remove("open");
    })    
});
 