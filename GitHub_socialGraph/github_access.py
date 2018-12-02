from github import Github
import getpass, os, errno, sys



def following_graph():
	x = 0
	userdictionary = {username2:x}
	x += 1
	try:
		os.remove("data.json")
	except OSError:
		pass	
	file = open("data.json", "w")
	file.write("{\n\t\"nodes\":[\n\t\t{\"name\":\"%s\",\"level\":1}" % username2)
	for user in start_user.get_following():
		userdictionary[user.login] = x
		file.write(",\n\t\t{\"name\":\"%s\",\"level\":2}" % user.login)
		x += 1
	friends = x
	for user in start_user.get_following():
		for user_user in g.get_user(user.login).get_following():
			if user_user.login not in userdictionary:
				userdictionary[user_user.login] = x
				file.write(",\n\t\t{\"name\":\"%s\",\"level\":3}" % user_user.login)
				x +=1
	file.write("\n\t],\n\t\"links\":[\n\t\t{\"source\":0,\"target\":0,\"weight\":10}")		
	friends_of_friends = x
	print("Friends of friends is: %d" % friends_of_friends)
	for user in start_user.get_following():
		file.write(",\n\t\t{\"source\":0,\"target\":%d,\"weight\":10}" % userdictionary[user.login])
		for user_user in g.get_user(user.login).get_following():
			if user_user.login != username2:
				file.write(",\n\t\t{\"source\":%d,\"target\":%d,\"weight\":1}" % (userdictionary[user.login], userdictionary[user_user.login]))
	file.write("\n\t]\n}")
	file.close

def follower_graph():
	x = 0
	userdictionary = {username2:x}
	x += 1
	try:
		os.remove("data.json")
	except OSError:
		pass	
	file = open("data.json", "w")
	file.write("{\n\t\"nodes\":[\n\t\t{\"name\":\"%s\",\"level\":1}" % username2)
	for user in start_user.get_followers():
		userdictionary[user.login] = x
		file.write(",\n\t\t{\"name\":\"%s\",\"level\":2}" % user.login)
		x += 1
	friends = x
	for user in start_user.get_followers():
		for user_user in g.get_user(user.login).get_followers():
			if user_user.login not in userdictionary:
				userdictionary[user_user.login] = x
				file.write(",\n\t\t{\"name\":\"%s\",\"level\":3}" % user_user.login)
				x +=1
	file.write("\n\t],\n\t\"links\":[\n\t\t{\"source\":0,\"target\":0,\"weight\":10}")			
	friends_of_friends = x
	print("Friends of friends is: %d" % friends_of_friends)
	for user in start_user.get_followers():
		file.write(",\n\t\t{\"source\":0,\"target\":%d,\"weight\":10}" % userdictionary[user.login])
		for user_user in g.get_user(user.login).get_followers():
			if user_user.login != username2:
				file.write(",\n\t\t{\"source\":%d,\"target\":%d,\"weight\":1}" % (userdictionary[user.login], userdictionary[user_user.login]))
	file.write("\n\t]\n}")
	file.close








#Main code	
print("Please enter username and password to access Github.")
username1 = input('Username:')
password = getpass.getpass('Password:')

g = Github(username1, password)

print("Enter the name of the user's social graph you want to see.")
username2 = input('Username: ')

if username1 == username2 :
	start_user = g.get_user()
else :
	start_user = g.get_user(username2)

print("To see the follower of the user, enter 1, or if you want to see the following, enter 2, or quit to exit.")
graph_type = input('')

if (graph_type == "1") :
	follower_graph()
elif (graph_type == "2"):
	following_graph()
elif (graph_type == "exit"):
	sys.exit(0)