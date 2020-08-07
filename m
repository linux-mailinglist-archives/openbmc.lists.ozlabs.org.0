Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E13AB23E8CC
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 10:22:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNJHm1qVXzDqwH
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 18:22:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=481899d08=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BNJGr10ZvzDqvZ
 for <openbmc@lists.ozlabs.org>; Fri,  7 Aug 2020 18:21:19 +1000 (AEST)
IronPort-SDR: a1ZnTjorbBsYkZ35C2tLdOuXcOtcYFgJ763GzcFd5+012EVThzwKUZbRKujAV5RjkGmvm7kdAO
 Dk7Ao3DpNzIg==
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx02.quantatw.com with ESMTP; 07 Aug 2020 16:21:17 +0800
Received: from mailbx11.quanta.corp (10.243.91.108) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 7 Aug 2020
 16:21:11 +0800
Received: from mailbx11.quanta.corp ([192.168.57.11]) by mailbx11.quanta.corp
 ([192.168.57.11]) with mapi id 15.01.2044.004;
 Fri, 7 Aug 2020 16:21:11 +0800
From: =?ks_c_5601-1987?B?U3BlbmNlciBLdSAoza/hpuulKQ==?=
 <Spencer.Ku@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Current situation about IPv6 
Thread-Topic: Current situation about IPv6 
Thread-Index: AdZskCL0JJHGz8lXTOuHv6Ukk2sGwA==
Date: Fri, 7 Aug 2020 08:21:11 +0000
Message-ID: <f265f52bb0c14964ab663f4cd77e754d@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: DB61CB16D2339E12B9348DBC2029ACFA311D7BD6E8513837362B9F19309592232000:8
Content-Type: multipart/mixed;
 boundary="_004_f265f52bb0c14964ab663f4cd77e754dquantatwcom_"
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

--_004_f265f52bb0c14964ab663f4cd77e754dquantatwcom_
Content-Type: multipart/alternative;
	boundary="_000_f265f52bb0c14964ab663f4cd77e754dquantatwcom_"

--_000_f265f52bb0c14964ab663f4cd77e754dquantatwcom_
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64

SGkgVGVhbXMsDQpJIGFtIGludGVyZXN0aW5nIGFib3V0IHdoYXQgaXMgdGhlIGN1cnJlbnQgc2l0
dWF0aW9uIGFib3V0IElQdjYuDQpOb3cgSSBhbSB0cnlpbmcgdG8gdXNlIGlwbWkgY29tbWFuZCB0
byBnZXQvc2V0IElQdjYgc2V0dGluZ3MsIGJ1dCBJIGNhbm5vdCBnZXQgY3VycmVudCByZXN1bHQu
DQpGb3IgZXhhbXBsZSwgaXBtaSBjb21tYW5kIHdpbGwgcmVzcG9uc2UgZW1wdHkgSVB2NiBhZGRy
ZXNzIHRvIG1lIGV2ZW4gaWYgbXkgZW52aXJvbm1lbnQgaXMgYWxyZWFkeSBoYXZpbmcgSVB2NiBh
ZGRyZXNzLg0KDQpBZnRlciB0aGF0LCBJIGZpbmQgYSBtYWlsIHdoaWNoIGlzIGRpc2N1c3Npbmcg
YWJvdXQgdGhlIElQdjYgc2V0dGluZy4gQW5kIGhlcmUgaXMgcGFydCBvZiBkZXNjcmlwdGlvbiBm
cm9tIG1haWw6DQoNCqiqICBDdXJyZW50bHkgcGhvc3Bob3ItbmV0d29ya2QgZG9lc24ndCBzdXBw
b3J0IFNMQUFDKERIQ1BWNiwgUm91dGVyIGFkdmVydGlzZWQgYWRkcmVzcykNCg0KRG9lcyBpdCBt
ZWFuIHRoYXQgSSBuZWVkIHRvIHNldCBhIHNwZWNpYWwgbmV0d29yayBlbnZpcm9ubWVudCB3aXRo
b3V0IFNMQUFDIGFuZCB0aGF0IGNhbiBsZXQgSVB2NiBpcG1pIGNvbW1hbmQgd29yayBub3JtYWxs
eT8NCg0KVGhhbmsgeW91Lg0KDQpTaW5jZXJlbHksDQpTcGVuY2VyDQo=

