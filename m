Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1FA115846
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 21:45:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47V4Nh58S9zDqgl
	for <lists+openbmc@lfdr.de>; Sat,  7 Dec 2019 07:45:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.250.4;
 helo=mail1.bemta24.messagelabs.com; envelope-from=dukh@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47V4Mg3MpGzDqfC
 for <openbmc@lists.ozlabs.org>; Sat,  7 Dec 2019 07:44:40 +1100 (AEDT)
Received: from [67.219.250.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-a.us-west-2.aws.symcld.net id B1/85-19887-5BDBAED5;
 Fri, 06 Dec 2019 20:44:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRWlGSWpSXmKPExsWS8eIhr+7mva9
 iDS58F7I41fKCxYHR4/yMhYwBjFGsmXlJ+RUJrBnTf6xmKfiRUrGs6TVjA+OF2C5GLg4hgXlM
 Ei1v/rBCOC8YJWZ8vcEI4exhlJjf8Iyli5GTg01ASWLz0ztsILaIgKXEkgftYLawgK1E3701L
 BBxO4ltnd/YIWwjibN9rUwgNouAisTKrpnMIDYvUG/7rJNgNqOArMS0R/fBapgFxCVuPZkPZk
 sICEgs2XOeGcIWlXj5+B8rhK0gcfXeEqj6BIlTUxczQswUlDg58wnLBEbBWUhGzUJSNgtJGUR
 cR2LB7k9sELa2xLKFr5lh7DMHHjMhiy9gZF/FaJFUlJmeUZKbmJmja2hgoGtoaKRraGSpa2Ri
 qZdYpZuoV1qsW55aXKJrpJdYXqxXXJmbnJOil5dasokRGDspBY0/dzB2f3ird4hRkoNJSZT3S
 NSrWCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvJt3A+UEi1LTUyvSMnOAcQyTluDgURLhLd0DlO
 YtLkjMLc5Mh0idYrTnmPBy7iJmjoNH5wHJj6uWAMnvIFKIJS8/L1VKnFcbpE0ApC2jNA9uKCz
 tXGKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzHsP5DaezLwSuN2vgM5iAjorIh/srJJEhJRU
 A1Oocttu1hDfhw4rDs+1v97S4fFstX+p9ddbhZmbndcxbton+2ebbOEy49hkBu7DRXY3J2x3C
 f2+p39zlG/9pDXrtd9/+aVf8S3lr0C22Y+/8/J69gp+Pn/0x4spySGvBPRnq+o/4vwemR2m1B
 0WKRe6m/FkMm9rzomHa9/1ZYVcDPkbtKA0SEzzVuHrLfccf6dVm2z8KvPoQd/5E/W//14wePr
 ygV/nde/zkrLbGm3i1y255lOmvpY36f1T9dubkyZKFTv+OWy5zrRVYN6qyqmdk9cdMNdeH/xE
 oUz2FXvrK+m5RUbOuRVMRYvSTp/TiG4olGbU3nN4pb+bI78fN+OCsoZrjwTmflx6n6GQzViJp
 Tgj0VCLuag4EQBniQvTtgMAAA==
X-Env-Sender: dukh@lenovo.com
X-Msg-Ref: server-7.tower-326.messagelabs.com!1575665074!22216!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5231 invoked from network); 6 Dec 2019 20:44:35 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
 by server-7.tower-326.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Dec 2019 20:44:35 -0000
Received: from pekwpmail09.lenovo.com (unknown [10.96.81.78])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 6F97ED1FF65DEA56AA2A
 for <openbmc@lists.ozlabs.org>; Fri,  6 Dec 2019 15:44:33 -0500 (EST)
