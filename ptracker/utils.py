import json
import os
import datetime
from zoneinfo import ZoneInfo
import time

server_timezone = "US/Eastern"

def status_mapping(status_code):
	status_map = {
		1:  'To Do',
		0:  'In Progress',
		2:  'Done',
		-1: 'Abandoned'
	}
	return status_map[status_code]

def add_project(name, fil='tracker_files/db.json'):

	if not os.path.exists(fil):
		with open(fil, 'w') as f:
			json.dump({"projects":{}, "max_id":0}, f)

	with open(fil, 'r') as f:
		project_dict = json.load(f)
	
	adding_dict = {
		project_dict['max_id'] + 1: {
			"name": name, 
			"date_modified": datetime.datetime.now(ZoneInfo(server_timezone)).strftime("%b %d %Y"), 
			"date_modified_timestamp": time.time(), 
			"date_created": datetime.datetime.now(ZoneInfo(server_timezone)).strftime("%b %d %Y"),
			"date_created_timestamp": time.time(),
			"tasks": {}, 
			"max_task_id": 0,
			"description": 0,
			"active": 1
			}
		}


	project_dict['projects'].update(adding_dict)
	project_dict['max_id'] += 1

	with open(fil, 'w') as f:
		json.dump(project_dict, f, indent=4)
	
	return

def add_task(name, project_id, fil='tracker_files/db.json'):
	# create w/ date modified, date created, priority, status, id
	# status in {todo, inprogress, done, abandoned}

	with open(fil, 'r') as f:
		project_dict = json.load(f)

	task_id = project_dict['projects'][project_id]['max_task_id'] + 1
	project_dict['projects'][project_id]['max_task_id'] += 1

	adding_dict = {
		task_id: {
			"name": name,
			"status": "To Do",
			"statuscode": 1,
			"date_modified": datetime.datetime.now(ZoneInfo(server_timezone)).strftime("%b %d %Y"),
			"date_modified_timestamp": time.time(),
			"date_created": datetime.datetime.now(ZoneInfo(server_timezone)).strftime("%b %d %Y"),
			"date_created_timestamp": time.time(),
			"description": 0
		}
	}

	project_dict['projects'][project_id]['tasks'].update(adding_dict)

	# update timestamps for project HERE

	project_dict['projects'][project_id]['date_modified'] = datetime.datetime.now(ZoneInfo(server_timezone)).strftime("%b %d %Y")
	project_dict['projects'][project_id]['date_modified_timestamp'] = time.time()


	with open(fil, 'w') as f:
		json.dump(project_dict, f, indent=4)

	return



def update_task(pid, tid, new_statuscode, fil='tracker_files/db.json'):

	with open(fil, 'r') as f:
		project_dict = json.load(f)

	project_dict['projects'][pid]['tasks'][tid]['statuscode'] = int(new_statuscode)
	project_dict['projects'][pid]['tasks'][tid]['status'] = status_mapping(int(new_statuscode))

	# update timestamps for project HERE

	project_dict['projects'][pid]['date_modified'] = datetime.datetime.now(ZoneInfo(server_timezone)).strftime("%b %d %Y")
	project_dict['projects'][pid]['date_modified_timestamp'] = time.time()

	project_dict['projects'][pid]['tasks'][tid]['date_modified'] = datetime.datetime.now(ZoneInfo(server_timezone)).strftime("%b %d %Y")
	project_dict['projects'][pid]['tasks'][tid]['date_modified_timestamp'] = time.time()


	with open(fil, 'w') as f:
		json.dump(project_dict, f, indent=4)
	
	return

