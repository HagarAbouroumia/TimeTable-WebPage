let counter = 0;

function checks(response) {
    const len = response.length;
    if (len - counter > 0 && counter + 5 <= len) {
        get_response(response, counter, counter + 5);
        counter = counter + 5;
    } else if (len - counter > 0) {
        get_response(response, counter, len);
        counter = len;
    }
    $("#hide").click(function () {
        document.getElementById("output").innerHTML = "";
        document.getElementById("txtHint").innerHTML = "";
        document.getElementById("search").value = "";
        document.getElementById("end").innerHTML = "";
        response = "";
        counter = 0;
    });
}


function load_more(q) {
    console.log(counter);
    let flag = 1;
    if (q !== '')
        flag = 0
    $.ajax({
        url: 'config.php',
        type: 'get',
        dataType: 'JSON',
        data: {q: q, flag: flag},
        success: function (response) {
            checks(response);
        }
    })

    $("#hide").click(function () {
        counter = 0;
        document.getElementById("output").innerHTML = "";
        document.getElementById("txtHint").innerHTML = "";
        document.getElementById("search").value = "";
        document.getElementById("end").innerHTML = "";

    });
}

function search(q) {
    console.log(q)
    if (q !== "") {
        counter = 0;
        len = -1;
        $.ajax({
            url: 'config.php',
            type: 'get',
            dataType: 'JSON',
            data: {q: q, flag: '0'},
            success: function (response) {
                if (response.length === 0) {
                    document.getElementById("output").innerHTML = "No Results";
                    document.getElementById("txtHint").innerHTML = "";
                } else {
                    document.getElementById("output").innerHTML = "";
                    document.getElementById("txtHint").innerHTML = "";
                    checks(response);
                }
            }
        })
    } else {
        document.getElementById("txtHint").innerHTML = "";
    }

    $("#hide").click(function () {
        document.getElementById("output").innerHTML = "";
        document.getElementById("txtHint").innerHTML = "";
        document.getElementById("search").value = "";
        counter = 0;


    });

}


function get_response(response, start, end) {
    if (counter === 0)
        document.getElementById("txtHint").innerHTML = "";
    console.log(start, end);

    for (var i = start; i < end; i++) {
        var course_name = response[i].course_name;
        var course_description = response[i].course_description;
        var department_name = response[i].department_name;
        var professor_name = response[i].professor_name;

        var tr_str = '<tr>' +
            '<td> ' + (i + 1) + ') ' + course_name + '</td>' +
            '<td>' + course_description + '</td>' +
            '<td>' + department_name + '</td>' +
            '<td>' + professor_name + '</td>' +
            '</tr>';
        $('#tableee tbody').append(tr_str);
        if (end === response.length)
            document.getElementById("end").innerHTML = "End of Results";
    }
}
