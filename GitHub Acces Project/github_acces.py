from github import Github
import getpass

print("Please enter username and password")
username = input('Username:')
password = getpass.getpass('Password:')

g = Github(username, password)

for user in g.get_user().get_following():
	for repo in user.get_repos():
		print(repo.name)
