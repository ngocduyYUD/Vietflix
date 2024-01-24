import { useEffect, useState } from "react";
import Login from "../../pages/Login/Login";
// import { AppContext } from "../../context/AppContext";
import { Link, useNavigate } from "react-router-dom";
import { FaUserCircle } from "react-icons/fa";
import Menu from "../Menu/Menu";

export default function Header() {
  const [showLogin, setShowLogin] = useState(false);
  const [showMenu, setShowMenu] = useState(false);
  const [isLogin, setLogin] = useState(false);
  const [member_name, setName] = useState("");

  // const { valueQuery, setValueQuery } = useContext(AppContext);
  useEffect(() => {
    const name = localStorage.getItem("member_name");
    setName(name);
    const login = localStorage.getItem("isLogin");
    setLogin(login);
  }, []);
  // setLogin(login);

  const handleOnClode = () => {
    setShowLogin(false);
    setShowMenu(false);
  };
  // localStorage.setItem("name", "Bepatient");

  // const [updated, setUpdated] = useState("");
  const [message, setMessage] = useState("");

  const handleChange = (event) => {
    setMessage(event.target.value);
  };

  const handleKeyDown = (event) => {
    if (event.key === "Enter") {
      // 👇 Get input value
      // setUpdated(message);
      getSearchMovie(message);
    }
  };
  const navigate = useNavigate();
  const getSearchMovie = async () => {
    navigate({
      pathname: "/",
      search: "search=" + message,
    });
  };

  // console.log(updated);

  return (
    <div>
      <div className="w-full h-[60px] bg-black flex flex-row justify-center items-center ">
        <div className=" w-5/6  flex justify-between flex-row items-center">
          <Link to="/">
            <div className="flex cursor-pointer">
              <div className="self-center">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="24"
                  height="24"
                  viewBox="0 0 24 24"
                >
                  <path
                    fill="red"
                    d="M2 3.993A1 1 0 0 1 2.992 3h18.016c.548 0 .992.445.992.993v16.014a1 1 0 0 1-.992.993H2.992A.993.993 0 0 1 2 20.007zM4 5v14h16V5zm6.622 3.415l4.879 3.252a.4.4 0 0 1 0 .666l-4.88 3.252a.4.4 0 0 1-.621-.332V8.747a.4.4 0 0 1 .622-.332"
                  />
                </svg>
              </div>
              <div className="font-extrabold text-white text-xl ml-2">
                VietFLix
              </div>
            </div>
          </Link>
          <div className="relative">
            <div className="absolute inset-y-0 left-3 flex justify-center items-center">
              <svg
                width={20}
                height={20}
                viewBox="0 0 24 24"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  d="M21.7961 20.2041L17.3439 15.75C18.6788 14.0104 19.302 11.8282 19.0871 9.64606C18.8723 7.46389 17.8354 5.44515 16.1868 3.99936C14.5383 2.55356 12.4015 1.78898 10.21 1.8607C8.01841 1.93243 5.9362 2.83509 4.3857 4.38558C2.83521 5.93607 1.93255 8.01829 1.86083 10.2098C1.7891 12.4014 2.55369 14.5382 3.99948 16.1867C5.44527 17.8353 7.46401 18.8722 9.64618 19.087C11.8284 19.3019 14.0106 18.6787 15.7501 17.3437L20.2061 21.8006C20.3107 21.9053 20.4349 21.9883 20.5717 22.0449C20.7084 22.1015 20.8549 22.1307 21.0029 22.1307C21.1509 22.1307 21.2975 22.1015 21.4342 22.0449C21.5709 21.9883 21.6952 21.9053 21.7998 21.8006C21.9044 21.696 21.9875 21.5717 22.0441 21.435C22.1007 21.2983 22.1299 21.1517 22.1299 21.0037C22.1299 20.8557 22.1007 20.7092 22.0441 20.5725C21.9875 20.4357 21.9044 20.3115 21.7998 20.2069L21.7961 20.2041ZM4.12512 10.5C4.12512 9.23914 4.499 8.0066 5.1995 6.95823C5.89999 5.90987 6.89563 5.09277 8.06051 4.61026C9.22539 4.12775 10.5072 4.00151 11.7438 4.24749C12.9804 4.49347 14.1164 5.10063 15.0079 5.99219C15.8995 6.88375 16.5066 8.01966 16.7526 9.25629C16.9986 10.4929 16.8724 11.7747 16.3898 12.9396C15.9073 14.1045 15.0902 15.1001 14.0419 15.8006C12.9935 16.5011 11.761 16.875 10.5001 16.875C8.80989 16.8733 7.1894 16.201 5.99423 15.0059C4.79906 13.8107 4.12685 12.1902 4.12512 10.5Z"
                  fill="black"
                  fillOpacity={0.4}
                />
              </svg>
            </div>
            <input
              className="placeholder:italic placeholder:text-slate-400 block bg-white w-[30rem] border border-slate-300 rounded-3xl py-2 pl-9 pr-3 shadow-sm focus:outline-none focus:border-sky-500 focus:ring-sky-500 focus:ring-1 sm:text-sm"
              placeholder="Search for anything..."
              type="text"
              name="search"
              value={message}
              onChange={handleChange}
              onKeyDown={handleKeyDown}
            />
          </div>
          <div className=" flex flex-row text-white">
            {/* <div className="mr-3 flex flex-row justify-center items-center">
              <div className="self-center">
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
              <div className="leading-6">Home</div>
            </div> */}

            {!isLogin ? (
              <div
                className="underline cursor-pointer"
                onClick={() => {
                  setShowLogin(!showLogin);
                }}
              >
                Đăng Nhập
              </div>
            ) : (
              <div className="flex flex-row justify-center items-center ">
                <div
                  className="self-center mr-2 relative cursor-pointer"
                  onClick={() => {
                    setShowMenu(!showMenu);
                  }}
                >
                  <FaUserCircle className="w-8 h-8" />
                  <div className="absolute top-[45px] left-0 z-50">
                    <Menu
                      login={() => {
                        setLogin(!isLogin);
                      }}
                      status={showMenu}
                    />
                  </div>
                </div>
                <div>{member_name}</div>
              </div>
            )}
          </div>
        </div>
        <Login
          onClose={handleOnClode}
          visible={showLogin}
          login={() => {
            setLogin(true);
          }}
        />
      </div>
    </div>
  );
}
