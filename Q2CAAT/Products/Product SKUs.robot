*** Settings ***
Resource    ../Resources/Commons/Global Setup.robot
Resource    ../Resources/Commons/SFDC Common Variables.robot
Resource    ../Resources/SFDC POM/Login/Login.robot
Resource    ../Resources/SFDC POM/Common Elements/Details Page.robot
Resource    ../Resources/SFDC POM/SFDC Navigation/Search and Open SFDC Objects.robot
Resource    ../Resources/SFDC POM/Opportunities/Oppties Validations.robot
Resource    ../Resources/SFDC POM/Quotes/Quote Operations.robot
Resource    ../Resources/SFDC POM/Quote Lines/Quote Lines Operations.robot
Resource    ../Resources/SFDC POM/Quote Lines/Quote Lines Validations.robot
Suite Setup      Products SKU Suite Setup
#Test Setup       Login To SFDC sandbox
Suite Teardown    Test Teardown

*** Variables ***
${NEW_QUOTE_NUMBER}          ${None}
${NEW_QUOTE_ID}              ${None}

*** Test Cases ***
Validate filter dropdown for BU "Data Protection and Unified Endpoint Management"
    [Template]    Select Product Filters
    [Tags]    C317537
       #|================================================================================================================================================|
       #| Product Business Unit                            | Product Solution Area         | Product Family              | Product Interest              |
       #|================================================================================================================================================|
          Data Protection and Unified Endpoint Management    Data Protection                BDRS                           Backup & Disaster Recovery Ste 
          Data Protection and Unified Endpoint Management    Data Protection                DL Series                      DL1000
          Data Protection and Unified Endpoint Management    Data Protection                DL Series                      DL1300
          Data Protection and Unified Endpoint Management    Data Protection                DL Series                      DL4000
          Data Protection and Unified Endpoint Management    Data Protection                DL Series                      DL4300
          Data Protection and Unified Endpoint Management    Data Protection                DL Series                      MD1200 DL Series
          Data Protection and Unified Endpoint Management    Data Protection                DL Series                      MD1400 DL Series
          Data Protection and Unified Endpoint Management    Data Protection                DR Series                      DR2000v
          Data Protection and Unified Endpoint Management    Data Protection                DR Series                      DR4000
          Data Protection and Unified Endpoint Management    Data Protection                DR Series                      DR4100
          Data Protection and Unified Endpoint Management    Data Protection                DR Series                      DR4300
          Data Protection and Unified Endpoint Management    Data Protection                DR Series                      DR6000
          Data Protection and Unified Endpoint Management    Data Protection                DR Series                      DR6300
          Data Protection and Unified Endpoint Management    Data Protection                DR Series                      MD1200 DR Series
          Data Protection and Unified Endpoint Management    Data Protection                DR Series                      MD1400 DR Series
          Data Protection and Unified Endpoint Management    Data Protection                DR Series                      QORESTOR
          Data Protection and Unified Endpoint Management    Data Protection                DR Series                      SHIPPING & HANDLING
          Data Protection and Unified Endpoint Management    Data Protection                Foglight for Virtualization    Foglight for Active Directory
          Data Protection and Unified Endpoint Management    Data Protection                Foglight for Virtualization    Foglight for Exchange
          Data Protection and Unified Endpoint Management    Data Protection                Foglight for Virtualization    Foglight for StorageManagement
          Data Protection and Unified Endpoint Management    Data Protection                Foglight for Virtualization    Foglight for Virtualization Ent Ed
          Data Protection and Unified Endpoint Management    Data Protection                Foglight for Virtualization    Foglight for Virtualization Std Ed
          Data Protection and Unified Endpoint Management    Data Protection                Foglight for Virtualization    vFundamentals
          Data Protection and Unified Endpoint Management    Data Protection                Foglight for Virtualization    vOptimizer
          Data Protection and Unified Endpoint Management    Data Protection                NetVault                       NetVault Backup
          Data Protection and Unified Endpoint Management    Data Protection                NetVault                       Quest NetVault Replicator
          Data Protection and Unified Endpoint Management    Data Protection                NetVault                       DP Compliance
          Data Protection and Unified Endpoint Management    Data Protection                Rapid Recovery                 AppAssure
          Data Protection and Unified Endpoint Management    Data Protection                Rapid Recovery                 Doc Retriever for SharePoint
          Data Protection and Unified Endpoint Management    Data Protection                vRanger                        vConverter
          Data Protection and Unified Endpoint Management    Data Protection                vRanger                        vRanger
          Data Protection and Unified Endpoint Management    Data Protection                vRanger                        vReplicator
          Data Protection and Unified Endpoint Management    Data Protection                VROOM                          VROOM
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    Desktop Authority              DA Remote Mgmt
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    Desktop Authority              Desktop Authority
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    Desktop Authority              Desktop Auth Passwd Self-svc
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    Desktop Authority              Help Desk Authority
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    Desktop Authority              Patch Authority
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    Desktop Authority              Privilege Authority
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    Desktop Authority              ScriptLogic Other
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    Desktop Authority              DA Image Center
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    K3000                          K3000 Mobile Management Appli
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    KACE as a Service              K1000 as a Service
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    KACE as a Service              KACE as a Service
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    KACE Cloud                     KACE Cloud MDM
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    KACE Maintenance               KACE Maintenance
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    KACE SDA                       K2000 Systems Deployment Appli
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    KACE SDA                       Systems Deployment Appliance
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    KACE Services                  KACE Services
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    KACE SMA                       K1000 Systems Management Appli
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    KACE SMA                       Systems Management Appliance
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    KACE SMA                       UEM Compliance
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    QMX                            QMX - OM 2007 Edition
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    QMX                            Quest Management Xtensions SMS
          Data Protection and Unified Endpoint Management    Unified Endpoint Management    RemoteScan                     RemoteScan

