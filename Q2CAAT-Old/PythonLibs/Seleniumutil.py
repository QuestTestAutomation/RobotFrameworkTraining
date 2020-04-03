from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

from selenium.webdriver.support.ui import Select
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

import time
import datetime


class Seleniumutil(object):
    """
    Base class that all page models can inherit from
    """

    # appurl = "http://stage-o2/"

    def __init__(self, driver, globaldict):
        self.driver = driver
        self.globaldict = globaldict
        self.timeout = int(self.globaldict['ObjectLoadwaittime'])

    def launch_url(self,url):
        self.driver.get(url)
        self.driver.maximize_window()

    def find_element(self, *loc):
        return self.driver.find_element(*loc)

    def find_elements(self, *loc):
        return self.driver.find_element(*loc)

    def fill_form_by_css(self, form_css, value):
        elem = self.driver.find(form_css)
        elem.send_keys(value)

    def fill_form_by_id(self, form_element_id, value):
        return self.fill_form_by_css('#%s' % form_element_id, value)
    """
    
    def navigate(self):
        self.driver.get(self.url)
    """


    def wait_until_element_is_displayed(self, *loc):

        if (loc[0]) == 'link text':
            locatermode = By.LINK_TEXT

        elif (loc[0]) == 'id':
            locatermode = By.ID
        elif (loc[0]) == 'css selector':
            locatermode = By.CSS_SELECTOR
        elif (loc[0]) == 'xpath':
            locatermode = By.XPATH
        elif (loc[0]) == 'class name':
            locatermode = By.CLASS_NAME

        element = None

        try:
            element = WebDriverWait(self.driver, self.timeout).until(
                EC.presence_of_element_located((locatermode, loc[1])))
        except:
            print(" Me unsupported locator exception")
            raise



    def wait_until_page_is_displayed(self, *loc):

        if (loc[1]) == 'link text':
            locatermode = By.LINK_TEXT

        elif (loc[1]) == 'id':
            locatermode = By.ID
        elif (loc[1]) == 'css selector':
            locatermode = By.CSS_SELECTOR
        elif (loc[1]) == 'xpath':
            locatermode = By.XPATH
        elif (loc[1]) == 'class name':
            locatermode = By.CLASS_NAME

        element = None

        try:
            element = WebDriverWait(self.driver, self.timeout).until(
                EC.presence_of_element_located((locatermode, loc[2])))
        except:
            print(" Me unsupported locator exception")
            raise

        return element

    def switch_to_window(self, windowhandle):
        self.driver.switch_to_window(windowhandle)

    def switch_to_iframe(self, *iframeele):
        element = self.find_element(*iframeele)
        self.driver.switch_to.frame(element)

    def switch_back_to_mainwindow(self):
        self.driver.switch_to.default_content

    """

    def find_element(self,locatormode,locator):
        element = None
        if locatormode.upper() == "ID":
            element = self.driver.find_element_by_id(locator)

        elif locatormode.upper() == "NAME":
            element = self.driver.find_element_by_id(locator)
        elif locatormode.upper() == "XPATH":
            element = self.driver.find_element_by_id(locator)
        elif locatormode.upper() == "CSS":
            element = self.driver.find_element_by_id(locator)
        elif locatormode.upper() == "LINKTEXT":
            element = self.driver.find_element_by_id(locator)
        elif locatormode.upper() == "PLINKTEXT":
            element = self.driver.find_element_by_id(locator)
        else:
            raise Exception("unsupported locator exception")
        return element
    """

    def fill_out_field(self, value, *loc):
        self.wait_until_element_is_displayed(*loc)
        element = self.find_element(*loc)
        if element.is_displayed():
            element.clear()
            element.send_keys(value)
        else:
            raise Exception("The Element is not found")

    def fill_out_field_textarea(self, value, *loc):
        self.wait_until_element_is_displayed(*loc)
        element = self.find_element(*loc)
        if element.is_displayed():

            element.send_keys(value)
        else:
            raise Exception("The Element is not found")

    def add_file(self, value, *loc):
        try:

            element = self.find_element(*loc)
            element.send_keys(value)
        except:
            raise Exception("The Element is not found")

    def click_element(self, *loc):

        self.wait_until_element_is_displayed(*loc)

        element = self.find_element(*loc)
        if element.is_displayed():
            element.click()

        else:
            raise Exception("The Element is not found")

    def select_dropdown_value(self, displaytext, *loc):
        self.wait_until_element_is_displayed(*loc)
        element = self.find_element(*loc)
        self.click_element(*loc)
        selelement = Select(element)
        time.sleep(5)
        for option in selelement.options:
            # print(option.text)
            if (option.text).upper() == (displaytext).upper():
                selelement.select_by_value(option.get_attribute('value'))

        # selelement.select_by_visible_text(displaytext)

    def select_multiple_options(self, displaytext, delimiter, *loc):
        listvalues = (displaytext).split(delimiter)

        for listvalue in listvalues:
            selelement = Select(self.find_element(*loc))
            for option in selelement.options:
                # print(option.text)
                if (option.text).upper() == (listvalue).upper():
                    selelement.select_by_value(option.get_attribute('value'))
                    time.sleep(5)

    def send_keyboard_keys(self,keyvalue):
        self.driver.find_element_by_tag_name('body').send_keys(keyvalue)

    def get_webpage_url(self):
        return self.driver.current_url

class Incorrectpageexception(Exception):
    """
    Handles Exception
    """

