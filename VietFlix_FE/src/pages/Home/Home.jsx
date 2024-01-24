import { useEffect, useState } from "react";
// import { FaChevronLeft, FaChevronRight } from "react-icons/fa";
import MenuItem from "@mui/material/MenuItem";
// import FormHelperText from "@mui/material/FormHelperText";
import FormControl from "@mui/material/FormControl";
import Select from "@mui/material/Select";
// import Slider from "rc-slider";
import "rc-slider/assets/index.css";
import { FaStar } from "react-icons/fa";
import {
  getListMovies,
  getSearch,
  getFilterMovies,
} from "../../services/Movies";
// import { useSearchParams } from "react-router-dom";

// import { AppContext } from "../../context/AppContext";
import { useLocation, useNavigate, Link } from "react-router-dom";
// import FilterItem from "../../components/FilterItem/FilterItem";
const Home = () => {
  // const sliderRef1 = useRef(null);
  // const sliderRef2 = useRef(null);
  const [datas, setData] = useState();
  // const { valueQuery, setValueQuery } = useContext(AppContext);
  // console.log(valueQuery);
  const [genre, setGenre] = useState("All");
  const [language, setLanguage] = useState("All");
  const [year, setYear] = useState("All");

  console.log(name);
  const navigate = useNavigate();
  const handleSubmit = () => {
    const searchParams = {
      genre: genre,
      language: language,
      year: year,
    };
    navigate({
      pathname: "/",
      search: new URLSearchParams(searchParams).toString(),
    });
  };
  // const scrollAmount = 100;
  // const images = [
  //   {
  //     id: 1,
  //     url: "Mot",
  //   },
  //   {
  //     id: 2,
  //     url: "Hai",
  //   },
  //   {
  //     id: 3,
  //     url: "Ba",
  //   },
  //   {
  //     id: 4,
  //     url: "bon",
  //   },
  //   {
  //     id: 5,
  //     url: "năm",
  //   },
  //   {
  //     id: 6,
  //     url: "sau",
  //   },
  // ];

  const genres = [
    "Action",
    "Horror",
    "Comedy",
    "Romance",
    "Science fiction",
    "Adventure",
    "Psychological",
    "Crime",
    "Mythology",
    "Documentary",
    "Animation",
    "Musical",
    "War",
    "Western",
    "Drama",
    "Fantasy",
  ];

  const languages = [
    "Vietnamese",
    "English",
    "Chinese",
    "Japanese",
    "Korean",
    "French",
    "Spanish",
    "German",
    "Italian",
    "Arabic",
    "Portuguese",
    "Hindi",
    "Bengali",
    "Tamil",
  ];

  const years = [
    "2010",
    "2011",
    "2012",
    "2013",
    "2014",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
  ];

  const getAllMovies = async () => {
    try {
      const res = await getListMovies();
      console.log(res.data);
      setData(res.data);
    } catch (error) {
      console.log(error.message);
    }
  };
  const getMoviesFilter = async (filterMessage) => {
    try {
      const res = await getFilterMovies(filterMessage);
      console.log(res.data);
      setData(res.data);
    } catch (error) {
      console.log(error.message);
    }
  };

  const getSearchMovie = async (searchMessage) => {
    try {
      const res = await getSearch(searchMessage);
      console.log(res.data);
      setData(res.data);
    } catch (error) {
      console.log(error.message);
    }
  };
  const pathname = useLocation();
  useEffect(() => {
    const searchParams = new URLSearchParams(pathname.search);
    const params = Object.fromEntries(searchParams.entries());
    if (Object.keys(params).length === 0) {
      getAllMovies();
      return;
    }
    if (Object.prototype.hasOwnProperty.call(params, "search")) {
      getSearchMovie(params.search);
      return;
    }

    getMoviesFilter(params.language + "-" + params.genre + "-" + params.year);
  }, [pathname.search]);

  return (
    <div className="w-full bg-black flex flex-col items-center text-white min-h-[100vh]">
      <div className="w-5/6 ">
        <div className="">
          <div className="">
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
              <div className="font-semibold text-xl">Filter</div>
            </div>

            <div className="flex flex-row z-0">
              <FormControl sx={{ m: 1, minWidth: 120 }} size="small">
                <Select
                  value={genre}
                  onChange={(event) => setGenre(event.target.value)}
                  displayEmpty
                  inputProps={{ "aria-label": "Without label" }}
                  className="bg-white "
                >
                  <MenuItem value="All">
                    <em>All</em>
                  </MenuItem>
                  {genres.map((genre, i) => (
                    <MenuItem key={i} value={genre}>
                      {genre}
                    </MenuItem>
                  ))}
                </Select>
                {/* <FormHelperText>Without label</FormHelperText> */}
              </FormControl>
              <FormControl sx={{ m: 1, minWidth: 120 }} size="small">
                {/* <FormControl className="min-w-[220px] m-5" size="small"> */}
                <Select
                  value={language}
                  onChange={(event) => setLanguage(event.target.value)}
                  displayEmpty
                  inputProps={{ "aria-label": "Without label" }}
                  className="bg-white "
                >
                  <MenuItem value="All">
                    <em>All</em>
                  </MenuItem>
                  {languages.map((language, i) => (
                    <MenuItem key={i} value={language}>
                      {language}
                    </MenuItem>
                  ))}
                </Select>
                {/* <FormHelperText>Without label</FormHelperText> */}
              </FormControl>
              <FormControl sx={{ m: 1, minWidth: 120 }} size="small">
                <Select
                  value={year}
                  onChange={(event) => setYear(event.target.value)}
                  displayEmpty
                  inputProps={{ "aria-label": "Without label" }}
                  className="bg-white "
                >
                  <MenuItem value="All">
                    <em>All</em>
                  </MenuItem>
                  {years.map((year, i) => (
                    <MenuItem key={i} value={year}>
                      {year}
                    </MenuItem>
                  ))}
                </Select>
                {/* <FormHelperText>Without label</FormHelperText> */}
              </FormControl>
              <div
                onClick={handleSubmit}
                className="flex items-center h-[40px] self-center ml-2 bg-red-600 w-[4rem]   text-white cursor-pointer hover:bg-red-700 font-semibold rounded-sm px-4 py-1"
              >
                <div className="flex text-lg justify-center items-center w-full">
                  Lọc
                </div>
              </div>
            </div>

            {/* <div className="items-center flex mt-3">
              <button
                className="nav-btn"
                onClick={() => {
                  const container = sliderRef1.current;
                  container.scrollLeft -= scrollAmount;
                }}
              >
                <FaChevronLeft />
              </button>
              <div className="flex overflow-x-hidden" ref={sliderRef1}>
                {images.map((image) => {
                  return (
                    // <img
                    //   className="image"
                    //   alt="sliderImage"
                    //   key={image?.id}
                    //   src={image?.url}
                    // />
                    // <div
                    //   className="bg-[#17161B] min-w-[4rem] rounded-3xl flex justify-center items-center mr-2 px-4 py-1 even:bg-violet-700"
                    //   key={image?.id}
                    // >
                    //   <div className="text-white text-center">{image?.url}</div>
                    // </div>

                    <FilterItem key={image?.id} value={image} />
                  );
                })}
              </div>
              <button
                className=""
                onClick={() => {
                  const container = sliderRef1.current;
                  container.scrollLeft += scrollAmount;
                }}
              >
                <FaChevronRight />
              </button>
            </div>

            <div className="items-center flex mt-3">
              <button
                className="nav-btn"
                onClick={() => {
                  const container = sliderRef2.current;
                  container.scrollLeft -= scrollAmount;
                }}
              >
                <FaChevronLeft className="" />
              </button>
              <div className="flex overflow-x-hidden" ref={sliderRef2}>
                {images.map((image) => {
                  return (
                    <div
                      className="bg-[#17161B] min-w-[4rem] rounded-2xl flex mr-2 cursor-pointer active:bg-red-600"
                      key={image?.id}
                    >
                      <div className="text-white m-auto">{image?.url}</div>
                    </div>
                  );
                })}
              </div>
              <button
                className=""
                onClick={() => {
                  const container = sliderRef2.current;
                  container.scrollLeft += scrollAmount;
                }}
              >
                <FaChevronRight />
              </button>
            </div> */}

            {/* <div className="ml-5 w-[200px] mt-3">
              <div>Năm :</div>{" "}
              <Slider
                // disabled={!enablePrice}
                range
                allowCross={false}
                className={`mt-[1rem] mb-[1.5rem]`}
                // value={[sliderPriceLeft, sliderPriceRight]}
                // step={stepPrice}
                // min={minPrice}
                // max={maxPrice}
                // defaultValue={[minPrice, defaultPriceRight]}
                // onChange={([value1, value2]) => {
                //   setSliderPriceLeft(value1);
                //   setSliderPriceRight(value2);
                //   setValueQuery((prev) => ({
                //     ...prev,
                //     price_min: value1,
                //     price_max: value2,
                //   }));
                // }}
                styles={{
                  track: {
                    backgroundColor: "red",
                    height: "0.7rem",
                    // opacity: enablePrice ? "100%" : "30%",
                  },
                  handle: {
                    backgroundColor: "red",
                    height: "1.25rem",
                    width: "1.25rem",
                    // opacity: enablePrice ? "100%" : "30%",
                    active: {
                      outline: "none",
                    },
                  },
                  rail: {
                    backgroundColor: "white",
                    height: "0.5rem",
                    // opacity: enablePrice ? "30%" : "20%",
                    // borderWidth: "0",
                  },
                }}
              ></Slider>
            </div> */}
          </div>
        </div>
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
            <div className="font-semibold text-xl">Recommended</div>
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

export default Home;