Received: from pekwpmail09.lenovo.com (10.96.81.78) by pekwpmail09.lenovo.com
 (10.96.81.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Sat, 7 Dec
 2019 04:44:30 +0800
Received: from pekwpmail09.lenovo.com ([fe80::9c63:2b89:95a0:34bb]) by
 pekwpmail09.lenovo.com ([fe80::9c63:2b89:95a0:34bb%11]) with mapi id
 15.01.1591.016; Sat, 7 Dec 2019 04:44:30 +0800
From: Duke KH Du <dukh@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Add member into Lenovo designated employees list
Thread-Topic: Add member into Lenovo designated employees list
Thread-Index: AdTuhggDxQgYQdvVTwKpLnXtmXb1JC97dgLw
Date: Fri, 6 Dec 2019 20:44:30 +0000
Message-ID: <0700dec94d76447faae7ab98c0c04516@lenovo.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.252]
Content-Type: multipart/alternative;
 boundary="_000_0700dec94d76447faae7ab98c0c04516lenovocom_"
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

--_000_0700dec94d76447faae7ab98c0c04516lenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Master,

I would like to add more members of Lenovo in the designated employee list =
as below in Red.
Could you help on that?

Schedule A
Initial list of designated employees. NB: authorization is not tied to part=
icular Contributions.
Please indicate "CLA Manager" next to the name of any employees listed belo=
w that are
authorized to add or remove designated employees from this list in the futu=
re.

CLA Manager:
Duke Du dukh@lenovo.com<mailto:dukh@lenovo.com>

Other designated employees:
Andrew Peng pengms1@lenovo.com<mailto:pengms1@lenovo.com>
Yonghui Liu liuyh21@lenovo.com<mailto:liuyh21@lenovo.com>
Lisa Liu liuyj19@lenovo.com<mailto:liuyj19@lenovo.com>

Payne Yang pyang4@lenovo.com<mailto:pyang4@lenovo.com>
Harry Sung hsung1@lenovo.com<mailto:hsung1@lenovo.com>
Ivan Li rli11@lenovo.com<mailto:rli11@lenovo.com>
Derek Lin dlin23@lenovo.com<mailto:dlin23@lenovo.com>

Thanks.
From: Duke KH Du
Sent: Monday, April 8, 2019 8:44 PM
To: openbmc@lists.ozlabs.org
Subject: Add member into Lenovo designated employees list

Hi master,

I would like to add our new member in Lenovo designated employees list as b=
elow in RED color.

Could you help on it?
Thanks.

Schedule A
Initial list of designated employees. NB: authorization is not tied to part=
icular Contributions.
Please indicate "CLA Manager" next to the name of any employees listed belo=
w that are
authorized to add or remove designated employees from this list in the futu=
re.

CLA Manager:
Duke Du dukh@lenovo.com<mailto:dukh@lenovo.com>

Other designated employees:
Andrew Peng pengms1@lenovo.com<mailto:pengms1@lenovo.com>

Yonghui Liu liuyh21@lenovo.com<mailto:liuyh21@lenovo.com>

Lisa Liu liuyj19@lenovo.com<mailto:liuyj19@lenovo.com>


