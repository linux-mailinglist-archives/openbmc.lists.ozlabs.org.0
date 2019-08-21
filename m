Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C28FDA4CDB
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 02:40:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MB7d6QnHzDqV2
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:40:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.212; helo=mail1.bemta23.messagelabs.com;
 envelope-from=dlin23@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D5GV1yW1zDqyh
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 21:36:32 +1000 (AEST)
Received: from [67.219.246.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.us-east-1.aws.symcld.net id F1/A0-05674-CBC2D5D5;
 Wed, 21 Aug 2019 11:36:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPJsWRWlGSWpSXmKPExsWS8eIhr+5undh
 YgwdzLS1OtbxgcWD0OD9jIWMAYxRrZl5SfkUCa8a01tnsBf9XMFVMXneBrYHx30ymLkYuDiGB
 +UwSGzdNY4RwXjNKNH6fxQLh7GeUOH/4P1AZBwebgKrE/WncXYycHCIC+hK7Ju1mA7GFBawkj
 ix/zgoRt5c4OOElE4StJ7GxtZ0dxGYBap2+6w4jiM0rYCmxtXUdWC+jgKzEkwXPwOqZBcQlzl
 1sBauXEBCReHjxNBuELSrx8vE/VghbQaJ5z2sWiPpqiQlv5jJBzBSUODnzCcsERsFZSEbNQlI
 2C0kZRDxB4vX3M8wQto7Egt2f2CBsbYllC18zw9hnDjxmwhTXkdh8aSfUHEWJts7ZQDVcQPZC
 Rok/t67CFb29O4kNpmhK90N2mPjStmlAcQ6weNedMojeRYwSLdfOMkPEdSTevZLGpnXDyi+sM
 PEVF/+xQvQuYZTY97IVbu/Znt0o9i5gFF/FaJZUlJmeUZKbmJmja2hgoGtoaKRrpGtobqSXWK
 WbpFdarJuaWFyia6iXWF6sV1yZm5yTopeXWrKJEZi6UgqY1uxgfDHzjd4hRkkOJiVR3jMqsbF
 CfEn5KZUZicUZ8UWlOanFhxhlODiUJHijtIFygkWp6akVaZk5wDQKk5bg4FES4f2uBZTmLS5I
 zC3OTIdInWL05pjwcu4iZo6DR+cByXc/FwPJ26uWAMmPYPI7iBRiycvPS5US510FskEAZERGa
 R7cAlg+uMQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmLcH5BCezLwSuDteAZ3IBHTi7sORIC
 eWJCKkpBqYRONN+rNC5Q2Xs3g+bZdy5y3wvznNtXiVuE5kZtbJANdSyaMSnp/M9ryfHnr61tp
 ztyNe6Tv9ebVnvfYlsXNP3uh9fWLr+cI6IdhNZcKRXb9qQ46vdviw5kbwllccxtWcSl83B096
 9F096Y0B/8stOnN2Zz2xPLKoKjRJPGfazevqzkclef68uaLz6G/s3Pc3yrTP/81p6LdXCfK1r
 /I6/WP9aYfHXW94OhynnaxXr85on84ZyeEiwad3/v+GCwuPvEj6dnY7v5v8nkfTXlxXyooLye
 v21ciUFNVpfqJ+cGULsxf7xJjCR1P/f9m752th1Y8C80dHzC4Vvz546JrR6uVNvCk8p7cw3H1
 SvsmgQomlOCPRUIu5qDgRAIrgMC+CBAAA
X-Env-Sender: dlin23@lenovo.com
X-Msg-Ref: server-6.tower-386.messagelabs.com!1566387387!893094!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4818 invoked from network); 21 Aug 2019 11:36:27 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
 by server-6.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Aug 2019 11:36:27 -0000
