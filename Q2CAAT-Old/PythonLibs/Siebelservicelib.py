import Utillib
from datetime import datetime, timedelta
from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.support.ui import Select
from robot.libraries.BuiltIn import BuiltIn
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
import Seleniumutil
import ExceptionLib
import Souilib
import DateTimelib
import SiebelLib
import time

class Siebelservicelib(SiebelLib.siebellib):

    def __init__(self, driver, globaldict, url,rowdict):
        super(Siebelservicelib, self).__init__(driver, globaldict,url,rowdict)
        self.driver = driver
        self.webserverurl = self.get_webserver_url(url)
        self.rowdict = rowdict

    # self.exceptionlib = ExceptionLib.ExceptionLib()

    """
    
    def __init__(self, driver, globaldict, url,datadict = {} ,rundict = {},resultdict = {}):
        super(Siebelservicelib, self).__init__(driver, globaldict)
        self.driver = driver
        self.webserverurl = self.get_webserver_url(url)
        self.exceptionlib = ExceptionLib.ExceptionLib()
        self.datadict = datadict
        self.rundict = rundict
        self._servicelib = Siebelservicelib.Siebelservicelib
    """

    def load_sr_test_data(self,datafile):

        pass

    def search_contact(self):
        #self.rowdict = datadict
        result = self.query_contact()
        stepdict = {}
        stepdict['expected'] = 'The contact is retrived.'
        stepdict['actual'] = result['actual']
        stepdict['status_id'] = result['status_id']
        return stepdict

    def login(self):
        result = self.Login()
        stepdict = {}
        stepdict['expected'] = 'The user is logged in successfully.'
        stepdict['actual'] = result['actual']
        stepdict['status_id'] = result['status_id']
        return stepdict

    def logout(self):
        self.Logout()
        #time.sleep(20)
        print('inLogout')
        stepdict = {}
        stepdict['expected'] = 'The user is logged out successfully.'
        stepdict['actual'] = 'The user is logged out successfully.'
        stepdict['status_id'] = '1'
        return stepdict


    def create_service_request(self):
        result = self.create_sr()
        stepdict = {}
        stepdict['expected'] = 'The SR is created successfully.'
        stepdict['actual'] = result['actual']
        stepdict['status_id'] = result['status_id']
        return stepdict

    def assign_service_request(self):
        result = self.update_SR_substatus('Assigned')
        stepdict = {}
        stepdict['expected'] = 'The SR SubStatus is updated to Assigned.'
        stepdict['actual'] = result['actual']
        stepdict['status_id'] = result['status_id']
        return stepdict


    def delete_service_request(self):
        result = self.update_sr_status('Deleted')
        stepdict = {}
        stepdict['expected'] = 'The SR Status is updated to Deleted.'
        stepdict['actual'] = result['actual']
        stepdict['status_id'] = result['status_id']
        return stepdict

    def click_on_sitemap(self):
        self.click_sitemap()

        stepdict = {}
        stepdict['expected'] = 'The SR Status is updated to Deleted.'
        stepdict['actual'] = 'Site Map Clicked.'
        stepdict['status_id'] = '1'
        return stepdict

    def click_on_contact(self):
        self.click_view_link('Contacts','L1','1')
        time.sleep(5)
        self.click_view_link('Contact Administration', 'L2', '1')
        time.sleep(5)
        self.click_view_link('Contacts List', 'L2', '1')
        time.sleep(5)

        stepdict = {}
        stepdict['expected'] = 'The SR Status is updated to Deleted.'
        stepdict['actual'] = 'Site Map Clicked.'
        stepdict['status_id'] = '1'
        return stepdict