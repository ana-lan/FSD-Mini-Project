<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(isset($_POST['submit2']))
{
	$pid=intval($_GET['pkgid']);
	$useremail=$_SESSION['login'];
	$num=$_POST['number'];
	$num2=$_POST['number2'];

	$fromdate=$_POST['fromdate'];
	$todate=$_POST['todate'];
	$comment=$_POST['comment'];
	$status=0;
	

	$location=$_POST['location'];
	$cost=0;

	$sub="SELECT AvailableBookings FROM tbltourpackages where PackageId=:pid";
	$query=$dbh->prepare($sub);
	$query->bindParam(':pid',$pid,PDO::PARAM_INT);
	$query->execute();
	$results=$query->fetch();

	if(intval($results[0])<($num+$num2))
	{
		echo "<script>alert('Not enough slots available')</script>";
	}
	else
	{
		$sql="INSERT INTO tblbooking(PackageId,UserEmail,FromDate,ToDate,Start_location,Comment,status,NoOfAdults,NoOfChildren) VALUES(:pid,:useremail,:fromdate,:todate,:location,:comment,:status,:ppl,:children)";
		$query = $dbh->prepare($sql);
		$query->bindParam(':pid',$pid,PDO::PARAM_STR);
		$query->bindParam(':useremail',$useremail,PDO::PARAM_STR);
		$query->bindParam(':fromdate',$fromdate,PDO::PARAM_STR);
		$query->bindParam(':todate',$todate,PDO::PARAM_STR);
		$query->bindParam(':location',$location,PDO::PARAM_STR);
		$query->bindParam(':comment',$comment,PDO::PARAM_STR);
		$query->bindParam(':status',$status,PDO::PARAM_STR);
		$query->bindParam(':ppl',$num,PDO::PARAM_STR);
		$query->bindParam(':children',$num2,PDO::PARAM_STR);
		$query->execute();
		$lastInsertId = $dbh->lastInsertId();

		$updated_avail=$results[0]-intval($num)-intval($num2);

		$updater="UPDATE tbltourpackages set AvailableBookings=:updated_value where PackageId=:pid;";
		
		$upquery=$dbh->prepare($updater);
		$upquery->bindParam(':updated_value',$updated_avail,PDO::PARAM_INT);
		$upquery->bindParam(':pid',$pid,PDO::PARAM_STR);
		$upquery->execute();

		if($lastInsertId)
		{
			echo '<script>alert("Booked Scuccessfully . Thank you")</script>';
		}
		else 
		{
			echo '<script>alert("Something Went Wrong. Please try again")</script>';
		}
	}
}
?>
<!doctype html>
<html lang="en-gb" class="no-js">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<title>My Travel - Package details</title>
	<meta name="description" content="Traveller">
	<meta name="author" content="WebThemez">

	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<!-- <link href="assets/css/bootstrap.css" rel='stylesheet' type='text/css' /> -->
	<link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen" />
	<link rel="stylesheet" href="js/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
	<link rel="stylesheet" type="text/css" href="css/da-slider.css" />
	<!-- Owl Carousel Assets -->
	<link href="js/owl-carousel/owl.carousel.css" rel="stylesheet">
	<link rel="stylesheet" href="css/styles.css" />
	<!-- Font Awesome -->
	<!--animate-->
	<link href="assets/css/animate.css" rel="stylesheet" type="text/css" media="all">
	<link href="font/css/font-awesome.min.css" rel="stylesheet">
</head>

