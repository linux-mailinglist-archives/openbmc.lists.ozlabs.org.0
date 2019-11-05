Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C5BEF2F8
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 02:45:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476XYj5DBfzF3xs
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 12:45:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wiwynn.com (client-ip=103.200.3.19; helo=segapp02.wistron.com;
 envelope-from=wayne_tung@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=Wistron.onmicrosoft.com
 header.i=@Wistron.onmicrosoft.com header.b="CTrOCHHW"; 
 dkim-atps=neutral
X-Greylist: delayed 311 seconds by postgrey-1.36 at bilbo;
 Tue, 05 Nov 2019 12:45:03 AEDT
Received: from segapp02.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 476XXv6vjMzF3wN
 for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2019 12:45:02 +1100 (AEDT)
Received: from EXCHAPP03.whq.wistron (unverified [10.37.38.26]) by 
 TWNHUMSW3.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id 
 <Tdb4757f1bdc0a816711d74@TWNHUMSW3.wistron.com> for 
 <openbmc@lists.ozlabs.org>; Tue, 5 Nov 2019 09:39:43 +0800
Received: from EXCHAPP02.whq.wistron (10.37.38.25) by EXCHAPP03.whq.wistron 
 (10.37.38.26) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1713.5; Tue, 5 Nov 2019 09:39:42 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (10.37.38.71) by 
 mail.wistron.com (10.37.38.25) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 
 15.1.1713.5 via Frontend Transport; Tue, 5 Nov 2019 09:39:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none; 
 b=oarg9/0FjzShfXtKR11TuxGXYQmU9pfmXbQEzDg+OQW5eOtVSL6f5pV5sFcmlvZf0uakzeHCUKfnRdzh7AEQsnC90dAxjhDpSPzrSkCIJGSQlYQFiaggkcho4RexJdSMTOno47YyrURq8hpklpqHqxNaw+Akd0wZ9yhict+RB6ddhVyVYLI8ByHUs1vEK9R+9puwvTtNWQCTHlmF3TrVvJLOP5fmFXt1i5iP5jvlJ3B/1c1bpyNxRwLNmpLKSx/J77EF6g7kl8WURMExvhUJ05UFueUj71uOCJW+VQfslUG1asB8CLY4fPmPRCYFIeK2gppwqgaubiYyAXhZxEl6Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7wphhTP6IzCRzNaLT0/Tzzbuq9Gx6zCCZPgmG1svd0=; 
 b=YAzI+4xnKiCnp1do9W8Dqka+9uQUTgL7h99NJM8eEAtDr8zYEEUimWlS8I4N97ZLkjl0EBvacMOHkYooYJQtSWsHE/NW7GxvaIGG57rnWdvKc4TB6FEi2MGT03Hx1tDhKGbxpjAa0bcTQ09hj+BU4s6YNy+BG/ICR5CvXu0GVcClkZ6yhoqFrkj1qbNgXL0tKh9w3fh59T9tVErM0Nbtk5sccvffK0bj44WlxqpgL/XzaOtdTn3eu/n01dpHBqBdC1thPto72u8jMHO/tcA+Sux9mTZPlURbhWPReRKIx1aPD8/w+P8FCHfUxtjFl7owzDNR49iA9Z+jky0hBObKiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass 
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none 
 header.from=wiwynn.com; dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; 
 d=Wistron.onmicrosoft.com; s=selector2-Wistron-onmicrosoft-com; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7wphhTP6IzCRzNaLT0/Tzzbuq9Gx6zCCZPgmG1svd0=; 
 b=CTrOCHHWfXth5WQnIfoW7nwpPo3sdiBkVJZ0LuRkp5ws7kALt90f/PyZ8/cOK0pv+m8NGr7EV38dEb7MSqysl3QSSvXIkzFhdpzGJ65Rp/Zy3eLWcVsroPM2U62gJf7JL3dvHI2+UVksK0JMQKUXvB3k8Z3FncU7EGeo9huPtcE=
Received: from HK0PR02MB2593.apcprd02.prod.outlook.com (52.133.159.15) by 
 HK0PR02MB2737.apcprd02.prod.outlook.com (20.177.26.145) with 
 Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 
 15.20.2408.24; Tue, 5 Nov 2019 01:39:39 +0000
Received: from HK0PR02MB2593.apcprd02.prod.outlook.com 
 ([fe80::1de8:361d:c84f:bf83]) by 
 HK0PR02MB2593.apcprd02.prod.outlook.com 
 ([fe80::1de8:361d:c84f:bf83%5]) with mapi id 15.20.2408.024; Tue, 5 
 Nov 2019 01:39:38 +0000
From: Wayne Tung/WYHQ/Wiwynn <Wayne_Tung@wiwynn.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: =?Windows-1252?Q?BMC_can=92t_get_watchdog_status_by_command_?=
 =?Windows-1252?Q?=93mc_watchdog_get=94_when_system_power_is_off?=
Thread-Topic: =?Windows-1252?Q?BMC_can=92t_get_watchdog_status_by_command_=93mc_watchdo?= 
 =?Windows-1252?Q?g_get=94_when_system_power_is_off?=
Thread-Index: AdWTeQ2+6yMcPWyCR2G/Gj2GGHfoTQ==
Date: Tue, 5 Nov 2019 01:39:38 +0000
Message-ID: <HK0PR02MB2593B7A84823A34C11AEF363967E0@HK0PR02MB2593.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) 
 smtp.mailfrom=Wayne_Tung@wiwynn.com; 
