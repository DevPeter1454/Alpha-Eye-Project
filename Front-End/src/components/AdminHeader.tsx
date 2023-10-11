import React from "react";
import logo from "../assets/svgs/logo.svg";
import logout from "../assets/svgs/logout.svg";
import image6 from "../assets/svgs/image-6.svg";

function AdminHeader() {
  return (
    <div className="bg-[#fff] w-full hidden md:flex md:justify-between">
      <div className="flex items-center w-4/12 justify-between">
        <img src={logo} alt="" />

        <div className="">
          <p className="text-[16px] font-semibold text-[#828282]">
            Good Evening!
          </p>
          <p className="text-[24px] font-medium text-[#4F4F4F]">Hello Admin</p>
        </div>
      </div>

      <div className="w-3/12 flex items-center justify-between">
        <div className="w-[186px] py-[16px] px-[64px] flex items-center justify-center gap-[10px] border border-[#0693F1] rounded-[8px] cursor-pointer">
          <img src={logout} alt="" />
          <p className="text-[#0693F1] text-[16px] font-semibold">Logout</p>
        </div>

        <img src={image6} alt="" />
      </div>
    </div>
  );
}

export default AdminHeader;
