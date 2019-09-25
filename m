Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C43F3BD68F
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 05:07:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dNJq2PP8zDqT7
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 13:07:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.112; helo=mail1.bemta23.messagelabs.com;
 envelope-from=pyang4@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dNHL2cCXzDqWt
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 13:05:58 +1000 (AEST)
Received: from [67.219.247.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-6.bemta.az-d.us-east-1.aws.symcld.net id 4D/53-19565-D89DA8D5;
 Wed, 25 Sep 2019 03:05:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRWlGSWpSXmKPExsWSLveKXbfnZle
 swbfrNhanWl6wODB6nJ+xkDGAMYo1My8pvyKBNePGwb1sBXNMKn4dWs3SwPhUv4uRi0NIYD6T
 xNPlG5khnNeMEvOXf2OCcPYxSsy+vIeti5GTg01ARWLO0h0sILaIgKXEkgftYHFhATmJnit/o
 OLKEp+2LQNq5gCy9SR+dSeDhFkEVCXuH14NVs4L1Hrk6DJmEJtRQEzi+6k1TCA2s4C4xLmLre
 wgtoSAgMSSPeeZIWxRiZeP/7FC2AoSzXtes0DUJ0g8+7SFEWKmoMTJmU9YJjAKzkIyahaSsll
 IyiDiOhILdn9ig7C1JZYtfM0MY5858JgJWXwBI/sqRrOkosz0jJLcxMwcXUMDA11DQyNdC11D
 c3O9xCrdFL3SYt3UxOISXUO9xPJiveLK3OScFL281JJNjMCoSSng2LiDceOsN3qHGCU5mJREe
 S8t7IoV4kvKT6nMSCzOiC8qzUktPsQow8GhJMH78DpQTrAoNT21Ii0zBxjBMGkJDh4lEV6vG0
 Bp3uKCxNzizHSI1ClGe44JL+cuYuY4eHQekPy4agmQ/A4ihVjy8vNSpcR5rUHaBEDaMkrz4Ib
 CEs4lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8t0Fu48nMK4Hb/QroLCags5SdO0HOKklE
 SEk1MM1u2vVMjqtyptE0hmvzN1z0E33zxvbZW16mC3NKKz6nvHfZ4zPly/8MG4n8i2G7rzoEb
 bjmbfit8Om5PYrr4iQ1zJ/8eHOa9fU+7jn7d57IYsgUnjr94Js37UwPfgTcTRaP292u+DzZry
 E3KfnixYV1e96fnz/Ra1nJA24LodzdrNo608R3M5wv+r2NYbXEL8noyP8lmkds/19KUdljccZ
 /24J/1//80jhfrB7LLfx/Z7L0jD1SqkKP5UIlYvjyIiY8KzhnvfuET0u17eemzlzpaVHBog/P
 Hb6hM11YeaOBsdqxyyZmXGVKSkqGn1wzl2yb7hKwzyuLTcL/RCi3S9imPSuSOlW1uc/niK5Wd
 1FiKc5INNRiLipOBAAbwb9dswMAAA==
X-Env-Sender: pyang4@lenovo.com
X-Msg-Ref: server-9.tower-426.messagelabs.com!1569380746!216782!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14013 invoked from network); 25 Sep 2019 03:05:48 -0000
Received: from unknown (HELO apsmtp.lenovo.com) (103.30.234.7)
 by server-9.tower-426.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Sep 2019 03:05:48 -0000
Received: from HKGWPEMAIL01.lenovo.com (unknown [10.128.3.69])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id D9E2C7F6C87FAA44AA71
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 11:05:45 +0800 (CST)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL01.lenovo.com (10.128.3.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Wed, 25 Sep 2019 11:05:22 +0800
Received: from HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613]) by
 HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613%5]) with mapi id
 15.01.1591.008; Wed, 25 Sep 2019 11:05:45 +0800
From: Payne Yang <pyang4@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Question for upstream
Thread-Topic: Question for upstream
Thread-Index: AdVzS8dMMm/mx/KnSbqgbxHwkKZVJw==
Date: Wed, 25 Sep 2019 03:05:45 +0000
Message-ID: <6bb44c8941db46efb2e7e2a0da39d2db@lenovo.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: multipart/alternative;
 boundary="_000_6bb44c8941db46efb2e7e2a0da39d2dblenovocom_"
MIME-Version: 1.0
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

--_000_6bb44c8941db46efb2e7e2a0da39d2dblenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

I reference package dbus-sensors to implement feature for FPGA monitor.
Which way is correct for upstream ??

1.      Use patch file and add bbappend on dbus-sensors

2.      Create oem folder in my meta-XXX/recipes-phosphor/XXX-sensors inclu=
ding some common header from dbus-sensors (eg. Utils.cpp & Utils.hpp)

3.      Create Pull Request on dbus-sensors for my implementation

Best Regards,
Payne


--_000_6bb44c8941db46efb2e7e2a0da39d2dblenovocom_
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
	font-family:"Calibri",sans-serif;}
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
/* List Definitions */
@list l0
	{mso-list-id:192233466;
	mso-list-type:hybrid;
	mso-list-template-ids:-1429326624 1897398956 67698713 67698715 67698703 67=
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
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Team,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I reference package dbus-sensor=
s to implement feature for FPGA monitor.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Which way is correct for upstre=
am ??<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd;text-indent:-18.0pt;mso-list:l0 level1 lfo1">
<![if !supportLists]><span lang=3D"EN-US"><span style=3D"mso-list:Ignore">1=
.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">Use patch file and add =
bbappend on dbus-sensors<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd;text-indent:-18.0pt;mso-list:l0 level1 lfo1">
<![if !supportLists]><span lang=3D"EN-US"><span style=3D"mso-list:Ignore">2=
.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">Create oem folder in my=
 meta-XXX/recipes-phosphor/XXX-sensors including some common header from db=
us-sensors (eg. Utils.cpp &amp; Utils.hpp)<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd;text-indent:-18.0pt;mso-list:l0 level1 lfo1">
<![if !supportLists]><span lang=3D"EN-US"><span style=3D"mso-list:Ignore">3=
.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">Create Pull Request on =
dbus-sensors for my implementation<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Payne<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_6bb44c8941db46efb2e7e2a0da39d2dblenovocom_--
