Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 411191191C8
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 21:22:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XWgv5TzYzDqc5
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 07:22:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.75.109;
 helo=nam02-bl2-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="AjzDQCNL"; dkim-atps=neutral
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750109.outbound.protection.outlook.com [40.107.75.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XWf1257SzDqZF
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 07:20:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiUkvRcG9NPNBNfet9bFNK4YTTFU0SiOzVlFAz9LvGVf+N8dPqBVCqOdcw5JdlTndxPHNR33sYZTWPkrjhE1+aJRTr4u5NBEo5S1KUUgtWh9QPDkgjC4UkmhBiMq7lYegIT+Ds9Lq5p1E9N2xmSLY5wirGOqi0+jCDmszYJ6X/CmZyML6wMdKvshg9glUtpc3Hx/LvOA8VGsN9lU6+pnj8UOnNqGjaFiezopFNXfmyzVe8H0X8BZ4DqecJJpZoShKigTnNwia6F+wJtYMmlxEIxbQqUW3qlAiM0BAblzkY7yACU2Hh4DjS6pXfGrcJCe3MWqBozTkMQancLCTi2asQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdRztUpAn61VdXP8GtYhdVXACCeBdmqwUFEMGQ5J9pI=;
 b=LrWraRzWB8PRTjJ3QrgDe72iX8K4TBzMZyD94I02GuvoDu9cjfuXPKeP1GwSsBLCVruLHsK6gWE+MQlQk343tP0lhnp5MQOl8mkeWRygiLo8AaI9LVUYmROXStLvdL7suZtSdaXYqOvkpbgYr78Wo7xB3aLZbOG3qfaSjqAok66SIrApmMLn/FYxqNJTbIKTDSWWab4/z4jbW8cZ/O7ecMfXrWQE4PzR6bqygEg1orj+1MTDDpUU71xb2GDEokEH71g9gePd4XdNALn4DImRz/z+9M6z6eCbGU1gg0peUjqWV6BPMFKc7zIn9KG7Z6a03dN4LBkUyuBQ5PZrQbpxAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdRztUpAn61VdXP8GtYhdVXACCeBdmqwUFEMGQ5J9pI=;
 b=AjzDQCNLIgluOT0g/E0ZV3vzwaUxG3Zf8g0YXk73LNhsfGRCzb0REc0kP5Cal6T0VqguGKEI6maM6n5ebQKOLpuRdPhXxhB47ssuCqPp80W4fMsx1MJqCWdUi5Eyx2VctmHm4q+4odx0nDxp+dzPsyflck2BzbvztHWsQBW3SME=
Received: from DM6PR21MB1388.namprd21.prod.outlook.com (20.180.21.213) by
 DM6PR21MB1228.namprd21.prod.outlook.com (20.179.50.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.3; Tue, 10 Dec 2019 20:20:32 +0000
Received: from DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::a4df:ed8e:9432:60d]) by DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::a4df:ed8e:9432:60d%3]) with mapi id 15.20.2538.012; Tue, 10 Dec 2019
 20:20:32 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Canceled: Platform Telemetry workgroup- bi-weekly sync 