Received: from HKGWPEMAIL02.lenovo.com (unknown [10.128.3.70])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 3E342D3CE77FFF66B428
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 07:36:24 -0400 (EDT)
Received: from HKGWPEMAIL02.lenovo.com (10.128.3.70) by
 HKGWPEMAIL02.lenovo.com (10.128.3.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Wed, 21 Aug 2019 19:36:22 +0800
Received: from HKGWPEMAIL02.lenovo.com ([fe80::7020:5ebb:e3eb:29ba]) by
 HKGWPEMAIL02.lenovo.com ([fe80::7020:5ebb:e3eb:29ba%12]) with mapi id
 15.01.1591.008; Wed, 21 Aug 2019 19:36:22 +0800
From: Derek Lin23 <dlin23@lenovo.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Question of pid-contorl on stepwise configuration
Thread-Topic: Question of pid-contorl on stepwise configuration
Thread-Index: AdVYEwfTdJzfRGV8SbenXntHIc/+Pw==
Date: Wed, 21 Aug 2019 11:36:22 +0000
Message-ID: <a495e5b8d85441bbaefdba85979e333e@lenovo.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: multipart/related;
 boundary="_006_a495e5b8d85441bbaefdba85979e333elenovocom_";
 type="multipart/alternative"
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:51 +1000
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

--_006_a495e5b8d85441bbaefdba85979e333elenovocom_
Content-Type: multipart/alternative;
	boundary="_000_a495e5b8d85441bbaefdba85979e333elenovocom_"

--_000_a495e5b8d85441bbaefdba85979e333elenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi team:

          I have a question regarding stepwise configuration on pid-control=
.
          I have mine setup like below.

                                       {
                    "name": "Ambient_Temp",
                    "type": "stepwise",
                    "setpoint": 0.0,
                    "inputs": ["Ambient_Temp"],
                    "pid": {
                        "samplePeriod": 1.0,
                        "positiveHysteresis": 0.0,
                        "negativeHysteresis": 0.0,
                        "isCeiling": false,
                        "reading": {
                            "0": 25,
                            "1": 30,
                            "2": 35
                        },
                        "output": {
                            "0": 15,
                            "1": 15,
                            "2": 15
                       }
                    }
                }

          And, I would like to know the meaning of each field, as far as I =
understand from phosphor-pid-control, "setpoint" seems not used if PID type=
 is stepwise. Is that true? The "reading" field indicates the temperature r=
eading from the sensor "Ambient". The "output" field should indicate the du=
ty % corresponding to the fans, or should output be RPMs? That gives me whe=
n a reading of 25 degree(whatever the unit is), the output duty of fans sho=
uld set to 15%, or set to corresponding RPMs.
Do I understand the fields correctly?

Thank you,
________________________________

Derek Lin
Sr. BMC Engineer
8F,66, San Chong Rd., Nankang Software Park, Taipei.
Lenovo Taiwan

[Phone]+886281707411
[Email]dlin23@lenovo.com<mailto:dlin23@lenovo.com>



Lenovo.com<http://www.lenovo.com/>
Twitter<http://twitter.com/lenovo> | Instagram<https://instagram.com/lenovo=
> | Facebook<http://www.facebook.com/lenovo> | Linkedin<http://www.linkedin=
.com/company/lenovo> | YouTube<http://www.youtube.com/lenovovision> | Priva=
cy<https://www.lenovo.com/gb/en/privacy-selector/>


[ImageLogo-DCG-Honeycomb]





--_000_a495e5b8d85441bbaefdba85979e333elenovocom_
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
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
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
nbsp;&nbsp;&nbsp;&nbsp; I have a question regarding stepwise configuration =
on pid-control.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; I have mine setup like below. <o:p>
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; &quot;name&quot;: &quot;Ambient_Temp&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; &quot;type&quot;: &quot;stepwise&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; &quot;setpoint&quot;: 0.0,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; &quot;inputs&quot;: [&quot;Ambient_Temp&quot;],<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; &quot;pid&quot;: {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;samplePeriod&quot;: 1.0,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;positiveHysteresis&quot;: 0.0,<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;negativeHysteresis&quot;: 0.0,<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;isCeiling&quot;: false,<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;reading&quot;: {<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0&quot;: 25,=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;1&quot;: 30,=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;2&quot;: 35<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;output&quot;: {<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0&quot;: 15,=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;1&quot;: 15,=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;2&quot;: 15<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; And, I would like to know the meaning of each field=
, as far as I understand from phosphor-pid-control, &#8220;setpoint&#8221; =
seems not used if PID type is stepwise. Is that true? The &#8220;reading&#8=
221; field indicates the temperature
 reading from the sensor &#8220;Ambient&#8221;. The &#8220;output&#8221; fi=
eld should indicate the duty % corresponding to the fans, or should output =
be RPMs? That gives me when a reading of 25 degree(whatever the unit is), t=
he output duty of fans should set to 15%, or set to corresponding
 RPMs. <o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:24.0pt"><span lang=3D"EN-US">Do=
 I understand the fields correctly?<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:24.0pt"><span lang=3D"EN-US"><o=
:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you,<o:p></o:p></span></p=
>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0">
<tbody>
<tr>
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm">
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span=
 lang=3D"EN-US" style=3D"font-family:&quot;&#26032;&#32048;&#26126;&#39636;=
&quot;,serif">
<hr size=3D"2" width=3D"100%" align=3D"center">
</span></div>
</td>
</tr>
<tr>
<td valign=3D"top" style=3D"padding:0cm 0cm 0cm 0cm">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0">
<tbody>
<tr>
<td width=3D"108" valign=3D"top" style=3D"width:154.5pt;padding:0cm 0cm 0cm=
 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.0pt;fo=
nt-family:&quot;Arial&quot;,sans-serif;color:#404040">Derek Lin</span></b><=
span lang=3D"EN-US" style=3D"font-family:&quot;&#26032;&#32048;&#26126;&#39=
636;&quot;,serif"><br>
</span><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-family:&quot;Aria=
l&quot;,sans-serif;color:#404040">Sr. BMC Engineer</span><span lang=3D"EN-U=
S" style=3D"font-family:&quot;&#26032;&#32048;&#26126;&#39636;&quot;,serif"=
><br>
</span><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-family:&quot;Aria=
l&quot;,sans-serif;color:#404040">8F,66, San Chong Rd., Nankang Software Pa=
rk, Taipei.&nbsp;</span><span lang=3D"EN-US" style=3D"font-family:&quot;&#2=
6032;&#32048;&#26126;&#39636;&quot;,serif"><br>
</span><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-family:&quot;Aria=
l&quot;,sans-serif;color:#404040">Lenovo Taiwan</span><span lang=3D"EN-US" =
style=3D"font-family:&quot;&#26032;&#32048;&#26126;&#39636;&quot;,serif"><o=
:p></o:p></span></p>
</td>
<td width=3D"152" valign=3D"top" style=3D"width:163.5pt;padding:0cm 0cm 0cm=
 0cm">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;&#26=
032;&#32048;&#26126;&#39636;&quot;,serif"><img width=3D"23" height=3D"9" st=
yle=3D"width:.243in;height:.0902in" id=3D"_x5716__x7247__x0020_2" src=3D"ci=
d:image001.gif@01D55857.16025BB0" alt=3D"Phone"></span><span lang=3D"EN-US"=
 style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#4=
04040">&#43;886281707411</span><span lang=3D"EN-US" style=3D"font-family:&q=
uot;&#26032;&#32048;&#26126;&#39636;&quot;,serif"><br>
<a href=3D"mailto:dlin23@lenovo.com"><span style=3D"color:blue;text-decorat=
ion:none"><img border=3D"0" width=3D"23" height=3D"9" style=3D"width:.243in=
;height:.0902in" id=3D"_x5716__x7247__x0020_3" src=3D"cid:image002.gif@01D5=
5857.16025BB0" alt=3D"Email"></span><span style=3D"font-size:9.0pt;font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#404040;text-decoration:none">dlin23=
@lenovo.com</span></a><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;&#26=
032;&#32048;&#26126;&#39636;&quot;,serif">&nbsp;<o:p></o:p></span></p>
</td>
<td style=3D"padding:0cm 0cm 0cm 0cm"></td>
</tr>
<tr>
<td colspan=3D"2" valign=3D"top" style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;&#26=
032;&#32048;&#26126;&#39636;&quot;,serif"><a href=3D"http://www.lenovo.com/=
"><span style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;c=
olor:#404040">Lenovo.com</span></a>&nbsp;<br>
<a href=3D"http://twitter.com/lenovo"><span style=3D"font-size:8.0pt;font-f=
amily:&quot;Arial&quot;,sans-serif;color:#404040">Twitter</span></a>&nbsp;|=
&nbsp;<a href=3D"https://instagram.com/lenovo"><span style=3D"font-size:8.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:#404040">Instagram</span>=
</a>&nbsp;|&nbsp;<a href=3D"http://www.facebook.com/lenovo"><span style=3D"=
font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#404040">Fac=
ebook</span></a>&nbsp;|&nbsp;<a href=3D"http://www.linkedin.com/company/len=
ovo"><span style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-seri=
f;color:#404040">Linkedin</span></a>&nbsp;|&nbsp;<a href=3D"http://www.yout=
ube.com/lenovovision"><span style=3D"font-size:8.0pt;font-family:&quot;Aria=
l&quot;,sans-serif;color:#404040">YouTube</span></a>&nbsp;|&nbsp;<a href=3D=
"https://www.lenovo.com/gb/en/privacy-selector/"><span style=3D"font-size:8=
.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#404040">Privacy</span>=
</a>&nbsp;<o:p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
</td>
<td width=3D"324" valign=3D"top" style=3D"width:243.0pt;padding:0cm 0cm 0cm=
 0cm">
<div align=3D"right">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0">
<tbody>
<tr>
<td valign=3D"top" style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;&#26=
032;&#32048;&#26126;&#39636;&quot;,serif"><img border=3D"0" width=3D"324" h=
eight=3D"164" style=3D"width:3.375in;height:1.7083in" id=3D"Picture_x0020_1=
" src=3D"cid:image003.gif@01D55857.16025BB0" alt=3D"ImageLogo-DCG-Honeycomb=
"><o:p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
</div>
</td>
<td style=3D"padding:0cm 0cm 0cm 0cm"></td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_a495e5b8d85441bbaefdba85979e333elenovocom_--

--_006_a495e5b8d85441bbaefdba85979e333elenovocom_
Content-Type: image/gif; name="image001.gif"
Content-Description: image001.gif
Content-Disposition: inline; filename="image001.gif"; size=92;
	creation-date="Wed, 21 Aug 2019 11:36:22 GMT";
	modification-date="Wed, 21 Aug 2019 11:36:22 GMT"
Content-ID: <image001.gif@01D55857.16025BB0>
Content-Transfer-Encoding: base64

R0lGODlhFwAJAKIAAGZmZkRERLu7u4iIiAAAAP///wAAAAAAACH5BAEAAAUALAAAAAAXAAkAAAMh
WDrcrDDKQqqtM68BaniaJlRDaI5EaYrkyqZuhqpxNNcJADs=

--_006_a495e5b8d85441bbaefdba85979e333elenovocom_
Content-Type: image/gif; name="image002.gif"
Content-Description: image002.gif
Content-Disposition: inline; filename="image002.gif"; size=128;
	creation-date="Wed, 21 Aug 2019 11:36:22 GMT";
	modification-date="Wed, 21 Aug 2019 11:36:22 GMT"
Content-ID: <image002.gif@01D55857.16025BB0>
Content-Transfer-Encoding: base64

R0lGODlhFwAJALMAAN3d3WZmZpmZmczMzERERLu7u4iIiAAAAP///wAAAAAAAAAAAAAAAAAAAAAA
AAAAACH5BAEAAAgALAAAAAAXAAkAAAQtEMliqhUy643M+SDBjZJ3GEU6kKMZWAXLmeApbyaaArdm
xr1Z7SMKdoaHoiwCADs=

--_006_a495e5b8d85441bbaefdba85979e333elenovocom_
Content-Type: image/gif; name="image003.gif"
Content-Description: image003.gif
Content-Disposition: inline; filename="image003.gif"; size=14774;
	creation-date="Wed, 21 Aug 2019 11:36:22 GMT";
	modification-date="Wed, 21 Aug 2019 11:36:22 GMT"
Content-ID: <image003.gif@01D55857.16025BB0>
Content-Transfer-Encoding: base64

R0lGODlhRAGkAPcAAENERTEyNC0uMPHx8QkKDFRVVhkaHA0OEO3t7icoKpGRkjs8Pubm5iIkJVBR
Uj9AQTc4OlFSU9HR0pSWlv39/eDg4ZmamwUGCDo8PWJjZB8gIi4wMunp6fj4+Dk6PFJUVZ2enyss
LtnZ2T0+QNXV1rGxskFCRAwMD6mpqsnJyjg5O7W1tlhZWjM0Nrm5ut7e3jo6PCQlJs3NzkxOTxob
HkhKS/r6+iQmKA8QEggJCygpKigqLCAhIkZISaWlpvT09DU2OL29vjQ1N6ytrUlKS1xdXkpMTU9Q
UcbGxxweIAYHCBcYGywtL8LCwg4PERMUFqKio3l5ehQUFzAxMx4eIk5QUYiIiiAiJBESFISFhigo
K/b291VWV1FSUhwcICYmKiAgJCMkJzw9PxYYGRYWGYGBghARFBsdH4WGiDY3OUBCQkdISRUWGE1O
T4KDhGhpa3V1dgcICWxsbgoLDZOUlUVGSJqbnFZXWCorLBASE3p6fD4/QiIjJiIjJG5vcHFxcnJz
dCYnKBYXGDo8PKqqqzY3OX19fzQ1OBISFo2NjlpbXGVmaDg5PJ6foBQVF2pqbHZ2eFlaW46OkIuL
jB4fIJeYmWdoaZaWl6enqLe3uE5OT6ioqXN0dJycnZKTk2BhYp+goVBQUYeHiExMTV5eYEBBREJD
RkBBQz4/QU5PUEpLTExNTkJDRUhISktMTUZHSERFR0hJSkpLTUZHSUxNT0ZGSEVGR0NDRURFRkpK
TEtLTU1NT0lJS0hJS0JDRD4+QE5PUUVFRyorLkBBQkFBQzo7PU9PUUxMTkdHSVJSUz4/QE5OUP7+
/j9AQkNERgQHCEhISUlJSiEiJRscH09PUEpKSzU3OT8/QYOEhUJCRN/f4EtLTM/P0K6vr9fX2LKz
s3+Agbi4uUJDQ7u7u01NTkdHSMPDxKurrDk7PEhJTO/v8LS0tdPT001NUL+/wNvb3H9/gfv7+0BA
QcvLy+Pj5CUmKd/g4Hh4eikrLU5OUaOkpL/AwB0eIfPz85CQkf///yH/C1hNUCBEYXRhWE1QPD94
cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1w
bWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42
LWMxNDIgNzkuMTYwOTI0LCAyMDE3LzA3LzEzLTAxOjA2OjM5ICAgICAgICAiPiA8cmRmOlJERiB4
bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8
cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2Jl
LmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEu
MC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAv
MS4wLyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjIzNzBCOTQ4Q0Y0MzExRTQ4
N0VGRTlBMkE3QTA1OTQ4IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MkY1OERGMzExNTEx
RThBMDBEQjM0OTRDQTRCMzhEIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MkY1OERFMzEx
NTExRThBMDBEQjM0OTRDQTRCMzhEIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBD
QyAoV2luZG93cykiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlp
ZDo4YjRhOTEwNy0zMzJkLWZjNDctYjMwZS00NmI3MzJiOTdiZjciIHN0UmVmOmRvY3VtZW50SUQ9
ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDo5MjA0N2U1OC1mNTBhLWRmNDUtOWMwYy0yMDY0Y2JmODE3
YjgiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tl
dCBlbmQ9InIiPz4B//79/Pv6+fj39vX08/Lx8O/u7ezr6uno5+bl5OPi4eDf3t3c29rZ2NfW1dTT
0tHQz87NzMvKycjHxsXEw8LBwL++vby7urm4t7a1tLOysbCvrq2sq6qpqKempaSjoqGgn56dnJua
mZiXlpWUk5KRkI+OjYyLiomIh4aFhIOCgYB/fn18e3p5eHd2dXRzcnFwb25tbGtqaWhnZmVkY2Jh
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
4y3vedMbxwEBADs=

--_006_a495e5b8d85441bbaefdba85979e333elenovocom_--
