function myFunction() {
        var x = document.getElementById("myInput").value;
        document.getElementById("demo").innerHTML = "Please guess a letter in the secret word:<br>";
        for (var i = 1; i <= x; i++) {
            var input = document.createElement("input");
            input.type = "text";
            input.name = "text" + i;
            input.id = "guess";
            input.required = true;
            input.placeholder = "Enter Name"
            document.getElementById("demo").appendChild(input).value;
        }
    }