Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E32A11175F
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 12:38:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vsDy0zbSzDqNB
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 20:38:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=01833521c=hank.liou@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 44vsCn0l9tzDqPP
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 20:37:36 +1000 (AEST)
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx02.quantatw.com with ESMTP; 02 May 2019 18:37:33 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 2 May 2019
 18:37:32 +0800
Received: from mailbx05.quanta.corp ([192.168.0.5]) by mailbx05.quanta.corp
 ([192.168.0.5]) with mapi id 15.01.1713.004; Thu, 2 May 2019 18:37:32 +0800
From: =?big5?B?SGFuayBMaW91ICi8Qq7Kv6sp?= <Hank.Liou@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [phosphor-fan-presence] ask fan fail behavior
Thread-Topic: [phosphor-fan-presence] ask fan fail behavior
Thread-Index: AQHVAM4f4qmVPTFHv06/XyHKGJs+gQ==
Date: Thu, 2 May 2019 10:37:32 +0000
Message-ID: <21923ba4201f4a5eacf5580295a617c4@quantatw.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24586.004
x-tm-as-result: No--14.284700-0.000000-31
x-tm-as-matchedid: 140026-300151-139704-113220-780058-111604-700362-705718-7
 00345-701827-700264-702497-704425-700732-701306-700450-703223-709859-111605
 -700074-700079-709584-700994-704287-708797-702829-780048-188093-148004-1480
 54-20020-22561-42000-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: multipart/alternative;
 boundary="_000_21923ba4201f4a5eacf5580295a617c4quantatwcom_"
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

--_000_21923ba4201f4a5eacf5580295a617c4quantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KDQoNCg0KSXMgdGhlcmUgYSBtZWNoYW5pc20gaW4gcGhvc3Bob3ItZmFuLXByZXNl
bmNlIHRoYXQgd2lsbCBzZXQgYWxsIGZhbnMnIHNwZWVkIGV4Y2VwdCBmYWlsZWQgb25lIGFzIGEg
ZmFuIGZhaWxzPyBJIGhhdmUgcmVhZCBwaG9zcGhvci1mYW4tcHJlc2VuY2UgZm9yIGEgd2hpbGUs
IGJ1dCBJIG9ubHkgIGZvdW5kIHNldF9zcGVlZF9vbl9taXNzaW5nX293bmVyLCBhIGZ1bmN0aW9u
IGluIGNvbnRyb2wvYWN0aW9ucy5jcHAuIFRoaW5ncyBnZXQgd29yc2UgdGhhdCBJIGRvbid0IGtu
b3cgaG93IHRvIHRyaWdnZXIgaXQgbm90IHRvIHNheSB0byB0ZXN0IGl0LiBBbnkgY29tbWVudCBp
cyB3ZWxjb21lLg0KDQoNCg0KU2luY2VyZWx5LA0KDQpIYW5rIExpb3UNCg==

--_000_21923ba4201f4a5eacf5580295a617c4quantatwcom_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
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
	font-family:"Times New Roman",serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle19
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:black;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">H=
i All,<o:p></o:p></span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"><=
o:p>&nbsp;</o:p></span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">I=
s there a mechanism in&nbsp;phosphor-fan-presence&nbsp;that will set all fa=
ns' speed&nbsp;except&nbsp;failed one as a fan fails?&nbsp;I have read phos=
phor-fan-presence for a while, but I&nbsp;only&nbsp; found&nbsp;set_speed_o=
n_missing_owner,
 a function in&nbsp;control/actions.cpp. Things get worse that I don't know=
 how to trigger it not to say to&nbsp;test it. Any comment&nbsp;is welcome.=
<o:p></o:p></span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"><=
o:p>&nbsp;</o:p></span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">S=
incerely,<o:p></o:p></span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">H=
ank Liou<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_21923ba4201f4a5eacf5580295a617c4quantatwcom_--