--_000_0700dec94d76447faae7ab98c0c04516lenovocom_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:ArialMT;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hi Master,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I would like to add mo=
re members of Lenovo in the designated employee list as below in Red.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Could you help on that=
?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:ArialMT">Schedule A<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:ArialMT">Initial list of designated employees. NB: authorization is no=
t tied to particular Contributions.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:ArialMT">Please indicate
</span>&#8220;<span style=3D"font-family:ArialMT">CLA Manager</span>&#8221;=
<span style=3D"font-family:ArialMT"> next to the name of any employees list=
ed below that are<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:ArialMT">authorized to add or remove designated employees from this li=
st in the future.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:ArialMT"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.5pt;font-family:&quot;Arial&quot;,sans-serif">CLA Manager:<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.5pt;font-family:&quot;Arial&quot;,sans-serif">Duke Du
</span><a href=3D"mailto:dukh@lenovo.com"><span style=3D"font-size:10.5pt;f=
ont-family:&quot;Arial&quot;,sans-serif">dukh@lenovo.com</span></a><span st=
yle=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif"><o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.5pt;font-family:&quot;Arial&quot;,sans-serif"><o:p>&nbsp;</o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.5pt;font-family:&quot;Arial&quot;,sans-serif">Other designated employ=
ees:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.5pt;font-family:&quot;Arial&quot;,sans-serif">Andrew Peng
</span><a href=3D"mailto:pengms1@lenovo.com"><span style=3D"font-size:10.5p=
t;font-family:&quot;Arial&quot;,sans-serif">pengms1@lenovo.com</span></a><s=
pan style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif"><o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ar=
ial&quot;,sans-serif">Yonghui Liu
</span><a href=3D"mailto:liuyh21@lenovo.com"><span style=3D"font-size:10.5p=
t;font-family:&quot;Arial&quot;,sans-serif">liuyh21@lenovo.com</span></a><s=
pan style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif"><o:=
p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.5pt;font-family:&quot;Arial&quot;,sans-serif">Lisa Liu
</span><span class=3D"MsoHyperlink"><a href=3D"mailto:liuyj19@lenovo.com"><=
span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif">li=
uyj19@lenovo.com</span></a></span><span style=3D"font-size:10.5pt;font-fami=
ly:&quot;Arial&quot;,sans-serif"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:red">Payne Yang <a href=3D"mail=
to:pyang4@lenovo.com">
<span style=3D"color:red">pyang4@lenovo.com</span></a><o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:red">Harry Sung <a href=3D"mail=
to:hsung1@lenovo.com">
<span style=3D"color:red">hsung1@lenovo.com</span></a><o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:red">Ivan Li <a href=3D"mailto:=
rli11@lenovo.com">
<span style=3D"color:red">rli11@lenovo.com</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">Derek Lin <a href=3D"mailt=
o:dlin23@lenovo.com">
<span style=3D"color:red">dlin23@lenovo.com</span></a><o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Thanks.<o:p></o:p></sp=
an></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Duke KH Du <br>
<b>Sent:</b> Monday, April 8, 2019 8:44 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> Add member into Lenovo designated employees list<o:p></o:p>=
</p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi master,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I would like to add our new member in Lenovo designa=
ted employees list as below in
<span style=3D"color:red">RED </span>color.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Could you help on it?<o:p></o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:ArialMT">Schedule A<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:ArialMT">Initial list of designated employees. NB: authorization is no=
t tied to particular Contributions.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:ArialMT">Please indicate
</span>&#8220;<span style=3D"font-family:ArialMT">CLA Manager</span>&#8221;=
<span style=3D"font-family:ArialMT"> next to the name of any employees list=
ed below that are<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:ArialMT">authorized to add or remove designated employees from this li=
st in the future.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:ArialMT"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.5pt;font-family:&quot;Arial&quot;,sans-serif">CLA Manager:<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.5pt;font-family:&quot;Arial&quot;,sans-serif">Duke Du
</span><a href=3D"mailto:dukh@lenovo.com"><span style=3D"font-size:10.5pt;f=
ont-family:&quot;Arial&quot;,sans-serif">dukh@lenovo.com</span></a><span st=
yle=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif"><o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.5pt;font-family:&quot;Arial&quot;,sans-serif"><o:p>&nbsp;</o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.5pt;font-family:&quot;Arial&quot;,sans-serif">Other designated employ=
ees:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.5pt;font-family:&quot;Arial&quot;,sans-serif">Andrew Peng
</span><a href=3D"mailto:pengms1@lenovo.com"><span style=3D"font-size:10.5p=
t;font-family:&quot;Arial&quot;,sans-serif">pengms1@lenovo.com</span></a><s=
pan style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif"><o:=
p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.5pt;font-family:&quot;Arial&quot;,sans-serif"><o:p>&nbsp;</o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ar=
ial&quot;,sans-serif">Yonghui Liu
</span><a href=3D"mailto:liuyh21@lenovo.com"><span style=3D"font-size:10.5p=
t;font-family:&quot;Arial&quot;,sans-serif">liuyh21@lenovo.com</span></a><s=
pan style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif"><o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:red">Lisa Liu
</span><a href=3D"mailto:liuyj19@lenovo.com"><span style=3D"font-size:10.5p=
t;font-family:&quot;Arial&quot;,sans-serif;color:red">liuyj19@lenovo.com</s=
pan></a><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-=
serif;color:red"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_0700dec94d76447faae7ab98c0c04516lenovocom_--
