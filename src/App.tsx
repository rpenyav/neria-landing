import type { FC } from "react";
import { Navbar } from "./components/Layout/Navbar";
import { Footer } from "./components/Layout/Footer";

import { Hero } from "./components/sections/Hero";
import { Intro } from "./components/sections/Intro";
import { Features } from "./components/sections/Features";
import { HowItWorks } from "./components/sections/HowItWorks";
import { UseCases } from "./components/sections/UseCases";
import { Pricing } from "./components/sections/Pricing";
import { CTAContact } from "./components/sections/CTAContact";
import { FAQ } from "./components/sections/FAQ";
import { ChatbotFloatingAddon } from "./components/ChatbotFloatingAddon";

const App: FC = () => {
  return (
    <div className="neria-app d-flex flex-column min-vh-100">
      <Navbar />
      <main>
        <section id="hero">
          <Hero />
          <ChatbotFloatingAddon />
        </section>

        <section id="intro">
          <Intro />
        </section>

        <section id="features">
          <Features />
        </section>

        <section id="how-it-works">
          <HowItWorks />
        </section>

        <section id="use-cases">
          <UseCases />
        </section>

        <section id="pricing">
          <Pricing />
        </section>

        <section id="contact">
          <CTAContact />
        </section>

        <section id="faq">
          <FAQ />
        </section>
      </main>
      <Footer />
    </div>
  );
};

export default App;
