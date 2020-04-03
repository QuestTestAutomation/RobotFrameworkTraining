import Utillib
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
import DateTimelib
import Souilib
import DateTimelib
from datetime import datetime, timedelta
import time
import pytz

class siebellib(Souilib.Souilib):

    def __init__(self, driver, globaldict, url, rowdict):
        super(siebellib, self).__init__(driver, globaldict,url)
        self.driver = driver
        self.webserverurl = self.get_webserver_url(url)
        #self.exceptionlib = ExceptionLib.ExceptionLib()
       # self.datadict = datadict
        #self.rundict = rundict
        self.rowdict = rowdict


    def query_contact(self):
        rowdict = self.rowdict
        #self.click_sitemap()
        time.sleep(2)
        #self.click_sitemap_screen_link('Contacts')
        #self.open_ui_sync()
        #time.sleep(2)
        #self.click_sitemap_screen_view_linkid('Contacts List', '1')
        self.click_sitemap_screen_view_linkid('All Contacts', '1')
        self.open_ui_sync()
        self.wait_for_button('Query','1')
        time.sleep(2)
        self.click_button('Query','1')
        self.open_ui_sync()
        time.sleep(2)
        self.click_button('Cancel', '1')
        self.open_ui_sync()
        time.sleep(2)
        self.click_button('Query', '1')
        self.open_ui_sync()
        time.sleep(8)
        print('66666666666666666666666666666666666666')
        print(rowdict['Email'])
        #self.set_form_applet_input_value('Account Name', rowdict['AccountName'])
        print(EC.alert_is_present() == None)
       # self.set_form_applet_input_value('Email',rowdict['Email'])
        print('Email is :' + rowdict['Email'])
        self.set_list_applet_column_value('Email','1','1','1',rowdict['Email'])

        print('Email is :' + rowdict['AccountName'])
        self.set_list_applet_column_value('Account', '1', '1', '1', rowdict['AccountName'])

        self.wait_for_button('Go', '1')
        time.sleep(3)
        self.click_button('Go', '1')
        time.sleep(3)
        self.open_ui_sync()
        self.wait_for_button('Query', '1')
        result = {}
        result['actual'] = 'The contact ' + rowdict['Email'] + 'is retrived.'
        result['status_id'] = '1'
        return result


    def create_sr(self):
        print('777777777777777777777777777777777777777777777777777777777777777777777')
        rowdict = self.rowdict
        print('777777777777777777777777777777777777777777777777777777777777777777777')
        print(rowdict)
        Product = rowdict['Product']
        Summary = rowdict['Summary']
        Asset = rowdict['Assets']
        self.query_contact()
        self.drilldown_on_list_applet_column('Last Name', '1', '1', '1')
        time.sleep(2)
        self.click_view_link('Contact Software SR','L3','1')
        time.sleep(2)
        self.click_button('New',2)
        time.sleep(2)
        self.set_list_applet_column_value('Product', '1', '1', '1', Product)
        self.set_list_applet_column_value('Summary', '1', '1', '1', Summary)
        time.sleep(3)
        if not Asset == None:
            self.set_list_applet_column_value('End User Asset #', '1', '1', '1', Asset)
            time.sleep(3)
            self.send_keyboard_keys(Keys.TAB)

            self.open_ui_sync()
            time.sleep(8)
            elements = self.driver.find_elements_by_xpath('//*[@aria-label="Pick Asset:OK"]')
            if len(elements) == 1:
                print('&&&&&&&&&&&&&&&&&&&&&&&&&&&& I found popup')
                self.driver.find_element_by_xpath('//*[@aria-label="Pick Asset:OK"]').click()
                self.open_ui_sync()
                time.sleep(3)
       
        self.save_record()
        time.sleep(3)
        self.open_ui_sync()
        time.sleep(8)
        SR = self.get_list_applet_column_value('SR #','1','1','1')
        print(SR)
        self.click_on_list_applet_column('Summary','1','1','1')
        time.sleep(3)
        self.drilldown_on_list_applet_column('SR #','1','1','1')
        time.sleep(3)
        self.wait_for_button('New','1')
        elements = self.driver.find_elements_by_xpath('//*[@id="s_1_1_108_0"]/a/img')
        if len(elements) == 1:
            print('&&&&&&&&&&&&&&&&&&&&&&&&&&&& I found show more')
            element = self.driver.find_element_by_xpath('//*[@id="s_1_1_108_0"]/a/img')
            self.driver.execute_script("arguments[0].scrollIntoView()", element)
            self.driver.find_element_by_xpath('//*[@id="s_1_1_108_0"]/a/img').click()
            self.open_ui_sync()
            time.sleep(3)
        SLAExpriyTimeActual = self.get_form_applet_input_value('SLA Expiry Time')
        Support = self.get_form_applet_input_value('Premier')
        EntitlementRegion = self.get_form_applet_input_value('Entitlement Region')
        Severity = self.get_form_applet_input_value('Severity')
        OpenDate = self.get_form_applet_input_value('Date Opened')
        print('SLAExpriyTimeActual : ' + SLAExpriyTimeActual)
        print('Support   : ' + Support)
        print('EntitlementRegion   : ' + EntitlementRegion)
        print('Severity   : ' + Severity)

        if SLAExpriyTimeActual and SLAExpriyTimeActual.strip() :
            SLAExpriyTimeCalculated = self.calculate_sla_expiry_time(OpenDate,EntitlementRegion,Severity,Support)
            print('SLAExpriyTimeCalculated : ' + SLAExpriyTimeCalculated)
            SLAExpirytimediff = DateTimelib.datetimelib.subtract_dates(SLAExpriyTimeActual, SLAExpriyTimeCalculated)
            print(SLAExpirytimediff)
            if SLAExpirytimediff < 60:
                print('Entitlement verification is pass.')
            else :
                print('Entitlement verification has failed. The SLA Expiry time in Siebel is ' + SLAExpriyTimeActual + '. The calculated SLA Expiry time is ' + SLAExpriyTimeCalculated + ' .')

        #self.click_sitemap()
        result = {}
        result['actual'] = SR
        #result['actual'] = 'The Sr ' + SR + ' is created. The Entitlement verification has failed. The SLA Expiry time in Siebel is ' + SLAExpriyTimeActual + '. The calculated SLA Expiry time is ' + SLAExpriyTimeCalculated + ' .'
        result['status_id'] = '1'
        return result

    def get_next_working_day(self,srdate,workingdays):
        srdate = srdate + timedelta(days=1)
        for i in range(1, 3):
            if bool(srdate.weekday() not in workingdays):
                srdate = srdate + timedelta(days=1)

            elif bool(srdate.weekday() in workingdays):
                break
        return srdate


    def set_SLA_dictinoary(self):
        SLAdict = {}
        SLAdict['ALL_Start'] = '00:00:00'
        SLAdict['ALL_End'] = '23:59:59'
        SLAdict['AMER_Start'] = '05:00:00'
        SLAdict['AMER_End'] = '17:00:00'
        SLAdict['EMEA_Start'] = '00:00:00'
        SLAdict['EMEA_End'] = '09:30:00'
        SLAdict['JAPAN_Start'] = '17:00:00'
        SLAdict['JAPAN_End'] = '02:00:00'
        SLAdict['JAPAN_Start_DST'] = '16:00:00'
        SLAdict['JAPAN_End_DST'] = '01:00:00'
        SLAdict['APAC_Start'] = '15:00:00'
        SLAdict['APAC_End'] = '02:00:00'
        SLAdict['APAC_Start_DST'] = '14:00:00'
        SLAdict['APAC_End_DST'] = '01:00:00'
        SLAdict['APMER_workdays'] = (0, 1, 2, 3, 4)
        SLAdict['EMEA_workdays'] = (0, 1, 2, 3, 4)
        SLAdict['JAPAN_workdays'] = (0, 1, 2, 3, 4, 6)
        SLAdict['APAC_workdays'] = (0, 1, 2, 3, 4, 6)
        SLAdict['ALL_workdays'] = (0, 1, 2, 3, 4, 6)
        SLAdict['STD_Level1'] = (3600 - 3)
        SLAdict['STD_Level2'] = (7200 - 3)
        SLAdict['STD_Level3'] = (14400 - 3)
        SLAdict['STD_Level4'] = (28800 - 3)
        SLAdict['Premier_Level1'] = (1800 - 3)
        SLAdict['Premier_Level2'] = (3600 - 3)
        SLAdict['Premier_Level3'] = (7200 - 3)
        SLAdict['Premier_Level4'] = (14400 - 3)


        return SLAdict


    def calculate_sla_expiry_time(self,SROpenDatetime,EntitlementRegion,severity,support):
        SRopendate = datetime.strptime(SROpenDatetime, '%m/%d/%Y %I:%M:%S %p').date()

        SLAdict = self.set_SLA_dictinoary()
        # set entitlement start and end date
        if EntitlementRegion.upper() == 'AMER'.upper():
            entstarttime = SLAdict['AMER_Start']
            entendtime = SLAdict['AMER_End']
            entitlementworkingdays = SLAdict['APMER_workdays']
        elif EntitlementRegion.upper() == 'ALL'.upper():
            entstarttime = SLAdict['ALL_Start']
            entendtime = SLAdict['ALL_End']
            entitlementworkingdays = SLAdict['ALL_workdays']
        elif EntitlementRegion.upper() == 'EMEA'.upper():
            entstarttime = SLAdict['EMEA_Start']
            entendtime = SLAdict['EMEA_End']
            entitlementworkingdays = SLAdict['EMEA_workdays']
        elif EntitlementRegion.upper() == 'EMEA'.upper():
            entstartdatetime = str(SRopendate) + ' ' + SLAdict['EMEA_Start']
            entenddatetime = str(SRopendate) + ' ' + SLAdict['EMEA_End']
            entitlementworkingdays = SLAdict['EMEA_workdays']
        elif EntitlementRegion.upper() == 'JAPAN'.upper():
            isdst = DateTimelib.datetimelib.verify_date_is_dst(SROpenDatetime, 'US/Pacific')
            if isdst:
                entstarttime = SLAdict['JAPAN_Start_DST']
                entendtime = SLAdict['JAPAN_End_DST']
                entitlementworkingdays = SLAdict['JAPAN_workdays']
            else:
                entstarttime = SLAdict['JAPAN_Start']
                entendtime = SLAdict['JAPAN_End']
                entitlementworkingdays = SLAdict['JAPAN_workdays']
        elif EntitlementRegion.upper() == 'APAC'.upper():
            isdst = DateTimelib.datetimelib.verify_date_is_dst(SROpenDatetime, 'US/Pacific')
            if isdst:
                entstarttime = SLAdict['APAC_Start_DST']
                entendtime = SLAdict['APAC_End_DST']
                entitlementworkingdays = SLAdict['APAC_workdays']
            else:
                entstarttime = SLAdict['APAC_Start']
                entendtime = SLAdict['APAC_End']
                entitlementworkingdays = SLAdict['APAC_workdays']

        # format date
        SRopendatetimef = datetime.strptime(SROpenDatetime, '%m/%d/%Y %I:%M:%S %p')

        # Set SLA start Date
        if (bool(SRopendate.weekday()) in entitlementworkingdays):
            tempstartdate = SRopendate

        else:
            tempstartdate = self.Siebelservicelib.get_next_working_day(SRopendatetimef.date(), entitlementworkingdays)

        entstartdatetime = str(tempstartdate) + ' ' + entstarttime
        if EntitlementRegion.upper() == 'APAC'.upper() or EntitlementRegion.upper() == 'JAPAN'.upper():
            tempenddate = tempstartdate + timedelta(days=1)
        else:
            tempenddate = tempstartdate
        entenddatetime = str(tempenddate) + ' ' + entendtime

        entstartdatetimef = datetime.strptime(entstartdatetime, "%Y-%m-%d %H:%M:%S")
        entenddatetimef = datetime.strptime(entenddatetime, "%Y-%m-%d %H:%M:%S")
        SRopendatetimef = datetime.strptime(SROpenDatetime, '%m/%d/%Y %I:%M:%S %p')

        if bool(entstartdatetimef < SRopendatetimef < entenddatetimef):
            SLAstartdatetime = SRopendatetimef
        elif SRopendatetimef > entenddatetimef:
            SLAstartdate = self.get_next_working_day(SRopendatetimef.date(), entitlementworkingdays)
            SLAstartdatetime = datetime.strptime(str(SLAstartdate) + ' ' + entstarttime, "%Y-%m-%d %H:%M:%S")
        elif SRopendatetimef <= entstartdatetimef:
            SLAstartdatetime = entstartdatetimef
        print('SLAstartdatetime')
        print(SLAstartdatetime)
        # Calculate End Date based on start date
        if EntitlementRegion.upper() == 'APAC'.upper() or EntitlementRegion.upper() == 'JAPAN'.upper():
            tempenddate = tempstartdate + timedelta(days=1)
        else:
            tempenddate = tempstartdate
            ""
        entenddatetime = str(tempenddate) + ' ' + entendtime

        print('entenddatetime')
        print(entenddatetime)
        # format dates
        entstartdatetimef = datetime.strptime(entstartdatetime, "%Y-%m-%d %H:%M:%S")
        entenddatetimef = datetime.strptime(entenddatetime, "%Y-%m-%d %H:%M:%S")

        if (severity.upper() == 'Level 1'.upper()) and (support.upper() == 'Y'.upper()):
            SLAtime = SLAdict['Premier_Level1']
        elif (severity.upper() == 'Level 2'.upper()) and (support.upper() == 'Y'.upper()):
            SLAtime = SLAdict['Premier_Level2']
        elif (severity.upper() == 'Level 3'.upper()) and (support.upper() == 'Y'.upper()):
            SLAtime = SLAdict['Premier_Level3']
        elif (severity.upper() == 'Level 4'.upper()) and (support.upper() == 'Y'.upper()):
            SLAtime = SLAdict['Premier_Level4']

        elif (severity.upper() == 'Level 1'.upper()) and (support.upper() == 'N'.upper()):
            SLAtime = SLAdict['STD_Level1']
        elif (severity.upper() == 'Level 2'.upper()) and (support.upper() == 'N'.upper()):
            SLAtime = SLAdict['STD_Level2']
        elif (severity.upper() == 'Level 3'.upper()) and (support.upper() == 'N'.upper()):
            SLAtime = SLAdict['STD_Level3']
        elif (severity.upper() == 'Level 4'.upper()) and (support.upper() == 'N'.upper()):
            SLAtime = SLAdict['STD_Level4']

        print(SLAtime)

        # determine SLA exprity time.

        tempSLAenddatetime = SLAstartdatetime + timedelta(seconds=SLAtime)
        print(tempSLAenddatetime)
        print(entenddatetimef)
        print(tempSLAenddatetime <= entenddatetimef)
        if tempSLAenddatetime < entenddatetimef:
            SLAenddatetimef = tempSLAenddatetime
        elif tempSLAenddatetime > entenddatetimef:
            tempenddate = self.get_next_working_day(SRopendatetimef.date(), entitlementworkingdays)
            print('tempenddate')
            print(tempenddate)
            tempSLAstartdatetime = datetime.strptime(str(tempenddate) + ' ' + entstarttime, "%Y-%m-%d %H:%M:%S")
            print('tempSLAstartdatetime')
            print(tempSLAstartdatetime)
            tempdeltatime = tempSLAenddatetime - entenddatetimef
            print(tempdeltatime.total_seconds())
            SLAenddatetimef = tempSLAstartdatetime + timedelta(seconds=tempdeltatime.total_seconds())
        print('tempSLAenddatetime')
        print(tempSLAenddatetime)
        print(SLAenddatetimef)
        # print(time.strftime('%m/%d/%Y %I:%M:%S %p',SLAenddatetimef))
        print(SLAenddatetimef.strftime('%m/%d/%Y %I:%M:%S %p'))
        return SLAenddatetimef.strftime('%m/%d/%Y %I:%M:%S %p')

        return result


    def update_SR_substatus(self,substatus):
        rowdict = self.rowdict

        self.select_form_applet_input_value('substatus', substatus)
        self.save_record()
        time.sleep(3)
        self.open_ui_sync()
        result = {}
        result['actual'] = 'The Sr substatus is updated.'
        result['status_id'] = '1'
        print('search and publish ' + str(result))
        return result

    def update_sr_status(self,status):
        self.click_view_link('Related SRs','L3','1')
        time.sleep(3)
        self.open_ui_sync()
        self.select_form_applet_input_value('status', status)
        self.save_record()
        time.sleep(3)
        self.open_ui_sync()
        result = {}
        result['actual'] = 'The Sr status is updated.'
        result['status_id'] = '1'
        print('search and publish ' + str(result))
        return result

    def Login(self):
        rowdict = self.rowdict
        print('****')
        print(rowdict)
        result = self.Login_lite(rowdict['Url'],rowdict['UserName'],rowdict['Password'])
        result = {}
        result['actual'] = 'The uer is logged in sucessfully created.'
        result['status_id'] = '1'
        return result











        """
        
        recordcount = self.get_record_count()
        print('****')
        print(recordcount)
        print(recordcount == '1')
        if str(recordcount) == '1':
            time.sleep(5)
            self.query_contact()
            self.click_on_list_applet_column('First Name', '1', '1', '1')
            self.drilldown_on_list_applet_column('Last Name', '1', '1', '1')
            time.sleep(3)
            #self.open_ui_sync()
        """



