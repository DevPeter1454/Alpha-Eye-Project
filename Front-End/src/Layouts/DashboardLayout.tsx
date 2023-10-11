import React from "react";
import Sidebar from "../components/Sidebar";

const DashboardLayout = ({ children, current }: any) => {
  return (
    <div className="w-full flex flex-col bg-white">
      <div className="flex flex-col lg:hidden mt-6 px-4 justify-center h-screen">
        <h1 className="font-bold text-customBlack text-base text-center mb-2 ">
          Sorry, this page is not optimized for mobile devices.
        </h1>
        <p className="text-neutral-700 text-sm  ">
          Please try viewing it on a larger screen, such as a laptop or desktop
          computer, for a better experience.
        </p>
        <p className="text-neutral-700 text-sm  ">
          Thank you for your understanding. 😊
        </p>
      </div>
      <div className="w-full h-screen bg-[#fff] md:flex md:flex-col hidden">
        <div className="w-full bg-red-800 py-5">HeadNav</div>
        <div className="md:flex w-full h-[100svh]">
          <div className="bg-red-300 w-3/12">
            <Sidebar current={current} />
          </div>

          <div className="w-9/12 bg-slate-500">{children}</div>
        </div>
      </div>
    </div>
  );
};

export default DashboardLayout;
