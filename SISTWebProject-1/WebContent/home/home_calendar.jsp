<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Date date = new Date();
%>
<section class="post-slider-area calendar">
	<div class="container box_1170">
		<div class="row justify-content-center">
			<div class="col-lg-10">
				<div class="owl-carousel active-post-carusel">
					<div class="month">
						<div><h2>1월</h2></div>
					
						<div>
						<%
							for(int i=1; i<=31; i++){
							%>
								<input type="button" value="<%= i %>"/>
							<%
							}
						%>
						</div>
						
						<div class="panel-group">
							<div class="panel panel-success">
								<div class="panel-heading">축제1</div>
								<div class="panel-body">내용...</div>
							</div>
							<div class="panel panel-info">
								<div class="panel-heading">축제2</div>
								<div class="panel-body">내용...</div>
							</div>
							<div class="panel panel-warning">
								<div class="panel-heading">축제3</div>
								<div class="panel-body">내용...</div>
							</div>
						</div>
						
						<div></div>
					</div>
					
					<div class="month">
						<div><h2>2월</h2></div>
					
						<div>
						<%
							for(int i=1; i<=29; i++){
							%>
								<input type="button" value="<%= i %>"/>
							<%
							}
						%>
						</div>
						
						<div></div>
					</div>
					
					<div class="month">
						<div><h2>3월</h2></div>
					
						<div>
						<%
							for(int i=1; i<=31; i++){
							%>
								<input type="button" value="<%= i %>"/>
							<%
							}
						%>
						</div>
						
						<div></div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</section>