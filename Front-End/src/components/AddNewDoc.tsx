import React from "react";
import { Tab } from "@headlessui/react";
import { BiChevronDown } from "react-icons/bi";
import { GenderOptions } from "../utils/SelectOptions";
import upload from "../assets/svgs/document-upload.svg";

function AddNewDoc() {
  return (
    <Tab.Panel className="w-[95%] m-auto h-auto flex flex-col bg-[#fff] rounded-[6px] not-italic leading-normal shads">
      <p className="w-full text-center text-[#828282] text-[28px] font-medium"></p>

      <div className="w-11/12 m-auto h-auto pb-1 my-8">
        {/* First row start here */}
        <div className="w-full flex justify-between h-auto my-3">
          <form action="" className="w-[45%] flex flex-col h-auto">
            <label htmlFor="" className="my-1 text-[16px] font-medium">
              Doctor’s Name *
            </label>
            <input
              type="text"
              name=""
              id=""
              placeholder="Enter Doctor's name"
              className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal hover:border-2 hover:border-[#59B7F6] input-shadow text-[#4F4F4F]"
            />
          </form>

          <form action="" className="w-[45%] flex flex-col h-auto">
            <label htmlFor="" className="my-1 text-[16px] font-medium">
              Email Adress *
            </label>
            <input
              type="text"
              name=""
              id=""
              placeholder="Enter Email Address"
              className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal hover:border-2 hover:border-[#59B7F6] input-shadow text-[#4F4F4F]"
            />
          </form>
        </div>
        {/* First row ends here */}

        {/* Second row start here */}
        <div className="w-full flex justify-between h-auto my-3">
          <form action="" className="w-[45%] flex flex-col h-auto">
            <label htmlFor="" className="my-1 text-[16px] font-medium">
              Gender *
            </label>
            <div className="relative text-[#98A2B3]">
              <span
                style={{
                  position: "absolute",
                  top: "25%",
                  right: "15px",
                  minWidth: "16px",
                  pointerEvents: "none",
                }}
              >
                <BiChevronDown size={20} />
              </span>

              <select
                name="State"
                className="w-full bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal pr-10 appearance-none hover:bg-[#F2F2F2] hover:border hover:border-[#D0D5DD]"
              >
                {GenderOptions.map((gender) => (
                  <option
                    value={gender.value}
                    key={gender.id}
                    className="w-full"
                  >
                    {gender.label}
                  </option>
                ))}
              </select>
            </div>
          </form>

          <form action="" className="w-[45%] flex flex-col h-auto">
            <label htmlFor="" className="my-1 text-[16px] font-medium">
              Doctor’s ID *
            </label>
            <input
              type="text"
              name=""
              id=""
              placeholder="Enter Doctor's ID"
              className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal hover:border-2 hover:border-[#59B7F6] input-shadow text-[#4F4F4F]"
            />
          </form>
        </div>
        {/* Second row ends here */}

        <p className="text-[#EB5757] text-[16px] font-semibold w-[40%] m-auto my-2 pt-3">
          Add Image *
        </p>
        <div className="w-[40%] border border-[#D0D5DD] bg-[#fff] h-auto flex justify-center items-center py-10 m-auto mb-5 rounded-[6px] cursor-pointer">
          <img src={upload} alt="" />
          <p className="text-[#98A2B3] text-[14px] font-medium ml-2">
            Click to upload doctor’s image
          </p>
        </div>

        <div className="bg-[#0693F1] w-[30%] py-3 my-3 m-auto rounded-lg text-[#fff] text-center cursor-pointer">
          Add Doctor
        </div>
      </div>
    </Tab.Panel>
  );
}

export default AddNewDoc;