Validate filter dropdown for BU "Identity and Security Management"
    [Template]    Select Product Filters    
    [Tags]    C317538
       #|================================================================================================================================================|
       #| Product Business Unit                            | Product Solution Area         | Product Family              | Product Interest              | 
       #|================================================================================================================================================|  
          Identity and Security Management                   One Identity                    Access Management             Active Roles
          Identity and Security Management                   One Identity                    Access Management             ActiveRoles Quick Connect
          Identity and Security Management                   One Identity                    Access Management             Cloud Access Manager
          Identity and Security Management                   One Identity                    Access Management             Defender
          Identity and Security Management                   One Identity                    Access Management             Enterprise Single Sign-on
          Identity and Security Management                   One Identity                    Access Management             OI Compliance
          Identity and Security Management                   One Identity                    Access Management             Password Manager
          Identity and Security Management                   One Identity                    Access Management             Virtual Directory Server
          Identity and Security Management                   One Identity                    Balabit LOG                   SYSLOG-NG STORE BOX
          Identity and Security Management                   One Identity                    Balabit LOG                   SYSLOG-NG PREMIUM EDITION
          Identity and Security Management                   One Identity                    Balabit PAM                   PRIVILEGED SESSIONS
          Identity and Security Management                   One Identity                    IAM Legacy                    Access Manager
          Identity and Security Management                   One Identity                    IAM Legacy                    Active Roles Legacy
          Identity and Security Management                   One Identity                    IAM Legacy                    Active Roles Self Service Manager
          Identity and Security Management                   One Identity                    IAM Legacy                    Authorization Policy Server
          Identity and Security Management                   One Identity                    IAM Legacy                    InSync
          Identity and Security Management                   One Identity                    IAM Legacy                    PassGo zSeries
          Identity and Security Management                   One Identity                    IAM Legacy                    Shipping & Handling - One Identity
          Identity and Security Management                   One Identity                    IAM Legacy                    Single Sign-On for Java
          Identity and Security Management                   One Identity                    IAM Legacy                    Webthority
          Identity and Security Management                   One Identity                    Identity Governance           One Identity Manager
          Identity and Security Management                   One Identity                    Identity Governance           One Identity Manager - Active Directory Edition
          Identity and Security Management                   One Identity                    Identity Governance           One Identity Solution
          Identity and Security Management                   One Identity                    Privileged Management         Authentication Services
          Identity and Security Management                   One Identity                    Privileged Management         Privileged Account Management
          Identity and Security Management                   One Identity                    Privileged Management         Privilege Manager for Sudo
          Identity and Security Management                   One Identity                    Privileged Management         Privilege Manager for Unix
          Identity and Security Management                   One Identity                    Privileged Management         SafeGuard
          Identity and Security Management                   One Identity                    SaaS One Identity             SaaS Access Management
          Identity and Security Management                   One Identity                    SaaS One Identity             SaaS Hybrid Subscription
          Identity and Security Management                   One Identity                    SaaS One Identity             Saas Identity Governance

