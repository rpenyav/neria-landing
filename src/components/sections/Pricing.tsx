import type { FC } from "react";

export const Pricing: FC = () => {
  return (
    <div className="section-wrapper py-5">
      <div className="container">
        <h2 className="section-title mb-3">Planes de despliegue</h2>
        <p className="section-subtitle mb-5">
          Adaptamos NERIA al tamaño de tu organización y a tus canales
          preferidos.
        </p>

        <div className="row gy-4">
          <div className="col-md-4">
            <div className="pricing-card h-100 p-4 rounded-4 border">
              <h3 className="h5 mb-2">Piloto</h3>
              <p className="text-muted small mb-3">
                Ideal para validar el impacto en un equipo o canal concreto.
              </p>
              <p className="h3 mb-3">Desde 3.000 €/mes</p>
              <ul className="list-unstyled small mb-4">
                <li>· 1 canal (web o intranet)</li>
                <li>· Hasta Xk conversaciones/mes</li>
                <li>· Integración con FAQs y documentos</li>
                <li>· Soporte y seguimiento mensual</li>
              </ul>
              <button className="btn btn-outline-primary w-100">
                Quiero probar NERIA
              </button>
            </div>
          </div>

          <div className="col-md-4">
            <div className="pricing-card h-100 p-4 rounded-4 border border-primary position-relative">
              <span className="badge bg-primary position-absolute top-0 end-0 m-3">
                Más elegido
              </span>
              <h3 className="h5 mb-2">Corporativo</h3>
              <p className="text-muted small mb-3">
                Para organizaciones que quieren un asistente transversal y
                multi-canal.
              </p>
              <p className="h3 mb-3">A medida</p>
              <ul className="list-unstyled small mb-4">
                <li>· Multi-canal (web, app, chat interno…)</li>
                <li>· Integración con sistemas core</li>
                <li>· Entrenamiento avanzado y tuning</li>
                <li>· Soporte 24/7 y SLAs</li>
              </ul>
              <button className="btn btn-primary w-100">
                Hablar con el equipo
              </button>
            </div>
          </div>

          <div className="col-md-4">
            <div className="pricing-card h-100 p-4 rounded-4 border">
              <h3 className="h5 mb-2">On-premise</h3>
              <p className="text-muted small mb-3">
                Despliegue en tu infraestructura para entornos con requisitos
                especiales de seguridad.
              </p>
              <p className="h3 mb-3">Bajo presupuesto</p>
              <ul className="list-unstyled small mb-4">
                <li>· Instalación en tu cloud o CPD</li>
                <li>· Auditoría de seguridad</li>
                <li>· Actualizaciones programadas</li>
              </ul>
              <button className="btn btn-outline-primary w-100">
                Solicitar propuesta
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