x-originating-ip: [125.227.140.245]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5b17b89-2775-431b-730a-08d7619105ae
x-ms-traffictypediagnostic: HK0PR02MB2737:|HK0PR02MB2737:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR02MB2737761AA8968CEA69ED3F9F967E0@HK0PR02MB2737.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(189003)(199004)(6916009)(25786009)(76116006)(3846002)(9686003)(33656002)(66066001)(6506007)(71190400001)(99286004)(6306002)(5640700003)(71200400001)(6436002)(8936002)(316002)(107886003)(476003)(5660300002)(54896002)(55016002)(2501003)(80792005)(81166006)(52536014)(81156014)(99936001)(4326008)(14454004)(186003)(256004)(14444005)(478600001)(86362001)(486006)(1730700003)(66446008)(64756008)(66556008)(66476007)(66616009)(66946007)(102836004)(74316002)(26005)(2906002)(2351001)(7696005)(6116002)(7736002)(790700001);
 DIR:OUT;SFP:1102;SCL:1;SRVR:HK0PR02MB2737;
 H:HK0PR02MB2593.apcprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;
 PTR:InfoNoRecords;MX:3;A:1;
received-spf: None 
 (protection.outlook.com: wiwynn.com does not designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y8BpbTOZVa3BeTqmRWU2LntviMjQkup5xP+eyJsjo2dI8j0Ovon5QudWppRc/5u1PP42kow/Jc8otCsdSISHwktaxPMAUDYMTgVlSFDDabfXRXfWwlNPg8R7yw5iHMJBkWtlnbH3aWhWTmk9xSKJvuiOIEF8E1yPpkOqJctf3J0TKsBCnY3MAYI7M0wTG/cg7srrwH4buM9NBFzLu70O0OqZTxR1chtAWzlnrntWQnfFYeZZqw36hYQU0nseq8dn6XtIrXWB4RmLsPykoBhLEXFUNHSC0ofz+8ii8XIczy146hiwuH1s4C3sdFfsjpKdV+4qAj7ZBzKUJUUPfLBbfAky/02FKYWpc07AQBEbxe4da0w+ViFsC82l7OD3PdKzH7gbkQ0ERTGQWM8srOw0FEOLeno1rcaHHIFDpWbFu0fQ2lle0a3LG1X3nDOYKHNK
Content-Type: multipart/mixed; 
 boundary="_004_HK0PR02MB2593B7A84823A34C11AEF363967E0HK0PR02MB2593apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b17b89-2775-431b-730a-08d7619105ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 01:39:38.7546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de0795e0-d7c0-4eeb-b9bb-bc94d8980d3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CFGlKD+5rjkCh4jIp/OzX9wW2FOxL75fYkRN/Q8SmapICFHY6iLLhp/Kc6+G5hY4O9j8rdIef1AfCmNgm3isnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR02MB2737
X-OriginatorOrg: wiwynn.com
X-TM-SNTS-SMTP: D1E213140E7CE5424C263B9481103E85C36289707166D9B4E0F2F0A8F59D80272000:8
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_004_HK0PR02MB2593B7A84823A34C11AEF363967E0HK0PR02MB2593apcp_
Content-Type: multipart/alternative; 
    boundary="_000_HK0PR02MB2593B7A84823A34C11AEF363967E0HK0PR02MB2593apcp_"

--_000_HK0PR02MB2593B7A84823A34C11AEF363967E0HK0PR02MB2593apcp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

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
or the sole use of its intended recipient.=20
Any unauthorized review, use, copying or distribution of this email or the =
content of this email is strictly prohibited.
If you are not the intended recipient, you may reply to the sender and shou=
ld delete this e-mail immediately.
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------

--_000_HK0PR02MB2593B7A84823A34C11AEF363967E0HK0PR02MB2593apcp_
Content-Type: text/html; charset="windows-1252"
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
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color=
:black;background:white">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color=
:black;background:white"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color=
:black;background:white">We met an error that BMC can=92t get watchdog stat=
us by command =93mc watchdog get=94 when system power is off.<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color=
:black;background:white"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color=
:black;background:white">Cause:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color=
:black;background:white">&quot;ipmitool mc watchdog get&quot; gets dbus pro=
perties in path: /xyz/openbmc_project/watchdog/host0 interface: xyz.openbmc=
_project.State.Watchdog and this dbus object is
 registered by phosphor-watchdog.service. <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color=
:black;background:white">Because phosphor-watchdog.service will not be star=
ted before system power-on and will be stopped after system power-off, ther=
efore &quot;ipmitool mc watchdog get&quot; command
 gets nothing when system power is off.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color=
:black;background:white"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color=
:black;background:white">Follow the standard, BMC should still report watch=
dog status even if system power is off.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color=
:black;background:white"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color=
:black;background:white">So we modified phosphor-watchdog=92s bb file and s=
ervice file to
<br>
1. Start phosphor-watchdog after multi-user.target during BMC boot period<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color=
:black;background:white">2. Do not stop phosphor-watchdog when system power=
 off.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color=
:black;background:white">3. Always restart phosphor-watchdog.service.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color=
:black;background:white"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Test=
 Result:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">wayn=
e@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus chassis pow=
er status<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Chas=
sis Power is off<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">wayn=
e@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus bmc watchdo=
g get<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Watc=
hdog Timer Use:&nbsp;&nbsp;&nbsp;&nbsp; BIOS FRB2 (0x81)<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Watc=
hdog Timer Is:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Stopped<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Watc=
hdog Timer Actions: No action (0x00)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Pre-=
timeout interval:&nbsp;&nbsp; 0 seconds<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Time=
r Expiration Flags: 0x00<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Init=
ial Countdown:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 sec<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Pres=
ent Countdown:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 sec<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">wayn=
e@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus chassis pow=
er on<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Chas=
sis Power Control: Up/On<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">wayn=
e@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus bmc watchdo=
g get<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Watc=
hdog Timer Use:&nbsp;&nbsp;&nbsp;&nbsp; BIOS FRB2 (0xc1)<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Watc=
hdog Timer Is:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Started/Running<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Watc=
hdog Timer Actions: Hard Reset (0x01)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Pre-=
timeout interval:&nbsp;&nbsp; 0 seconds<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Time=
r Expiration Flags: 0x00<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Init=
ial Countdown:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 600 sec<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Pres=
ent Countdown:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 597 sec<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">wayn=
e@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus bmc watchdo=
g get<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Watc=
hdog Timer Use:&nbsp;&nbsp;&nbsp;&nbsp; BIOS FRB2 (0xc1)<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Watc=
hdog Timer Is:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Started/Running<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Watc=
hdog Timer Actions: Hard Reset (0x01)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Pre-=
timeout interval:&nbsp;&nbsp; 0 seconds<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Time=
r Expiration Flags: 0x00<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Init=
ial Countdown:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 600 sec<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Pres=
ent Countdown:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 582 sec<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">wayn=
e@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus bmc watchdo=
g get<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Watc=
hdog Timer Use:&nbsp;&nbsp;&nbsp;&nbsp; BIOS FRB2 (0x81)<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Watc=
hdog Timer Is:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Stopped<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Watc=
hdog Timer Actions: No action (0x00)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Pre-=
timeout interval:&nbsp;&nbsp; 0 seconds<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Time=
r Expiration Flags: 0x00<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Init=
ial Countdown:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 sec<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:black;background:white">Pres=
ent Countdown:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 sec<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color=
:black;background:white"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color=
:black;background:white">Thanks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>

<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------</b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
This email contains confidential or legally privileged information and is f=
or the sole use of its intended recipient. </b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
Any unauthorized review, use, copying or distribution of this email or the =
content of this email is strictly prohibited.</b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
If you are not the intended recipient, you may reply to the sender and shou=
ld delete this e-mail immediately.</b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------</b></span></p></body>
</html>

--_000_HK0PR02MB2593B7A84823A34C11AEF363967E0HK0PR02MB2593apcp_--

--_004_HK0PR02MB2593B7A84823A34C11AEF363967E0HK0PR02MB2593apcp_
Content-Type: application/octet-stream; 
    name="0001-Fix-ipmitool-mc-watchdog-get.patch"
Content-Description: 0001-Fix-ipmitool-mc-watchdog-get.patch
Content-Disposition: attachment; 
    filename="0001-Fix-ipmitool-mc-watchdog-get.patch"; size=4967; 
    creation-date="Tue, 05 Nov 2019 01:34:11 GMT"; 
    modification-date="Tue, 29 Oct 2019 07:05:42 GMT"
Content-Transfer-Encoding: base64

RnJvbSBmMmNkZmNjMmI3ZTcwYzQwNjJhYmQ3NTU3OTYwNzBiMjg1OGNjYTVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBXYXluZSBUdW5nIDxXYXluZV9UdW5nQHdpd3lubi5jb20+CkRh
dGU6IEZyaSwgMjUgT2N0IDIwMTkgMTE6MTk6NDggKzA4MDAKU3ViamVjdDogW1BBVENIXSBGaXgg
aXBtaXRvb2wgbWMgd2F0Y2hkb2cgZ2V0CgpEZXNjcnB0aW9uOgotIEZpeCAiaXBtaXRvb2wgPG9v
Yj4gYm1jIHdhdGNoZG9nIGdldCIgZmFpbGVkIHdoZW4gc3lzdGVtIGlzIHBvd2VyLW9mZi4KCkNh
dXNlOgotICJpcG1pdG9vbCBtYyB3YXRjaGRvZyBnZXQiIGdldHMgZGJ1cyBwcm9wZXJ0aWVzIGlu
IHBhdGg6IC94eXovb3BlbmJtY19wcm9qZWN0L3dhdGNoZG9nL2hvc3QwIGludGVyZmFjZTogeHl6
Lm9wZW5ibWNfcHJvamVjdC5TdGF0ZS5XYXRjaGRvZyBhbmQgdGhpcyBkYnVzIG9iamVjdCBpcyBy
ZWdpc3RlcmVkIGJ5IHBob3NwaG9yLXdhdGNoZG9nLnNlcnZpY2UuCi0gQmVjYXVzZSBwaG9zcGhv
ci13YXRjaGRvZy5zZXJ2aWNlIHdpbGwgbm90IGJlIHN0YXJ0ZWQgYmVmb3JlIHN5c3RlbSBwb3dl
ci1vbiBhbmQgd2lsbCBiZSBzdG9wcGVkIGFmdGVyIHN5c3RlbSBwb3dlci1vZmYsICJpcG1pdG9v
bCBtYyB3YXRjaGRvZyBnZXQiIHdpbGwgZmFpbCB3aGVuIHN5c3RlbSBwb3dlci1vZmYuCgpGaXg6
Ci0gU3RhcnQgcGhvc3Bob3Itd2F0Y2hkb2cgd2hlbiBibWMgYm9vdCBhbmQgYWZ0ZXIgbXVsdGkt
dXNlci50YXJnZXQuCi0gTW9kaWZ5IHNlcnZpY2UgY29uZmxpY3RzIGFuZCBkbyBub3Qgc3RvcCBw
aG9zcGhvci13YXRjaGRvZyB3aGVuIHN5c3RlbSBwb3dlciBvZmYuCi0gQWx3YXlzIHJlc3RhcnQg
cGhvc3Bob3Itd2F0Y2hkb2cgYWZ0ZXIgaXQgaXMga2lsbGVkLgoKVGVzdCBSZXN1bHQ6CltUZXN0
IFN0ZXBdCjEuIHRlc3QgaXBtaXRvb2wgbWMgd2F0Y2hkb2cgZ2V0IGFmdGVyIGJtYyBib290LiAo
cGFzcykKMi4gdGVzdCBpcG1pdG9vbCBtYyB3YXRjaGRvZyBnZXQgYWZ0ZXIgaXBtaXRvb2wgY2hh
c3NpcyBwb3dlciBvZmYuIChwYXNzKQozLiB0ZXN0IGlwbWl0b29sIG1jIHdhdGNoZG9nIGdldCBh
ZnRlciByZWNlaXZpbmcgU0lHS0lMTC4gKHBhc3MpCgpbUmVtb3RlXQp3YXluZUBUR0E6fiQgaXBt
aXRvb2wgLUggMTAuMjQ4LjQyLjc0IC1VIHJvb3QgLVAgMHBlbkJtYyAtSSBsYW5wbHVzIGJtYyB3
YXRjaGRvZyBnZXQKV2F0Y2hkb2cgVGltZXIgVXNlOiAgICAgUmVzZXJ2ZWQgKDB4ODApCldhdGNo
ZG9nIFRpbWVyIElzOiAgICAgIFN0b3BwZWQKV2F0Y2hkb2cgVGltZXIgQWN0aW9uczogSGFyZCBS
ZXNldCAoMHgwMSkKUHJlLXRpbWVvdXQgaW50ZXJ2YWw6ICAgMCBzZWNvbmRzClRpbWVyIEV4cGly
YXRpb24gRmxhZ3M6IDB4MDAKSW5pdGlhbCBDb3VudGRvd246ICAgICAgMzAgc2VjClByZXNlbnQg
Q291bnRkb3duOiAgICAgIDMwIHNlYwp3YXluZUBUR0E6fiQKd2F5bmVAVEdBOn4kIGlwbWl0b29s
IC1IIDEwLjI0OC40Mi43NCAtVSByb290IC1QIDBwZW5CbWMgLUkgbGFucGx1cyBjaGFzc2lzIHBv
d2VyIG9mZgpDaGFzc2lzIFBvd2VyIENvbnRyb2w6IERvd24vT2ZmCndheW5lQFRHQTp+JCBpcG1p
dG9vbCAtSCAxMC4yNDguNDIuNzQgLVUgcm9vdCAtUCAwcGVuQm1jIC1JIGxhbnBsdXMgY2hhc3Np
cyBwb3dlciBzdGF0dXMKQ2hhc3NpcyBQb3dlciBpcyBvZmYKd2F5bmVAVEdBOn4kIGlwbWl0b29s
IC1IIDEwLjI0OC40Mi43NCAtVSByb290IC1QIDBwZW5CbWMgLUkgbGFucGx1cyBibWMgd2F0Y2hk
b2cgZ2V0CldhdGNoZG9nIFRpbWVyIFVzZTogICAgIFJlc2VydmVkICgweDgwKQpXYXRjaGRvZyBU
aW1lciBJczogICAgICBTdG9wcGVkCldhdGNoZG9nIFRpbWVyIEFjdGlvbnM6IEhhcmQgUmVzZXQg
KDB4MDEpClByZS10aW1lb3V0IGludGVydmFsOiAgIDAgc2Vjb25kcwpUaW1lciBFeHBpcmF0aW9u
IEZsYWdzOiAweDAwCkluaXRpYWwgQ291bnRkb3duOiAgICAgIDMwIHNlYwpQcmVzZW50IENvdW50
ZG93bjogICAgICAzMCBzZWMKCltTZXJ2ZXJdCmMyMDMwOn4jIHBzIHwgZ3JlcCBwaG9zcGhvci13
YXRjaGRvZwogIDIzMyByb290ICAgICAgNjkxNiBTICAgIHBob3NwaG9yLXdhdGNoZG9nIC0tY29u
dGludWUgLS1zZXJ2aWNlPXh5ei5vcGVuYm1jX3Byb2plY3QuV2F0Y2hkb2cgLS1wYXRoPS94eXov
b3BlbmJtY19wcm9qZWN0CiAgNTA3IHJvb3QgICAgICAyOTY4IFMgICAgZ3JlcCBwaG9zcGhvci13
YXRjaGRvZwpjMjAzMDp+IyBraWxsIC05IDIzMwoKW1JlbW90ZV0Kd2F5bmVAVEdBOn4kIGlwbWl0
b29sIC1IIDEwLjI0OC40Mi43NCAtVSByb290IC1QIDBwZW5CbWMgLUkgbGFucGx1cyBibWMgd2F0
Y2hkb2cgZ2V0CldhdGNoZG9nIFRpbWVyIFVzZTogICAgIFJlc2VydmVkICgweDgwKQpXYXRjaGRv
ZyBUaW1lciBJczogICAgICBTdG9wcGVkCldhdGNoZG9nIFRpbWVyIEFjdGlvbnM6IEhhcmQgUmVz
ZXQgKDB4MDEpClByZS10aW1lb3V0IGludGVydmFsOiAgIDAgc2Vjb25kcwpUaW1lciBFeHBpcmF0
aW9uIEZsYWdzOiAweDAwCkluaXRpYWwgQ291bnRkb3duOiAgICAgIDMwIHNlYwpQcmVzZW50IENv
dW50ZG93bjogICAgICAzMCBzZWMKLS0tCiAuLi4vd2F0Y2hkb2cvcGhvc3Bob3Itd2F0Y2hkb2cv
cGhvc3Bob3Itd2F0Y2hkb2dALnNlcnZpY2UgICAgICAgICAgICAgIHwgMiArLQogbWV0YS1waG9z
cGhvci9yZWNpcGVzLXBob3NwaG9yL3dhdGNoZG9nL3Bob3NwaG9yLXdhdGNoZG9nL3Bvd2Vyb24u
Y29uZiB8IDMgLS0tCiBtZXRhLXBob3NwaG9yL3JlY2lwZXMtcGhvc3Bob3Ivd2F0Y2hkb2cvcGhv
c3Bob3Itd2F0Y2hkb2dfZ2l0LmJiICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS1waG9zcGhvci9y
ZWNpcGVzLXBob3NwaG9yL3dhdGNoZG9nL3Bob3NwaG9yLXdhdGNoZG9nL3Bob3NwaG9yLXdhdGNo
ZG9nQC5zZXJ2aWNlIGIvbWV0YS1waG9zcGhvci9yZWNpcGVzLXBob3NwaG9yL3dhdGNoZG9nL3Bo
b3NwaG9yLXdhdGNoZG9nL3Bob3NwaG9yLXdhdGNoZG9nQC5zZXJ2aWNlCmluZGV4IDUyYzEyOTAu
LjExZDFjZDEgMTAwNjQ0Ci0tLSBhL21ldGEtcGhvc3Bob3IvcmVjaXBlcy1waG9zcGhvci93YXRj
aGRvZy9waG9zcGhvci13YXRjaGRvZy9waG9zcGhvci13YXRjaGRvZ0Auc2VydmljZQorKysgYi9t
ZXRhLXBob3NwaG9yL3JlY2lwZXMtcGhvc3Bob3Ivd2F0Y2hkb2cvcGhvc3Bob3Itd2F0Y2hkb2cv
cGhvc3Bob3Itd2F0Y2hkb2dALnNlcnZpY2UKQEAgLTIsNyArMiw3IEBACiBEZXNjcmlwdGlvbj1Q
aG9zcGhvciAlSSB3YXRjaGRvZwogCiBbU2VydmljZV0KLVJlc3RhcnQ9bm8KK1Jlc3RhcnQ9YWx3
YXlzCiBFbnZpcm9ubWVudEZpbGU9e2VudmZpbGVkaXJ9L29ibWMvd2F0Y2hkb2cvJUkKIEV4ZWNT
dGFydD0vdXNyL2Jpbi9lbnYgcGhvc3Bob3Itd2F0Y2hkb2cgLS1jb250aW51ZSAtLXNlcnZpY2U9
JHt7U0VSVklDRX19IC0tcGF0aD0ke3tERVZQQVRIfX0gLS10YXJnZXQ9JHt7VEFSR0VUfX0KIFN5
c2xvZ0lkZW50aWZpZXI9cGhvc3Bob3Itd2F0Y2hkb2cKZGlmZiAtLWdpdCBhL21ldGEtcGhvc3Bo
b3IvcmVjaXBlcy1waG9zcGhvci93YXRjaGRvZy9waG9zcGhvci13YXRjaGRvZy9wb3dlcm9uLmNv
bmYgYi9tZXRhLXBob3NwaG9yL3JlY2lwZXMtcGhvc3Bob3Ivd2F0Y2hkb2cvcGhvc3Bob3Itd2F0
Y2hkb2cvcG93ZXJvbi5jb25mCmluZGV4IGIyNTMyNDkuLjNhODQ2NmQgMTAwNjQ0Ci0tLSBhL21l
dGEtcGhvc3Bob3IvcmVjaXBlcy1waG9zcGhvci93YXRjaGRvZy9waG9zcGhvci13YXRjaGRvZy9w
b3dlcm9uLmNvbmYKKysrIGIvbWV0YS1waG9zcGhvci9yZWNpcGVzLXBob3NwaG9yL3dhdGNoZG9n
L3Bob3NwaG9yLXdhdGNoZG9nL3Bvd2Vyb24uY29uZgpAQCAtMSw0ICsxIEBACiBbVW5pdF0KLUNv
bmZsaWN0cz1vYm1jLWhvc3Qtc3RvcEAwLnRhcmdldAotQ29uZmxpY3RzPW9ibWMtY2hhc3Npcy1w
b3dlcm9mZkAwLnRhcmdldAotQ29uZmxpY3RzPW9ibWMtaG9zdC1xdWllc2NlQDAudGFyZ2V0CmRp
ZmYgLS1naXQgYS9tZXRhLXBob3NwaG9yL3JlY2lwZXMtcGhvc3Bob3Ivd2F0Y2hkb2cvcGhvc3Bo
b3Itd2F0Y2hkb2dfZ2l0LmJiIGIvbWV0YS1waG9zcGhvci9yZWNpcGVzLXBob3NwaG9yL3dhdGNo
ZG9nL3Bob3NwaG9yLXdhdGNoZG9nX2dpdC5iYgppbmRleCA3OWZhNjIwLi4zNTdiYWYxIDEwMDY0
NAotLS0gYS9tZXRhLXBob3NwaG9yL3JlY2lwZXMtcGhvc3Bob3Ivd2F0Y2hkb2cvcGhvc3Bob3It
d2F0Y2hkb2dfZ2l0LmJiCisrKyBiL21ldGEtcGhvc3Bob3IvcmVjaXBlcy1waG9zcGhvci93YXRj
aGRvZy9waG9zcGhvci13YXRjaGRvZ19naXQuYmIKQEAgLTQ4LDcgKzQ4LDcgQEAgU1lTVEVNRF9T
RVJWSUNFXyR7UE59ICs9ICIke0VOQUJMRV9XQVRDSERPR19UTVBMfSIKIFdBVENIRE9HX1RHVEZN
VCA9ICJwaG9zcGhvci13YXRjaGRvZ0B7MH0uc2VydmljZSIKIEVOQUJMRV9XQVRDSERPR19UR1RG
TVQgPSAib2JtYy1lbmFibGUtaG9zdC13YXRjaGRvZ0B7MH0uc2VydmljZSIKIAotV0FUQ0hET0df
Rk1UID0gIi4uLyR7V0FUQ0hET0dfVE1QTH06b2JtYy1ob3N0LXN0YXJ0bWluQHsxfS50YXJnZXQu
d2FudHMvJHtXQVRDSERPR19UR1RGTVR9IgorV0FUQ0hET0dfRk1UID0gIi4uLyR7V0FUQ0hET0df
VE1QTH06bXVsdGktdXNlci50YXJnZXQud2FudHMvJHtXQVRDSERPR19UR1RGTVR9IgogRU5BQkxF
X1dBVENIRE9HX0ZNVCA9ICIuLi8ke0VOQUJMRV9XQVRDSERPR19UTVBMfTpvYm1jLWhvc3Qtc3Rh
cnRtaW5AezB9LnRhcmdldC53YW50cy8ke0VOQUJMRV9XQVRDSERPR19UR1RGTVR9IgogCiBTWVNU
RU1EX0xJTktfJHtQTn0gKz0gIiR7QGNvbXBvc2VfbGlzdChkLCAnV0FUQ0hET0dfRk1UJywgJ09C
TUNfSE9TVF9XQVRDSERPR19JTlNUQU5DRVMnLCAnT0JNQ19IT1NUX0lOU1RBTkNFUycpfSIKLS0g
CjEuOS4xCgo=

--_004_HK0PR02MB2593B7A84823A34C11AEF363967E0HK0PR02MB2593apcp_--
