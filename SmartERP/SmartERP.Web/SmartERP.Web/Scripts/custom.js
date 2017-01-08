var AppHost = location.protocol + '//' + location.hostname + (location.port ? ':' + location.port : '');
$(document).ready(function () {

    if ($("#security_IsIpRestricted").val() != null && $("#security_IsIpRestricted").val() != undefined && $("#security_IsIpRestricted").val() != '') {
        if ($("#security_IsIpRestricted").is(":checked")) {
            $('#security_IpAddress').removeAttr("readonly");
        }
        else {
            $('#security_IpAddress').attr("readonly", "readonly");
        }
    }
   
    $(document).on('click', '#security_IsIpRestricted', function (event) {
        if ($(this).is(":checked")) {
            $('#security_IpAddress').removeAttr("readonly");
        }
        else {
            $('#security_IpAddress').attr("readonly", "readonly");
        }
    });
    

    $(document).on('click', '.onoffswitch-checkbox', function (event) {
        if ($(this).is(":checked")) {
            $(this).val("true");
        }
        else {
            $(this).val("false");
        }
    });

    $('.onoffswitch input[type="hidden"]').remove();

    if ($("#MenuCode").val() != null && $("#MenuCode").val() != undefined && $("#MenuCode").val() != '') {
        PopulateMenusForRole();
    }

    if ($("#BranchCodes").val() != null && $("#BranchCodes").val() != undefined && $("#BranchCodes").val() != '') {
        PopulateBranchesForRole();
    }

    $('#remoteAccessUsers').on("change", function(event){
        $("#security_RemoteAccess").val($(this).val());
    });

    $('#roleUsers').on("change", function (event) {
        $("#UserCode").val($(this).val());
    });

    $('.company-selection-dd').select2({
        selectOnClose: false,
        ajax: {
            url: AppHost + "/json/companies.json",
            dataType: 'json',
            delay: 250,
            multiple: true,
            data: function (params) {
                return {
                    q: params.term, // search term
                    page: params.page
                };
            },
            processResults: function (data, params) {
                // parse the results into the format expected by Select2
                // since we are using custom formatting functions we do not need to
                // alter the remote JSON data, except to indicate that infinite
                // scrolling can be used
                params.page = params.page || 1;

                return {
                    results: data.companies,
                    pagination: {
                        more: (params.page * 30) < data.total_count
                    }
                };
            },
            cache: true
        },
        escapeMarkup: function (markup) { return markup; },
        templateResult: formatCompanyResult
    });

    $('.divsion-selection-dd').select2({
        selectOnClose: false,
        ajax: {
            url: AppHost + "/json/companies.json",
            dataType: 'json',
            delay: 250,
            multiple: true,
            data: function (params) {
                return {
                    q: params.term, // search term
                    page: params.page
                };
            },
            processResults: function (data, params) {
                // parse the results into the format expected by Select2
                // since we are using custom formatting functions we do not need to
                // alter the remote JSON data, except to indicate that infinite
                // scrolling can be used
                params.page = params.page || 1;

                return {
                    results: data.companies,
                    pagination: {
                        more: (params.page * 30) < data.total_count
                    }
                };
            },
            cache: true
        },
        escapeMarkup: function (markup) { return markup; },
        templateResult: formatCompanyResult
    });

    $('.sbu-selection-dd').select2({
        selectOnClose: false,
        ajax: {
            url: AppHost + "/json/companies.json",
            dataType: 'json',
            delay: 250,
            multiple: true,
            data: function (params) {
                return {
                    q: params.term, // search term
                    page: params.page
                };
            },
            processResults: function (data, params) {
                // parse the results into the format expected by Select2
                // since we are using custom formatting functions we do not need to
                // alter the remote JSON data, except to indicate that infinite
                // scrolling can be used
                params.page = params.page || 1;

                return {
                    results: data.companies,
                    pagination: {
                        more: (params.page * 30) < data.total_count
                    }
                };
            },
            cache: true
        },
        escapeMarkup: function (markup) { return markup; },
        templateResult: formatCompanyResult
    });

    $('.zone-selection-dd').select2({
        selectOnClose: false,
        ajax: {
            url: AppHost + "/json/companies.json",
            dataType: 'json',
            delay: 250,
            multiple: true,
            data: function (params) {
                return {
                    q: params.term, // search term
                    page: params.page
                };
            },
            processResults: function (data, params) {
                // parse the results into the format expected by Select2
                // since we are using custom formatting functions we do not need to
                // alter the remote JSON data, except to indicate that infinite
                // scrolling can be used
                params.page = params.page || 1;

                return {
                    results: data.companies,
                    pagination: {
                        more: (params.page * 30) < data.total_count
                    }
                };
            },
            cache: true
        },
        escapeMarkup: function (markup) { return markup; },
        templateResult: formatCompanyResult
    });

    $('.nested-checkbox input[type="checkbox"]').on('click', function () {
        $(this).closest('.dd-item').find('.dd-list input[type="checkbox"]').prop('checked', this.checked);
    });

    //Clear and Disable the unSelected dropdown
    $('input.change-select').on('change', function () {
        var container = $(this).closest('.form-group');
        var unSelected = $(container).find('select:not([data-type=' + this.value + '])');

        $(unSelected).attr('disabled', true);
        $(unSelected).select2('val', '');
        $(unSelected).find('option').remove();
        $(container).find('select[data-type=' + this.value + ']').attr('disabled', false);
    });

    // $('#privacyPolicyForm').bootstrapValidator({
    //     message: 'This value is not valid',
    //     icon: {
    //         valid: 'glyphicon glyphicon-ok',
    //         invalid: 'glyphicon glyphicon-remove',
    //         validating: 'glyphicon glyphicon-refresh'
    //     },
    //     fields: {
    //         passwordExpiryDays: {
    //             validators: {
    //                   notEmpty: {
    //                       message: 'The first name is required and cannot be empty'
    //                   }
    //               }
    //         }
    //     }
    // });
});

