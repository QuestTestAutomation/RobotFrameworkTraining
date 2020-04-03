
import git
import os
import time
from git import *
import shutil


class gitlibrary():

    @staticmethod
    def copy_files(self,sourcepath, destinationpath):
        files = os.listdir(sourcepath)
        print(files)

        for f in files:
            shutil.copy(sourcepath + f, destinationpath)

    @staticmethod
    def InitializeRepository(self,LocalGITRepo, Localdirectorypath):
        repo = git.Repo(LocalGITRepo)
        repo.init(Localdirectorypath, mkdir=True)

    @staticmethod
    def addfilestorepository(self,LocalGITRepo, LocalDirectoryPath,DirectoryName):
        repo = Repo(LocalDirectoryPath)
        files = os.listdir(LocalDirectoryPath)

        print(files)

        for file in files:
            repo.git.add(LocalDirectoryPath + '\\' + DirectoryName + '\\' + file)
        repo.index.commit("First Commit files")

    @staticmethod
    def addallfilestorepository(self,LocalGITRepo, LocalDirectoryPath, destinationpath):
        os.chdir(destinationpath)
        repo = Repo(LocalDirectoryPath)
        repo.git.add("-A")

        repo.index.commit("First Commit files")

    @staticmethod
    def adddirectorytorepository(self,LocalGITRepo, LocalDirectoryPath, DirectoryName):
        print("LocalDirectoryPath"  +  str(os.path.isdir(LocalDirectoryPath)))
        if os.path.exists(LocalDirectoryPath + "\\" + DirectoryName ):
            print("directory exists")
        else:
            os.mkdir(LocalDirectoryPath + '\\' + DirectoryName)

        repo = Repo(LocalDirectoryPath)
        repo.git.add(LocalDirectoryPath + '\\' + DirectoryName)
        repo.index.commit("Folder added")
