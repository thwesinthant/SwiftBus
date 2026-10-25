<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags"%>
<%@ include file="../fragments/navbar.jsp"%>

<c:set var="root" value="${pageContext.request.contextPath}"
    scope="request" />

<form action="${root}/postLogin" method="post"
    class="max-w-sm mx-auto bg-white p-6 rounded-lg shadow-md space-y-5 mt-32">

    <!-- CSRF Token -->
    <input type="hidden"
        name="${_csrf.parameterName}"
        value="${_csrf.token}" />

    <h2 class="text-xl font-semibold text-gray-800 text-center">
        Login to Your Account
    </h2>

    <!-- Email -->
    <div>
        <label for="email"
            class="block mb-2 text-sm font-medium text-gray-700">
            Email Address
        </label>
        <input type="email" id="email" name="email"
            placeholder="you@example.com"
            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500 text-sm"
            required>
    </div>

    <!-- Password -->
    <div>
        <label for="password"
            class="block mb-2 text-sm font-medium text-gray-700">
            Password
        </label>
        <input type="password" id="password" name="password"
            placeholder="********"
            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500 text-sm"
            required>
    </div>

    <!-- Remember Me + Forgot Password -->
    <div class="flex items-center justify-between">
        <label class="flex items-center text-sm text-gray-600">
            <input type="checkbox"
                class="w-4 h-4 mr-2 border-gray-300 rounded focus:ring-blue-500">
            Remember me
        </label>

        <a href="#"
            class="text-sm text-blue-600 hover:underline">
            Forgot password?
        </a>
    </div>

    <!-- Submit Button -->
    <button type="submit"
        class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2.5 rounded-lg transition">
        Login
    </button>

    <!-- Register Link -->
    <p class="text-sm text-center text-gray-600">
        Don't have an account?
        <a href="${root}/signup"
            class="text-blue-600 hover:underline">
            Sign Up
        </a>
    </p>
</form>