<body>
	<header class="header">
		<?php if($_SESSION['login'])
		{?>
			<div class="top-header">
				<div class="container">
					<ul class="tp-hd-lft wow fadeInLeft animated" data-wow-delay=".5s">
						<li class="hm"><a href="index.php"><i class="fa fa-home"></i></a></li>
						<li class="prnt"><a href="profile.php">My Profile</a></li>
						<li class="prnt"><a href="change_password.php">Change Password</a></li>
						<li class="prnt"><a href="tour_history.php">My Tour History</a></li>
					</ul>
					<ul class="tp-hd-rgt wow fadeInRight animated" data-wow-delay=".5s"> 
						<li class="tol">Welcome :</li>        
						<li class="sig"><?php echo htmlentities($_SESSION['login']);?></li> 
						<li class="sigi"><a href="logout.php" >/ Logout</a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
			</div>
			<?php 
		} else 
		{
			?>
			<div class="top-header">
				<div class="container">
					<ul class="tp-hd-lft wow fadeInLeft animated" data-wow-delay=".5s">
						<li class="hm"><a href="admin/index.php">Admin Login</a></li>
					</ul>
					<ul class="tp-hd-rgt wow fadeInRight animated" data-wow-delay=".5s"> 
						<li class="tol">Toll Number : 1234568790</li>        
						<li class="sig"><a href="#" data-toggle="modal" data-target="#myModal" >Sign Up</a></li> 
						<li class="sigi"><a href="#" data-toggle="modal" data-target="#myModal4" >&nbsp; Sign In</a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
			</div>
			<?php 
		}?>
		<div class="container">
			<nav class="navbar navbar-inverse" role="navigation">
				<div class="navbar-header adeInDown animated animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInDown;">
					<a href="#" class="navbar-brand scroll-top logo"><b>Traveller</b></a>
					<button type="button" id="nav-toggle" class="navbar-toggle" data-toggle="collapse" data-target="#main-nav">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<!--/.navbar-header-->
				<div id="main-nav" class="collapse navbar-collapse adeInDown animated animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInDown;">
					<ul class="nav navbar-nav" id="mainNav">
						<li ><a href="index.php" class="scroll-link">Home</a></li>
						<li><a href="index.php" class="scroll-link">About Us</a></li>
						<li><a href="index.php" class="scroll-link">Packages</a></li>
						<li><a href="index.php" class="scroll-link">Gallery</a></li>
						<li><a href="index.php" class="scroll-link">Contact Us</a></li>
					</ul>
				</div>
				<!--/.navbar-collapse-->
			</nav>
			<!--/.navbar-->
		</div>
		<!--/.container-->
	</header>
	<!--/.header-->
	<div id="#top"></div>
	<section id="home">
		<div class="banner-container" style="height: 300px;">
			<!-- <img src="images/banner-bg.jpg" alt="banner" /> -->
			<div class="container banner-content">
				<div id="da-slider" class="da-slider">
					<div class="da-slide">
						<h2>Tour Packages</h2>
						<p>Get your plans right away.. enjoy!!!</p>
						<div class="da-img"></div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--Package-->
	<section id="packages" class="secPad">
		<div class="container">
			<div class="heading text-center">
				<!-- Heading -->
				<h2>Package Details</h2>
				<p>We offer you a diverse range of packaged tours with various kinds of itineraries, specifically drawn out to meet your specific requirements</p>
			</div>
			<!--- selectroom ---->
			<div class="selectroom">
				<div class="container"> 
					<?php if($error){?><div class="errorWrap"><strong>ERROR</strong>:<?php echo htmlentities($error); ?> </div><?php } 
					else if($msg){?><div class="succWrap"><strong>SUCCESS</strong>:<?php echo htmlentities($msg); ?> </div><?php }?>
					<?php 
					$pid=intval($_GET['pkgid']);
					$sql = "SELECT * from tbltourpackages where PackageId=:pid";
					$query = $dbh->prepare($sql);
					$query -> bindParam(':pid', $pid, PDO::PARAM_STR);
					$query->execute();
					$results=$query->fetchAll(PDO::FETCH_OBJ);
					$cnt=1;
					if($query->rowCount() > 0)
					{
						foreach($results as $result)
						{ 
							?>

							<div class="selectroom_top">
								<div class="col-md-4 selectroom_left wow fadeInLeft animated" data-wow-delay=".5s">
									<img src="admin/pacakgeimages/<?php echo htmlentities($result->PackageImage);?>" class="img-responsive" alt="">
								</div>
								<div class="col-md-8 selectroom_right wow fadeInRight animated" data-wow-delay=".5s">
									<h2><?php echo htmlentities($result->PackageName);?></h2>
									<p class="dow">#PKG-<?php echo htmlentities($result->PackageId);?></p>
									<p><b>Package Type :</b> <?php echo htmlentities($result->PackageType);?></p>
									<p><b>Destination :</b> <?php echo htmlentities($result->PackageLocation);?></p>
									<p><b>Features</b> <?php echo htmlentities($result->PackageFetures);?></p>

									<div class="clearfix"></div>
									<div class="grand">
										<p>Calculated Total</p>
										<?php

									if(isset($_POST['cost'])){

										$stmt = $dbh->prepare("SELECT PackagePrice from tbltourpackages where PackageId=:pid");
										$stmt->execute([':pid' => $pid]); 
										$user = $stmt->fetch();
										$base=intval($user[0]);
										$fromdate=strtotime($_POST['fromdate']);
										$todate=strtotime($_POST['todate']);
										$num=intval($_POST['number']);
										$num2=intval($_POST['number2']);
										$days=($todate-$fromdate)/86400;
										
										$pid=intval($_GET['pkgid']);
										$sub="SELECT AvailableBookings FROM tbltourpackages where PackageId=:pid";
										$query=$dbh->prepare($sub);
										$query->bindParam(':pid',$pid,PDO::PARAM_INT);
										$query->execute();
										$results=$query->fetch();
										
										if(intval($results[0])<($num+$num2))
										{
											echo "<h3>Not enough slots available</h3>";
										}
										else{
											$location=$_POST['location'];
											$cost = ($base*$days*$num*$num2/2);

											if($location=="delhi")
												$cost+=5000;
											
											$pid=intval($_GET['pkgid']);
											$useremail=$_SESSION['login'];
											$num=$_POST['number'];
											$num2=$_POST['number2'];

											$sql2="INSERT INTO requests(UserEmail,RequestDate,PackageId,NoOfkids,NoOfadults) VALUES(:useremail,now(),:pid,:ppl,:children)";
											$query2 = $dbh->prepare($sql2);
											$query2->bindParam(':useremail',$useremail,PDO::PARAM_STR);
											$query2->bindParam(':pid',$pid,PDO::PARAM_INT);
											$query2->bindParam(':ppl',$num,PDO::PARAM_STR);
											$query2->bindParam(':children',$num2,PDO::PARAM_STR);
											$query2->execute();

											echo "<h3>$cost</h3>" ; 
											echo "<script>alert('cost is $cost')</script>" ; 
										}
									}
										?>
										
									</div>
								</div>
								<h3>Package Details</h3>
								<p style="padding-top: 1%"><?php echo htmlentities($result->PackageDetails);?> </p> 
								<div class="clearfix"></div>
							</div>
							<form name="book" method="post">
								
								<div class="selectroom_top">
									
									<div class="selectroom-info animated wow fadeInUp animated" data-wow-duration="1200ms" data-wow-delay="500ms" style="visibility: visible; animation-duration: 1200ms; animation-delay: 500ms; animation-name: fadeInUp; margin-top: -50px">
									
										<div class="ban-bottom">
											<label class="inputLabel">Start</label>
											
												<input type="radio" class="dropdown-item" name="location" value="delhi">New Delhi<br/></input>
												<input type="radio" class="dropdown-item" name="location" value="mumbai">Mumbai<br/></input>
											<br/>
											<div class=" col-md-6 mr-2 ">
												<label class="inputLabel">From</label>
												<input class="form-control" id="datepicker" type="date" placeholder="dd-mm-yyyy"  name="fromdate" required="">
											</div>
											<div class=" col-md-6">
												<label class="inputLabel">To</label>
												<input class="form-control" id="datepicker1" type="date" placeholder="dd-mm-yyyy" name="todate" required="">
											</div>
											<br>
											<div class=" col-md-6">
												<label class="inputLabel">No Of Adults</label>
												<input class="form-control" id="numberqw" type="number" placeholder="No Of Adults" name="number" required="">
											</div>

											<div class=" col-md-6">
												<label class="inputLabel">No Of Children</label>
												<input class="form-control" id="numberqw" type="number" placeholder="No Of Children" name="number2" required="">
											</div>

												<li class="sigi" align="center" style="margin-top: 1%">
													<button type= "submit" name="cost" class="btn-primary btn" > Calculate Cost</button>
												</li>
												
										</div>
										<ul>
											

											<li class="spe">
												<label class="inputLabel">Comment</label>
												<textarea  class="form-control" rows="4" cols="4" type="text" name="comment"></textarea>
											</li>
											<?php if($_SESSION['login'])
											{?>
												<li class="spe" align="center">
													<button type="submit" name="submit2" class="btn-primary btn">Book</button>
												</li>
												<?php 
											} else {?>
												<li class="sigi" align="center" style="margin-top: 1%">
													<a href="#" data-toggle="modal" data-target="#myModal4"  class="btn-primary btn" > Book</a>
												</li>
												<?php
											} ?>
											<div class="clearfix"></div>
										</ul>
									</div>
								</div>
							</form>
							<?php 
						}
					} ?>
				</div>
			</div>
			<!--- /selectroom ---->
		</div>
	</section>
	<a href="#top" class="topHome"><i class="fa fa-chevron-up fa-2x"></i></a>
	<?php include('includes/footer.php');?>
	<!-- signup -->
	<?php include('includes/signup.php');?>     
	<!-- //signu -->
	<!-- signin -->
	<?php include('includes/signin.php');?>     
	<!-- //signin -->
	<script src="js/modernizr-latest.js"></script>
	<script src="js/jquery-1.8.2.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/jquery.isotope.min.js" type="text/javascript"></script>
	<script src="js/fancybox/jquery.fancybox.pack.js" type="text/javascript"></script>
	<script src="js/jquery.nav.js" type="text/javascript"></script>
	<script src="js/jquery.cslider.js" type="text/javascript"></script>
	<script src="contact/contact_me.js"></script>
	<script src="js/custom.js" type="text/javascript"></script>
	<script src="js/owl-carousel/owl.carousel.js"></script>
</body>
</html>
