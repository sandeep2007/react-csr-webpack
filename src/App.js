import React from "react";
import { BrowserRouter, Link, Route, Routes } from "react-router-dom";
const App = () => {
  return (
    <BrowserRouter
      future={{
        v7_startTransition: true,
        v7_relativeSplatPath: true,
      }}
    >
      <Routes>
        <Route
          path="/"
          element={
            <>
              <h1>Home</h1>
              <Link to="/about">About</Link>
            </>
          }
        />
        <Route
          path="/about"
          element={
            <>
              <h1>About</h1>
              <Link to="/">Home</Link>
            </>
          }
        />
      </Routes>
    </BrowserRouter>
  );
};

export default App;
