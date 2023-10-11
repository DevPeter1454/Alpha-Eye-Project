import React from "react";
import { Tab } from "@headlessui/react";
import addcircle from "../assets/svgs/add-circle.svg";
import add from "../assets/svgs/add.svg";

function NewDocDefault() {
  return (
    <Tab.Panel className="w-3/5 m-auto h-[60vh] flex flex-col bg-[#fff] rounded-[6px] shads">
      <img src={addcircle} alt="" className="m-auto" />
      <p className="text-[#828282] text-[28px] font-semibold text-center my-4">
        Add new Doctor
      </p>
      <p className="w-3/5 m-auto text-[#828282] text-[18px] font-normal text-center">
        Add new doctor, to the portal doctors will be able to perform their
        activity with their login.
      </p>

      <div className="flex w-[346px] py-[16px] px-[64px] justify-center items-center gap-[10px] border border-[#0693F1] rounded-[6px] m-auto my-10 cursor-pointer">
        <img src={add} alt="" />
        <p className="text-[#0693F1] text-[16px] font-semibold">Add Doctor</p>
      </div>
    </Tab.Panel>
  );
}

export default NewDocDefault;
