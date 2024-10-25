<%@include file="lib/header.jsp" %>
<%@include file="lib/navbar.jsp" %>

<style>
    body, html {
  margin: 0;
  padding: 0;
  height: 100%;
}

.video-wrapper {
  position: relative;
  width: 100%;
  height: 0;
  padding-bottom: 56.25%; /* Aspect ratio 16:9 */
}

.youtube-video {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

</style>


<div class="video-wrapper">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/5WlCdiU9IzA?si=fffHPDkpGFztNiBH" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</div>


 <%@include file="lib/footer.jsp" %>