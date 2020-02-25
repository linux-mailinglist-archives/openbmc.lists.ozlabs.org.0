Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4317F16F0D4
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 22:04:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Rryl3d0FzDqYb
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 08:04:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.237.110;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=HHaEOjkk; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2110.outbound.protection.outlook.com [40.107.237.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Rrxs4kglzDqS6
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 08:03:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrCY4olTj0Yz/nAiZRzc1CSSmQCsdhXsKtnN7QupY3E+sSkvQOD/kHTuvQb3126TZPPE7mYHhoCUiOU74M23xEO6fgTEcU2qnLz5NF60q1tWDmn2NAD+SAjU/lK4BQuewbq3N+AXH6ryLUT1kW69zE5ydssOud1ZS0Xv6TBMbm9tsy6/BNgmgb/TbJ87F2uu4QsBUXFgwAGEyIxBCL9cVUz5NPrigRGbMAZy0Vsz5y4DIREBL61tEz9VyVGdeTwmaEVbkU78Tw/C3LYcIwZsqhDnKAIbWaDb988ILexqi+1C7tmgfd6r8E27XSGFufLiEK2QsKZwl82SMB3U+qG96w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLYDIx/Tvw41wTSqeAmp+XOApEStsN94POLUqiwt1i0=;
 b=J9lc1DD0/GDATZLQ5vF39zftJZXdAigcPD8CpuWkhBhoJ/TfZq4rGZDCoVRQQ+eeUjc3wSOBhFjdJkRpcvw8o4xxFb2CGpu02sK/tltL2Bqr6pVEn286j3H1I09g/WMqAKTuwe0VxA5VGRoUAafiASKouBfOdGJuX7Cmzkdoq7URxGqDErO5T1UZPNsVz2397aNCJnRo0IRPTqdOvNv4C0ItoEqaQ/sgfDTd7AG+bx4PsKfV5lHNKAUw2EiuLR/xC6GHwRL0MMAjvVL/Vsxktj1uBLmKIDATRmeOQtegPPmm1fKqZLTMAjd9SHp2VcMS2RamwZtKm1KI95nEbnu1Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLYDIx/Tvw41wTSqeAmp+XOApEStsN94POLUqiwt1i0=;
 b=HHaEOjkk1MMKlZ+K9u/m46ZbMJu7utMghZJpwm33WgBPh3RbJDUTt2rVATgFI+pOr7xjPSn5OQQPb/MIwEYj5Biytm3EgXu2OZNDwasHv1P4Z0tWSZSupvAWjUl0lPoMJ/JmWSGkHI2QZuk/GrmxS2jirOlxqjY4psdxpvvjmQQ=
Received: from CH2PR21MB1510.namprd21.prod.outlook.com (2603:10b6:610:8e::7)
 by CH2PR21MB1430.namprd21.prod.outlook.com (2603:10b6:610:80::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.1; Tue, 25 Feb
 2020 21:03:22 +0000
Received: from CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::e4d1:6fc0:16e9:ae03]) by CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::e4d1:6fc0:16e9:ae03%7]) with mapi id 15.20.2793.003; Tue, 25 Feb 2020
 21:03:22 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Matuszczak, Piotr"
 <piotr.matuszczak@intel.com>, "kunyi@google.com" <kunyi@google.com>,
 "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>
