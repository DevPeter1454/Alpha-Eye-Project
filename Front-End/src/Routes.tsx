import React from "react";
import { BrowserRouter, Route, Routes, Navigate } from "react-router-dom";
import AdminSignup from "./pages/AdminSignupRoute";
import AdminLogin from "./pages/AdminLoginRoute";
import Dash from "./pages/dashboard";

const AppRoutes = () => {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Navigate to="/sign-up" replace />} />
        <Route path="/sign-up" element={<AdminSignup />} />
        <Route path="/login" element={<AdminLogin />} />
        <Route path="/dashboard" element={<Dash />} />
      </Routes>
    </BrowserRouter>
  );
};

export default AppRoutes;
