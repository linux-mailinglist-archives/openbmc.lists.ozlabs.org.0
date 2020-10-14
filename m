Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D119128DF03
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 12:37:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB84w2ZdkzDqlr
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 21:37:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=54939ef4a=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 68 seconds by postgrey-1.36 at bilbo;
 Wed, 14 Oct 2020 21:37:15 AEDT
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CB84C03cVzDqVD
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 21:37:13 +1100 (AEDT)
IronPort-SDR: jmn4J64j0aSStDb2Jhbi4FXcO2WOB2v9pbwHSPPnYpF1KugWcPzbwphJMoOrqInQN4yxAWbOq9
 4895to595lJw==
Received: from unknown (HELO mailbx11.quanta.corp) ([10.243.91.108])
 by mx01.quantatw.com with ESMTP; 14 Oct 2020 18:36:00 +0800
Received: from mailbx11.quanta.corp (10.243.91.108) by mailbx11.quanta.corp
 (10.243.91.108) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 14 Oct
 2020 18:35:58 +0800
Received: from mailbx11.quanta.corp ([192.168.57.11]) by mailbx11.quanta.corp
 ([192.168.57.11]) with mapi id 15.01.2044.004;
 Wed, 14 Oct 2020 18:35:58 +0800
From: =?big5?B?U3BlbmNlciBLdSAopWqlQLfsKQ==?= <Spencer.Ku@quantatw.com>
To: Artem Senichev <artemsen@gmail.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Modify Timestamp of phosphor-hostlogger 
Thread-Topic: Modify Timestamp of phosphor-hostlogger 
Thread-Index: AdaiFYMxC9eQT4jmT3KA6ZOgpczIEw==
Date: Wed, 14 Oct 2020 10:35:58 +0000
Message-ID: <4b1c3d6cd2fb42a9b4ca166ac90f9ae9@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
Content-Type: multipart/alternative;
 boundary="_000_4b1c3d6cd2fb42a9b4ca166ac90f9ae9quantatwcom_"
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

--_000_4b1c3d6cd2fb42a9b4ca166ac90f9ae9quantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KV2UgaGF2ZSB3b3JrZWQgb24gYSByZWRmaXNoIFVSSSB0aGF0IHByb3ZpZGVzIGhv
c3QgbG9nIGluZm9ybWF0aW9uLCB3aGljaCBpcyBiYXNlZCBvbiBvYm1jLWNvbnNvbGUgYW5kIHBo
b3NwaG9yLWhvc3Rsb2dnZXIuIE5vdyB3ZSBjYW4gZ2V0IGhvc3QgbG9nIGFuZCBmaWxsIGluZm9y
bWF0aW9uIGludG8gaG9zdCBsb2cgZW50cnksIGJ1dCBoZXJlIHdlIGhhdmUgYSBwcm9ibGVtIGFi
b3V0IHRpbWVzdGFtcC4NCg0KT25lIG9mIHRoZSBsb2cgZW50cnkgbGV2ZWwgoadjcmVhdGVkIHRp
bWWhqCwgbmVlZCB0byBmb2xsb3cgdGhlIHRpbWUgZm9ybWF0IGxpa2UgUkZDMzMzOSwgYW5kIGZv
ciBub3csIHRoZSBob3N0IGxvZyBvbmx5IHByb3ZpZGVzIGhvdXIsIG1pbnV0ZSwgYW5kIHNlY29u
ZCB0aW1lIGluZm8uIFdlIHdhbnQgdG8gbW9kaWZ5IHRoZSB0aW1lc3RhbXAgdG8gUkZDMzMzOSBm
b3JtYXQgdG8gZml0IHRoZSBsb2cgZW50cnkgdGltZSBmb3JtYXQuDQoNCkhlcmUgaXMgYSBzYW1w
bGUgaG9zdCBsb2cgd2l0aCB0aW1lc3RhbXAgcHJvdmlkaW5nIGJ5IHBob3NwaG9yLWhvc3Rsb2dn
ZXI6DQpbIDAwOjAwOjMxIF0gPj4+IExvZyBjb2xsZWN0aW9uIHN0YXJ0ZWQgYXQgMTk3MC0wMS0w
MSAwMDowMDozMQ0KDQpBZnRlciBtb2RpZmllZCwgdGhlIG1lc3NhZ2Ugd2lsbCBiZSBsaWtlZDoN
ClsgMTk3MC0wMS0wMVQwMDowMDozMSswMDowMCBdID4+PiBMb2cgY29sbGVjdGlvbiBzdGFydGVk
IGF0IDE5NzAtMDEtMDEgMDA6MDA6MzENCg0KaWYgdGhlIGNoYW5nZXMgbWFrZSBzZW5zZSwgd2Ug
d2lsbCBwdXNoIHRoZSBjaGFuZ2VzIHRvIHVwc3RyZWFtLg0KUGxlYXNlIGxldCB1cyBrbm93IGlm
IHRoZXJlJ3MgYW55IGlzc3VlLCB0aGFuayB5b3UuDQoNClNpbmNlcmVseSwNClNwZW5jZXINCg==

--_000_4b1c3d6cd2fb42a9b4ca166ac90f9ae9quantatwcom_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=B7s=B2=D3=A9=FA=C5=E9;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=B7s=B2=D3=A9=FA=C5=E9";
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"=B7s=B2=D3=A9=FA=C5=E9",serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi All,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:24.0pt"><span lang=3D"EN-US">We=
 have worked on a redfish URI that provides host log information, which is =
based on obmc-console and phosphor-hostlogger. Now we can get host log and =
fill information into host log entry,
 but here we have a problem about timestamp. <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:24.0pt"><span lang=3D"EN-US">On=
e of the log entry level =A1=A7created time=A1=A8, need to follow the time =
format like RFC3339, and for now, the host log only provides hour, minute, =
and second time info. We want to modify the timestamp
 to RFC3339 format to fit the log entry time format.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Here is a sample host log with =
timestamp providing by phosphor-hostlogger:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black;background=
:silver;mso-highlight:silver">[ 00:00:31 ] &gt;&gt;&gt; Log collection star=
ted at 1970-01-01 00:00:31</span><span lang=3D"EN-US" style=3D"color:black"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">After modified, the message wil=
l be liked:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black;background=
:silver;mso-highlight:silver">[ 1970-01-01T00:00:31&#43;00:00 ] &gt;&gt;&gt=
; Log collection started at 1970-01-01 00:00:31</span><span lang=3D"EN-US" =
style=3D"color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">if the ch=
anges make sense, we will push the changes to upstream.</span><span lang=3D=
"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">Please le=
t us know if there's any issue, thank you.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">Sincerely=
,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">Spencer<o=
:p></o:p></span></p>
</div>
</body>
</html>

--_000_4b1c3d6cd2fb42a9b4ca166ac90f9ae9quantatwcom_--
