
function validateDate(){

    var datetimepicker = document.getElementById("datetimepicker");
    var datetimepicker1 = document.getElementById("datetimepicker1");
    var dateTimeStart = datetimepicker.value.split(" ");
    var dateTimeEnd = datetimepicker1.value.split(" ");
    var splitDateStart = dateTimeStart[0].split(".");
    var splitDateEnd = dateTimeEnd[0].split(".");
    //var splitTimeStart = dateTimeStart[1].split(":");
    //var splitTimeEnd = dateTimeEnd[1].split(":");

    if(datetimepicker.value !== "" && datetimepicker1.value !== "")
    {
        if(splitDateStart[0] <= splitDateEnd[0] &&
            splitDateStart[1] <= splitDateEnd[1] &&
            splitDateStart[2] < splitDateEnd[2])
        {
            return true;
        }else
        {
            document.getElementById("message");
            message.innerHTML = "The start date should be before of the end date";
            return false;
        }
    }else
    {
        return false;
    }
}