Subject: Canceled: OpenBMC Platform telemetry and health monitoring Work Group
Thread-Topic: OpenBMC Platform telemetry and health monitoring Work Group
Thread-Index: AdXKQcbfGBfhoAISS+WO4z/Ia3YwmQh3Tp3w
Importance: high
X-Priority: 1
Date: Tue, 25 Feb 2020 21:03:22 +0000
Message-ID: <CH2PR21MB1510BEEC32F2ADA95E8A13EAC8ED0@CH2PR21MB1510.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-ms-exchange-calendar-series-instance-id: BAAAAIIA4AB0xbcQGoLgCAAAAACAzHG//snVAQAAAAAAAAAAEAAAAN7QP/e8AxNEtN899o+9dnM=
x-originating-ip: [2001:4898:80e8:1:d215:b804:cab9:9b16]
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b4a3f501-bc4b-4b06-adb9-08d7ba3625f9
x-ms-traffictypediagnostic: CH2PR21MB1430:MeetingMessage|CH2PR21MB1430:MeetingMessage
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-microsoft-antispam-prvs: <CH2PR21MB1430950455D2EA9D8BAD9472C8ED0@CH2PR21MB1430.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-forefront-prvs: 0324C2C0E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(199004)(189003)(478600001)(54906003)(81156014)(4326008)(316002)(110136005)(8936002)(81166006)(8676002)(55016002)(71200400001)(7696005)(10290500003)(86362001)(4744005)(9686003)(66946007)(186003)(8990500004)(76116006)(33656002)(64756008)(52536014)(5660300002)(6506007)(66476007)(66556008)(66446008)(2906002)(7416002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR21MB1430;
 H:CH2PR21MB1510.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eCz/Xwmpc0/glITCbm3r+Ko1TuAAatRDDo9YUZ1l6Q0knB9RJTLkF9kDXaBqm9EpJL8nsF8wlQ3x+GLUWCXnH+WEjhHysYKfl/p19x+G1FrP9SyGQVdlGDZcmPC9myoP4PLHt4Slz6QKzgkoXIUJi7ywTQNKLssSlvgVjVmfp3AtE2lJ5/gTLQ6DCZ56Mqpvy3N0Vgcu4jnHG4MxX2KSMSrcHm8ElOM5P9NHpX7qk2mUjr+2D/n5EsFYORx9K4ZiGkEBY0h9CG1pv2DTy0REzXYRpA1s4wqVihUljMCtsQkpHxzcSCClFSukIoii5HtvgBPuWbZwDhqvTHuFHNmOpzodEMs3ZNPh7rNMPSdZAU4xDCNXqL0sEk1Zw1qmxayhxhMjLaYS/V4TBUgvTMZEq6vc2qB5mfLvJVI0+TsTw+mJIOweIaIr8X/oIBpmYj2LJZ9Bxh1CtFrFAzGKiKQV7DUFQRdKogLIBIST1yUGfTfujlFpQB7vO4tGyoD3qisbOVu3PesaCQK5IoB6Z+TjBg==
x-ms-exchange-antispam-messagedata: YeT1qv+EtUy7YwbUtgaMPmJQrw3H9T6F908dA2FIuVbSle+SzEPsxIWBzLxcGnnFa9S6f/Fe6i+m3ub27fLlckxht2EFFRfpsxK7FzJSKU0nvZXNrrLbkkiUV9VqBAHttVZEva033Wtn1Fwfh06T/NpYPPtObAlxCCzErB+wvp5Xp8wGNXkLgb8Pb+ZXIKNMlWP4PNC8Wh4aWgBIGRPEsA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_CH2PR21MB1510BEEC32F2ADA95E8A13EAC8ED0CH2PR21MB1510namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a3f501-bc4b-4b06-adb9-08d7ba3625f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2020 21:03:22.2373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ShMa3ZKl746exyJin+DJie1Clh+/L+ONPQH1j1IoVTqDJBY39fW6BnJdRDhPDzCdvt1WwbIGBhwFh7VS473WhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR21MB1430
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
Cc: Jeff Booher-Kaeding <Jeff.Booher-Kaeding@arm.com>,
 Dick_Wilkins <Dick_Wilkins@phoenix.com>, Michael Lim <youhour@us.ibm.com>,
 Forrest Clark <forrest@iolo.com>, Matt Chen/WYHQ/Wiwynn <Matt_Chen@wiwynn.com>,
 "Joshua_Giles@Dell.com" <Joshua_Giles@Dell.com>, "Ren,
 Zhikui" <zhikui.ren@intel.com>, Tom Sand <trsand@us.ibm.com>,
 Dong Wei <Dong.Wei@arm.com>, Vijay Khemka <vijaykhemka@fb.com>,
 "rhanley@google.com" <rhanley@google.com>, Phil Noh <Phil_Noh@Phoenix.com>,
 Luke Chen <luke_chen@aspeedtech.com>,
 Brad Chou <bradc@hyvedesignsolutions.com>,
 Justin Thaler <thalerj@linux.vnet.ibm.com>, "Ambrozewicz,
 Adrian" <adrian.ambrozewicz@intel.com>, Camvan T Nguyen <ctnguyen@us.ibm.com>,
 Saqib Khan <khansa@us.ibm.com>,
 =?ks_c_5601-1987?B?QnVkZHkgSHVhbmcgKPzc9Lj7+Ck=?= <Buddy.Huang@quantatw.com>,
 Joe P Mulholland <jpmulhol@us.ibm.com>, Reed B Frandsen <rfrandse@us.ibm.com>,
 James Morse <James.Morse@arm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_CH2PR21MB1510BEEC32F2ADA95E8A13EAC8ED0CH2PR21MB1510namp_
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64

V2Ugd2lsbCBoYXZlIGRpc2N1c3Npb25zIG9uIGVtYWlsLg0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXw0KSm9pbiBNaWNyb3NvZnQgVGVhbXMgTWVldGluZzxodHRwczovL3RlYW1zLm1pY3Jvc29m
dC5jb20vbC9tZWV0dXAtam9pbi8xOSUzYW1lZXRpbmdfTWpGalpURTVaak10TXpVeE55MDBabVE1
TFdFMU1ESXRZV00yTVRSaFpURXlPRGhsJTQwdGhyZWFkLnYyLzA/Y29udGV4dD0lN2IlMjJUaWQl
MjIlM2ElMjI3MmY5ODhiZi04NmYxLTQxYWYtOTFhYi0yZDdjZDAxMWRiNDclMjIlMmMlMjJPaWQl
MjIlM2ElMjIxYzI5YzJmNy1kMzg2LTRjNWEtYTNiYy0wZWUxM2I0OGJjNjUlMjIlN2Q+DQorMSAz
MjMtODQ5LTQ4NzQ8dGVsOisxJTIwMzIzLTg0OS00ODc0LCw3MTAwMzE0MzMjPiAgIFVuaXRlZCBT
dGF0ZXMsIExvcyBBbmdlbGVzIChUb2xsKQ0KKDg2NikgNjc5LTk5OTU8dGVsOig4NjYpJTIwNjc5
LTk5OTUsLDcxMDAzMTQzMyM+ICAgKFRvbGwtZnJlZSkNCkNvbmZlcmVuY2UgSUQ6IDcxMCAwMzEg
NDMzIw0KTG9jYWwgbnVtYmVyczxodHRwczovL2RpYWxpbi50ZWFtcy5taWNyb3NvZnQuY29tLzg1
NTFmNGMxLWJlYTMtNDQxYS04NzM4LTY5YWE1MTdhOTFjNT9pZD03MTAwMzE0MzM+IHwgUmVzZXQg
UElOPGh0dHBzOi8vbXlzZXR0aW5ncy5seW5jLmNvbS9wc3RuY29uZmVyZW5jaW5nPiB8IExlYXJu
IG1vcmUgYWJvdXQgVGVhbXM8aHR0cHM6Ly9ha2EubXMvSm9pblRlYW1zTWVldGluZz4gfCBNZWV0
aW5nIG9wdGlvbnM8aHR0cHM6Ly90ZWFtcy5taWNyb3NvZnQuY29tL21lZXRpbmdPcHRpb25zLz9v
cmdhbml6ZXJJZD0xYzI5YzJmNy1kMzg2LTRjNWEtYTNiYy0wZWUxM2I0OGJjNjUmdGVuYW50SWQ9
NzJmOTg4YmYtODZmMS00MWFmLTkxYWItMmQ3Y2QwMTFkYjQ3JnRocmVhZElkPTE5X21lZXRpbmdf
TWpGalpURTVaak10TXpVeE55MDBabVE1TFdFMU1ESXRZV00yTVRSaFpURXlPRGhsQHRocmVhZC52
MiZtZXNzYWdlSWQ9MCZsYW5ndWFnZT1lbi1VUz4NCkpvaW4gd2l0aCBhIHZpZGVvIGNvbmZlcmVu
Y2luZyBkZXZpY2UNCjgxMzg3ODg5NkB0LnBsY20udmM8bWFpbHRvOjgxMzg3ODg5NkB0LnBsY20u
dmM+IFZUQyBDb25mZXJlbmNlIElEOiAwMTQ4OTY0NzU3DQpBbHRlcm5hdGUgVlRDIGRpYWxpbmcg
aW5zdHJ1Y3Rpb25zPGh0dHBzOi8vZGlhbGluLnBsY20udmMvdGVhbXMvP2tleT04MTM4Nzg4OTYm
Y29uZj0wMTQ4OTY0NzU3Pg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCg0K

--_000_CH2PR21MB1510BEEC32F2ADA95E8A13EAC8ED0CH2PR21MB1510namp_
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
<p class=3D"MsoNormal">We will have discussions on email.&nbsp; <o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:gray">_________________________=
_______________________________________________________</span>
<o:p></o:p></p>
<div>
<div style=3D"margin-top:.25in;margin-bottom:7.5pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://teams.microsoft.com/l/meetup-join/=
19%3ameeting_MjFjZTE5ZjMtMzUxNy00ZmQ5LWE1MDItYWM2MTRhZTEyODhl%40thread.v2/0=
?context=3D%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22O=
id%22%3a%221c29c2f7-d386-4c5a-a3bc-0ee13b48bc65%22%7d" target=3D"_blank"><s=
pan style=3D"font-size:13.5pt;font-family:&quot;Segoe UI Semibold&quot;,san=
s-serif;color:#6264A7">Join
 Microsoft Teams Meeting</span></a> <o:p></o:p></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:&#43;1%20323-849-4874,,710031433# " ta=
rget=3D"_blank"><span style=3D"font-size:10.5pt;color:#6264A7;text-decorati=
on:none">&#43;1 323-849-4874</span></a>
</span><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424">&nbsp; United States, Los Angeles (Toll)
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:(866)%20679-9995,,710031433# " target=
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
s-serif;color:#252424">710 031 433#
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:.25in">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://dialin.teams.microsoft.com/8551f4c=
1-bea3-441a-8738-69aa517a91c5?id=3D710031433" target=3D"_blank"><span style=
=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Local
 numbers</span></a> | <a href=3D"https://mysettings.lync.com/pstnconferenci=
ng" target=3D"_blank">
<span style=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Reset PI=
N</span></a> |
<a href=3D"https://aka.ms/JoinTeamsMeeting" target=3D"_blank"><span style=
=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Learn more about Te=
ams</span></a> |
<a href=3D"https://teams.microsoft.com/meetingOptions/?organizerId=3D1c29c2=
f7-d386-4c5a-a3bc-0ee13b48bc65&amp;tenantId=3D72f988bf-86f1-41af-91ab-2d7cd=
011db47&amp;threadId=3D19_meeting_MjFjZTE5ZjMtMzUxNy00ZmQ5LWE1MDItYWM2MTRhZ=
TEyODhl@thread.v2&amp;messageId=3D0&amp;language=3Den-US" target=3D"_blank"=
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
 VTC Conference ID: 0148964757 <o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:15.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Seg=
oe UI&quot;,sans-serif;color:#252424"><a href=3D"https://dialin.plcm.vc/tea=
ms/?key=3D813878896&amp;conf=3D0148964757"><span style=3D"color:#6264A7;tex=
t-decoration:none">Alternate VTC dialing instructions</span></a>
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

--_000_CH2PR21MB1510BEEC32F2ADA95E8A13EAC8ED0CH2PR21MB1510namp_
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
Tj1OZWVyYWogTGFka2FuaTptYWlsdG86bmVsYWRrQG1pY3Jvc29mdC5jb20NCkFUVEVOREVFO1JP
TEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPVRSVUU7Q049b3Bl
bmJtY0BsaQ0KIHN0cy5vemxhYnMub3JnOm1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcN
CkFUVEVOREVFO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQ
PVRSVUU7Q049Ik1hdHVzemN6YWsNCiAsIFBpb3RyIjptYWlsdG86cGlvdHIubWF0dXN6Y3pha0Bp
bnRlbC5jb20NCkFUVEVOREVFO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFD
VElPTjtSU1ZQPVRSVUU7Q049a3VueWlAZ29vZw0KIGxlLmNvbTptYWlsdG86a3VueWlAZ29vZ2xl
LmNvbQ0KQVRURU5ERUU7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9O
O1JTVlA9VFJVRTtDTj1QYXVsLlZhbmNpDQogbEBkZWxsLmNvbTptYWlsdG86UGF1bC5WYW5jaWxA
ZGVsbC5jb20NCkFUVEVOREVFO1JPTEU9T1BULVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFD
VElPTjtSU1ZQPVRSVUU7Q049IlJlbiwgWmhpa3UNCiBpIjptYWlsdG86emhpa3VpLnJlbkBpbnRl
bC5jb20NCkFUVEVOREVFO1JPTEU9T1BULVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElP
TjtSU1ZQPVRSVUU7Q049Sm9lIFAgTXVsaA0KIG9sbGFuZDptYWlsdG86anBtdWxob2xAdXMuaWJt
LmNvbQ0KQVRURU5ERUU7Uk9MRT1PUFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9O
O1JTVlA9VFJVRTtDTj1NaWNoYWVsIExpDQogbTptYWlsdG86eW91aG91ckB1cy5pYm0uY29tDQpB
VFRFTkRFRTtST0xFPU9QVC1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1U
UlVFO0NOPXJoYW5sZXlAZ28NCiBvZ2xlLmNvbTptYWlsdG86cmhhbmxleUBnb29nbGUuY29tDQpB
VFRFTkRFRTtST0xFPU9QVC1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1U
UlVFO0NOPUNhbXZhbiBUIE4NCiBndXllbjptYWlsdG86Y3RuZ3V5ZW5AdXMuaWJtLmNvbQ0KQVRU
RU5ERUU7Uk9MRT1PUFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJV
RTtDTj1DaHJpcyBBdXN0DQogZW46bWFpbHRvOmF1c3RlbmNAdXMuaWJtLmNvbQ0KQVRURU5ERUU7
Uk9MRT1PUFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJVRTtDTj1K
dXN0aW4gVGhhDQogbGVyOm1haWx0bzp0aGFsZXJqQGxpbnV4LnZuZXQuaWJtLmNvbQ0KQVRURU5E
RUU7Uk9MRT1PUFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJVRTtD
Tj1KZWZmIEJvb2hlDQogci1LYWVkaW5nOm1haWx0bzpKZWZmLkJvb2hlci1LYWVkaW5nQGFybS5j
b20NCkFUVEVOREVFO1JPTEU9T1BULVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtS
U1ZQPVRSVUU7Q049Sm9zaHVhX0dpbA0KIGVzQERlbGwuY29tOm1haWx0bzpKb3NodWFfR2lsZXNA
RGVsbC5jb20NCkFUVEVOREVFO1JPTEU9T1BULVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFD
VElPTjtSU1ZQPVRSVUU7Q049UmVlZCBCIEZyYQ0KIG5kc2VuOm1haWx0bzpyZnJhbmRzZUB1cy5p
Ym0uY29tDQpBVFRFTkRFRTtST0xFPU9QVC1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJ
T047UlNWUD1UUlVFO0NOPU1hdHQgQ2hlbi8NCiBXWUhRL1dpd3lubjptYWlsdG86TWF0dF9DaGVu
QHdpd3lubi5jb20NCkFUVEVOREVFO1JPTEU9T1BULVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURT
LUFDVElPTjtSU1ZQPVRSVUU7Q049THVrZSBDaGVuOg0KIG1haWx0bzpsdWtlX2NoZW5AYXNwZWVk
dGVjaC5jb20NCkFUVEVOREVFO1JPTEU9T1BULVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFD
VElPTjtSU1ZQPVRSVUU7Q049QnJhZCBDaG91Og0KIG1haWx0bzpicmFkY0BoeXZlZGVzaWduc29s
dXRpb25zLmNvbQ0KQVRURU5ERUU7Uk9MRT1PUFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMt
QUNUSU9OO1JTVlA9VFJVRTtDTj1Eb25nIFdlaTptDQogYWlsdG86RG9uZy5XZWlAYXJtLmNvbQ0K
QVRURU5ERUU7Uk9MRT1PUFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9
VFJVRTtDTj1CdWRkeSBIdWFuDQogZyAo6buD5aSp6bS7KTptYWlsdG86QnVkZHkuSHVhbmdAcXVh
bnRhdHcuY29tDQpBVFRFTkRFRTtST0xFPU9QVC1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1B
Q1RJT047UlNWUD1UUlVFO0NOPVRvbSBTYW5kOm0NCiBhaWx0bzp0cnNhbmRAdXMuaWJtLmNvbQ0K
QVRURU5ERUU7Uk9MRT1PUFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9
VFJVRTtDTj1TYXFpYiBLaGFuDQogOm1haWx0bzpraGFuc2FAdXMuaWJtLmNvbQ0KQVRURU5ERUU7
Uk9MRT1PUFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJVRTtDTj1W
aWpheSBLaGVtDQoga2E6bWFpbHRvOnZpamF5a2hlbWthQGZiLmNvbQ0KQVRURU5ERUU7Uk9MRT1P
UFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJVRTtDTj1EaWNrX1dp
bGtpDQogbnM6bWFpbHRvOkRpY2tfV2lsa2luc0BwaG9lbml4LmNvbQ0KQVRURU5ERUU7Uk9MRT1P
UFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJVRTtDTj1Gb3JyZXN0
IENsDQogYXJrOm1haWx0bzpmb3JyZXN0QGlvbG8uY29tDQpBVFRFTkRFRTtST0xFPU9QVC1QQVJU
SUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NOPVBoaWwgTm9oOm0NCiBh
aWx0bzpQaGlsX05vaEBQaG9lbml4LmNvbQ0KQVRURU5ERUU7Uk9MRT1PUFQtUEFSVElDSVBBTlQ7
UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJVRTtDTj0iQW1icm96ZXdpYw0KIHosIEFkcmlh
biI6bWFpbHRvOmFkcmlhbi5hbWJyb3pld2ljekBpbnRlbC5jb20NCkFUVEVOREVFO1JPTEU9T1BU
LVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPVRSVUU7Q049SmFtZXMgTW9y
cw0KIGU6bWFpbHRvOkphbWVzLk1vcnNlQGFybS5jb20NCkRFU0NSSVBUSU9OO0xBTkdVQUdFPWVu
LVVTOldlIHdpbGwgaGF2ZSBkaXNjdXNzaW9ucyBvbiBlbWFpbC5cblxuX19fX19fX19fXw0KIF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19cbkpvDQogaW4gTWljcm9zb2Z0IFRlYW1zIE1lZXRpbmc8aHR0cHM6Ly90ZWFt
cy5taWNyb3NvZnQuY29tL2wvbWVldHVwLWpvaW4vMTklM2ENCiBtZWV0aW5nX01qRmpaVEU1WmpN
dE16VXhOeTAwWm1RNUxXRTFNREl0WVdNMk1UUmhaVEV5T0RobCU0MHRocmVhZC52Mi8wP2Nvbg0K
IHRleHQ9JTdiJTIyVGlkJTIyJTNhJTIyNzJmOTg4YmYtODZmMS00MWFmLTkxYWItMmQ3Y2QwMTFk
YjQ3JTIyJTJjJTIyT2lkJTIyDQogJTNhJTIyMWMyOWMyZjctZDM4Ni00YzVhLWEzYmMtMGVlMTNi
NDhiYzY1JTIyJTdkPlxuKzEgMzIzLTg0OS00ODc0PHRlbDorMSUNCiAyMDMyMy04NDktNDg3NFws
XCw3MTAwMzE0MzMjPiAgIFVuaXRlZCBTdGF0ZXNcLCBMb3MgQW5nZWxlcyAoVG9sbClcbig4NjYp
IA0KIDY3OS05OTk1PHRlbDooODY2KSUyMDY3OS05OTk1XCxcLDcxMDAzMTQzMyM+ICAgKFRvbGwt
ZnJlZSlcbkNvbmZlcmVuY2UgSUQ6DQogIDcxMCAwMzEgNDMzI1xuTG9jYWwgbnVtYmVyczxodHRw
czovL2RpYWxpbi50ZWFtcy5taWNyb3NvZnQuY29tLzg1NTFmNGMxLWINCiBlYTMtNDQxYS04NzM4
LTY5YWE1MTdhOTFjNT9pZD03MTAwMzE0MzM+IHwgUmVzZXQgUElOPGh0dHBzOi8vbXlzZXR0aW5n
cy5seQ0KIG5jLmNvbS9wc3RuY29uZmVyZW5jaW5nPiB8IExlYXJuIG1vcmUgYWJvdXQgVGVhbXM8
aHR0cHM6Ly9ha2EubXMvSm9pblRlYW1zDQogTWVldGluZz4gfCBNZWV0aW5nIG9wdGlvbnM8aHR0
cHM6Ly90ZWFtcy5taWNyb3NvZnQuY29tL21lZXRpbmdPcHRpb25zLz9vcmcNCiBhbml6ZXJJZD0x
YzI5YzJmNy1kMzg2LTRjNWEtYTNiYy0wZWUxM2I0OGJjNjUmdGVuYW50SWQ9NzJmOTg4YmYtODZm
MS00MWFmLQ0KIDkxYWItMmQ3Y2QwMTFkYjQ3JnRocmVhZElkPTE5X21lZXRpbmdfTWpGalpURTVa
ak10TXpVeE55MDBabVE1TFdFMU1ESXRZV00yDQogTVRSaFpURXlPRGhsQHRocmVhZC52MiZtZXNz
YWdlSWQ9MCZsYW5ndWFnZT1lbi1VUz5cbkpvaW4gd2l0aCBhIHZpZGVvIGNvbmYNCiBlcmVuY2lu
ZyBkZXZpY2VcbjgxMzg3ODg5NkB0LnBsY20udmM8bWFpbHRvOjgxMzg3ODg5NkB0LnBsY20udmM+
IFZUQyBDb25mZQ0KIHJlbmNlIElEOiAwMTQ4OTY0NzU3XG5BbHRlcm5hdGUgVlRDIGRpYWxpbmcg
aW5zdHJ1Y3Rpb25zPGh0dHBzOi8vZGlhbGluLnBsDQogY20udmMvdGVhbXMvP2tleT04MTM4Nzg4
OTYmY29uZj0wMTQ4OTY0NzU3PlxuX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19cblxuDQpSUlVM
RTpGUkVRPVdFRUtMWTtVTlRJTD0yMDIwMDYzMFQxOTMwMDBaO0lOVEVSVkFMPTI7QllEQVk9VFU7
V0tTVD1TVQ0KRVhEQVRFO1RaSUQ9UGFjaWZpYyBTdGFuZGFyZCBUaW1lOjIwMjAwMjI1VDEyMzAw
MA0KVUlEOjA0MDAwMDAwODIwMEUwMDA3NEM1QjcxMDFBODJFMDA4MDAwMDAwMDA4MENDNzFCRkZF
QzlENTAxMDAwMDAwMDAwMDAwMDAwDQogMDEwMDAwMDAwREVEMDNGRjdCQzAzMTM0NEI0REYzREY2
OEZCRDc2NzMNClNVTU1BUlk7TEFOR1VBR0U9ZW4tVVM6Q2FuY2VsZWQ6IE9wZW5CTUMgUGxhdGZv
cm0gdGVsZW1ldHJ5IGFuZCBoZWFsdGggbW9uaQ0KIHRvcmluZyBXb3JrIEdyb3VwDQpEVFNUQVJU
O1RaSUQ9UGFjaWZpYyBTdGFuZGFyZCBUaW1lOjIwMjAwMTE0VDEyMzAwMA0KRFRFTkQ7VFpJRD1Q
YWNpZmljIFN0YW5kYXJkIFRpbWU6MjAyMDAxMTRUMTMwMDAwDQpDTEFTUzpQVUJMSUMNClBSSU9S
SVRZOjENCkRUU1RBTVA6MjAyMDAyMjVUMjEwMzE4Wg0KVFJBTlNQOlRSQU5TUEFSRU5UDQpTVEFU
VVM6Q0FOQ0VMTEVEDQpTRVFVRU5DRToyDQpMT0NBVElPTjtMQU5HVUFHRT1lbi1VUzpNaWNyb3Nv
ZnQgVGVhbXMgTWVldGluZw0KWC1NSUNST1NPRlQtQ0RPLUFQUFQtU0VRVUVOQ0U6Mg0KWC1NSUNS
T1NPRlQtQ0RPLU9XTkVSQVBQVElEOjgyMjk0MTY2OA0KWC1NSUNST1NPRlQtQ0RPLUJVU1lTVEFU
VVM6RlJFRQ0KWC1NSUNST1NPRlQtQ0RPLUlOVEVOREVEU1RBVFVTOkZSRUUNClgtTUlDUk9TT0ZU
LUNETy1BTExEQVlFVkVOVDpGQUxTRQ0KWC1NSUNST1NPRlQtQ0RPLUlNUE9SVEFOQ0U6Mg0KWC1N
SUNST1NPRlQtQ0RPLUlOU1RUWVBFOjENClgtTUlDUk9TT0ZULVNLWVBFVEVBTVNNRUVUSU5HVVJM
Omh0dHBzOi8vdGVhbXMubWljcm9zb2Z0LmNvbS9sL21lZXR1cC1qb2luLw0KIDE5JTNhbWVldGlu
Z19NakZqWlRFNVpqTXRNelV4TnkwMFptUTVMV0UxTURJdFlXTTJNVFJoWlRFeU9EaGwlNDB0aHJl
YWQudjIvDQogMD9jb250ZXh0PSU3YiUyMlRpZCUyMiUzYSUyMjcyZjk4OGJmLTg2ZjEtNDFhZi05
MWFiLTJkN2NkMDExZGI0NyUyMiUyYyUyMk8NCiBpZCUyMiUzYSUyMjFjMjljMmY3LWQzODYtNGM1
YS1hM2JjLTBlZTEzYjQ4YmM2NSUyMiU3ZA0KWC1NSUNST1NPRlQtU0NIRURVTElOR1NFUlZJQ0VV
UERBVEVVUkw6aHR0cHM6Ly9zY2hlZC5zZXJ2aWNlcy5za3lwZS5uZXQvdGVhDQogbXMvNzJmOTg4
YmYtODZmMS00MWFmLTkxYWItMmQ3Y2QwMTFkYjQ3LzFjMjljMmY3LWQzODYtNGM1YS1hM2JjLTBl
ZTEzYjQ4YmMNCiA2NS8xOV9tZWV0aW5nX01qRmpaVEU1WmpNdE16VXhOeTAwWm1RNUxXRTFNREl0
WVdNMk1UUmhaVEV5T0RobEB0aHJlYWQudjIvMA0KWC1NSUNST1NPRlQtU0tZUEVURUFNU1BST1BF
UlRJRVM6eyJjaWQiOiIxOTptZWV0aW5nX01qRmpaVEU1WmpNdE16VXhOeTAwWm1RDQogNUxXRTFN
REl0WVdNMk1UUmhaVEV5T0RobEB0aHJlYWQudjIiXCwicHJpdmF0ZSI6dHJ1ZVwsInR5cGUiOjBc
LCJtaWQiOjBcLCINCiByaWQiOjBcLCJ1aWQiOm51bGx9DQpYLU1JQ1JPU09GVC1PTkxJTkVNRUVU
SU5HRVhURVJOQUxMSU5LOg0KWC1NSUNST1NPRlQtT05MSU5FTUVFVElOR0NPTkZMSU5LOmNvbmY6
c2lwOm5lbGFka0BtaWNyb3NvZnQuY29tXDtncnV1XDtvcGFxDQogdWU9YXBwOmNvbmY6Zm9jdXM6
aWQ6dGVhbXM6MjowITE5Om1lZXRpbmdfTWpGalpURTVaak10TXpVeE55MDBabVE1TFdFMU1ESXQN
CiBZV00yTVRSaFpURXlPRGhsLXRocmVhZC52MiExYzI5YzJmN2QzODY0YzVhYTNiYzBlZTEzYjQ4
YmM2NSE3MmY5ODhiZjg2ZjE0MQ0KIGFmOTFhYjJkN2NkMDExZGI0Nw0KWC1NSUNST1NPRlQtT05M
SU5FTUVFVElOR0lORk9STUFUSU9OOnsiT25saW5lTWVldGluZ1Byb3ZpZGVyIjozfQ0KWC1NSUNS
T1NPRlQtRE9OT1RGT1JXQVJETUVFVElORzpGQUxTRQ0KWC1NSUNST1NPRlQtRElTQUxMT1ctQ09V
TlRFUjpGQUxTRQ0KRU5EOlZFVkVOVA0KRU5EOlZDQUxFTkRBUg0K

--_000_CH2PR21MB1510BEEC32F2ADA95E8A13EAC8ED0CH2PR21MB1510namp_--
