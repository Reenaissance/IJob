$(document).ready(function() {
    var chapterCount = 0;

    function search() {     //查询课程，从课程展示页面搜索 从课程查询结果页面搜索
        var course_name = $("#course_name").val()
        if ($("#course_name").val() != null) {
            window.location.href = "selectCourseByName?courseName=" + course_name
        }
    }
});