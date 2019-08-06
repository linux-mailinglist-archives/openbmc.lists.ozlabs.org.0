Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D359C82860
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2019 02:08:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462Zhw4Q29zDqVC
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2019 10:08:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.79.120; helo=nam03-co1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="Tow9iYPG"; dkim-atps=neutral
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790120.outbound.protection.outlook.com [40.107.79.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462ZhF67Y2zDqV9
 for <openbmc@lists.ozlabs.org>; Tue,  6 Aug 2019 10:07:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8gQbXgRkyLWAWylFEb1EI+GFGrovrwVyvOw/qSJbaOiQJjluirSc4u5laj4ifb0ftWwO4Kl2C/eQDJETwRIAXXLuZZLDr1UWKHBHkyUSQKSzljRiFJNcaNMdGFk0dNVbHMHQzwdL+RqAlOeT/7NJftz7KSPiYXJZBAflH7iB465dA5AXCEUeO/H6fry35KM+elzP17zSnqi8b7nMF6h60vDqHun/Pg177we4SGADi6H08DxSn2wWZZzmYdLtZhSHQKXmE8NKvBl3JDakhcY2uBUdWh9wedGAs2dIxhmRjnnrcgactrr+4YhF6R6XGcniZJSQ7P17A07uCatlAdPOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjOtquWYPRLZYrIDNEgc5sGIeTXI5exrzaLyOEsjEiA=;
 b=CTVIX/2fGlTwzyU8vmuexRWEA9zoEFUycQRXgNxOQdV2De/n5LPKZXJbZFtCyeyiO98i+bAzMJSG0Y0D2hveDzEqmZSxxWRfHIIXlkKtVXGMMPWMeHcCTUjIFZqGlHDNns+30ANL9mJatl0sRLf30McjbTYPDs7elFUK+f9I9XdvGKLVGyqs2R+Cyppu5n7Cnkelx/Ef2qxAo5JlNr/e8z574Ow6evf0PLARjzlCpYM9f1oW4/tYKZcjD//b255IupvgBnUUU7zuqDYl7ydWqt7+1BkbNfTiqy8cYcHm8EquDcgJMBJpaA6S6iMV67wp2t1yQ5gR5P7IhDKL8jwoHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjOtquWYPRLZYrIDNEgc5sGIeTXI5exrzaLyOEsjEiA=;
 b=Tow9iYPG7XvBwBEMpYiTEeNurb51RJByUgAfNxZ4xjekauPXnYLVAjmZriYJo3hC6lt9IjA4g3Yz6lCeOs7L/Fzs1hVmFE7dBcPXbNmoDddvBrjxS+u7FLrLasz5eF0z4HOtiP9mhV8OG575MIPrtQZU+DbQmihxZW0N+EcazDk=
Received: from BYAPR21MB1191.namprd21.prod.outlook.com (20.179.56.209) by
 BYAPR21MB1301.namprd21.prod.outlook.com (20.179.58.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.2; Tue, 6 Aug 2019 00:07:18 +0000
Received: from BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::b117:8e5d:55c9:ed0e]) by BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::b117:8e5d:55c9:ed0e%8]) with mapi id 15.20.2157.011; Tue, 6 Aug 2019
 00:07:18 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Platform telemetry and health monitoring - PST AM 
