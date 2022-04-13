<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->

      <!-- search form (Optional) -->
     
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <!-- Optionally, you can add icons to the links -->
        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>입고</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/imp/impdatacreate">입고정보생성</a></li>
            <li><a href="/imp/impcomplete">입고처리</a></li>
          </ul>
        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>출고</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/exp/expdatacreate">출고정보생성</a></li>
            <li><a href="/exp/exppickchoice">피킹할당</a></li>
            <li><a href="/exp/exppickdo">피킹</a>
            <li><a href="/exp/expcomplete">출고</a></li>
          </ul>
          <li><a href="/inventory/inventory"><i class="fa fa-link"></i> <span>재고정보</span></a></li>
          <li><a href="/cominfo/cominfo"><i class="fa fa-link"></i> <span>거래처정보</span></a></li>
          <li><a href="/iteminfo/list"><i class="fa fa-link"></i> <span>제품정보</span></a></li>
          <li><a href="/usertable/adduser"><i class="fa fa-link"></i> <span>사용자추가</span></a></li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>