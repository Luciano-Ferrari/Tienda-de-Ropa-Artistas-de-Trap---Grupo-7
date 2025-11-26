/*Java del Nav*/
const nav = document.querySelector("nav");
const navOffsetTop = nav.offsetTop;

window.addEventListener("scroll", () => {
  if (window.scrollY > navOffsetTop) {
    nav.classList.add("nav-fixed");
  } else {
    nav.classList.remove("nav-fixed");
  }
});

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

  document.addEventListener("keydown", (e) => {
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

/*Java de Carrito*/

const cargarCarrito = () => {
  const carrito = JSON.parse(localStorage.getItem("carritoTiendaTrap")) || [];
  return carrito;
};

const guardarCarrito = (carrito) => {
  localStorage.setItem("carritoTiendaTrap", JSON.stringify(carrito));
};

const renderizarCarrito = () => {
  const carrito = cargarCarrito();
  let total = 0;

  const listasProductos = document.querySelectorAll("#Lista-Productos");
  const sumasTotalPrecios = document.querySelectorAll("#Suma-Total-Precios");

  total = carrito.reduce((sum, producto) => sum + producto.precio, 0);

  listasProductos.forEach((listaProductos) => {
    listaProductos.innerHTML = "";

    if (carrito.length === 0) {
      listaProductos.innerHTML =
        '<li class="carrito-vacio">El carrito está vacío.</li>';
    } else {
      const productosAgrupados = carrito.reduce((acc, producto) => {
        acc[producto.id] = acc[producto.id] || { ...producto, cantidad: 0 };
        acc[producto.id].cantidad++;
        return acc;
      }, {});

      Object.values(productosAgrupados).forEach((producto) => {
        const subtotal = producto.precio * producto.cantidad;
        const li = document.createElement("li");
        li.classList.add("item-carrito");
        li.innerHTML = `
            <span class="cantidad">${producto.cantidad}x</span> 
            <span class="nombre-producto-carrito"> ${producto.nombre} ${
          producto.info ? `(${producto.info})` : ""
        }</span>
            <span class="precio-producto-carrito">$${subtotal.toFixed(2)}</span>
          `;
        listaProductos.appendChild(li);
      });
    }
  });

  sumasTotalPrecios.forEach((sumaTotalPrecios) => {
    sumaTotalPrecios.textContent = `$${total.toFixed(2)}`;
  });
};

const btnMenu = document.getElementById("btnMenu");
const menuLateral = document.getElementById("menuLateral");
const btnCarrito = document.getElementById("Btn-Carrito");
const carritoLateral = document.getElementById("carritoLateral");
const btnAgregarCarrito = document.getElementById("Btn-Agregar-Carrito");

const agregarProductoAlCarrito = (producto) => {
  if (!producto || !producto.id || producto.precio === 0) {
    console.error("No se pudo agregar el producto: datos incompletos.");
    return;
  }

  const carrito = cargarCarrito();
  carrito.push(producto);
  guardarCarrito(carrito);
  renderizarCarrito();

  if (carritoLateral) carritoLateral.classList.add("active");
  if (menuLateral) menuLateral.classList.remove("active");

  const overlay = document.getElementById("overlay");
  if (overlay) overlay.classList.add("show");
};

const toggleMenu = () => {
  if (menuLateral) menuLateral.classList.toggle("active");
  if (
    menuLateral &&
    menuLateral.classList.contains("active") &&
    carritoLateral
  ) {
    carritoLateral.classList.remove("active");
  }
};

const toggleCarrito = () => {
  if (carritoLateral) carritoLateral.classList.toggle("active");
  if (
    carritoLateral &&
    carritoLateral.classList.contains("active") &&
    menuLateral
  ) {
    menuLateral.classList.remove("active");
  }
};

if (btnMenu) btnMenu.addEventListener("click", toggleMenu);
if (btnCarrito) btnCarrito.addEventListener("click", toggleCarrito);

if (btnAgregarCarrito && typeof productoData !== "undefined") {
  btnAgregarCarrito.addEventListener("click", () => {
    agregarProductoAlCarrito(productoData);
  });
}

const btnRealizarPedido = document.querySelector(".btn-realizar");

if (btnRealizarPedido) {
  btnRealizarPedido.addEventListener("click", (e) => {
    e.preventDefault();
    alert("Pedido realizado con éxito. Gracias por tu compra!");
    localStorage.removeItem("carritoTiendaTrap");
    window.location.href = "../Index.html";
  });
}

const btnEliminarCarrito = document.querySelector(".Btn-Eliminar");

if (btnEliminarCarrito) {
  btnEliminarCarrito.addEventListener("click", () => {
    localStorage.removeItem("carritoTiendaTrap");
    renderizarCarrito();
  });
}

const botonVerTodo = document.getElementById("Ver-todo");
const seccionVerTodo = document.getElementById("Seccion-Ver-Todo");

if (botonVerTodo) {
  botonVerTodo.addEventListener("click", function (e) {
    e.preventDefault();

    seccionVerTodo.classList.toggle("mostrar");

    botonVerTodo.classList.toggle("rotado");
  });
}

document.addEventListener("DOMContentLoaded", () => {
  const urlParams = new URLSearchParams(window.location.search);

  if (urlParams.get("session_cleared") === "1") {
    localStorage.removeItem("carritoTiendaTrap");
    const newUrl = window.location.pathname;
    history.replaceState(null, "", newUrl);
    renderizarCarrito();
  }
});

document.addEventListener("DOMContentLoaded", renderizarCarrito);