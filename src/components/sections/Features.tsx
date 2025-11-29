// src/components/sections/Features.tsx
import type { FC } from "react";

import openaiLogo from "../../assets/openailogo.svg";
import geminiLogo from "../../assets/geminilogo.svg";
import grokLogo from "../../assets/groklogo.svg";
import deepseekLogo from "../../assets/deepseeklogo.svg";

type Feature = {
  title: string;
  description: string;
  logos?: {
    name: string;
    src: string;
    alt: string;
  }[];
};

const FEATURES: Feature[] = [
  {
    title: "Motor de IA flexible",
    description:
      "NERIA puede funcionar sobre diferentes proveedores de modelos de lenguaje: elige el motor que mejor encaje con tu caso de uso, requisitos legales o presupuesto.",
    logos: [
      {
        name: "OpenAI",
        src: openaiLogo,
        alt: "OpenAI",
      },
      {
        name: "Gemini",
        src: geminiLogo,
        alt: "Gemini",
      },
      {
        name: "Grok",
        src: grokLogo,
        alt: "Grok",
      },
      {
        name: "DeepSeek",
        src: deepseekLogo,
        alt: "DeepSeek",
      },
    ],
  },
  {
    title: "Entrenado con tus datos",
    description:
      "Conecta documentación, bases de conocimiento, intranet, CRM o cualquier API para que NERIA responda con información actualizada.",
  },
  {
    title: "Multi-canal",
    description:
      "Despliega el chatbot en tu web, app móvil, portal interno, WhatsApp, Teams, Slack o donde estén tus usuarios.",
  },
  {
    title: "Orquestación de flujos",
    description:
      "Combina respuestas conversacionales con flujos de negocio: creación de tickets, reservas, formularios, workflows de aprobación y más.",
  },
  {
    title: "Seguridad corporativa",
    description:
      "Control de acceso, registro de conversaciones, cumplimiento GDPR y despliegues en cloud privado o en tu infraestructura.",
  },
  {
    title: "Multilingüe",
    description:
      "Responde en el idioma del usuario (es, en, ca, gl, etc.) manteniendo el tono y la terminología de la organización.",
  },
  {
    title: "Métricas accionables",
    description:
      "Panel de control con volumen de interacciones, intents más frecuentes, feedback de usuarios y mejoras sugeridas.",
  },
];

export const Features: FC = () => {
  const providersFeature = FEATURES[0];
  const otherFeatures = FEATURES.slice(1);

  return (
    <div className="section-wrapper py-5 bg-light">
      <div className="container">
        <h2 className="section-title mb-3">Funcionalidades clave</h2>
        <p className="section-subtitle mb-4">
          Todo lo que necesitas para lanzar un asistente conversacional
          corporativo fiable, sin depender del código.
        </p>

        <div className="row gy-4">
          {/* Bloque superior */}
          <div className="col-12">
            <div className="feature-card h-100 p-4 rounded-4">
              <h3 className="h5 mb-2">{providersFeature.title}</h3>
              <p className="text-muted mb-3">{providersFeature.description}</p>

              {providersFeature.logos && providersFeature.logos.length > 0 && (
                <div className="d-flex justify-content-center flex-wrap align-items-center gap-3 mt-2">
                  {providersFeature.logos.map((logo) => (
                    <div
                      key={logo.name}
                      className="d-flex align-items-center justify-content-center bg-white rounded-3 border px-3 py-2"
                      style={{ minWidth: 140 }}
                    >
                      <img
                        src={logo.src}
                        alt={logo.alt}
                        title={logo.name}
                        style={{
                          maxWidth: "80px",
                          maxHeight: "28px",
                          width: "auto",
                          height: "auto",
                          display: "block",
                        }}
                      />
                    </div>
                  ))}
                </div>
              )}
            </div>
          </div>

          {/* Resto de funcionalidades */}
          {otherFeatures.map((feature) => (
            <div key={feature.title} className="col-md-6 col-lg-4">
              <div className="feature-card h-100 p-4 rounded-4">
                <h3 className="h5 mb-2">{feature.title}</h3>
                <p className="text-muted mb-0">{feature.description}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};
