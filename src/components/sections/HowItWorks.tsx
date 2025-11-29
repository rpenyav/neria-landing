import type { FC } from "react";

export const HowItWorks: FC = () => {
  return (
    <div className="section-wrapper bg-dark py-5">
      <div className="container">
        <h2 className="section-title text-light mb-4">
          Cómo funciona el despliegue
        </h2>
        <div className="row gy-4">
          <div className="col-md-4">
            <div className="step-card h-100 p-4 rounded-4">
              <span className="step-number">1</span>
              <h3 className="h5 mt-3">Descubrimiento</h3>
              <p className="text-muted mb-0">
                Analizamos casos de uso, volumen de consultas y sistemas
                existentes para definir el alcance del chatbot.
              </p>
            </div>
          </div>

          <div className="col-md-4">
            <div className="step-card h-100 p-4 rounded-4">
              <span className="step-number">2</span>
              <h3 className="h5 mt-3">Entrenamiento e integración</h3>
              <p className="text-muted mb-0">
                Conectamos tus fuentes de información, diseñamos flujos
                conversacionales y configuramos la seguridad y el acceso.
              </p>
            </div>
          </div>

          <div className="col-md-4">
            <div className="step-card h-100 p-4 rounded-4">
              <span className="step-number">3</span>
              <h3 className="h5 mt-3">Piloto y escalado</h3>
              <p className="text-muted mb-0">
                Lanzamos un piloto controlado, medimos resultados y ajustamos el
                modelo antes de escalar a toda la organización.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
