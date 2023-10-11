import React from "react";
import DashboardLayout from "../Layouts/DashboardLayout";
import AddDoctor from "../components/AddDoctors";
import ManageDoctors from "../components/ManageDoctors";
import ViewPatients from "../components/ViewPatients";

interface dashboard {
  children?: any;
  current: number;
}

function dashboard({ children, current }: dashboard) {
  return (
    <DashboardLayout>
      {current === 1 ? <AddDoctor /> : <h1>Empty</h1>}
      {current === 2 ? <ManageDoctors /> : <h1>Empty</h1>}
      {current === 3 ? <ViewPatients /> : <h1>Empty</h1>}
    </DashboardLayout>
  );
}

export default dashboard;
