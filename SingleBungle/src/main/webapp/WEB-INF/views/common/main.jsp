<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>SingleBungle</title>


     <!-- 부트스트랩 사용을 위한 css 추가 -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
     integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

 <!-- 부트스트랩 사용을 위한 라이브러리 추가 -->
 <!-- 제이쿼리가 항상 먼저여야함 -->
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
     integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
     crossorigin="anonymous"></script>
     
     
<style>
   #freeBoard{
      height: 300px;
   }
   #findFriend{
      height: 170px;

   }

   #market{
      height : 500px;
   }

   #foodBoard, #review{
      height : 350px;
   }


   .images{
      width:40px;
      height: 40px;
   }


         /* 제목 */
         .text-dark{
        display:block;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;

      }

</style>
<!-- Custom styles for this template -->
<link href="resources/css/carousel.css" rel="stylesheet">
</head>
<body>
	<!-- jsp 액션 태그를 이용한 동적 include -->
	<jsp:include page="header.jsp" />

	<main role="main">

	    <div class="container">
   <div class="row">
      <div class="col-md-12">
         <!-- 이벤트 배너 -->
         <div class="carousel slide" id="carousel-32703" >
            <ol class="carousel-indicators">
               <li data-slide-to="0" data-target="#carousel-32703" class="active">
               </li>
               <li data-slide-to="1" data-target="#carousel-32703">
               </li>
               <li data-slide-to="2" data-target="#carousel-32703">
               </li>
            </ol>
            <div class="carousel-inner" style="height: 200px; margin-top: 10px;">
               <div class="carousel-item active" >
                  <img class="d-block w-100"  src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg" />
                  <div class="carousel-caption">
                     <h4>
                        First Thumbnail label
                     </h4>
                     <p>
                        Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                     </p>
                  </div>
               </div>
               <div class="carousel-item">
                  <img class="d-block w-100"  src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg" />
                  <div class="carousel-caption">
                     <h4>
                        Second Thumbnail label
                     </h4>
                     <p>
                        Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                     </p>
                  </div>
               </div>
               <div class="carousel-item">
                  <img class="d-block w-100"  src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
                  <div class="carousel-caption">
                     <h4>
                        Third Thumbnail label
                     </h4>
                     <p>
                        Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                     </p>
                  </div>
               </div>
            </div> 
            <a class="carousel-control-prev" href="#carousel-32703" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-32703" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
         </div>


         <div class="row py-2">
            <div class="col-md-7 ">
                <!-- 자유게시판 -->
               <div class="row">
                  <div class="col-md-12">
                     <h7>자유게시판</h7>
                     <div class="wrapper" id="freeBoard">

                        <table style="margin: 5px;">
                           <tr>
                              <td rowspan="3" style="width:50px;"><img class="images" src="/Image/발받침대.png"/></td>
                              <td><div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: burlywood;">자유</div></td>
                           </tr>
                           <tr>
                              <td>
                                 <h7> <a href="#" class="text-dark">어쩌구 저쩌구</a></h7>
                              </td>
                           </tr>
                        </table>

                        <table style="margin: 5px;">
                           <tr>
                              <td rowspan="3" style="width:50px;"><img class="images" src="/Image/arrow.png"/></td>
                              <td><div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: burlywood;">자유</div></td>
                           </tr>
                           <tr>
                              <td>
                                 <h7> <a href="#" class="text-dark">어쩌구 저쩌구</a></h7>
                              </td>
                           </tr>
                        </table>

                        <table style="margin: 5px;">
                           <tr>
                              <td rowspan="3" style="width:50px;"><img class="images" src="/Image/수납장.png"/></td>
                              <td><div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: burlywood;">자유</div></td>
                           </tr>
                           <tr>
                              <td>
                                 <h7> <a href="#" class="text-dark">어쩌구 저쩌구</a></h7>
                              </td>
                           </tr>
                        </table>

                        <table style="margin: 5px;">
                           <tr>
                              <td rowspan="3" style="width:50px;"><img class="images" src="/Image/arrow.png"/></td>
                              <td><div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: burlywood;">자유</div></td>
                           </tr>
                           <tr>
                              <td>
                                 <h7> <a href="#" class="text-dark">어쩌구 저쩌구</a></h7>
                              </td>
                           </tr>
                        </table>

                        <table style="margin: 5px;">
                           <tr>
                              <td rowspan="3" style="width:50px;"><img class="images" src="/Image/arrow.png"/></td>
                              <td><div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: burlywood;">자유</div></td>
                           </tr>
                           <tr>
                              <td>
                                 <h7> <a href="#" class="text-dark">발받침대 구매 후기</a></h7>
                              </td>
                           </tr>
                        </table>

                     </div>

                  </div>
               </div>
               <!-- 친구찾기 -->
               <div class="row" style="margin-top: 10px;">
                  <div class="col-md-12" >
                     <h7>친구찾기</h7>

                     <div class="wrapper p-1" id="findFriend">
                       
                        <table style="margin: 5px;">
                           <tr>
                              <td><div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: burlywood;margin-right: 5px;">동네친구</div></td>
                              <td><h7> <a href="#" class="text-dark">신설동 동네친구 구해요</a></h7></td>
                           </tr>
                        </table>


                        <table style="margin: 5px;">
                           <tr>
                              <td><div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: burlywood;margin-right: 5px;">동네친구</div></td>
                              <td><h7> <a href="#" class="text-dark">신설동 동네친구 구해요</a></h7></td>
                           </tr>
                        </table>

                          <table style="margin: 5px;">
                           <tr>
                              <td><div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: burlywood;margin-right: 5px;">동네친구</div></td>
                              <td><h7> <a href="#" class="text-dark">신설동 동네친구 구해요</a></h7></td>
                           </tr>
                        </table>
                        <table style="margin: 5px;">
                           <tr>
                              <td><div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: burlywood;margin-right: 5px;">동네친구</div></td>
                              <td><h7> <a href="#" class="text-dark">신설동 동네친구 구해요</a></h7></td>
                           </tr>
                        </table>
                        <table style="margin: 5px;">
                           <tr>
                              <td><div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: burlywood;margin-right: 5px;">동네친구</div></td>
                              <td><h7> <a href="#" class="text-dark">신설동 동네친구 구해요</a></h7></td>
                           </tr>
                        </table>

                     </div>
                  </div>
               </div>
            </div>

            <!-- 사고팔고 -->
            <div class="col-md-5 " >
               <h7>사고팔고</h7>

               <div class="row" id="market">
                  <div class="col-xl-4 col-lg-4 col-md-6 mb-4" style="margin-top: 5px;" >
                     <div class="bg-white">
                        <div class="embed-responsive embed-responsive-4by3">
                           <img  src="/Image/발받침대.png"  class="img-fluid card-img-top embed-responsive-item">
                        </div>
                        <div class="p-2">
                           <div class="badge badge-danger rounded-pill font-weight-normal float-right" style="background-color: rgb(135, 222, 150);">10,000</div>
                           <div style="clear: both;"> <a href="#" class="text-dark">MCM 장지갑</a></div>
                        </div>
                     </div>
                  </div>
                  <div class="col-xl-4 col-lg-4 col-md-6 mb-4"  style="margin-top: 5px;">
                     <div class="bg-white">
                        <div class="embed-responsive embed-responsive-4by3">
                           <img  src="/Image/발받침대.png"  class="img-fluid card-img-top embed-responsive-item">
                        </div>
                        <div class="p-2">
                           <div class="badge badge-danger rounded-pill font-weight-normal float-right" style="background-color: rgb(135, 222, 150);">10,000</div>
                           <div style="clear: both;"> <a href="#" class="text-dark">MCM 장지갑</a></div>
                        </div>
                     </div>
                  </div>

                  <div class="col-xl-4 col-lg-4 col-md-6 mb-4"  style="margin-top: 5px;">
                     <div class="bg-white">
                        <div class="embed-responsive embed-responsive-4by3">
                           <img  src="/Image/발받침대.png"  class="img-fluid card-img-top embed-responsive-item">
                        </div>
                        <div class="p-2">
                           <div class="badge badge-danger rounded-pill font-weight-normal float-right" style="background-color: rgb(135, 222, 150);">10,000</div>
                           <div style="clear: both;"> <a href="#" class="text-dark">MCM 장지갑</a></div>
                        </div>
                     </div>
                  </div>
                  <div class="col-xl-4 col-lg-4 col-md-6 mb-4"  style="margin-top: 5px;">
                     <div class="bg-white">
                        <div class="embed-responsive embed-responsive-4by3">
                           <img  src="/Image/발받침대.png"  class="img-fluid card-img-top embed-responsive-item">
                        </div>
                        <div class="p-2">
                           <div class="badge badge-danger rounded-pill font-weight-normal float-right" style="background-color: rgb(135, 222, 150);">10,000</div>
                           <div style="clear: both;"> <a href="#" class="text-dark">MCM 장지갑</a></div>
                        </div>
                     </div>
                  </div>
                  <div class="col-xl-4 col-lg-4 col-md-6 mb-4"  style="margin-top: 5px;">
                     <div class="bg-white">
                        <div class="embed-responsive embed-responsive-4by3">
                           <img  src="/Image/발받침대.png"  class="img-fluid card-img-top embed-responsive-item">
                        </div>
                        <div class="p-2">
                           <div class="badge badge-danger rounded-pill font-weight-normal float-right" style="background-color: rgb(135, 222, 150);">10,000</div>
                           <div style="clear: both;"> <a href="#" class="text-dark">MCM 장지갑</a></div>
                        </div>
                     </div>
                  </div>
                  <div class="col-xl-4 col-lg-4 col-md-6 mb-4"  style="margin-top: 5px;">
                     <div class="bg-white">
                        <div class="embed-responsive embed-responsive-4by3">
                           <img  src="/Image/발받침대.png"  class="img-fluid card-img-top embed-responsive-item">
                        </div>
                        <div class="p-2">
                           <div class="badge badge-danger rounded-pill font-weight-normal float-right" style="background-color: rgb(135, 222, 150);">10,000</div>
                           <div style="clear: both;"> <a href="#" class="text-dark">MCM 장지갑</a></div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <!-- 맛집게시판 -->
         <div class="row">
            <div class="col-md-12" id="foodBoard">
               <h7>맛집게시판</h7>
               <div class="row">
               <div class="col-xl-4 col-lg-4 col-md-6 mb-4"  style="margin-top: 5px;">
                  <div class="bg-white">
                     <div class="embed-responsive embed-responsive-4by3">
                        <img  src="/Image/발받침대.png"  class="img-fluid card-img-top embed-responsive-item">
                     </div>
                     <div class="p-2">
                        <div class="badge badge-danger rounded-pill font-weight-normal float-right" style="background-color: rgb(135, 222, 150);">맛집</div>
                        <div style="clear: both;"> <a href="#" class="text-dark">MCM 장지갑</a></div>
                     </div>
                  </div>
               </div>
               <div class="col-xl-4 col-lg-4 col-md-6 mb-4"  style="margin-top: 5px;">
                  <div class="bg-white">
                     <div class="embed-responsive embed-responsive-4by3">
                        <img  src="/Image/발받침대.png"  class="img-fluid card-img-top embed-responsive-item">
                     </div>
                     <div class="p-2">
                        <div class="badge badge-danger rounded-pill font-weight-normal float-right" style="background-color: rgb(135, 222, 150);">혼밥</div>
                        <div style="clear: both;"> <a href="#" class="text-dark">MCM 장지갑</a></div>
                     </div>
                  </div>
               </div>
               <div class="col-xl-4 col-lg-4 col-md-6 mb-4"  style="margin-top: 5px;">
                  <div class="bg-white">
                     <div class="embed-responsive embed-responsive-4by3">
                        <img  src="/Image/발받침대.png"  class="img-fluid card-img-top embed-responsive-item">
                     </div>
                     <div class="p-2">
                        <div class="badge badge-danger rounded-pill font-weight-normal float-right" style="background-color: rgb(135, 222, 150);">맛집</div>
                        <div style="clear: both;"> <a href="#" class="text-dark">MCM 장지갑</a></div>
                     </div>
                  </div>
               </div>
            </div> 

            </div>
         </div>


         <!-- 내돈내산 -->
         <div class="row py-3">
            <div class="col-md-12" id="review">
               <h7>내돈내산</h7>

               <div class="row">
                  <div class="col-xl-4 col-lg-4 col-md-6 mb-4"  style="margin-top: 5px;">
                     <div class="bg-white">
                        <div class="embed-responsive embed-responsive-4by3">
                           <img  src="/Image/발받침대.png"  class="img-fluid card-img-top embed-responsive-item">
                        </div>
                        <div class="p-2">
                           <div class="badge badge-danger rounded-pill font-weight-normal float-right" style="background-color: rgb(135, 222, 150);">가구</div>
                           <div style="clear: both;"> <a href="#" class="text-dark">MCM 장지갑</a></div>
                        </div>
                     </div>
                  </div>
                  <div class="col-xl-4 col-lg-4 col-md-6 mb-4"  style="margin-top: 5px;">
                     <div class="bg-white">
                        <div class="embed-responsive embed-responsive-4by3">
                           <img  src="/Image/발받침대.png"  class="img-fluid card-img-top embed-responsive-item">
                        </div>
                        <div class="p-2">
                           <div class="badge badge-danger rounded-pill font-weight-normal float-right" style="background-color: rgb(135, 222, 150);">생활용품</div>
                           <div style="clear: both;"> <a href="#" class="text-dark">MCM 장지갑</a></div>
                        </div>
                     </div>
                  </div>
                  <div class="col-xl-4 col-lg-4 col-md-6 mb-4"  style="margin-top: 5px;">
                     <div class="bg-white">
                        <div class="embed-responsive embed-responsive-4by3">
                           <img  src="/Image/발받침대.png"  class="img-fluid card-img-top embed-responsive-item">
                        </div>
                        <div class="p-2">
                           <div class="badge badge-danger rounded-pill font-weight-normal float-right" style="background-color: rgb(135, 222, 150);">기타</div>
                           <div style="clear: both;"> <a href="#" class="text-dark">MCM 장지갑</a></div>
                        </div>
                     </div>
                  </div>
               </div> 
               
            </div>
         </div>

      </div>
   </div>
</div>
	</main>

	<script>
		// 게시판 조회수 Top 5(ajax)
	
	</script>


	<jsp:include page="footer.jsp" />
</body>
</html>