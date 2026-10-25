<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags"%>
<%@ include file="../fragments/navbar.jsp" %>

<c:set var="root" value="${pageContext.request.contextPath}" scope="request" />

<main class="loginForm">
	<h3>Sign Up</h3>

	<c:if test="${message != null}">
		<div class="alert alert-info">
			<i class="bi-info-circle"></i> ${message}
		</div>
	</c:if>

	<sf:form action="${root}/signup" modelAttribute="form" method="post"
			class="max-w-sm mx-auto bg-white p-6 rounded-lg shadow-md space-y-5 mt-32">

		  <!-- CSRF Protection -->
	    <input type="hidden"
	           name="${_csrf.parameterName}"
	           value="${_csrf.token}" />

		<app:form-group label="Full Name" >
			<sf:input path="name" type="text" placeholder="Enter Full Name"
				class="form-control w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500 text-sm"
			 />
			<sf:errors path="name" cssClass="text-danger" />
		</app:form-group>

		<app:form-group label="Phone Number" >
			<sf:input path="phone" type="text" placeholder="09xxxxxxxxx"
				class="form-control w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500 text-sm" />
			<sf:errors path="phone" cssClass="text-danger" />
		</app:form-group>

		<app:form-group label="Email Address" >
			<sf:input path="email" type="email" placeholder="you@example.com"
				class="form-control w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500 text-sm" />
			<sf:errors path="email" cssClass="text-danger" />
		</app:form-group>
		
		<app:form-group label="NRC Region" >
			<sf:select path="nrcRegion" class="form-select form-control w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500 text-sm">
				<sf:option value="1" label="1/" />
				<sf:option value="2" label="2/" />
				<sf:option value="3" label="3/" />
				<sf:option value="4" label="4/" />
				<sf:option value="5" label="5/" />
				<sf:option value="6" label="6/" />
				<sf:option value="7" label="7/" />
				<sf:option value="8" label="8/" />
				<sf:option value="9" label="9/" />
				<sf:option value="10" label="10/" />
				<sf:option value="11" label="11/" />
				<sf:option value="12" label="12/" />
				<sf:option value="13" label="13/" />
				<sf:option value="14" label="14/" />
			</sf:select>
			<sf:errors path="nrcRegion"  />
		</app:form-group>

		<app:form-group label="NRC Township">
			<sf:select path="nrcTownship" class="form-select form-control w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500 text-sm">
				<sf:option value="BaBaNya" label="BaBaNya" />
				<sf:option value="BaKaNa" label="BaKaNa" />
				<sf:option value="BaLaNa" label="BaLaNa" />
				<sf:option value="BaMaNa" label="BaMaNa" />
				<sf:option value="DaGaMa" label="DaGaMa" />
				<sf:option value="DaPaNa" label="DaPaNa" />
				<sf:option value="DaThaNa" label="DaThaNa" />
				<sf:option value="HaPaNa" label="HaPaNa" />
				<sf:option value="KaHtaNa" label="KaHtaNa" />
				<sf:option value="KaKaNa" label="KaKaNa" />
				<sf:option value="KaLaNa" label="KaLaNa" />
				<sf:option value="KaMaNa" label="KaMaNa" />
				<sf:option value="KaNaNa" label="KaNaNa" />
				<sf:option value="KaPaNa" label="KaPaNa" />
				<sf:option value="KaThaNa" label="KaThaNa" />
				<sf:option value="KaTaNa" label="KaTaNa" />
				<sf:option value="KhaMaNa" label="KhaMaNa" />
				<sf:option value="KhaNaNa" label="KhaNaNa" />
				<sf:option value="KhaPaNa" label="KhaPaNa" />
				<sf:option value="KhaYaNa" label="KhaYaNa" />
				<sf:option value="LaGaNa" label="LaGaNa" />
				<sf:option value="LaKaNa" label="LaKaNa" />
				<sf:option value="LaMaNa" label="LaMaNa" />
				<sf:option value="LaThaNa" label="LaThaNa" />
				<sf:option value="MaAuNa" label="MaAuNa" />
				<sf:option value="MaBaNa" label="MaBaNa" />
				<sf:option value="MaGaDa" label="MaGaDa" />
				<sf:option value="MaGaNa" label="MaGaNa" />
				<sf:option value="MaKaNa" label="MaKaNa" />
				<sf:option value="MaLaNa" label="MaLaNa" />
				<sf:option value="MaMaNa" label="MaMaNa" />
				<sf:option value="MaNaNa" label="MaNaNa" />
				<sf:option value="MaTaNa" label="MaTaNa" />
				<sf:option value="MaThaNa" label="MaThaNa" />
				<sf:option value="NaAhNa" label="NaAhNa" />
				<sf:option value="NaBaNa" label="NaBaNa" />
				<sf:option value="NaDaNa" label="NaDaNa" />
				<sf:option value="NaHtaNa" label="NaHtaNa" />
				<sf:option value="NaKaNa" label="NaKaNa" />
				<sf:option value="NaMaNa" label="NaMaNa" />
				<sf:option value="NaTaLa" label="NaTaLa" />
				<sf:option value="NaTaNa" label="NaTaNa" />
				<sf:option value="NaThaNa" label="NaThaNa" />
				<sf:option value="NaYaNa" label="NaYaNa" />
				<sf:option value="NgaPhaNa" label="NgaPhaNa" />
				<sf:option value="NgaThaNa" label="NgaThaNa" />
				<sf:option value="PaAhNa" label="PaAhNa" />
				<sf:option value="PaBaNa" label="PaBaNa" />
				<sf:option value="PaGaNa" label="PaGaNa" />
				<sf:option value="PaKaNa" label="PaKaNa" />
				<sf:option value="PaLaNa" label="PaLaNa" />
				<sf:option value="PaThaNa" label="PaThaNa" />
				<sf:option value="SaKaNa" label="SaKaNa" />
				<sf:option value="SaLaNa" label="SaLaNa" />
				<sf:option value="TaKaNa" label="TaKaNa" />
				<sf:option value="TaTaNa" label="TaTaNa" />
				<sf:option value="TaThaNa" label="TaThaNa" />
				<sf:option value="TaYaNa" label="TaYaNa" />
				<sf:option value="ThaGaNa" label="ThaGaNa" />
				<sf:option value="ThaKaNa" label="ThaKaNa" />
				<sf:option value="ThaTaNa" label="ThaTaNa" />
				<sf:option value="ThaYaNa" label="ThaYaNa" />
				<sf:option value="WaLaNa" label="WaLaNa" />
				<sf:option value="YaBaNa" label="YaBaNa" />
				<sf:option value="YaKaNa" label="YaKaNa" />
				<sf:option value="YaMaNa" label="YaMaNa" />
				<sf:option value="YaNaNa" label="YaNaNa" />
				<sf:option value="YaThaNa" label="YaThaNa" />
			</sf:select>
			<sf:errors path="nrcTownship" cssClass="text-danger" />
		</app:form-group>

		<app:form-group label="NRC Type" >
			<sf:select path="nrcType" class="form-select form-control w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500 text-sm">
				<sf:option value="N" label="(N) Myanmar citizen" />
				<sf:option value="E" label="(E) Associate citizen" />
				<sf:option value="P" label="(P) Naturalized citizen" />
				<sf:option value="Y" label="(Y) Foreign registration card holder" />
				<sf:option value="S" label="(S) Stateless" />
				<sf:option value="T" label="(T) Temporary" />
				<sf:option value="V" label="(V) Visa holder" />
				<sf:option value="C" label="(C) Certificate holder" />
				<sf:option value="AC" label="(AC) Associated citizen" />
				<sf:option value="NA" label="(NA) Not available/other" />
			</sf:select>
			<sf:errors path="nrcType" cssClass="text-danger" />
		</app:form-group>

		<app:form-group label="NRC Number" >
			<sf:input path="nrcNumber" type="text" placeholder="Enter NRC Number"
				class="form-control form-control w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500 text-sm" />
			<sf:errors path="nrcNumber"  />
		</app:form-group>

		<app:form-group label="Password">
			<sf:password path="password" placeholder="Enter Password"
				class="form-control form-control w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500 text-sm" />
			<sf:errors path="password" cssClass="text-danger" />
		</app:form-group>

		<app:form-group label="Repeat Password" >
			<sf:password path="repeatPassword" placeholder="Repeat Password"
				class="form-control form-control w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500 text-sm" />
			<sf:errors path="repeatPassword" cssClass="text-danger" />
		</app:form-group>

		<div>
			
			<p class="text-sm text-center text-gray-600 mb-3">
		Do you have an account? <i
				class="bi-unlock"></i><a href="${root}/signin"
			class="text-blue-600 hover:underline">Login</a>
		</p>

			<button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2.5 rounded-lg transition">
				<i class="bi-person-plus"></i> Register
			</button>
		</div>
		
	
	</sf:form>
</main>
</body>
</html>