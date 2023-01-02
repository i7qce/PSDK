import json
import os
import datetime

def add_project(name, fil='tracker_files/db.json'):

	if not os.path.exists(fil):
		with open(fil, 'w') as f:
			json.dump({"projects":{}, "max_id":0}, f)

	with open(fil, 'r') as f:
		project_dict = json.load(f)
	
	adding_dict = {project_dict['max_id'] + 1: {"name": name, "date_modified": datetime.datetime.now().strftime("%b %d %Y"), "timestamp": 0, "tasks": {}}}


	project_dict['projects'].update(adding_dict)
	project_dict['max_id'] += 1

	with open(fil, 'w') as f:
		json.dump(project_dict, f, indent=4)

def add_task(name, project, fil='tracker_files/db.json'):
	# create w/ date modified, date created, priority, status, id
	# status in {todo, inprogress, done, abandoned}
	# update timestamps for project
	pass

# def update_task():
# 	# get project, 
