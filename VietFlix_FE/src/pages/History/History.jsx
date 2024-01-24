import { FaStar } from "react-icons/fa";
import { Link } from "react-router-dom";
import { useEffect, useState } from "react";
import { getMemberHistory } from "../../services/Movies";

const History = () => {
  const [datas, setData] = useState();

  useEffect(() => {
    const id = localStorage.getItem("member_id");
    const getHistory = async () => {
      try {
        const res = await getMemberHistory(id);
        console.log(res.data);
        setData(res.data.reverse());
      } catch (error) {
        console.log(error.message);
      }
    };

    getHistory();
  }, []);
  return (
    <div className="w-full bg-black flex flex-col items-center text-white min-h-[100vh]">
      <div className="w-5/6 ">
        <div className="mt-4">
          <div className="flex">
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
            <div className="font-semibold text-xl">Lịch sử xem phim</div>
          </div>
        </div>
        <div className="grid gap-4 grid-cols-5 mt-7">
          {datas &&
            datas?.map((data) => {
              return (
                <div key={data?.id}>
                  <Link to={`/details/${data.id}`} className="relative">
                    <img
                      className="hover:scale-110 transform transition duration-y z-0 object-cover w-[239px] h-[338px]"
                      src={data?.thumbnail}
                      alt=""
                    />
                    <div className="absolute bottom-3 left-3 flex flex-col">
                      <div className="bg-[#E50914] px-2 rounded flex justify-center items-center max-w-[4rem]">
                        <div className="text-sm">{data.genres[1]}</div>
                      </div>
                      <div className="flex flex-row ">
                        <div className="text-yellow-400">{data.imdbID}</div>
                        <div className="self-center ml-1">
                          <FaStar className="" />
                        </div>
                      </div>
                      <div className="font-semibold text-xl text-ellipsis overflow-hidden hover:overflow-visible line-clamp-1">
                        {data.name}
                      </div>
                    </div>
                  </Link>
                </div>
              );
            })}
        </div>
      </div>
    </div>
  );
};

export default History;
