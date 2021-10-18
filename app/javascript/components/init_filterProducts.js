(function ($) {
  var methods = {
    init: function (options) {
      var o = $.extend(
        {
          items: 1,
          itemsOnPage: 1,
          pages: 0,
          displayedPages: 5,
          edges: 2,
          currentPage: 1,
          hrefTextPrefix: "#page-",
          hrefTextSuffix: "",
          prevText: "Prev",
          nextText: "Next",
          ellipseText: "&hellip;",
          cssStyle: "light-theme",
          labelMap: [],
          selectOnClick: true,
          onPageClick: function (pageNumber, event) {
            // Callback triggered when a page is clicked
            // Page number is given as an optional parameter
          },
          onInit: function () {
            // Callback triggered immediately after initialization
          },
        },
        options || {}
      );

      var self = this;

      o.pages = o.pages
        ? o.pages
        : Math.ceil(o.items / o.itemsOnPage)
        ? Math.ceil(o.items / o.itemsOnPage)
        : 1;
      o.currentPage = o.currentPage - 1;
      o.halfDisplayed = o.displayedPages / 2;

      this.each(function () {
        self.addClass(o.cssStyle + " simple-pagination").data("pagination", o);
        methods._draw.call(self);
      });

      o.onInit();

      return this;
    },

    selectPage: function (page) {
      methods._selectPage.call(this, page - 1);
      return this;
    },

    prevPage: function () {
      var o = this.data("pagination");
      if (o.currentPage > 0) {
        methods._selectPage.call(this, o.currentPage - 1);
      }
      return this;
    },

    nextPage: function () {
      var o = this.data("pagination");
      if (o.currentPage < o.pages - 1) {
        methods._selectPage.call(this, o.currentPage + 1);
      }
      return this;
    },

    getPagesCount: function () {
      return this.data("pagination").pages;
    },

    getCurrentPage: function () {
      return this.data("pagination").currentPage + 1;
    },

    destroy: function () {
      this.empty();
      return this;
    },

    drawPage: function (page) {
      var o = this.data("pagination");
      o.currentPage = page - 1;
      this.data("pagination", o);
      methods._draw.call(this);
      return this;
    },

    redraw: function () {
      methods._draw.call(this);
      return this;
    },

    disable: function () {
      var o = this.data("pagination");
      o.disabled = true;
      this.data("pagination", o);
      methods._draw.call(this);
      return this;
    },

    enable: function () {
      var o = this.data("pagination");
      o.disabled = false;
      this.data("pagination", o);
      methods._draw.call(this);
      return this;
    },

    updateItems: function (newItems) {
      var o = this.data("pagination");
      o.items = newItems;
      o.pages = methods._getPages(o);
      this.data("pagination", o);
      methods._draw.call(this);
    },

    updateItemsOnPage: function (itemsOnPage) {
      var o = this.data("pagination");
      o.itemsOnPage = itemsOnPage;
      o.pages = methods._getPages(o);
      this.data("pagination", o);
      methods._selectPage.call(this, 0);
      return this;
    },

    _draw: function () {
      var o = this.data("pagination"),
        interval = methods._getInterval(o),
        i,
        tagName;

      methods.destroy.call(this);

      tagName =
        typeof this.prop === "function"
          ? this.prop("tagName")
          : this.attr("tagName");

      var $panel = tagName === "UL" ? this : $("<ul></ul>").appendTo(this);

      // Generate Prev link
      if (o.prevText) {
        methods._appendItem.call(this, o.currentPage - 1, {
          text: o.prevText,
          classes: "prev",
        });
      }

      // Generate start edges
      if (interval.start > 0 && o.edges > 0) {
        var end = Math.min(o.edges, interval.start);
        for (i = 0; i < end; i++) {
          methods._appendItem.call(this, i);
        }
        if (o.edges < interval.start && interval.start - o.edges != 1) {
          $panel.append(
            '<li class="disabled"><span class="ellipse">' +
              o.ellipseText +
              "</span></li>"
          );
        } else if (interval.start - o.edges == 1) {
          methods._appendItem.call(this, o.edges);
        }
      }

      // Generate interval links
      for (i = interval.start; i < interval.end; i++) {
        methods._appendItem.call(this, i);
      }

      // Generate end edges
      if (interval.end < o.pages && o.edges > 0) {
        if (
          o.pages - o.edges > interval.end &&
          o.pages - o.edges - interval.end != 1
        ) {
          $panel.append(
            '<li class="disabled"><span class="ellipse">' +
              o.ellipseText +
              "</span></li>"
          );
        } else if (o.pages - o.edges - interval.end == 1) {
          methods._appendItem.call(this, interval.end++);
        }
        var begin = Math.max(o.pages - o.edges, interval.end);
        for (i = begin; i < o.pages; i++) {
          methods._appendItem.call(this, i);
        }
      }

      // Generate Next link
      if (o.nextText) {
        methods._appendItem.call(this, o.currentPage + 1, {
          text: o.nextText,
          classes: "next",
        });
      }
    },

    _getPages: function (o) {
      var pages = Math.ceil(o.items / o.itemsOnPage);
      return pages || 1;
    },

    _getInterval: function (o) {
      return {
        start: Math.ceil(
          o.currentPage > o.halfDisplayed
            ? Math.max(
                Math.min(
                  o.currentPage - o.halfDisplayed,
                  o.pages - o.displayedPages
                ),
                0
              )
            : 0
        ),
        end: Math.ceil(
          o.currentPage > o.halfDisplayed
            ? Math.min(o.currentPage + o.halfDisplayed, o.pages)
            : Math.min(o.displayedPages, o.pages)
        ),
      };
    },

    _appendItem: function (pageIndex, opts) {
      var self = this,
        options,
        $link,
        o = self.data("pagination"),
        $linkWrapper = $("<li></li>"),
        $ul = self.find("ul");

      pageIndex =
        pageIndex < 0 ? 0 : pageIndex < o.pages ? pageIndex : o.pages - 1;

      options = {
        text: pageIndex + 1,
        classes: "",
      };

      if (o.labelMap.length && o.labelMap[pageIndex]) {
        options.text = o.labelMap[pageIndex];
      }

      options = $.extend(options, opts || {});

      if (pageIndex == o.currentPage || o.disabled) {
        if (o.disabled) {
          $linkWrapper.addClass("disabled");
        } else {
          $linkWrapper.addClass("active");
        }
        $link = $('<span class="current">' + options.text + "</span>");
      } else {
        $link = $(
          '<a href="' +
            o.hrefTextPrefix +
            (pageIndex + 1) +
            o.hrefTextSuffix +
            '" class="page-link">' +
            options.text +
            "</a>"
        );
        $link.click(function (event) {
          return methods._selectPage.call(self, pageIndex, event);
        });
      }

      if (options.classes) {
        $link.addClass(options.classes);
      }

      $linkWrapper.append($link);

      if ($ul.length) {
        $ul.append($linkWrapper);
      } else {
        self.append($linkWrapper);
      }
    },

    _selectPage: function (pageIndex, event) {
      var o = this.data("pagination");
      o.currentPage = pageIndex;
      if (o.selectOnClick) {
        methods._draw.call(this);
      }
      return o.onPageClick(pageIndex + 1, event);
    },
  };

  $.fn.pagination = function (method) {
    // Method calling logic
    if (methods[method] && method.charAt(0) != "_") {
      return methods[method].apply(
        this,
        Array.prototype.slice.call(arguments, 1)
      );
    } else if (typeof method === "object" || !method) {
      return methods.init.apply(this, arguments);
    } else {
      $.error("Method " + method + " does not exist on jQuery.pagination");
    }
  };
})(jQuery);

