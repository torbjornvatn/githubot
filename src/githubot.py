'''
Created on Nov 23, 2009

@author: torbjornvatn
'''
from waveapi import events
from waveapi import model
from waveapi import robot
from github_access import *
import re

repo = "testrepo"

def OnRobotAdded(properties, context):
  root_wavelet = context.GetRootWavelet()
  doc = root_wavelet.CreateBlip().GetDocument()
  doc.SetText("I'm looking at: " + GithubAccess().getRepo(repo).name)
  
def OnBlipSubmitted(properties, context):
  blip = context.GetBlipById(properties['blipId'])
  parse_contents(blip)

def parse_contents(blip):
  doc = blip.GetDocument()
  pattern = re.compile("#([\d]+)")
  contents = doc.GetText()
  for t in re.finditer(pattern, contents):
	issue_nr = t.group(1)
	issue_title = GithubAccess().getIssue(repo, issue_nr).title
	contents = contents.replace("#"+issue_nr, "["+issue_title+" - #"+issue_nr+"]")
  doc.SetText(contents)

if __name__ == '__main__':
    myRobot = robot.Robot('Githubot',
      image_url='http://githubot.appspot.com/assets/octocat_100x100.png',
      version='2',
      profile_url='http://githubot.appspot.com/')
    myRobot.RegisterHandler(events.WAVELET_SELF_ADDED, OnRobotAdded)
    myRobot.RegisterHandler(events.BLIP_SUBMITTED, OnBlipSubmitted)
    myRobot.Run()