Thread-Topic: Platform Telemetry workgroup- bi-weekly sync 
Thread-Index: AdVyi2uS47ovS1jOTeK/p2xl45QzrA9C9h3A
Importance: high
X-Priority: 1
Date: Tue, 10 Dec 2019 20:20:32 +0000
Message-ID: <DM6PR21MB1388BA89B832B0FB6353C29DC85B0@DM6PR21MB1388.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-ms-exchange-calendar-series-instance-id: BAAAAIIA4AB0xbcQGoLgCAfkAQcwQKuQUHLVAQAAAAAAAAAAEAAAAG9ABZX2S+ZPmzvlyGFC47c=
x-originating-ip: [2001:4898:80e8:0:9985:2b7:2117:ac6f]
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4fde4275-37ab-4cb7-1ab9-08d77dae68a5
x-ms-traffictypediagnostic: DM6PR21MB1228:MeetingMessage
x-microsoft-antispam-prvs: <DM6PR21MB122818135B4669685515FDF8C85B0@DM6PR21MB1228.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(346002)(136003)(396003)(39860400002)(9763003)(189003)(199004)(66946007)(4743002)(64756008)(66446008)(2906002)(186003)(7416002)(81166006)(5660300002)(54906003)(66556008)(66476007)(8676002)(76116006)(8936002)(6916009)(71200400001)(55016002)(7696005)(4326008)(316002)(81156014)(9686003)(33656002)(478600001)(52536014)(4744005)(86362001)(10290500003)(8990500004)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR21MB1228;
 H:DM6PR21MB1388.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z7E1zO5JHDoNyx2LOaBxgbQReSDtRIY5/kHKt4ZtdDMOh4FxY9eKDjS/0NbqXNrLxoPoTN6pvuSjmzga4N1kXirYbNMJnjcoA0YUWFOlWun8lX2I0zIOrXVllfuhx0I4x/dvZ/xeT/5N1dUve1BOJkXpAVPE9QSiwJD4u/jxcVG5CeZu4o7D3dTSJSQxHTp7PGAojwRBx6opf3nagjBnSgmfPvOdxWaxE3y5pEjq5+qp3Lc8MJfXop6BGB6yJ2xTSJJ18ojTd6rafK4Cn0SpKpRQpkL98fy0MFjrZV7GMFW9EivDYxEY0qy6/qcybO0lFqmIuyk6G0IZgc/wVrOo+zA8eAGKEuSK5vgc5hleHGqK2KGHC67pwByYDqCCpYkfo59GPGZHCdzXqS1Wn3CVP6MjHSTkCpxMCnt/egxOH4s1BW4QbjE3PcIRB31eNg6s3I40EwXlo0F68+SPPfuQL0UXSt9Asnm8wJ2L0pFLh07lNHszJNv3blP5Ei7FBcwgC6SN0N/sUizXTTAzLuoz5MxgQgCv/J9/Jyql+h37T0Y=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR21MB1388BA89B832B0FB6353C29DC85B0DM6PR21MB1388namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fde4275-37ab-4cb7-1ab9-08d77dae68a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 20:20:32.8790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CEPyLqQzEuU5bAMhzi+oS1f/fWgQfbnOHq3L/t0P1BUCQ9IQ9H/Vfh7Ako5FhEzC5nT9mr4qTp7o088Q70F9vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR21MB1228
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
Cc: =?ks_c_5601-1987?B?V2lsbCBMaWFuZyAo1dnntfroKQ==?=
 <Will.Liang@quantatw.com>,
 =?ks_c_5601-1987?B?QnVkZHkgSHVhbmcgKPzc9Lj7+Ck=?= <Buddy.Huang@quantatw.com>,
 Dick Wilkins <Dick_Wilkins@phoenix.com>, Alan Mimms <Alan_Mimms@Jabil.com>,
 Michael Lim <youhour@us.ibm.com>, Reed B Frandsen <rfrandse@us.ibm.com>,
 Dong Wei <Dong.Wei@arm.com>, "Matuszczak, Piotr" <piotr.matuszczak@intel.com>,
 Amithash Prasad <amithash@fb.com>, Vijay Khemka <vijaykhemka@fb.com>,
 Saqib Khan <khansa@us.ibm.com>, Matt Chen/WYHQ/Wiwynn <Matt_Chen@wiwynn.com>,
 "Pandya, Anup" <anup.pandya@intel.com>, Jen Spatz <Jen.Spatz@ibm.com>,
 Tom Sand <trsand@us.ibm.com>, Luke Chen <luke_chen@aspeedtech.com>,
 Joe P Mulholland <jpmulhol@us.ibm.com>, "Tanous, Ed" <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_DM6PR21MB1388BA89B832B0FB6353C29DC85B0DM6PR21MB1388namp_
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64

