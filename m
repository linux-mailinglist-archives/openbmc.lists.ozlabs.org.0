Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 663162FB5F0
	for <lists+openbmc@lfdr.de>; Tue, 19 Jan 2021 12:59:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKnJ82nDlzDr1N
	for <lists+openbmc@lfdr.de>; Tue, 19 Jan 2021 22:59:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=646f784cb=jun-lin.chen@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=d3iheOCE; 
 dkim-atps=neutral
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DKj3m40wrzDqwy
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 19:48:15 +1100 (AEDT)
IronPort-SDR: 0k+rBTdsyfEZj4iIelwyIzoxyJjzFr+QmZToyqOktvl04MKoG71OCD3aKg6PYcAkwE8b05hhyx
 +q3nzUZNAqAQ==
Received: from unknown (HELO mailbx10.quanta.corp) ([10.243.91.107])
 by mx01.quantatw.com with ESMTP; 19 Jan 2021 16:48:13 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx10.quanta.corp
 (10.243.91.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 19 Jan
 2021 16:48:09 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (104.47.125.54)
 by mailbx05.quanta.corp (10.243.91.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4
 via Frontend Transport; Tue, 19 Jan 2021 16:48:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gp0FOicnqAoCu9IsQqQN/OOe3IShB6+/m/Y/3uG3tWcFjE5BwhrQCNZeyHSKZCGwTvWwK0nsb7naUt88RVXDazGyp2sQReZdtnz5Rpe8t+xAeL6o8jWw6xf+9kgOnktGvf8Vj58P14gRRtdfCVXmaHzJc39PidO4aP9pRbq5iwecutZZTZvdluyd2/Z+XQxprrEe2KZ4cKgrXgqpQK22cZ5a4BUFo2ycD+u3XhugfyUhGq5+Qe3r85SQjaEfUfCp7bR9cZE31CBGp/8eXtfrbdkxkVpcioQRpQB4eru7/3hAkStZTjsF6RtGvTjFQMVR4gsiIywORFAhU8SgPUvyeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUu4/wGfWnHwKoQ5FF+mz+47qLCBcCfizsXtO/WPJi4=;
 b=Yr7/mxjzHEgVLnehPvghKLpS55Zs2xeIGpK5gl4QNyZg2yOH63vo3207PiBdy37xvXzJ2sRs/s9tPYeVYK6Y+YxOaHH4XT8GsuC1y8aht73EIExcBJfoknIVPYB4qDOVfxZIskRamwUIvlUqIs6URcdQSxCGHPpZGYA4BJeu6yNETBnGbNF7ORvsUA+vWISY4RKMB8bovHLN8NdLnJS/QGZJ9czpwah8x9GiAND9z+UpDPEdEYf32boXgGcjnHznsjMdAfHIqrMA1BmLyhptDbE+DGGj7f/00eQvXU5UGFLL7Oi0xvvSvCgZCiNOaXuRLSSnY/2pJbkmYVilSIcLBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUu4/wGfWnHwKoQ5FF+mz+47qLCBcCfizsXtO/WPJi4=;
 b=d3iheOCEcw/0BBW3K60WaZIbW5SuT7YnSJxo9CF9jlLjwLbqo6PfHFpukmWGF32fgiaPiu/XySnxYUpftbgHfv63jlkZh0Q9oeMSeWI1TgrxWSKY5U1laMLklGFiBlIhkO8yBJOc91FhTPvbP+lWnLLCUiph3i+oyQhh2Sxyy6E=
Received: from HK0PR04MB3346.apcprd04.prod.outlook.com (2603:1096:203:87::9)
 by HK0PR04MB3233.apcprd04.prod.outlook.com (2603:1096:203:84::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Tue, 19 Jan
 2021 08:48:10 +0000
Received: from HK0PR04MB3346.apcprd04.prod.outlook.com
 ([fe80::4479:a01f:5836:73e]) by HK0PR04MB3346.apcprd04.prod.outlook.com
 ([fe80::4479:a01f:5836:73e%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 08:48:10 +0000
From: =?big5?B?SnVuLUxpbiBDaGVuICizr6tUwE0p?= <Jun-Lin.Chen@quantatw.com>
To: "smriti.ayushi@linux.intel.com" <smriti.ayushi@linux.intel.com>
Subject: Add /var/lib/bmcweb path when bmcweb.service starts
Thread-Topic: Add /var/lib/bmcweb path when bmcweb.service starts
Thread-Index: AdbuPTQI0HdOJXisRV6T1mWcypw2Yw==
Date: Tue, 19 Jan 2021 08:48:10 +0000
Message-ID: <HK0PR04MB334676C88E4A4FA2DE712337B1A30@HK0PR04MB3346.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [60.251.243.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fbaa66a2-1e48-4512-8aaf-08d8bc56f309
x-ms-traffictypediagnostic: HK0PR04MB3233:
x-microsoft-antispam-prvs: <HK0PR04MB3233C12ED9D4BF1797708201B1A30@HK0PR04MB3233.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qed+n18dTnC5EsF0WnJsT5HOzL+MpR3U8eRvl0zikXoyjIsvLRiI0H7FX8TflGowYTghVQCEPmIZ7dEz4FFDDGer53p5xx6mtHIzn+8ggCZt3opCqhEtLJqq7CjuxWuWPUcVoEwr/KMgaWfsKyjmGOGuDTpEq2TBqxJfQG9LOcH3Jpfs3rDB/vbbiY55kww1tquS7KNQ0T5ICrwG8BJfUum6JZ24/+gYVDOym+lENafcTFkpvAovFdg2Yvlc2KAIKZtFTk7Z9sxhNANUf+iR5I3CXlIQmNh8j2f0QvbhGkLWNnbwL1VCVZDpmNutVtYBRlj/j3klTuWo0owYd5VH9h8nuLha1Dk5ICZKloCkdH1WmTbhUCyFrE92IgnVMX5C0xVbYbZ9RSXDnJXewFakDQrZD72pdpZFkvb+c7W0nZtGufSGJLz2VuaK5P8RzAvzVGXvDSpT2l3QkbdIpAs1pA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3346.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(54906003)(76116006)(4744005)(966005)(8936002)(8676002)(66946007)(2906002)(66446008)(66476007)(316002)(64756008)(55016002)(5660300002)(26005)(85182001)(6916009)(9686003)(66556008)(52536014)(4326008)(186003)(33656002)(166002)(83380400001)(6506007)(86362001)(7696005)(478600001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?MVVZekprdFRZV3p2bmtnNHE4dWcyQUNHME41cDhyRGZlcHB6eGdlSGwvak1nYlJS?=
 =?big5?B?K1lCNTJLK3JNSFo0YVI1ZEJhRjlDdm1jRzZZVTFIZm1zcHIzZVFGd2lONS9qc2Rl?=
 =?big5?B?dTkrdHBvcFFxTUMzSkVJeGNDMElrOUlYNDB3SkxRZmI5Zkx2UHhpWS9xUDdqclFp?=
 =?big5?B?aUw1dGh4TWY1b0FtQWIwZ25vWUtpeTdueDZqeVVTV214eHZtaXZ0bmtmS09wUlho?=
 =?big5?B?SVd1enFqVHVGcXZlWDVja3QwK0tOL2hPRDZ5R3VJSzZTM2dJeGExMzd5RzFKOVFa?=
 =?big5?B?QWRyN01BdS93THVrUkJKV2Z2c3NkckgzOUZDNTFGZ3RpZGRHaUJrcS9DRXRLOUxT?=
 =?big5?B?a0pkc3VGSndyK2NhbGd1Y3RkMmhaWVdZYUkxNHhNNGRFcFl1YVFMKzFVRFA3Z3hv?=
 =?big5?B?TkVlUDFnSUNtY2Rvalp4d1NjY1pZTVo4Mnk1aUUwNXRoN2dReXRsWHVlUHMraDNj?=
 =?big5?B?VHAzVFZPbVc3U3IzcTIvcjZmdkFFUWdOaWl3ZktDMXNldXRnU2owMDgwZndZQita?=
 =?big5?B?aXlTWmNvVGJMQkp2QjgzSFF5ZkRlZzBMWTVvbS9rd3RPSWRsTGd1Mzg3TG1xR2Jy?=
 =?big5?B?V2V3YXdYdVFFdWZZdmtHNDlURTB5azZ1RlJwYkNEM1Flc1NIdm1iTmJleVcvTm5I?=
 =?big5?B?Zk1xOVJqT0UwU0NiWGVEM0dNNWM0K0hFY1QrYnpGTG9MRjVLdU5CdHJTNnIxcXg1?=
 =?big5?B?RE5aQVNkTEpiZE9CeFQzeFFRSll1RHBuL0ZtYUVQQi9FMVpCOFNuNi9FcjhzSkNQ?=
 =?big5?B?K0VKMGxyS1F5ZzJUQWYvL3B3MmEzQTFYT0lMclVWbVErUTNRYTdnRzVWOTZFdWJX?=
 =?big5?B?Y0FEMER5UWNXWjFadVhBczJJczlTWmF2QTdCNk9Qby93VjZjM2I0d0xnV3BsQU1j?=
 =?big5?B?L0Z3aDk2YkRUdk5zU09WWkZaTnIwUDRtYXcrT1pxelJhSSt0eC9WNzZxR3B0eXRI?=
 =?big5?B?djIwRTNsRE1JWlNBQ0loRDg1QWhlK0JDTG1MVVNHOXZjS3FDc3d0WjM0Z25yY0ln?=
 =?big5?B?OUp4UnBXa2hBYXFuMTFvdDhkMkxndENCNnZCVEJ0SDBoRnB2NlFJVlFEUVRHdElV?=
 =?big5?B?L2k5MlgvZldlTE9FTjIvdkd3ZjJuUG83b2F3a2RCTmFEaE9rVHJ3VUNMSDZIOHBZ?=
 =?big5?B?Nkp4OFJxSllDN0U3MWpXMFkrSWlpRXQ3aG9pZCt1eHdveGNBZ2lQUWtPb0ptdGZh?=
 =?big5?Q?i/xIOqppjAQVCSszZ4BlNIWUAoRARa2b/ft2+Ecrd0k=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB334676C88E4A4FA2DE712337B1A30HK0PR04MB3346apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3346.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbaa66a2-1e48-4512-8aaf-08d8bc56f309
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2021 08:48:10.2703 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GsqD04MFbM2xE2Yov1WgUHp4Lgrm0bFgbnTi//PbDeJG9G8LxBqQFxRUdvtz2cuVCBV2BvBxPHunaf4tV8inW2SUxiH7k5eZ353rvGTdIeo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3233
X-OriginatorOrg: quantatw.com
X-Mailman-Approved-At: Tue, 19 Jan 2021 22:58:00 +1100
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
 "richard.marian.thomaiyar@linux.intel.com"
 <richard.marian.thomaiyar@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB334676C88E4A4FA2DE712337B1A30HK0PR04MB3346apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgU21yaXRpLA0KDQpJIHNhdyB5b3VyIEdlcnJpdCBjb2RlIGZvciBodHRwczovL2dlcnJpdC5v
cGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9tZXRhLXBob3NwaG9yLysvMzI2NDEvDQpCdXQg
SSBjYW5ub3QgZmluZCB0aGUgcmVsYXRlZCBjaGFuZ2UgZm9yIHRoaXMgaXNzdWUgb24gYm1jd2Vi
IHN1YnNlcXVlbnRseS4NCkFjY29yZGluZyB0byBsYXN0IGNvbW1lbnQgYnkgUmljaGFyZCBNYXJp
YW4gVGhvbWFpeWFyOiBUaGlzIG11c3QgYmUgY3JlYXRlZCBpbiBibWN3ZWIuc2VydmljZS4NCkkg
dHJ5IHRvIHJlYWxpemUgdGhlIGNvbW1lbnQgYW5kIHVwbG9hZCB0byBnZXJyaXQuDQpJZiB5b3Ug
aGF2ZSBhbnkgY29tbWVudCBvciB0aGlzIG1vZGlmaWNhdGlvbiBpcyBub3QgbmVlZGVkLiBQbGVh
c2UgdGVsbCB0byBtZS4NClRoYW5rIHlvdS4NCg0KQmVzdCByZWdhcmRzLA0KSnVuLUxpbiBDaGVu
DQoNCg==

--_000_HK0PR04MB334676C88E4A4FA2DE712337B1A30HK0PR04MB3346apcp_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Smriti,<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I saw your Gerrit code for <a h=
ref=3D"https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/32641/"=
>
https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/32641/</a><o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">But I cannot find the related c=
hange for this issue on bmcweb subsequently.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">According to last comment by Ri=
chard Marian Thomaiyar: This must be created in bmcweb.service.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I try to realize the comment an=
d upload to gerrit.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">If you have any comment or this=
 modification is not needed. Please tell to me.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-family:&quot;T=
imes New Roman&quot;,serif">Best regards,<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-family:&quot;T=
imes New Roman&quot;,serif">Jun-Lin Chen<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_HK0PR04MB334676C88E4A4FA2DE712337B1A30HK0PR04MB3346apcp_--
