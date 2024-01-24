import { useState } from "react";
import { CRow, CCol, CCard, CCardBody, CCardHeader } from "@coreui/react";
import { Button, Form, Input, notification } from "antd";
import { useForm } from "antd/lib/form/Form";
import { addMovie } from "../../services/Movies";
import { useNavigate } from "react-router-dom";

const formItemLayout = {
  labelCol: {
    xs: { span: 24 },
    sm: { span: 6 },
  },
  wrapperCol: {
    xs: { span: 24 },
    sm: { span: 18 },
  },
};

const AddMovie = () => {
  const navigate = useNavigate();
  const [form] = useForm();
  const [movieData, setMovieData] = useState({
    name: "",
    length: "",
    languages: [],
    source: "",
    description: "",
    director: "",
    thumbnail: "",
    actor: "",
    genres: [],
    year: 0,
    imdbID: 0,
    trailer: "",
  });

  const handleInputChange = (fieldName, value) => {
    if (fieldName === "genres" || fieldName === "languages") {
      const arrayValue = value.split(",").map((item) => item.trim());
      setMovieData({
        ...movieData,
        [fieldName]: arrayValue,
      });
    } else {
      setMovieData({
        ...movieData,
        [fieldName]: value,
      });
    }
  };

  const handleSubmit = () => {
    form
      .validateFields()
      .then(() => {
        addMovie(movieData)
          .then((response) => {
            console.log("Thêm phim thành công:", response.data);
            notification.success({ message: "Thêm phim thành công!" });
            navigate("/adm-list");
          })
          .catch((error) => {
            console.error("Lỗi khi thêm phim:", error);
            notification.error({ message: "Lỗi khi thêm phim!" });
          });
      })
      .catch((errorInfo) => {
        console.log("Validation failed:", errorInfo);
      });
  };

  return (
    <CRow className="flex items-center justify-center min-h-[100vh]">
      <CCol className="m-6 w-2/3">
        <CCard>
          <CCardHeader className="flex justify-center text-3xl items-center mb-8">
            Add New Movie
          </CCardHeader>
          <CCardBody>
            <Form {...formItemLayout} form={form} onFinish={handleSubmit}>
              <Form.Item
                label="Tên"
                labelAlign="left"
                name="name"
                rules={[{ required: true, message: "Không được bỏ trống!" }]}
                className="mb-2"
              >
                <Input
                  placeholder="Nhập tên"
                  value={movieData.name}
                  onChange={(e) => handleInputChange("name", e.target.value)}
                  className="w-full px-3 py-2 border rounded"
                />
              </Form.Item>

              <Form.Item
                label="Thể loại"
                labelAlign="left"
                name="genres"
                rules={[{ required: true, message: "Không được bỏ trống!" }]}
                className="mb-2"
              >
                <Input
                  placeholder="Nhập thể loại"
                  value={movieData.genres}
                  onChange={(e) => handleInputChange("genres", e.target.value)}
                  className="w-full px-3 py-2 border rounded"
                />
              </Form.Item>
              <Form.Item
                label="Ngôn ngữ"
                labelAlign="left"
                name="languages"
                rules={[{ required: true, message: "Không được bỏ trống!" }]}
                className="mb-2"
              >
                <Input
                  placeholder="Nhập ngôn ngữ phim"
                  value={movieData.languages}
                  onChange={(e) =>
                    handleInputChange("languages", e.target.value)
                  }
                  className="w-full px-3 py-2 border rounded"
                />
              </Form.Item>
              <Form.Item
                label="Diễn viên"
                labelAlign="left"
                name="actor"
                rules={[{ required: true, message: "Không được bỏ trống!" }]}
                className="mb-2"
              >
                <Input
                  placeholder="Nhập tên diễn viên"
                  value={movieData.actor}
                  onChange={(e) => handleInputChange("actor", e.target.value)}
                  className="w-full px-3 py-2 border rounded"
                />
              </Form.Item>

              <Form.Item
                label="Đạo diễn"
                labelAlign="left"
                name="director"
                rules={[{ required: true, message: "Không được bỏ trống!" }]}
                className="mb-2"
              >
                <Input
                  placeholder="Nhập tên đạo diễn"
                  value={movieData.director}
                  onChange={(e) =>
                    handleInputChange("director", e.target.value)
                  }
                  className="w-full px-3 py-2 border rounded"
                />
              </Form.Item>
              <Form.Item
                label="Năm"
                labelAlign="left"
                name="year"
                rules={[{ required: true, message: "Không được bỏ trống!" }]}
                className="mb-2"
              >
                <Input
                  placeholder="Nhập năm phát hành"
                  value={movieData.year}
                  onChange={(e) => handleInputChange("year", e.target.value)}
                  className="w-full px-3 py-2 border rounded"
                />
              </Form.Item>
              <Form.Item
                label="Thời lượng"
                labelAlign="left"
                name="length"
                rules={[{ required: true, message: "Không được bỏ trống!" }]}
                className="mb-2"
              >
                <Input
                  placeholder="Nhập thời lượng bộ phim"
                  value={movieData.length}
                  onChange={(e) => handleInputChange("length", e.target.value)}
                  className="w-full px-3 py-2 border rounded"
                />
              </Form.Item>
              <Form.Item
                label="IMDB"
                labelAlign="left"
                name="imdbID"
                rules={[{ required: true, message: "Không được bỏ trống!" }]}
                className="mb-2"
              >
                <Input
                  placeholder="Nhập điểm IMDB"
                  value={movieData.imdbID}
                  onChange={(e) => handleInputChange("imdbID", e.target.value)}
                  className="w-full px-3 py-2 border rounded"
                />
              </Form.Item>
              <Form.Item
                label="Mô tả"
                labelAlign="left"
                name="description"
                rules={[{ required: true, message: "Không được bỏ trống!" }]}
                className="mb-2"
              >
                <Input
                  placeholder="Nhập mô tả của phim"
                  value={movieData.description}
                  onChange={(e) =>
                    handleInputChange("description", e.target.value)
                  }
                  className="w-full px-3 py-2 border rounded"
                />
              </Form.Item>
              <Form.Item
                label="Thumbnail"
                labelAlign="left"
                name="thumbnail"
                rules={[
                  { required: true, message: "Không được bỏ trống!" },
                  {
                    type: "url",
                    message: "Vui lòng nhập đúng định dạng URL",
                  },
                ]}
                className="mb-2"
              >
                <Input
                  placeholder="Nhập URL thumbnail"
                  value={movieData.thumbnail}
                  onChange={(e) =>
                    handleInputChange("thumbnail", e.target.value)
                  }
                  className="w-full px-3 py-2 border rounded"
                />
              </Form.Item>
              <Form.Item
                label="Trailer"
                labelAlign="left"
                name="trailer"
                rules={[
                  { required: true, message: "Không được bỏ trống!" },
                  {
                    type: "url",
                    message: "Vui lòng nhập đúng định dạng URL",
                  },
                ]}
                className="mb-2"
              >
                <Input
                  placeholder="Nhập URL trailer phim"
                  value={movieData.trailer}
                  onChange={(e) => handleInputChange("trailer", e.target.value)}
                  className="w-full px-3 py-2 border rounded"
                />
              </Form.Item>
              <Form.Item
                label="Source phim"
                labelAlign="left"
                name="source"
                rules={[
                  { required: true, message: "Không được bỏ trống!" },
                  // {
                  //   type: "url",
                  //   message: "Vui lòng nhập đúng định dạng URL",
                  // },
                ]}
                className="mb-2"
              >
                <Input
                  placeholder="Nhập URL source phim"
                  value={movieData.source}
                  onChange={(e) => handleInputChange("source", e.target.value)}
                  className="w-full px-3 py-2 border rounded"
                />
              </Form.Item>
              <Button
                type="primary"
                block
                onClick={handleSubmit}
                className="w-full px-4  bg-red-500 text-black mt-2 text-white"
              >
                Submit
              </Button>
            </Form>
          </CCardBody>
        </CCard>
      </CCol>
    </CRow>
  );
};

export default AddMovie;
