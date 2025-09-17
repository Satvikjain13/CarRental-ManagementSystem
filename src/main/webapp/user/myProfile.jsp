<%@include file="usernavbar.jsp" %>

<!-- Signup Start -->
<div class="container-fluid py-5">
    <div class="container pt-5 pb-3">
        <h1 class="display-4 text-uppercase text-center mb-5">Your Profile</h1>
        <div class="row">
            <div class="col-lg-6 mb-2">
                <div class="px-5 bg-secondary d-flex align-items-center justify-content-between" style="height: 350px;">
                    <img class="img-fluid flex-shrink-0 ml-n5 w-50 mr-4" src="../img/banner-left.png"
                         alt="">
                    <div class="text-right">
                        <h3 class="text-uppercase text-light mb-3">Want to be drive?</h3>
                        <p class="mb-4">Then fill the all data and Enjoy them.</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-6 mb-2">
                <div class="contact-form bg-light mb-4" style="padding: 30px;">
                    <form action="../updateProfile" method="post">
                        
                        <div class="row">
                            <div class="col-6 form-group">
                                <input type="text" name="FullName" class="form-control p-4" value="<% out.println(FullName);%>">
                            </div>
                            
                            <div class="col-6 form-group">
                                <input type="text" name="ContactNo" class="form-control p-4" value="<% out.println(ContactNo);%>" maxlength="10">
                            </div>
                        </div>
                        <div class="row">                            
                            <div class="col-12 form-group">
                                <input type="email" name="emailid" class="form-control p-4" value="<% out.println(email);%>" readonly>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6 form-group">
                              <input type="text" name="Country" class="form-control p-4" value="<% out.println(Country);%>">
                            </div>

                            <div class="col-6 form-group">
                                <input type="text" name="City" class="form-control p-4" value="<% out.println(City);%>">
                            </div>
                        </div>
                        <div class="form-group">
                             <textarea name="Address" class="form-control py-3 px-4" rows="3"><% out.println(Address);%></textarea>
                        </div>

						<input type="hidden" name="id" value="<%=session.getAttribute("userId")%>" >
                        <div>
                            <button class="btn btn-primary py-3 px-5" type="submit">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Signup End -->

<!-- Vendor Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="owl-carousel vendor-carousel">
            <div class="bg-light p-4">
                <img src="../img/vendor-1.png" alt="">
            </div>
            <div class="bg-light p-4">
                <img src="../img/vendor-2.png" alt="">
            </div>
            <div class="bg-light p-4">
                <img src="../img/vendor-3.png" alt="">
            </div>
            <div class="bg-light p-4">
                <img src="../img/vendor-4.png" alt="">
            </div>
            <div class="bg-light p-4">
                <img src="../img/vendor-5.png" alt="">
            </div>
            <div class="bg-light p-4">
                <img src="../img/vendor-6.png" alt="">
            </div>
            <div class="bg-light p-4">
                <img src="../img/vendor-7.png" alt="">
            </div>
            <div class="bg-light p-4">
                <img src="../img/vendor-8.png" alt="">
            </div>
        </div>
    </div>
</div>
<!-- Vendor End -->

		
		
<%@include file="userfooter.jsp" %>