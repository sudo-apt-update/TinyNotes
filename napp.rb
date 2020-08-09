Shoes.app title: "TinyNotes" do
	background "#364f6b"
	border("#f5f5f5", strokewidth: 6)

	stack(margin: 12, margin_right: 0) do
		para "TinyNotes", stroke: "#f5f5f5", family: "monaco"
		flow do
			@title = edit_line "Name of file to save to", width: 0.95
		end
	end
	stack(margin_left: 12) do
		flow do
			@note = edit_box "Type your note...", width: 0.95, height: 275
		end
	end
	stack(margin: 12) do
		flow do
			@save = button "Save"
			@clear = button "Clear all"
			@quit = button "Quit"
			@save.click do
				file = File.open("#{@title.text().downcase}.txt", "a+")
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
