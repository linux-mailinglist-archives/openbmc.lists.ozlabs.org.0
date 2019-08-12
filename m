Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D378A32E
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2019 18:22:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466h2H3QCqzDqWT
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 02:22:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.211; helo=mail1.bemta23.messagelabs.com;
 envelope-from=rli11@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466h1f73qnzDqN9
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 02:21:42 +1000 (AEST)
Received: from [67.219.247.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-d.us-east-1.aws.symcld.net id 59/FA-23917-5FE815D5;
 Mon, 12 Aug 2019 16:08:21 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIKsWRWlGSWpSXmKPExsWS8eIhr+6XvsB
 YgwVTNSxOtbxgcWD0OD9jIWMAYxRrZl5SfkUCa8b7w2sZC35LVXxqXs/UwLhRoouRi0NIYD6T
 xL2FB9ggnNeMEi3btzNBOPsYJR4se8zSxcjJwSagJNHyagU7iC0iYCmx5EE7G4gtLKAr8WTlV
 2aIuJHEwZuzWCBsPYlVh3vBalgEVCXOnTvGCGLzAvV+fH+TFcRmFJCVeLLgGROIzSwgLnHuYi
 vYfAkBAYkle84zQ9iiEi8f/2OFsBUkmve8ZoGoT5C4t/k1O8RMQYmTM5+wTGAUnIVk1CwkZbO
 QlEHEdSQW7P7EBmFrSyxb+JoZxj5z4DETsvgCRvZVjGZJRZnpGSW5iZk5uoYGBrqGhkZArGtu
 oJdYpZuiV1qsm5pYXKJrqJdYXqxXXJmbnJOil5dasokRGDcpBdxuOxhnz3qjd4hRkoNJSZS3K
 DYwVogvKT+lMiOxOCO+qDQntfgQowwHh5IE75ceoJxgUWp6akVaZg4whmHSEhw8SiK853qB0r
 zFBYm5xZnpEKlTjPYcE17OXcTMcfDoPCD5cdUSIPkdRAqx5OXnpUqJ86p2AbUJgLRllObBDYW
 lnEuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlfgCznycwrgdv9CugsJqCzuJ/4gpxVkoiQ
 kmpgclMzXXnFpmjC9vM/Un2DhXdPyzP68idX5+iThfcj/+QorV4949+5TkU9Vv53+uY7cial8
 knbBb9+7/Wv+cH+C9F1CrVn1pvNv8+albNzgkIXl1XAiRyJOW/FeAKLBYQuxe4Pj14crLH943
 LZstduF+9rH5ZKCd2tphFnd+/pzpog3f37liQpKEerOe8UWe39WfHD3bXby5fPYVuWufvY5j8
 vzus233q6e3HFnf1GyUElfP/zI0+9zHiULJQStHDz5Y11rP8WLf+ZtKvOqqvcT/v6s4ed3NOu
 +35YrrDQ0SDZsOaDaPmkDoU3DrXyB0W79VK2K/scjLzdJ5fyc2/Ye9Gs04uWOqQ1bfii7DLRR
 4mlOCPRUIu5qDgRAEEjAmq0AwAA
X-Env-Sender: rli11@lenovo.com
X-Msg-Ref: server-11.tower-426.messagelabs.com!1565626100!445320!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26697 invoked from network); 12 Aug 2019 16:08:20 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
 by server-11.tower-426.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Aug 2019 16:08:20 -0000
Received: from HKGWPEMAIL01.lenovo.com (unknown [10.128.3.69])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 0B3A04E155753BE78584
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 12:08:19 -0400 (EDT)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL01.lenovo.com (10.128.3.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Tue, 13 Aug 2019 00:08:09 +0800
Received: from HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613]) by
 HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613%5]) with mapi id
 15.01.1591.008; Tue, 13 Aug 2019 00:08:18 +0800
From: Ivan Li11 <rli11@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Question about sensor number access 
Thread-Topic: Question about sensor number access 
Thread-Index: AdVRIVn/nYHC01CUQoC1p3ukkFbh5Q==
Date: Mon, 12 Aug 2019 16:08:17 +0000
Message-ID: <860e21837286442b9a1cdd7d7dafe474@lenovo.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: multipart/alternative;
 boundary="_000_860e21837286442b9a1cdd7d7dafe474lenovocom_"
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

--_000_860e21837286442b9a1cdd7d7dafe474lenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

I have a question about sensor number.
As far as I know, "phosphor-host-ipmid" will parse "ipmi-sensors.yaml" and =
then store these sensors info(sensor number and sensor type, etc) in ipmid.
May I know if another daemon(e.g. phosphor-sel-logger) needs sensor number =
info, is there any suggested method to get sensor number ?

Thanks,
Ivan

--_000_860e21837286442b9a1cdd7d7dafe474lenovocom_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have a question about sensor =
number.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">As far as I know, &#8220;phosph=
or-host-ipmid&#8221; will parse &#8220;ipmi-sensors.yaml&#8221; and then st=
ore these sensors info(sensor number and sensor type, etc) in ipmid. &nbsp;=
&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">May I know if another daemon(e.=
g. phosphor-sel-logger) needs sensor number info, is there any suggested me=
thod to get sensor number ? &nbsp;&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Ivan<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_860e21837286442b9a1cdd7d7dafe474lenovocom_--
