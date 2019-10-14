Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A777CD69D5
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 21:02:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sScP0yZ7zDqsR
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 06:02:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.70.94; helo=nam04-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="d3JeKm6+"; dkim-atps=neutral
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700094.outbound.protection.outlook.com [40.107.70.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sSbf2k7VzDqNF
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 06:02:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhNjQaS7Nr465nNKLGxiTfBNvW4npRM36gxQfz9YgSPqmDQocCHi4fwaKq3YoY4vqKaEHOJ/Fk1yn2DDiL4oGAoREFnp3FWHRhUjpyUvntPuft3QznrOPaJQsecvrK6spIK9YPhgPYx0oEyjqdXYgr8wlT9oB4TrY+wdGtgTvxfKvwiwbcsqgRaXuuL9b3/tAinFw1L3bn4WGM5Llcq9nthbhosQ6erL/jvBRawfUR0jY4zuEiN1qAqbclX9INAYUfqiOsHdSgE6VfzlCRGGfC3zRiBuEf4xTaM5ZWptK94RNCU9s763J6UD6sQNBJhAl9TMC1aJss7QR1q8bM5MnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sk1h6ihFLFcsOVL56t5cbGQVIHqP6aYmT143OGPUgU=;
 b=WkFXiGSgU2U/+USrORtLW7l3DyPEza64jg8VEBhmgNmRGICssSoW/LGaJN8HGcj78qcQNzr4+sEyChvTw583c8LTv/xZQZnDO85JxsrQJSdCNAzwIVbvEPTcsbGCIpi2ckCWgyippMyPwEHdxBE43tPxA5OCmAYbUhKhV+r802JwU78ksrzxv/8V1hSX54use2fYYQsRjyG2sZLH4fmXXL/wtDfWAMLZzQSNink5nASeRgMIf5bd+5HEFeRR5l9c1pu6WgClcJ1fgsTNRofopovebuFKagKXd60DGwb3KMcQL7DSR1WXFCsNkMICCGyJ6GziHCeE+v2Ov/Yd64o0DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sk1h6ihFLFcsOVL56t5cbGQVIHqP6aYmT143OGPUgU=;
 b=d3JeKm6+Z6aT09gMr2RYydPPjT6pNi300RMW46cMXOmMxIvcTtfM4Qg0ZB/k5EcZnba+CF4peEniSIVs7dbihsDASsjfRBvPvJ1oC8lLL4A1kNgd74qFOlTpg+8WwVYynmuNCmc8L3bkCereVjOH+2CGKRMHgucdgetKnN699Lw=
Received: from BYAPR21MB1191.namprd21.prod.outlook.com (20.179.56.209) by
 BYAPR21MB1269.namprd21.prod.outlook.com (20.179.57.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.4; Mon, 14 Oct 2019 19:01:59 +0000
Received: from BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::69e9:d711:4080:9cb1]) by BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::69e9:d711:4080:9cb1%7]) with mapi id 15.20.2347.023; Mon, 14 Oct 2019
 19:01:59 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Platform Telemetry workgroup- bi-weekly sync 
Thread-Topic: Platform Telemetry workgroup- bi-weekly sync 
Thread-Index: AdVyi2uS47ovS1jOTeK/p2xl45QzrAQNkSlQ
Date: Mon, 14 Oct 2019 19:01:59 +0000
Message-ID: <BYAPR21MB1191FAF82660F6D4E20118A4C8900@BYAPR21MB1191.namprd21.prod.outlook.com>
References: <BYAPR21MB119199DBC98499C443F9B9C2C89D0@BYAPR21MB1191.namprd21.prod.outlook.com>
In-Reply-To: <BYAPR21MB119199DBC98499C443F9B9C2C89D0@BYAPR21MB1191.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-10-14T16:56:53.4493225Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=11;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Unknown
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [2001:4898:80e8:0:5067:2a51:9a1b:31ff]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5dc8e694-e6a8-4ba1-79a6-08d750d8fde0
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BYAPR21MB1269:
x-ms-exchange-purlcount: 6
x-microsoft-antispam-prvs: <BYAPR21MB126958A0B5FDF8A441968078C8900@BYAPR21MB1269.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(53754006)(189003)(199004)(9763003)(76116006)(66556008)(66476007)(66446008)(33656002)(14454004)(46003)(6306002)(66946007)(64756008)(9326002)(236005)(2906002)(11346002)(7696005)(6246003)(74316002)(99286004)(446003)(186003)(9686003)(54896002)(256004)(76176011)(10090500001)(6916009)(5640700003)(606006)(6436002)(2351001)(55016002)(25786009)(71200400001)(22452003)(229853002)(8676002)(102836004)(81156014)(81166006)(1730700003)(486006)(5660300002)(4743002)(86362001)(478600001)(8990500004)(8936002)(790700001)(6116002)(4326008)(53546011)(6506007)(316002)(2501003)(54906003)(10290500003)(7736002)(476003)(52536014)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR21MB1269;
 H:BYAPR21MB1191.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9V33y5+ZUhBzh9chGai6wsU5RBhSLVi8Mto9ryCZxxXoPJECmFmUtmL3bEhsZtTBPq4dMH7ul+N6LD0HaeygOuwF18CvS49gOklI/x0O863iKh0CDdNgs4wOwRh+bHy8B8SSWSf3e6LEEoO4Os2lGayXZFWZeQnwT45ifDAxTMBm6rWzG31UQyo2PvBm3f4WfLKvnrQvOC9GJjwq7Fj5E+F/prwFp78ysDFG8lkMdvzDOH6oeBfKQMJ+fNU3LtQ+bdTcfh0Qg6SUNpCC5fvwnzq5VqkV5QeRQE4PjCrUN0ZGRFdfwOf6KYYXYKpcooGGxVgfCOBSAOTVcLrii6vDlzwIagWPsaKBrzNTij6/NIiL7q4syKbdagDE/LbjvxLc9p01GlOGF5OrftcSWQNYcDkvyKkIdDyLsOX8XSRf38KE8bw0gTrO3RHuofttSxNW4KizH+6kAMD/5h/f2/FkpQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR21MB1191FAF82660F6D4E20118A4C8900BYAPR21MB1191namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc8e694-e6a8-4ba1-79a6-08d750d8fde0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 19:01:59.6590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QBKytgPB+vrZcMsMgc0pFPcZwEX1ULg3lLw+HGbUgWVmAgIr8OX5wSDIxwYMsSZOwZ08iTH4NTTxXBER1zBpuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1269
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
Cc: "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_BYAPR21MB1191FAF82660F6D4E20118A4C8900BYAPR21MB1191namp_
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64

