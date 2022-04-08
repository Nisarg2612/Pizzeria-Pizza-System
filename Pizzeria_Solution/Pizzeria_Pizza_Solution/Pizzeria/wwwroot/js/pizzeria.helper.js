(function (pizzeria) {
    (function (helper) {
        helper.getData = function (url, params) {
            var deferred = $.Deferred();

            try {
                $.ajax({
                    type: "GET",
                    url: url,
                    data: JSON.stringify(params),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (response) {
                        if (response != null) {
                            switch (response.responseType) {
                                case 0:
                                    console.error(response["caughtException"]);
                                    deferred.resolve(null);
                                    break;
                                case 1:
                                    deferred.resolve(response);
                                    break;
                            }
                        }
                    },
                    error: function (xhr) {
                        console.error(xhr);
                    }
                });
            }
            catch (ex) {
                console.error(ex);
                deferred.resolve(null);
            }

            return deferred.promise();
        };

        helper.postData = function (url, params) {
            var deferred = $.Deferred();

            try {
                $.ajax({
                    type: "POST",
                    url: url,
                    data: JSON.stringify(params),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (response) {
                        if (response != null) {
                            switch (response.responseType) {
                                case 0:
                                    console.error(response["caughtException"]);
                                    deferred.resolve(null);
                                    break;
                                case 1:
                                    deferred.resolve(response);
                                    break;
                            }
                        }
                    },
                    error: function (xhr) {
                        console.error(xhr);
                    }
                });
            }
            catch (ex) {
                console.error(ex);
                deferred.resolve(null);
            }

            return deferred.promise();
        };

        helper.getDropdownList = function (mode, dropdownId) {
            var html = "<option>Select</option>";

            helper.getData("/Admin/GetDropdownList?mode=" + mode, {}).then(function (data) {
                if (data) {
                    console.log(data);
                    for (var i = 0; i < data["resultSet"].length; i++) {
                        html += '<option value="' + data["resultSet"][i]["value"] + '">' +
                            data["resultSet"][i]["name"] +
                            '</option > ';
                    }
                    $(dropdownId).html(html);
                }
            });
        };

        helper.pager = function (totalCount, pageSize, currentPage) {
            currentPage = currentPage != null ? currentPage : 1;
            currentPage = parseInt(currentPage);
            var dblPageCount = totalCount / pageSize;
            var pageCount = parseInt(Math.ceil(dblPageCount));
            var pages = [];

            if (pageCount === 1) {
                pages.push({ text: 1, value: 1, enabled: 1 !== currentPage });
                return pages;
            }

            pages.push({ text: "<i class='fa fa-angle-double-left'></i>", value: 1, enabled: currentPage > 1 }); //   FIRST
            if (currentPage !== 1) {
                pages.push({ text: "<i class='fa fa-angle-left'></i>", value: currentPage - 1, enabled: true }); // PREV
            }

            var pagesToShow = 4;
            var minPage = Math.max(1, currentPage - (pagesToShow / 2));
            var maxPage = Math.min(pageCount, minPage + pagesToShow);

            for (var i = minPage; i <= maxPage; i++) {
                pages.push({ text: i, value: i, enabled: i !== currentPage });
            }

            if (currentPage !== pageCount) {
                pages.push({ text: "<i class='fa fa-angle-right'></i>", value: currentPage + 1, enabled: true }); // NEXT
            }

            pages.push({ text: "<i class='fa fa-angle-double-right'></i>", value: pageCount, enabled: currentPage < pageCount }); // LAST

            return pages;
        }

        helper.addToLocalCart = function (pizza) {
            var localCartItems = [];
            localCartItems = sessionStorage.getItem("localCartItems");

            localCartItems.push(pizza);
            sessionStorage.setItem(localCartItems);
        };
    })(pizzeria.helper = pizzeria.helper || {});
})(window.pizzeria = window.pizzeria || {});