Thread-Topic: Platform telemetry and health monitoring - PST AM 
Thread-Index: AdUtVLT+f0Z7NQ0DTpuduh/5oQIaZwelfJZA
Date: Tue, 6 Aug 2019 00:07:17 +0000
Message-ID: <BYAPR21MB1191FD5198A9311CFA234CC5C8D50@BYAPR21MB1191.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-05-20T20:24:51.7634725Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=7ad7e3a0-0fda-4efe-b5af-bd9df99a438a;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [2001:4898:80e8:7:f0a4:77f4:9fcc:e772]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d73bce0a-514e-41b6-d1c7-08d71a020b71
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR21MB1301; 
x-ms-traffictypediagnostic: BYAPR21MB1301:
x-ms-exchange-purlcount: 9
x-microsoft-antispam-prvs: <BYAPR21MB1301DDA9FFF6416B13760501C8D50@BYAPR21MB1301.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:530;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(53754006)(199004)(189003)(46003)(68736007)(71190400001)(71200400001)(6506007)(81156014)(81166006)(76116006)(486006)(606006)(52536014)(86362001)(4743002)(476003)(8936002)(53546011)(966005)(7736002)(5660300002)(14444005)(256004)(8676002)(186003)(33656002)(1730700003)(102836004)(14454004)(6916009)(6306002)(6436002)(5640700003)(2501003)(99286004)(10290500003)(478600001)(6246003)(316002)(54906003)(53936002)(55016002)(22452003)(236005)(9686003)(54896002)(229853002)(2351001)(2906002)(25786009)(6116002)(790700001)(4326008)(8990500004)(7696005)(66476007)(66556008)(64756008)(66446008)(66946007)(10090500001)(74316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR21MB1301;
 H:BYAPR21MB1191.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SKKON8DrZFFQWF3OvZKn2iMyUuoISm6sHGhqkY2hUo8wuVl7U5OmbQ+2l9bQC9idzzbSS6WhDXQVgPI/pcllkXfxgTfhRrMZuPNLOpnN5aX+KaOxdRhsV/DyWJaLgr4Qmg1PmxNmeWnkb2SuSe43EEcbJvO6zS5pgrDJjgr8l/D50noE9/ORAD0kaYSRCoPfplyCcyTQN7KSMhvTZNuzi2YuSeEEwa8CEsh8Y5LcLTJMCLShjLJRFd6VDkZ0St+vDjkA8mCWOPCRuNKmBJd+g7HWxRxl6cMfH6gbfT6qkAzbVBM9Evx50SOAM94hMM18z1J7n+pHtvsQx+3/sK/7NRjH3UlPtWq7niFOnXKoYOZ1O6idjCjiZUv3nECx0Dm1QTbTfZlZ4REUoayusQsbFyiZvcpcgfaNIVEitIHSXFc=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR21MB1191FD5198A9311CFA234CC5C8D50BYAPR21MB1191namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d73bce0a-514e-41b6-d1c7-08d71a020b71
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 00:07:17.9370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lzdIUn9bjnTkKWgy7yZ7Ow69SRE82KU7epSb9LIe5Ey4RrjA0zojSaktR1MnqhIRBYfQWl1ph3aCb5VNC4JqVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1301
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

--_000_BYAPR21MB1191FD5198A9311CFA234CC5C8D50BYAPR21MB1191namp_
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64

SGVsbG8gRXZlcnlvbmUuDQoNClRoaXMgaXMgYSByZW1pbmRlciBmb3IgdG9tb3Jyb3ehr3MgT3Bl
bkJNQyBwbGF0Zm9ybSB0ZWxlbWV0cnkgd29ya2dyb3VwIG1lZXRpbmcgKCBUdWVzZGF5IDA4LzA2
IC0gIDk6MzAgQU0gUFNUKQ0KDQpOZWVyYWoNCg0KLS0tLS1PcmlnaW5hbCBBcHBvaW50bWVudC0t
LS0tDQpGcm9tOiBOZWVyYWogTGFka2FuaQ0KU2VudDogVHVlc2RheSwgSnVuZSA0LCAyMDE5IDEy
OjA5IEFNDQpUbzogTmVlcmFqIExhZGthbmk7IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KQ2M6
IEpvZSBQIE11bGhvbGxhbmQ7IEx1a2UgQ2hlbjsgTWF0dCBDaGVuL1dZSFEvV2l3eW5uOyBEb25n
IFdlaTsgSml0ZW5kcmFfS3VtYXI0QERlbGwuY29tOyBSZWVkIEIgRnJhbmRzZW47IE1pY2hhZWwg
TGltOyBCdWRkeSBIdWFuZyAo/Nz0uPv4KTsgVG9tIFNhbmQ7IEFzbWFhIE1uZWJoaTsgUGF1bC5W
YW5jaWxAZGVsbC5jb207IFRhbm91cywgRWQ7IENocmlzdG9waGVyIEJvc3RpYzsgSmFtZXMgTW9y
c2U7IFZpamF5IEtoZW1rYQ0KU3ViamVjdDogUGxhdGZvcm0gdGVsZW1ldHJ5IGFuZCBoZWFsdGgg
bW9uaXRvcmluZyAtIFBTVCBBTQ0KV2hlbjogVHVlc2RheSwgQXVndXN0IDYsIDIwMTkgOTozMCBB
TS0xMDozMCBBTSAoVVRDLTA4OjAwKSBQYWNpZmljIFRpbWUgKFVTICYgQ2FuYWRhKS4NCldoZXJl
OiBNaWNyb3NvZnQgVGVhbXMgTWVldGluZw0KDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9v
cGVuYm1jL3dpa2kvUGxhdGZvcm0tdGVsZW1ldHJ5LWFuZC1oZWFsdGgtbW9uaXRvcmluZy1Xb3Jr
LUdyb3VwDQoNCg0KDQoNCkpvaW4gTWljcm9zb2Z0IFRlYW1zIE1lZXRpbmc8aHR0cHM6Ly90ZWFt
cy5taWNyb3NvZnQuY29tL2wvbWVldHVwLWpvaW4vMTklM2FtZWV0aW5nX01EVTFORE0yWTJFdE9U
WmtZeTAwWmpJNUxUa3pNRGN0TWpNeFpEWXlOemxoTmpReSU0MHRocmVhZC52Mi8wP2NvbnRleHQ9
JTdiJTIyVGlkJTIyJTNhJTIyNzJmOTg4YmYtODZmMS00MWFmLTkxYWItMmQ3Y2QwMTFkYjQ3JTIy
JTJjJTIyT2lkJTIyJTNhJTIyMWMyOWMyZjctZDM4Ni00YzVhLWEzYmMtMGVlMTNiNDhiYzY1JTIy
JTdkPg0KKzEgMzIzLTg0OS00ODc0PHRlbDorMSUyMDMyMy04NDktNDg3NCwsNzM1NzI4NDIjPiAg
IFVuaXRlZCBTdGF0ZXMsIExvcyBBbmdlbGVzIChUb2xsKQ0KKDg2NikgNjc5LTk5OTU8dGVsOig4
NjYpJTIwNjc5LTk5OTUsLDczNTcyODQyIz4gICAoVG9sbC1mcmVlKQ0KQ29uZmVyZW5jZSBJRDog
NzM1IDcyOCA0MiMNCkxvY2FsIG51bWJlcnM8aHR0cHM6Ly9kaWFsaW4udGVhbXMubWljcm9zb2Z0
LmNvbS84NTUxZjRjMS1iZWEzLTQ0MWEtODczOC02OWFhNTE3YTkxYzU/aWQ9NzM1NzI4NDI+IHwg
UmVzZXQgUElOPGh0dHBzOi8vbXlzZXR0aW5ncy5seW5jLmNvbS9wc3RuY29uZmVyZW5jaW5nPiB8
IExlYXJuIG1vcmUgYWJvdXQgVGVhbXM8aHR0cHM6Ly9nby5taWNyb3NvZnQuY29tL2Z3bGluay8/
bGlua2lkPTg1NzI1MD4gfCBNZWV0aW5nIG9wdGlvbnM8aHR0cHM6Ly90ZWFtcy5taWNyb3NvZnQu
Y29tL21lZXRpbmdPcHRpb25zLz9vcmdhbml6ZXJJZD0xYzI5YzJmNy1kMzg2LTRjNWEtYTNiYy0w
ZWUxM2I0OGJjNjUmdGVuYW50SWQ9NzJmOTg4YmYtODZmMS00MWFmLTkxYWItMmQ3Y2QwMTFkYjQ3
JnRocmVhZElkPTE5X21lZXRpbmdfTURVMU5ETTJZMkV0T1Raa1l5MDBaakk1TFRrek1EY3RNak14
WkRZeU56bGhOalF5QHRocmVhZC52MiZtZXNzYWdlSWQ9MCZsYW5ndWFnZT1lbi1VUz4NCkpvaW4g
d2l0aCBhIHZpZGVvIGNvbmZlcmVuY2luZyBkZXZpY2UNCjgxMzg3ODg5NkB0LnBsY20udmM8bWFp
bHRvOjgxMzg3ODg5NkB0LnBsY20udmM+IFZUQyBDb25mZXJlbmNlIElEOiAwMTc5MjA2ODQNCkFs
dGVybmF0ZSBWVEMgZGlhbGluZyBpbnN0cnVjdGlvbnM8aHR0cHM6Ly9kaWFsaW4ucGxjbS52Yy90
ZWFtcy8/a2V5PTgxMzg3ODg5NiZjb25mPTAxNzkyMDY4ND4NCg0K

--_000_BYAPR21MB1191FD5198A9311CFA234CC5C8D50BYAPR21MB1191namp_
Content-Type: text/html; charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://sc=
hemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-=
html40">
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:KO;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:KO;}
span.EmailStyle19
	{mso-style-type:personal;
	color:#2F5496;
	font-weight:normal;
	font-style:normal;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle21
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
-US">Hello Everyone.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US">This is a reminder for tomorrow=A1=AFs OpenBMC platform telemetry work=
group meeting ( Tuesday 08/06 - &nbsp;9:30 AM PST)
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US">Neeraj<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#002060;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal">-----Original Appointment-----<br>
<b>From:</b> Neeraj Ladkani <br>
<b>Sent:</b> Tuesday, June 4, 2019 12:09 AM<br>
<b>To:</b> Neeraj Ladkani; openbmc@lists.ozlabs.org<br>
<b>Cc:</b> Joe P Mulholland; Luke Chen; Matt Chen/WYHQ/Wiwynn; Dong Wei; Ji=
tendra_Kumar4@Dell.com; Reed B Frandsen; Michael Lim; Buddy Huang (<span la=
ng=3D"KO" style=3D"font-family:&quot;Gulim&quot;,sans-serif">=FC=DC=F4=B8=
=FB=F8</span>); Tom Sand; Asmaa Mnebhi; Paul.Vancil@dell.com; Tanous,
 Ed; Christopher Bostic; James Morse; Vijay Khemka<br>
<b>Subject:</b> Platform telemetry and health monitoring - PST AM <br>
<b>When:</b> Tuesday, August 6, 2019 9:30 AM-10:30 AM (UTC-08:00) Pacific T=
ime (US &amp; Canada).<br>
<b>Where:</b> Microsoft Teams Meeting<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/openbmc/wiki/P=
latform-telemetry-and-health-monitoring-Work-Group">https://github.com/open=
bmc/openbmc/wiki/Platform-telemetry-and-health-monitoring-Work-Group</a><o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://teams.microsoft.com/l/meetup-join/=
19%3ameeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDctMjMxZDYyNzlhNjQy%40thread.v2/0=
?context=3D%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22O=
id%22%3a%221c29c2f7-d386-4c5a-a3bc-0ee13b48bc65%22%7d" target=3D"_blank"><s=
pan style=3D"font-size:13.5pt;font-family:&quot;Segoe UI Semibold&quot;,san=
s-serif;color:#6264A7">Join
 Microsoft Teams Meeting</span></a> <o:p></o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:&#43;1%20323-849-4874,,73572842# " tar=
get=3D"_blank"><span style=3D"font-size:10.5pt;color:#6264A7;text-decoratio=
n:none">&#43;1 323-849-4874</span></a>
</span><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424">&nbsp; United States, Los Angeles (Toll)
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:(866)%20679-9995,,73572842# " target=
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
s-serif;color:#252424">735 728 42#
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:.25in">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://dialin.teams.microsoft.com/8551f4c=
1-bea3-441a-8738-69aa517a91c5?id=3D73572842" target=3D"_blank"><span style=
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
011db47&amp;threadId=3D19_meeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDctMjMxZDYyN=
zlhNjQy@thread.v2&amp;messageId=3D0&amp;language=3Den-US" target=3D"_blank"=
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
 VTC Conference ID: 017920684 <o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:15.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Seg=
oe UI&quot;,sans-serif;color:#252424"><a href=3D"https://dialin.plcm.vc/tea=
ms/?key=3D813878896&amp;conf=3D017920684"><span style=3D"color:#6264A7;text=
-decoration:none">Alternate VTC dialing instructions</span></a>
<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR21MB1191FD5198A9311CFA234CC5C8D50BYAPR21MB1191namp_--
