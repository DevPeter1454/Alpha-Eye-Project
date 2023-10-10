import React from "react";
import { BiChevronDown } from "react-icons/bi";
import AuthContainer from "../Layouts/AuthLayout";
import logo from "../assets/svgs/logo.svg";
import { StatesOptions, LGAOptions } from "../utils/SelectOptions";

function AdminSignup() {
  return (
    <AuthContainer>
      <div className="w-full m-auto h-auto bg-[#fff] not-italic leading-normal rounded-lg shad">
        <div className="pt-2 mt-5 pl-3">
          <img src={logo} alt="laploy" className="my-5" />
        </div>
        <p className="text-[#4F4F4F] w-full text-center text-[36px] font-bold">
          Welcome to Alpha-Eye!
        </p>
        <p className="w-full text-center text-[#828282] text-[24px] font-medium">
          Register your account
        </p>

        <div className="w-11/12 m-auto h-auto pb-1 my-8">
          {/* First row start here */}
          <div className="w-full flex justify-between h-auto my-3">
            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-medium">
                Hospital name *
              </label>
              <input
                type="text"
                name=""
                id=""
                placeholder="Enter Hospital name"
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal hover:border-2 hover:border-[#59B7F6] input-shadow text-[#4F4F4F]"
              />
            </form>

            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-medium">
                Nigeria Health Facility Registry (HFR) UID *
              </label>
              <input
                type="text"
                name=""
                id=""
                placeholder="Enter UID here"
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal hover:border-2 hover:border-[#59B7F6] input-shadow text-[#4F4F4F]"
              />
            </form>
          </div>
          {/* First row ends here */}

          {/* Second row start here */}
          <div className="w-full flex justify-between h-auto my-3">
            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-medium">
                Address *
              </label>
              <input
                type="text"
                name=""
                id=""
                placeholder="Enter address"
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal hover:border-2 hover:border-[#59B7F6] input-shadow text-[#4F4F4F]"
              />
            </form>

            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-medium">
                State *
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
                  {StatesOptions.map((state) => (
                    <option
                      value={state.value}
                      key={state.id}
                      className="w-full"
                    >
                      {state.label}
                    </option>
                  ))}
                </select>
              </div>
            </form>
          </div>
          {/* Second row ends here */}

          {/* Third row start here */}
          <div className="w-full flex justify-between h-auto my-3">
            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-medium">
                City *
              </label>
              <input
                type="text"
                name=""
                id=""
                placeholder="Enter Hospital name"
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal hover:border-2 hover:border-[#59B7F6] input-shadow text-[#4F4F4F]"
              />
            </form>

            <form action="" className="w-[45%] flex flex-col h-auto relative">
              <label htmlFor="" className="my-1 text-[16px] font-medium">
                Local Government *
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
                  name="region"
                  className="w-full bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal pr-10 appearance-none hover:bg-[#F2F2F2] hover:border hover:border-[#D0D5DD]"
                >
                  {LGAOptions.map((lga) => (
                    <option value={lga.value} key={lga.id} className="w-full">
                      {lga.label}
                    </option>
                  ))}
                </select>
              </div>
            </form>
          </div>
          {/* Third row ends here */}

          {/* Fourth row start here */}
          <div className="w-full flex justify-between h-auto my-3">
            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-medium">
                Email Address *
              </label>
              <input
                type="text"
                name=""
                id=""
                placeholder="Enter Email Address"
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal hover:border-2 hover:border-[#59B7F6] input-shadow text-[#4F4F4F]"
              />
            </form>

            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-medium">
                Phone Number *
              </label>
              <input
                type="text"
                name=""
                id=""
                placeholder="Enter Phone Number"
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal hover:border-2 hover:border-[#59B7F6] input-shadow text-[#4F4F4F]"
              />
            </form>
          </div>
          {/* Fourth row ends here */}

          {/* Fifth row ends here */}
          <div className="w-full flex justify-between h-auto my-3">
            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-medium">
                Set Password *
              </label>
              <input
                type="text"
                name=""
                id=""
                placeholder="Enter Password"
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal hover:border-2 hover:border-[#59B7F6] input-shadow text-[#4F4F4F]"
              />
            </form>

            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-medium">
                Set Password *
              </label>
              <input
                type="text"
                name=""
                id=""
                placeholder="Enter Password Again"
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal hover:border-2 hover:border-[#59B7F6] input-shadow text-[#4F4F4F]"
              />
            </form>
          </div>
          {/* Fifth row ends here */}

          <div className="bg-[#0693F1] w-[30%] py-3 my-8 m-auto rounded-lg text-[#fff] text-center cursor-pointer">
            Create Account
          </div>
        </div>
      </div>
    </AuthContainer>
  );
}

export default AdminSignup;
