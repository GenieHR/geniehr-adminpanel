<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HierarchyFrame.aspx.cs" Inherits="adminpanel.Org.HierarchyFrame" %>


<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
            <script type="text/javascript">

        var chart;
        var chartManIndex = -1;
        var selectedIndex, selection, data;

      $(document).ready(function () {
          google.charts.load('current', { packages: ["orgchart"] });
          google.charts.setOnLoadCallback(drawChart);

          
          loadOptions();

          $("#allEmpSelect").change(function () {
              selectedIndex = $("#allEmpSelect option:selected").val();

          });

      });

      var orgEmpJSON = [
          { "EmpId": "144", "Name": "Punya Swarup", "Email": "Punya.Swarup@gmail.com" },
          { "EmpId": "145", "Name": "Aakshi Garg", "Email": "Aakshi.Garg@gmail.com" },
          { "EmpId": "146", "Name": "Gurleen Kaur", "Email": "Gurleen.Kaur@gmail.com" },
          { "EmpId": "147", "Name": "Pooja Shrestha", "Email": "Pooja.Shrestha@gmail.com" },
          { "EmpId": "148", "Name": "Shashi Singh", "Email": "Shashi.Singh@gmail.com" },
          { "EmpId": "149", "Name": "Dimple Thakur", "Email": "Dimple.Thakur@gmail.com" },
          { "EmpId": "150", "Name": "Pooja Bharadwaj", "Email": "Pooja.Bharadwaj@gmail.com" },
          { "EmpId": "151", "Name": "Mandeep Singh", "Email": "Mandeep.Singh@gmail.com" },
          { "EmpId": "152", "Name": "Savita", "Email": "Savita@gmail.com" },
          { "EmpId": "153", "Name": "Seema Gandhi", "Email": "Seema.Gandhi@gmail.com" },
          { "EmpId": "154", "Name": "Sandeep Bajwa", "Email": "Sandeep.Bajwa@gmail.com" },

      ];

      var orgEmpArray = [];

      
      function drawChart() {

                data = new google.visualization.DataTable();
                data.addColumn('string', 'Name');
                data.addColumn('string', 'Manager');
                data.addColumn('string', 'Email');
                data.addColumn('number', 'thisIndex');

                data.addRows(orgEmpArray);
                
        chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
        chart.draw(data, { allowHtml: true });

        google.visualization.events.addListener(chart, 'select', function () {
            selection = chart.getSelection();
            var item = selection[0];

            chartManIndex = data.getFormattedValue(item.row, 3);
        });

      }

      function loadOptions() {
          
          var output = [];

          $.each(orgEmpJSON, function (i) {
              output.push('<option value="' + i + '">' + orgEmpJSON[i].Name + '</option>');
            });

          $("#allEmpSelect").html(output.join(''));

      }

      function addEmployee() {

          var chartEmpJSON = { "v": orgEmpJSON[selectedIndex].EmpId, "f": orgEmpJSON[selectedIndex].Name };

          var chartManJSON;

          if (orgEmpArray.length == 0) {
              chartManJSON = '';
          }
          else
          {
              chartManJSON = { "v": orgEmpJSON[chartManIndex].EmpId, "f": orgEmpJSON[chartManIndex].Name };
          }

          var input = [chartEmpJSON, chartManJSON, orgEmpJSON[selectedIndex].Email, parseInt(selectedIndex)];

          orgEmpArray.push(input);

          $("#allEmpSelect option[value=" + selectedIndex + "]").remove();

          drawChart();

          chart.setSelection(selection);

          selectedIndex = -1;
      }

      function remEmployee() {


          if (chart.getChildrenIndexes(selection[0].row).length == 0)
          {
              var empIndex = data.getFormattedValue(selection[0].row, 3);
              orgEmpArray.pop(empIndex);
              $("#allEmpSelect").append('<option value="' + empIndex + '">' + orgEmpJSON[empIndex].Name + '</option>');

              drawChart();
          }
          else
          {
              alert("Please remove all subordinates before you delete a manager.");
          }
      }

            </script>
    
    <title>Sample Org Chart</title>
</head>
<body style="background-color:white">
    <div id="chart_div" style="height:300px"></div>
    <hr />

    <select id="allEmpSelect" multiple="multiple" style="height:200px;width:190px">


    </select>

    <button onclick="addEmployee()">Add Employee</button>
    <button onclick="remEmployee()">Remove Employee</button>

</body>
</html>