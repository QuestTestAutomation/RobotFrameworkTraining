
from selenium.webdriver.common.by import By


#content_management_lnk = (By.LINK_TEXT, 'Content Reporting')
cmgmt_contentmanagement_lnk = (By.LINK_TEXT, 'Content Management')
cmgmt_Document_lnk = (By.LINK_TEXT,'Docs')
cmgmt_WhitePaper_lnk = (By.LINK_TEXT,'White Paper')
#cmgmt_searchkeyword_tbox = (By.XPATH,"SearchKeyword")
#cmgmt_searchkeyword_tbox = (By.ID,"SearchKeyword")
cmgmt_NewWhitePaper_btn = (By.XPATH,'//input[@type="button"][@value="New White Paper"]')
cmgmt_Language_sel = (By.ID,'LanguageId')
cmgmt_Localizedtitle_tbox = (By.ID,'DisplayName')
cmgmt_Englishname_tbox = (By.ID,'Name')
cmgmt_Statedate_dt = (By.ID,'LiveDateUtc')
cmgmt_Enddate_dt = (By.ID,'ExpireDateUtc')
cmgmt_Owner_tbox = (By.ID,'OwnedByUser')
cmgmt_Englishname_tbox = (By.ID,'Name')
cmgmt_Search_btn = (By.XPATH,'//input[@type="button"][@value="Search"]')

"""
Registration Radio Button
"""
cmgmt_registration_link_url_radio = (By.ID,'Reg_LinkUrl')
cmgmt_registration_upload_document_radio = (By.ID,'Reg_UploadDocument')
cmgmt_registration_fullregistrationlead_radio = (By.ID,'Reg_FullRegLead')

"""
Registration Radio Button
"""


cmgmt_Searchkeyword_tbox = (By.ID,'SearchKeyword')
cmgmt_Searchkeyword_btn = (By.ID,'btn_Search')
cmgmt_PageTitle_tbox = (By.ID,'PageTitleTag')
cmgmt_Abstract_tbox = (By.XPATH,'//*[@id="InfoToolTip"]')
cmgmt_PageMetaKeyword_tbox = (By.ID,'PageMetaKeyword')
cmgmt_PageMetaDescription_tbox = (By.ID,'PageMetaDescription')
cmgmt_Description_iframe = (By.XPATH, '//*[@id="EditDocumentTable"]/tbody/tr[15]/td[2]/table/tbody/tr[2]/td/iframe')
cmgmt_Description_tbox = (By.XPATH,'/html/body')
cmgmt_Author_tbox = (By.ID,'Author')
cmgmt_DocumentDate_tbox = (By.ID,'AssetInfoDate')
cmgmt_BuyersJourney_sel = (By.ID,'BuyersJourneyMmdEntityId')
cmgmt_RelatedProducts_sel = (By.ID,'lbxProductsAvailable')
cmgmt_addrelatedproduct_btn = (By.XPATH,'.//input[contains(@onclick, "lbxProductsAvailable")]')
cmgmt_FileUpload_btn = (By.XPATH,'//input[@type="button"][@id="btn_Uploader"]')
cmgmt_SelectFiles_btn = (By.XPATH,'//*[@id="FileUploaderKendoPanel_wnd_title"]]')
cmgmt_SelectFiles_tbox = (By.XPATH,'//*[@id="_files_kendo"]')
#cmgmt_uploaddocument = (By.ID,'FileUploaderKendoPanel')
cmgmt_closefiles_btn = (By.XPATH,'//*[@id="_closefileuploaderkendo"]')
cmgmt_saveandarchive_btn = (By.CSS_SELECTOR,'#btn_Save')
cmgmt_publish_btn = (By.XPATH,'//input[@type="submit"][@id="btn_Publish"][@value="Publish Live"]')
cmgmt_archive_btn = (By.XPATH,'//input[@type="submit"][@id="btn_Archive"][@value="Archive"]')
cmgmt_Marketingintrest_sel = (By.ID,'AssetCodeProductId')
cmgmt_Leadform_sel = (By.ID,'AssetCodeProductId')
cmgmt_Assetcode_tbox = (By.XPATH,'//*[@id="AssetCode"]')
cmgmt_Filename_tbox = (By.CSS_SELECTOR,'#tr_Name > td:nth-child(2) > input:nth-child(1)')
cmgmt_Filedescription_tbox = (By.XPATH,'/html/body')
cmgmt_FileVersion_tbox = (By.XPATH,'//*[@id="Version"]')
cmgmt_FileLastUpdated_tbox = (By.XPATH,'//*[@id="LastUpdated"]')
cmgmt_FileDescription_iframe = (By.XPATH, '//*[@id="tr_Description"]/td[2]/table/tbody/tr[2]/td/iframe')
cmgmt_Fileselection_sel = (By.ID,'uploadDropdown')
cmgmt_Addfile_btn = (By.XPATH,'//input[@type="button"][@value="Add File"]')
cmgmt_Addfile_save_btn = (By.CSS_SELECTOR,'#form_data_File > input:nth-child(2)')
cmgmt_Addfile_cancel_btn = (By.CSS_SELECTOR,'#form_data_File > input:nth-child(3)')
cmgmt_Linkfileupload_btn = (By.XPATH,'//input[@type="button"][@id="btnUploadFile"][@value="Upload File"]')
cmgmt_addemail_lnk = (By.LINK_TEXT,'Add...')
cmgmt_Emailsubject_tbox = (By.XPATH,'//*[@id="tbxInternalEmailSubject"]')
cmgmt_EmailTo_tbox = (By.CSS_SELECTOR,'#tbxInternalEmailTo')
cmgmt_EmailBody_tbox = (By.XPATH,'//*[@id="tbxInternalEmailBody"]')
cmgmt_EmailSave_btn = (By.XPATH,'//input[@type="button"][@id="btnInternalEmailSave"][@value="Save"]')
cmgmt_EmailCancel_btn = (By.XPATH,'//input[@type="button"][@id="btnInternalEmailCancel"][@value="Cancel"]')




