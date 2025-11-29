import type { FC } from "react";

export const Intro: FC = () => {
  return (
    <div className="section-wrapper py-5">
      <div className="container">
        <div className="row justify-content-center">
          <div className="col-lg-8">
            <h2 className="section-title">
              ¿Por qué un chatbot corporativo como NERIA?
            </h2>
            <p className="section-text">
              La forma en la que los equipos se relacionan con clientes y
              empleados ha cambiado. La atención 24/7, en múltiples canales y en
              varios idiomas ya no es opcional.
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
  );
};