const paginate = () => {
  var items = $(".mini-product-card.active");
  var numItems = items.length;
  var perPage = 9;

  items.slice(perPage).hide();

  $("#pagination-container").pagination({
    items: numItems,
    itemsOnPage: perPage,
    prevText: "Previous",
    nextText: "Next",
    onPageClick: function (pageNumber) {
      event.preventDefault();
      var showFrom = perPage * (pageNumber - 1);
      var showTo = showFrom + perPage;
      items.hide().slice(showFrom, showTo).show();
    },
  });
};

const filterProducts = () => {
  const cards = document.querySelectorAll(".mini-product-card");
  const starsFilter = document.querySelectorAll(".stars-filter .box");
  const priceFilter = document.querySelectorAll(".price-filter .box");
  const starsFilterTick = document.querySelectorAll(".stars-filter .tick");
  const priceFilterTick = document.querySelectorAll(".price-filter .tick");
  const allCheckBoxes = document.querySelectorAll(".check-box");

  const buttonsFilter = [
    starsFilter,
    priceFilter,
    priceFilterTick,
    starsFilterTick,
  ];
  paginate();
  buttonsFilter.forEach((button) => {
    button.forEach((el) => {
      el.addEventListener("click", (event) => {
        event.preventDefault();

        const target = event.currentTarget;
        const dataStars = event.currentTarget.parentElement.dataset.stars;
        const dataMinPrice = event.currentTarget.parentElement.dataset.minprice;
        const dataMaxPrice = event.currentTarget.parentElement.dataset.maxprice;

        allCheckBoxes.forEach((el) => {
          if (el.classList.contains("tick")) {
            el.classList.contains("tick" && "hidden")
              ? ""
              : el.classList.add("hidden");
          } else {
            el.classList.contains("box" && "hidden")
              ? el.classList.remove("hidden")
              : "";
          }
        });

        if (!target.classList.contains("tick" && "hidden")) {
          target.classList.add("hidden");
          target.previousElementSibling
            ? target.previousElementSibling.classList.contains("hidden")
              ? target.previousElementSibling.classList.remove("hidden")
              : ""
            : "";
          target.nextElementSibling
            ? target.nextElementSibling.classList.contains("hidden")
              ? target.nextElementSibling.classList.remove("hidden")
              : ""
            : "";

          cards.forEach((element) => {
            element.classList.remove("active");
            if (
              element.dataset.stars === `${dataStars}` ||
              (parseInt(element.dataset.price, 10) >=
                parseInt(`${dataMinPrice}`, 10) &&
                parseInt(element.dataset.price, 10) <=
                  parseInt(`${dataMaxPrice}`, 10))
            ) {
              element.classList.add("active");
              element.style.display =
                element.style.display === "none" ? "flex" : "";
            } else {
              element.style.display = "none";
            }
          });
          paginate();
        } else if (target.classList.contains("tick" && "hidden")) {
          cards.forEach((element) => {
            element.classList.remove("active");
            element.classList.add("active");
            element.style.display =
              element.style.display === "none" ? "flex" : "";
          });
          paginate();
        }
      });
    });
  });
};

export { filterProducts };
