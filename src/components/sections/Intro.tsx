import type { FC } from "react";

export const Intro: FC = () => {
  return (
    <>
      <div className="section-wrapper py-5">
        <div className="container">
          <div className="row justify-content-center">
            <div className="col-lg-8">
              <h2 className="section-title">
                ¿Por qué un chatbot corporativo como NERIA?
              </h2>
              <p className="section-text">
                La forma en la que los equipos se relacionan con clientes y
                empleados ha cambiado. La atención 24/7, en múltiples canales y
                en varios idiomas ya no es opcional.
              </p>
              <p className="section-text">
                NERIA combina modelos de lenguaje de última generación con el
                contexto de tu organización para responder de forma precisa,
                segura y alineada con tu marca. No es un chatbot genérico: es un
                asistente entrenado para tu negocio.
              </p>
            </div>
          </div>
        </div>
      </div>
      <div className="section-wrapper bg-light-2 py-5">
        <div className="container  p-4 mt-5">
          <div className="row justify-content-center">
            <div className="col-lg-4">
              <img
                src="./productos-cars.webp"
                alt="Búsqueda dinámica de productos"
              />
            </div>
            <div className="col-lg-8">
              <h2 className="section-title">Búsqueda dinámica de productos</h2>
              <div className="d-flex justify-content-start">
                <div className="card p-4">
                  <ul className="section-text ">
                    <li>Neria realiza la consulta en vuestro endpoint.</li>
                    <li>Interpreta la respuesta.</li>
                    <li>
                      Y devuelve una ficha de producto completa, clara y
                      estructurada (nombre, precio, disponibilidad,
                      características, imágenes, variantes, etc.).
                    </li>
                  </ul>
                </div>
                <div className="card p-4 ms-3">
                  <ul className="section-text ">
                    <li>
                      Neria puede comparar productos encontrados con otros
                      propuestos.
                    </li>
                  </ul>
                </div>
              </div>

              <p className="section-text text-white mt-3">
                NERIA combina modelos de lenguaje de última generación con el
                contexto de tu organización para responder de forma precisa,
                segura y alineada con tu marca. No es un chatbot genérico: es un
                asistente entrenado para tu negocio.
              </p>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};
