import React, { Fragment } from "react";
import { Tab } from "@headlessui/react";

function Sidebar() {
  return (
    <Tab.List className="w-[21%] flex flex-col bg-[#0693F1] rounded-xl">
      <p className="w-full text-[#fff] text-[28px] font-medium my-10 pl-10">
        Dashboard
      </p>

      <div className="">
        <Tab as={Fragment}>
          {({ selected }) => (
            <div
              className={
                selected
                  ? "pl-10 py-3 my-1 bg-[#fff] text-[#0693F1] cursor-pointer outline-none w-4/5 m-auto rounded-lg flex"
                  : "pl-10 py-3 my-1 cursor-pointer w-4/5 m-auto text-[#fff] flex"
              }
            >
              {selected ? (
                <span className="text-[#0693F1]">
                  <svg
                    width="25"
                    height="25"
                    viewBox="0 0 25 24"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      d="M6.5 12H18.5"
                      stroke="#0693F1" // Change the stroke color when selected
                      stroke-width="1.5"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                    />
                    <path
                      d="M12.5 18V6"
                      stroke="#0693F1" // Change the stroke color when selected
                      stroke-width="1.5"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                    />
                  </svg>
                </span>
              ) : (
                <span className="text-[#fff]">
                  <svg
                    width="25"
                    height="25"
                    viewBox="0 0 25 24"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      d="M6.5 12H18.5"
                      stroke="#fff" // Change the stroke color when not selected
                      stroke-width="1.5"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                    />
                    <path
                      d="M12.5 18V6"
                      stroke="#fff" // Change the stroke color when not selected
                      stroke-width="1.5"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                    />
                  </svg>
                </span>
              )}
              <p className="ml-3">Add Doctor</p>
            </div>
          )}
        </Tab>

        <Tab as={Fragment}>
          {({ selected }) => (
            <div
              className={
                selected
                  ? "pl-10 py-3 my-5 bg-[#fff] text-[#0693F1] cursor-pointer outline-none w-4/5 m-auto rounded-lg flex"
                  : "pl-10 py-3 my-5 cursor-pointer w-4/5 m-auto text-[#fff] flex"
              }
            >
              {selected ? (
                <span className="text-[#0693F1]">
                  <svg
                    width="25"
                    height="24"
                    viewBox="0 0 25 24"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      d="M0 1.5H24V22.5H0V1.5ZM22.5 3H1.5V6H22.5V3ZM1.5 21H22.5V7.5H1.5V21ZM3 13.5V9H7.5V13.5H3ZM4.5 10.5V12H6V10.5H4.5ZM3 19.5V15H7.5V19.5H3ZM4.5 16.5V18H6V16.5H4.5ZM10.5 12V10.5H19.5V12H10.5ZM10.5 18V16.5H19.5V18H10.5Z"
                      fill="#0693F1"
                    />
                  </svg>
                </span>
              ) : (
                <span className="text-[#fff]">
                  <svg
                    width="25"
                    height="24"
                    viewBox="0 0 25 24"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      d="M0 1.5H24V22.5H0V1.5ZM22.5 3H1.5V6H22.5V3ZM1.5 21H22.5V7.5H1.5V21ZM3 13.5V9H7.5V13.5H3ZM4.5 10.5V12H6V10.5H4.5ZM3 19.5V15H7.5V19.5H3ZM4.5 16.5V18H6V16.5H4.5ZM10.5 12V10.5H19.5V12H10.5ZM10.5 18V16.5H19.5V18H10.5Z"
                      fill="white"
                    />
                  </svg>
                </span>
              )}
              <p className="ml-3">Manage Doctor</p>
            </div>
          )}
        </Tab>

        <Tab as={Fragment}>
          {({ selected }) => (
            <div
              className={
                selected
                  ? "pl-10 py-3 my-1 bg-[#fff] text-[#0693F1] cursor-pointer outline-none w-4/5 m-auto rounded-lg flex"
                  : "pl-10 py-3 my-1 cursor-pointer w-4/5 m-auto text-[#fff] flex"
              }
            >
              {selected ? (
                <span className="text-[#0693F1]">
                  <svg
                    width="25"
                    height="24"
                    viewBox="0 0 25 24"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      d="M16.4211 13.5263C15.3684 13.5263 14.4737 13.1579 13.7368 12.4211C13 11.6842 12.6316 10.7895 12.6316 9.73685C12.6316 8.68422 13 7.78948 13.7368 7.05264C14.4737 6.3158 15.3684 5.94738 16.4211 5.94738C17.4737 5.94738 18.3684 6.3158 19.1053 7.05264C19.8421 7.78948 20.2105 8.68422 20.2105 9.73685C20.2105 10.7895 19.8421 11.6842 19.1053 12.4211C18.3684 13.1579 17.4737 13.5263 16.4211 13.5263ZM8.8421 21.1053V18.7053C8.8421 18.2632 8.94737 17.8421 9.15789 17.4421C9.36842 17.0421 9.66316 16.7263 10.0421 16.4947C10.9895 15.9263 11.9949 15.5002 13.0585 15.2164C14.1221 14.9326 15.2429 14.7903 16.4211 14.7895C17.6 14.7895 18.7213 14.9318 19.7848 15.2164C20.8484 15.5011 21.8535 15.9272 22.8 16.4947C23.1789 16.7263 23.4737 17.0421 23.6842 17.4421C23.8947 17.8421 24 18.2632 24 18.7053V21.1053H8.8421ZM0 13.5263V11H10.1053V13.5263H0ZM0 3.42106V0.894745H15.1579V3.42106H0ZM10.2316 8.47369H0V5.94738H11.3684C11.0737 6.30527 10.8366 6.69475 10.6573 7.1158C10.4779 7.53685 10.336 7.98948 10.2316 8.47369Z"
                      fill="#0693F1"
                    />
                  </svg>
                </span>
              ) : (
                <span className="text-[#fff]">
                  <svg
                    width="25"
                    height="24"
                    viewBox="0 0 25 24"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      d="M16.4211 13.5263C15.3684 13.5263 14.4737 13.1579 13.7368 12.4211C13 11.6842 12.6316 10.7895 12.6316 9.73685C12.6316 8.68422 13 7.78948 13.7368 7.05264C14.4737 6.3158 15.3684 5.94738 16.4211 5.94738C17.4737 5.94738 18.3684 6.3158 19.1053 7.05264C19.8421 7.78948 20.2105 8.68422 20.2105 9.73685C20.2105 10.7895 19.8421 11.6842 19.1053 12.4211C18.3684 13.1579 17.4737 13.5263 16.4211 13.5263ZM8.8421 21.1053V18.7053C8.8421 18.2632 8.94737 17.8421 9.15789 17.4421C9.36842 17.0421 9.66316 16.7263 10.0421 16.4947C10.9895 15.9263 11.9949 15.5002 13.0585 15.2164C14.1221 14.9326 15.2429 14.7903 16.4211 14.7895C17.6 14.7895 18.7213 14.9318 19.7848 15.2164C20.8484 15.5011 21.8535 15.9272 22.8 16.4947C23.1789 16.7263 23.4737 17.0421 23.6842 17.4421C23.8947 17.8421 24 18.2632 24 18.7053V21.1053H8.8421ZM0 13.5263V11H10.1053V13.5263H0ZM0 3.42106V0.894745H15.1579V3.42106H0ZM10.2316 8.47369H0V5.94738H11.3684C11.0737 6.30527 10.8366 6.69475 10.6573 7.1158C10.4779 7.53685 10.336 7.98948 10.2316 8.47369Z"
                      fill="white"
                    />
                  </svg>
                </span>
              )}
              <p className="ml-3">View Patients</p>
            </div>
          )}
        </Tab>
      </div>
    </Tab.List>
  );
}

export default Sidebar;
