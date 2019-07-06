<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sv" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function showForm(val) {
		if (val == "deposit") {
			document.getElementById("deposit").style.display = "block";
			document.getElementById("withdraw").style.display = "none";
			document.getElementById("otherac").style.display = "none";
			document.getElementById('date').value = Date();

			document.getElementById("amounts1").innerHTML = "";
			document.getElementById("amounts2").innerHTML = "";
			document.getElementById("amounts3").innerHTML = "";
		}
		if (val == "withdraw") {
			document.getElementById("deposit").style.display = "none";
			document.getElementById("withdraw").style.display = "block";
			document.getElementById("otherac").style.display = "none";
			document.getElementById('date1').value = Date();
			document.getElementById("amounts1").innerHTML = "";
			document.getElementById("amounts2").innerHTML = "";
			document.getElementById("amounts3").innerHTML = "";
		}
		if (val == "otherac") {
			document.getElementById("deposit").style.display = "none";
			document.getElementById("withdraw").style.display = "none";
			document.getElementById("otherac").style.display = "block";
			document.getElementById('date2').value = Date();
			document.getElementById("amounts1").innerHTML = "";
			document.getElementById("amounts2").innerHTML = "";
			document.getElementById("amounts3").innerHTML = "";
		}
	}
	var a = [ '', 'One ', 'Two ', 'Three ', 'Four ', 'Five ', 'Six ', 'Seven ',
			'Eight ', 'Nine ', 'Ten ', 'Eleven ', 'Twelve ', 'Thirteen ',
			'Fourteen ', 'Fifteen ', 'Sixteen ', 'Seventeen ', 'Eighteen ',
			'Nineteen ' ];
	var b = [ '', '', 'Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy',
			'Eighty', 'Ninety' ];

	function inWords(num) {
		if ((num = num.toString()).length > 9)
			return 'overflow';
		n = ('000000000' + num).substr(-9).match(
				/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
		if (!n)
			return;
		var str = '';
		str += (n[1] != 0) ? (a[Number(n[1])] || b[n[1][0]] + ' ' + a[n[1][1]])
				+ 'Crore ' : '';
		str += (n[2] != 0) ? (a[Number(n[2])] || b[n[2][0]] + ' ' + a[n[2][1]])
				+ 'Lakh ' : '';
		str += (n[3] != 0) ? (a[Number(n[3])] || b[n[3][0]] + ' ' + a[n[3][1]])
				+ 'Thousand ' : '';
		str += (n[4] != 0) ? (a[Number(n[4])] || b[n[4][0]] + ' ' + a[n[4][1]])
				+ 'Hundred ' : '';
		str += (n[5] != 0) ? ((str != '') ? 'and ' : '')
				+ (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]]) + 'Only '
				: '';
		document.getElementById("amounts1").innerHTML = str;
		document.getElementById("amounts2").innerHTML = str;
		document.getElementById("amounts3").innerHTML = str;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Make Your Transaction</title>
