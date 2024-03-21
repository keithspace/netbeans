function validateForm() {
    var staffID = document.getElementById("adminID").value;
    var password = document.getElementById("password").value;

    if (staffID === "" || password === "") {
        alert("Both admin ID and password are required!");
        return false;
    }

    // Additional client-side validation if needed

    return true;
}
