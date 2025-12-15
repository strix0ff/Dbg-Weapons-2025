timer.Simple(0, function()
	octoinv.itemCreateFields['weapon_attachment'] = {
		{'combo', 'Тип модуля', {
			{'bipods'},
			{'flashlight'},
			{'handle'},
			{'magazine'},
			{'scope'},
			{'silencer'},
		}, function(item, val)
			item.attachmentID = val
		end, function(item)
			return item.attachmentID
		end},
	}
end)
