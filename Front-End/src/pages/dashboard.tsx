import React, { Fragment } from "react";
import DashboardLayout from "../Layouts/DashboardLayout";
import { Tab } from "@headlessui/react";
import Sidebar from "../components/Sidebar";
// import AddDoctors from "../components/NewDocDefault";
import AddNewDoc from "../components/AddNewDoc";
import ManageDoctors from "../components/ManageDoctors";
import ViewPatients from "../components/ViewPatients";

function dashboard() {
  return (
    <DashboardLayout>
      <Tab.Group>
        <Sidebar />
        <Tab.Panels className="w-[78%] flex justify-center">
          {/* <AddDoctors /> */}
          <AddNewDoc />
          <ManageDoctors />
          <ViewPatients />
        </Tab.Panels>
      </Tab.Group>
    </DashboardLayout>
  );
}

export default dashboard;
