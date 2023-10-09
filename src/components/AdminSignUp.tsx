import React from "react";
import AuthContainer from "../Layouts/AuthLayout";

function AdminLogin() {
  return (
    <AuthContainer>
      <div className="w-full h-auto bg-[#fff] not-italic leading-normal rounded-lg shadow-2xl">
        <p className="text-[#4F4F4F] w-full text-center text-[36px] font-bold my-5">
          Welcome to Alpha-Eye!
        </p>
        <p className="w-full text-center text-[#828282] text-[24px] font-medium">
          Register your account
        </p>

        <div className="w-[95%] m-auto h-auto pb-1 my-8">
          {/* First row start here */}
          <div className="w-full flex justify-between h-auto my-3">
            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-semibold">
                Hospital name *
              </label>
              <input
                type="text"
                name=""
                id=""
                placeholder="Enter Hospital name"
                className="bg-[#fff] border border-[#D0D5DD] rounded-lg pl-3 h-10 outline-none text-[14px] font-normal"
              />
            </form>

            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-semibold">
                Nigeria Health Facility Registry (HFR) UID *
              </label>
              <input
                type="text"
                name=""
                id=""
                placeholder="Enter UID here"
                className="bg-[#fff] border border-[#D0D5DD] rounded-lg pl-3 h-10 outline-none text-[14px] font-normal"
              />
            </form>
          </div>
          {/* First row ends here */}

          {/* Second row start here */}
          <div className="w-full flex justify-between h-auto my-3">
            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-semibold">
                Address *
              </label>
              <input
                type="text"
                name=""
                id=""
                placeholder="Enter address"
                className="bg-[#fff] border border-[#D0D5DD] rounded-lg pl-3 h-10 outline-none text-[14px] font-normal"
              />
            </form>

            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-semibold">
                State *
              </label>
              {/* <input */}
              <select
                // type="text"
                name=""
                id=""
                placeholder="Select your date"
                className="bg-[#fff] border border-[#D0D5DD] rounded-lg pl-3 h-10 outline-none text-[14px] font-normal"
              />
            </form>
          </div>
          {/* Second row ends here */}

          {/* third row start here */}
          <div className="w-full flex justify-between h-auto my-3">
            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-semibold">
                City *
              </label>
              <input
                type="text"
                name=""
                id=""
                placeholder="Enter Hospital name"
                className="bg-[#fff] border border-[#D0D5DD] rounded-lg pl-3 h-10 outline-none text-[14px] font-normal"
              />
            </form>

            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-semibold">
                Local Government *
              </label>
              {/* <input */}
              <select
                // type="text"
                name=""
                id=""
                placeholder="Select Local government"
                className="bg-[#fff] border border-[#D0D5DD] rounded-lg pl-3 h-10 outline-none text-[14px] font-normal"
              />
            </form>
          </div>
          {/* third row ends here */}

          {/* forth row start here */}
          <div className="w-full flex justify-between h-auto my-3">
            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-semibold">
                Email Address *
              </label>
              <input
                type="text"
                name=""
                id=""
                placeholder="Enter Email Address"
                className="bg-[#fff] border border-[#D0D5DD] rounded-lg pl-3 h-10 outline-none text-[14px] font-normal"
              />
            </form>

            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-semibold">
                Phone Number *
              </label>
              <input
                type="text"
                name=""
                id=""
                placeholder="Enter Phone Number"
                className="bg-[#fff] border border-[#D0D5DD] rounded-lg pl-3 h-10 outline-none text-[14px] font-normal"
              />
            </form>
          </div>
          {/* forth row ends here */}

          {/* fifth row ends here */}
          <div className="w-full flex justify-between h-auto my-3">
            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-semibold">
                Set Password *
              </label>
              <input
                type="text"
                name=""
                id=""
                placeholder="Enter Password"
                className="bg-[#fff] border border-[#D0D5DD] rounded-lg pl-3 h-10 outline-none text-[14px] font-normal"
              />
            </form>

            <form action="" className="w-[45%] flex flex-col h-auto">
              <label htmlFor="" className="my-1 text-[16px] font-semibold">
                Set Password *
              </label>
              <input
                type="text"
                name=""
                id=""
                placeholder="Enter Password Again"
                className="bg-[#fff] border border-[#D0D5DD] rounded-lg pl-3 h-10 outline-none text-[14px] font-normal"
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
