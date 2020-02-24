Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B4C170E55
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 03:18:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SbvM385QzDqSC
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 13:18:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wiwynn.com (client-ip=103.200.3.19; helo=segapp01.wistron.com;
 envelope-from=max_lai@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=Wistron.onmicrosoft.com
 header.i=@Wistron.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-Wistron-onmicrosoft-com header.b=YV7DhDDp; 
 dkim-atps=neutral
Received: from segapp01.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 48R0Jr3D6TzDqPS
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 22:31:52 +1100 (AEDT)
Received: from EXCHAPP02.whq.wistron (unverified [10.37.38.25]) by 
 TWNHUMSW5.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id 
 <Tdd8517e89dc0a81673189c@TWNHUMSW5.wistron.com>; Mon, 24 Feb 2020 
 19:31:49 +0800
Received: from EXCHAPP04.whq.wistron (10.37.38.27) by EXCHAPP02.whq.wistron 
 (10.37.38.25) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1713.5; Mon, 24 Feb 2020 19:31:46 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (10.37.38.71) by 
 mail.wistron.com (10.37.38.27) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1713.5 via Frontend Transport; Mon, 24 Feb 2020 19:31:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none; 
 b=GscyCLutvPK8fdm9crOyvQayH7pEUZOvDmKsDoA888kSwrsVVkp8iOO/iNpJZdXHfoKHch1t8c6T9u3LdasMe56R/Wg24tcvgMw4OVxfZ2mDVVYJV4a6GKy/KVYRVqY6zwlO9YWhfXtunEuMuYUM7n1MmYLzgt2iGhCMvcGHSSnYjBGKGlg9k44FKzfxtgsD4ftpb69KdgM+ru3KVbyENy4+iQBLpzrOFpffNYPG3WdxJDhgXE68OfjuELYScvvZ2EeVxoPo6yvGvOtNEE4KR14kDdj0lhGrnb1O2kXtDcEGl4+ur3g6LMX9o4tqzT0FP59GBmgKoLYi+I24R61jMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6mHDMELbjIBOvKbesOArhX4mwrk/L+nObMGVHV+bG4=; 
 b=Gob2cQJp0HIvscmM77bOxI4NMBjQVS19FRhBtTD0uPeXC6lPmUV0auWOex1HOe7NFZNmn/ult1LNK53VJrLiXw9ox0t6fUQwREoaFb4RLGm9Xh7Ye462J9J/rroM8aWCVo0PD3v88392wG0CFKK5WUaOlpb2oh/AsWp1wj7+7LqIMRzscDleR0M5f1qPQdoaGzWSKaprzjPpRaJs9RTVprew17/lI7/xBLT/oUmrRXnNMGloPYkN8vBMNs3wDWm8IMqVeiwKal4jerJS1IplqV/TxHz2KOjrKZsNbSpJ7RlyosMxNHUJVGfVFpBQflQhDgtcmMKFhdIIzdAOumDKaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass 
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none 
 header.from=wiwynn.com; dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; 
 d=Wistron.onmicrosoft.com; s=selector2-Wistron-onmicrosoft-com; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6mHDMELbjIBOvKbesOArhX4mwrk/L+nObMGVHV+bG4=; 
 b=YV7DhDDptpFB14fP6/SN0esK/oBFyOhlMqv5+KthMId9RUUbPTBkNeK/d1oWrGU6f0WP//bGRZQnlFyEQQN/66I6q+ZsGZm5kf2uG93TCQWusHQiUcgogalo2ytxc3NpiIHQ7Omm0nIGUcIQRDhu57S7+WEY8xDu2VlPmMYZ7EU=
Received: from HK2PR02MB3826.apcprd02.prod.outlook.com (10.170.156.210) by 
 HK2PR02MB4227.apcprd02.prod.outlook.com (20.179.123.214) with 
 Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 
 15.20.2750.17; Mon, 24 Feb 2020 11:31:42 +0000
Received: from HK2PR02MB3826.apcprd02.prod.outlook.com 
 ([fe80::c52c:3509:987b:9b1d]) by 
 HK2PR02MB3826.apcprd02.prod.outlook.com 
 ([fe80::c52c:3509:987b:9b1d%6]) with mapi id 15.20.2750.021; Mon, 24 
 Feb 2020 11:31:42 +0000
From: Max Lai/WYHQ/Wiwynn <Max_Lai@wiwynn.com>
To: James Feist <james.feist@linux.intel.com>
Subject: RE: dbus-sensor: setting the upper non-critical(unc) threshold value
 smaller than reading value would get 3 logs ( assert log,
 de-assert log and then assert log)
Thread-Topic: dbus-sensor: setting the upper non-critical(unc) threshold 
 value smaller than reading value would get 3 logs 
 ( assert log, de-assert log and then assert log)
Thread-Index: AdXmxFb2+sB10j5LQXa8MfyHCelpJQAg0hsAAO4TfuA=
Date: Mon, 24 Feb 2020 11:31:42 +0000
Message-ID: <HK2PR02MB3826381BDA6F9AEE8CF67D7FEAEC0@HK2PR02MB3826.apcprd02.prod.outlook.com>
References: <HK2PR02MB38260025D3279EB8DBF0523CEA100@HK2PR02MB3826.apcprd02.prod.outlook.com>
 <900ef2d7-3755-a3f1-ad40-4cd9e849ebf7@linux.intel.com>
In-Reply-To: <900ef2d7-3755-a3f1-ad40-4cd9e849ebf7@linux.intel.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) 
 smtp.mailfrom=Max_Lai@wiwynn.com; 
