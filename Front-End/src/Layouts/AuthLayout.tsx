import React from "react";
import logo from "../assets/svgs/logo.svg";

const styles = {
  parentContainer: "bg-[#FDFDFD] w-full h-auto",
  container: "w-10/12 m-auto h-auto bg-[#fff] 2xl:container 2xl:mx-auto h-auto",
  chiefCenter: "w-full h-auto",
};

const LoginContainer = ({ children }: any) => {
  return (
    <div className={styles.parentContainer}>
      <div className={styles.container}>
        <div className="">
          {/* <img src={logo} alt="laploy" className="w-auto h-auto mt-[30px]" /> */}
        </div>
        <div className={styles.chiefCenter}>
          {/* <img src={logo} alt="laploy" className="w-auto h-auto mt-[30px]" /> */}
          {children}
        </div>
      </div>
    </div>
  );
};

export default LoginContainer;
