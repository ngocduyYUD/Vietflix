import { createContext, useState } from "react";

const initialAppContext = {
  valueQuery: "",
  setValueQuery: () => null,
};

export const AppContext = createContext(initialAppContext);

// eslint-disable-next-line react/prop-types
export const AppProvider = ({ children }) => {
  const [valueQuery, setValueQuery] = useState(initialAppContext.valueQuery);

  return (
    <AppContext.Provider value={{ valueQuery, setValueQuery }}>
      {children}
    </AppContext.Provider>
  );
};
