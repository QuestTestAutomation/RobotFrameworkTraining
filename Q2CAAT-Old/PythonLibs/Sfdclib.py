from ITAFRepo.Dev.Utilities import Utillib
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
from ITAFRepo.Dev.Utilities import Seleniumutil
from ITAFRepo.Dev.Utilities import ExceptionLib
import time


class Sfdclib(Seleniumutil.Seleniumutil):

    def __init__(self,driver,globaldict):
        super(Sfdclib,self).__init__(driver,globaldict)
        self.driver = driver

    def login_into_sfdc(self,url,username,password):
        self.launch_url(url)
        time.sleep(5)
        self.fill_out_field(username, *(By.ID, 'username'))
        self.fill_out_field(password, *(By.ID, 'password'))
        self.click_element(*(By.ID, 'Login'))
        time.sleep(10)


    def get_text_column_value(self,label,labelindex):
        try:
            columnvalue = None
            columnfound = False
            index = 0
            colindex = 0
            #WebDriverWait(self.driver, self.timeout).until(EC.presence_of_element_located((By.CSS_SELECTOR, ".ui-jqgrid-htable")))
            elements = self.driver.find_elements_by_tag_name('td')
            print(len(elements))
            for element in elements:
                if columnfound:
                    columnelements = element.find_elements_by_xpath('.//DIV')
                    print(len(columnelements))
                    if len(columnelements) == 1:
                        print('mantu')
                        columnvalue = element.find_element_by_xpath('.//DIV').text
                        break

                    columnelements = element.find_elements_by_xpath('.//A')
                    print(len(columnelements))
                    if len(columnelements) == 1:
                        print('mantuu')
                        columnvalue = element.find_element_by_xpath('.//a').text
                        break

                if element.get_attribute("class") == "labelCol" and (element.text).upper() == (label).upper():
                    index = index + 1
                    if index == int(labelindex):
                        print('*****--')
                        print(element.text)
                        columnfound = True

            return columnvalue

        except:
            errmsg = 'Error while executing the function get_text_column_value'
            print(errmsg)

    def click_button(self,btntitle,btnindex):
        try:
            index = 0
            colindex = 0
            #WebDriverWait(self.driver, self.timeout).until(EC.presence_of_element_located((By.CSS_SELECTOR, ".ui-jqgrid-htable")))
            elements = self.driver.find_elements_by_css_selector('.btn')
            print(len(elements))
            for element in elements:

                if element.get_attribute("title").upper() == (btntitle).upper():
                    index = index + 1
                    if index == int(btnindex):
                        element.click()
                        break

        except:
            errmsg = 'Error while executing the function get_text_column_value'
            print(errmsg)

    def get_field_id(self, btntitle, btnindex):
        try:
            index = 0
            colindex = 0
            # WebDriverWait(self.driver, self.timeout).until(EC.presence_of_element_located((By.CSS_SELECTOR, ".ui-jqgrid-htable")))
            elements = self.driver.find_elements_by_css_selector('label > span')
            print(len(elements))
            for element in elements:
                print(element.text)
                if element.get_attribute("title").upper() == (btntitle).upper():
                    index = index + 1
                    if index == int(btnindex):
                        element.click()
                        break

        except:
            errmsg = 'Error while executing the function get_text_column_value'
            print(errmsg)


    def click_screen_link(self, screentext, screenindex):
        try:
            elementfound = False
            index = 0
            elements = self.driver.find_elements_by_link_text(screentext)

            if len(elements) != 0:
                for element in elements:
                    index = index + 1
                    if index == int(screenindex):
                        element.click()
                        elementfound = True
                        break
            if not elementfound:
                self.driver.find_element_by_tag_name('b').click()
                elements = self.driver.find_elements_by_link_text(screentext)

                if len(elements) != 0:
                    for element in elements:
                        index = index + 1
                        if index == int(screenindex):
                            element.click()
                            elementfound = True
                            break

        except:
            errmsg = 'Error while executing the function get_text_column_value'
            print(errmsg)