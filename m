Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C601B11A4D5
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 08:08:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Xp156lQ5zDqkW
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 18:08:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.246.1;
 helo=mail1.bemta23.messagelabs.com; envelope-from=dlin23@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Xp0F1yrfzDqkK
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 18:07:18 +1100 (AEDT)
Received: from [67.219.246.111] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-b.us-east-1.aws.symcld.net id D6/D5-12313-3A590FD5;
 Wed, 11 Dec 2019 07:07:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRWlGSWpSXmKPExsWS8eIhr+7iqR9
 iDe4dFLU41fKCxYHR4/yMhYwBjFGsmXlJ+RUJrBkrD31iK9irUfH/y3/WBsZelS5GLg4hgflM
 EqeWP2OBcF4zSkydfo0RwtnPKHHx0FPmLkYODjYBVYn707i7GDk5RAQsJZY8aGcDCQsD2Y+WG
 EGE7STmPLjJAmHrSez+uYgNxGYB6pw4cRdYnBek9chedhCbUUBW4smCZ0wgNrOAuMS5i61gcQ
 kBAYkle84zQ9iiEi8f/2OFsBUkmve8ZoGoT5C4v+gqG8RMQYmTM5+wTGAUnIVk1CwkZbOQlEH
 EdSQW7P7EBmFrSyxb+JoZxj5z4DETsvgCRvZVjCZJRZnpGSW5iZk5uoYGBrqGhka6RrpmeolV
 ukl6pcW6qYnFJbqGeonlxXrFlbnJOSl6eaklmxiB8ZJSwMS2g/HPx7d6hxglOZiURHlnv3kfK
 8SXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC98KkD7FCgkWp6akVaZk5wNiFSUtw8CiJ8M6ZApTmLS
 5IzC3OTIdInWK055jwcu4iZo6DR+cByY+rlgDJ7yBSiCUvPy9VSpz3MkibAEhbRmke3FBYqrn
 EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZg3GWQKT2ZeCdzuV0BnMQGd1ZnyDuSskkSElFQD
 k5ue06Lehrr2F+5TM2WEdzTOvX/sdNGCbSuO1M/QOXvYIuDZLR0HawbGxU9X2+eeWC+RPa/2e
 ZTIJ81yfp59z2esyrsoY1O0mvd77D/mIxnzZZxavhRcUpzjqfhI3eeqklQej7at4qLvn1uWuT
 FeyE/TPMHoPCM+LXLL96UZp88osF8P8DIplqqN7lRwVy5cfFZsofmS9zk+NgcnhX5ik57PlJJ
 87Aa/nnGk7ouGOtHZW5xbD6n9cLpmf41HL1KI42bzK7GJpsKSyvOu1NRNqDWq/bfgvM8Zjf+X
 9F9VNfoe77F/odA5aVPEqaedZXd7chTfX167ee7kHX5mif3TZR9vY/p32k/PqvLzciZPJZbij
 ERDLeai4kQAXH7O+7ADAAA=
X-Env-Sender: dlin23@lenovo.com
X-Msg-Ref: server-11.tower-395.messagelabs.com!1576048035!114207!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14670 invoked from network); 11 Dec 2019 07:07:15 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
 by server-11.tower-395.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Dec 2019 07:07:15 -0000
Received: from HKGWPEMAIL02.lenovo.com (unknown [10.128.3.70])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id B69B8C994C96108E01F5
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 02:07:14 -0500 (EST)
Received: from HKGWPEMAIL02.lenovo.com (10.128.3.70) by
 HKGWPEMAIL02.lenovo.com (10.128.3.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Wed, 11 Dec 2019 15:07:00 +0800
Received: from HKGWPEMAIL02.lenovo.com ([fe80::7020:5ebb:e3eb:29ba]) by
 HKGWPEMAIL02.lenovo.com ([fe80::7020:5ebb:e3eb:29ba%12]) with mapi id
 15.01.1591.008; Wed, 11 Dec 2019 15:07:00 +0800
From: Derek Lin23 <dlin23@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: DBUS-sensor temperature threshold for CPU & DIMM
Thread-Topic: DBUS-sensor temperature threshold for CPU & DIMM
Thread-Index: AdWv7ccUz5ikb/xuSbCQnzUC3WptVg==
Date: Wed, 11 Dec 2019 07:07:00 +0000
Message-ID: <a0ab2f7f4d0a417f8b723b4285ee9d7d@lenovo.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: multipart/alternative;
 boundary="_000_a0ab2f7f4d0a417f8b723b4285ee9d7dlenovocom_"
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

--_000_a0ab2f7f4d0a417f8b723b4285ee9d7dlenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi team:

          I have questions regarding CPU & DIMM temperature thresholds on D=
BUS-sensor. Please help to provide some ideas.
          Currently, we use DBUS-sensor to monitor CPU & DIMM temperature.
          We've discovered that "CriticalAlarmHigh" property in Critical in=
terface would never be triggered. The property is determined by TjMax of CP=
U. It seems like CPU temperature reported from PECI channel would not excee=
d TjMax.
          Do we have a chance to have a configuration file that modify "Cri=
ticalHigh" value to be "TjMax - a configurable value"? So, "CriticalAlarmHi=
gh" event can be triggered.

          As for DIMM temperature thresholds, both "WarningHigh" and "Criti=
calHigh" values are set with hwmon attributes, now.
          Could we still use Entity-Manager to set DIMM thresholds values?

Thank you,

Derek

--_000_a0ab2f7f4d0a417f8b723b4285ee9d7dlenovocom_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi team:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; I have questions regarding CPU &amp; DIMM temperatu=
re thresholds on DBUS-sensor. Please help to provide some ideas.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Currently, we use DBUS-sensor to monitor CPU &amp; =
DIMM temperature.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; We&#8217;ve discovered that &#8220;CriticalAlarmHig=
h&#8221; property in Critical interface would never be triggered. The prope=
rty is determined by TjMax of CPU. It seems like CPU temperature reported f=
rom PECI channel would not
 exceed TjMax. <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Do we have a chance to have a configuration file th=
at modify &#8220;CriticalHigh&#8221; value to be &#8220;TjMax &#8211; a con=
figurable value&#8221;? So, &#8220;CriticalAlarmHigh&#8221; event can be tr=
iggered.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; As for DIMM temperature thresholds, both &#8220;War=
ningHigh&#8221; and &#8220;CriticalHigh&#8221; values are set with hwmon at=
tributes, now.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Could we still use Entity-Manager to set DIMM thres=
holds values?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you,<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Derek<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_a0ab2f7f4d0a417f8b723b4285ee9d7dlenovocom_--
