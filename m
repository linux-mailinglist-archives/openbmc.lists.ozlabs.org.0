Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC6D103618
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 09:36:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hwy56DvmzDqw8
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 19:35:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wiwynn.com (client-ip=103.200.3.19; helo=segapp01.wistron.com;
 envelope-from=wayne_tung@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Wistron.onmicrosoft.com
 header.i=@Wistron.onmicrosoft.com header.b="gxH8lueB"; 
 dkim-atps=neutral
Received: from segapp01.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 47HwxF1cQVzDqsR
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 19:35:10 +1100 (AEDT)
Received: from EXCHAPP04.whq.wistron (unverified [10.37.38.27]) by
 TWNHUMSW2.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id
 <Tdb96139b95c0a816701524@TWNHUMSW2.wistron.com>; 
 Wed, 20 Nov 2019 16:35:05 +0800
Received: from EXCHAPP01.whq.wistron (10.37.38.24) by EXCHAPP04.whq.wistron
 (10.37.38.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 20 Nov
 2019 16:35:03 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (10.37.38.71) by
 mail.wistron.com (10.37.38.24) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 20 Nov 2019 16:35:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeYnfl7V+TnumO+/dbxJtMgaId1fcUEtRT0c7LMxLb9maXS0MzufM7Ew5H2pTHe8TVpPDzIWDucHt2Ht0yFgeAb28GID0NsgL1K4lzAPJe5hEuOLY6TzSvSujYZeC//bm0jtUflpNyRPgSXkJklekxg5XMBmu5qVD07wCNFjRoG54ldDK1TIQmRpVriP1ZS1N5XFzRQkKK+aIzb01pHA8ImtgMjeFtY/D6wAHCDxd+R6n540Jt5BmugjaNb4A3mWInzXTTgA2o/lzh/2FFeJH5Pc3SHDzBM84VBCv69BQkeYTwBwDlEyyC9mLuupA3KZECwHcrfGO4WOSfP+DBS9Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WjsAD4l79mmHibbaw9iGEr2I56v2T5jFaFgWqrVAUk=;
 b=fTPJZ7B+Kg3Vv3h69YGMXLv93hVwd3jp2VlT5U+6zTJ8q+drt32MglrxhNTW8eo2c0rSK13MjLz4Oxbov9P9Ch59/MUeXnbogK9fpJx1zVKDtuf5efb3DXE1zWhLWd4Px5A92hIxEHPC3OiLETKO23k7PQ9Pz8ANegf2pge/BJxN3t2DMOseWZaQcz829fykwZiJwodK5uQBysDsH5dFT6EooiUN/j9Pi5dUZh5hxEFmEwCj68AWAe8v2wJ3qezUNDvD0I/hzaJuYisV4XdXwFIhkRuiD/owNLSbjEH9E2Yl/AadE9k2dyRhIjIYuLvX3Hqqn3l9x4jiGEunurumVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Wistron.onmicrosoft.com; s=selector2-Wistron-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WjsAD4l79mmHibbaw9iGEr2I56v2T5jFaFgWqrVAUk=;
 b=gxH8lueB5uwJhKSorS2PTKIToowG0CgU0Zg4ZNMrwql0YlAiJVV9lrvZzC1Ch98pzzHUjD8OvknEAzlljBRAwgOklm17tDT9vMRHh8H2r82xArJIHZqiRZSXYtO//H3LeAG7hc1yIeqV+Idiye6OWHFU1szMQ5PfiODCENr/78A=
Received: from HK0PR02MB2593.apcprd02.prod.outlook.com (52.133.159.15) by
 HK0PR02MB2436.apcprd02.prod.outlook.com (52.133.156.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.26; Wed, 20 Nov 2019 08:35:02 +0000
Received: from HK0PR02MB2593.apcprd02.prod.outlook.com
 ([fe80::1de8:361d:c84f:bf83]) by HK0PR02MB2593.apcprd02.prod.outlook.com
 ([fe80::1de8:361d:c84f:bf83%5]) with mapi id 15.20.2451.031; Wed, 20 Nov 2019
 08:35:02 +0000
From: Wayne Tung/WYHQ/Wiwynn <Wayne_Tung@wiwynn.com>
To: vishwa <vishwa@linux.vnet.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: =?Windows-1252?Q?RE:_BMC_can=92t_get_watchdog_status_by_command_=93mc_wat?=
 =?Windows-1252?Q?chdog_get=94_when_system_power_is_off?=
Thread-Topic: =?Windows-1252?Q?BMC_can=92t_get_watchdog_status_by_command_=93mc_watchdo?=
 =?Windows-1252?Q?g_get=94_when_system_power_is_off?=
Thread-Index: AdWTeQ2+6yMcPWyCR2G/Gj2GGHfoTQAQOsSAAej4SUA=
Date: Wed, 20 Nov 2019 08:35:01 +0000
Message-ID: <HK0PR02MB2593E83F463590603F20EF4A964F0@HK0PR02MB2593.apcprd02.prod.outlook.com>
References: <HK0PR02MB2593B7A84823A34C11AEF363967E0@HK0PR02MB2593.apcprd02.prod.outlook.com>
 <d408ad0d-d957-ea15-e27a-ef4913b58671@linux.vnet.ibm.com>
In-Reply-To: <d408ad0d-d957-ea15-e27a-ef4913b58671@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Wayne_Tung@wiwynn.com; 
x-originating-ip: [123.51.148.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88147355-e9e8-4b08-5faf-08d76d948941
x-ms-traffictypediagnostic: HK0PR02MB2436:|HK0PR02MB2436:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR02MB2436CDE0687143328B59AC60964F0@HK0PR02MB2436.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(189003)(199004)(14444005)(7696005)(110136005)(446003)(9686003)(6436002)(55016002)(2906002)(71200400001)(6306002)(74316002)(8936002)(66066001)(790700001)(7736002)(6116002)(4326008)(3846002)(186003)(26005)(52536014)(81166006)(81156014)(76176011)(476003)(54906003)(102836004)(486006)(86362001)(6506007)(53546011)(478600001)(5660300002)(2501003)(316002)(256004)(229853002)(71190400001)(54896002)(6246003)(99286004)(11346002)(33656002)(25786009)(76116006)(66476007)(66556008)(64756008)(66446008)(66946007)(80792005)(14454004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:HK0PR02MB2436;
 H:HK0PR02MB2593.apcprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: wiwynn.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l2ULFCrk89aJPSiAGA44Owu3vtX6hr5PKPxIZr9ySRI3hTKHvGjQe2CyBc6l34mCe9Q9YYOtn/sZvv7V1BaUaLx/zVxw7iQ2jjjzcahfJ5KguxZVFTkhGdHRn5S7TWG6ZfBi92/cw9cjy4/JzJ8E3yIyFT6/N7fjvGAyzzgUCw03De7W6RWw2hMzzbOJ93O2TMMep9FrcAxGWKXixFKc3PCfgCRo2tD/Lt26EFoYJuebFUciSooKJScNW1kNWdbr5IAWYC7J2I5T3Bdh0gs2LNvVkHdaDw2VdsHz5kWKwGn5ShhXg6b+36qvjw9IhfWz9pkWFksUISA2ZKXsjbs2DGykmX858SK0H9uist5oPMRtKl8HzZDGlCegagokFMRSvHogjtlEQbhFMIwZ0maJxVe72mzDqtPLKTyQ7tyEnZyCPCipCFwVl/AqFi2IcN3Q
Content-Type: multipart/alternative;
 boundary="_000_HK0PR02MB2593E83F463590603F20EF4A964F0HK0PR02MB2593apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 88147355-e9e8-4b08-5faf-08d76d948941
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 08:35:01.9526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de0795e0-d7c0-4eeb-b9bb-bc94d8980d3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WQtK8f/QNH2OVOdw+Y9srQhWxhOZ1HgBvyiKR8rS7JVERuAmGKO79yTpL9dDWX6s7U5Kl1o0c4ec+YaZmPETwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR02MB2436
X-OriginatorOrg: wiwynn.com
X-TM-SNTS-SMTP: CA2595396B315B04DCBA33C2C00A7D4F9DD8F7F3E57C0555774D01A3DF935EEC2000:8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Neeraj Ladkani' <neladk@microsoft.com>,
 Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR02MB2593E83F463590603F20EF4A964F0HK0PR02MB2593apcp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Vishwa,

Thanks for replying!

Here is our thought and response.

- Could you help show which section demands this service to be mandatory av=
ailable per IPMI v2.0 ?
-> This command is in section 27.7 Get Watchdog Timer Command in IPMI v2.0.

- What do you expect IPMI to tell when the host is off ?
We expect that IPMI can tell user the last status of watchdog because we wa=
nt to let users know which stage of booting failed when host power on faile=
d.

The information we want to know is as follow:

  1.  Watchdog Timer Use: Which stage of booting use the watchdog timer.
  2.  Watchdog Timer Actions: Watchdog timeout action.
  3.  Initial Countdown: Initial time of watchdog timer.

Here is an example of IPMI mc watchdog get response
Watchdog Timer Use:     Reserved (0x80)
Watchdog Timer Is:      Stopped
Watchdog Timer Actions: Hard Reset (0x01)
Pre-timeout interval:   0 seconds
Timer Expiration Flags: 0x00
Initial Countdown:      30 sec
Present Countdown:      30 sec



From: vishwa <vishwa@linux.vnet.ibm.com>
Sent: Tuesday, November 5, 2019 5:18 PM
To: Wayne Tung/WYHQ/Wiwynn <Wayne_Tung@wiwynn.com>; openbmc@lists.ozlabs.or=
g
Subject: Re: BMC can=92t get watchdog status by command =93mc watchdog get=
=94 when system power is off


Wayne,

Thanks for writing. Here is my thought on this.

- phosphor-watchdog was meant to time the Host booting, and hence it is get=
ting started where ever it is.
- There are other external users for watchdog ( like bmcweb ). So we need t=
o see if this change affects those.
- Could you help show which section demands this service to be mandatory av=
ailable per IPMI v2.0 ?
- What do you expect IPMI to tell when the host is off ?
- Lastly, please help push a gerrit review, so we could add comments there.

Thanks..

!! Vishwa !!
On 11/5/19 7:09 AM, Wayne Tung/WYHQ/Wiwynn wrote:
Hi,

We met an error that BMC can=92t get watchdog status by command =93mc watch=
dog get=94 when system power is off.

Cause:
"ipmitool mc watchdog get" gets dbus properties in path: /xyz/openbmc_proje=
ct/watchdog/host0 interface: xyz.openbmc_project.State.Watchdog and this db=
us object is registered by phosphor-watchdog.service.
Because phosphor-watchdog.service will not be started before system power-o=
n and will be stopped after system power-off, therefore "ipmitool mc watchd=
og get" command gets nothing when system power is off.

Follow the standard, BMC should still report watchdog status even if system=
 power is off.

So we modified phosphor-watchdog=92s bb file and service file to
1. Start phosphor-watchdog after multi-user.target during BMC boot period
2. Do not stop phosphor-watchdog when system power off.
3. Always restart phosphor-watchdog.service.

Test Result:
wayne@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus chassis=
 power status
Chassis Power is off
wayne@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus bmc wat=
chdog get
Watchdog Timer Use:     BIOS FRB2 (0x81)
Watchdog Timer Is:      Stopped
Watchdog Timer Actions: No action (0x00)
Pre-timeout interval:   0 seconds
Timer Expiration Flags: 0x00
Initial Countdown:      0 sec
Present Countdown:      0 sec
wayne@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus chassis=
 power on
Chassis Power Control: Up/On
wayne@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus bmc wat=
chdog get
Watchdog Timer Use:     BIOS FRB2 (0xc1)
Watchdog Timer Is:      Started/Running
Watchdog Timer Actions: Hard Reset (0x01)
Pre-timeout interval:   0 seconds
Timer Expiration Flags: 0x00
Initial Countdown:      600 sec
Present Countdown:      597 sec
wayne@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus bmc wat=
chdog get
Watchdog Timer Use:     BIOS FRB2 (0xc1)
Watchdog Timer Is:      Started/Running
Watchdog Timer Actions: Hard Reset (0x01)
Pre-timeout interval:   0 seconds
Timer Expiration Flags: 0x00
Initial Countdown:      600 sec
Present Countdown:      582 sec
wayne@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus bmc wat=
chdog get
Watchdog Timer Use:     BIOS FRB2 (0x81)
Watchdog Timer Is:      Stopped
Watchdog Timer Actions: No action (0x00)
Pre-timeout interval:   0 seconds
Timer Expiration Flags: 0x00
Initial Countdown:      0 sec
Present Countdown:      0 sec

Thanks


---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------

This email contains confidential or legally privileged information and is f=
or the sole use of its intended recipient.

Any unauthorized review, use, copying or distribution of this email or the =
content of this email is strictly prohibited.

If you are not the intended recipient, you may reply to the sender and shou=
ld delete this e-mail immediately.

---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------

--_000_HK0PR02MB2593E83F463590603F20EF4A964F0HK0PR02MB2593apcp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:24.0pt;
	margin-bottom:.0001pt;
	mso-para-margin-top:0cm;
	mso-para-margin-right:0cm;
	mso-para-margin-bottom:0cm;
	mso-para-margin-left:2.0gd;
	mso-para-margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:579408673;
	mso-list-type:hybrid;
	mso-list-template-ids:-1550435982 1954300430 67698713 67698715 67698703 67=
698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%2\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:48.0pt;
	text-indent:-24.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:72.0pt;
	text-indent:-24.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:96.0pt;
	text-indent:-24.0pt;}
@list l0:level5
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%5\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:120.0pt;
	text-indent:-24.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:144.0pt;
	text-indent:-24.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-24.0pt;}
@list l0:level8
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%8\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:192.0pt;
	text-indent:-24.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:216.0pt;
	text-indent:-24.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body bgcolor=3D"white" lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:windowtext">Vish=
wa,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:windowtext"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:windowtext">Than=
ks for replying!<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:windowtext"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:windowtext">Here=
 is our</span><span lang=3D"EN-US"> thought and response.</span><span lang=
=3D"EN-US" style=3D"color:windowtext"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:windowtext"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">- Could you help show which sec=
tion demands this service to be mandatory available per IPMI v2.0 ?</span><=
span lang=3D"EN-US" style=3D"color:windowtext"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#4472C4">-&gt; T=
his command is in section 27.7 Get Watchdog Timer Command in IPMI v2.0.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#4472C4"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">- What do you expect IPMI to te=
ll when the host is off ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#4472C4">We expe=
ct that IPMI can tell user the last status of watchdog because we want to l=
et users know which stage of booting failed when host power on failed.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#4472C4"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#4472C4">The inf=
ormation we want to know is as follow:<o:p></o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"color:#4472C4;margin-left:-18.0pt;m=
so-para-margin-left:0gd;mso-list:l0 level1 lfo1">
<span lang=3D"EN-US">Watchdog Timer Use: Which stage of booting use the wat=
chdog timer.<o:p></o:p></span></li><li class=3D"MsoListParagraph" style=3D"=
color:#4472C4;margin-left:-18.0pt;mso-para-margin-left:0gd;mso-list:l0 leve=
l1 lfo1">
<span lang=3D"EN-US">Watchdog Timer Actions: Watchdog timeout action. <o:p>=
</o:p></span></li><li class=3D"MsoListParagraph" style=3D"color:#4472C4;mar=
gin-left:-18.0pt;mso-para-margin-left:0gd;mso-list:l0 level1 lfo1">
<span lang=3D"EN-US">Initial Countdown: Initial time of watchdog timer.<o:p=
></o:p></span></li></ol>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">Here is a=
n example of IPMI mc watchdog get response<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#4472C4">Watchdo=
g Timer Use:&nbsp;&nbsp;&nbsp;&nbsp; Reserved (0x80)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#4472C4">Watchdo=
g Timer Is:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Stopped<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#4472C4">Watchdo=
g Timer Actions: Hard Reset (0x01)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#4472C4">Pre-tim=
eout interval:&nbsp;&nbsp; 0 seconds<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#4472C4">Timer E=
xpiration Flags: 0x00<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#4472C4">Initial=
 Countdown:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 30 sec<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#4472C4">Present=
 Countdown:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 30 sec<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:windowtext"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:windowtext"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:windowtext"><o:p=
>&nbsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;co=
lor:windowtext">From:</span></b><span lang=3D"EN-US" style=3D"font-size:11.=
0pt;color:windowtext"> vishwa &lt;vishwa@linux.vnet.ibm.com&gt;
<br>
<b>Sent:</b> Tuesday, November 5, 2019 5:18 PM<br>
<b>To:</b> Wayne Tung/WYHQ/Wiwynn &lt;Wayne_Tung@wiwynn.com&gt;; openbmc@li=
sts.ozlabs.org<br>
<b>Subject:</b> Re: BMC can=92t get watchdog status by command =93mc watchd=
og get=94 when system power is off<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p><span lang=3D"EN-US">Wayne,<o:p></o:p></span></p>
<p><span lang=3D"EN-US">Thanks for writing. Here is my thought on this.<o:p=
></o:p></span></p>
<p><span lang=3D"EN-US">- phosphor-watchdog was meant to time the Host boot=
ing, and hence it is getting started where ever it is.<br>
- There are other external users for watchdog ( like bmcweb ). So we need t=
o see if this change affects those.<br>
- Could you help show which section demands this service to be mandatory av=
ailable per IPMI v2.0 ?<br>
- What do you expect IPMI to tell when the host is off ?<br>
- Lastly, please help push a gerrit review, so we could add comments there.=
<o:p></o:p></span></p>
<p><span lang=3D"EN-US">Thanks..<o:p></o:p></span></p>
<p><span lang=3D"EN-US">!! Vishwa !!<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On 11/5/19 7:09 AM, Wayne Tung/=
WYHQ/Wiwynn wrote:<o:p></o:p></span></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;backg=
round:white">Hi,</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;backg=
round:white">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;backg=
round:white">We met an error that BMC can=92t get watchdog status by comman=
d =93mc watchdog get=94 when system power is off.</span><span lang=3D"EN-US=
"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;backg=
round:white">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;backg=
round:white">Cause:</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;backg=
round:white">&quot;ipmitool mc watchdog get&quot; gets dbus properties in p=
ath: /xyz/openbmc_project/watchdog/host0 interface: xyz.openbmc_project.Sta=
te.Watchdog and this dbus object is registered by
 phosphor-watchdog.service. </span><span lang=3D"EN-US"><o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;backg=
round:white">Because phosphor-watchdog.service will not be started before s=
ystem power-on and will be stopped after system power-off, therefore &quot;=
ipmitool mc watchdog get&quot; command gets nothing
 when system power is off.</span><span lang=3D"EN-US"><o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;backg=
round:white">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;backg=
round:white">Follow the standard, BMC should still report watchdog status e=
ven if system power is off.</span><span lang=3D"EN-US"><o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;backg=
round:white">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;backg=
round:white">So we modified phosphor-watchdog=92s bb file and service file =
to
<br>
1. Start phosphor-watchdog after multi-user.target during BMC boot period</=
span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;backg=
round:white">2. Do not stop phosphor-watchdog when system power off.
</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;backg=
round:white">3. Always restart phosphor-watchdog.service.</span><span lang=
=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;backg=
round:white">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Test=
 Result:</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">wayn=
e@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus chassis pow=
er status</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Chas=
sis Power is off</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">wayn=
e@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus bmc watchdo=
g get</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Watc=
hdog Timer Use:&nbsp;&nbsp;&nbsp;&nbsp; BIOS FRB2 (0x81)</span><span lang=
=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Watc=
hdog Timer Is:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Stopped</span><span lang=3D"EN=
-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Watc=
hdog Timer Actions: No action (0x00)</span><span lang=3D"EN-US"><o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Pre-=
timeout interval:&nbsp;&nbsp; 0 seconds</span><span lang=3D"EN-US"><o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Time=
r Expiration Flags: 0x00</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Init=
ial Countdown:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 sec</span><span lang=3D"EN-U=
S"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Pres=
ent Countdown:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 sec</span><span lang=3D"EN-U=
S"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">wayn=
e@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus chassis pow=
er on</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Chas=
sis Power Control: Up/On</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">wayn=
e@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus bmc watchdo=
g get</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Watc=
hdog Timer Use:&nbsp;&nbsp;&nbsp;&nbsp; BIOS FRB2 (0xc1)</span><span lang=
=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Watc=
hdog Timer Is:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Started/Running</span><span la=
ng=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Watc=
hdog Timer Actions: Hard Reset (0x01)</span><span lang=3D"EN-US"><o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Pre-=
timeout interval:&nbsp;&nbsp; 0 seconds</span><span lang=3D"EN-US"><o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Time=
r Expiration Flags: 0x00</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Init=
ial Countdown:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 600 sec</span><span lang=3D"EN=
-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Pres=
ent Countdown:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 597 sec</span><span lang=3D"EN=
-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">wayn=
e@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus bmc watchdo=
g get</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Watc=
hdog Timer Use:&nbsp;&nbsp;&nbsp;&nbsp; BIOS FRB2 (0xc1)</span><span lang=
=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Watc=
hdog Timer Is:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Started/Running</span><span la=
ng=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Watc=
hdog Timer Actions: Hard Reset (0x01)</span><span lang=3D"EN-US"><o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Pre-=
timeout interval:&nbsp;&nbsp; 0 seconds</span><span lang=3D"EN-US"><o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Time=
r Expiration Flags: 0x00</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Init=
ial Countdown:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 600 sec</span><span lang=3D"EN=
-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Pres=
ent Countdown:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 582 sec</span><span lang=3D"EN=
-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">wayn=
e@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus bmc watchdo=
g get</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Watc=
hdog Timer Use:&nbsp;&nbsp;&nbsp;&nbsp; BIOS FRB2 (0x81)</span><span lang=
=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Watc=
hdog Timer Is:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Stopped</span><span lang=3D"EN=
-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Watc=
hdog Timer Actions: No action (0x00)</span><span lang=3D"EN-US"><o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Pre-=
timeout interval:&nbsp;&nbsp; 0 seconds</span><span lang=3D"EN-US"><o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Time=
r Expiration Flags: 0x00</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Init=
ial Countdown:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 sec</span><span lang=3D"EN-U=
S"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt">Pres=
ent Countdown:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 sec</span><span lang=3D"EN-U=
S"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;backg=
round:white">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;backg=
round:white">Thanks</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p><b><span lang=3D"EN-US">------------------------------------------------=
---------------------------------------------------------------------------=
------------------------------------</span></b><span lang=3D"EN-US"><o:p></=
o:p></span></p>
<p><b><span lang=3D"EN-US">This email contains confidential or legally priv=
ileged information and is for the sole use of its intended recipient.
</span></b><span lang=3D"EN-US"><o:p></o:p></span></p>
<p><b><span lang=3D"EN-US">Any unauthorized review, use, copying or distrib=
ution of this email or the content of this email is strictly prohibited.</s=
pan></b><span lang=3D"EN-US"><o:p></o:p></span></p>
<p><b><span lang=3D"EN-US">If you are not the intended recipient, you may r=
eply to the sender and should delete this e-mail immediately.</span></b><sp=
an lang=3D"EN-US"><o:p></o:p></span></p>
<p><b><span lang=3D"EN-US">------------------------------------------------=
---------------------------------------------------------------------------=
------------------------------------</span></b><span lang=3D"EN-US"><o:p></=
o:p></span></p>
</blockquote>
</div>
</body>
</html>

--_000_HK0PR02MB2593E83F463590603F20EF4A964F0HK0PR02MB2593apcp_--
