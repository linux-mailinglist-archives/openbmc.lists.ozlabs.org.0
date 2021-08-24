Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F263F5B13
	for <lists+openbmc@lfdr.de>; Tue, 24 Aug 2021 11:29:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gv3j55qFvz2yKW
	for <lists+openbmc@lfdr.de>; Tue, 24 Aug 2021 19:29:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=FmCVQvvC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.131.135;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=harvey.wu@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=FmCVQvvC; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310135.outbound.protection.outlook.com [40.107.131.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gv3hZ420Cz2y8P
 for <openbmc@lists.ozlabs.org>; Tue, 24 Aug 2021 19:29:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQr68GC0MMHppeBhzfFHOMVOUBoyuoTPNRpGvBty0MPjblJQik+0pTWlxIOimNitlDv8O6+j9c/hX39DjhGMqB0WWOPXBJEGIVD0EJB7/+nWUA/9KBnNMziVoVDspM442iKGVO5aa5sKAdX4cTHwhcxm7ks2OUdeJIKDqKWaLSzkf0ovGb3UJYfsaMaad5Wf5NmpCEK2ninAdwRopRCfgGImI9ivPLBAuIuam7jF7/5h6mAhQgUhD44R+sqFwKgSRzSd9VkxN5a4/MDI4buujcM217LNyV3fS5CMaCrDvwP8xrSGkki9ETuLih+CJ0nLhSEo1fvDkA0sPIV9MyVwEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RI4CPQLhFepkkAC29DP3M70J0Q6zArETIc53IDMViAw=;
 b=IEAoKp+/lHGnPdwS4F8nfc9gUxGm59brID0l26IxEx2d3NWeGT1PDNHFEyXQcLxaOes22mbwdYNbq7RRGNQOWs9+x9ZLZKUmRULa0gerRw01nFKaJ1Pu2ugoVfL0bsiU5KE2NQkhhI7ckRV8lOCvpJsVxOEKxIbQZdipbwh7xcrxwrUYAKnL176HydHp+Aer95TV6vul/Ms976mghESTZdx0aYaSBliKindS/AXhh94tYNbH0SjTRWPAol1yXAkvhjMKdlYDxIha7kmvCzCOLu6aZnsdMDqL6C48Rx7W1uFKDFoTIBTOiWknm0cFA/jEu+3f+aUm2qNjjbrtBjOFHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RI4CPQLhFepkkAC29DP3M70J0Q6zArETIc53IDMViAw=;
 b=FmCVQvvCTpR32kj+Nw04xVvCZScO85+tfsc6qopxeYYl/p0DOxWDtTLVCYhYUMAIDvy7i8I+A01K5UqwdxYEZGkEiNopryO7pAWBMLHuI4Hoj3IqWrFVB8/ZYMUcYq5x5ezTkmZB5lsVHyamuhHbfIh5v4o8Uxe2rZj86h/Z/As=
Received: from HK0PR04MB2625.apcprd04.prod.outlook.com (2603:1096:203:61::11)
 by HK0PR04MB2338.apcprd04.prod.outlook.com (2603:1096:203:4d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 09:13:20 +0000
Received: from HK0PR04MB2625.apcprd04.prod.outlook.com
 ([fe80::a48f:93df:6ed1:74e7]) by HK0PR04MB2625.apcprd04.prod.outlook.com
 ([fe80::a48f:93df:6ed1:74e7%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 09:13:20 +0000
From: =?big5?B?SGFydmV5IFd1ICinZLFSuvsp?= <Harvey.Wu@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "apparao.puli@linux.intel.com" <apparao.puli@linux.intel.com>
Subject: Unfound interface "xyz.openbmc_project.Channel.ChannelAccess" in
 phosphor-network
Thread-Topic: Unfound interface "xyz.openbmc_project.Channel.ChannelAccess" in
 phosphor-network
Thread-Index: AdeYxfVwC6U1WPFGSJ+R/poTRhPmAQ==
Date: Tue, 24 Aug 2021 09:13:20 +0000
Message-ID: <HK0PR04MB2625A93112522EE203DE926995C59@HK0PR04MB2625.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91944dc2-a6d5-45eb-2de9-08d966df6ae2
x-ms-traffictypediagnostic: HK0PR04MB2338:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR04MB23386250973E99DE785992E995C59@HK0PR04MB2338.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k9FNLtGTh0BAiS7XTXZTU2VJrVkzTDHEFGHsN9HlFAQrcTaN2sWjTtcUoeF/LcldKbcsosc5VA84k5KF/oYWam6znhZPbYGH173twDPjGI5no8o02gsV8be94H+WBE/kMf6hmngRdoGbryKWnRsZGR5zZm1mg/iH8FHV79YAuXEOf6nzd78ZCla/C7+JA1iweRIWuziy/LJC2JsQdxqnmcPei6I0G10PUsTbNX0+2YFW3PbH2Hb2RENeRA9FfB+gbhw22nXxumkECZ6yO4rSN6lMr7T6cuu0KcwMyOLh9BKY0WqU3k1ysedOjtlIWzurIjWhfgfWVknWNoPTGMtbnBX8wrTteZ3qY9ePi9lKstHr+6gOmIPpn8wuLEbGA5/QRZaujd8YjCSNmHuS65vkN8RycrF8DwjuiZ3HODocA6kSZpF+MHfqq9Tsy86Q/UJ9PvkFPtzcrpp5d9cQUL2L+ivXqNCEFb1i3chRRAd+ZmuBujt5r8mgkEsjXJE/k4GAyBhB0U29P58FZSSliu9/RGlqyOrV/UGU1zJBrzzbWIA7ra8i0jhn4Pyn20U9C1TqaghQG6hl4GJ05ul7CNGyvXqO5SbvAWP9cV+0bZ4ii06kIKbqOdbtZ5L3lhF1hu+8ynYyfLbNHKpSRpNm80NXc0qsrUURtiSuw7XX0hK5/KuL4+56dTe9W5bfsgaONbotbp0AAJud5szTfIBaKlNmMw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2625.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(66446008)(55016002)(9686003)(66556008)(64756008)(4326008)(86362001)(6506007)(107886003)(478600001)(8936002)(110136005)(54906003)(316002)(2906002)(122000001)(8676002)(38070700005)(4744005)(7696005)(71200400001)(5660300002)(52536014)(26005)(85182001)(76116006)(66946007)(186003)(66476007)(38100700002)(33656002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?NGNNalR0V2NaZDJDREs2akMvMUJGc1R5WG9OYzBFb1ZMWGhkdkN4WE1lcmRCbjYv?=
 =?big5?B?MG1IQnZVeE5PcG9pTFV2Qy9wM3Z0R05aeS9GRy8rWHRkd25XS2o2ZElLTlF3OXQ5?=
 =?big5?B?d0dPOTJBVTBLMDhuRGtBL0M5R0xqNm01djc2WG1JUnFRSVI1cFVhYlZiVlJyN3Ur?=
 =?big5?B?R1g1d2o2Y2JWWVBxakNjcHErbUkrWG9xY1Q0VzNsVVhQRjFnMU1YYldXM3JUWTR0?=
 =?big5?B?aFNPaDAwbUNTbEdFdlMzMW5KWVBFUC9ORnp0K3BxRDllSHlPa3c1UVlBUldBOWFH?=
 =?big5?B?Q2x1R2lXaHZmbGk1SW12WHlFeG1aZXlpOVdTSnQvbW1ONmtkQm9CeE95Wm1Ta2Vk?=
 =?big5?B?elhxZlNpRUc2ZEtMZHZMTkRVK3VMVCtOeXk5WUIxTDl2Ykc5SG1LSjFQMGtabEsw?=
 =?big5?B?RTE4VXIwd1dnaVdmSUhGc2hNVlpMOWtqUm5NblRwUSsxS2JINGFaT3EyQ2tIUG5u?=
 =?big5?B?Q0s5eENWR2NndDVlMGUvK0VDUEZpM01GRnJzWUdJTE44UXVVZmF2QTFWOU42Ri9C?=
 =?big5?B?a2NHN3lxY2cxZkE1MUNYZmNzL0F4d3dqcERZMzhvVVlQczREN01iUG5YQ0h6RFVK?=
 =?big5?B?d2JQVEQyckQvRGVlUmZDR1NFSUp5UlhvQ1M5Y25VS3ZQVVpSazYwY1VWTDMrbDVK?=
 =?big5?B?d05JQjN0YjRyeHdGbHVUamU0ZXAwVDJ1b2RqZ296V1h2K2NReUc0NVhsYmZmRTBm?=
 =?big5?B?SHRRVElNY2IyV2I3Rnp0OS8wZ2NSTERXZEpZYVBXcWpmUmZGS2YydFE2Yy9jUDZa?=
 =?big5?B?VnRSbzRqODZzNE5TeGV1UlNSallqZXNQTUN1Z1BjNXVydzBZVFFrOEs3RFRmczBt?=
 =?big5?B?VFVGVnlrZ1crT1hOMnhud2N6VG12bnpuNFdJbExod3VJT1pUSzRmdEpXS2p3ZkZP?=
 =?big5?B?QXFJQURIbS9ickt4K0pwSWpiQ1VnN1poUEgwRitDMDBGU0MvT2RPbzMwUnRDSnRn?=
 =?big5?B?SmxUZkdFQlJCMkNtYkQ5b1REcmtKQXVXOTdyampycmVETk00RHhLaFN3SVA4Y1NQ?=
 =?big5?B?bzNjeUE5Uis5ZG5HU0puaWdYQldMYzVGRktjbVVqK0taVG00TlQ2OExUbXhSU2d6?=
 =?big5?B?M2lNUzUwOVFpenY3aVpKalBNc1Q2NkpBMThIb1k5VWhsN0FFbUhseTgvUithWDJU?=
 =?big5?B?STFyUmdlQ0s4TjAzUjVoaVVJc2h2MzhJR3ZkcG9Nc2QyS2ZRTzRZQk5OS0JiTmZE?=
 =?big5?B?bEdua2lvWWUvNFh4MTFwUjhnRnBBdlV4ZUE4eEdnL25LQWxNQ2lxeWs4bGFDSTYy?=
 =?big5?B?aUNhajBlZWRDRDdBakUrQk9qRzhWekROeG5VLzh6MldFQ3k2M3lpaEw0ZXI2NGFm?=
 =?big5?B?dnNUUXhjU25LN05NWmNvWWVVR0JFdUI1VFpsOVhUMDNWWDJtMTFWdzg3ckt3TnVD?=
 =?big5?B?aFcraGNsMkppa2RzSzVaK2lBVlh5TFB0T2d4eFc3RkVFNjA1Rk5LYWZBWFJyYktQ?=
 =?big5?B?SG5FN3dRbnNJb0hKMmNmYkcyYldobnhETkdxMnZrMHV0UGdFWHYrVXdmeURlREVn?=
 =?big5?B?NmJVVm5VRCtWOWxObkdJaldDTXFmZk9Bc3FlNzI0dlIzMVJnZFVELzNIalptODdu?=
 =?big5?B?eXVGdERQd0xXYndXNkdwRGpWWk44N281bkcrQTFGTW5lejNBNkk2VHN5MVF1NXlU?=
 =?big5?Q?xlpMKIw8ZESRadDRaeQLX7ELVNDDUxQQCSZTrIZBKCGWWNh1?=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB2625A93112522EE203DE926995C59HK0PR04MB2625apcp_"
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2625.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91944dc2-a6d5-45eb-2de9-08d966df6ae2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2021 09:13:20.4494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kyMUClHoe68ZOyRj8JknWbVDJFiEVJkwWBQ6oqxNmk81qzJSxYqbwRyvYwHIzFcps32/Flep8VVh1Sd5rBIlwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2338
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
 =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB2625A93112522EE203DE926995C59HK0PR04MB2625apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgQXBwYXJhbywgQWxsLA0KDQpXaGVuIEkgdXNlIGlwbWkgY29tbWFuZCB0byChp1NldCBDaGFu
bmVsIEFjY2VzcyBvZiBOb24tVm9sYXRpbGUgU2V0dGluZ3OhqCwgaXQgYWx3YXlzIHJldHVybiCh
p1Vuc3BlY2lmaWVkIGVycm9yoaggYW5kIGNhbm5vdCB1cGRhdGUgbm9uLXZvbGF0aWxlIGpzb24g
ZmlsZS4NCkFmdGVyIGRlYnVnZ2luZywgaXQgc2VlbXMgZG9lc26hpnQgaGF2ZSB0aGUgaW50ZXJm
YWNlIKGneHl6Lm9wZW5ibWNfcHJvamVjdC5DaGFubmVsLkNoYW5uZWxBY2Nlc3OhqCBpbiChp3h5
ei5vcGVuYm1jX3Byb2plY3QuTmV0d29ya6GoIHNlcnZpY2UgaW4gbXkgc3lzdGVtLg0KDQpEbyBJ
IG1pc3Mgc29tZXRoaW5nIGluIHBob3NwaG9yLW5ldHdvcmsgc2V0dGluZz8gSXQgc2VlbXMgbGlr
ZSB0aGlzIGludGVyZmFjZSBpcyB1bnVzZWQgaW4gY3VycmVudCBvcGVuYm1jLg0KDQoNCkJlc3Qg
UmVnYXJkcw0KDQpIYXJ2ZXkgV3UNCg0K

--_000_HK0PR04MB2625A93112522EE203DE926995C59HK0PR04MB2625apcp_
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
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Apparao, All,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">When I use ipmi command to =A1=
=A7</span><span lang=3D"EN-US" style=3D"color:black">Set Channel Access of =
Non-Volatile Settings</span><span lang=3D"EN-US">=A1=A8, it always return =
=A1=A7Unspecified error=A1=A8 and cannot update non-volatile json
 file.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">After debugging, it seems doesn=
=A1=A6t have the interface =A1=A7xyz.openbmc_project.Channel.ChannelAccess=
=A1=A8 in =A1=A7xyz.openbmc_project.Network=A1=A8 service in my system.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Do I miss something in phosphor=
-network setting? It seems like this interface is unused in current openbmc=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Harvey Wu<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_HK0PR04MB2625A93112522EE203DE926995C59HK0PR04MB2625apcp_--
