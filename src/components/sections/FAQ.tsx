import type { FC } from "react";

const FAQ_ITEMS = [
  {
    question: "¿NERIA usa modelos open-source, propietarios o ambos?",
    answer:
      "Podemos trabajar con modelos propietarios (OpenAI, Anthropic, etc.) y con modelos open-source desplegados en tu infraestructura. La arquitectura se adapta a las necesidades de cada cliente.",
  },
  {
    question: "¿Qué idiomas soporta?",
    answer:
      "Actualmente trabajamos en español, catalán, gallego, inglés y otros idiomas europeos. Podemos añadir nuevos idiomas según el proyecto.",
  },
  {
    question: "¿Cuánto se tarda en lanzar un piloto?",
    answer:
      "Depende del alcance, pero la mayoría de pilotos se pueden lanzar en entre 4 y 8 semanas desde el kick-off.",
  },
];

export const FAQ: FC = () => {
  return (
    <div className="section-wrapper py-5">
      <div className="container">
        <h2 className="section-title mb-4">Preguntas frecuentes sobre NERIA</h2>

        <div className="accordion" id="neriaFaq">
          {FAQ_ITEMS.map((item, index) => {
            const id = `faq-${index}`;
            const collapseId = `${id}-collapse`;
            const isFirst = index === 0;

            return (
              <div key={item.question} className="accordion-item">
                <h2 className="accordion-header" id={`${id}-header`}>
                  <button
                    className={`accordion-button ${
                      !isFirst ? "collapsed" : ""
                    }`}
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target={`#${collapseId}`}
                    aria-expanded={isFirst}
                    aria-controls={collapseId}
                  >
                    {item.question}
                  </button>
                </h2>
                <div
                  id={collapseId}
                  className={`accordion-collapse collapse ${
                    isFirst ? "show" : ""
                  }`}
                  aria-labelledby={`${id}-header`}
                  data-bs-parent="#neriaFaq"
                >
                  <div className="accordion-body">{item.answer}</div>
                </div>
              </div>
            );
          })}
        </div>
      </div>
    </div>
  );
};