Validate filter dropdown for BU "Information Management"
    [Template]    Select Product Filters    
    [Tags]    C317539
       #|================================================================================================================================================|
       #| Product Business Unit                            | Product Solution Area         | Product Family              | Product Interest              |
       #|================================================================================================================================================|
          Information Management                             Database Management             Big Brother                   Big Brother
          Information Management                             Database Management             Cloud                         Cloud Automation Platform
          Information Management                             Database Management             DB Legacy                     Capacity Manager for SQLServer
          Information Management                             Database Management             DB Legacy                     DB Legacy
          Information Management                             Database Management             DB Monitoring                 Foglight Database
          Information Management                             Database Management             DB Monitoring                 Foglight DB Perf Anal Oracle
          Information Management                             Database Management             DB Monitoring                 Foglight for DB2
          Information Management                             Database Management             DB Monitoring                 Foglight for Oracle
          Information Management                             Database Management             DB Monitoring                 Foglight for SQL Server
          Information Management                             Database Management             DB Monitoring                 Foglight for Sybase
          Information Management                             Database Management             DB Monitoring                 Performance Analysis for DB2
          Information Management                             Database Management             DB Monitoring                 Performance Analysis SQLServer
          Information Management                             Database Management             Enstratius                    Multi-Cloud Manager
          Information Management                             Database Management             Foglight                      Foglight
          Information Management                             Database Management             Foglight                      Foglight Applications
          Information Management                             Database Management             Foglight                      Foglight End User
          Information Management                             Database Management             Foglight                      Foglight Windows Azure App
          Information Management                             Database Management             Foglight                      PerformaSure
          Information Management                             Database Management             Foglight                      Quest Cloud Storage Mgr Azure
          Information Management                             Database Management             Foglight                      Spotlight on Azure
          Information Management                             Database Management             Foglight                      Continuous Performance Mgmt
          Information Management                             Database Management             Foglight NMS                  Foglight Network Mngmt System
          Information Management                             Database Management             Forge                         PulseNet
          Information Management                             Database Management             Java                          JClass DesktopViews
          Information Management                             Database Management             Java                          JProbe
          Information Management                             Database Management             LiteSpeed                     LiteSpeed Engine for Oracle
          Information Management                             Database Management             LiteSpeed                     LiteSpeed Std for SQL Svr
          Information Management                             Database Management             MPE                           MPE
          Information Management                             Database Management             PacketTrap                    PacketTrap IT
          Information Management                             Database Management             PacketTrap                    PacketTrap MSP
          Information Management                             Database Management             SharePlex                     SharePlex for Oracle
          Information Management                             Database Management             SharePlex                     Space Mgmnt w/Live Option
          Information Management                             Database Management             Spotlight                     IM Compliance
          Information Management                             Database Management             Spotlight                     Spotlight on SQL Server
          Information Management                             Database Management             Spotlight                     Spotlight on SQL Svr Ent
          Information Management                             Database Management             Spotlight Cloud               Spotlight Cloud For SQL Server
          Information Management                             Database Management             Spotlight Tools               Spotlight on DB2
          Information Management                             Database Management             Spotlight Tools               Spotlight on Oracle
          Information Management                             Database Management             Spotlight Tools               Spotlight on Sybase
          Information Management                             Database Management             Spotlight Tools               Spotlight on UNIX
          Information Management                             Database Management             STAT                          Stat
          Information Management                             Database Management             Toad Data Point               Toad Decision Point
          Information Management                             Database Management             Toad Data Point               Toad for Data Analysts
          Information Management                             Database Management             Toad DB2                      Toad for DB2 LUW
          Information Management                             Database Management             Toad DevOps Toolkit           Toad DevOps Toolkit
          Information Management                             Database Management             Toad Edge                     Toad Edge
          Information Management                             Database Management             Toad Oracle                   SQL Navigator
          Information Management                             Database Management             Toad Oracle                   Toad Data Modeler
          Information Management                             Database Management             Toad Oracle                   TOAD for MYSQL
          Information Management                             Database Management             Toad Oracle                   Toad for Oracle
          Information Management                             Database Management             Toad Oracle                   Toad for Sybase
          Information Management                             Database Management             Toad SQL SVR                  TOAD for SQL Server
          Information Management                             Database Management             XRT                           XRT PDS

