Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C33689A4A
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2019 11:46:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466WFd3vR3zDqQn
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2019 19:46:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.115; helo=mail1.bemta23.messagelabs.com;
 envelope-from=pengms1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466WBh4lVgzDqQj
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 19:43:54 +1000 (AEST)
Received: from [67.219.246.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-c.us-east-1.aws.symcld.net id E2/CA-11628-6D4315D5;
 Mon, 12 Aug 2019 09:43:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEKsWRWlGSWpSXmKPExsWSLveKTfeqSWC
 swZZmTYtTLS9YLPYe2MjiwOSxYFOpx/kZCxkDmKJYM/OS8isSWDOmLXnJVPDVuaL54zLWBsaV
 dl2MXBxCAv8ZJa4f/8LSxcgJ5LxklGi/pwuR2MMoMX3JT0aQBJuAlsTC/3uYuhg5OEQENCT+v
 8sECTMLWEps/niJHSQsLGArsWNNAkhYRMBJYkvzD0YIW0/i+4uHrCA2i4CqxJlVH8BW8QK1/l
 yynhnEZhSQlZj26D4TxEhxibnTZoHVSwgISCzZc54ZwhaVePn4H1RcQeLqvSVQ9QkS9490QM0
 UlDg58wnLBEahWUhGzUJSNgtJGURcR2LB7k9sELa2xLKFr5lh7DMHHjMhiy9gZF/FaJpUlJme
 UZKbmJmja2hgoGtoaKRrrmtiqJdYpZusV1qsm5pYXKIL5JYX6xVX5ibnpOjlpZZsYgRGVkoBu
 +YOxr2z3ugdYpTkYFIS5TWTCIwV4kvKT6nMSCzOiC8qzUktPsQow8GhJMF7xggoJ1iUmp5akZ
 aZA4xymLQEB4+SCO8GkDRvcUFibnFmOkTqFKM9x4SXcxcxcxw8Og9Ifly1BEh+B5FCLHn5eal
 S4rwuxkBtAiBtGaV5cENhSekSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHe6yDLeTLzSuB2
 vwI6iwnoLO4nviBnlSQipKQamA6qL1/XaL5hisXn5MPHJ4Rdbrmr9dG18dCbbDnTt89/9phWV
 za8vm9s3z15t/D1gB79It6olbovo1g9K8P55dy6LvN+KNCMPviRcWFs3l85jhKuuxKPss/87Z
 uWLNHF/sTN/di1gqTde+u3Ptl362q2v8HcV1vZ2jIrXedMXBu8RPDFzcKZfoecI9hijX5des/
 0Q2qRurr+E0Xnhg6u7m8Sx+9dOGw9d/KtRdeaoiZ+3hiZyjPtFc9F3nSNH//vm5WZfWmcdHbJ
 2gXphqqinhXcr1NnaconpHDkiGWe4NLp5H6+oJhhtZr1hH8s3n8SZzSfP7VtmcKuoqKs3wuet
 bQ9Uv5l1hNk1lQVZ7HNXomlOCPRUIu5qDgRAFE3LdHFAwAA
X-Env-Sender: pengms1@lenovo.com
X-Msg-Ref: server-27.tower-406.messagelabs.com!1565603026!410712!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4102 invoked from network); 12 Aug 2019 09:43:49 -0000
Received: from unknown (HELO apsmtp.lenovo.com) (103.30.234.6)
 by server-27.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Aug 2019 09:43:49 -0000
Received: from pekwpmail06.lenovo.com (unknown [10.96.93.84])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 7AC4CFE982F6C6DEC3BE;
 Mon, 12 Aug 2019 17:43:46 +0800 (CST)
Received: from pekwpmail05.lenovo.com (10.96.93.83) by pekwpmail06.lenovo.com
 (10.96.93.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 12 Aug
 2019 17:43:34 +0800
Received: from pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf]) by
 pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf%7]) with mapi id
 15.01.1591.008; Mon, 12 Aug 2019 17:43:34 +0800
From: Andrew MS1 Peng <pengms1@lenovo.com>
To: Patrick Venture <venture@google.com>
Subject: Clarify some questions about host tool (burn_my_bmc)
Thread-Topic: Clarify some questions about host tool (burn_my_bmc)
Thread-Index: AdVQ3W50GCnSA9PWRhaBmkYUGq9iDA==
Date: Mon, 12 Aug 2019 09:43:34 +0000
Message-ID: <8c0e07bacc89478996cca5f6718fe715@lenovo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.252]
Content-Type: multipart/alternative;
 boundary="_000_8c0e07bacc89478996cca5f6718fe715lenovocom_"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_8c0e07bacc89478996cca5f6718fe715lenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Patrick,


