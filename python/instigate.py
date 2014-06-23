import sublime, sublime_plugin, random, string

class InstigateCommand(sublime_plugin.TextCommand):

	def run(self, edit):
		print "A shot across the bows! Instigate.py strikes again!"

		# Get the first selection, and check if a) it exists and b) it's on
		# 	at least the 6th line (to give you a head start)
		current_sel = self.view.sel()[0]
		current_rowcol = self.view.rowcol(current_sel.begin())

		if current_rowcol[0] >= 5:
			offset = random.randint(10, current_sel.begin() - 10)
			to_replace_region = sublime.Region(current_sel.begin() - offset, 
				current_sel.begin() - offset + 1)
			new_char = random.choice(string.letters)

			self.view.replace(edit, to_replace_region, new_char)

		# IMPORTANT: whatever key you bind this command to (i.e. enter, '.', ';', etc)
		# 	will not actually be entered after this command is run. To remedy this, you
		# 	need to type the bound character at the end of the command
		self.view.insert(edit, current_sel.begin(), '\n')


# To be evil, and install this in your friend's Sublime Text,
# and add the following line to Default.sublime-keymap:
# 			
#			{ "keys": ["enter"], "command": "instigate" }