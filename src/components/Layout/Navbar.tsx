import type { FC } from "react";
import LogoNeria from "../LogoNeria";

export const Navbar: FC = () => {
  const handleNavClick = (targetId: string) => {
    const el = document.getElementById(targetId);
    if (el) {
      el.scrollIntoView({ behavior: "smooth", block: "start" });
    }
  };

  return (
    <header className="neria-navbar-wrapper sticky-top">
      <nav className="navbar navbar-expand-lg bg-white shadow-sm">
        <div className="container">
          <a
            className="navbar-brand d-flex align-items-center"
            href="#hero"
            onClick={(e) => {
              e.preventDefault();
              handleNavClick("hero");
            }}
          >
            <LogoNeria size={34} color="#000 " />
            <span className="ms-3 fw-bold">NERIA</span>
            <span className="text-muted ms-1">Chatbot</span>
          </a>

          <button
            className="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#neriaNavbar"
            aria-controls="neriaNavbar"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon" />
          </button>

          <div className="collapse navbar-collapse" id="neriaNavbar">
            <ul className="navbar-nav ms-auto mb-2 mb-lg-0 me-lg-3">
              <li className="nav-item">
                <button
                  className="btn btn-link nav-link"
                  onClick={() => handleNavClick("features")}
                >
                  Funcionalidades
                </button>
              </li>
              <li className="nav-item">
                <button
                  className="btn btn-link nav-link"
                  onClick={() => handleNavClick("use-cases")}
                >
                  Casos de uso
                </button>
              </li>
              <li className="nav-item">
                <button
                  className="btn btn-link nav-link"
                  onClick={() => handleNavClick("pricing")}
                >
                  Precios
                </button>
              </li>
              <li className="nav-item">
                <button
                  className="btn btn-link nav-link"
                  onClick={() => handleNavClick("faq")}
                >
                  FAQ
                </button>
              </li>
            </ul>

            <div className="d-flex gap-2">
              <button
                className="btn btn-outline-secondary"
                onClick={() => handleNavClick("contact")}
              >
                Solicitar demo
              </button>
              <button className="btn btn-primary">Entrar a NERIA</button>
            </div>
          </div>
        </div>
      </nav>
    </header>
  );
};
