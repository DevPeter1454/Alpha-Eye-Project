type SelectOptions = {
  id: number;
  label: string;
  value: string;
};

export const StatesOptions: SelectOptions[] = [
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

export const LGAOptions: SelectOptions[] = [
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

export const GenderOptions: SelectOptions[] = [
  {
    id: 1,
    label: "Select Your Gender",
    value: "select your gender",
  },
  {
    id: 2,
    label: "Male",
    value: "male",
  },
  {
    id: 2,
    label: "Female",
    value: "female",
  },
];
