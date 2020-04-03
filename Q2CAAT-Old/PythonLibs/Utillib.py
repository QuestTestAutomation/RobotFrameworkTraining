
import time
import datetime
import os
from XLLib import *
from ExceptionLib import *

import logging
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.support.ui import Select
from robot.libraries.BuiltIn import BuiltIn
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By

import inspect

class  utillib():

    def __init__(self):
        #globaldict1 = {}
        #globaldict1 = globaldict
        #self.globaldict1 = globaldict1

        pass

    def get_driver_handle(self,browser,url):
        if browser == 'ff':
            driver_path = self.globaldict1.get('firefoxdriverpath')
            driver = webdriver.Firefox(executable_path= driver_path)
            driver.get(url)
        if browser == 'gc':
            driver_path = self.globaldict1.get('chromedriverpath')
            driver = webdriver.Chrome(executable_path= driver_path)
            driver.get(url)
        if browser == 'ie':
            driver_path = self.globaldict1.get('IEdriverpath')
            driver = webdriver.Ie(executable_path= driver_path)
            driver.get(url)
        return driver

    @staticmethod
    def get_webdriver_instance():
        sellib = BuiltIn().get_library_instance('SeleniumLibrary')
        return sellib._current_browser()

    @staticmethod
    def increment_step_number(self,step):
        step = int(step) + int(1)

        return step

    @staticmethod
    def generate_phonenum() :
        phnum = time.strftime("%d%m%Y%H%M%S")

        return phnum

    @staticmethod
    def get_current_date():
        print (time.strftime("%H:%M:%S"))

        ## 12 hour format ##
        print (time.strftime("%I:%M:%S"))

        ## dd/mm/yyyy format
        print (time.strftime("%d/%m/%Y"))

        ## dd_mm_yyyy format
        print (time.strftime("%d_%m_%Y"))

        dttime = time.strftime("%d_%m_%Y")

        return dttime

    @staticmethod
    def get_current_date_time():
        print (time.strftime("%H:%M:%S"))

        ## 12 hour format ##
        print (time.strftime("%I:%M:%S"))

        ## dd/mm/yyyy format
        print (time.strftime("%d/%m/%Y"))

        ## dd_mm_yyyy format
        print (time.strftime("%d_%m_%Y"))

        dttime = time.strftime("%d_%m_%Y_%H_%M_%S")

        return dttime

    @staticmethod
    def create_directory(self,file):
        if not os.path.isdir(file):
            os.makedirs(file)
            print("Folder created successfully")
        else:
            print("Folder already exist.")

    @staticmethod
    def Add_Strings(self,Str1,Str2):
        str3 = Str1.strip() + Str2.strip()

        return str3

    @staticmethod
    def Build_File_Path(self,Str1,Str2):
        str3 = Str1.strip() + "/" + Str2.strip()

        return str3


    def create_run_test_results_file(self,vTestResultsfile,vTestResultsheet):
        oXLLib = XLLib.XLLib()
        oXLLib.create_workbook(vTestResultsfile,vTestResultsheet)
        oXLLib.set_xl_cell_value(vTestResultsfile,vTestResultsheet,1,1,"TestCaseName")
        #XLLib.create_workbook(vTestResultsfile,vTestResultsheet)
        oXLLib.set_xl_cell_value(vTestResultsfile,vTestResultsheet,1,1,"TestCaseName")
        oXLLib.set_xl_cell_value(vTestResultsfile, vTestResultsheet, 1, 2, "TestCaseDescription")
        oXLLib.set_xl_cell_value(vTestResultsfile, vTestResultsheet, 1, 3, "Status")
        oXLLib.set_xl_cell_value(vTestResultsfile, vTestResultsheet, 1, 4, "UpdatedDateTimeStamp")
        oXLLib.set_xl_cell_value(vTestResultsfile, vTestResultsheet, 1, 5, "TestData")

    def create_test_case_results_file(self,vTestCaseResultsfile,vTestCaseResultsheet,vTCName,vTCDescription):
        oXLLib = XLLib.XLLib()
        oXLLib.create_workbook(vTestCaseResultsfile, vTestCaseResultsheet)
        oXLLib.set_xl_cell_value(vTestCaseResultsfile, vTestCaseResultsheet, 1, 1, "TestCaseName")
        oXLLib.set_xl_cell_value(vTestCaseResultsfile, vTestCaseResultsheet, 1, 2, vTCName)
        oXLLib.set_xl_cell_value(vTestCaseResultsfile, vTestCaseResultsheet, 1, 3, "TestCaseDescription")
        oXLLib.set_xl_cell_value(vTestCaseResultsfile, vTestCaseResultsheet, 1, 4,vTCDescription)

        oXLLib.set_xl_cell_value(vTestCaseResultsfile, vTestCaseResultsheet, 3, 1, "Test Case Steps")
        oXLLib.set_xl_cell_value(vTestCaseResultsfile, vTestCaseResultsheet, 3, 2,"Action")
        oXLLib.set_xl_cell_value(vTestCaseResultsfile, vTestCaseResultsheet, 3, 3, "Expected Result")
        oXLLib.set_xl_cell_value(vTestCaseResultsfile, vTestCaseResultsheet, 3, 4, "Actual Result")
        oXLLib.set_xl_cell_value(vTestCaseResultsfile, vTestCaseResultsheet, 3, 5, "Execution Status")
        oXLLib.set_xl_cell_value(vTestCaseResultsfile, vTestCaseResultsheet, 3, 6, "Comments")
        oXLLib.set_xl_cell_value(vTestCaseResultsfile, vTestCaseResultsheet, 3, 7, "DateTime")

    def update_run_test_results_file(self,vTestResultsfile, vTestResultsheet,irow,vtcname,vtcdescription,status,UpdatedDateTimeStamp,TestData):
        oXLLib = XLLib.XLLib()
        oXLLib.create_workbook(vTestResultsfile, vTestResultsheet)
        oXLLib.set_xl_cell_value(vTestResultsfile, vTestResultsheet, irow, 1, vtcname)
        oXLLib.set_xl_cell_value(vTestResultsfile, vTestResultsheet, irow, 2, vtcdescription)
        oXLLib.set_xl_cell_value(vTestResultsfile, vTestResultsheet, irow, 3, status)
        oXLLib.set_xl_cell_value(vTestResultsfile, vTestResultsheet, irow, 4, UpdatedDateTimeStamp)
        oXLLib.set_xl_cell_value(vTestResultsfile, vTestResultsheet, irow, 5, TestData)

    def get_test_case_row_number(self,file,sheetname,TCName):
        irow = 0
        i = 1
        imax = XLLib.get_XL_row_count(file, sheetname)

        for x in range(i, imax):
            if XLLib.get_XL_cell_value(file,sheetname,x,1) == TCName :
                irow = x
                break

        return irow
    """
    
    def check_element_exists_by_xpath(self,driver,xpath):
        try:
            driver.find_element_by_xpath(xpath)
        except NoSuchElementException:
            return False
        return True
    """

    def check_element_exists_by_xpath(self,driver,expath,timeout):
        try:
            element_present = EC.presence_of_element_located((By.XPATH, expath))
            WebDriverWait(driver, timeout).until(element_present)
        except TimeoutException:
            print("Timed out waiting for page to load")
            return False
        return True

    def check_element_exists_by_xpath(self,driver,eid,timeout):
        try:
            element_present = EC.presence_of_element_located((By.ID, eid))
            WebDriverWait(driver, timeout).until(element_present)
        except TimeoutException:
            print("Timed out waiting for page to load")
            return False
        return True

    def scrollDown(self,driver, value):
        driver.execute_script("window.scrollBy(0,"+str(value)+")")

    # Scroll down the page
    def scrollDownAllTheWay(self,driver):
        old_page = driver.page_source
        while True:
            logging.debug("Scrolling loop")
            for i in range(2):
                self.scrollDown(self,driver, 500)
                time.sleep(2)
            new_page = driver.page_source
            if new_page != old_page:
                old_page = new_page
            else:
                break
        return True

    def wait_for_page_element_to_be_visible_xpath(self,driver,expath,timeout) :
        element_visible = EC.visibilityOfElementLocated((By.XPATH , expath))
        WebDriverWait(driver, timeout).until(element_visible);


    def wait_for_page_element_to_be_visible_css(self,driver,expath,timeout) :
        element_visible = EC.visibilityOfElementLocated(expath)
        WebDriverWait(driver, timeout).until(element_visible);


    def check_element_exists_by_element(self,driver,eid,timeout):
        try:
            element_present = EC.presence_of_element_located(eid)
            WebDriverWait(driver, timeout).until(element_present)
            print("element found")
        except TimeoutException:
            print("Timed out waiting for page to load")
            return False
        return True

    def create_run_log(self,vLogfile):
        self.create_directory(self,vLogfile)
        os.environ["Runlog"] = vLogfile


    def write_to_runlog(self,vMsg):
        with open(os.environ["Runlog"], 'a', encoding='utf-8') as f:
             f.write(self.get_current_date_time(self) + " : " + vMsg)





    def Initialize_Driver_variables(self):


        vTestresultsFolder = "C:\\Users\\SANUMOLU\\Documents\\files\TestRail\\results"
        vDate = self.get_current_date(self)
        vDateTime = self.get_current_date_time(self)
        vResultFolder =  vTestresultsFolder + "\\" + datetime.date.today().strftime("%d") + datetime.date.today().strftime("%B") + datetime.date.today().strftime("%Y")
        vTestReultsFile =   vResultFolder + "\\" + "Test Results" + self.get_current_date_time(self) + ".xlsx"
        vLogFile =  vResultFolder + "\\" + "RunLog" + self.get_current_date_time(self) + ".txt"
        self.create_directory(self,vResultFolder)
        time.sleep(5)
        self.create_run_test_results_file(self,vTestReultsFile, "results")
        print("he he " + vTestReultsFile )
        os.environ["TestResultsFile"] = vTestReultsFile
        os.environ["Runlog"] = vLogFile
        os.environ["TestResultsFolder"] = vResultFolder
        os.environ["TestCaseRunStatus"] = "No Run"
        os.environ["TestResultsFileRow"] = "2"



