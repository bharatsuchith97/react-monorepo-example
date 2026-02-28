import React from "react";
import { Button } from "@example/ui";

export const App: React.FC = () => {
  return (
    <div
      style={{
        minHeight: "100vh",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        flexDirection: "column",
        gap: "1rem",
        fontFamily: "system-ui, -apple-system, BlinkMacSystemFont, sans-serif"
      }}
    >
      <h1>React Monorepo Example</h1>
      <p>Below is the Button component coming from the ui library:</p>
      <Button onClick={() => alert("Button from @example/ui clicked!")}>
        Click me
      </Button>
    </div>
  );
};

