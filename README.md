# Vietflix ứng dụng xem phim trực tuyến 
## Giới thiệu dự án 
   Project này làm ra với mục đích học cách thiết kế một ứng dụng và học cách sử dụng framework Spring boot. Đây là một ứng dụng xem phim trực tuyến với 2 phần chức năng của thành viên và Admin. 
## Điều kiện chạy ứng dụng web: 
   - *Cài đặt môi trường chạy java jre* 
   - *Sử dụng JDK 17 (hiện tại là BellSoft Liberica JDK version 17)* 
   - *Spring boot 3.2.1 sử dụng IDE Intellij* 
   - *nodejs 20.9.0 để chạy reactjs* 
   - *Database : Postgre SQL, có thể cài đặt PG Admin 4 để dễ sử dụng*
## Cách chạy Project 
  - Thêm dữ liệu từ file với đường dẫn Vietflix\Detailed Design\DataBase\finalSQL2.sql vào Database thông qua chức năng Restore của PGAdmin
  - Mở Project Vietflix qua Intellij, chọn vào class VietflixAplication và bấm nút chạy ở phía trên cùng. Back-end đã khởi chạy.
    > Hiện tại Project đang chạy tại cổng 8090 và database đang chạy ở cổng 5434 do đó bạn cần vào phần resource/aplication.propertie sửa lại 2 cổng nảy. tiếp tới sửa cả tài khoản và mật khẩu cho database của bạn để phù hợp với máy tính:
      1. `server.port=8090`
      2. `spring.datasource.url=jdbc:postgresql://localhost:5434/vietflix`
      3. `spring.datasource.username= `
      4. `spring.datasource.password= `
  - Trong thư mục Vietflix_FE, xóa 2 file package-lock và thư mục node_module(cho lần chạy đầu khi pull project về) sau đó chạy lệnh
    1. `npm i`
    2. `npm run dev`
    > lệnh 1 chỉ chạy cho lần đầu, không cần chạy cho các lần sau
  - Lấy link mà project chạy trên hiển thị của Terminal
## Các phần thiết kế
> Có trong các file của project 
## Ai thực hiện Project này? 
  - Bùi Ngọc Duy (ngocduyYUD) : Back-end 
  - Trần Nam Dương : Front-end
  - Thành Dương (Duong1311): Front-end  
