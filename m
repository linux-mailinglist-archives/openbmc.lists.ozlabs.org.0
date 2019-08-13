Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9A28AD20
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 05:22:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466ygr4QdczDqf3
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 13:22:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.214; helo=mail1.bemta23.messagelabs.com;
 envelope-from=liuyh21@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466yg955QfzDqVD
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 13:21:39 +1000 (AEST)
Received: from [67.219.246.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-c.us-east-1.aws.symcld.net id 98/B8-15579-1CC225D5;
 Tue, 13 Aug 2019 03:21:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRWlGSWpSXmKPExsWS8eIhr+5BnaB
 Yg6tbmSxOtbxgcWD0OD9jIWMAYxRrZl5SfkUCa8avRb2sBbvUKqaum8nUwPhHqYuRi0NIYB6T
 xIzuV0xdjJxAzktGiZNzTCESexglzv85ztjFyMHBJqAtMX1/KkiNiIC+xK5Ju9lAbGEBdYklr
 +eyQ8R1JO49esYIYetJTLu2nh2klUVAVWLCbBaQMK+ApcTsm8fAShgFZCWmPboPtpZZQFxi7r
 RZrCC2hICAxJI955khbFGJl4//QcUVJK7eWwJVnyDxecobNoiZghInZz5hmcAoOAvJqFlIymY
 hKYOI60gs2P2JDcLWlli28DUzjH3mwGMmZPEFjOyrGE2TijLTM0pyEzNzdA0NDHQNDY10zXVN
 DPUSq3ST9UqLdVMTi0t0gdzyYr3iytzknBS9vNSSTYzAeEkpYNfcwbh31hu9Q4ySHExKorzTz
 wTGCvEl5adUZiQWZ8QXleakFh9ilOHgUJLgPaUVFCskWJSanlqRlpkDjF2YtAQHj5II7wdtoD
 RvcUFibnFmOkTqFKM9x4SXcxcxcxw8Og9Ifly1BEh+B5FCLHn5ealS4rwTQNoEQNoySvPghsJ
 SzSVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrwVIFN4MvNK4Ha/AjqLCeisNzcCQc4qSURI
 STUwXShb/uXR3cP8vGl2f7VnZ6R6levc6zIrfMLKbPBv9YLIjPdJSyua+rSkVa7eSboU0Fay+
 lqCg0SI8uupggZmj/cs7PhsvisigaXm5bTQMy/Ksuf23nDa/3oqywmFudOPuHMUX1koUyHutr
 O7JMbIV/BIsp6MRa/kBSEdkfg/rxX1V8x5Z+TPcuqg6uvVXwJ2Fb22kcp1SZ3GZOsosuTInk1
 7JHx+vPG9KFB16p7hpN/iwnIx38x6MmarKbnK9+7W9T7rLmF5aFZDyCHG3TfPKdx9u2qV+IMX
 qxmblvedrxfIy5I4JT8zc3XLC/GPRhuX1KydUNB1ylmKdWHJZ5dbHQHfAjUZH/mcLt5a6RCjx
 FKckWioxVxUnAgAx4w2u7ADAAA=
X-Env-Sender: liuyh21@lenovo.com
X-Msg-Ref: server-7.tower-406.messagelabs.com!1565666496!493662!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1521 invoked from network); 13 Aug 2019 03:21:37 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
 by server-7.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Aug 2019 03:21:37 -0000
Received: from pekwpmail01.lenovo.com (unknown [10.96.93.79])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 60D1E76CACE2557E1C49
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 23:21:36 -0400 (EDT)
Received: from pekwpmail05.lenovo.com (10.96.93.83) by pekwpmail01.lenovo.com
 (10.96.93.79) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 13 Aug
 2019 11:21:35 +0800
Received: from pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf]) by
 pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf%7]) with mapi id
 15.01.1591.008; Tue, 13 Aug 2019 11:21:35 +0800
From: Yonghui YH21 Liu <liuyh21@lenovo.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: OpenBMC Solution To CVE issues
Thread-Topic: OpenBMC Solution To CVE issues
Thread-Index: AdVRhjRXBrr7myuGQpyDSHRHGn3ZNw==
Date: Tue, 13 Aug 2019 03:21:35 +0000
Message-ID: <d739c79fc78643c8aa6da29522290874@lenovo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.252]
Content-Type: multipart/alternative;
 boundary="_000_d739c79fc78643c8aa6da29522290874lenovocom_"
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

--_000_d739c79fc78643c8aa6da29522290874lenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

HI All,
         I saw there are some solutions to public CVE issues, some solution=
 are not enable by default setting.
         As we know, there are some new coming CVE issues. Could you help c=
onfirm whether below issues will be fixed? Is yes, when will be ready?

         CVE-2019-12900
CVE-2018-20843
CVE-2019-9169
CVE-2018-20750
CVE-2019-13404


Thank your great support in advance!

Thanks


--_000_d739c79fc78643c8aa6da29522290874lenovocom_
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
	{font-family:\5B8B\4F53;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
	{font-family:"\@\5B8B\4F53";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
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
<body lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple" style=3D"text-justify-t=
rim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">HI All,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; I saw there are some solutions to public CVE issues, some=
 solution are not enable by default setting.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; As we know, there are some new coming CVE issues. Could y=
ou help confirm whether below issues will be fixed? Is yes, when will be re=
ady?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; CVE-2019-12900<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">CV=
E-2018-20843<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">CV=
E-2019-9169<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">CV=
E-2018-20750<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">CV=
E-2019-13404<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:11.0pt;font-family:&#31561;&#32447;;color:black"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:11.0pt;font-family:&#31561;&#32447;;color:black"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:11.0pt;font-family:&#31561;&#32447;;color:black">Thank you=
r great support in advance!<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:11.0pt;font-family:&#31561;&#32447;;color:black"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:11.0pt;font-family:&#31561;&#32447;;color:black">Thanks<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_d739c79fc78643c8aa6da29522290874lenovocom_--
