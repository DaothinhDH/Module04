<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
    <html>
    <head>
        <title>Calculator</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }

            h1 {
                color: #333;
            }

            form {
                margin-top: 20px;
                border: 1px solid #ccc;
                padding: 20px;
                width: 300px;
            }

            label {
                display: block;
                margin-bottom: 10px;
            }

            input[type="text"],
            select {
                width: 100%;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
</head>
<body>
<form action="hello-servlet" method="post">
    <label for="firstOperand">First operand:</label>
    <input type="text" id="firstOperand" name="firstOperand" required><br>

    <label for="operator">Operator:</label>
    <select id="operator" name="operator">
        <option value="1">+</option>
        <option value="2">-</option>
        <option value="3">*</option>
        <option value="4">/</option>
    </select><br>

    <label for="secondOperand">Second operand:</label>
    <input type="text" id="secondOperand" name="secondOperand" required><br>

    <input type="submit" value="Calculate">
</form>

</body>
</html>