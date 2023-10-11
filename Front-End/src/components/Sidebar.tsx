import React from "react";
import { useNavigate } from "react-router-dom";
// import logo from "../../assets/svgs/v-logo.svg";
// import {
//   PaymentIcon,
//   InvoicingIcon,
//   ExpenseIcon,
//   AnalyticsIcon,
//   AccountIcon,
//   HomeIcon,
// } from "../../assets/svgs";
const styles = {
  active:
    "bg-[#EAF2FD] h-[42px] py-3 px-5 gap-[10px] flex items-center text-primary text-sm cursor-pointer",
  inactive:
    "flex items-center hover:bg-[#EAF2FD] py-3 px-5 gap-[10px] text-sm text-[#818181] rounded-l-[5px] cursor-pointer",
};

const Sidebar = ({ current }: { current: number }) => {
  const navigate = useNavigate();
  return (
    <div className="w-full bg-red-300 h-full">
      <div className="w-full flex justify-center mb-10">
        {/* <img alt="logo" src={logo}  /> */}
      </div>
      <div className="flex flex-col pl-4">
        <p className="text-[#082431] text-xs opacity-50 my-6 pl-6">DASHBOARD</p>
        <div className="flex flex-col space-y-1">
          {/* start of a single item */}
          <div
            className={current === 1 ? styles.active : styles.inactive}
            onClick={() => navigate("/dashboard")}
          >
            {/* <HomeIcon /> */}
            <p>Add Doctors</p>
          </div>
          {/* end of a single link item */}
          {/* start of a single item */}
          <div
            className={current === 2 ? styles.active : styles.inactive}
            onClick={() => navigate("/dashboard")}
          >
            {/* <PaymentIcon /> */}
            <p>Manage Doctors</p>
          </div>
          {/* end of a single link item */}
          {/* start of a single item */}
          <div
            className={current === 3 ? styles.active : styles.inactive}
            onClick={() => navigate("/dashboard")}
          >
            {/* <InvoicingIcon /> */}
            <p>View Patients</p>
          </div>
          {/* end of a single link item */}
        </div>
      </div>
    </div>
  );
};

export default Sidebar;
