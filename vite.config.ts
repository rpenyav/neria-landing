// vite.config.ts
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  plugins: [react()],
  base: "/ia/",
  server: {
    proxy: {
      // Sólo rutas que empiecen por /chat/
      "/chat/": {
        target: "http://localhost:3000",
        changeOrigin: true,
      },
    },
  },
});
