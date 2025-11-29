// src/components/sections/Hero.tsx
import type { FC } from "react";
import heroImage from "../../assets/neria-capture.png";

export const Hero: FC = () => {
  const scrollTo = (id: string) => {
    const el = document.getElementById(id);
    if (el) {
      el.scrollIntoView({ behavior: "smooth", block: "start" });
    }
  };

  const handleScrollToContact = () => scrollTo("contact");

  return (
    <div className="hero-section py-5 py-lg-6">
      <div className="container">
        <div className="row align-items-center gy-5">
          {/* Columna texto */}
          <div className="col-lg-8 col-xl-7">
            <span className="badge rounded-pill text-bg-light mb-3">
              Plataforma · Chatbots · IA Generativa
            </span>
            <h1 className="display-4 fw-bold mb-3 hero-title">
              NERIA, el chatbot que entiende tu negocio.
            </h1>
            <p className="lead text-muted mb-4 hero-subtitle">
              Centraliza la atención al cliente, soporte interno y procesos
              repetitivos en un único asistente conversacional entrenado con la
              información de tu empresa.
            </p>
            <div className="d-flex flex-wrap gap-3 mb-3">
              <button
                className="btn btn-primary btn-lg"
                onClick={handleScrollToContact}
              >
                Solicitar demo personalizada
              </button>
              <button
                className="btn btn-outline-light btn-lg"
                onClick={() => scrollTo("features")}
              >
                Ver funcionalidades
              </button>
            </div>
            <p className="text-muted small">
              Despliegue en días · Integración multi-canal (web, app, intranet).
            </p>
          </div>

          {/* Columna imagen */}
          <div className="col-lg-4 col-xl-5 d-none d-lg-block">
            <div
              className="hero-image-wrapper shadow-lg rounded-4 bg-white overflow-hidden"
              style={{ height: "450px" }}
            >
              <img
                src={heroImage}
                alt="Vista del panel de NERIA"
                style={{
                  width: "100%",
                  height: "450px",
                  objectFit: "cover",
                  objectPosition: "top center",
                  display: "block",
                }}
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