1.      It took about 4 minutes and 30 seconds for BIOS update with 64MB ro=
m image. Could we extension the pollstatus time from 100 sec to 300 sec to =
get the final status?

2.      If user can choose to preserve BMC configuration (rw area) or BIOS =
configuration when upgrade firmware, do you have any suggestions with regar=
ds to preserve configuration implementation or could the host tool support =
to send a parameter to support it?



Regards,

Andrew


--_000_8c0e07bacc89478996cca5f6718fe715lenovocom_
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"\7EAF\6587\672C \5B57\7B26";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.5pt;
	font-family:"Calibri",sans-serif;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	text-indent:21.0pt;
	font-size:10.5pt;
	font-family:DengXian;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.a
	{mso-style-name:"\7EAF\6587\672C \5B57\7B26";
	mso-style-priority:99;
	mso-style-link:\7EAF\6587\672C;
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal-compose;
	font-family:DengXian;
	color:windowtext;}
span.src
	{mso-style-name:src;}
span.apple-converted-space
	{mso-style-name:apple-converted-space;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1832257715;
	mso-list-type:hybrid;
	mso-list-template-ids:-1369123240 1418768858 67698713 67698715 67698703 67=
698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%2\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:42.0pt;
	text-indent:-21.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:63.0pt;
	text-indent:-21.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:84.0pt;
	text-indent:-21.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%5\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:105.0pt;
	text-indent:-21.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:126.0pt;
	text-indent:-21.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:147.0pt;
	text-indent:-21.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%8\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-21.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:189.0pt;
	text-indent:-21.0pt;}
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
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Hi Patrick,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;text-indent:-18.0=
pt;mso-list:l0 level1 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-fa=
mily:&quot;Calibri&quot;,sans-serif;mso-fareast-language:ZH-TW"><span style=
=3D"mso-list:Ignore">1.<span style=3D"font:7.0pt &quot;Times New Roman&quot=
;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"font-size:12.0=
pt;font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:ZH-TW">I=
t took about 4 minutes and 30 seconds for BIOS update with 64MB rom image. =
Could we extension the pollstatus time from 100
 sec to 300 sec to get the final status? <o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;text-indent:-18.0=
pt;mso-list:l0 level1 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-fa=
mily:&quot;Calibri&quot;,sans-serif;color:black;mso-fareast-language:ZH-TW"=
><span style=3D"mso-list:Ignore">2.<span style=3D"font:7.0pt &quot;Times Ne=
w Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"font-size:12.0=
pt;font-family:&quot;Calibri&quot;,sans-serif;color:black;mso-fareast-langu=
age:ZH-TW">If user can choose to
</span><span class=3D"src"><span lang=3D"EN-US" style=3D"font-size:12.0pt;f=
ont-family:&quot;Calibri&quot;,sans-serif;color:black;background:white">pre=
serve</span></span><span class=3D"apple-converted-space"><span lang=3D"EN-U=
S" style=3D"font-size:12.0pt;font-family:&quot;Calibri&quot;,sans-serif;col=
or:black;background:white">
</span></span><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-family:&q=
uot;Calibri&quot;,sans-serif;color:black;mso-fareast-language:ZH-TW">BMC co=
nfiguration (rw area) or BIOS configuration when upgrade firmware, do you h=
ave any suggestions with regards to
</span><span class=3D"src"><span lang=3D"EN-US" style=3D"font-size:12.0pt;f=
ont-family:&quot;Calibri&quot;,sans-serif;color:black;background:white">pre=
serve</span></span><span class=3D"apple-converted-space"><span lang=3D"EN-U=
S" style=3D"font-size:12.0pt;font-family:&quot;Calibri&quot;,sans-serif;col=
or:black;background:white">
</span></span><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-family:&q=
uot;Calibri&quot;,sans-serif;color:black;mso-fareast-language:ZH-TW">config=
uration implementation or co</span><span lang=3D"EN-US" style=3D"font-size:=
12.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:ZH-T=
W">uld
 the host tool support to send a parameter to support it?<span style=3D"col=
or:black"> &nbsp;&nbsp;<o:p></o:p></span></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><=
o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"font-size:12.0pt">R=
egards,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"font-size:12.0pt">A=
ndrew<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_8c0e07bacc89478996cca5f6718fe715lenovocom_--
