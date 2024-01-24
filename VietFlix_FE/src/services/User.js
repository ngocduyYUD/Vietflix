import axios from "./CustomizeAxios";

const getUserInfo = (message) => {
  const api = "members/viewMemberInfo/" + message;
  return axios.get(api);
};
const getUserLogin = (email, pass) => {
  const api = "members/login/" + email + "-" + pass;
  return axios.get(api);
};

const getUserPass = (member_id) => {
  const api = "members/getMemberPass/" + member_id;
  return axios.get(api);
};

const setUserInfo = (info) => {
  console.log(info);
  const api = "members/changeInfo";
  return axios.post(api, info);
};

const isLoggedIn = () => {
  return localStorage.getItem("isLogin") === "true";
};

//Package

const getListPackage = () => {
  return axios.get("package/viewAllPackage");
};

const payPackage = (paymentInfo) => {
  const api = "package/pay";
  return axios.post(api, paymentInfo);
};

const checkBoughtPackage = (member_id) => {
  const api = `members/checkBoughtPackage/${member_id}`;
  return axios.get(api);
};

export {
  getUserInfo,
  getUserLogin,
  getUserPass,
  setUserInfo,
  getListPackage,
  payPackage,
  checkBoughtPackage,
  isLoggedIn,
};
