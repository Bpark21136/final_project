<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Zipzom - Realtor</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- jQuery -->
<script src="./resources/plugins/jquery/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="./resources/plugins/fontawesome-free/css/all.min.css">
  <!-- jQuery UI -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="./resources/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <!-- Select2 -->
  <link rel="stylesheet" href="./resources/plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="./resources/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="./resources/css/adminlte.min.css">
  <script type="text/javascript">
  $(document).ready(function() {
	 select();
	  
	 $('#pfsAdd').on('click',function() {
		var param = $('#add').serialize();
		var seq = new Array(3);
		seq[0] = $('#seqpfs1').val();
		seq[1] = $('#seqpfs2').val();
		seq[2] = $('#seqpfs3').val();
		//console.log(seq[0]);
		add(param,seq);
	 });
	  
	  
	  
	  
	  
  });
  
  var select = function() {
      $.ajax({
          url: 'pfs_compareList.json',
          type: 'get',
          dataType: 'json',
          success: function( json ) {
        	  var address = '';
        	  var option = '';
        	  $.each( json.data, function( index, item ) {
             	 address = item.si + " " + item.gu + " " + item.dong + " " + item.bunji + " " +item.hNumber;
             	 option = "<option value='"+item.seqPfs+"'>"+address+"</option>";
             	$('#select2').append(option);
              });
        	  
          },
          error: function( e ) {
             alert( '?????? ?????? ' + e );
          }
       })
  }
  // select ??? ????????? ??????
  
  var add = function(param,seq) {
	  $.ajax({
          url: 'pfs_compareView.json',
          type: 'post',
          data: param,
          dataType: 'json',
          success: function( json ) {
        	  $.each( json.data, function( index, item ) {
					if(seq[0] == 0) {
						//console.log(item.area1);
						$('#seqpfs1').val(item.seqPfs);
						$('#address1').text(item.address);
						$('#contractType1').text(item.contractType);
						$('#budget1').html('????????? : ' + item.budget1 + '???<br> ????????? : ' + item.budget2 + '???<br> ?????? : ' + item.budget3 + '???');
						$('#area11').val(item.area1);
						$('#area21').val(item.area2);
						$('#area31').val(item.area3);
						$('#room1').text('????????? : ' + item.room + '???');
						$('#bathroom1').text('????????? : '+ item.bathroom + '???' );
						$('#hNumber1').text('?????? ??? : ' + item.numberOfHousehold);
						$('#direction1').text('??? : ' + item.direction );
						$('#heatingSystem1').text('???????????? : ' + item.heatingSystem);
						$('#parking1').text('???????????? : ' + item.parking);
						$('#bYear1').text('???????????? : ' + item.bYear + '???');
						$('#elevator1').text('????????? : ' + item.elevator);
						$('#context1').text(item.context);
					} else if(seq[0] != 0 && seq[1] == 0){
						$('#seqpfs2').val(item.seqPfs);
						$('#address2').text(item.address);
						$('#contractType2').text(item.contractType);
						$('#budget2').html('????????? : ' + item.budget1 + '???<br> ????????? : ' + item.budget2 + '???<br> ?????? : ' + item.budget3 + '???');
						$('#area12').val(item.area1);
						$('#area22').val(item.area2);
						$('#area32').val(item.area3);
						$('#room2').text('????????? : ' + item.room + '???');
						$('#bathroom2').text('????????? : '+ item.bathroom + '???' );
						$('#hNumber2').text('?????? ??? : ' + item.numberOfHousehold);
						$('#direction2').text('??? : ' + item.direction );
						$('#heatingSystem2').text('???????????? : ' + item.heatingSystem);
						$('#parking2').text('???????????? : ' + item.parking);
						$('#bYear2').text('???????????? : ' + item.bYear + '???');
						$('#elevator2').text('????????? : ' + item.elevator);
						$('#context2').text(item.context);
					} else if(seq[1] != 0 && seq[2] == 0) {
						$('#seqpfs3').val(item.seqPfs);
						$('#address3').text(item.address);
						$('#contractType3').text(item.contractType);
						$('#budget3').html('????????? : ' + item.budget1 + '???<br> ????????? : ' + item.budget2 + '???<br> ?????? : ' + item.budget3 + '???');
						$('#area13').val(item.area1);
						$('#area23').val(item.area2);
						$('#area33').val(item.area3);
						$('#room3').text('????????? : ' + item.room + '???');
						$('#bathroom3').text('????????? : '+ item.bathroom + '???' );
						$('#hNumber3').text('?????? ??? : ' + item.numberOfHousehold);
						$('#direction3').text('??? : ' + item.direction );
						$('#heatingSystem3').text('???????????? : ' + item.heatingSystem);
						$('#parking3').text('???????????? : ' + item.parking);
						$('#bYear3').text('???????????? : ' + item.bYear + '???');
						$('#elevator3').text('????????? : ' + item.elevator);
						$('#context3').text(item.context);
					} else {
						alert('3???????????? ?????????. ????????????????????????')
					}
               });
          },
          error: function( e ) {
             alert( '?????? ?????? ' + e );
          }
       })
  }
  </script>
