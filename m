Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCA4279A4
	for <lists+openbmc@lfdr.de>; Thu, 23 May 2019 11:47:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458l5n2wwgzDqbw
	for <lists+openbmc@lfdr.de>; Thu, 23 May 2019 19:47:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.250.3; helo=mail1.bemta24.messagelabs.com;
 envelope-from=pengms1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458l4H5z7SzDqbG
 for <openbmc@lists.ozlabs.org>; Thu, 23 May 2019 19:45:51 +1000 (AEST)
Received: from [67.219.250.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-a.us-west-2.aws.symcld.net id 6E/E4-29278-CCB66EC5;
 Thu, 23 May 2019 09:45:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNKsWRWlGSWpSXmKPExsWS8eIhr+6Z7Gc
 xBl3btCxOtbxgcWD0OD9jIWMAYxRrZl5SfkUCa0bP7gtsBZPlK6Zt+M/WwHhGpouRi0NIYBmT
 xKd/c1m6GDmBnGmMEh//GILYbAJaEgv/72ECsUUELCWWPGhnA2lgFtjIKPH8xFxGkISwgIXEl
 atTWSCKbCVeLJvMCmHrSUx/dB8sziKgKrHu6nVmEJtXwEfiye13bCA2o4CYxPdTa8AWMAuIS8
 ydNgusV0JAQGLJnvPMELaoxMvH/4DiHEC2vMSWWYIQ5XkSH+8vY4QYKShxcuYTlgmMgrOQTJq
 FpGwWkjKIuI7Egt2f2CBsbYllC18zw9hnDjxmQhZfwMi+itEiqSgzPaMkNzEzR9fQwEDX0NBI
 19DIEkib6SVW6SbqlRbrlqcWl+ga6SWWF+sVV+Ym56To5aWWbGIExk1KQWPJDsZdR17rHWKU5
 GBSEuUtdnsWI8SXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCVy0LKCdYlJqeWpGWmQOMYZi0BAePkg
 gvP0iat7ggMbc4Mx0idYrRkuPAoodzmTm23H8GJHeBSCGWvPy8VClx3gCQBgGQhozSPLhxsDR
 ziVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwrzXIFJ7MvBK4ra+ADmICOkiW/THIQSWJCCmp
 BiYLwYJpfy5sWqwmIplqdCdjOt9OEf1cYWuf/O7lEau2qyyrNVmy+mL6d9Vd2jnu76c0nDSfe
 Nrnyo40FYcfKbMfLfguJcf3cSGb1LfNDeX2aSmFi22DNtnJ7Tv2lemM1aWdBbnWS7uXfE/9/O
 Ts4/AUmY5iHp+95unlHgH5V688L/mqvX37BrUg/TSmNewC1e8s3rz13n202mb1tysVWSeLZy0
 /L/Z2xa1rwkuLg83aRBfsFFUQES98U1NedHXJ0rL4iU1eVVN6tOYKZ/ern3fXP+QccLk75aD1
 3HddmUrhcVN/JLYqH3x6ydW76NiShBkyz9l/TU39kL57Rtzf0GlWnrMOrfZ1+y+376iqz3cll
 uKMREMt5qLiRADpRn8orgMAAA==
X-Env-Sender: pengms1@lenovo.com
X-Msg-Ref: server-11.tower-326.messagelabs.com!1558604747!8549256!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20291 invoked from network); 23 May 2019 09:45:48 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
 by server-11.tower-326.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 May 2019 09:45:48 -0000
Received: from CNMAILCH01.lenovo.com (unknown [10.96.97.129])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 93D992BCDC55992FE732
 for <openbmc@lists.ozlabs.org>; Thu, 23 May 2019 05:45:46 -0400 (EDT)
Received: from CNMAILEX01.lenovo.com ([169.254.9.149]) by
 CNMAILCH01.lenovo.com ([::1]) with mapi id 14.03.0415.000; Thu, 23 May 2019
 17:45:44 +0800
From: Andrew MS1 Peng <pengms1@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: One question is for DIMM and CPU present sensor
Thread-Topic: One question is for DIMM and CPU present sensor
Thread-Index: AdURTEjVUUcZZ7qvRB+zE6dOCBhs4g==
Date: Thu, 23 May 2019 09:45:43 +0000
Message-ID: <264283F7338E734E863366C752FEABBC41CB047E@CNMAILEX01.lenovo.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.19.89]
Content-Type: multipart/alternative;
 boundary="_000_264283F7338E734E863366C752FEABBC41CB047ECNMAILEX01lenov_"
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
Cc: Duke KH Du <dukh@lenovo.com>, Harry Sung1 <hsung1@lenovo.com>,
 Yonghui YH21 Liu <liuyh21@lenovo.com>, Lisa YJ19 Liu <liuyj19@lenovo.com>,
 Derek Lin23 <dlin23@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_264283F7338E734E863366C752FEABBC41CB047ECNMAILEX01lenov_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

We expect to implement discrete sensors for DIMMs and CPU.  How to obtain a=
 DIMM and CPU present status from OpenBMC? Which package should we use?

Thanks.
Andrew Peng


--_000_264283F7338E734E863366C752FEABBC41CB047ECNMAILEX01lenov_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:\7B49\7EBF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@\7B49\7EBF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:\7B49\7EBF;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:\7B49\7EBF;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:\7B49\7EBF;
	color:#1F497D;}
span.EmailStyle20
	{mso-style-type:personal-compose;
	font-family:\7B49\7EBF;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:ZH-TW">Hi Team,<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:ZH-TW"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">We expect to implement discrete sens=
ors for DIMMs and CPU. &nbsp;How to obtain a DIMM and CPU present status fr=
om OpenBMC? Which package should we use?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Thanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Andrew Peng</span><span lang=3D"EN-U=
S" style=3D"font-size:12.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso=
-fareast-language:ZH-TW"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_264283F7338E734E863366C752FEABBC41CB047ECNMAILEX01lenov_--
