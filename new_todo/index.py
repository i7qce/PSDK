from sys import set_coroutine_origin_tracking_depth
from flask import Flask, jsonify, escape, request, render_template, redirect, url_for, Response, send_file
import json
import os

root_path = os.path.abspath(os.path.dirname(__file__))


app = Flask(__name__, static_url_path='',static_folder='static')

# URL ROUTING ###############################################################

@app.route('/')
def home():
    
    with open(os.path.join(root_path, 'static', 'index.html'), 'r') as f:
        content = f.read()
    
    return Response(content, mimetype="text/html")

@app.route('/data.json')
def tracker_json():

	with open('./data.json', 'r') as f:
		project_dict = json.load(f)
	
	return jsonify(project_dict)

@app.route('/update', methods=['post'])
def update_task():

    content = request.get_json()
    with open('./data.json', 'w') as f:
        json.dump(content, f, indent=4)
	
    return jsonify(returnval={})

@app.route('/backup')
def backup():
	"""
	Collect all relevant data files, copy into a directory, zip and upload to user
	"""

	return send_file('./data.json')

# @app.route('/tracker')
# def tracker():

# 	current_project_id = request.args.get('project_id')
# 	show_all = request.args.get('show_all')
	
# 	if os.path.exists('tracker_files/db.json'):
# 		with open('tracker_files/db.json', 'r') as f:
# 			project_dict = json.load(f)
# 		projects = list(project_dict['projects'].keys())
# 	else:
# 		with open('tracker_files/db.json', 'w') as f:
# 			json.dump({"projects":{}, "max_id":0}, f)
# 			projects = []

# 	if current_project_id == None and show_all == None:
# 		return render_template('render_tracker.html', projects=projects, pagetype=0)
# 	elif show_all:
# 		return render_template('render_tracker.html', projects=projects, pagetype=2)
# 	else:
# 		return render_template('render_tracker.html', projects=projects, pagetype=1)


		

	


# @app.route('/tracker_json')
# def tracker_json():

# 	with open('tracker_files/db.json', 'r') as f:
# 		project_dict = json.load(f)
	
# 	return jsonify(project_dict)

# @app.route('/add_section', methods=['post', 'get'])
# def add_section():

# 	if request.method == 'POST':
# 		title = request.form.get('title')
# 		tl_section = request.form.get('parent')
# 		first_sub_title = request.form.get('sub_title')
# 		if tl_section == "None" and first_sub_title == "": #just section
# 			new_section = Section( title=title,  has_subsections=0 )
# 			db.session.add(new_section)
# 			db.session.commit()
# 			db.session.add( Subsection(title=title, section_id = new_section.id, is_root_subsection=1  ) )
# 			db.session.commit()
# 		elif tl_section != "None": #add subsection to existing section
# 			parent_section = Section.query.filter_by(id=tl_section).all()
# 			db.session.add( Subsection(title=title, section_id = parent_section[0].id, is_root_subsection=0  ) )
# 			db.session.commit()
# 		else: #add section + seperate subsection
# 			new_section = Section( title=title,  has_subsections=1 )
# 			db.session.add(new_section)
# 			db.session.commit()
# 			db.session.add( Subsection(title=title, section_id = new_section.id, is_root_subsection=1  ) )
# 			db.session.add( Subsection(title=first_sub_title, section_id = new_section.id, is_root_subsection=0  ) )
# 			db.session.commit()
		
# 		return redirect('/')


# 	sections = Section.query.filter_by(has_subsections=1).all()

# 	return render_template('add_section.html', sections=sections)




# @app.route('/add_chapter', methods=['post', 'get'])
# def add_chapter():
	
# 	if request.method == 'POST':
# 		title = request.form.get('title')
# 		content = request.form.get('content')
# 		current_subsection_id =  request.form.get('current_subsection_id')
# 		content_html = markdown.markdown(content, extensions=markdown_extension_list)
# 		new_chapter = Chapter(title=title, content_markdown=content, content_html=content_html,  subsection_id= current_subsection_id)
# 		db.session.add(   new_chapter    )
# 		db.session.commit()
# 		return redirect('/?subsection_id=' + current_subsection_id + '#' + str(new_chapter.id) )

# 	current_subsection_id = request.args.get('current_subsection_id')

# 	return render_template('add_chapter.html', current_subsection_id=current_subsection_id)




# @app.route('/edit_chapter', methods=['post', 'get'])
# def edit_chapter():

# 	if request.method == 'POST':
# 		current_chapter_id =  request.form.get('current_chapter_id')
# 		title = request.form.get('title')
# 		content = request.form.get('content')

# 		current_chapter = Chapter.query.filter_by(id=current_chapter_id).all()
# 		current_chapter[0].title = title
# 		current_chapter[0].content_markdown = content
# 		current_chapter[0].content_html = markdown.markdown(content, extensions=markdown_extension_list)

# 		db.session.commit()

# 		current_subsection_id = str(current_chapter[0].subsection.id)

# 		return redirect('/?subsection_id=' + current_subsection_id + '#' + str(current_chapter[0].id) ) 


# 	current_chapter_id = request.args.get('current_chapter_id')
# 	current_chapter = Chapter.query.filter_by(id=current_chapter_id).all()
# 	title = current_chapter[0].title
# 	print(title)
# 	content = current_chapter[0].content_markdown
	

# 	return render_template('edit_chapter.html', title=title, content=content, current_chapter_id=current_chapter_id)




# @app.route('/edit_section', methods=['post', 'get'])
# def edit_section():

# 	if request.method == 'POST':
# 		current_subsection_id =  request.form.get('current_subsection_id')
# 		title = request.form.get('title')

