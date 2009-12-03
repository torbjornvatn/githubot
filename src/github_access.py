#!/usr/bin/env python
# encoding: utf-8
"""
github_access.py

Created by Torbjørn Vatn on 2009-11-24.
Copyright (c) 2009 __MyCompanyName__. All rights reserved.
"""

import github	

class GithubAccess(object):
	
	def __init__(self):
		self.username = "githubot"
		self.githubAPI = github.GithubAPI(self.username, "2882b823c47175135ee6cd2a3757b353")
		
	def getRepo(self, repo_name):
		return self.githubAPI.get_repo(self.username, repo_name)
		
	def getIssue(self, repo_name, number):
		return self.githubAPI.get_issue(self.username, repo_name, number)