</head>
<body class="w3-content" style="max-width:1700px">
<!-- Site wrapper -->
<div class="wrapper">
<!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="./resources/index3.html" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>


  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">

   <!-- sidebar include -->
    <jsp:include page = "./sidebar.jsp" flush = "false"/>
    
  </aside>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">?????? ??????</li>
              <li class="breadcrumb-item active">?????? ??????</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
         <!-- ?????? ?????? -->
        <div class="card-header">
          <h3 class="card-title">?????? ??????</h3> 
        </div>
        <!-- ?????? ?????? -->
        <div class="card-body" >
           <div class="form-group row">
              <section class="col-md-6">
              <form name="add" id="add" method="post">
               <div class="input-group">
               
               <!-- ?????? ?????? -->
               <select class="form-control select2" id="select2" name="seqPfs" style="margin-top:10px;">
                  <option value="none">?????????, ????????? ??????????????????.</option>
                  <!-- <option>??????????????? ????????? ????????????6??? 66-4 (?????????)</option> -->
               </select>
               </div>
               </form>
            </section>
            <section class="col-md-6">      
               <div class="input-group">      
                  <button type="button" id="pfsAdd" class="btn btn-outline-primary" value="????????????" style="width: 100px; margin-top:5px;">
                       ????????????
                  </button>
                                         
               </div>
            </section>
              
         </div>
         
         <form action="./consulting_map.do" method="post" name="wfrm">
         <input type="hidden" name=seqPfs1 id="seqpfs1" value="0" />
         <input type="hidden" name=seqPfs2 id="seqpfs2" value="0" />
         <input type="hidden" name=seqPfs3 id="seqpfs3" value="0" />
         <div class="form-group">
            <table class="table table-bordered" >
            
               <!-- ?????? ?????? -->
               <tr class="top">
                  <th class="cell head">??????</th>
                  <td class="cell">
                  <!-- <input type="text" id="address1" name="address1" value="" style="width: 100%; margin-top: 5px; border: none;" readonly /> -->
                  <textarea rows="2" cols="1" id="address1" name="address1" style="width: 100%; margin-top: 5px; border: none;" readonly></textarea>
                  </td>
                  <td class="cell">
                  <!-- <input type="text" id="address2" name="address2" value="" style="width: 100%; margin-top: 5px; border: none" readonly/> -->
                  <textarea rows="2" cols="1" id="address2" name="address2" style="width: 100%; margin-top: 5px; border: none;" readonly></textarea>
                  </td>
                  <td class="cell">
                  <!-- <input type="text" id="address3" name="address3" value="" style="width: 100%; margin-top: 5px; border: none" readonly/> -->
                  <textarea rows="2" cols="1" id="address3" name="address3" style="width: 100%; margin-top: 5px; border: none;" readonly></textarea>
                  </td>
               </tr>
               
               <!-- ?????? ?????? ?????? -->
               <tr>
                  <th class="cell head">????????????</th>
                  <td id="contractType1" class="cell">
                  
                  </td>
                  <td id="contractType2" class="cell">
                  
                  </td>
                  <td id="contractType3" class="cell">
                 
                  </td>
               </tr>
               
               <!-- ?????? ?????? ?????? -->
               <tr>
                  <th class="cell head">????????????</th>
                  <td id="budget1" class="cell">
                  
                  </td>
                  <td id="budget2" class="cell">
                  
                  </td>
                  <td id="budget3" class="cell">
                  
                  </td>
               </tr>
               
               <!-- ?????? ?????? ?????? -->
               <tr>
                  <th class="cell head">????????????</th>
                  <td class="cell">
                     <section>
                        <div class="input-group mb-3">
                           <span style="margin-right: 10px; margin-top: 10px;">????????????</span> 
                           <input type="text" name="area1" id="area11" class="form-control" style="width: 100%; margin-top: 5px; border: none; text-align:right;" readonly>
                           <div class="input-group-append">
                              <span class="input-group-text" style="margin-right: 10px; margin-top: 5px; text-align:right;">m??</span>
                           </div>
                        </div>
                        
                        <div class="input-group mb-3">
                           <span style="margin-right: 10px; margin-top: 10px;">????????????</span> 
                           <input type="text" name="area2" id="area21" class="form-control" style="width: 100%; margin-top: 5px; border: none; text-align:right;" readonly>
                           <div class="input-group-append">
                              <span class="input-group-text" style="margin-right: 10px; margin-top: 5px;">m??</span>
                           </div>
                        </div>
                        
                        <div class="input-group mb-3">
                           <span style="margin-right: 10px; margin-top: 10px;">????????????</span> 
                           <input type="text" name="area3" id="area31" class="form-control" style="width: 100%; margin-top: 5px; border: none; text-align:right;" readonly>
                           <div class="input-group-append">
                              <span class="input-group-text" style="margin-right: 10px; margin-top: 5px;">m??</span>
                           </div>
                        </div>
                     </section>
                  </td>
                  <td class="cell">
                     <section>
                        <div class="input-group mb-3">
                           <span style="margin-right: 10px; margin-top: 10px;">????????????</span> 
                           <input type="text" name="area1" id="area12" class="form-control" style="width: 100%; margin-top: 5px; border: none; text-align:right;" readonly>
                           <div class="input-group-append">
                              <span class="input-group-text" style="margin-right: 10px; margin-top: 5px;">m??</span>
                           </div>
                        </div>
                        
                        <div class="input-group mb-3">
                           <span style="margin-right: 10px; margin-top: 10px;">????????????</span> 
                           <input type="text" name="area2" id="area22" class="form-control" style="width: 100%; margin-top: 5px; border: none; text-align:right;" readonly>
                           <div class="input-group-append">
                              <span class="input-group-text" style="margin-right: 10px; margin-top: 5px;">m??</span>
                           </div>
                        </div>
                        
                        <div class="input-group mb-3">
                           <span style="margin-right: 10px; margin-top: 10px;">????????????</span> 
                           <input type="text" name="area3" id="area32" class="form-control" style="width: 100%; margin-top: 5px; border: none; text-align:right;" readonly>
                           <div class="input-group-append">
                              <span class="input-group-text" style="margin-right: 10px; margin-top: 5px;">m??</span>
                           </div>
                        </div>
                     </section>
                  </td>
                  <td class="cell">
                     <section>
                        <div class="input-group mb-3">
                           <span style="margin-right: 10px; margin-top: 10px;">????????????</span> 
                           <input type="text" name="area1" id="area13" class="form-control" style="width: 100%; margin-top: 5px; border: none; text-align:right;" readonly>
                           <div class="input-group-append">
                              <span class="input-group-text" style="margin-right: 10px; margin-top: 5px;">m??</span>
                           </div>
                        </div>
                        
                        <div class="input-group mb-3">
                           <span style="margin-right: 10px; margin-top: 10px;">????????????</span> 
                           <input type="text" name="area1" id="area23" class="form-control" style="width: 100%; margin-top: 5px; border: none; text-align:right;" readonly>
                           <div class="input-group-append">
                              <span class="input-group-text" style="margin-right: 10px; margin-top: 5px;">m??</span>
                           </div>
                        </div>
                        
                        <div class="input-group mb-3">
                           <span style="margin-right: 10px; margin-top: 10px;">????????????</span> 
                           <input type="text" name="area1" id="area33" class="form-control" style="width: 100%; margin-top: 5px; border: none; text-align:right;" readonly>
                           <div class="input-group-append">
                              <span class="input-group-text" style="margin-right: 10px; margin-top: 5px;">m??</span>
                           </div>
                        </div>
                     </section>
                  </td>
               </tr>
               
               
               <!-- ?????? ?????? ?????? -->
               <tr>
                  <th class="cell head">????????????</th>
                  <td class="cell">
                     <div class="input-group mb-3">
                        <span id="room1" style="margin-right: 10px; margin-top: 10px;">?????????</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="bathroom1" style="margin-right: 10px; margin-top: 10px;">?????????</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="hNumber1" style="margin-right: 10px; margin-top: 10px;">?????????</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="direction1" style="margin-right: 10px; margin-top: 10px;">???</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="heatingSystem1" style="margin-right: 10px; margin-top: 10px;">????????????</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="parking1" style="margin-right: 10px; margin-top: 10px;">????????????</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="bYear1" style="margin-right: 10px; margin-top: 10px;">????????????</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="elevator1"  style="margin-right: 10px; margin-top: 10px;">?????????</span> 
                     </div>
                  </td>
                  <td class="cell">
                    <div class="input-group mb-3">
                        <span id="room2" style="margin-right: 10px; margin-top: 10px;">?????????</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="bathroom2" style="margin-right: 10px; margin-top: 10px;">?????????</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="hNumber2" style="margin-right: 10px; margin-top: 10px;">?????????</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="direction2" style="margin-right: 10px; margin-top: 10px;">???</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="heatingSystem2" style="margin-right: 10px; margin-top: 10px;">????????????</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="parking2" style="margin-right: 10px; margin-top: 10px;">????????????</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="bYear2" style="margin-right: 10px; margin-top: 10px;">????????????</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="elevator2"  style="margin-right: 10px; margin-top: 10px;">?????????</span> 
                     </div>
                  </td>
                  <td class="cell">
                     <div class="input-group mb-3">
                        <span id="room3" style="margin-right: 10px; margin-top: 10px;">?????????</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="bathroom3" style="margin-right: 10px; margin-top: 10px;">?????????</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="hNumber3" style="margin-right: 10px; margin-top: 10px;">?????????</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="direction3" style="margin-right: 10px; margin-top: 10px;">???</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="heatingSystem3" style="margin-right: 10px; margin-top: 10px;">????????????</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="parking3" style="margin-right: 10px; margin-top: 10px;">????????????</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="bYear3" style="margin-right: 10px; margin-top: 10px;">????????????</span> 
                     </div>
                     <div class="input-group mb-3">
                        <span id="elevator3"  style="margin-right: 10px; margin-top: 10px;">?????????</span> 
                     </div>
                  </td>
               </tr>
               
               
               <!-- ?????? ?????? -->
               <tr>
                  <th class="cell head">??? ???</th>
                  <td id="context1" class="cell">
                  
                  </td>
                  <td id="context2" class="cell">
                  
                  </td>
                  <td id="context3" class="cell">
                  
                  </td>
               </tr>
               
            </table>
         </div>
         <div>      
            <input class="btn btn-primary" type="submit" value="?????? ?????? ??????" id="wbtn" />               
         </div>
         </form>
        </div>
      </div>
    </section>

    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->



<!-- Bootstrap 4 -->
<script src="./resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Select2 -->
<script src="./resources/plugins/select2/js/select2.full.min.js"></script>
<!-- bs-custom-file-input -->
<script src="./resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>

<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Initialize Select2 Elements
    $('.select2bs4').select2({
      theme: 'bootstrap4'
    })


  })
</script>
</body>
</html>