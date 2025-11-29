// src/components/ChatbotFloatingAddon.tsx
import type { FC } from "react";
import { useEffect, useRef } from "react";

// Tipos globales para lo que expone el bundle del chatbot
declare global {
  interface Window {
    mountNeriaChatbot?: (container: HTMLElement) => void;
    ChatbotWidget?: {
      mount: (container: HTMLElement) => void;
    };
  }
}

export const ChatbotFloatingAddon: FC = () => {
  const containerRef = useRef<HTMLDivElement | null>(null);

  useEffect(() => {
    const container = containerRef.current;

    if (!container) {
      console.warn("[NERIA] Contenedor flotante del chatbot no encontrado");
      return;
    }

    if (window.mountNeriaChatbot) {
      console.log("[NERIA] Montando chatbot vía window.mountNeriaChatbot");
      window.mountNeriaChatbot(container);
      return;
    }

    if (window.ChatbotWidget?.mount) {
      console.log("[NERIA] Montando chatbot vía window.ChatbotWidget.mount");
      window.ChatbotWidget.mount(container);
      return;
    }

    console.warn(
      "[NERIA] No se ha encontrado ninguna función de montaje del chatbot en window."
    );
  }, []);

  return (
    <div
      className="neria-chatbot-floating"
      style={{
        position: "fixed",
        right: "24px",
        bottom: "24px",

        zIndex: 9999,
        // opcional: pequeño borde/sombra
        boxShadow: "0 12px 40px rgba(0, 0, 0, 0.25)",
        borderRadius: "16px",
        overflow: "hidden",
        backgroundColor: "#ffffff",
      }}
    >
      {/* Aquí es donde el bundle monta el chatbot */}
      <div ref={containerRef} style={{ width: "100%", height: "100%" }} />
    </div>
  );
};
