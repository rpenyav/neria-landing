import type { FC } from "react";
import LogoNeria from "../LogoNeria";

export const Footer: FC = () => {
  const year = new Date().getFullYear();

  return (
    <footer className="neria-footer mt-auto">
      <div className="container py-4 border-top">
        <div className="row align-items-center gy-3">
          <div className="col-md-6">
            <div className="d-flex align-items-center">
              <LogoNeria size={24} color="#000 " />
              <span className="ms-2 fw-semibold">NERIA Chatbot</span>
            </div>
            <p className="text-muted small mb-0 mt-1">
              © {year} Automatización de atención con IA.
            </p>
          </div>
          <div className="col-md-6 d-flex justify-content-md-end gap-3 small">
            <a href="#hero" className="text-muted">
              Inicio
            </a>
            <a href="#pricing" className="text-muted">
              Precios
            </a>
            <a href="#contact" className="text-muted">
              Contacto
            </a>
          </div>
        </div>
      </div>
    </footer>
  );
};
