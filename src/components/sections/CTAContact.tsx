import type { FC, FormEvent } from "react";
import { useEffect, useRef, useState } from "react";

// Tipado súper simple para evitar problemas
declare global {
  interface Window {
    grecaptcha?: any;
  }
}

export const CTAContact: FC = () => {
  const [submitted, setSubmitted] = useState(false);
  const [captchaError, setCaptchaError] = useState<string | null>(null);
  const [submitting, setSubmitting] = useState(false);

  const captchaContainerRef = useRef<HTMLDivElement | null>(null);
  const captchaWidgetIdRef = useRef<number | null>(null);

  const siteKey = import.meta.env.VITE_RECAPTCHA_SITE_KEY as string | undefined;

  // Renderizamos el captcha cuando se monta el formulario
  useEffect(() => {
    if (!siteKey) return;
    if (typeof window === "undefined") return;

    let cancelled = false;

    const tryRender = () => {
      if (cancelled) return;

      const grecaptcha = window.grecaptcha;
      if (!grecaptcha || typeof grecaptcha.render !== "function") {
        // El script aún no está cargado, reintentamos
        setTimeout(tryRender, 300);
        return;
      }

      if (!captchaContainerRef.current) return;
      if (captchaWidgetIdRef.current !== null) return; // ya renderizado

      try {
        const widgetId = grecaptcha.render(captchaContainerRef.current, {
          // 👇 aquí es "sitekey" (propiedad), y usamos la variable siteKey
          sitekey: siteKey,
          callback: () => {
            setCaptchaError(null);
          },
          "expired-callback": () => {
            // si caduca, obligamos a validar de nuevo
            captchaWidgetIdRef.current = null;
          },
          "error-callback": () => {
            setCaptchaError(
              "Ha ocurrido un error al cargar el captcha. Por favor, recarga la página."
            );
          },
        });
        captchaWidgetIdRef.current = widgetId;
      } catch (err) {
        console.error("Error renderizando reCAPTCHA en el formulario", err);
        setCaptchaError(
          "No se pudo inicializar el captcha. Por favor, recarga la página."
        );
      }
    };

    tryRender();

    return () => {
      cancelled = true;
    };
  }, [siteKey]);

  const handleSubmit = (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    if (siteKey) {
      const grecaptcha = window.grecaptcha;
      if (!grecaptcha || typeof grecaptcha.getResponse !== "function") {
        setCaptchaError(
          "No se pudo inicializar reCAPTCHA. Por favor, recarga la página."
        );
        return;
      }

      const widgetId =
        captchaWidgetIdRef.current !== null
          ? captchaWidgetIdRef.current
          : undefined;
      const response = grecaptcha.getResponse(widgetId);

      if (!response) {
        setCaptchaError(
          "Por favor marca la casilla 'No soy un robot' antes de enviar el formulario."
        );
        return;
      }
    }

    // Aquí podrías llamar a tu backend / email service
    setSubmitting(true);

    setTimeout(() => {
      setSubmitting(false);
      setSubmitted(true);
    }, 300);
  };

  return (
    <div className="section-wrapper py-5 bg-dark text-light">
      <div className="container">
        <div className="row gy-4 align-items-center">
          <div className="col-lg-6">
            <h2 className="section-title text-light">
              Hablemos de tu proyecto de chatbot.
            </h2>
            <p className="section-text text-light-50">
              Cuéntanos brevemente tu caso de uso y te contactaremos con una
              propuesta adaptada a tu organización.
            </p>
          </div>

          <div className="col-lg-6">
            {submitted ? (
              <div className="alert alert-success mb-0 rounded-4">
                <h3 className="h5 mb-1">¡Gracias por tu interés!</h3>
                <p className="mb-0 small">
                  Esta es una demo estática. En la versión real enviaremos tu
                  solicitud directamente al equipo de NERIA.
                </p>
              </div>
            ) : (
              <form
                className="cta-form p-4 p-lg-5 bg-white text-dark rounded-4"
                onSubmit={handleSubmit}
              >
                <div className="mb-3">
                  <label className="form-label">Nombre y apellidos</label>
                  <input
                    type="text"
                    className="form-control"
                    required
                    name="name"
                  />
                </div>

                <div className="mb-3">
                  <label className="form-label">Correo corporativo</label>
                  <input
                    type="email"
                    className="form-control"
                    required
                    name="email"
                  />
                </div>

                <div className="mb-3">
                  <label className="form-label">Empresa</label>
                  <input type="text" className="form-control" name="company" />
                </div>

                <div className="mb-3">
                  <label className="form-label">
                    ¿Qué te gustaría automatizar con NERIA?
                  </label>
                  <textarea
                    className="form-control"
                    rows={4}
                    name="message"
                    required
                  />
                </div>

                {/* reCAPTCHA */}
                <div className="mb-3">
                  <div ref={captchaContainerRef} />
                  <p className="small text-muted mt-2 mb-0">
                    Esta página está protegida por reCAPTCHA y se aplican la{" "}
                    <a
                      href="https://policies.google.com/privacy"
                      target="_blank"
                      rel="noreferrer"
                    >
                      Política de privacidad
                    </a>{" "}
                    y las{" "}
                    <a
                      href="https://policies.google.com/terms"
                      target="_blank"
                      rel="noreferrer"
                    >
                      Condiciones del servicio
                    </a>{" "}
                    de Google.
                  </p>
                  {captchaError && (
                    <p className="text-danger small mt-2 mb-0">
                      {captchaError}
                    </p>
                  )}
                </div>

                <button
                  type="submit"
                  className="btn btn-primary w-100"
                  disabled={submitting}
                >
                  {submitting ? "Enviando..." : "Solicitar contacto"}
                </button>
                <p className="small text-muted mt-2 mb-0">
                  Al enviar este formulario aceptas que te contactemos
                  únicamente para hablar sobre NERIA. Sin spam.
                </p>
              </form>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};
