$(function() {
  $('input[data-toggle]').change(function(e) {
    var slackId = $(this).parents("tr").data("slack-id")
    var status = $(this).prop('checked')
    var field = $(this).attr("name")
    var data = {"_method": "PATCH"}
    data[field] = status

    $.post("/slack_channels/" + slackId, data, function(resp){
      console.log(resp)
    })
  })
})
