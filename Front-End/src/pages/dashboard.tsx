import React, { useState } from "react";
import DashboardLayout from "../Layouts/DashboardLayout";
import { Tab } from "@headlessui/react";
import Sidebar from "../components/Sidebar";
import NewDocDefault from "../components/NewDocDefault";
import AddNewDoc from "../components/AddNewDoc";
import ManageDoctors from "../components/ManageDoctors";
import ViewPatients from "../components/ViewPatients";

function Dashboard() {
  const [showAddNewDoc, setShowAddNewDoc] = useState(false);

  const handleShowAddNewDocComponent = () => {
    setShowAddNewDoc(true);
  };

  const handleCloseAddNewDocComponent = () => {
    setShowAddNewDoc(false);
  };

  return (
    <DashboardLayout>
      <Tab.Group>
        <Sidebar />
        <Tab.Panels className="w-[78%] flex justify-center">
          {showAddNewDoc ? (
            <AddNewDoc handleCloseComponent={handleCloseAddNewDocComponent} />
          ) : (
            <NewDocDefault
              handleShowAddNewDocComponent={handleShowAddNewDocComponent}
            />
          )}
          <ManageDoctors />
          <ViewPatients />
        </Tab.Panels>
      </Tab.Group>
    </DashboardLayout>
  );
}

export default Dashboard;
