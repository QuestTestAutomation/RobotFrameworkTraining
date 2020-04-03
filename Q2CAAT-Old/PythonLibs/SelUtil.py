import time
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



class SelUtil():
#    def get_webdriver_instance1(self):
#        sellib = BuiltIn().get_library_instance('SeleniumLibrary')
#        return sellib._current_browser()
    
     def get_webdriver_instance(self):
          seleniumlib = BuiltIn().get_library_instance('SeleniumLibrary')
          # following line returns WebDriver initiated in robot-framework
          webdriver = seleniumlib.driver
          return webdriver
    
     def Click_Element_By_Xpath(self,driver,elementpath):
        #driver.execute_script("arguments[0].scrollIntoView()", driver.find_element_by_xpath(elementpath)) 
        driver.find_element_by_xpath(elementpath).click()
        
     def Element_scroll_into_view_By_Xpath(self,driver,elementpath):
        time.sleep(5) 
        driver.execute_script("arguments[0].scrollIntoView()", driver.find_element_by_xpath(elementpath))        
        time.sleep(5) 
        
        
     def Get_Element_Attribute_custom(self,driver,elementpath,attribute):
         #driver.execute_script("arguments[0].scrollIntoView()", driver.find_element_by_xpath(elementpath)) 
         print("Hello world")
         element = driver.find_element_by_xpath(elementpath)
         print(element)
         attributevalue = element.get_attribute(attribute) 
         print(attributevalue)
         return attributevalue
     
     def Get_Element_Text(self,driver,elementpath):
         #driver.execute_script("arguments[0].scrollIntoView()", driver.find_element_by_xpath(elementpath)) 
         print("Hello world")
         element = driver.find_element_by_xpath(elementpath)
         #elements = river.find_elements_by_css_selector('div.mceGridField')
         print(element)
         print (len(driver.find_elements_by_xpath(elementpath)))
         attributevalue = element.text
         print(attributevalue)
         return attributevalue