x-originating-ip: [125.227.140.245]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a6364ee-1aca-4074-9b62-08d7b91d1f24
x-ms-traffictypediagnostic: HK2PR02MB4227:|HK2PR02MB4227:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR02MB422789EF6661748727EC32E4EAEC0@HK2PR02MB4227.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10001)(10019020)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(189003)(199004)(966005)(5660300002)(478600001)(2906002)(54906003)(76116006)(316002)(66946007)(186003)(66556008)(52536014)(66476007)(33656002)(45080400002)(64756008)(66446008)(26005)(86362001)(66616009)(6506007)(53546011)(81156014)(4326008)(7696005)(55016002)(8936002)(9686003)(6916009)(107886003)(8676002)(71200400001)(81166006);
 DIR:OUT;SFP:1102;SCL:1;SRVR:HK2PR02MB4227;
 H:HK2PR02MB3826.apcprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;
 PTR:InfoNoRecords;MX:1;A:1;
received-spf: None 
 (protection.outlook.com: wiwynn.com does not designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fyoBsBAHJYP8n+BVwciBpcgNPekbypF30DhQD1T78HRMf14oxCprYQhW4F6c2nVbO9pwi5U2cGm/bwLhWQXgMVI5j/94gtEK/53OZ/pQfNQW3Sa4S+78+yy3JpaMgqc4bDroYthrGvcoM2WPfjuLMABwyCWbk4jDbuHXcCY/P7q7wuKsGpWSPKGvOzTyXH6ZZFeiT6aaW6lfu3qmQgNLrcJ0TvYZsn5tY5yUvOxbJfXDL4YxUqgdPD8PIyvCK4p4mHEB2pr8BT9mKwHqon/FuJlAhaCDmcks8U16+g5COvItvLRD5tJ41AdzFfSTDL7/SegvIa/fTlFu2WP9VxxfZ61DCW+Xwffvlqti56097i1tb78hQ1Rf47KNRbZSfakP8X0UCPUeFVxNGH8YG06CFPxOBLfFLwNeOJXOhUoi6f7T2jJwP5uPH7eF5nT8SCwEVRVHJV/wBjaxtbBnOP8FFu9XQ1uhqpKnsdH7ny0hn2QQXQguXDihtvC6RsKSqq72wu+wXs6+Nii6f2KCTYtSkaevmhTZa5PrSDRH0oN4wheRvcnyTV+PYg+QG5TQy1PXXjW2Xmyrg0lJElWPPnLQtA==
x-ms-exchange-antispam-messagedata: ouKmnBuN7c4ElrTjqvZAgK4mcO/aB2cigCSAztIGeCbE4ISxUzR/9/xjdy5+1xGgXT4X6REXmikKpIYZYfQ31OL/BB0gMHt0vqtNJiArlOCccn7hd+5fcUOd94OgiMBxh3WFf6opKqlL70rAga3I4g==
Content-Type: multipart/related; 
 boundary="_004_HK2PR02MB3826381BDA6F9AEE8CF67D7FEAEC0HK2PR02MB3826apcp_";
 type="multipart/alternative"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a6364ee-1aca-4074-9b62-08d7b91d1f24
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 11:31:42.0779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de0795e0-d7c0-4eeb-b9bb-bc94d8980d3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HyISu00UCG1cSLyQAoo0fJiA1AonR0WO0WjmdVKMy7Wbn7Pqv7kHStku8yP2Vg9C0PR+dOzzZjZ6vx7DaUWQow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR02MB4227
X-OriginatorOrg: wiwynn.com
X-TM-SNTS-SMTP: 3F20C630F3B246602A6A90181F0696BFD6A0C0EA65FAF860BE5143918CB4C9B72000:8
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:08:41 +1100
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
 "LF_OpenBMC.WYHQ.Wiwynn" <LF_OpenBMC.WYHQ.Wiwynn@Wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_004_HK2PR02MB3826381BDA6F9AEE8CF67D7FEAEC0HK2PR02MB3826apcp_
Content-Type: multipart/alternative; 
    boundary="_000_HK2PR02MB3826381BDA6F9AEE8CF67D7FEAEC0HK2PR02MB3826apcp_"

--_000_HK2PR02MB3826381BDA6F9AEE8CF67D7FEAEC0HK2PR02MB3826apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi James,



We had tried your fix solution (Deleting lines 117 and 118). Deleting the l=
ines 117 and 118 would stop sending the PropertiesChanged signal and even s=
top updating threshold value on Dbus. The result we want is we can change t=
hreshold value on Dbus and get assert sel log when we trigger the threshold=
 mechanism. And we also tried the latest source revision on upstream dbus-s=
ensor repository. We found that latest source revision in IpmbSensor.cpp, s=
truct sensor's "objectType" member which was set "xyz.openbmc_project.Confi=
guration.ExitAirTemp" was different than our "xyz.openbmc_project.EntityMan=
ager". So this issue doesn't happen.

[cid:image001.png@01D5EB48.36B03D30]

What's the purpose of this changing?

Engineer
Storage Firmware
Development Dept.
Firmware Development Div.

Wiwynn Corporation

Tel: +886-2-6614-7549
E-mail: Max_Lai@wiwynn.com<mailto:Max_Lai@wiwynn.com>



-----Original Message-----
From: James Feist <james.feist@linux.intel.com>
Sent: Thursday, February 20, 2020 1:11 AM
To: Max Lai/WYHQ/Wiwynn <Max_Lai@wiwynn.com>
Cc: openbmc@lists.ozlabs.org; Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwy=
nn.com>; Bonnie Lo/WYHQ/Wiwynn <Bonnie_Lo@wiwynn.com>
Subject: Re: dbus-sensor: setting the upper non-critical(unc) threshold val=
ue smaller than reading value would get 3 logs ( assert log, de-assert log =
and then assert log)



Because configurations can change at runtime. For instance if you change a =
threshold, or you add/remove a card. This gets persisted back to entity-man=
ager

https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fopenbmc%2Fdbus-sensors%2Fblob%2Fa97f1343379bbb52371195bc613a689cbfb37=
4f3%2Fsrc%2FThresholds.cpp%23L118&amp;data=3D02%7C01%7CMax_Lai%40wiwynn.com=
%7Ca8d9411b7f9647a0174108d7b55eccb5%7Cde0795e0d7c04eebb9bbbc94d8980d3b%7C1%=
7C0%7C637177291088060436&amp;sdata=3DQrbRo%2BqQjKQelorhW4zxp9DUcwsyxBZl5b%2=
BKXCnTC98%3D&amp;reserved=3D0

and that will trigger an update.



I'm guessing this todo is what is needed to fix your issue:

https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fopenbmc%2Fdbus-sensors%2Fblob%2Fa97f1343379bbb52371195bc613a689cbfb37=
4f3%2Finclude%2Fsensor.hpp%23L117&amp;data=3D02%7C01%7CMax_Lai%40wiwynn.com=
%7Ca8d9411b7f9647a0174108d7b55eccb5%7Cde0795e0d7c04eebb9bbbc94d8980d3b%7C1%=
7C0%7C637177291088060436&amp;sdata=3Ddl3PecBITgFAmtRJSNsCitl5e8dkqd%2BVWFSm=
HysStJM%3D&amp;reserved=3D0



I was wondering when I wrote this if the config can just update the thresho=
ld, and updating it locally was not needed. Deleting lines 117 and 118 migh=
t fix your issue.

---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------
This email contains confidential or legally privileged information and is f=
or the sole use of its intended recipient.=20
Any unauthorized review, use, copying or distribution of this email or the =
content of this email is strictly prohibited.
If you are not the intended recipient, you may reply to the sender and shou=
ld delete this e-mail immediately.
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------

--_000_HK2PR02MB3826381BDA6F9AEE8CF67D7FEAEC0HK2PR02MB3826apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"\7D14\6587\5B57 \5B57\5143";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
span.a
	{mso-style-name:"\7D14\6587\5B57 \5B57\5143";
	mso-style-priority:99;
	mso-style-link:\7D14\6587\5B57;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Hi James,<o:p></o:p></span><=
/p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">We had tried your fix soluti=
on (Deleting lines 117 and 118). Deleting the lines 117 and 118 would stop =
sending the PropertiesChanged signal and even stop updating threshold value=
 on Dbus. The result we want is we can
 change threshold value on Dbus and get assert sel log when we trigger the =
threshold mechanism. And we also tried the latest source revision on upstre=
am dbus-sensor repository. We found that latest source revision in IpmbSens=
or.cpp, struct sensor's &quot;objectType&quot;
 member which was set &quot;xyz.openbmc_project.Configuration.ExitAirTemp&q=
uot; was different than our &quot;xyz.openbmc_project.EntityManager&quot;. =
So this issue doesn</span><span lang=3D"EN-US" style=3D"font-family:&quot;C=
ourier New&quot;">&#8217;</span><span lang=3D"EN-US">t happen.<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><img width=3D"590" height=3D=
"215" style=3D"width:6.1458in;height:2.2395in" id=3D"_x5716__x7247__x0020_1=
" src=3D"cid:image001.png@01D5EB48.36B03D30"></span><span lang=3D"EN-US"><o=
:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">What's the purpose of this c=
hanging?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Enginee=
r</span><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Storage=
 Firmware<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Develop=
ment Dept.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Firmwar=
e Development Div.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">Wiwynn Co=
rporation<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">Tel: &#43=
;886-2-6614-7549<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">E-mail:=
</span><span lang=3D"EN-US" style=3D"color:#002060">
<a href=3D"mailto:Max_Lai@wiwynn.com"><span style=3D"color:#0563C1">Max_Lai=
@wiwynn.com</span></a></span><span lang=3D"EN-US" style=3D"color:#1F497D"><=
o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">-----Original Message-----<b=
r>
From: James Feist &lt;james.feist@linux.intel.com&gt; <br>
Sent: Thursday, February 20, 2020 1:11 AM<br>
To: Max Lai/WYHQ/Wiwynn &lt;Max_Lai@wiwynn.com&gt;<br>
Cc: openbmc@lists.ozlabs.org; Delphine Chiu/WYHQ/Wiwynn &lt;DELPHINE_CHIU@w=
iwynn.com&gt;; Bonnie Lo/WYHQ/Wiwynn &lt;Bonnie_Lo@wiwynn.com&gt;<br>
Subject: Re: dbus-sensor: setting the upper non-critical(unc) threshold val=
ue smaller than reading value would get 3 logs ( assert log, de-assert log =
and then assert log)</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:black"><o:p>&=
nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Because configurations can c=
hange at runtime. For instance if you change a threshold, or you add/remove=
 a card. This gets persisted back to entity-manager<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><a href=3D"https://apc01.saf=
elinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fd=
bus-sensors%2Fblob%2Fa97f1343379bbb52371195bc613a689cbfb374f3%2Fsrc%2FThres=
holds.cpp%23L118&amp;amp;data=3D02%7C01%7CMax_Lai%40wiwynn.com%7Ca8d9411b7f=
9647a0174108d7b55eccb5%7Cde0795e0d7c04eebb9bbbc94d8980d3b%7C1%7C0%7C6371772=
91088060436&amp;amp;sdata=3DQrbRo%2BqQjKQelorhW4zxp9DUcwsyxBZl5b%2BKXCnTC98=
%3D&amp;amp;reserved=3D0"><span style=3D"color:windowtext;text-decoration:n=
one">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
thub.com%2Fopenbmc%2Fdbus-sensors%2Fblob%2Fa97f1343379bbb52371195bc613a689c=
bfb374f3%2Fsrc%2FThresholds.cpp%23L118&amp;amp;data=3D02%7C01%7CMax_Lai%40w=
iwynn.com%7Ca8d9411b7f9647a0174108d7b55eccb5%7Cde0795e0d7c04eebb9bbbc94d898=
0d3b%7C1%7C0%7C637177291088060436&amp;amp;sdata=3DQrbRo%2BqQjKQelorhW4zxp9D=
UcwsyxBZl5b%2BKXCnTC98%3D&amp;amp;reserved=3D0</span></a><o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">and that will trigger an upd=
ate.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">I'm guessing this todo is wh=
at is needed to fix your issue:<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><a href=3D"https://apc01.saf=
elinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fd=
bus-sensors%2Fblob%2Fa97f1343379bbb52371195bc613a689cbfb374f3%2Finclude%2Fs=
ensor.hpp%23L117&amp;amp;data=3D02%7C01%7CMax_Lai%40wiwynn.com%7Ca8d9411b7f=
9647a0174108d7b55eccb5%7Cde0795e0d7c04eebb9bbbc94d8980d3b%7C1%7C0%7C6371772=
91088060436&amp;amp;sdata=3Ddl3PecBITgFAmtRJSNsCitl5e8dkqd%2BVWFSmHysStJM%3=
D&amp;amp;reserved=3D0"><span style=3D"color:windowtext;text-decoration:non=
e">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith=
ub.com%2Fopenbmc%2Fdbus-sensors%2Fblob%2Fa97f1343379bbb52371195bc613a689cbf=
b374f3%2Finclude%2Fsensor.hpp%23L117&amp;amp;data=3D02%7C01%7CMax_Lai%40wiw=
ynn.com%7Ca8d9411b7f9647a0174108d7b55eccb5%7Cde0795e0d7c04eebb9bbbc94d8980d=
3b%7C1%7C0%7C637177291088060436&amp;amp;sdata=3Ddl3PecBITgFAmtRJSNsCitl5e8d=
kqd%2BVWFSmHysStJM%3D&amp;amp;reserved=3D0</span></a><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">I was wondering when I wrote=
 this if the config can just update the threshold, and updating it locally =
was not needed. Deleting lines 117 and 118 might fix your issue.<o:p></o:p>=
</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p></o:p></span></p>
</div>

<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------</b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
This email contains confidential or legally privileged information and is f=
or the sole use of its intended recipient. </b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
Any unauthorized review, use, copying or distribution of this email or the =
content of this email is strictly prohibited.</b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
If you are not the intended recipient, you may reply to the sender and shou=
ld delete this e-mail immediately.</b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------</b></span></p></body>
</html>

--_000_HK2PR02MB3826381BDA6F9AEE8CF67D7FEAEC0HK2PR02MB3826apcp_--

--_004_HK2PR02MB3826381BDA6F9AEE8CF67D7FEAEC0HK2PR02MB3826apcp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=30368; 
    creation-date="Mon, 24 Feb 2020 11:31:39 GMT"; 
    modification-date="Mon, 24 Feb 2020 11:31:39 GMT"
Content-ID: <image001.png@01D5EB48.36B03D30>
Content-Transfer-Encoding: base64

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

--_004_HK2PR02MB3826381BDA6F9AEE8CF67D7FEAEC0HK2PR02MB3826apcp_--
