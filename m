Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E54AC8188E
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 13:57:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462GV24JTVzDqs2
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 21:57:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.250.209; helo=mail1.bemta24.messagelabs.com;
 envelope-from=pengms1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462GTL2FzYzDqRp
 for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2019 21:56:52 +1000 (AEST)
Received: from [67.219.251.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-c.us-west-2.aws.symcld.net id 1D/A3-30481-089184D5;
 Mon, 05 Aug 2019 11:56:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRWlGSWpSXmKPExsWSLveKXbde0iP
 W4PorLYtTLS9YLPYe2MjiwOSxYFOpx/kZCxkDmKJYM/OS8isSWDM6+hezFHxQrVj7bS9zA+NO
 pS5GLg4hgf+MErv3/2KCcF4wSjzqes8C4exmlPgzfQNzFyMnB5uAlsTC/3uAqjg4RAQ0JP6/y
 wSpYRZYwigxd9IWNpAaYQF3iYubT4DZIgI+EudnLGOBsPUkpjVsAZvDIqAisWrmKVYQm1fAUu
 L4lrdgcUYBWYlpj+4zgdjMAuISc6fNAquREBCQWLLnPDOELSrx8vE/qLiCRPulZlaI+gSJf59
 62CBmCkqcnPmEZQKj0Cwko2YhKZuFpAwiriOxYPcnNghbW2LZwtfMMPaZA4+ZkMUXMLKvYrRI
 KspMzyjJTczM0TU0MNA1NDTSNTQ21zUyMdRLrNJN1ist1i1PLS7RNdJLLC/WK67MTc5J0ctLL
 dnECIyylILOjzsYm2a90TvEKMnBpCTK+3+1a6wQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6r4h
 6xQoJFqempFWmZOcCIh0lLcPAoifAmSgCleYsLEnOLM9MhUqcY7TkmvJy7iJnj4NF5QPLjqiV
 A8juIFGLJy89LlRLn3QsyVQCkLaM0D24oLEFdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM
 Ow9kCk9mXgnc7ldAZzEBnbX9pyvIWSWJCCmpBiY7VrPLrReFNFR4e1++a37zMr/ORu/qad/nw
 bMWt69+svzy/nivq0u63Eu3z/u4aEPS8ZibPyznff6bu7lj8Y1d/P+NfSdl1/pKCa5+othYr7
 iCq4JV7/dRiQmb8oSC/z00Vguau2//+5XsrBNlzScZbaoO+jBx34qnH9nFFoqKOXV2fxCUmtb
 z5NCUaR4/8mS9bpsU2x7kyE55OTlDzLo7dcXkY7Wb27tWLzd/f6tR+fwOhdBb155vKbj1W/Pe
 Gv1rLGV/uNZc8jf0X2u8YE7a2v2zk1UnJVWdPLm65V4Nv8KBWL/9/ge+nEtrNyqxKbwzZ+XM5
 9obFJ4wnM6w8OxnPMxnujSy74hOT2Lnbo6fSizFGYmGWsxFxYkABUyob8sDAAA=
X-Env-Sender: pengms1@lenovo.com
X-Msg-Ref: server-8.tower-366.messagelabs.com!1565006204!392869!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16090 invoked from network); 5 Aug 2019 11:56:46 -0000
Received: from unknown (HELO apsmtp.lenovo.com) (103.30.234.7)
 by server-8.tower-366.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Aug 2019 11:56:46 -0000
Received: from pekwpmail06.lenovo.com (unknown [10.96.93.84])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id DC4F929B7DB7C760BBEF;
 Mon,  5 Aug 2019 19:56:43 +0800 (CST)
Received: from pekwpmail05.lenovo.com (10.96.93.83) by pekwpmail06.lenovo.com
 (10.96.93.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 5 Aug
 2019 19:56:43 +0800
Received: from pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf]) by
 pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf%7]) with mapi id
 15.01.1591.008; Mon, 5 Aug 2019 19:56:42 +0800
From: Andrew MS1 Peng <pengms1@lenovo.com>
To: Patrick Venture <venture@google.com>
Subject: Clarify some questions about BIOS update (phosphor-ipmi-flash)
Thread-Topic: Clarify some questions about BIOS update (phosphor-ipmi-flash)
Thread-Index: AdVLg2vX/wUFPXlKRwewZJrmgI2ZEg==
Date: Mon, 5 Aug 2019 11:56:42 +0000
Message-ID: <95784a9aed5d4f269fdf95684500d48e@lenovo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.253]
Content-Type: multipart/alternative;
 boundary="_000_95784a9aed5d4f269fdf95684500d48elenovocom_"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Yonghui YH21 Liu <liuyh21@lenovo.com>, Lisa YJ19 Liu <liuyj19@lenovo.com>,
 Duke KH Du <dukh@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_95784a9aed5d4f269fdf95684500d48elenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

I have some questions about BIOS update via phosphor-ipmi-flash with L2A, p=
lease help to clarify. Thanks.

1. How can I update the status (success or failure) after upgrade BIOS firm=
ware? Currently, the update status only appear "running".
2. It was failed when triggered "phosphor-ipmi-flash-bios-update.target" si=
nce the job-mode is null string. It can work well when I add string "replac=
e" to job-mode. How can I config (json file or configure parameter) to supp=
ort it?

Regards,
Andrew

--_000_95784a9aed5d4f269fdf95684500d48elenovocom_
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
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:DengXian;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:DengXian;}
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
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:ZH-TW">Hi
</span><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-family:&quot;Cal=
ibri&quot;,sans-serif;color:black">Patrick,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:black">I have some questions ab=
out BIOS update via phosphor-ipmi-flash with L2A, please help to clarify. T=
hanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:black">1. How can I update the =
status (success or failure) after upgrade BIOS firmware? Currently, the upd=
ate status only appear &quot;running&quot;.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:black">2. It was failed when tr=
iggered &quot;phosphor-ipmi-flash-bios-update.target&quot; since the job-mo=
de is null string. It can work well when I add string &quot;replace&quot;
 to job-mode. How can I config (json file or configure parameter) to suppor=
t it?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:black">Regards,<br>
Andrew</span><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;mso-fareast-language:ZH-TW"><o:p></o:p></span><=
/p>
</div>
</body>
</html>

--_000_95784a9aed5d4f269fdf95684500d48elenovocom_--
