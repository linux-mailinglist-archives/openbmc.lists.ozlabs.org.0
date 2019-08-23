Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D769AD1C
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 12:28:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FHgH3DprzDrWY
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 20:28:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.115; helo=mail1.bemta23.messagelabs.com;
 envelope-from=hsung1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FHfW45bfzDrWQ
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 20:28:01 +1000 (AEST)
Received: from [67.219.246.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-c.us-east-1.aws.symcld.net id 78/60-11628-EAFBF5D5;
 Fri, 23 Aug 2019 10:27:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRWlGSWpSXmKPExsWS8eIhj+66/fG
 xBj0PRCxOtbxgcWD0OD9jIWMAYxRrZl5SfkUCa8aZ9fYFF6QrFr9YzN7AOFeyi5GTQ0hgPpPE
 ufPJXYxcQPZrRonFk9YxQjj7GCWu3/jDCFLFJqAqseXZExYQW0TAUmLJg3Y2EFtYwFRi85GZU
 HErif9L7gPFOYBsPYmZezxBTBag1rZuYZAKXqDO593NzCA2o4CsxJMFz5hAbGYBcYlzF1vZQW
 wJAQGJJXvOM0PYohIvH/9jhbAVJJr3vGYBGckskCBxcY0bxEhBiZMzn7BMYBSchWTSLISqWUi
 qIEp0JBbs/sQGYWtLLFv4mhnGPnPgMROy+AJG9lWMpklFmekZJbmJmTm6hgYGuoaGRrrmuiaG
 eolVusl6pcW6qYnFJbpAbnmxXnFlbnJOil5easkmRmCkpBSwa+5g3Dvrjd4hRkkOJiVR3ojO+
 FghvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErx39gHlBItS01Mr0jJzgFELk5bg4FES4d0KkuYtLk
 jMLc5Mh0idYrTnmPBy7iJmjoNH5wHJj6uWAMnvIFKIJS8/L1VKnPclSJsASFtGaR7cUFiSucQ
 oKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHcZyBSezLwSuN2vgM5iAjqrckcsyFkliQgpqQYm
 F8l7CmKXt354oS2ncaxt+bO9S+cUl8W5ZmoGNle91az6vVPh51nO6sAWLdWmqN22c3ZLPS/In
 F14dE/xNr2iS553p6v1Hq6eVrBmVp87i9Tfn/ZvHRglHrJN/X+wxUJL+0SynjL/NhGz+ykyVZ
 MZOe5IFUYWuatYnPzXnK6qOktAd0s4l0fW342WtkZ1HYLTVu9dzi9qHDs7MN3pYfyapInPHdY
 vYWvYHfCw/tHy2MJCFjbf5kL3hnl9Dlbbnl5e8Czh3+zVV55O3OXnnnS7+ZVudG697j+hppU5
 Aq2Hb5ecXf/UvEi4S14yuSy3PsEmZuZBs5Nq0+bf/fzQ4eCkYE6OOz96lVZvPuK14bISS3FGo
 qEWc1FxIgCVf5sprQMAAA==
X-Env-Sender: hsung1@lenovo.com
X-Msg-Ref: server-39.tower-406.messagelabs.com!1566556078!1546502!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12401 invoked from network); 23 Aug 2019 10:27:58 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-39.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Aug 2019 10:27:58 -0000
Received: from HKGWPEMAIL03.lenovo.com (unknown [10.128.3.71])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id BF020ED7DE7126B183FE
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 06:27:57 -0400 (EDT)
Received: from HKGWPEMAIL03.lenovo.com (10.128.3.71) by
 HKGWPEMAIL03.lenovo.com (10.128.3.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Fri, 23 Aug 2019 18:27:43 +0800
Received: from HKGWPEMAIL03.lenovo.com ([fe80::6151:c7db:16ab:b903]) by
 HKGWPEMAIL03.lenovo.com ([fe80::6151:c7db:16ab:b903%6]) with mapi id
 15.01.1591.008; Fri, 23 Aug 2019 18:27:43 +0800
From: Harry Sung1 <hsung1@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Leverage source code from another repository
Thread-Topic: Leverage source code from another repository
Thread-Index: AdVZm4Y2jB100zpkRYGnIXFx0b4o3Q==
Date: Fri, 23 Aug 2019 10:27:43 +0000
Message-ID: <e806efd25d7248d29f411ef4dedfec2f@lenovo.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: multipart/alternative;
 boundary="_000_e806efd25d7248d29f411ef4dedfec2flenovocom_"
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

--_000_e806efd25d7248d29f411ef4dedfec2flenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Is it ok to leverage source code from another repository?
For example, if I only want to use the FRU write command from intel-ipmi-oe=
m.
https://github.com/openbmc/intel-ipmi-oem/blob/master/src/storagecommands.c=
pp#L316

Is it allowed to copy it into our ipmi oem library?

Thanks,
Harry

--_000_e806efd25d7248d29f411ef4dedfec2flenovocom_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Team,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is it ok to leverage source cod=
e from another repository?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">For example, if I only want to =
use the FRU write command from intel-ipmi-oem.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/o=
penbmc/intel-ipmi-oem/blob/master/src/storagecommands.cpp#L316">https://git=
hub.com/openbmc/intel-ipmi-oem/blob/master/src/storagecommands.cpp#L316</a>=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is it allowed to copy it into o=
ur ipmi oem library?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Harry<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_e806efd25d7248d29f411ef4dedfec2flenovocom_--
