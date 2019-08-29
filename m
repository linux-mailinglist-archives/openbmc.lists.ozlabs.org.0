Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A2FA152C
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 11:51:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JyYr6QcwzDrRR
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 19:51:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.26.146; helo=unicom146.biz-email.net;
 envelope-from=maxiaochao@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
X-Greylist: delayed 146 seconds by postgrey-1.36 at bilbo;
 Thu, 29 Aug 2019 19:51:00 AEST
Received: from unicom146.biz-email.net (unicom146.biz-email.net
 [210.51.26.146])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JyY03PlSzDrQp
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 19:50:59 +1000 (AEST)
Received: from ([60.208.111.195])
 by unicom146.biz-email.net (Antispam) with ASMTP (SSL) id URY98252
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 17:47:52 +0800
Received: from jtjnmail201604.home.langchao.com (10.100.2.4) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Thu, 29 Aug 2019 17:47:51 +0800
Received: from jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322])
 by jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322%5])
 with mapi id 15.01.1591.008; Thu, 29 Aug 2019 17:47:51 +0800
From: =?gb2312?B?WGlhb2NoYW8gTWEgKMLt0KGzrCk=?= <maxiaochao@inspur.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Document about the REST interface
Thread-Topic: Document about the REST interface
Thread-Index: AdVeTJWAlsznUEIhR32E4UsOt8uBRA==
Date: Thu, 29 Aug 2019 09:47:50 +0000
Message-ID: <bcf71058f3494169b90ee051e0079bb6@inspur.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.1.52]
Content-Type: multipart/alternative;
 boundary="_000_bcf71058f3494169b90ee051e0079bb6inspurcom_"
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

--_000_bcf71058f3494169b90ee051e0079bb6inspurcom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SSB3cm90ZSBhIGRvY3VtZW50IGFib3V0IHRoZSBSRVNUIGludGVyZmFjZSAoY29udGFpbnMgdGhl
IFJFREZJU0ggc2VjdGlvbiApLg0KSXQgY29udGFpbnMgYWxsIHRoZSBjb21tYW5kcyBpbiBSRVNU
LWNoZWF0c2hlZXQubWQgLCBSRURGSVNILWNoZWF0c2hlZXQubWQgYW5kIGEgUkVTVCByZWxhdGVk
IGRvY3VtZW50Lg0KVGhpcyBkb2N1bWVudCBpbmNsdWRlcyBwb3dlciwgRlcgdXBkYXRlLCB0aW1l
IHNldHRpbmdzLCBldmVudCBsb2cgYW5kIHJlbGF0ZWQgY29tbWFuZHMuDQpBbGwgY29tbWFuZHMg
aGF2ZSBiZWVuIHJ1biBvbiB0aGUgZnA1MjgwZzIgbWFjaGluZS4NCkkgd2FudCB0byB1cGxvYWQg
dGhpcyBkb2N1bWVudCB0byBvcGVuYm1jL2RvY3MgYmVjYXVzZSBJIHRoaW5rIHRoaXMgZG9jdW1l
bnQgaXMgZ29vZCBmb3IgdGhlIGNvbW11bml0eS4NCkNhbiB0aGlzIGRvY3VtZW50IGJlIGFjY2Vw
dGVkPw0KSGVyZSBpcyB0aGUgbGluazoNCmh0dHBzOi8vZ2l0aHViLmNvbS9pbnNwdXItYm1jL29w
ZW5ibWMtZG9jL2Jsb2IvbWFzdGVyL3VzZXIncyUyMGd1aWRlLm1kDQoNCg==

--_000_bcf71058f3494169b90ee051e0079bb6inspurcom_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
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
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"=B4=BF=CE=C4=B1=BE Char";
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:=CB=CE=CC=E5;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.Char
	{mso-style-name:"=B4=BF=CE=C4=B1=BE Char";
	mso-style-priority:99;
	mso-style-link:=B4=BF=CE=C4=B1=BE;
	font-family:=CB=CE=CC=E5;}
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
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText"><span lang=3D"EN-US">I wrote a document about the=
 REST interface (contains the REDFISH section ).<br>
It contains all the commands in REST-cheatsheet.md , REDFISH-cheatsheet.md =
and a REST related document.<br>
This document includes power, FW update, time settings, event log and relat=
ed commands.<br>
All commands have been run on the fp5280g2 machine.<br>
I want to upload this document to openbmc/docs because I think this documen=
t is good for the community.<br>
Can this document be accepted?<br>
Here is the link:<br>
https://github.com/inspur-bmc/openbmc-doc/blob/master/user's%20guide.md<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_bcf71058f3494169b90ee051e0079bb6inspurcom_--