Validate filter dropdown for BU "Platform Management"
    [Template]    Select Product Filters    
    [Tags]    C317541
       #|================================================================================================================================================|
       #| Product Business Unit                            | Product Solution Area         | Product Family              | Product Interest              |
       #|================================================================================================================================================|
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    ChangeAuditor
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    ChangeAuditor for AD
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    ChangeAuditor for Defender
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    ChangeAuditor for EMC
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    ChangeAuditor for Exchange
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    ChangeAuditor for FluidFS
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    ChangeAuditor for LDAP
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    ChangeAuditor for Lync
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    ChangeAuditor for NetApp
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    ChangeAuditor for SharePoint
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    ChangeAuditor for SQL Module
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    ChangeAuditor Threat Detection
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    ChangeAuditor Windows FileServ
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    Enterprise Reporter for Office 365
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    Enterprise Reporter Suite
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    Enterprise Reporter WindowSvr
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    MPM Compliance
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    Quest Enterprise Reporter
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    Security Explorer
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    Systems and IM Premier Support
          Platform Management                                Microsoft Platform Management   AD Auditing and Compliance    Auditing for SAP
          Platform Management                                Microsoft Platform Management   AD Management                 Active Administrator
          Platform Management                                Microsoft Platform Management   AD Management                 Active Roles SIM
          Platform Management                                Microsoft Platform Management   AD Management                 GPOADmin
          Platform Management                                Microsoft Platform Management   AD Management                 MS Active Directory
          Platform Management                                Microsoft Platform Management   AD Management                 Recovery Manager for AD
          Platform Management                                Microsoft Platform Management   AD Management                 Spotlight on AD Pack
          Platform Management                                Microsoft Platform Management   AD Migration                  Collaboration Svc for Exchange
          Platform Management                                Microsoft Platform Management   AD Migration                  Quest Migration Mgr for AD
          Platform Management                                Microsoft Platform Management   AD Migration                  Secure Copy
          Platform Management                                Microsoft Platform Management   Akonix                        Policy Authority for UniCom
          Platform Management                                Microsoft Platform Management   Archive Manager               Archive Manager
          Platform Management                                Microsoft Platform Management   ChangeBASE                    ChangeBASE AppTracker
          Platform Management                                Microsoft Platform Management   ChangeBASE                    ChangeBASE Professional
          Platform Management                                Microsoft Platform Management   Exchange Management           Enterprise Reporter for Exchange
          Platform Management                                Microsoft Platform Management   Exchange Management           MessageStats
          Platform Management                                Microsoft Platform Management   Exchange Management           MS Exchange
          Platform Management                                Microsoft Platform Management   Exchange Management           Quick Apps for SharePoint
          Platform Management                                Microsoft Platform Management   Exchange Management           Recovery Manager for Exchange
          Platform Management                                Microsoft Platform Management   Exchange Management           Recovery Mgr for SharePoint
          Platform Management                                Microsoft Platform Management   Exchange Management           Site Admin for Sharepoint
          Platform Management                                Microsoft Platform Management   Exchange Management           Spotlight on Messaging OLD
          Platform Management                                Microsoft Platform Management   Exchange Management           Unified Comm Cmd Ste Anal
          Platform Management                                Microsoft Platform Management   Exchange Management           Unified Comm Cmd Ste Diag
          Platform Management                                Microsoft Platform Management   Exchange Management           Unified Comm Cmd Ste Exch
          Platform Management                                Microsoft Platform Management   Exchange Management           Unified Comm Cmd Ste Lync
          Platform Management                                Microsoft Platform Management   Exchange Migration            Migration Manager Ex Intra-org
          Platform Management                                Microsoft Platform Management   Exchange Migration            Migration Manager for Exchange
          Platform Management                                Microsoft Platform Management   Exchange Migration            OnDemand Migration for Email
          Platform Management                                Microsoft Platform Management   Legacy - Exchange             Availability Manager for Exchange
          Platform Management                                Microsoft Platform Management   Legacy - Exchange             Exchange Migration Wizard
          Platform Management                                Microsoft Platform Management   Legacy - Windows              Data Migration Solution
          Platform Management                                Microsoft Platform Management   Legacy - Windows              Developer
          Platform Management                                Microsoft Platform Management   Legacy - Windows              Domain Migration Wizard
          Platform Management                                Microsoft Platform Management   Legacy - Windows              File Server Management
          Platform Management                                Microsoft Platform Management   Legacy - Windows              File System Auditor
          Platform Management                                Microsoft Platform Management   Legacy - Windows              Migrator
          Platform Management                                Microsoft Platform Management   Legacy - Windows               Quest SecurityManager
          Platform Management                                Microsoft Platform Management   Legacy - Windows              Server Management
          Platform Management                                Microsoft Platform Management   Legacy - Windows              Small Business Value Pack
          Platform Management                                Microsoft Platform Management   Legacy - Windows              Spotlight on Windows
          Platform Management                                Microsoft Platform Management   Legacy - Windows              Quest Central for Windows
          Platform Management                                Microsoft Platform Management   Notes Transition              Migrator for GroupWise
          Platform Management                                Microsoft Platform Management   Notes Transition              Migrator for Sametime
          Platform Management                                Microsoft Platform Management   Notes Transition              Notes Migrator for Exchange
          Platform Management                                Microsoft Platform Management   Notes Transition              Notes Migrator for SharePoint
          Platform Management                                Microsoft Platform Management   Open Coding                   Sales Tool
          Platform Management                                Microsoft Platform Management   SaaS Management               On Demand Policy Management for Exchange Online
          Platform Management                                Microsoft Platform Management   SaaS Management               On Demand Policy Management for Skype Business Online
          Platform Management                                Microsoft Platform Management   SaaS Management               On Demand Recovery for Azure Active Directory
          Platform Management                                Microsoft Platform Management   SaaS Migration                On Demand Migration
          Platform Management                                Microsoft Platform Management   UC Migration                  SharePoint Migration
          Platform Management                                Microsoft Platform Management   UC Migration                  SharePoint Services
          Platform Management                                Microsoft Platform Management   UC Migration                  Content Migrator SharePoint