SGkgRXZlcnlvbmUsDQoNCkkgaGF2ZSBhIGNvbmZsaWN0IGFuZCBJIGNhbqGvdCBtYWtlIGl0IGZv
ciB0b21vcnJvd6GvcyBtZWV0aW5nLiBQbGVhc2UgZmVlbCBmcmVlIHRvIG1lZXQgYW5kIGRpc2N1
c3Mgb3BlbiBpdGVtcy4NCg0KVGhhbmtzDQpOZWVyYWoNCg0KDQotLS0tLU9yaWdpbmFsIEFwcG9p
bnRtZW50LS0tLS0NCkZyb206IE5lZXJhaiBMYWRrYW5pDQpTZW50OiBNb25kYXksIFNlcHRlbWJl
ciAyMywgMjAxOSA4OjUzIFBNDQpUbzogTmVlcmFqIExhZGthbmk7IG9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZw0KQ2M6IEplbiBTcGF0ejsgTWF0dCBDaGVuL1dZSFEvV2l3eW5uOyBBbGFuIE1pbW1z
OyBTYXFpYiBLaGFuOyBMdWtlIENoZW47IFRhbm91cywgRWQ7IE1hdHVzemN6YWssIFBpb3RyOyBE
b25nIFdlaTsgRGljayBXaWxraW5zOyBKb2UgUCBNdWxob2xsYW5kOyBCdWRkeSBIdWFuZyAo/Nz0
uPv4KTsgUmVlZCBCIEZyYW5kc2VuOyBrdW55aUBnb29nbGUuY29tOyBWaWpheSBLaGVta2E7IE1p
Y2hhZWwgTGltOyBBbWl0aGFzaCBQcmFzYWQ7IFRvbSBTYW5kOyBQYW5keWEsIEFudXA7IFdpbGwg
TGlhbmcgKNXZ57X66CkNClN1YmplY3Q6IFBsYXRmb3JtIFRlbGVtZXRyeSB3b3JrZ3JvdXAtIGJp
LXdlZWtseSBzeW5jDQpXaGVuOiBUdWVzZGF5LCBPY3RvYmVyIDE1LCAyMDE5IDk6MzAgQU0tMTA6
MzAgQU0gKFVUQy0wODowMCkgUGFjaWZpYyBUaW1lIChVUyAmIENhbmFkYSkuDQpXaGVyZTogTWlj
cm9zb2Z0IFRlYW1zIE1lZXRpbmcNCg0KUmVzZW5kaW5nIHRoZSBpbnZpdGUNCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCkpvaW4gTWljcm9zb2Z0IFRlYW1zIE1lZXRpbmc8aHR0cHM6Ly90ZWFt
cy5taWNyb3NvZnQuY29tL2wvbWVldHVwLWpvaW4vMTklM2FtZWV0aW5nX05qUTRPVEZtTnpZdE5U
bGhPUzAwTjJRMUxUbGtZelV0TkRCallXUTBPR1EyT0dKaSU0MHRocmVhZC52Mi8wP2NvbnRleHQ9
JTdiJTIyVGlkJTIyJTNhJTIyNzJmOTg4YmYtODZmMS00MWFmLTkxYWItMmQ3Y2QwMTFkYjQ3JTIy
JTJjJTIyT2lkJTIyJTNhJTIyMWMyOWMyZjctZDM4Ni00YzVhLWEzYmMtMGVlMTNiNDhiYzY1JTIy
JTdkPg0KKzEgMzIzLTg0OS00ODc0PHRlbDorMSUyMDMyMy04NDktNDg3NCwsNjM2MDQ5NDkjPiAg
IFVuaXRlZCBTdGF0ZXMsIExvcyBBbmdlbGVzIChUb2xsKQ0KKDg2NikgNjc5LTk5OTU8dGVsOig4
NjYpJTIwNjc5LTk5OTUsLDYzNjA0OTQ5Iz4gICAoVG9sbC1mcmVlKQ0KQ29uZmVyZW5jZSBJRDog
NjM2IDA0OSA0OSMNCkxvY2FsIG51bWJlcnM8aHR0cHM6Ly9kaWFsaW4udGVhbXMubWljcm9zb2Z0
LmNvbS84NTUxZjRjMS1iZWEzLTQ0MWEtODczOC02OWFhNTE3YTkxYzU/aWQ9NjM2MDQ5NDk+IHwg
UmVzZXQgUElOPGh0dHBzOi8vbXlzZXR0aW5ncy5seW5jLmNvbS9wc3RuY29uZmVyZW5jaW5nPiB8
IExlYXJuIG1vcmUgYWJvdXQgVGVhbXM8aHR0cHM6Ly9nby5taWNyb3NvZnQuY29tL2Z3bGluay8/
bGlua2lkPTg1NzI1MD4gfCBNZWV0aW5nIG9wdGlvbnM8aHR0cHM6Ly90ZWFtcy5taWNyb3NvZnQu
Y29tL21lZXRpbmdPcHRpb25zLz9vcmdhbml6ZXJJZD0xYzI5YzJmNy1kMzg2LTRjNWEtYTNiYy0w
ZWUxM2I0OGJjNjUmdGVuYW50SWQ9NzJmOTg4YmYtODZmMS00MWFmLTkxYWItMmQ3Y2QwMTFkYjQ3
JnRocmVhZElkPTE5X21lZXRpbmdfTmpRNE9URm1Oell0TlRsaE9TMDBOMlExTFRsa1l6VXROREJq
WVdRME9HUTJPR0ppQHRocmVhZC52MiZtZXNzYWdlSWQ9MCZsYW5ndWFnZT1lbi1VUz4NCkpvaW4g
d2l0aCBhIHZpZGVvIGNvbmZlcmVuY2luZyBkZXZpY2UNCjgxMzg3ODg5NkB0LnBsY20udmMgVlRD
IENvbmZlcmVuY2UgSUQ6IDAxNzk4ODU5MQ0KQWx0ZXJuYXRlIFZUQyBkaWFsaW5nIGluc3RydWN0
aW9uczxodHRwczovL2RpYWxpbi5wbGNtLnZjL3RlYW1zLz9rZXk9ODEzODc4ODk2JmNvbmY9MDE3
OTg4NTkxPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCg0K

