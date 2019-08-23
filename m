Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E71B89ADEC
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 13:14:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FJgd48KVzDrpm
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 21:14:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=apc01-sg2-obe.outbound.protection.outlook.com
 (client-ip=40.107.131.73; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=kwliu@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="k+0nyeOT"; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310073.outbound.protection.outlook.com [40.107.131.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FJg12zf3zDrj8
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 21:13:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQNVYMvpRG+F+GayGTXh42zgglteqByIApiIb/J0ZKyXFO3Skd58H6V83ZiadJRPoMUrPN36kkcdJ5lIOgCWKAcMqnIxOdeV9/FVTRxnozEb3rFkgzhmyJMPgyTYswQ+b11WwL+aq8RE7ca57116jjNfHvbFu9/WlMz3aess+4ptnAiKTEA5GfKPPRwI8TI3x2zbnDagCcjAJGXdbHzctzfIOAPSJpBd8cfC2fixCFTxSQebiytBTFx/OJrdJD82rpOXnMcqBo0hU6r/967gB9NCPgMi9K7YyfL3O8IbdnGU2TTPnAyzFRc1WDixpsZEr/4RoDYvlMgmaPoZpwt7TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bO9s8RH661KhAx8aDUdU5KecE+3CYYxAnRCFlLaez6c=;
 b=aljteXPr4+YtDbHG1c+vyZNZL7D4tEoP7R1qeR5bimWFDF3hI+cQqT0TM0QiKA/dr3O8ncJRJbwnrh1q3WPjF4uQmITOz6rqIw9Aoq3/1AGIi/sYCyhPELWk5LiJDAByJfk2Nxm2AaYUP+dc4dm3oPP2jphAv08OHatf2Wb+U2AgZJpsuZfshV+opAtnCB8xwTyrEIQz+IAJSzvLi/wE3oLx2weeYMne5wwoNW0fx4w5jcQWwubFC7isOdoKSBIXpp1BrNU8Z5jSelsl+w76dxYLM9hpyC42K+xaA4qBoc52eLIw5QX7LHDcp6HUT/dL7tyUUk+tJ8HC3S0QCAZmvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bO9s8RH661KhAx8aDUdU5KecE+3CYYxAnRCFlLaez6c=;
 b=k+0nyeOTHW0c3bfdodsFghaNmuINbcoDXVUIFSG5MrRS0ZAwAPqYLG/oPApG5fgl9oSl/67h6OaSw+YIObZYMzHdTuQ+ZunHbcaiAvL7HHICsjoVLGjwbUMpBLqQy5ODXHCOlI8yLPvPjVjprvRW7L55kDfy6AklcPOR+iHNXoA=
Received: from HK0PR03MB4068.apcprd03.prod.outlook.com (20.177.165.144) by
 HK0PR03MB3156.apcprd03.prod.outlook.com (52.133.151.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.11; Fri, 23 Aug 2019 11:13:23 +0000
Received: from HK0PR03MB4068.apcprd03.prod.outlook.com
 ([fe80::21bc:ec74:30c4:2655]) by HK0PR03MB4068.apcprd03.prod.outlook.com
 ([fe80::21bc:ec74:30c4:2655%4]) with mapi id 15.20.2199.015; Fri, 23 Aug 2019
 11:13:23 +0000
From: CS20 KWLiu <KWLIU@nuvoton.com>
To: Patrick Venture <venture@google.com>
Subject: phosphor-ipmi-flash: A problem in BMC FW update over LPC 
Thread-Topic: phosphor-ipmi-flash: A problem in BMC FW update over LPC 
Thread-Index: AdVZo6Jl7YalvxqwR/SsXogzldHHZQ==
Date: Fri, 23 Aug 2019 11:13:23 +0000
Message-ID: <HK0PR03MB4068E6EB742A7088B92362A7AEA40@HK0PR03MB4068.apcprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=KWLIU@nuvoton.com; 
x-originating-ip: [2401:e180:8812:6371:2895:5551:ffad:5478]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d38672bc-b30e-464a-50ce-08d727bae9c0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:HK0PR03MB3156; 
x-ms-traffictypediagnostic: HK0PR03MB3156:|HK0PR03MB3156:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR03MB3156FDC58A0932334C14985CAEA40@HK0PR03MB3156.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(189003)(199004)(86362001)(52536014)(74316002)(2906002)(5660300002)(790700001)(102836004)(4326008)(7110500001)(54906003)(186003)(6116002)(14444005)(256004)(66476007)(46003)(66446008)(64756008)(66556008)(71200400001)(71190400001)(4743002)(498600001)(53936002)(25786009)(7736002)(99286004)(476003)(80792005)(33656002)(15650500001)(2420400007)(9686003)(8676002)(81166006)(81156014)(486006)(8936002)(6916009)(6306002)(6506007)(14454004)(76116006)(55016002)(66946007)(6436002)(7696005)(54896002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HK0PR03MB3156;
 H:HK0PR03MB4068.apcprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nuvoton.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HbyL3NAKVJbDMaqoo3aJtBvsu9Xmvxj2i/WgjX3B0PVQC+yYyI2z0e717eyJd6YMBFYKQ9x9geYtaky6Q598/ET/I/Eo7UZkzeL/EbmZgUb9HXDqPgkX1nXGJsyjVMsbaMwdqqgI5/ATKUmOCanml99q1RUekGKNfJDYW951H3ureN53cURiIJPiAEJn+Sz3d6B8LOiuBC9MQ6BZUncvTsJr/nx9RoSppUqMXs+gs+s1Zhiv1PKN4QUhEKGrAHjWVCxhu/wBZ7eNt/ktSRd3aQcTbXwoCpDzWvdNpL4zUOBttwfkM9ULnz7g7cGGGuMs1t+j8+FMxnbHh/NjXRre/n/qSBpjIsD4YSM7PAViIO4/f9BetOnRn5f0GBOI74sRXWBKz7FrwsKSJiwQvVp7glgESKDK92TtTfQPG5P37gU=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR03MB4068E6EB742A7088B92362A7AEA40HK0PR03MB4068apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d38672bc-b30e-464a-50ce-08d727bae9c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 11:13:23.4350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q/zymFQP2wPVYMisFg2NwssLMSphu+v8/5KAgMvs5Rq5ej6s2OF1prdJ/+nuznMHY6nMDPXabjuZtVvGCIItPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3156
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
Cc: =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?big5?B?Q29yZXkgQ2hlbiAos6+n07vKKQ==?= <Corey.Chen@quantatw.com>,
 CS20 CTCchien <CTCCHIEN@nuvoton.com>,
 =?big5?B?U2FtdWVsIEppYW5nICimv/Gvpf0p?= <Samuel.Jiang@quantatw.com>,
 =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR03MB4068E6EB742A7088B92362A7AEA40HK0PR03MB4068apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGVsbG8gUGF0cmljazoNCg0KV2UgYXJlIGN1cnJlbnRseSB0cnlpbmcgdG8gZW5hYmxlIHRoZSBC
TUMgRlcgdXBkYXRlIG92ZXIgTFBDIG9uIG91ciBwbGF0Zm9ybSAobnV2b3RvbiBCTUMpLCBidXQg
d2UgZW5jb3VudGVyIGEgcHJvYmxlbSB3aXRoIEJJT1MuDQoNClRoZSBCSU9TIGVuZ2luZWVyIGhh
cyByZXNlcnZlZCBtZW1vcnkgcmVnaW9uIGFzIG1taW8gc3BhY2UsIGJ1dCB3ZSBjb3VsZG4ndCBz
ZWUgYW55IGRhdGEgY2hhbmdlIGluIHRoaXMgcmVnaW9uIGR1cmluZyBydW4gYnVybl9teV9ibWMu
DQoNCldlIGhhdmUgY2hlY2tlZCB0aGUgQk1DIHNldHRpbmcoaW4gbHBjX251dm90b24uYyBhbmQg
TEROIFNITSkgYnV0IHdlIGNvdWxkbid0IGlkZW50aWZ5IHRoZSByb290IGNhdXNlIG9mIHRoaXMg
cHJvYmxlbS4NCg0KSXMgdGhlcmUgYW55IHNldHRpbmdzIHdlIGxvc3Q/DQoNClRoYW5rcywNCkpv
c2VwaA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NClRoZSBwcml2aWxlZ2VkIGNv
bmZpZGVudGlhbCBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlbWFpbCBpcyBpbnRlbmRl
ZCBmb3IgdXNlIG9ubHkgYnkgdGhlIGFkZHJlc3NlZXMgYXMgaW5kaWNhdGVkIGJ5IHRoZSBvcmln
aW5hbCBzZW5kZXIgb2YgdGhpcyBlbWFpbC4gSWYgeW91IGFyZSBub3QgdGhlIGFkZHJlc3NlZSBp
bmRpY2F0ZWQgaW4gdGhpcyBlbWFpbCBvciBhcmUgbm90IHJlc3BvbnNpYmxlIGZvciBkZWxpdmVy
eSBvZiB0aGUgZW1haWwgdG8gc3VjaCBhIHBlcnNvbiwgcGxlYXNlIGtpbmRseSByZXBseSB0byB0
aGUgc2VuZGVyIGluZGljYXRpbmcgdGhpcyBmYWN0IGFuZCBkZWxldGUgYWxsIGNvcGllcyBvZiBp
dCBmcm9tIHlvdXIgY29tcHV0ZXIgYW5kIG5ldHdvcmsgc2VydmVyIGltbWVkaWF0ZWx5LiBZb3Vy
IGNvb3BlcmF0aW9uIGlzIGhpZ2hseSBhcHByZWNpYXRlZC4gSXQgaXMgYWR2aXNlZCB0aGF0IGFu
eSB1bmF1dGhvcml6ZWQgdXNlIG9mIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBvZiBOdXZvdG9u
IGlzIHN0cmljdGx5IHByb2hpYml0ZWQ7IGFuZCBhbnkgaW5mb3JtYXRpb24gaW4gdGhpcyBlbWFp
bCBpcnJlbGV2YW50IHRvIHRoZSBvZmZpY2lhbCBidXNpbmVzcyBvZiBOdXZvdG9uIHNoYWxsIGJl
IGRlZW1lZCBhcyBuZWl0aGVyIGdpdmVuIG5vciBlbmRvcnNlZCBieSBOdXZvdG9uLg0K

--_000_HK0PR03MB4068E6EB742A7088B92362A7AEA40HK0PR03MB4068apcp_
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hello Patrick:<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We are currently trying to enab=
le the BMC FW update over LPC on our platform (nuvoton&nbsp;BMC), but we en=
counter a problem with BIOS.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The BIOS engineer has reserved =
memory region as mmio space, but we couldn't see any data change in this re=
gion during run burn_my_bmc.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We have checked the BMC setting=
(in lpc_nuvoton.c and LDN SHM) but we couldn't identify the root cause of t=
his problem.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is there any settings we lost?<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Joseph<o:p></o:p></span></p>
</div>
<hr align=3D"center" width=3D"100%">
<span style=3D"font-size:12pt;line-height:0.7;font-family: 'Arial'; color:#=
808080">The privileged confidential information contained in this email is =
intended for use only by the addressees as indicated by the original sender=
 of this email. If you are not the
 addressee indicated in this email or are not responsible for delivery of t=
he email to such a person, please kindly reply to the sender indicating thi=
s fact and delete all copies of it from your computer and network server im=
mediately. Your cooperation is highly
 appreciated. It is advised that any unauthorized use of confidential infor=
mation of Nuvoton is strictly prohibited; and any information in this email=
 irrelevant to the official business of Nuvoton shall be deemed as neither =
given nor endorsed by Nuvoton.
</span>
</body>
</html>

--_000_HK0PR03MB4068E6EB742A7088B92362A7AEA40HK0PR03MB4068apcp_--
