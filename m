Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C58A9F81E1
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2019 22:08:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Bk4G5dZgzF1pS
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 08:08:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=2a01:111:f400:fe51::718;
 helo=nam05-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="KZ+IBS9Y"; dkim-atps=neutral
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0718.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::718])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Bk3H23gMzF3n7
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 08:07:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKPVGLy/cKgQk1vPMduw5vnzVpmoskDagKYStnydQYL1lGZWuLLy3UPLDCDsiq91Nx5Mym/N9p6nC18CC1v3O1P/8ILITHfbX8+w+NHmCADOTovLw9QSD6/HL/4f8rb7PpcyuolU+bWZyFx+Nx6yK14JS8FFFRMILWClqsRNCXPH/GuSWIY5TLXCDl5G3okidhttcVh5BhA3BZxreWWYGS1C0htAU3f48aSBmPzrizsZ1wQ8b8f5uOLoreHk0xCD+xTQqZETSr+a2J+ELpEvR4pPQAvYS792WvYQ8FT/FpIJBmk4Xb4N1RF+ubdCQkwKqPLiUNAp4uHDVQgvCpdwQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5mZ2WLtYhQ8y9MDZGOEp9KwCAy5Q7/q13RPNy2m+2Y=;
 b=QQrR5zMqjuVSbKVEy65JY8xu69WzIJr9TLBzTNE/18LOiObFzejY9gWiKR+O88EIOlqBABlXmjkD6M4oiY/7Aj18BmCKYIV+9QCZiIuhKiJihWTzmAXnnVX6/ygD2Hhuhv3xxGIXXHqJWc/aSXj+9pE6VicS0WAcZ9ImBE3NL9bN+/d0i1JxwniCaMcpaSFZy2D6nfFqE0/fKwyAug5D3xI42uvdL25WY6FdgDHH4xOM/U4fomTx1g/c5ByrM8bcf93PyW8bhIJqFzTIWXX2VVYRDKtqdwd/Cv+oC7TphX8bXFhF0UbUHeZ3Ymwzu/Hkf3pL2WStD4/jP4O1kJLQcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5mZ2WLtYhQ8y9MDZGOEp9KwCAy5Q7/q13RPNy2m+2Y=;
 b=KZ+IBS9YvGB2FYSqpIfD2sY8E4pJyxV367UPCW+p/hNfrFTA1rhgF6WUmU8i6CqI+awqCvq8MvnDQjU4UQWDNa+irfQDNPYQcgowlWnDCs7s3pyXBVj9wvtpIIGJJAv8nYcieusnQbIaNe9A6Pyh9PNK6QzyR3jJsuVI8+iFZPs=
Received: from BYAPR21MB1191.namprd21.prod.outlook.com (20.179.56.209) by
 BYAPR21MB1336.namprd21.prod.outlook.com (20.179.60.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.11; Mon, 11 Nov 2019 21:07:16 +0000
Received: from BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::9541:440a:c6d7:562a]) by BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::9541:440a:c6d7:562a%7]) with mapi id 15.20.2451.018; Mon, 11 Nov 2019
 21:07:16 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Platform Telemetry workgroup- bi-weekly sync 
