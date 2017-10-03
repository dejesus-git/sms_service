App.balance = App.cable.subscriptions.create "BalanceChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    	console.log(data)
    	# set up modals for successful numbers
    	app = document.getElementById("inner_cont")
    	close_success = document.createElement("span")
    	close_fail = document.createElement("span")
    	close_success.setAttribute("class", "remove_message")
    	close_fail.setAttribute("class", "remove_message")
    	s = document.createTextNode("x")
    	f = document.createTextNode("x")
    	close_success.append(s)
    	close_fail.append(f)

    	closeModal = ->
    		cont = this.parentNode.parentNode
    		cont.removeChild this.parentNode
    		
    	
    	 

    	if data.success.length > 0 
    		console.log("there are failures")
    		msg = "These phone numbers went through!: "
    		success_message = document.createElement("div")
    		success_message.setAttribute("class", "success action_message")
    		success_message.setAttribute("id", "success_close")
    		successes = document.createTextNode(msg + data.success)
    		success_message.append(successes)
    		success_message.append(close_success)
    		app.insertBefore(success_message, document.getElementById("side_bar"))
    		close_success.addEventListener "click", closeModal
    	# set up modal for unsuccessful numbers
    	if data.failure.length > 0
    		console.log("there are successes")
    		msg = "These phone number entries were invalid: "
    		failure_message = document.createElement("div")
    		failure_message.setAttribute("class", "failure action_message")
    		failure_message.setAttribute("id", "failure_close")
    		failures = document.createTextNode(msg + data.failure)
    		failure_message.append(failures)
    		failure_message.append(close_fail)
    		app.insertBefore(failure_message, document.getElementById("side_bar"))
    		close_fail.addEventListener "click", closeModal
    	
    	
    	window.setTimeout(document.getElementById("balance").innerHTML = "balance: #{data.balance}", 5000)
			