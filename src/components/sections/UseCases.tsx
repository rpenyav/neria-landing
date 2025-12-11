import type { FC } from "react";

const USE_CASES = [
  {
    title: "Atención al cliente",
    description:
      "Resuelve FAQs, seguimiento de pedidos, incidencias básicas y consultas de producto sin saturar el call center.",
  },
  {
    title: "Soporte interno TI / HR",
    description:
      "Portal único para dudas de herramientas internas, onboarding, políticas de empresa y gestión de permisos.",
  },
  {
    title: "Sector legal / consultoría",
    description:
      "Acceso guiado a bases de conocimiento jurídicas, plantillas y criterios internos, manteniendo trazabilidad.",
  },
  {
    title: "Búsqueda y recomendación de productos",
    description: "Encontrar, comparar y cotejar productos.",
  },
];

export const UseCases: FC = () => {
  return (
    <div className="section-wrapper py-5 bg-light">
      <div className="container">
        <h2 className="section-title mb-4">Casos de uso habituales</h2>
        <div className="row gy-4">
          {USE_CASES.map((item) => (
            <div key={item.title} className="col-md-4">
              <div className="usecase-card h-100 p-4 rounded-4">
                <h3 className="h5 mb-2">{item.title}</h3>
                <p className="text-muted mb-0">{item.description}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};
