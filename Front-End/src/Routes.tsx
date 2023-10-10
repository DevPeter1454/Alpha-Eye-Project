import React from "react";
import { BrowserRouter, Route, Routes, Navigate } from "react-router-dom";
import AdminSignup from "./pages/AdminSignupRoute";
import AdminLogin from "./pages/AdminLoginRoute";

const AppRoutes = () => {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Navigate to="/sign-up" replace />} />
        <Route path="/sign-up" element={<AdminSignup />} />
        <Route path="/login" element={<AdminLogin />} />
      </Routes>
    </BrowserRouter>
  );
};

export default AppRoutes;