--_000_BYAPR21MB1191FAF82660F6D4E20118A4C8900BYAPR21MB1191namp_
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
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Gulim",sans-serif;
	mso-fareast-language:KO;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#002060;}
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
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US">Hi Everyone,
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US">I have a conflict and I can=A1=AFt make it for tomorrow=A1=AFs meeting=
. Please feel free to meet and discuss open items.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US">Thanks
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US">Neeraj<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal">-----Original Appointment-----<br>
<b>From:</b> Neeraj Ladkani <br>
<b>Sent:</b> Monday, September 23, 2019 8:53 PM<br>
<b>To:</b> Neeraj Ladkani; openbmc@lists.ozlabs.org<br>
<b>Cc:</b> Jen Spatz; Matt Chen/WYHQ/Wiwynn; Alan Mimms; Saqib Khan; Luke C=
hen; Tanous, Ed; Matuszczak, Piotr; Dong Wei; Dick Wilkins; Joe P Mulhollan=
d; Buddy Huang (<span lang=3D"KO" style=3D"font-family:&quot;Gulim&quot;,sa=
ns-serif">=FC=DC=F4=B8=FB=F8</span>); Reed B Frandsen; kunyi@google.com;
 Vijay Khemka; Michael Lim; Amithash Prasad; Tom Sand; Pandya, Anup; Will L=
iang (<span lang=3D"KO" style=3D"font-family:&quot;Gulim&quot;,sans-serif">=
=D5=D9=E7=B5=FA=E8</span>)<br>
<b>Subject:</b> Platform Telemetry workgroup- bi-weekly sync <br>
<b>When:</b> Tuesday, October 15, 2019 9:30 AM-10:30 AM (UTC-08:00) Pacific=
 Time (US &amp; Canada).<br>
<b>Where:</b> Microsoft Teams Meeting<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Resending the invite<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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
ration:none">813878896@t.plcm.vc</span></span><span style=3D"font-size:9.0p=
t;font-family:&quot;Segoe UI&quot;,sans-serif;color:#252424">
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

--_000_BYAPR21MB1191FAF82660F6D4E20118A4C8900BYAPR21MB1191namp_--
