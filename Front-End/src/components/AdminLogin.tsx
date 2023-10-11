import React from "react";
import AuthLayout from "../Layouts/AuthLayout";
import logo from "../assets/svgs/logo.svg";

function AdminLogin() {
  return (
    <AuthLayout>
      <div className="w-4/5 m-auto bg-[#fff] shad rounded-[16px] not-italic leading-normal pb-5">
        <div className="pt-2 mt-10 pl-3">
          <img src={logo} alt="laploy" className="my-5" />
        </div>

        <p className="text-[#4F4F4F] w-full text-center text-[36px] font-bold">
          Welcome to Alpha-Eye!
        </p>
        <p className="w-full text-center text-[#828282] text-[24px] font-medium my-3">
          Login your account
        </p>

        <form action="" className="w-4/5 m-auto flex flex-col">
          <label
            htmlFor=""
            className="text-[#4F4F4F] text-[16px] font-semibold my-1"
          >
            Email Address *
          </label>
          <input
            type="text"
            placeholder="Enter Email Address"
            className="w-full h-12 border border-[#D0D5DD] bg-[#fff] outline-none pl-3 text-[#98A2B3] text-[14px] font-normal rounded-[6px] hover:text-[#4F4F4F]"
          />

          <label
            htmlFor=""
            className="text-[#4F4F4F] text-[16px] font-semibold mt-8 mb-1"
          >
            Password *
          </label>
          <input
            type="password"
            placeholder="Enter Password"
            className="w-full h-12 border border-[#D0D5DD] bg-[#fff] outline-none pl-3 text-[#98A2B3] text-[14px] font-normal rounded-[6px] hover:text-[#4F4F4F]"
          />
        </form>

        <div className="bg-[#0693F1] w-[30%] py-3 my-8 m-auto rounded-lg text-[#fff] text-center cursor-pointer">
          Login
        </div>
      </div>
    </AuthLayout>
  );
}

export default AdminLogin;
