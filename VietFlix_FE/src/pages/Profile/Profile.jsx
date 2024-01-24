import { useEffect, useState } from "react";
import { FaUserCircle } from "react-icons/fa";

import {
  getUserInfo,
  getUserPass,
  setUserInfo,
  getListPackage,
  payPackage,
} from "../../services/User";
import { notification } from "antd";

const Profile = () => {
  const userID = localStorage.getItem("member_id");
  const [user, setUser] = useState("");
  // const [userName, setUserName] = useState("");
  // const [userNewPass, setNewPass] = useState("");
  const [userOldPass, setOldPass] = useState("");
  const [userConfPass, setConfPass] = useState("");

  const [active, setActive] = useState(false);
  const [inputOld, setInputOld] = useState(false);

  const [isEdit, setIsEdit] = useState(false);

  const [info, setInfo] = useState({
    member_id: userID,
    mail: user.mail,
    pass: "",
    member_name: "",
    package_id: user.package_id,
    exp_package: user.exp_package,
  });
  const [moviePackages, setMoviePackages] = useState([]);
  const [showPackages, setShowPackages] = useState(false);
  const [isPopupOpen, setIsPopupOpen] = useState(false);
  const [selectedPackage, setSelectedPackage] = useState(null);

  const fetchPackages = async () => {
    try {
      const response = await getListPackage();
      setMoviePackages(response.data);
    } catch (error) {
      console.log(error.message);
    }
  };

  useEffect(() => {
    getInfo(userID);
    fetchPackages();
  }, [userID]);

  const handleBuyClick = () => {
    setShowPackages(!showPackages);
    setActive(false);
    setInputOld(false);
    setIsEdit(false);
  };

  const handleClick = () => {
    setActive(!active);
    setInputOld(!inputOld);
    setShowPackages(false);
  };

  const handleSubmit = async () => {
    try {
      console.log(userOldPass);

      const res = await getUserPass(userID);
      console.log(res.data);
      if (userOldPass == res.data) {
        setIsEdit(true);
        setInputOld(false);
      } else {
        notification.error({ message: "Mật khẩu chưa khớp !" });
      }
    } catch (error) {
      console.log(error.message);
    }
  };

  const handleEdit1 = (event) => {
    const { name, value } = event.target;
    setInfo((prevState) => ({
      ...prevState,
      [name]: value,
      member_id: userID,
      mail: user.mail,
      package_id: user.package_id,
      exp_package: user.exp_package,
    }));
  };

  const handEdit = async () => {
    try {
      if (userConfPass === info.pass) {
        const res = await setUserInfo(info);
        console.log(res.data);
        setUser(res.data);
        localStorage.setItem("member_name", info.member_name);

        window.location.reload();
      } else {
        notification.error({ message: "Mật khẩu chưa khớp !" });
      }
    } catch (error) {
      console.log(error.message);
    }
  };

  const getInfo = async (userID) => {
    try {
      const res = await getUserInfo(userID);
      // console.log(res.data);
      setUser(res.data);
    } catch (error) {
      console.log(error.message);
    }
  };
  useEffect(() => {
    getInfo(userID);
  }, [userID]);

  const openPopup = () => {
    setIsPopupOpen(true);
  };

  const closePopup = () => {
    setIsPopupOpen(false);
  };

  const [paymentInfo, setPaymentInfo] = useState({
    cardHolderName: "",
    cardNumber: "",
    securityCode: "",
    expirationDate: "",
    packagePrice: 0,
    memberId: 0,
    packageId: 0,
  });

  const handlePackageClick = (selectedPackage) => {
    setSelectedPackage(selectedPackage);
    setPaymentInfo({
      cardHolderName: "",
      cardNumber: "",
      securityCode: "",
      expirationDate: "",
      packagePrice: selectedPackage.price,
      memberId: parseInt(userID),
      packageId: selectedPackage.pack_id,
    });
    openPopup();
  };

  const handlePaymentSubmit = async () => {
    try {
      const res = await payPackage(paymentInfo);
      console.log(res.data);
      setIsPopupOpen(false);
      window.location.reload();
    } catch (error) {
      console.log(error.message);
    }
  };

  return (
    <div className="w-full bg-black flex flex-col items-center text-white min-h-[100vh]">
      <div className="w-5/6">
        <div className="flex mt-4">
          <div className="self-center mr-2">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="13"
              height="13"
              viewBox="0 0 24 24"
            >
              <g transform="rotate(-90 12 12)">
                <path fill="red" d="M1 3h22L12 22" />
              </g>
            </svg>
          </div>
          <div className="font-semibold text-xl">Thông tin cá nhân</div>
        </div>
        <div className="flex flex-row my-8 ">
          <div className="self-center">
            <FaUserCircle className="w-24 h-24" />
          </div>
          <div className="ml-10">
            <div className="text-2xl">{user.member_name}</div>
            <div className="flex flex-row">
              <div>Mail:</div>
              <div className="text-red-600 ml-3"> {user.mail} </div>
            </div>
            <div className="flex flex-row">
              <div>Time:</div>
              <div className="text-red-600 ml-3"> {user.exp_package} </div>
            </div>
          </div>
        </div>
        <div className="flex flex-row">
          <button
            onClick={handleBuyClick}
            style={{ backgroundColor: showPackages ? "#5B5B5B" : "#17161B" }}
            className="rounded-3xl bg-[#17161B] py-2 px-6 flex justify-center items-center ml-6"
          >
            <div>Mua gói xem phim</div>
          </button>
          <button
            onClick={handleClick}
            style={{ backgroundColor: active ? "#5B5B5B" : "#17161B" }}
            className="rounded-3xl bg-[#17161B] py-2 px-6 flex justify-center items-center ml-6"
          >
            <div>Chỉnh sửa thông tin cá nhân</div>
          </button>
        </div>
        {/* form */}
        {showPackages && (
          <div className="mt-4">
            <h2 className="text-2xl font-semibold mb-2">
              Danh sách gói xem phim
            </h2>
            <div className="mt-4 flex flex-wrap">
              <ul className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
                {moviePackages.map((moviePackage) => (
                  <li
                    key={moviePackage.pack_id}
                    className="flex bg-gray-800 p-4 rounded-md flex-col items-center cursor-pointer"
                    onClick={() => handlePackageClick(moviePackage)}
                  >
                    <div>{moviePackage.pack_name}</div>
                    <div>Price: {moviePackage.price} VND</div>
                    <div>Time: {moviePackage.pack_time} tháng</div>
                  </li>
                ))}
              </ul>
            </div>
          </div>
        )}

        {isPopupOpen && (
          <div className="fixed top-0 left-0 w-full h-full bg-black bg-opacity-50 flex justify-center items-center">
            <div className="bg-white p-4 rounded-md">
              <h2 className="text-2xl font-semibold mb-2 text-black">
                Thông tin thanh toán
              </h2>
              {selectedPackage && (
                <div className="mb-2 text-black">
                  <div>Gói: {selectedPackage.pack_name}</div>
                  <div>Giá: {selectedPackage.price} VND</div>
                </div>
              )}
              <form
                onSubmit={(e) => {
                  e.preventDefault();
                  handlePaymentSubmit();
                }}
                className="flex flex-col"
              >
                {/* Tên chủ thẻ */}
                <div className="mb-2">
                  <label htmlFor="cardHolderName" className="text-black">
                    Tên chủ thẻ
                  </label>
                  <input
                    type="text"
                    id="cardHolderName"
                    className="w-full p-2 border border-gray-300 rounded-md text-black"
                    value={paymentInfo.cardHolderName}
                    onChange={(e) =>
                      setPaymentInfo({
                        ...paymentInfo,
                        cardHolderName: e.target.value,
                      })
                    }
                    required
                  />
                </div>

                {/* Số thẻ */}
                <div className="mb-2">
                  <label htmlFor="cardNumber" className="text-black">
                    Số thẻ
                  </label>
                  <input
                    type="text"
                    id="cardNumber"
                    className="w-full p-2 border border-gray-300 rounded-md text-black"
                    value={paymentInfo.cardNumber}
                    onChange={(e) =>
                      setPaymentInfo({
                        ...paymentInfo,
                        cardNumber: e.target.value,
                      })
                    }
                    required
                  />
                </div>

                {/* Mã bảo mật */}
                <div className="mb-2">
                  <label htmlFor="securityCode" className="text-black">
                    Mã bảo mật
                  </label>
                  <input
                    type="text"
                    id="securityCode"
                    className="w-full p-2 border border-gray-300 rounded-md text-black"
                    value={paymentInfo.securityCode}
                    onChange={(e) =>
                      setPaymentInfo({
                        ...paymentInfo,
                        securityCode: e.target.value,
                      })
                    }
                    required
                  />
                </div>

                {/* Ngày hết hạn */}
                <div className="mb-2">
                  <label htmlFor="expirationDate" className="text-black">
                    Ngày hết hạn
                  </label>
                  <input
                    type="text"
                    id="expirationDate"
                    className="w-full p-2 border border-gray-300 rounded-md text-black"
                    value={paymentInfo.expirationDate}
                    onChange={(e) =>
                      setPaymentInfo({
                        ...paymentInfo,
                        expirationDate: e.target.value,
                      })
                    }
                    required
                  />
                </div>

                <button
                  onClick={handlePaymentSubmit}
                  type="submit"
                  className="bg-[#E50914] rounded-3xl py-2 px-6 text-white mt-2"
                >
                  Thanh toán
                </button>

                <button
                  type="button"
                  onClick={closePopup}
                  className="bg-[#b5b5b5] rounded-3xl py-2 px-6 mt-4"
                >
                  <div>Đóng</div>
                </button>
              </form>
            </div>
          </div>
        )}
        {inputOld && (
          <div className="flex flex-col w-[19em] mt-8">
            <div>Nhập mật khẩu để tiếp tục</div>
            <input
              type="text"
              className="w-full mt-3 rounded-md px-3 py-2 text-black"
              onChange={(event) => setOldPass(event.target.value)}
              value={userOldPass}
            />
            <div className="flex justify-center items-center mt-8">
              <button
                className="bg-[#E50914] rounded-3xl py-2 px-6"
                onClick={handleSubmit}
              >
                <div>Tiếp tục</div>
              </button>
            </div>
          </div>
        )}

        {isEdit && (
          <div className="flex flex-col w-[19em] mt-5">
            <div className="mt-3">UserName</div>
            <input
              type="text"
              className="w-full mt-3 rounded-md px-3 py-2 text-black"
              name="member_name"
              value={info.member_name}
              onChange={handleEdit1}
            />
            <div className="mt-3">New Password</div>
            <input
              type="text"
              className="w-full mt-3 rounded-md px-3 py-2 text-black"
              name="pass"
              value={info.pass}
              onChange={handleEdit1}
            />
            <div className="mt-3">Confirm Password</div>
            <input
              type="text"
              className="w-full mt-3 rounded-md px-3 py-2 text-black"
              value={userConfPass}
              onChange={(event) => setConfPass(event.target.value)}
            />
            <div className="flex justify-center items-center mt-8">
              <button
                onClick={handEdit}
                className="bg-[#E50914] rounded-3xl py-2 px-6"
              >
                <div>Thay đổi</div>
              </button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

export default Profile;
