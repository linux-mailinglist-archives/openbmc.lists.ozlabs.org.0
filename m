Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A85A72579
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 05:45:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45th7g64FvzDqCp
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 13:45:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=apc01-pu1-obe.outbound.protection.outlook.com
 (client-ip=40.107.132.74; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="ZRxkmGU6"; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320074.outbound.protection.outlook.com [40.107.132.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tCRB2YWXzDq6N
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 19:12:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f43jjCWRguz7ZudMCBiFEi/q0yFTBhX/1mQSdciTOllO0KVEQbr6xS0WPnMd6dm2Cn8kX88P+qYpDZZbAKpIOFUZVSEidFctjIA9jPVXilUgHnQujDXaG/VU/xKo2s5lBTF32Rcbyo59DvTgVWPQ6jxy7/8gwvqZLtgJYRVSMsTzrA5+ZLqm9K2joe6AaE5LvGBzRW1fiAVK+TPxVJgDeRuIFW5yMofjZazNZ/qmWGDLPO29BJlMQzH0ya/5apjEhdNADJrOP/wQLpPciQZhfJwbo4tdU2SK1HKNa8yCPvSU6iGbdteFAfStojTvbDTTylI+PC2sk6rJkuyQXfcvfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLjDd1j/7aXiShYYWdQANaZ00b88ghmciOx+USCI9sU=;
 b=MNMzz/mtljfqzmKwJ/mnW2LL7S5gdVD4cODj8mVf7Lv3m56/cDU2FNywoIB6qYf04Qb6ciclguKRAF1/zwutsqZrGX8JytZtzGyk/wfip03U1WO/P05DABy9wVj7uI5KgqcFc65Lg87uMqEAZOPx0l672Z9+GdOMB9CKyLKUowOQSeBc0teteHpwgUXqD6sRrNXAIi7I8r9OjOoe2KiJNNU2FAh6sO35AHbInpbuF28KVfbbLfBQThk3Pri6xgLCHj6P0JKbfPIrMKh1epTSBCw6chk93LoxeVXZj68/WhZ8lmR7pSmSRWdKrYdJ9mcy0pEgdzE4/usq6372bS+MKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nuvoton.com;dmarc=pass action=none
 header.from=nuvoton.com;dkim=pass header.d=nuvoton.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector1-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLjDd1j/7aXiShYYWdQANaZ00b88ghmciOx+USCI9sU=;
 b=ZRxkmGU6dcN2OSJu3GpsANdvqzY1Zev2pzwduVfAV0ZTz9eKujV8wiJFhtrAnsyOYZMrYd7SABbaMKEl1LfDs5IpS433pEVQDIsc4tMGrqxOMWA84Lerf8Qo8ZgnajywexvUMIRmJZED/PrLEWubASbR8TdBOXUlQG+MkYa0Iug=
Received: from HK0PR03MB4660.apcprd03.prod.outlook.com (52.132.237.207) by
 HK0PR03MB3186.apcprd03.prod.outlook.com (52.133.153.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Tue, 23 Jul 2019 09:11:57 +0000
Received: from HK0PR03MB4660.apcprd03.prod.outlook.com
 ([fe80::797d:4fdd:4186:831e]) by HK0PR03MB4660.apcprd03.prod.outlook.com
 ([fe80::797d:4fdd:4186:831e%7]) with mapi id 15.20.2115.005; Tue, 23 Jul 2019
 09:11:57 +0000
From: CS20 CHLi30 <CHLI30@nuvoton.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Warm reboot functionality of WebUI isn't work properly
Thread-Topic: Warm reboot functionality of WebUI isn't work properly
Thread-Index: AdVBM8Y4HXzT/P84SeCqOcwkdHdArA==
Date: Tue, 23 Jul 2019 09:11:57 +0000
Message-ID: <HK0PR03MB4660AB0BEE7231BEE7C8A6CACFC70@HK0PR03MB4660.apcprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=CHLI30@nuvoton.com; 
x-originating-ip: [60.250.194.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e6ebfbb-45ee-483b-d199-08d70f4dcffc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:HK0PR03MB3186; 
x-ms-traffictypediagnostic: HK0PR03MB3186:|HK0PR03MB3186:
x-microsoft-antispam-prvs: <HK0PR03MB3186EE7080C67F907A4085EDCFC70@HK0PR03MB3186.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(39850400004)(376002)(366004)(396003)(199004)(51874003)(53754006)(189003)(33656002)(66946007)(99286004)(256004)(66556008)(76116006)(64756008)(66476007)(66446008)(71190400001)(14444005)(316002)(1730700003)(8936002)(2351001)(2906002)(6116002)(3846002)(486006)(790700001)(6506007)(8676002)(71200400001)(81166006)(81156014)(6916009)(2501003)(5640700003)(26005)(52536014)(25786009)(478600001)(55016002)(6306002)(9686003)(7736002)(186003)(476003)(5660300002)(102836004)(66066001)(53936002)(68736007)(7696005)(14454004)(54896002)(236005)(6436002)(86362001)(74316002)(460985005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HK0PR03MB3186;
 H:HK0PR03MB4660.apcprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nuvoton.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bE9u9/xdsGZnhzDrkFBW2s/pc5IsrDOTdPiKmPfc9f1/taKwr82URo1ASYJFr3nGEMwriJ0LI+ST+l/HdLmfSQJ3gElyYKJCGaGUwc6M22+HU/ta7XbNIMA4xyUKO5zlqM2oV5acp1DiZMZD/Xd+ZJCb66V2tYGAqgdMaXvWr8uzNnuiLNOZmcoYPKWHFaawFYbkNkn1YpY4sJpu3bKLE72fZT72n9q5H4TsoYLn7phk3ACKh9pZes1UXOu/fXHbPieNxx2gFoYYAviXpCKePjql6ibmmobapvlKwm8Eg4CocThBWGmET/DNjqYz5zNZfSbKd7FT/P3vFUpa0bTuc65lLQApjD/hZ84ydCRplxK+6CbQm2dgAFpf+Vi6qrVVAAuQB7Cq1fq4tIgFdbd6VMUd0nY6p+vQXhwiseT0zSM=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR03MB4660AB0BEE7231BEE7C8A6CACFC70HK0PR03MB4660apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6ebfbb-45ee-483b-d199-08d70f4dcffc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 09:11:57.1186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CHLI30@nuvoton.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3186
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

--_000_HK0PR03MB4660AB0BEE7231BEE7C8A6CACFC70HK0PR03MB4660apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

When we using the latest openbmc code (newer than v2.6 branch), we meet War=
m reboot of WebUI functionality isn't work properly. In openbmc v2.6 branch=
, we didn't meet this issue.
After checking the fail log seems that obmc-host-reboot@0.target<mailto:obm=
c-host-reboot@0.target> be called through bmcweb normally, but op-power-sto=
p@0.service<mailto:op-power-stop@0.service> and phosphor-reboot-host@0.serv=
ice<mailto:phosphor-reboot-host@0.service> didn't be executed eventually.
Did anyone meet this issue symptom? Please don't hesitate provide your feed=
back. Thanks in advance.
BTW, Power ON functionality is work properly, power_control service is acti=
ve (running).

busctl --system --no-pager log:
org.freedesktop.systemd1           1 systemd         root             :1.4 =
         init.scope
:1.55                        2560 bmcweb          root             :1.55   =
      bmcweb.service
xyz.openbmc_project.State.Host  2641 phosphor-host-s root                :1=
.58         xyz.openbmc_project.St...

dbus-monitor --system log:
method call time=3D1563773011.059338 sender=3D:1.55 -> destination=3Dxyz.op=
enbmc_project.State.Host serial=3D101 path=3D/xyz/openbmc_project/state/hos=
t0; interface=3Dorg.freedesktop.DBus.Properties; member=3DSet
   string "xyz.openbmc_project.State.Host"
   string "RequestedHostTransition"
   variant       string "xyz.openbmc_project.State.Host.Transition.Reboot"
method call time=3D1563773011.060236 sender=3D:1.58 -> destination=3Dorg.fr=
eedesktop.DBus serial=3D61 path=3D/org/freedesktop/DBus; interface=3Dorg.fr=
eedesktop.DBus; member=3DGetConnectionUnixUser
   string ":1.55"
method return time=3D1563773011.060292 sender=3Dorg.freedesktop.DBus -> des=
tination=3D:1.58 serial=3D4294967295 reply_serial=3D61
   uint32 0
signal time=3D1563773011.060328 sender=3D:1.58 -> destination=3D(null desti=
nation) serial=3D62 path=3D/xyz/openbmc_project/state/host0; interface=3Dor=
g.freedesktop.DBus.Properties; member=3DPropertiesChanged
   string "xyz.openbmc_project.Control.Boot.RebootAttempts"
   array [
      dict entry(
         string "AttemptsLeft"
         variant             uint32 1
      )
   ]
   array [
   ]
method call time=3D1563773011.060435 sender=3D:1.58 -> destination=3Dorg.fr=
eedesktop.systemd1 serial=3D63 path=3D/org/freedesktop/systemd1; interface=
=3Dorg.freedesktop.systemd1.Manager; member=3DStartUnit
   string "obmc-host-reboot@0.target"
   string "replace"
method call time=3D1563773011.060481 sender=3D:1.4 -> destination=3Dorg.fre=
edesktop.DBus serial=3D958 path=3D/org/freedesktop/DBus; interface=3Dorg.fr=
eedesktop.DBus; member=3DGetConnectionUnixUser
   string ":1.58"
method return time=3D1563773011.060515 sender=3Dorg.freedesktop.DBus -> des=
tination=3D:1.4 serial=3D4294967295 reply_serial=3D958
   uint32 0
signal time=3D1563773011.060548 sender=3D:1.4 -> destination=3D(null destin=
ation) serial=3D959 path=3D/org/freedesktop/systemd1/job/1121; interface=3D=
org.freedesktop.DBus.Properties; member=3DPropertiesChanged
   string "org.freedesktop.systemd1.Job"
   array [
      dict entry(
         string "State"
         variant             string "waiting"
      )
   ]
   array [
   ]
method return time=3D1563773011.060663 sender=3D:1.4 -> destination=3D:1.58=
 serial=3D960 reply_serial=3D63
   object path "/org/freedesktop/systemd1/job/1121"

systemctl status obmc-host-reboot@0.target log:
* obmc-host-reboot@0.target - Reboot Host0
   Loaded: loaded (/lib/systemd/system/obmc-host-reboot@.target; static; ve=
ndor preset: enabled)
   Active: inactive (dead)
* op-power-stop@0.service - Stop Power0
   Loaded: loaded (/lib/systemd/system/op-power-stop@.service; static; vend=
or preset: enabled)
   Active: inactive (dead)
* phosphor-reboot-host@0.service - Reboot host0
   Loaded: loaded (/lib/systemd/system/phosphor-reboot-host@.service; stati=
c; vendor preset: enabled)
   Active: inactive (dead)
* org.openbmc.control.Power@0.service - Phosphor Power0 Control
   Loaded: loaded (/lib/systemd/system/org.openbmc.control.Power@.service; =
enabled; vendor preset: enabled)
   Active: active (running) since Mon 2019-07-22 05:21:02 UTC; 1h 4min ago
Main PID: 2549 (power_control.e)
   CGroup: /system.slice/system-org.openbmc.control.Power.slice/org.openbmc=
.control.Power@0.service
           `-2549 power_control.exe 3000 10

Jul 22 05:21:01 runbmc-nuvoton power_control.exe[2549]: Power GPIO 0 reset =
outputs
Jul 22 05:21:01 runbmc-nuvoton power_control.exe[2549]: Power GPIO 0 pci re=
set outputs
Jul 22 05:21:01 runbmc-nuvoton power_control.exe[2549]: GPIO Lookup:  PGOOD=
 =3D 126,in
Jul 22 05:21:01 runbmc-nuvoton power_control.exe[2549]: GPIO Lookup:  POWER=
_UP_PIN =3D 219,out
Jul 22 05:21:01 runbmc-nuvoton power_control.exe[2549]: Pgood state: 0
Jul 22 05:21:02 runbmc-nuvoton systemd[1]: Started Phosphor Power0 Control.
Jul 22 05:21:40 runbmc-nuvoton power_control.exe[2549]: Power requested sta=
te: 1
Jul 22 05:21:40 runbmc-nuvoton power_control.exe[2549]: PowerControl: setti=
ng power up POWER_UP_PIN to 1
Jul 22 05:21:41 runbmc-nuvoton power_control.exe[2549]: Power requested sta=
te: 1
Jul 22 05:21:41 runbmc-nuvoton power_control.exe[2549]: PowerControl: setti=
ng power up POWER_UP_PIN to 0

Sincerely,
Tim Lee
________________________________
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.

--_000_HK0PR03MB4660AB0BEE7231BEE7C8A6CACFC70HK0PR03MB4660apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
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
	{mso-style-type:export-only;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi All,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">When we using the latest openbm=
c code (newer than v2.6 branch), we meet Warm reboot of WebUI functionality=
 isn&#8217;t work properly.
<b>In openbmc v2.6 branch, we didn&#8217;t meet this issue.</b><o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">After checking the fail log see=
ms that <a href=3D"mailto:obmc-host-reboot@0.target">
obmc-host-reboot@0.target</a> be called through bmcweb normally, but <a hre=
f=3D"mailto:op-power-stop@0.service">
op-power-stop@0.service</a> and <a href=3D"mailto:phosphor-reboot-host@0.se=
rvice">phosphor-reboot-host@0.service</a> didn&#8217;t be executed eventual=
ly.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Did anyone meet this issue symp=
tom? Please don&#8217;t hesitate provide your feedback. Thanks in advance.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">BTW, Power ON functionality is =
work properly, power_control service is active (running).<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">busctl --system --no-pager l=
og:<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">org.freedesktop.systemd1&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1 systemd&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :1.4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; init.scope<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">:1.55&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2560 bmcweb&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :1.55&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; bmcweb.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xyz.openbmc_project.State.Host&=
nbsp; 2641 phosphor-host-s root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;:1.58&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; xyz.openbmc_project.St...<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">dbus-monitor --system log:<o=
:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">method call time=3D1563773011.0=
59338 sender=3D:1.55 -&gt; destination=3Dxyz.openbmc_project.State.Host ser=
ial=3D101 path=3D/xyz/openbmc_project/state/host0; interface=3Dorg.freedesk=
top.DBus.Properties;
<b>member=3DSet</b><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; string &quot;xyz.o=
penbmc_project.State.Host&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; string &quot;Reque=
stedHostTransition&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; variant&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; <b>string &quot;xyz.openbmc_project.State.Host.Tr=
ansition.Reboot&quot;</b><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">method call time=3D1563773011.0=
60236 sender=3D:1.58 -&gt; destination=3Dorg.freedesktop.DBus serial=3D61 p=
ath=3D/org/freedesktop/DBus; interface=3Dorg.freedesktop.DBus; member=3DGet=
ConnectionUnixUser<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; string &quot;:1.55=
&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">method return time=3D1563773011=
.060292 sender=3Dorg.freedesktop.DBus -&gt; destination=3D:1.58 serial=3D42=
94967295 reply_serial=3D61<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; uint32 0<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">signal time=3D1563773011.060328=
 sender=3D:1.58 -&gt; destination=3D(null destination) serial=3D62 path=3D/=
xyz/openbmc_project/state/host0; interface=3Dorg.freedesktop.DBus.Propertie=
s; member=3DPropertiesChanged<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; string &quot;xyz.o=
penbmc_project.Control.Boot.RebootAttempts&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; array [<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
dict entry(<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; string &quot;AttemptsLeft&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; variant&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; uint32 1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; ]<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; array [<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; ]<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">method call time=3D1563773011.0=
60435 sender=3D:1.58 -&gt; destination=3Dorg.freedesktop.systemd1 serial=3D=
63 path=3D/org/freedesktop/systemd1; interface=3Dorg.freedesktop.systemd1.M=
anager;
<b>member=3DStartUnit</b><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; string <b>&quot;ob=
mc-host-reboot@0.target&quot;</b><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; string &quot;repla=
ce&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">method call time=3D1563773011.0=
60481 sender=3D:1.4 -&gt; destination=3Dorg.freedesktop.DBus serial=3D958 p=
ath=3D/org/freedesktop/DBus; interface=3Dorg.freedesktop.DBus; member=3DGet=
ConnectionUnixUser<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; string &quot;:1.58=
&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">method return time=3D1563773011=
.060515 sender=3Dorg.freedesktop.DBus -&gt; destination=3D:1.4 serial=3D429=
4967295 reply_serial=3D958<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; uint32 0<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">signal time=3D1563773011.060548=
 sender=3D:1.4 -&gt; destination=3D(null destination) serial=3D959 path=3D/=
org/freedesktop/systemd1/job/1121; interface=3Dorg.freedesktop.DBus.Propert=
ies; member=3DPropertiesChanged<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; string &quot;org.f=
reedesktop.systemd1.Job&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; array [<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
dict entry(<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; string &quot;State&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; variant&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &=
nbsp;&nbsp;&nbsp;&nbsp;string &quot;waiting&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; ]<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; array [<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; ]<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">method return time=3D1563773011=
.060663 sender=3D:1.4 -&gt; destination=3D:1.58 serial=3D960 reply_serial=
=3D63<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; object path &quot;=
/org/freedesktop/systemd1/job/1121&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">systemctl status obmc-host-r=
eboot@0.target log:<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">* obmc-host-reboot@0.target - R=
eboot Host0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; Loaded: loaded (/l=
ib/systemd/system/obmc-host-reboot@.target; static; vendor preset: enabled)=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; <u>Active: inactiv=
e (dead)<o:p></o:p></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">* op-power-stop@0.service - Sto=
p Power0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; Loaded: loaded (/l=
ib/systemd/system/op-power-stop@.service; static; vendor preset: enabled)<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; <u>Active: inactiv=
e (dead)<o:p></o:p></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">* phosphor-reboot-host@0.servic=
e - Reboot host0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; Loaded: loaded (/l=
ib/systemd/system/phosphor-reboot-host@.service; static; vendor preset: ena=
bled)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; <u>Active: inactiv=
e (dead)<o:p></o:p></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">* org.openbmc.control.Power@0.s=
ervice - Phosphor Power0 Control<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; Loaded: loaded (/l=
ib/systemd/system/org.openbmc.control.Power@.service; enabled; vendor prese=
t: enabled)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; <u>Active: active =
(running)</u> since Mon 2019-07-22 05:21:02 UTC; 1h 4min ago<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Main PID: 2549 (power_control.e=
)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; CGroup: /system.sl=
ice/system-org.openbmc.control.Power.slice/org.openbmc.control.Power@0.serv=
ice<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &nbsp;`-2549 power_control.exe 3000 10<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Jul 22 05:21:01 runbmc-nuvoton =
power_control.exe[2549]: Power GPIO 0 reset outputs<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Jul 22 05:21:01 runbmc-nuvoton =
power_control.exe[2549]: Power GPIO 0 pci reset outputs<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Jul 22 05:21:01 runbmc-nuvoton =
power_control.exe[2549]: GPIO Lookup:&nbsp; PGOOD =3D 126,in<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Jul 22 05:21:01 runbmc-nuvoton =
power_control.exe[2549]: GPIO Lookup:&nbsp; POWER_UP_PIN =3D 219,out<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Jul 22 05:21:01 runbmc-nuvoton =
power_control.exe[2549]: Pgood state: 0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Jul 22 05:21:02 runbmc-nuvoton =
systemd[1]: Started Phosphor Power0 Control.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Jul 22 05:21:40 runbmc-nuvoton =
power_control.exe[2549]: Power requested state: 1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Jul 22 05:21:40 runbmc-nuvoton =
power_control.exe[2549]: PowerControl: setting power up POWER_UP_PIN to 1<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Jul 22 05:21:41 runbmc-nuvoton =
power_control.exe[2549]: Power requested state: 1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Jul 22 05:21:41 runbmc-nuvoton =
power_control.exe[2549]: PowerControl: setting power up POWER_UP_PIN to 0<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Sincerely,<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Tim Lee<o:p></o:p></span></p>
</div>
<hr align=3D"center" width=3D"100%">
<span style=3D"font-size:12pt;line-height:0.7;font-family: 'Arial'; color:#=
808080">The privileged confidential information contained in this email is =
intended for use only by the addressees as indicated by the original sender=
 of this email. If you are not the
 addressee indicated in this email or are not responsible for delivery of t=
he email to such a person, please kindly reply to the sender indicating thi=
s fact and delete all copies of it from your computer and network server im=
mediately. Your cooperation is highly
 appreciated. It is advised that any unauthorized use of confidential infor=
mation of Nuvoton is strictly prohibited; and any information in this email=
 irrelevant to the official business of Nuvoton shall be deemed as neither =
given nor endorsed by Nuvoton.
</span>
</body>
</html>

--_000_HK0PR03MB4660AB0BEE7231BEE7C8A6CACFC70HK0PR03MB4660apcp_--
