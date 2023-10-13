import React, { useState, useRef } from "react";
import { Tab } from "@headlessui/react";
import { BiChevronDown } from "react-icons/bi";
import { GenderOptions } from "../utils/SelectOptions";
import upload from "../assets/svgs/document-upload.svg";
import group7 from "../assets/svgs/Group7.svg";

interface AddNewDocProps {
  handleCloseComponent: () => void;
}

function AddNewDoc({ handleCloseComponent }: AddNewDocProps) {
  const [selectedImage, setSelectedImage] = useState<string | null>(null);
  const fileInputRef = useRef<HTMLInputElement | null>(null);
  const [showOverlay, setShowOverlay] = useState(false);

  const handleImageUpload = (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files && event.target.files[0];
    if (file) {
      // Do something with the selected image (e.g., upload it to a server).
      // For now, we'll just update the state to display the image.
      setSelectedImage(URL.createObjectURL(file));
    }
  };

  const handleAddDoctorClick = () => {
    setShowOverlay(true);
  };

  return (
    <Tab.Panel className="w-[95%] m-auto h-auto flex flex-col bg-[#fff] rounded-[6px] not-italic leading-normal shads">
      <p className="w-full text-center text-[#828282] text-[28px] font-medium"></p>
      <div
        className={`w-11/12 m-auto h-auto pb-1 my-8 ${
          showOverlay ? "opacity-40" : "opacity-100"
        }`}
      >
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

        <label
          htmlFor="imageUpload"
          className="w-[40%] border border-[#D0D5DD] bg-[#fff] h-[100px] flex justify-center items-center m-auto mb-5 rounded-[6px] cursor-pointer"
        >
          {selectedImage ? (
            <img
              src={selectedImage}
              alt="Selected"
              style={{ maxWidth: "40%", height: "100px" }}
            />
          ) : (
            <>
              <img src={upload} alt="" />
              <p className="text-[#98A2B3] text-[14px] font-medium ml-2">
                Click to upload doctor’s image
              </p>
            </>
          )}
        </label>

        <input
          type="file"
          id="imageUpload"
          accept="image/*"
          style={{ display: "none" }}
          onChange={handleImageUpload}
          ref={fileInputRef}
        />

        <div
          className={`bg-[#0693F1] w-[30%] py-3 my-3 m-auto rounded-lg text-[#fff] text-center cursor-pointer ${
            showOverlay ? "overlay" : ""
          }`}
          onClick={handleAddDoctorClick}
        >
          Add Doctor
        </div>
      </div>
      <div
        className={`w-2/4 h-80 m-auto rounded-[6px] bg-[#fff] overshad ${
          showOverlay ? "absolute top-[28%] left-[35%]" : "hidden"
        }`}
      >
        <img src={group7} alt="" className="m-auto my-5" />
        <p className="text-center text-[#4F4F4F] text-[28px] font-semibold">
          Doctor Added
        </p>
        <p className="text-center text-[#828282] text-[18px] font-normal my-5 w-2/4 m-auto">
          Login credentials have been sent to the doctor's Email address
        </p>
        <div
          className={`bg-[#0693F1] w-[30%] py-3 my-3 m-auto rounded-lg text-[#fff] text-center cursor-pointer ${
            showOverlay ? "overlay" : ""
          }`}
          onClick={handleCloseComponent}
        >
          Close
        </div>
      </div>
    </Tab.Panel>
  );
}

export default AddNewDoc;
