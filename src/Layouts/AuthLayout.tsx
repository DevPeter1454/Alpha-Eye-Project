import React from "react";
import logo from "../assets/svgs/logo.svg";

const styles = {
  parentContainer: "w-11/12 md:w-[70%] h-auto m-auto",
  container: "2xl:container 2xl:mx-auto h-auto",
  chiefCenter: "max-w-[1500px] w-full mx-auto h-auto",
};

const LoginContainer = ({ children }: any) => {
  return (
    <div className={styles.parentContainer}>
      <div className={styles.container}>
        <div className="lg">
          <img src={logo} alt="laploy" className="w-auto h-auto mt-[30px]" />
        </div>
        <div className={styles.chiefCenter}>{children}</div>
      </div>
    </div>
  );
};

export default LoginContainer;