Thread-Topic: Platform Telemetry workgroup- bi-weekly sync 
Thread-Index: AdVyi2uS47ovS1jOTeK/p2xl45QzrAmSGqGw
Date: Mon, 11 Nov 2019 21:07:15 +0000
Message-ID: <BYAPR21MB1191DD2B122E9B9BB778A198C8740@BYAPR21MB1191.namprd21.prod.outlook.com>
References: <BYAPR21MB119199DBC98499C443F9B9C2C89D0@BYAPR21MB1191.namprd21.prod.outlook.com>
In-Reply-To: <BYAPR21MB119199DBC98499C443F9B9C2C89D0@BYAPR21MB1191.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-11-11T21:07:14.1860731Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=eef53c17-47c8-4a5d-9ffa-daa1ae61b319;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [2001:4898:80e8:3:f4d9:f334:9a74:3c69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c8f34844-0496-45c0-3231-08d766eb2170
x-ms-traffictypediagnostic: BYAPR21MB1336:
x-microsoft-antispam-prvs: <BYAPR21MB13368F86260B2C33432D7E0AC8740@BYAPR21MB1336.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(39860400002)(376002)(346002)(396003)(9763003)(199004)(189003)(476003)(52536014)(76116006)(2501003)(74316002)(486006)(6916009)(54906003)(86362001)(8936002)(99286004)(186003)(4326008)(46003)(7736002)(7416002)(53546011)(7696005)(5660300002)(6506007)(66946007)(446003)(11346002)(33656002)(4743002)(76176011)(102836004)(71200400001)(71190400001)(66476007)(64756008)(66556008)(66446008)(8990500004)(2906002)(25786009)(6246003)(229853002)(10090500001)(2351001)(10290500003)(9686003)(478600001)(606006)(236005)(316002)(54896002)(6306002)(5640700003)(81156014)(1730700003)(81166006)(55016002)(790700001)(6116002)(8676002)(6436002)(14454004)(256004)(22452003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR21MB1336;
 H:BYAPR21MB1191.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4cLpxYjn194pGSKV0JB04jX0msNxHz8KHVUi2NSXfo/f3X7vkWyB3de7NwD+3VnhATxVsDNVzvoka64aFll+xfYhpeY/nlVJ37M67gaHHRrgrdVdOkjJMjmui3vo+LMm73iQ9dI4eRhpnLfFrAZNYsoGk3TObWd18LhDo2u7iBh2fuw7CifBLEb4WE74+/lOxq3abbxdoW9Uf3xlztiiUcoiwX+mruEuw0ZZB+u5WZBihR2wWDVejxh2ts8FqiluqA8qPi1k8gi2VndPU/KbLDQ/Msl92bvJolHGcFEt2u4UxJAM+7LlifCSEmKHRuEpSGOPewuPzwk97aZ4pTeD1XIWlvcaK8XnT4A3nWTNV6K91g0cE3Ek9On4VMkqnhY8q8Pu2/Tuetrlp5qG1qS3jiWsm9fBMVmalh4JgqIipSLJDbwU7PmzkS1AySZ7NhA7
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR21MB1191DD2B122E9B9BB778A198C8740BYAPR21MB1191namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f34844-0496-45c0-3231-08d766eb2170
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 21:07:15.8484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cCt91gP2bzPRD+sLTmw81egTqXHsZWqRW+GgphXXIR4k8tjIT76iQVkkYFL30NPEdJ/kji78lbijXwqpL/yE/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1336
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
 <Will.Liang@quantatw.com>, Dick Wilkins <Dick_Wilkins@phoenix.com>,
 =?ks_c_5601-1987?B?QnVkZHkgSHVhbmcgKPzc9Lj7+Ck=?= <Buddy.Huang@quantatw.com>,
 "Tanous, Ed" <ed.tanous@intel.com>, Michael Lim <youhour@us.ibm.com>,
 Reed B Frandsen <rfrandse@us.ibm.com>, Dong Wei <Dong.Wei@arm.com>,
 "Matuszczak, 
 Piotr" <piotr.matuszczak@intel.com>, Amithash Prasad <amithash@fb.com>,
 Vijay Khemka <vijaykhemka@fb.com>, Saqib Khan <khansa@us.ibm.com>,
 Matt Chen/WYHQ/Wiwynn <Matt_Chen@wiwynn.com>, "Pandya,
 Anup" <anup.pandya@intel.com>, Jen Spatz <Jen.Spatz@ibm.com>,
 Luke Chen <luke_chen@aspeedtech.com>, Joe P Mulholland <jpmulhol@us.ibm.com>,
 Tom Sand <trsand@us.ibm.com>, Alan Mimms <Alan_Mimms@Jabil.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_BYAPR21MB1191DD2B122E9B9BB778A198C8740BYAPR21MB1191namp_
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64

SSBoYXZlIGEgaGFyZCBjb25mbGljdCB0b21vcnJvdyBhbmQgd29udCBiZSBhYmxlIHRvIGRpYWwg
aW4gdG8gdGhlIG1lZXRpbmcuIFBsZWFzZSBmZWVsIGZyZWUgdG8gbWVldCBhbmQgZGlzY3Vzcy4N
Cg0KVGhhbmtzDQpOZWVyYWoNCg0KDQotLS0tLU9yaWdpbmFsIEFwcG9pbnRtZW50LS0tLS0NCkZy
b206IE5lZXJhaiBMYWRrYW5pDQpTZW50OiBNb25kYXksIFNlcHRlbWJlciAyMywgMjAxOSA4OjUz
IFBNDQpUbzogTmVlcmFqIExhZGthbmk7IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KQ2M6IE1h
dHQgQ2hlbi9XWUhRL1dpd3lubjsgQWxhbiBNaW1tczsgU2FxaWIgS2hhbjsgTHVrZSBDaGVuOyBU
YW5vdXMsIEVkOyBNYXR1c3pjemFrLCBQaW90cjsgRG9uZyBXZWk7IERpY2sgV2lsa2luczsgSm9l
IFAgTXVsaG9sbGFuZDsgQnVkZHkgSHVhbmcgKPzc9Lj7+Ck7IFJlZWQgQiBGcmFuZHNlbjsga3Vu
eWlAZ29vZ2xlLmNvbTsgVmlqYXkgS2hlbWthOyBNaWNoYWVsIExpbTsgSmVuIFNwYXR6OyBBbWl0
aGFzaCBQcmFzYWQ7IFRvbSBTYW5kOyBQYW5keWEsIEFudXA7IFdpbGwgTGlhbmcgKNXZ57X66Ck7
IENocmlzIEF1c3Rlbg0KU3ViamVjdDogUGxhdGZvcm0gVGVsZW1ldHJ5IHdvcmtncm91cC0gYmkt
d2Vla2x5IHN5bmMNCldoZW46IFR1ZXNkYXksIE5vdmVtYmVyIDEyLCAyMDE5IDk6MzAgQU0tMTA6
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

--_000_BYAPR21MB1191DD2B122E9B9BB778A198C8740BYAPR21MB1191namp_
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
-US">I have a hard conflict tomorrow and wont be able to dial in to the mee=
ting. Please feel free to meet and discuss.
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
<b>Cc:</b> Matt Chen/WYHQ/Wiwynn; Alan Mimms; Saqib Khan; Luke Chen; Tanous=
, Ed; Matuszczak, Piotr; Dong Wei; Dick Wilkins; Joe P Mulholland; Buddy Hu=
ang (<span lang=3D"KO" style=3D"font-family:&quot;Gulim&quot;,sans-serif">=
=FC=DC=F4=B8=FB=F8</span>); Reed B Frandsen; kunyi@google.com;
 Vijay Khemka; Michael Lim; Jen Spatz; Amithash Prasad; Tom Sand; Pandya, A=
nup; Will Liang (<span lang=3D"KO" style=3D"font-family:&quot;Gulim&quot;,s=
ans-serif">=D5=D9=E7=B5=FA=E8</span>); Chris Austen<br>
<b>Subject:</b> Platform Telemetry workgroup- bi-weekly sync <br>
<b>When:</b> Tuesday, November 12, 2019 9:30 AM-10:30 AM (UTC-08:00) Pacifi=
c Time (US &amp; Canada).<br>
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

--_000_BYAPR21MB1191DD2B122E9B9BB778A198C8740BYAPR21MB1191namp_--
