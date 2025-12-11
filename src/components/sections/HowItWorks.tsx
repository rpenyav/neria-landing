import type { FC } from "react";

export const HowItWorks: FC = () => {
  return (
    <div className="section-wrapper bg-dark py-5">
      <div className="container">
        <h2 className="section-title text-light mb-4">
          Infraestructura flexible
        </h2>
        <div className="row gy-4">
          <div className="col-md-4">
            <div className="step-card h-100 p-4 rounded-4">
              <span className="step-number">1</span>
              <h3 className="h5 mt-3">Servidores cloud</h3>
              <p className="text-muted mb-0">
                Soporte para almacenamiento en S3 (AWS, MinIO o compatibles)
                para logs, adjuntos o contenidos generados.
              </p>
            </div>
          </div>

          <div className="col-md-4">
            <div className="step-card h-100 p-4 rounded-4">
              <span className="step-number">2</span>
              <h3 className="h5 mt-3">Integración</h3>
              <p className="text-muted mb-0">
                Integración con entornos CI/CD DevOps (GitHub Actions, GitLab
                CI, Azure DevOps) para despliegues automatizados.
              </p>
            </div>
          </div>

          <div className="col-md-4">
            <div className="step-card h-100 p-4 rounded-4">
              <span className="step-number">3</span>
              <h3 className="h5 mt-3">Google y agentes de monitorización</h3>
              <p className="text-muted mb-0">
                Trabajamos también con Google Cloud, tanto para orquestación
                como para servicios gestionados.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
