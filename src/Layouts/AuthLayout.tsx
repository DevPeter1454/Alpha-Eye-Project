import React from "react";

const styles = {
  parentContainer: "bg-[#FDFDFD] w-full h-auto",
  childContainer:
    "w-10/12 m-auto h-auto bg-[#fff] 2xl:container 2xl:mx-auto h-auto",
};

const LoginContainer = ({ children }: any) => {
  return (
    <div className={styles.parentContainer}>
      <div className={styles.childContainer}>{children}</div>
    </div>
  );
};

export default LoginContainer;
