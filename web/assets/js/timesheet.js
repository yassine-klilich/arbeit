$('#user-filter').multiselect({
    buttonWidth: '200px',
    enableFiltering: true,
})
$('#company-filter').multiselect({
    buttonWidth: '200px',
    enableFiltering: true,
})
const dateFilter = flatpickr("#date-filter", {
    defaultDate: new Date()
});

function applyFilter() {
    const selectedUsers = $('#user-filter').val();
    const selectedCompanies = $('#company-filter').val();
    const dateFilter = new Date($('#date-filter').val());
    const day = dateFilter.getDate()
    const month = dateFilter.getMonth() + 1
    const formatedDate = `${dateFilter.getFullYear()}-${(month.toString().length == 1) ? '0' + month : month}-${(day.toString().length == 1) ? '0' + day : day}`
    const filterData = {
        users: (selectedUsers.length == 0) ? -1 : selectedUsers.toString(),
        companies: (selectedCompanies.length == 0) ? -1 : selectedCompanies.toString(),
        date: formatedDate,
    }

    $.ajax({
        type: 'POST',
        url: "/arbeit-j2ee/getTimeSheet",
        data: filterData,
        dataType: "json",
        success: function(data) {
            const timesheetTable = document.getElementById("timesheet-table")
            let tbody = timesheetTable.tBodies[0]
            if(tbody == null) {
                tbody = timesheetTable.createTBody()
            }
            tbody.innerHTML = "";
            for (let i = 0; i < data.length; i++) {
                const item = data[i];
                const trElement = document.createElement("tr")
                trElement.innerHTML = `
                    <td>
                        <span class="font-weight-bold">${item['fullName']}</span>
                    </td>
                    <td>${item['companyName']}</td>
                    <td>${item['hours']}</td>
                `
                tbody.appendChild(trElement)
            }
          }
    });

}