Q2FuY2VsbGluZyAgTmV4dCBtZWV0aW5nICggMjR0aCBEZWMpICBkdWUgdG8gQ2hyaXN0bWFzIGhv
bGlkYXlzLiBXaWxsIHJlc2VuZCBuZXcgaW52aXRlIGluIDIwMjAuICBXZSB3aWxsIHJlc2NoZWR1
bGUgaXQgZm9yIDEyOjMwIFBNIFBTVC4NCg0KSGFwcHkgaG9saWRheXMNCg0KTmVlcmFqDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KSm9pbiBNaWNyb3NvZnQgVGVhbXMgTWVldGluZzxodHRwczov
L3RlYW1zLm1pY3Jvc29mdC5jb20vbC9tZWV0dXAtam9pbi8xOSUzYW1lZXRpbmdfTmpRNE9URm1O
ell0TlRsaE9TMDBOMlExTFRsa1l6VXROREJqWVdRME9HUTJPR0ppJTQwdGhyZWFkLnYyLzA/Y29u
dGV4dD0lN2IlMjJUaWQlMjIlM2ElMjI3MmY5ODhiZi04NmYxLTQxYWYtOTFhYi0yZDdjZDAxMWRi
NDclMjIlMmMlMjJPaWQlMjIlM2ElMjIxYzI5YzJmNy1kMzg2LTRjNWEtYTNiYy0wZWUxM2I0OGJj
NjUlMjIlN2Q+DQorMSAzMjMtODQ5LTQ4NzQ8dGVsOisxJTIwMzIzLTg0OS00ODc0LCw2MzYwNDk0
OSM+ICAgVW5pdGVkIFN0YXRlcywgTG9zIEFuZ2VsZXMgKFRvbGwpDQooODY2KSA2NzktOTk5NTx0
ZWw6KDg2NiklMjA2NzktOTk5NSwsNjM2MDQ5NDkjPiAgIChUb2xsLWZyZWUpDQpDb25mZXJlbmNl
IElEOiA2MzYgMDQ5IDQ5Iw0KTG9jYWwgbnVtYmVyczxodHRwczovL2RpYWxpbi50ZWFtcy5taWNy
b3NvZnQuY29tLzg1NTFmNGMxLWJlYTMtNDQxYS04NzM4LTY5YWE1MTdhOTFjNT9pZD02MzYwNDk0
OT4gfCBSZXNldCBQSU48aHR0cHM6Ly9teXNldHRpbmdzLmx5bmMuY29tL3BzdG5jb25mZXJlbmNp
bmc+IHwgTGVhcm4gbW9yZSBhYm91dCBUZWFtczxodHRwczovL2dvLm1pY3Jvc29mdC5jb20vZnds
aW5rLz9saW5raWQ9ODU3MjUwPiB8IE1lZXRpbmcgb3B0aW9uczxodHRwczovL3RlYW1zLm1pY3Jv
c29mdC5jb20vbWVldGluZ09wdGlvbnMvP29yZ2FuaXplcklkPTFjMjljMmY3LWQzODYtNGM1YS1h
M2JjLTBlZTEzYjQ4YmM2NSZ0ZW5hbnRJZD03MmY5ODhiZi04NmYxLTQxYWYtOTFhYi0yZDdjZDAx
MWRiNDcmdGhyZWFkSWQ9MTlfbWVldGluZ19OalE0T1RGbU56WXROVGxoT1MwME4yUTFMVGxrWXpV
dE5EQmpZV1EwT0dRMk9HSmlAdGhyZWFkLnYyJm1lc3NhZ2VJZD0wJmxhbmd1YWdlPWVuLVVTPg0K
Sm9pbiB3aXRoIGEgdmlkZW8gY29uZmVyZW5jaW5nIGRldmljZQ0KODEzODc4ODk2QHQucGxjbS52
YzxtYWlsdG86ODEzODc4ODk2QHQucGxjbS52Yz4gVlRDIENvbmZlcmVuY2UgSUQ6IDAxNzk4ODU5
MQ0KQWx0ZXJuYXRlIFZUQyBkaWFsaW5nIGluc3RydWN0aW9uczxodHRwczovL2RpYWxpbi5wbGNt
LnZjL3RlYW1zLz9rZXk9ODEzODc4ODk2JmNvbmY9MDE3OTg4NTkxPg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCg0K

--_000_DM6PR21MB1388BA89B832B0FB6353C29DC85B0DM6PR21MB1388namp_
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
	{font-family:Gulim;
	panose-1:2 11 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:"Segoe UI Semibold";
	panose-1:2 11 7 2 4 2 4 2 2 3;}