--_000_f265f52bb0c14964ab663f4cd77e754dquantatwcom_
Content-Type: text/html; charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dks_c_5601=
-1987">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:24.0pt;
	margin-bottom:.0001pt;
	mso-para-margin-top:0cm;
	mso-para-margin-right:0cm;
	mso-para-margin-bottom:0cm;
	mso-para-margin-left:2.0gd;
	mso-para-margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
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
/* List Definitions */
@list l0
	{mso-list-id:1339382737;
	mso-list-type:hybrid;
	mso-list-template-ids:-1429171318 1692808448 67698691 67698693 67698689 67=
698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0D8;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;
	font-family:Wingdings;
	mso-fareast-font-family:PMingLiU;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:\F06E;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:48.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F075;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:72.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F06C;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:96.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F06E;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:120.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F075;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:144.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F06C;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F06E;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:192.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F075;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:216.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
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
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Teams,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I am interesting about what is =
the current situation about IPv6.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Now I am trying to use ipmi com=
mand to get/set IPv6 settings, but I cannot get current result.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">For example, ipmi command will =
response empty IPv6 address to me even if my environment is already having =
IPv6 address.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">After that, I find a mail which=
 is discussing about the IPv6 setting. And here is part of description from=
 mail:<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd;text-indent:-18.0pt;mso-list:l0 level1 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:Wingdings"><=
span style=3D"mso-list:Ignore">=A8=AA<span style=3D"font:7.0pt &quot;Times =
New Roman&quot;">&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">Currently phosphor-netw=
orkd doesn't support SLAAC(DHCPV6, Router advertised address)<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Does it mean that I need to set=
 a special network environment without SLAAC and that can let IPv6 ipmi com=
mand work normally?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Sincerely,<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Spencer<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_f265f52bb0c14964ab663f4cd77e754dquantatwcom_--

--_004_f265f52bb0c14964ab663f4cd77e754dquantatwcom_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Fri, 07 Aug 2020 08:21:10 GMT";
	modification-date="Fri, 07 Aug 2020 08:21:10 GMT"

Received: from mailbx07.quanta.corp (10.243.91.102) by mailbx11.quanta.corp
 (10.243.91.108) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Mailbox
 Transport; Fri, 10 Jul 2020 20:02:27 +0800
Received: from mailbx11.quanta.corp (10.243.91.108) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 10 Jul
 2020 20:02:21 +0800
Received: from mx02.quantatw.com (10.240.65.139) by mailbx11.quanta.corp
 (10.243.91.108) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 10 Jul 2020 20:02:27 +0800
Received: from lists.ozlabs.org ([203.11.71.2])
  by mx02.quantatw.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2020 20:02:31 +0800
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B3BVm5VrhzDrNZ
	for <Spencer.Ku@quantatw.com>; Fri, 10 Jul 2020 22:02:24 +1000 (AEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B3BTh4PNJzDrK0
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 22:01:27 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06ABWC1h049762
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 08:01:23 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 326f1bwfph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 08:01:23 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06ABkmnf022768
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 12:01:20 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 326bc909ds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 12:01:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06ABxuuu56951102
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 11:59:56 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FF2AA4051
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 12:01:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D584A4055
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 12:01:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.208.196])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 12:01:17 +0000 (GMT)
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Why IPv6AcceptRA is disabled in phosphor-network
Thread-Topic: Why IPv6AcceptRA is disabled in phosphor-network
Thread-Index: AdZUTe8tO+Ptvht9S2iy3iqkLOxtugCINO2A
Sender: openbmc <openbmc-bounces+spencer.ku=quantatw.com@lists.ozlabs.org>
Date: Fri, 10 Jul 2020 12:01:17 +0000
Message-ID: <94f3de2f-f048-6fea-35c3-6b2b8d6d3239@linux.vnet.ibm.com>
References: <6213f03910e14149a6964234961ae193@quantatw.com>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
In-Reply-To: <6213f03910e14149a6964234961ae193@quantatw.com>
Content-Language: en-US
X-MS-Exchange-Organization-AuthAs: Anonymous
X-MS-Exchange-Organization-AuthSource: mailbx11.quanta.corp
X-MS-Has-Attach: 
X-Auto-Response-Suppress: All
X-MS-Exchange-Organization-Network-Message-Id: f3abfde3-00d5-4979-d8f0-08d824c91d42
X-MS-Exchange-Organization-SCL: 0
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
x-ms-exchange-organization-originalclientipaddress: 10.240.65.139
x-ms-exchange-organization-originalserveripaddress: 10.243.91.108
Content-Type: text/plain; charset="big5"
Content-ID: <94A60B2961851840A39615028F909156@quantatw.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGkgRGF2aWQsDQoNCk9uIDcvNy8yMCA0OjM5IFBNLCBEYXZpZCBXYW5nICik/a62pnQpIHdyb3Rl
Og0KPiBIaSBhbGwsDQo+ICAgIEkgd2FudCB0byBzZXQgREhDUHY2IHRvIGVuYWJsZSBieSBkZWZh
dWx0IGluIG15IEJNQy4NCj4gVGhhdCBpcywgSSBjYW4gZGVsZXRlIC9ldGMvc3lzdGVtZC9uZXR3
b3JrLzAwLWJtYy1ldGgqLm5ldHdvcmsNCj4gYW5kIHJlYm9vdCBhbmQgc3RpbGwgaGF2ZSBESENQ
djYgcmVhY2hhYmxlLg0KPg0KPiBCdXQgSSBub3RpY2UgdGhhdCBJUHY2QWNjZXB0UkEgaXMgZGlz
YWJsZWQgaW4gcGhvc3Bob3ItbmV0d29yaw0KPiBpbiBvcmRlciBub3QgdG8gaGFuZGxlIHRoZSBp
cHY2IHJvdXRpbmcgYWR2ZXJ0aXNlbWVudCBtZXNzYWdlIHBlcmlvZGljYWxseS4NCj4gU2VlOiBo
dHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9waG9zcGhvci1uZXR3
b3JrZC8rLzgzNjENCkN1cnJlbnRseSBwaG9zcGhvci1uZXR3b3JrZCBkb2Vzbid0IHN1cHBvcnQg
U0xBQUMoREhDUFY2LCBSb3V0ZXIgDQphZHZlcnRpc2VkIGFkZHJlc3MpLg0KPg0KPiBXaHkgd2Ug
bmVlZCB0byBhdm9pZCBoYW5kbGluZyBSQSBwZXJpb2RpY2FsbHk/DQoNCklmIHlvdSBoYXZlIGJh
ZCByb3V0ZXIgY29uZmlndXJlZCBpbiBuZXR3b3JrIHdoaWNoIGtlZXBzIHNlbmRpbmcgdGhlIA0K
cm91dGluZyBwcmVmaXggZnJlcXVlbnRseSwgcGhvcHNob3ItbmV0d29ya2QgZnJlcXVlbnRseSBy
ZWZyZXNoaW5nIGl0cyANCkQtYnVzIG9iamVjdHMuSXQgY2FuIGJlIGZpeGVkIGFzIGlnbm9yZSB0
aGUgcmVmcmVzaGluZyBvZiB0aGUgRGJ1cyANCm9iamVjdHMgaWYgdGhlcmUgaXMgYSBELWJ1cyBv
YmplY3QgZW50cnkgZm9yIHRoZSBnaXZlbiBJUCBhZGRyZXNzLg0KDQo+IERvZXMgaXQgY2F1c2Ug
YW55IGJhZCBlZmZlY3Q/DQo+IElmIEkgd2FudCB0byBrZWVwIHRoZSBhY2NlcHRhbmNlIFJBLCBo
b3cgc2hvdWxkIEkgY29uZmlndXJlIGl0Pw0KPiBPciBzaG91bGQgSSBqdXN0IHBhdGNoICJJUHY2
QWNjZXB0UkE9dHJ1ZSIgaW4gcGhvc3Bob3ItbmV0d29yayBvZiBteSBCTUM/DQpJZiB3ZSBmaXgg
dGhlIGJlaGF2aW9yIGFzIHN1Z2dlc3RlZCBhYm92ZSB0aGVyZSBzaG91bGQgbm90IGJlIGEgcHJv
YmxlbS4NCj4NCj4gVGhhbmsgeW91LA0KPg0KPiBSZWdhcmRzLA0KPiBEYXZpZA0K

--_004_f265f52bb0c14964ab663f4cd77e754dquantatwcom_--
