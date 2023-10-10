import React from "react";
import AuthContainer from "../Layouts/AuthLayout";
import logo from "../assets/svgs/logo.svg";

const States = [
  {
    id: 1,
    label: "Select your date",
    value: "select your date",
  },
  {
    id: 2,
    label: "No date for now",
    value: "no date for now",
  },
];

const LGA = [
  {
    id: 1,
    label: "Select Local government",
    value: "select Local government",
  },
  {
    id: 2,
    label: "No local government for now",
    value: "no local government for now",
  },
];

function AdminLogin() {
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
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal"
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
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal"
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
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal"
              />
            </form>

            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-medium">
                State *
              </label>
              {/* <input */}
              {/* <select
                // type="text"
                name=""
                id=""
                placeholder="Select your date"
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal"
              /> */}

              <select
                name="region"
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal text-[#98A2B3] pr-10"
              >
                {States.map((state, id) => (
                  <option value={state.value} key={id} className="w-full">
                    {state.label}
                  </option>
                ))}
              </select>
            </form>
          </div>
          {/* Second row ends here */}

          {/* third row start here */}
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
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal"
              />
            </form>

            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-medium">
                Local Government *
              </label>
              {/* <input */}
              {/* <select
                // type="text"
                name=""
                id=""
                placeholder="Select Local government"
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal"
              /> */}

              <select
                name="region"
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal text-[#98A2B3] pr-10"
              >
                {LGA.map((lga, id) => (
                  <option value={lga.value} key={id} className="w-full">
                    {lga.label}
                  </option>
                ))}
              </select>
            </form>
          </div>
          {/* third row ends here */}

          {/* forth row start here */}
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
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal"
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
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal"
              />
            </form>
          </div>
          {/* forth row ends here */}

          {/* fifth row ends here */}
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
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal"
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
                className="bg-[#fff] border border-[#D0D5DD] rounded-[6px] pl-3 h-10 outline-none text-[14px] font-normal"
              />
            </form>
          </div>
          {/* fifth row ends here */}

          <div className="bg-[#0693F1] w-[30%] py-3 my-5 m-auto rounded-lg text-[#fff] text-center">
            Create Account
          </div>
        </div>
      </div>
    </AuthContainer>
  );
}

export default AdminLogin;