@font-face
	{font-family:"\@Gulim";
	panose-1:2 11 6 0 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:KO;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
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
<p class=3D"MsoNormal">Cancelling &nbsp;Next meeting ( 24<sup>th</sup> Dec)=
 &nbsp;due to Christmas holidays. Will resend new invite in 2020. &nbsp;<sp=
an style=3D"background:yellow;mso-highlight:yellow">We will reschedule it f=
or 12:30 PM PST</span>.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Happy holidays<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Neeraj<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:gray">_________________________=
_______________________________________________________</span>
<o:p></o:p></p>
<div>
<div style=3D"margin-top:.25in;margin-bottom:7.5pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://teams.microsoft.com/l/meetup-join/=
19%3ameeting_NjQ4OTFmNzYtNTlhOS00N2Q1LTlkYzUtNDBjYWQ0OGQ2OGJi%40thread.v2/0=
?context=3D%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22O=
id%22%3a%221c29c2f7-d386-4c5a-a3bc-0ee13b48bc65%22%7d" target=3D"_blank"><s=
pan style=3D"font-size:13.5pt;font-family:&quot;Segoe UI Semibold&quot;,san=
s-serif;color:#6264A7">Join
 Microsoft Teams Meeting</span></a> <o:p></o:p></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:&#43;1%20323-849-4874,,63604949# " tar=
get=3D"_blank"><span style=3D"font-size:10.5pt;color:#6264A7;text-decoratio=
n:none">&#43;1 323-849-4874</span></a>
</span><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424">&nbsp; United States, Los Angeles (Toll)
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:(866)%20679-9995,,63604949# " target=
=3D"_blank"><span style=3D"font-size:10.5pt;color:#6264A7;text-decoration:n=
one">(866) 679-9995</span></a>
</span><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424">&nbsp; (Toll-free)
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
</div>
<div style=3D"margin-top:7.5pt;margin-bottom:15.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Seg=
oe UI&quot;,sans-serif;color:#252424">Conference ID:
</span><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,san=
s-serif;color:#252424">636 049 49#
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:.25in">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://dialin.teams.microsoft.com/8551f4c=
1-bea3-441a-8738-69aa517a91c5?id=3D63604949" target=3D"_blank"><span style=
=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Local
 numbers</span></a> | <a href=3D"https://mysettings.lync.com/pstnconferenci=
ng" target=3D"_blank">
<span style=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Reset PI=
N</span></a> |
<a href=3D"https://go.microsoft.com/fwlink/?linkid=3D857250" target=3D"_bla=
nk"><span style=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Lear=
n more about Teams</span></a> |
<a href=3D"https://teams.microsoft.com/meetingOptions/?organizerId=3D1c29c2=
f7-d386-4c5a-a3bc-0ee13b48bc65&amp;tenantId=3D72f988bf-86f1-41af-91ab-2d7cd=
011db47&amp;threadId=3D19_meeting_NjQ4OTFmNzYtNTlhOS00N2Q1LTlkYzUtNDBjYWQ0O=
GQ2OGJi@thread.v2&amp;messageId=3D0&amp;language=3Den-US" target=3D"_blank"=
>
<span style=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Meeting =
options</span></a>
<o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#252424">Join with a video conferencing devic=
e
<o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span class=3D"MsoHyperlink"><span style=3D"font-siz=
e:9.0pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#6264A7;text-deco=
ration:none"><a href=3D"mailto:813878896@t.plcm.vc">813878896@t.plcm.vc</a>=
</span></span><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quo=
t;,sans-serif;color:#252424">
 VTC Conference ID: 017988591 <o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:15.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Seg=
oe UI&quot;,sans-serif;color:#252424"><a href=3D"https://dialin.plcm.vc/tea=
ms/?key=3D813878896&amp;conf=3D017988591"><span style=3D"color:#6264A7;text=
-decoration:none">Alternate VTC dialing instructions</span></a>
<o:p></o:p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:gray">_________________________=
_______________________________________________________</span>
<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR21MB1388BA89B832B0FB6353C29DC85B0DM6PR21MB1388namp_
Content-Type: text/calendar; charset="utf-8"; method=CANCEL
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpNRVRIT0Q6Q0FOQ0VMDQpQUk9ESUQ6TWljcm9zb2Z0IEV4Y2hhbmdl
IFNlcnZlciAyMDEwDQpWRVJTSU9OOjIuMA0KQkVHSU46VlRJTUVaT05FDQpUWklEOlBhY2lmaWMg
U3RhbmRhcmQgVGltZQ0KQkVHSU46U1RBTkRBUkQNCkRUU1RBUlQ6MTYwMTAxMDFUMDIwMDAwDQpU
Wk9GRlNFVEZST006LTA3MDANClRaT0ZGU0VUVE86LTA4MDANClJSVUxFOkZSRVE9WUVBUkxZO0lO
VEVSVkFMPTE7QllEQVk9MVNVO0JZTU9OVEg9MTENCkVORDpTVEFOREFSRA0KQkVHSU46REFZTElH
SFQNCkRUU1RBUlQ6MTYwMTAxMDFUMDIwMDAwDQpUWk9GRlNFVEZST006LTA4MDANClRaT0ZGU0VU
VE86LTA3MDANClJSVUxFOkZSRVE9WUVBUkxZO0lOVEVSVkFMPTE7QllEQVk9MlNVO0JZTU9OVEg9
Mw0KRU5EOkRBWUxJR0hUDQpFTkQ6VlRJTUVaT05FDQpCRUdJTjpWRVZFTlQNCk9SR0FOSVpFUjtD
Tj1OZWVyYWogTGFka2FuaTpNQUlMVE86bmVsYWRrQG1pY3Jvc29mdC5jb20NCkFUVEVOREVFO1JP
TEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPVRSVUU7Q049b3Bl
bmJtY0BsaQ0KIHN0cy5vemxhYnMub3JnOk1BSUxUTzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcN
CkFUVEVOREVFO1JPTEU9T1BULVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQ
PVRSVUU7Q049a3VueWlAZ29vZw0KIGxlLmNvbTpNQUlMVE86a3VueWlAZ29vZ2xlLmNvbQ0KQVRU
RU5ERUU7Uk9MRT1PUFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJV
RTtDTj1NYXR0IENoZW4vDQogV1lIUS9XaXd5bm46TUFJTFRPOk1hdHRfQ2hlbkB3aXd5bm4uY29t
DQpBVFRFTkRFRTtST0xFPU9QVC1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNW
UD1UUlVFO0NOPUFsYW4gTWltbXMNCiA6TUFJTFRPOkFsYW5fTWltbXNASmFiaWwuY29tDQpBVFRF
TkRFRTtST0xFPU9QVC1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVF
O0NOPVNhcWliIEtoYW4NCiA6TUFJTFRPOmtoYW5zYUB1cy5pYm0uY29tDQpBVFRFTkRFRTtST0xF
PU9QVC1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NOPUx1a2Ug
Q2hlbjoNCiBNQUlMVE86bHVrZV9jaGVuQGFzcGVlZHRlY2guY29tDQpBVFRFTkRFRTtST0xFPU9Q
VC1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NOPSJUYW5vdXMs
IEVkIg0KIDpNQUlMVE86ZWQudGFub3VzQGludGVsLmNvbQ0KQVRURU5ERUU7Uk9MRT1PUFQtUEFS
VElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJVRTtDTj0iTWF0dXN6Y3phaw0K
ICwgUGlvdHIiOk1BSUxUTzpwaW90ci5tYXR1c3pjemFrQGludGVsLmNvbQ0KQVRURU5ERUU7Uk9M
RT1PUFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJVRTtDTj1Eb25n
IFdlaTpNDQogQUlMVE86RG9uZy5XZWlAYXJtLmNvbQ0KQVRURU5ERUU7Uk9MRT1PUFQtUEFSVElD
SVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJVRTtDTj1EaWNrIFdpbGtpDQogbnM6
TUFJTFRPOkRpY2tfV2lsa2luc0BwaG9lbml4LmNvbQ0KQVRURU5ERUU7Uk9MRT1PUFQtUEFSVElD
SVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJVRTtDTj1Kb2UgUCBNdWxoDQogb2xs
YW5kOk1BSUxUTzpqcG11bGhvbEB1cy5pYm0uY29tDQpBVFRFTkRFRTtST0xFPU9QVC1QQVJUSUNJ
UEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NOPUJ1ZGR5IEh1YW4NCiBnICjp
u4PlpKnptLspOk1BSUxUTzpCdWRkeS5IdWFuZ0BxdWFudGF0dy5jb20NCkFUVEVOREVFO1JPTEU9
T1BULVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPVRSVUU7Q049UmVlZCBC
IEZyYQ0KIG5kc2VuOk1BSUxUTzpyZnJhbmRzZUB1cy5pYm0uY29tDQpBVFRFTkRFRTtST0xFPU9Q
VC1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NOPVZpamF5IEto
ZW0NCiBrYTpNQUlMVE86dmlqYXlraGVta2FAZmIuY29tDQpBVFRFTkRFRTtST0xFPU9QVC1QQVJU
SUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NOPU1pY2hhZWwgTGkNCiBt
Ok1BSUxUTzp5b3Vob3VyQHVzLmlibS5jb20NCkFUVEVOREVFO1JPTEU9T1BULVBBUlRJQ0lQQU5U
O1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPVRSVUU7Q049SmVuIFNwYXR6Og0KIE1BSUxUTzpK
ZW4uU3BhdHpAaWJtLmNvbQ0KQVRURU5ERUU7Uk9MRT1PUFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9
TkVFRFMtQUNUSU9OO1JTVlA9VFJVRTtDTj1BbWl0aGFzaCBQDQogcmFzYWQ6TUFJTFRPOmFtaXRo
YXNoQGZiLmNvbQ0KQVRURU5ERUU7Uk9MRT1PUFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMt
QUNUSU9OO1JTVlA9VFJVRTtDTj1Ub20gU2FuZDpNDQogQUlMVE86dHJzYW5kQHVzLmlibS5jb20N
CkFUVEVOREVFO1JPTEU9T1BULVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQ
PVRSVUU7Q049IlBhbmR5YSwgQW4NCiB1cCI6TUFJTFRPOmFudXAucGFuZHlhQGludGVsLmNvbQ0K
QVRURU5ERUU7Uk9MRT1PUFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9
VFJVRTtDTj1XaWxsIExpYW5nDQogICjmooHmsLjpiYkpOk1BSUxUTzpXaWxsLkxpYW5nQHF1YW50
YXR3LmNvbQ0KQVRURU5ERUU7Uk9MRT1PUFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNU
SU9OO1JTVlA9VFJVRTtDTj1DaHJpcyBBdXN0DQogZW46TUFJTFRPOmF1c3RlbmNAdXMuaWJtLmNv
bQ0KREVTQ1JJUFRJT047TEFOR1VBR0U9ZW4tVVM6Q2FuY2VsbGluZyAgTmV4dCBtZWV0aW5nICgg
MjR0aCBEZWMpICBkdWUgdG8gQ2hyDQogaXN0bWFzIGhvbGlkYXlzLiBXaWxsIHJlc2VuZCBuZXcg
aW52aXRlIGluIDIwMjAuICBXZSB3aWxsIHJlc2NoZWR1bGUgaXQgZm8NCiByIDEyOjMwIFBNIFBT
VC5cblxuSGFwcHkgaG9saWRheXNcblxuTmVlcmFqXG5fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXw0KIF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X1xuSm9pbiBNaWNyb3NvZnQgVGVhbXMgDQogTWVldGluZzxodHRwczovL3RlYW1zLm1pY3Jvc29m
dC5jb20vbC9tZWV0dXAtam9pbi8xOSUzYW1lZXRpbmdfTmpRNE9URm1OelkNCiB0TlRsaE9TMDBO
MlExTFRsa1l6VXROREJqWVdRME9HUTJPR0ppJTQwdGhyZWFkLnYyLzA/Y29udGV4dD0lN2IlMjJU
aWQlMjIlMw0KIGElMjI3MmY5ODhiZi04NmYxLTQxYWYtOTFhYi0yZDdjZDAxMWRiNDclMjIlMmMl
MjJPaWQlMjIlM2ElMjIxYzI5YzJmNy1kMzg2DQogLTRjNWEtYTNiYy0wZWUxM2I0OGJjNjUlMjIl
N2Q+XG4rMSAzMjMtODQ5LTQ4NzQ8dGVsOisxJTIwMzIzLTg0OS00ODc0XCxcLDYNCiAzNjA0OTQ5
Iz4gICBVbml0ZWQgU3RhdGVzXCwgTG9zIEFuZ2VsZXMgKFRvbGwpXG4oODY2KSA2NzktOTk5NTx0
ZWw6KDg2NiklMg0KIDA2NzktOTk5NVwsXCw2MzYwNDk0OSM+ICAgKFRvbGwtZnJlZSlcbkNvbmZl
cmVuY2UgSUQ6IDYzNiAwNDkgNDkjXG5Mb2NhbCBuDQogdW1iZXJzPGh0dHBzOi8vZGlhbGluLnRl
YW1zLm1pY3Jvc29mdC5jb20vODU1MWY0YzEtYmVhMy00NDFhLTg3MzgtNjlhYTUxN2ENCiA5MWM1
P2lkPTYzNjA0OTQ5PiB8IFJlc2V0IFBJTjxodHRwczovL215c2V0dGluZ3MubHluYy5jb20vcHN0
bmNvbmZlcmVuY2luZw0KID4gfCBMZWFybiBtb3JlIGFib3V0IFRlYW1zPGh0dHBzOi8vZ28ubWlj
cm9zb2Z0LmNvbS9md2xpbmsvP2xpbmtpZD04NTcyNTA+DQogIHwgTWVldGluZyBvcHRpb25zPGh0
dHBzOi8vdGVhbXMubWljcm9zb2Z0LmNvbS9tZWV0aW5nT3B0aW9ucy8/b3JnYW5pemVySWQNCiA9
MWMyOWMyZjctZDM4Ni00YzVhLWEzYmMtMGVlMTNiNDhiYzY1JnRlbmFudElkPTcyZjk4OGJmLTg2
ZjEtNDFhZi05MWFiLTJkNw0KIGNkMDExZGI0NyZ0aHJlYWRJZD0xOV9tZWV0aW5nX05qUTRPVEZt
TnpZdE5UbGhPUzAwTjJRMUxUbGtZelV0TkRCallXUTBPR1EyDQogT0dKaUB0aHJlYWQudjImbWVz
c2FnZUlkPTAmbGFuZ3VhZ2U9ZW4tVVM+XG5Kb2luIHdpdGggYSB2aWRlbyBjb25mZXJlbmNpbmcN
CiAgZGV2aWNlXG44MTM4Nzg4OTZAdC5wbGNtLnZjPG1haWx0bzo4MTM4Nzg4OTZAdC5wbGNtLnZj
PiBWVEMgQ29uZmVyZW5jZSBJRA0KIDogMDE3OTg4NTkxXG5BbHRlcm5hdGUgVlRDIGRpYWxpbmcg
aW5zdHJ1Y3Rpb25zPGh0dHBzOi8vZGlhbGluLnBsY20udmMvdGVhDQogbXMvP2tleT04MTM4Nzg4
OTYmY29uZj0wMTc5ODg1OTE+XG5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX1xuXG4NClVJRDow
NDAwMDAwMDgyMDBFMDAwNzRDNUI3MTAxQTgyRTAwODAwMDAwMDAwMzA0MEFCOTA1MDcyRDUwMTAw
MDAwMDAwMDAwMDAwMA0KIDAxMDAwMDAwMDZGNDAwNTk1RjY0QkU2NEY5QjNCRTVDODYxNDJFM0I3
DQpSRUNVUlJFTkNFLUlEO1RaSUQ9UGFjaWZpYyBTdGFuZGFyZCBUaW1lOjIwMjAwMTA3VDA5MzAw
MA0KU1VNTUFSWTtMQU5HVUFHRT1lbi1VUzpDYW5jZWxlZDogUGxhdGZvcm0gVGVsZW1ldHJ5IHdv
cmtncm91cC0gYmktd2Vla2x5IHN5DQogbmMgDQpEVFNUQVJUO1RaSUQ9UGFjaWZpYyBTdGFuZGFy
ZCBUaW1lOjIwMjAwMTA3VDA5MzAwMA0KRFRFTkQ7VFpJRD1QYWNpZmljIFN0YW5kYXJkIFRpbWU6
MjAyMDAxMDdUMTAzMDAwDQpDTEFTUzpQVUJMSUMNClBSSU9SSVRZOjENCkRUU1RBTVA6MjAxOTEy
MTBUMjAyMDMwWg0KVFJBTlNQOlRSQU5TUEFSRU5UDQpTVEFUVVM6Q0FOQ0VMTEVEDQpTRVFVRU5D
RToyDQpMT0NBVElPTjtMQU5HVUFHRT1lbi1VUzpNaWNyb3NvZnQgVGVhbXMgTWVldGluZw0KWC1N
SUNST1NPRlQtQ0RPLUFQUFQtU0VRVUVOQ0U6Mg0KWC1NSUNST1NPRlQtQ0RPLU9XTkVSQVBQVElE
Oi0xMTMwOTE1ODY5DQpYLU1JQ1JPU09GVC1DRE8tQlVTWVNUQVRVUzpGUkVFDQpYLU1JQ1JPU09G
VC1DRE8tSU5URU5ERURTVEFUVVM6RlJFRQ0KWC1NSUNST1NPRlQtQ0RPLUFMTERBWUVWRU5UOkZB
TFNFDQpYLU1JQ1JPU09GVC1DRE8tSU1QT1JUQU5DRToyDQpYLU1JQ1JPU09GVC1DRE8tSU5TVFRZ
UEU6Mw0KWC1NSUNST1NPRlQtU0tZUEVURUFNU01FRVRJTkdVUkw6aHR0cHM6Ly90ZWFtcy5taWNy
b3NvZnQuY29tL2wvbWVldHVwLWpvaW4vDQogMTklM2FtZWV0aW5nX05qUTRPVEZtTnpZdE5UbGhP
UzAwTjJRMUxUbGtZelV0TkRCallXUTBPR1EyT0dKaSU0MHRocmVhZC52Mi8NCiAwP2NvbnRleHQ9
JTdiJTIyVGlkJTIyJTNhJTIyNzJmOTg4YmYtODZmMS00MWFmLTkxYWItMmQ3Y2QwMTFkYjQ3JTIy
JTJjJTIyTw0KIGlkJTIyJTNhJTIyMWMyOWMyZjctZDM4Ni00YzVhLWEzYmMtMGVlMTNiNDhiYzY1
JTIyJTdkDQpYLU1JQ1JPU09GVC1TQ0hFRFVMSU5HU0VSVklDRVVQREFURVVSTDpodHRwczovL3Nj
aGVkLnNlcnZpY2VzLnNreXBlLm5ldC90ZWENCiBtcy83MmY5ODhiZi04NmYxLTQxYWYtOTFhYi0y
ZDdjZDAxMWRiNDcvMWMyOWMyZjctZDM4Ni00YzVhLWEzYmMtMGVlMTNiNDhiYw0KIDY1LzE5X21l
ZXRpbmdfTmpRNE9URm1Oell0TlRsaE9TMDBOMlExTFRsa1l6VXROREJqWVdRME9HUTJPR0ppQHRo
cmVhZC52Mi8wDQpYLU1JQ1JPU09GVC1TS1lQRVRFQU1TUFJPUEVSVElFUzp7ImNpZCI6IjE5Om1l
ZXRpbmdfTmpRNE9URm1Oell0TlRsaE9TMDBOMlENCiAxTFRsa1l6VXROREJqWVdRME9HUTJPR0pp
QHRocmVhZC52MiJcLCJwcml2YXRlIjp0cnVlXCwidHlwZSI6MFwsIm1pZCI6MFwsIg0KIHJpZCI6
MFwsInVpZCI6bnVsbH0NClgtTUlDUk9TT0ZULU9OTElORU1FRVRJTkdFWFRFUk5BTExJTks6DQpY
LU1JQ1JPU09GVC1PTkxJTkVNRUVUSU5HQ09ORkxJTks6Y29uZjpzaXA6bmVsYWRrQG1pY3Jvc29m
dC5jb21cO2dydXVcO29wYXENCiB1ZT1hcHA6Y29uZjpmb2N1czppZDp0ZWFtczoyOjAhMTk6bWVl
dGluZ19OalE0T1RGbU56WXROVGxoT1MwME4yUTFMVGxrWXpVdA0KIE5EQmpZV1EwT0dRMk9HSmkt
dGhyZWFkLnYyITFjMjljMmY3ZDM4NjRjNWFhM2JjMGVlMTNiNDhiYzY1ITcyZjk4OGJmODZmMTQx
DQogYWY5MWFiMmQ3Y2QwMTFkYjQ3DQpYLU1JQ1JPU09GVC1PTkxJTkVNRUVUSU5HSU5GT1JNQVRJ
T046eyJPbmxpbmVNZWV0aW5nUHJvdmlkZXIiOjN9DQpYLU1JQ1JPU09GVC1ET05PVEZPUldBUkRN
RUVUSU5HOkZBTFNFDQpYLU1JQ1JPU09GVC1ESVNBTExPVy1DT1VOVEVSOkZBTFNFDQpFTkQ6VkVW
RU5UDQpFTkQ6VkNBTEVOREFSDQo=

--_000_DM6PR21MB1388BA89B832B0FB6353C29DC85B0DM6PR21MB1388namp_--
