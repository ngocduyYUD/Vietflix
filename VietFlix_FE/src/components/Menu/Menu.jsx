import { Link } from "react-router-dom";

// eslint-disable-next-line react/prop-types
const Menu = ({ status, login }) => {
  if (!status) return null;
  // const [show, setShow] = useState;

  const id = localStorage.getItem("member_id");
  if (id == 0)
    return (
      <div className="text-black flex flex-col justify-center items-center  w-[8rem] h-[3rem] bg-white underline rounded-md">
        <div>
          <Link to="/">
            <div
              onClick={() => {
                localStorage.clear();
                login();
              }}
            >
              Đăng xuất
            </div>
          </Link>
        </div>
      </div>
    );
  return (
    <div className="text-black flex flex-col justify-center items-center  w-[8rem] h-[7rem] bg-white underline rounded-md">
      <div>
        <div>
          <Link to="/profile">
            <div>Hồ sơ</div>
          </Link>
          <Link to="/favorite">
            <div>Phim yêu thích</div>
          </Link>
          <Link to="/history">
            <div>Lịch sử</div>
          </Link>
        </div>

        <Link to="/">
          <div
            onClick={() => {
              localStorage.clear();
              login();
            }}
          >
            Đăng xuất
          </div>
        </Link>
      </div>
    </div>
  );
};

export default Menu;