Validate filter dropdown for BU "NON-DSG"
    [Template]    Select Product Filters    
    [Tags]    C317540
       #|================================================================================================================================================|
       #| Product Business Unit                            | Product Solution Area         | Product Family              | Product Interest              |
       #|================================================================================================================================================|
          NON-DSG                                            EUC - vWorkspace                vWorkspace                    Foglight for Virtual Desktops
          NON-DSG                                            EUC - vWorkspace                vWorkspace                    vWorkspace
          NON-DSG                                            Network Security                Accessories & Other           HARDWARE ACCESSORIES
          NON-DSG                                            Non-DSG                         NON-SW                        NON-SW


*** Keywords ***
Products SKU Suite Setup
    Suite Setup
    Login To SFDC sandbox
    #Open SFDC object by ID    a4mg00000005BFL
    Wait Until Keyword Succeeds    5 x    3 sec    Open 'Opportunity' with name '${TEST_OPPTY}'
    Check property 'Stage' of Oppty '${TEST_OPPTY}' is NOT LIKE 'Closed Won'
    Check property 'Stage' of Oppty '${TEST_OPPTY}' is NOT LIKE 'Booked'
    Simplified Quote creation for Oppty '${TEST_OPPTY}'
    Go To Configure Products Page
    Open Product Selection Page
    Open Product Filter Panel If Closed

Select Product Filters
    [Arguments]    @{filters values}
    Select in Product Filter '@{filters values}[0]' in 'Product Business Unit'
    Select in Product Filter '@{filters values}[1]' in 'Product Solution Area'
    Select in Product Filter '@{filters values}[2]' in 'Product Family'
    Select in Product Filter '@{filters values}[3]' in 'Product Interest'

