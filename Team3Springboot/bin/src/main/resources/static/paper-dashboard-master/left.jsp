<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="" class="simple-text logo-mini">
          <!-- <div class="logo-image-small">
            <img src="./assets/img/logo-small.png">
          </div> -->
          <!-- <p>CT</p> -->
        </a>
        <a href="" class="simple-text logo-normal">
          Your Logo
          <!-- <div class="logo-image-big">
            <img src="../assets/img/logo-big.png">
          </div> -->
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="active "><a
						href="${pageContext.request.contextPath}/actMain/list"> <i
							class="nc-icon nc-bank"></i>
							<p>活動簡表</p>
					</a></li>
          <li>
            <a href="javascript:;">
              <i class="nc-icon nc-diamond"></i>
              <p>Second Item</p>
            </a>
          </li>
          <li>
            <a href="javascript:;">
              <i class="nc-icon nc-pin-3"></i>
              <p>Third Item</p>
            </a>
          </li>
        </ul>
      </div>
    </div>