$.widget  "ui.phoneNumberInput",

  _create: () ->
    element = $(@element)
    if !element.data('phone-number-field-activated')
      element.change ->
        phone = element .val()
        element.val(formatInternational('US', phone))
        countryCode = countryForE164Number(formatE164('US', phone))
        if countryCode.length == 0
          $('.country-info', element.parent()).html('')
        else
          $('.country-info', element.parent()).html(countryCode + " - " + countryCodeToName(countryCode))

      element.change()
      element.data('phone-number-field-activated', true)