# 		current_subsection = Subsection.query.filter_by(id=current_subsection_id).all()
# 		current_subsection[0].title = title

# 		if current_subsection[0].is_root_subsection: #if root subsection, change parent title too, otherwise leave parent
# 			current_subsection[0].section.title = title
# 		else:
# 			parent_title = request.form.get('parent_title')
# 			current_subsection[0].section.title = parent_title

# 		db.session.commit()

# 		return redirect('/?subsection_id=' + current_subsection_id ) 


# 	current_subsection_id = request.args.get('current_subsection_id')
# 	current_subsection= Subsection.query.filter_by(id=current_subsection_id).all()
# 	title = current_subsection[0].title
# 	is_root_subsection = current_subsection[0].is_root_subsection
# 	parent_title = current_subsection[0].section.title
# 	parent_id = current_subsection[0].section.id
# 	print(title)
	

# 	return render_template('edit_section.html', title=title, current_subsection_id=current_subsection_id, is_root_subsection=is_root_subsection, parent_title=parent_title, parent_id=parent_id)




# @app.route('/delete', methods=['post', 'get'])
# def delete():

# 	if request.method == 'POST':
# 		delete_confirmation = request.form.get('confirmation')
# 		if delete_confirmation != "delete":
# 			return redirect('/') 
		
# 		to_delete_type = request.form.get('to_delete_type')
# 		to_delete_id = request.form.get('to_delete_id')

# 		#to get cascading deletions working correctly, need to use db.session.delete on object, using .delete on return from filter doesn't cascade!

# 		if to_delete_type == 'Section':
# 			to_delete_section = Section.query.filter_by(id=to_delete_id).all()
# 			db.session.delete(to_delete_section[0])
# 		elif to_delete_type == 'Subsection':
# 			to_delete_subsection = Subsection.query.filter_by(id=to_delete_id).all()
# 			if to_delete_subsection[0].is_root_subsection:
# 				db.session.delete(to_delete_subsection[0].section) #delete parent section, which will also remove subsection
# 			else:
# 				db.session.delete(to_delete_subsection[0])
			
# 		elif to_delete_type == 'Chapter':
# 			Chapter.query.filter_by(id=to_delete_id).delete()

# 		db.session.commit()

# 		return redirect('/') 


# 	to_delete_id = request.args.get('to_delete_id')
# 	to_delete_type = request.args.get('to_delete_type')
# 	if to_delete_type == "Section":
# 		to_delete_section = Section.query.filter_by(id=to_delete_id).all()
# 		to_delete_title = to_delete_section[0].title
# 	elif to_delete_type == "Subsection":
# 		to_delete_subsection = Subsection.query.filter_by(id=to_delete_id).all()
# 		to_delete_title = to_delete_subsection[0].title
# 	if to_delete_type == "Chapter":
# 		to_delete_chapter = Chapter.query.filter_by(id=to_delete_id).all()
# 		to_delete_title = to_delete_chapter[0].title
	



# 	return render_template('delete.html', to_delete_type=to_delete_type, to_delete_id=to_delete_id, to_delete_title=to_delete_title)




# @app.route('/reorder_content', methods=['post', 'get'])
# def reorder():
# 	return render_template('reorder.html')



# @app.route('/update_async', methods=['post'])
# def update():
# 	submitted_data = request.form.to_dict()
# 	current_id = submitted_data.get('id')
# 	newContent = submitted_data.get('content')
# 	newTitle = submitted_data.get('title')

# 	newContentHTML = markdown.markdown(newContent, extensions=markdown_extension_list)

# 	print('editing ' + str(current_id) + ': ' + newTitle)

# 	current_chapter = Chapter.query.filter_by(id=current_id).all()

# 	#Do the updating
# 	current_chapter[0].title = newTitle
# 	current_chapter[0].content_markdown = newContent
# 	current_chapter[0].content_html = newContentHTML

# 	db.session.commit()
	
# 	return jsonify(modified_title=newTitle, modified_content=newContent, modified_content_html = newContentHTML)

# @app.route('/new_task', methods=['post'])
# def new_task():

# 	# from ajax, get new task
# 	# add to db.json 
# 	# send status back to reload json

# 	submitted_data = request.form.to_dict()
# 	pid = submitted_data.get('pid')
# 	name = submitted_data.get('name')

# 	utils.add_task(name, pid)
	
# 	return jsonify(returnval={})

# @app.route('/update_task', methods=['post'])
# def update_task():

# 	# from ajax, get new task
# 	# add to db.json 
# 	# send status back to reload json

# 	submitted_data = request.form.to_dict()
# 	pid = submitted_data.get('pid')
# 	tid = submitted_data.get('tid')
# 	new_statuscode = submitted_data.get('new_statuscode')

# 	utils.update_task(pid, tid, new_statuscode)
	
# 	return jsonify(returnval={})

# @app.route('/new_project', methods=['post'])
# def new_project():

# 	# from ajax, get new task
# 	# add to db.json 
# 	# send status back to reload json

# 	submitted_data = request.form.to_dict()
# 	name = submitted_data.get('name')

# 	utils.add_project(name)

# 	return jsonify(returnval={})

# @app.route('/backup')
# def backup():
# 	"""
# 	Collect all relevant data files, copy into a directory, zip and upload to user
# 	"""
	
# 	if os.path.exists('./temp.md'):
# 		os.remove('./temp.md')
	
# 	dump_db_to_md('./temp.md')

# 	backup_dir_name = utils.make_backups()

# 	return send_file(backup_dir_name)


