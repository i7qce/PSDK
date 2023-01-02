#from flask import Flask, jsonify, escape, request, render_template, redirect, url_for
from flask_sqlalchemy import SQLAlchemy, model
from sqlalchemy import func


# DATABASE CONFIGURATION ####################################################

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///database.db'
db = SQLAlchemy(app)

#helper function to assign order_id to each entry
def increment_default_order_section(context):
	max_order_id = db.session.query(func.max(Section.order_id)).all()[0][0]
	if max_order_id == None:
		return 1
	else:
		return max_order_id + 1

def increment_default_order_subsection(context):
	max_order_id = db.session.query(func.max(Subsection.order_id)).all()[0][0]
	if max_order_id == None:
		return 1
	else:
		return max_order_id + 1

def increment_default_order_chapter(context):
	max_order_id = db.session.query(func.max(Chapter.order_id)).all()[0][0]
	if max_order_id == None:
		return 1
	else:
		return max_order_id + 1	

#Database schema definition
class Section(db.Model):
	id = db.Column(db.Integer, primary_key=True, autoincrement=True)
	order_id = db.Column(db.Integer, default=increment_default_order_section)
	title = db.Column(db.String, unique=False,nullable=False)
	has_subsections = db.Column(db.Integer)

	subsections = db.relationship('Subsection', backref='section', lazy=True, cascade="all, delete-orphan")

	def __repr__(self):
		return '<Section %r>' % self.title
	
class Subsection(db.Model):
	id = db.Column(db.Integer, primary_key=True, autoincrement=True)
	title = db.Column(db.String, unique=False,nullable=False)
	order_id = db.Column(db.Integer, default=increment_default_order_subsection)
	is_root_subsection = db.Column(db.Integer)


	chapters = db.relationship('Chapter', backref='subsection', lazy=True, cascade="all, delete-orphan")

	section_id = db.Column(db.Integer, db.ForeignKey('section.id'), nullable=False)

	def __repr__(self):
		return '<Subsection %r>' % self.title
	
class Chapter(db.Model):
	id = db.Column(db.Integer, primary_key=True, autoincrement=True)
	title = db.Column(db.String, unique=False,nullable=False)
	order_id = db.Column(db.Integer, default=increment_default_order_chapter)
	content_markdown = db.Column(db.String, unique=False,nullable=False)
	content_html = db.Column(db.String, unique=False,nullable=False)
	
	subsection_id = db.Column(db.Integer, db.ForeignKey('subsection.id'), nullable=False)

	def __repr__(self):
		return '<Chapter %r>' % self.title
	

def dump_db_to_md(output_file):
	sections = Section.query.all()
	for section in sections:
		subsections = section.subsections
		for subsection in subsections:
			chapters = subsection.chapters
			for chapter in chapters:
				with open(output_file, 'a') as f:
					f.write(chapter.content_markdown)
				
			
		
dump_db_to_md('test_output.md')	

