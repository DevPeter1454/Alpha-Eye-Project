import React from "react";
import AdminHeader from "../components/AdminHeader";

const DashboardLayout = ({ children }) => {
  return (
    <div className="w-full h-screen px-12 py-5 not-italic leading-normal">
      <div className="flex flex-col lg:hidden mt-6 px-4 justify-center h-screen text-center">
        <h1 className="font-bold text-base text-center mb-2">
          Sorry, this page is not optimized for mobile devices.
        </h1>
        <p className="text-neutral-700 text-sm">
          Please try viewing it on a larger screen, such as a laptop or desktop
          computer, for a better experience.
        </p>
        <p className="text-neutral-700 text-sm">
          Thank you for your understanding. 😊
        </p>
      </div>

      <AdminHeader />

      <div className="w-full md:flex justify-between mt-8 h-[78svh] hidden">
        {children}
      </div>
    </div>
  );
};

export default DashboardLayout;