</head>
<body>
	<c:import url="header.jsp" />
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-4 col-sm-6">
					<div class="card">
						<div class="content">
							<div class="row">
								<div class="col-xs-5">
									<div class="icon-big icon-warning text-center">
										<img alt="" src="assets/img/faces/deposit.jpg">

									</div>
								</div>
								<div class="col-xs-7">
									<div class="numbers">
										<a href="#" onclick="showForm('deposit')">Deposit</a>
										<p>Add Amount To Your A/C</p>
									</div>
								</div>
							</div>
							<div class="footer">
								<hr />
								<div class="stats">
									<i class="ti-reload"></i> Your Can Deposit Upto 50,000 Cash.
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<div class="card">
						<div class="content">
							<div class="row">
								<div class="col-xs-5">
									<div class="icon-big icon-success text-center">
										<img alt="" src="assets/img/faces/withdrawal.jpg">
									</div>
								</div>
								<div class="col-xs-7">
									<div class="numbers">
										<a href="#" onclick="showForm('withdraw')">Withdrawal</a>
										<p>Reduce Amount From A/C</p>
									</div>
								</div>
							</div>
							<div class="footer">
								<hr />
								<div class="stats">
									<i class="ti-calendar"></i> Minimum Amount Can't Be Removed
									From Account.
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<div class="card">
						<div class="content">
							<div class="row">
								<div class="col-xs-5">
									<div class="icon-big icon-success text-center">
										<img alt="" src="assets/img/faces/otherbankac.jpg">
									</div>
								</div>
								<div class="col-xs-7">
									<div class="numbers">
										<a href="#" onclick="showForm('otherac')">Other Account</a>
										<p>Transfer Money To Other A/C.</p>
									</div>
								</div>
							</div>
							<div class="footer">
								<hr />
								<div class="stats">
									<i class="ti-calendar"></i> Amount Leaving Minimum Balance Can
									Be Transferred.
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<h3>
				<p class="text-danger">
					<c:out value="${msg }"></c:out>
			</h3>
			<div id="deposit" class="row" style="display: none;">
				<div class="col-lg-8 col-md-8">
					<div class="card">
						<div class="header">
							<h4 class="title">Enter the account no of owner</h4>
							<p class="category">Exceeding more than 50,000 should
								generate their Pancard to bank.</p>
						</div>
						<datalist id="data"> <c:forEach items="${list }"
							var="cus">
							<option
								value="<c:out value="${cus.getAccountNumber() }"></c:out>">
								<c:out value="${cus.getFname() }"></c:out>
								<c:out value="${cus.getLname() }"></c:out>
							</option>
						</c:forEach> </datalist>

						<div class="content">
							<sv:form method="post"
								action="${pageContext.request.contextPath }/MakeTransaction"
								modelAttribute="transaction">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>From Account Number:</label>
											<sv:input type="text" class="form-control border-input"
												placeholder="Sending Account Number" path="fromAccount"
												list="data" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Mode Of Payment</label><BR>
											<sv:select path="mode" class="btn btn-info btn-fill btn-wd"
												width="200">
												<sv:option value="cash">CASH</sv:option>
												<sv:option value="cheque">CHEQUE</sv:option>
											</sv:select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Transferred Date</label>
											<sv:input id="date" type="text"
												class="form-control border-input" path="date"
												disabled="true" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Amount</label>
											<sv:input type="text" class="form-control border-input"
												placeholder="Amount in Number" value="" path="amount"
												onkeyup="inWords(this.value)" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<br>
											<p class="text-danger" id="amounts1"></p>
										</div>
									</div>
								</div>
								<sv:input type="hidden" value="Deposit" path="method" />
								<sv:input type="hidden" value="${username}" path="transferredBy" />
								<div class="text-center">
									<input type="submit" value="Make Transaction"
										class="btn btn-info btn-fill btn-wd">
								</div>
							</sv:form>
							<div class="footer">
								<div class="chart-legend">
									<i class="fa fa-circle text-info"></i> Amount <i
										class="fa fa-circle text-danger"></i> Will Be<i
										class="fa fa-circle text-warning"></i> Credited Immediately.
								</div>
								<hr>
								<div class="stats">Have A Nice Day.</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="withdraw" class="row" style="display: none;">
				<div class="col-lg-8 col-md-8">
					<div class="card">
						<div class="header">
							<h4 class="title">Enter the account no of owner</h4>
							<p class="category">Exceeding more than 50,000 should
								generate their Pancard to bank.</p>
						</div>
						<div class="content">
							<sv:form method="post"
								action="${pageContext.request.contextPath }/MakeTransaction"
								modelAttribute="transaction">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>From Account Number:</label>
											<sv:input type="text" class="form-control border-input"
												placeholder="Sending Account Number" path="fromAccount"
												list="data" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Mode Of Payment</label><BR>
											<sv:select path="mode" class="btn btn-info btn-fill btn-wd"
												width="200">
												<sv:option value="cash">CASH</sv:option>
												<sv:option value="demand draft">DEMAND DRAFT</sv:option>
											</sv:select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Transferred Date</label>
											<sv:input id="date1" type="text"
												class="form-control border-input" path="date"
												disabled="true" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Amount</label>
											<sv:input type="text" class="form-control border-input"
												placeholder="Amount in Number" value="" path="amount"
												onkeyup="inWords(this.value)" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<br>
											<p class="text-danger" id="amounts2"></p>
										</div>
									</div>
								</div>
								<sv:input type="hidden" value="Withdraw" path="method" />
								<sv:input type="hidden" value="${username}" path="transferredBy" />
								<div class="text-center">
									<input type="submit" value="Make Transaction"
										class="btn btn-info btn-fill btn-wd">
								</div>
							</sv:form>
							<div class="footer">
								<div class="chart-legend">
									<i class="fa fa-circle text-info"></i> Amount <i
										class="fa fa-circle text-danger"></i> Will Be<i
										class="fa fa-circle text-warning"></i> Debited Immediately.
								</div>
								<hr>
								<div class="stats">Have A Nice Day.</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="otherac" class="row" style="display: none;">
				<div class="col-lg-8 col-md-8">
					<div class="card">
						<div class="header">
							<h4 class="title">Enter the account no of owner</h4>
							<p class="category">Can Make Any Amount Of Transaction</p>
						</div>
						<div class="content">
							<sv:form method="post"
								action="${pageContext.request.contextPath }/MakeTransaction"
								modelAttribute="transaction">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>From Account Number:</label>
											<sv:input type="text" class="form-control border-input"
												placeholder="Sending Account Number" path="fromAccount"
												list="data" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>To Account Number</label>
											<sv:input type="text" class="form-control border-input"
												placeholder="Receiving Account Number" path="toAccount"
												list="data" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Mode Of Payment</label><BR>
											<sv:select path="mode" class="btn btn-info btn-fill btn-wd"
												width="200">
												<sv:option value="imps">IMPS</sv:option>
												<sv:option value="neft">NEFT</sv:option>
											</sv:select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Transferred Date</label>
											<sv:input id="date2" type="text"
												class="form-control border-input" path="date"
												disabled="true" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Amount</label>
											<sv:input type="text" class="form-control border-input"
												placeholder="Amount in Number" value="" path="amount"
												onkeyup="inWords(this.value)" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<br>
											<p class="text-danger" id="amounts3"></p>
										</div>
									</div>
								</div>
								<sv:input type="hidden" value="Other Bank Account" path="method" />
								<sv:input type="hidden" value="${username}" path="transferredBy" />
								<div class="text-center">
									<input type="submit" value="Make Transaction"
										class="btn btn-info btn-fill btn-wd">
								</div>
							</sv:form>
							<div class="footer">
								<div class="chart-legend">
									<i class="fa fa-circle text-info"></i> Amount <i
										class="fa fa-circle text-danger"></i> Will Be<i
										class="fa fa-circle text-warning"></i> Transferred
									Immediately.
								</div>
								<hr>
								<div class="stats">Have A Nice Day.</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="footer.jsp" />
</body>
</html>
