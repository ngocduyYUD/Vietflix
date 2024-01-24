/* eslint-disable no-useless-escape */
import { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import {
  getUserMovieDetailByID,
  addFavMovie,
  addHistoryMovie,
} from "../../services/Movies";
import { notification } from "antd";
import Artplayer from "./ArtPlayer.jsx";
import { isLoggedIn, checkBoughtPackage } from "../../services/User.js";

const UserMovieDetails = () => {
  const [showVideo, setShowVideo] = useState(false);
  const [showTrailer, setShowTrailer] = useState(false);
  const { id } = useParams();
  const [movieData, setMovieData] = useState({});
  const [hasBoughtPackage, setHasBoughtPackage] = useState(false);

  useEffect(() => {
    const fetchMovieDetail = async () => {
      try {
        const response = await getUserMovieDetailByID(id);
        setMovieData(response.data);
      } catch (error) {
        console.log(error.message);
        notification.error({ message: "Failed to fetch movie details" });
      }
    };

    fetchMovieDetail();
  }, [id]);

  useEffect(() => {
    const checkPackage = async () => {
      try {
        const member_id = localStorage.getItem("member_id");
        const response = await checkBoughtPackage(member_id);
        setHasBoughtPackage(response.data);
      } catch (error) {
        console.log(error.message);
        notification.error({ message: "Failed to check package" });
      }
    };

    if (isLoggedIn()) {
      checkPackage();
    }
  }, []);

  const trailerId = getYouTubeVideoId(movieData?.trailer || "");
  const [watchButtonState, setWatchButtonState] = useState({
    active: false,
    color: "#17161b",
    svgColor: "#17161b",
  });

  const [trailerButtonState, setTrailerButtonState] = useState({
    active: false,
    color: "#17161b",
  });

  const [favButtonState, setFavButtonState] = useState({
    active: false,
    color: "#17161b",
  });

  const handleWatchButtonClick = () => {
    if (isLoggedIn()) {
      if (hasBoughtPackage) {
        setShowVideo(true);
        setShowTrailer(false);
        setWatchButtonState({
          active: true,
          color: "#e50914",
          svgColor: "white",
        });
        setTrailerButtonState({
          active: false,
          color: "#17161b",
        });
        const member_id = localStorage.getItem("member_id");
        const movieId = movieData.id;

        if (member_id && movieId) {
          addHistoryMovie(movieId, member_id)
            .then(() => {
              console.log("Lịch sử xem phim đã được lưu.");
            })
            .catch((error) => {
              console.error("Lỗi khi lưu lịch sử xem phim", error);
            });
        } else {
          console.error("Không thể lấy memberId hoặc movieId");
        }
      } else {
        notification.warning({
          message: "Yêu cầu mua gói",
          description: "Vui lòng đăng ký gói phim để xem.",
        });
      }
    } else {
      notification.warning({
        message: "Yêu cầu đăng nhập",
        description: "Vui lòng đăng nhập để xem phim.",
      });
    }
  };

  const handleTrailerButtonClick = () => {
    setShowTrailer(true);
    setShowVideo(false);
    setTrailerButtonState({
      active: true,
      color: "#e50914",
    });
    setWatchButtonState({
      active: false,
      color: "#17161b",
      svgColor: "#17161b",
    });
  };
  const handleAddToFavorites = () => {
    if (isLoggedIn()) {
      const member_id = localStorage.getItem("member_id");
      const movieId = movieData.id;
      setFavButtonState({
        active: true,
        color: "#e50914",
        svgColor: "white",
      });
      if (member_id && movieId) {
        addFavMovie(movieId, member_id)
          .then(() => {
            notification.success({
              message: "Thêm thành công",
              description: "Phim đã được thêm vào danh sách ưa thích.",
            });
            console.log("Phim đã được thêm vào danh sách ưa thích");
          })
          .catch((error) => {
            console.error("Lỗi khi thêm phim vào danh sách ưa thích", error);
          });
      } else {
        console.error("Không thể lấy memberId hoặc movieId");
      }
    } else {
      notification.warning({
        message: "Yêu cầu đăng nhập",
        description: "Vui lòng đăng nhập để thực hiện thao tác.",
      });
    }
  };
  return (
    <div className="flex flex-col py-8 px-32 min-h-[100vh] bg-black">
      <div className="flex flex-col justify-center gap-2">
        <div className="flex gap-4">
          <div className="flex-none">
            <img
              src={movieData.thumbnail}
              alt="Ảnh bìa"
              className="w-60 h-70 object-cover object-center rounded-lg"
            />
          </div>
          <div className="ml-4">
            <div className="flex flex-col gap-2">
              <h1 className="text-3xl font-bold mb-4 text-white">
                {movieData.name}
              </h1>
              <p className="text-[#e50914]">
                <strong className="text-white">Thể loại:</strong>{" "}
                {movieData.genres && movieData.genres.join(", ")}
              </p>
              <p className="text-[#e50914]">
                <strong className="text-white">Ngôn ngữ:</strong>{" "}
                {movieData.languages && movieData.languages.join(", ")}
              </p>
              <p className="text-[#e50914]">
                <strong className="text-white">Năm phát hành:</strong>{" "}
                {movieData.year}
              </p>
              <p className="text-[#e50914]">
                <strong className="text-white">Diễn viên:</strong>{" "}
                {movieData.actor}
              </p>
              <p className="text-[#e50914]">
                <strong className="text-white">Đạo diễn:</strong>{" "}
                {movieData.director}
              </p>
              <p className="text-[#e50914]">
                <strong className="text-white">Thời lượng:</strong>{" "}
                {movieData.length}
              </p>
              <p className="text-[#e50914]">
                <strong className="text-white">Điểm đánh giá:</strong>{" "}
                {movieData.imdbID}
              </p>
            </div>

            <div>
              <div className="flex mt-2">
                <button
                  className={`flex text-white px-4 py-2 mr-2 rounded-full`}
                  style={{
                    backgroundColor: watchButtonState.color,
                    boxShadow: watchButtonState.active
                      ? "0 0 10px rgba(229, 9, 20, 1)"
                      : "none",
                  }}
                  onClick={handleWatchButtonClick}
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill={watchButtonState.svgColor}
                    viewBox="0 0 24 24"
                    strokeWidth={1.5}
                    stroke="currentColor"
                    className="w-6 h-6 mr-2"
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      d="M5.25 5.653c0-.856.917-1.398 1.667-.986l11.54 6.347a1.125 1.125 0 0 1 0 1.972l-11.54 6.347a1.125 1.125 0 0 1-1.667-.986V5.653Z"
                    />
                  </svg>
                  Xem phim
                </button>
                <button
                  className={`text-white px-4 py-2 mr-2 rounded-full`}
                  style={{
                    backgroundColor: trailerButtonState.color,
                    boxShadow: trailerButtonState.active
                      ? "0 0 10px rgba(229, 9, 20, 1)"
                      : "none",
                  }}
                  onClick={handleTrailerButtonClick}
                >
                  Xem trailer
                </button>

                <button
                  className="flex bg-[#17161b] text-white px-4 py-2 rounded-full"
                  style={{
                    backgroundColor: favButtonState.color,
                    boxShadow: favButtonState.active
                      ? "0 0 10px rgba(229, 9, 20, 1)"
                      : "none",
                  }}
                  onClick={handleAddToFavorites}
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill={favButtonState.svgColor}
                    viewBox="0 0 24 24"
                    strokeWidth={1.5}
                    stroke="currentColor"
                    className="w-6 h-6 mr-2"
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      d="M17.593 3.322c1.1.128 1.907 1.077 1.907 2.185V21L12 17.25 4.5 21V5.507c0-1.108.806-2.057 1.907-2.185a48.507 48.507 0 0 1 11.186 0Z"
                    />
                  </svg>
                  Thêm vào mục yêu thích
                </button>
              </div>
            </div>
          </div>
        </div>

        <div className="flex flex-col my-4">
          <strong className="text-2xl text-white">Mô tả:</strong>
          <p className="text-white mt-2">{movieData.description}</p>
        </div>
      </div>

      {showVideo && (
        <div className="mt-4 flex mt-4 justify-center">
          <Artplayer
            className="border-2"
            option={{
              container: ".artplayer-app",
              url: movieData.source,
              volume: 0.5,
              isLive: false,
              muted: false,
              autoplay: false,
              pip: true,
              autoSize: true,
              autoMini: true,
              setting: true,
              loop: true,
              playbackRate: true,
              fullscreen: true,
              miniProgressBar: true,
              mutex: true,
              backdrop: true,
              playsInline: true,
              autoPlayback: true,
              airplay: true,
              theme: "#e50914",
              lang: navigator.language.toLowerCase(),
              quality: [
                {
                  default: true,
                  html: "SD 480P",
                  url: movieData.source,
                },
                {
                  html: "HD 720P",
                  url: movieData.source,
                },
              ],
              icons: {
                loading: '<img src="/assets/Spinner-1s-200px.gif">',
              },
            }}
            style={{
              width: "600px",
              height: "400px",
              margin: "60px auto 0",
            }}
            getInstance={(art) => console.info(art)}
          />
        </div>
      )}

      {showTrailer && (
        <div className="flex mt-4 justify-center">
          <div
            style={{
              position: "relative",
              width: "100%",
              paddingTop: "56.25%",
            }}
          >
            <iframe
              width="100%"
              height="100%"
              src={`https://www.youtube.com/embed/${trailerId}`}
              title="YouTube video player"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowFullScreen
              style={{
                position: "absolute",
                top: 0,
                left: 0,
                width: "100%",
                height: "100%",
              }}
            ></iframe>
          </div>
        </div>
      )}
    </div>
  );
};

const getYouTubeVideoId = (url) => {
  const match = url.match(
    /(?:youtu\.be\/|youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/|youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=))([^"&?\/\s]{11})/
  );
  return match && match[1];
};

export default UserMovieDetails;
