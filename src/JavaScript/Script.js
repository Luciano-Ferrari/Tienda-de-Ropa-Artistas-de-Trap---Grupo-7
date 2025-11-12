/*Java de Paneles Laterales*/

document.addEventListener("DOMContentLoaded", () => {
  const btnMenu = document.getElementById("btnMenu");
  const btnCarrito = document.getElementById("Btn-Carrito");
  const menuLateral = document.getElementById("menuLateral");
  const carritoLateral = document.getElementById("carritoLateral");

  const overlay = document.createElement("div");
  overlay.id = "overlay";
  document.body.appendChild(overlay);

  function cerrarPaneles() {
    menuLateral.classList.remove("active");
    carritoLateral.classList.remove("active");
    overlay.classList.remove("show");
  }

  btnMenu.addEventListener("click", () => {
    menuLateral.classList.add("active");
    overlay.classList.add("show");
  });

  btnCarrito.addEventListener("click", () => {
    carritoLateral.classList.add("active");
    overlay.classList.add("show");
  });

  overlay.addEventListener("click", cerrarPaneles);

  document.addEventListener("keydown", e => {
    if (e.key === "Escape") cerrarPaneles();
  });
});

/*Java de Carrousel*/

document.addEventListener("DOMContentLoaded", () => {
  const carrusel = document.querySelector(".carrousel");
  const items = document.querySelectorAll(".item");
  const btnIzq = document.getElementById("btnIzq");
  const btnDer = document.getElementById("btnDer");

  const visible = 4;
  const total = items.length;
  let index = 0;

  function moverCarrusel() {
    const desplazamiento = (100 / visible) * index;
    carrusel.style.transform = `translateX(-${desplazamiento}%)`;
  }

  btnDer.addEventListener("click", () => {
    if (index < total - visible) {
      index++;
      moverCarrusel();
    }
  });

  btnIzq.addEventListener("click", () => {
    if (index > 0) {
      index--;
      moverCarrusel();
    }
  });
});