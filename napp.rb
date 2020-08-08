Shoes.app do
	background "#364f6b"
	border("#f5f5f5", strokewidth: 6)

	stack(margin: 12) do
		para "Type your note:", stroke: "#f5f5f5", family: "monaco"
		flow do
			@title = edit_line "Title", width: "500px"
		end
	end
	stack(margin_left: 12) do
		flow do
			@note = edit_box "Type...", width: "500px"
		end
	end
	stack(margin: 12) do
		flow do
			@save = button "Save"
			@clear = button "Clear all"
			@quit = button "Quit"
			@save.click do
				file = File.open("#{@title.text()}.txt", "a+")
				et = Time.now
				file.write("#{et.strftime("[%m/%d/%y]  %I:%M:%S %p")} - #{@note.text()}\n")
				file.close
				@title.text = ""
				@note.text = ""
			end
			@clear.click do
				@title.text = ""
				@note.text = ""
			end
			@quit.click do
				Shoes.quit()
			end
		end
	end
end
