jQuery.fn.inputCounter = function (options) {

    var defaults = {
        selectors: {
            substracButtonSelector: '.btn-substrac',
            addButtonSelector: '.btn-add',
            inputSelector: '.input-counter',
        },
        settings: {
            checkValue: true,
            isReadOnly: true,
        },
    };

    var settings = $.extend({}, defaults, options);

    var methods = {
        init: function (element) {
            var me = this;

            methods.registerEvents(element);
            methods.initInput(element);
        },

        initInput: function (element) {
            var me = this;
            var defaultValue = $(element).find(settings.selectors.inputSelector).data("default");

            // the default value
            $(element).find(settings.selectors.inputSelector).val(defaultValue);

            // set readonly-value
            if(settings.settings.isReadOnly == true) {
                $(element).find(settings.selectors.inputSelector).prop('readonly', true);
            } else {
                $(element).find(settings.selectors.inputSelector).prop('readonly', false);
            }
        },

        registerEvents: function (element) {
            var me = this;
            var subtractButtonElement = $($(element).find(settings.selectors.subtractButtonSelector)[0]);
            var addButtonElement = $($(element).find(settings.selectors.addButtonSelector)[0]);
            var input = $($(element).find(settings.selectors.inputSelector)[0]);

            subtractButtonElement.on("click touchstart", $.proxy(me.onSubtractButtonClicked, me, element));
            addButtonElement.on("click touchstart", $.proxy(me.onAddButtonClicked, me, element));
            input.on("focusout", $.proxy(me.onInputFocusOut, me, element));
        },

        onSubtractButtonClicked: function (element) {
            var me = this;
            var input = $($(element).find(settings.selectors.inputSelector)[0]);
            var newValue = (parseInt(input.val()));

            if((tempa*1 + tempy*1) <= 6)
                newValue = (parseInt(input.val()) + 1);

            if(refresh_num == 1)
                newValue = 0;

            me.setValue(element, parseInt(input.val()), newValue);
        },

        onAddButtonClicked: function (element) {
            var me = this;
            var input = $($(element).find(settings.selectors.inputSelector)[0]);
            var newValue = (parseInt(input.val()));

            if(dis_check != 1)
                newValue = (parseInt(input.val()) - 1);

            if(refresh_num == 1) {
                newValue = 0;
            }

            me.setValue(element, parseInt(input.val()), newValue);
        },

        onInputFocusOut: function (element) {
            var me = this;
            var input = $($(element).find(settings.selectors.inputSelector)[0]);
            var minValue = input.data("min");
            var maxValue = input.data("max");

            var newValue = parseInt(input.val());

            if(me.checkValue(element, newValue) == -1) {
                input.val(minValue);
            } else if(me.checkValue(element, newValue) == -2) {
                input.val(maxValue);
            }
        },

        setValue: function (element, oldValue, newValue)  {
            var me = this;
            var input = $($(element).find(settings.selectors.inputSelector)[0]);

            if(me.checkValue(element, newValue) == true) {
                input.val(newValue);
            } else {
                input.val(oldValue);
            }
        },

        checkValue: function (element, newValue) {
            var me = this;
            var input = $($(element).find(settings.selectors.inputSelector)[0]);
            var minValue = input.data("min");
            var maxValue = input.data("max");

            if(settings.settings.checkValue != true) {
                return true;
            }

            if (minValue == undefined && maxValue == undefined) {
                return true;
            } else if (minValue == undefined && maxValue != undefined && newValue <= parseInt(maxValue)) {
                return true;
            } else if (maxValue == undefined && minValue != undefined && newValue >= parseInt(minValue)) {
                return true;
            } else if (maxValue != undefined && minValue != undefined && newValue >= parseInt(minValue) && newValue <= parseInt(maxValue)) {
                return true;
            } else {
                if(newValue < parseInt(minValue)) {
                    // to low
                    return -1;
                } else if (newValue > parseInt(maxValue)) {
                    // to large
                    return -2;
                }
            }
        },
    };

    return this.each(function () {
        methods.init($(this));
    });
};