import { useEffect, useState } from "react";
import { CCol, CRow, CCard, CCardBody, CCardHeader } from "@coreui/react";
import { Table, notification, Popconfirm, Space } from "antd";
import { Link } from "react-router-dom";
import { getListMovies, deleteMovie } from "../../services/Movies";

const MovieList = () => {
  const [data, setData] = useState([]);
  const [pagination, setPagination] = useState({ current: 1, pageSize: 10 });

  const getAllMovies = async () => {
    try {
      const res = await getListMovies();
      console.log(res.data);
      const dataWithIndex = res.data.map((record, index) => ({
        ...record,
        index: index + 1,
      }));
      setData(dataWithIndex);
    } catch (error) {
      console.log(error.message);
    }
  };

  useEffect(() => {
    getAllMovies();
  }, []);

  const handleDeleteMovie = async (id) => {
    try {
      await deleteMovie(id);
      notification.success({ message: "Xoá phim thành công!" });
      getAllMovies();
    } catch (error) {
      console.log(error.message);
    }
  };

  const handleTableChange = (pagination) => {
    setPagination(pagination);
  };

  const columns = [
    {
      title: "STT",
      dataIndex: "index",
    },
    {
      title: "Name",
      dataIndex: "name",
    },
    {
      title: "Action",
      dataIndex: "id",
      render: (id) => (
        <>
          <Space size="middle">
            <Link to={`/adm-details/${id}`}>{"Detail"}</Link>
          </Space>
        </>
      ),
    },
    {
      title: (
        <Link to="/adm-add" className="text-blue-500">
          Thêm phim mới
        </Link>
      ),
      dataIndex: "id",
      render: (id) => (
        <Popconfirm
          title="Are you sure to delete this movie?"
          onConfirm={() => handleDeleteMovie(id)}
          okText={<span style={{ color: "black" }}>Yes</span>}
          cancelText="No"
        >
          <a href="#!">{"Delete"}</a>
        </Popconfirm>
      ),
    },
  ];

  return (
    <CRow className="min-h-[100vh] m-6 ">
      <CCol>
        <CCard>
          <CCardHeader className="flex justify-center text-3xl items-center mb-8">
            Movie List
          </CCardHeader>
          <CCardBody>
            <Table
              className="overflow-auto"
              columns={columns}
              dataSource={data}
              pagination={pagination}
              onChange={handleTableChange}
              rowKey="index"
            />
          </CCardBody>
        </CCard>
      </CCol>
    </CRow>
  );
};

export default MovieList;