function formatCompanyResult(company) {
    if (company.loading) return company.text;

    var display = "<div class='select2-company-result'><div class='company-name'>" + company.name + "</div><div class='note'>" + company.country + "</div></div>"

    return display;
}

function formatRepoSelection(repo) {
    return repo.name + '/' + repo.country;
}

function saveMenusForRole() {
    var MenuCode = '';
    $('#selectedMenusList').text('');
    $("#MenuCode").val('');
    $('.role-based-menu-selection input[type="checkbox"]:checked').each(function (index, menu) {
        $('#selectedMenusList').append($(menu).data('text') + ", ");
        MenuCode += menu.value + ",";
    });
    $("#MenuCode").val(MenuCode);
    $('#selectMenusModal').modal('hide')
}

function saveBranchesForRole() {
    var BranchCodes = '';
    $('#selectedBranchList').text('');
    $("#BranchCodes").val('');
    $('.role-based-branch-selection input[type="checkbox"]:checked').each(function (index, menu) {
        $('#selectedBranchList').append($(menu).data('text') + ", ");
        BranchCodes += menu.value + ",";
    });
    $("#BranchCodes").val(BranchCodes);
    $('#selectBranchesModal').modal('hide')
}

function PopulateMenusForRole() {
    var MenuCode = $("#MenuCode").val();
    $('#selectedMenusList').text('');
    $('.role-based-menu-selection input[type="checkbox"]').each(function (index, menu) {
        if (MenuCode.indexOf(menu.value) >= 0) {
            $(this).prop('checked', true)
            $('#selectedMenusList').append($(menu).data('text') + ", ");
        }
    });
}

function PopulateBranchesForRole() {
    var BranchCodes = $("#BranchCodes").val();
    $('#selectedBranchList').text('');
    $('.role-based-branch-selection input[type="checkbox"]').each(function (index, menu) {
        if (BranchCodes.indexOf(menu.value) >= 0) {
            $(this).prop('checked', true)
            $('#selectedBranchList').append($(menu).data('text') + ", ");
        }
    });
}

function showImage(input) {
    if (input.files && input.files[0]) {
        var filerdr = new FileReader();
        filerdr.onload = function (e) {
            $('#user_Photo').attr('src', e.target.result);
        }
        filerdr.readAsDataURL(input.files[0]);
    }
}


