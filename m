Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C6212A5D1
	for <lists+openbmc@lfdr.de>; Wed, 25 Dec 2019 04:26:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47jJR96bQzzDqLq
	for <lists+openbmc@lfdr.de>; Wed, 25 Dec 2019 14:26:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-hk2-obe.outbound.protection.outlook.com
 (client-ip=40.107.130.57; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chma0@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="mmmdAmB7"; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300057.outbound.protection.outlook.com [40.107.130.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47jJQX5C15zDqCk
 for <openbmc@lists.ozlabs.org>; Wed, 25 Dec 2019 14:26:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+5aTeSbFtkimabBRbqzXTy/FSsuAO0dFrOMeghBvi5TWVOBQGjsZ8ZdFX1mL3bD+qTV6Vnm/sJ/sL0+gbIOUH9hHhh+/vNqJQZ7TRg/xKT4jxKaB8gOKEoo+aXGtk5s/6xMoT3HuszKUnBvA4MqSYWKeQrxXpcashiSy/GLf6DGPvtUjAv8KhkkyqmoidTElbhpDH0i/Ctgj8zuvKzYFLYykC0nXI8Yyn3SRnyO/tW/6eLuIyMG7dwJc6oMOPp39yRjq3WcHGAH2m34VAo87t1Aex4ijT7/jFncGYLidnSiS99DdoOLSiLHcUv+E+Miqzif6fRCSIMCcMi/upBVwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+AiSRvEWg3wwYzOJtTTGSV5k3Ilpbpz1cGvLoLvptY=;
 b=daRNbYpf0u9q32R0dwL64W+eJB/HhPOh1QFXdTaYGNuHvMqsco6zREcZoooZ8nS7l1YDr5lAx11EKw7T6NXCurrryUsw//mEfzVRDJIKTGUjvLEvz+/ZZuyLesRNOODmYYpn7SR2q/DtfDhzsubV/uxV+TJkEiXz5pRnXrIhzETjl0hFX+QLMfxx2XvOozuBPdg4+LDI95weCefJt0roD42GIyz/89PG4aqjiAY6dLczsD8sA4Lmb4FGMRHCSOX+pkxwWIZNi1uhLXWP3vPs4wzYHaXS4mvd0MZ4faEd79XOiDAaL59Q3tZd1R6VIzqqVj3BfJJFKGeBm7/i4ldDow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+AiSRvEWg3wwYzOJtTTGSV5k3Ilpbpz1cGvLoLvptY=;
 b=mmmdAmB7bnf2ggtL0kLeXhDasspYyIM3IrqsKFW2jkMWTYLgkwmvyRkXHhDUCD5CFFCkLIGcpIgPyA0aN6SDTEFl1qxEYhD/sSpwfbnsiWMKbTqXOoJBYuJhJP5MItPEsYHspODHOa5/aepgsetPeCZBWr3ARJESU86fP6Dmyns=
Received: from HK0PR03MB4082.apcprd03.prod.outlook.com (20.177.165.140) by
 HK0PR03MB3508.apcprd03.prod.outlook.com (52.133.214.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.6; Wed, 25 Dec 2019 03:26:03 +0000
Received: from HK0PR03MB4082.apcprd03.prod.outlook.com
 ([fe80::8aa:8cde:2f85:9734]) by HK0PR03MB4082.apcprd03.prod.outlook.com
 ([fe80::8aa:8cde:2f85:9734%7]) with mapi id 15.20.2581.007; Wed, 25 Dec 2019
 03:26:03 +0000
From: CS20 CHMa0 <CHMA0@nuvoton.com>
To: rgrs <rgrs@protonmail.com>
Subject: RE: BMC UUID property/object not found
Thread-Topic: BMC UUID property/object not found
Thread-Index: AQHVuiSciOgdyLBTTEirlOOIYBb4N6fI2knggAAGg0CAACWQAIABKBdg
Date: Wed, 25 Dec 2019 03:26:03 +0000
Message-ID: <HK0PR03MB40821DBC9F67A5404C16AE6EF5280@HK0PR03MB4082.apcprd03.prod.outlook.com>
References: <yepdfnStu5NH94jUzVoKLGdX2kVPErynD7ERZlcm_Ig8_K1zkvmSLoC1SYhdm0b3ASb_B8D0r_PTN5Ct_kGk_3aoyi31V6GaM0q3T_DxunU=@protonmail.com>
 <HK0PR03MB406851FE695528554F3911ABAE290@HK0PR03MB4068.apcprd03.prod.outlook.com>
 <HK0PR03MB40827561EECBF2D0EC561769F5290@HK0PR03MB4082.apcprd03.prod.outlook.com>
 <ehAiYrBbR44jLPINP8G9C8UcNQ3L5f4_WeKYRWs8sy4MLU_kIKn-fb1fBMabK6K081TGtXfpbPLVEXm50w0zTkiBRpUpzX1pPON9GMYCegk=@protonmail.com>
In-Reply-To: <ehAiYrBbR44jLPINP8G9C8UcNQ3L5f4_WeKYRWs8sy4MLU_kIKn-fb1fBMabK6K081TGtXfpbPLVEXm50w0zTkiBRpUpzX1pPON9GMYCegk=@protonmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=CHMA0@nuvoton.com; 
x-originating-ip: [223.139.30.165]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d17169b-58bb-481e-53da-08d788ea2be9
x-ms-traffictypediagnostic: HK0PR03MB3508:|HK0PR03MB3508:
x-microsoft-antispam-prvs: <HK0PR03MB35082D3C5B5A5EB3D50D3AA5F5280@HK0PR03MB3508.apcprd03.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 02622CEF0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(39840400004)(366004)(376002)(346002)(199004)(189003)(966005)(86362001)(186003)(64756008)(9686003)(66446008)(66556008)(66476007)(26005)(66946007)(53546011)(6506007)(76116006)(8676002)(2906002)(8936002)(55016002)(81166006)(81156014)(71200400001)(52536014)(33656002)(4326008)(7696005)(5660300002)(478600001)(316002)(6916009)(115813001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HK0PR03MB3508;
 H:HK0PR03MB4082.apcprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nuvoton.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y06hY6kSkNc/0FtH8oD1AakMxfmHHnNwTVuaDC4nxHhocakhK1HZPU6WwJJeyt+2OCEtSQnJ9CL6KEzYl5hqiYnXAREMKH+Ycne3jVBHJbRiDz93Kc7G/xiM7osEdqypJupzCO3JGFvUJ8XiyLvieHLyyS3qkzeJvzVmb7ojafRgMks+92WnYiXz9vDZlM8otdUBUtNdTNIRpe6tkT5l2NQd0LyOzX1quHqofuhnQ6jym/wD5Kug1TnM4Z2l5ntZdsM0aPHaNqSP/osbERlHpEMnojqs8QiCA7V4Jw+BMJrbnTeM7NLCStPAeWYfR4AfcRN3ix+HNARtBpBIfhnJiMkkX07uKSzQXhr+IHSlRWdb12WsUBUcEBNy9o3k8nQZ0ZHh6BzHQkOLGuO5XR7Nq/KtgjmuIC9BDmhZPyI/OjTe0yrO9xh/CFhYLZ8sHxz6hwKRXaFu51SnvwvntDn8SIQOwImY92qyj5AHe28x+Ae0QGzvPmPESMwgJDI5H6lWURNDGeDyw96hexefGfx6tw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d17169b-58bb-481e-53da-08d788ea2be9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2019 03:26:03.6221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yK8QwhLRo4Gcj3MvXEeaeS7Z4Tc3VCJsl2RieNlUAfm3miU6N0IgocjU1UhBop+KYzVfnTy75+k1VPXwgp2bbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3508
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgUmFqLA0KWW91IGNhbiBjaGVjayB0aGUgaW52ZW50b3J5IHNlcnZpY2UuDQpJcG1pZCByZXR1
cm4gQk1DIFVVSUQgYnkgZ2V0IEQtQnVzIHByb3BlcnR5IGZyb20gaW52ZW50b3J5IHNlcnZpY2Uu
DQpBbmQgaW52ZW50b3J5IHNlcnZpY2Ugd2lsbCByZWFkIHNvbWUgY29uZmlndXJhdGlvbiBmaWxl
IHdoaWxlIHN0YXJ0dXAgbGlrZQ0KaHR0cHM6Ly9naXRodWIuY29tL051dm90b24tSXNyYWVsL29w
ZW5ibWMvYmxvYi9ydW5ibWMvbWV0YS1xdWFudGEvbWV0YS1vbHltcHVzLW51dm90b24vcmVjaXBl
cy1waG9zcGhvci9jb25maWd1cmF0aW9uL29seW1wdXMtbnV2b3Rvbi15YW1sLWNvbmZpZy9vbHlt
cHVzLW51dm90b24taXBtaS1mcnUtYm1jLnlhbWwNCklmIHRoZSBGUlUgaGFzIG5vIEJNQyBVVUlE
IGRhdGEgb3Igbm90IGNvbmZpZ3VyZSBCTUMgVVVJRCBpbiBpbnZlbnRvcnkgc2VydmljZSwgdGhl
IHByb3BlcnR5IHdvdWxkIG5vdCBleGlzdC4NCg0KVGhhbmtzLA0KQnJpYW4NCg0K4oCQ4oCQ4oCQ
4oCQ4oCQ4oCQ4oCQIE9yaWdpbmFsIE1lc3NhZ2Ug4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ4oCQDQpGcm9t
OiByZ3JzIDxyZ3JzQHByb3Rvbm1haWwuY29tPg0KU2VudDogVHVlc2RheSwgRGVjZW1iZXIgMjQs
IDIwMTkgNTozNCBQTQ0KVG86IENTMjAgQ0hNYTAgPENITUEwQG51dm90b24uY29tPg0KQ2M6IG9w
ZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUkU6IEJNQyBVVUlEIHByb3BlcnR5L29i
amVjdCBub3QgZm91bmQNCg0KSGkgQnJpYW4sDQoNClRoZXkgYXJlIGVuYWJsZWQsIElzIHRoZXJl
IGFueXRoaW5nIGVsc2UgaSBzaG91bGQgbG9vayBhdD8NCg0KJCBncmVwIC1yaW4gIkNPTkZJR19D
UllQVE9fIiBkZWZjb25maWcNCjIxNjpDT05GSUdfQ1JZUFRPX0hNQUM9eQ0KMjE3OkNPTkZJR19D
UllQVE9fU0hBMjU2PXkNCjIxODpDT05GSUdfQ1JZUFRPX1VTRVJfQVBJX0hBU0g9eQ0KMjM0OiMg
Q09ORklHX0NSWVBUT19FQ0hBSU5JViBpcyBub3Qgc2V0DQoyMzU6IyBDT05GSUdfQ1JZUFRPX0hX
IGlzIG5vdCBzZXQNCg0KVGhhbmtzLA0KUmFqDQoNCuKAkOKAkOKAkOKAkOKAkOKAkOKAkCBPcmln
aW5hbCBNZXNzYWdlIOKAkOKAkOKAkOKAkOKAkOKAkOKAkA0KT24gVHVlc2RheSwgRGVjZW1iZXIg
MjQsIDIwMTkgMTI6NTkgUE0sIENTMjAgQ0hNYTAgPG1haWx0bzpDSE1BMEBudXZvdG9uLmNvbT4g
d3JvdGU6DQoNCkhpIFJhaiwNClRoZSBzeXN0ZW1kIGdldCBVVUlEIGZ1bmN0aW9uIG5lZWQgS2Vy
bmVsIEFQSSBzdXBwb3J0Lg0KTWF5YmUgeW91IGNhbiBjaGVjayBLZXJuZWwgY29uZmlndXJhdGlv
biBmaXJzdC4NCg0KaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0
dHBzLTNBX19naXRodWIuY29tX3N5c3RlbWRfc3lzdGVtZF9ibG9iX21hc3Rlcl9SRUFETUUtMjNM
NTEmZD1Ed01HYVEmYz11ZThtTzh6Z0M0Vlo0cV9hTlZLdDhHOU1DMDFVRkRtaXN2TVIxay1Fb0RN
JnI9ZG9OTm5TNnBhTEwteFJSOVZXMUdZRXRZVTgydlBHVE12X2hFNW5lQ2NXSSZtPUdBbjFrTkxM
dnFCSFJiRUVZejhDbEk3SFFBeEVnSnd1bDRNMWtDd2lsVVkmcz1pR1NSMmdNcWNkNFl6WVU2d211
RWlyQjRKOER2bHFSc2RJbm1zT1FZRlNBJmU9DQpLZXJuZWwgY3J5cHRvL2hhc2ggQVBJDQpDT05G
SUdfQ1JZUFRPX0hNQUMNCkNPTkZJR19DUllQVE9fU0hBMjU2DQpDT05GSUdfQ1JZUFRPX1VTRVJf
QVBJX0hBU0gNCg0KVGhhbmtzLA0KQnJpYW4NCg0KRnJvbTogb3BlbmJtYyA8bWFpbHRvOm9wZW5i
bWMtYm91bmNlcytrd2xpdT1udXZvdG9uLmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYg
T2Ygcmdycw0KU2VudDogVHVlc2RheSwgRGVjZW1iZXIgMjQsIDIwMTkgMjozNyBQTQ0KVG86IG1h
aWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IEJNQyBVVUlEIHByb3BlcnR5
L29iamVjdCBub3QgZm91bmQNCg0KSGksDQoNCkkgZ2V0IGJlbG93IGVycm9yIG1lc3NhZ2Ugb24g
ImlwbWl0b29sIG1jIGd1aWQiIGNvbW1hbmQsDQoNCkRlYyAyNCAwNTowOTozMyBvYm1jIGlwbWlk
WzE0NTddOiBGYWlsZWQgaW4gcmVhZGluZyBCTUMgVVVJRCBwcm9wZXJ0eQ0KRGVjIDI0IDA1OjA5
OjQyIG9ibWMgaXBtaWRbMTQ1N106IE5vIE9iamVjdCBoYXMgaW1wbGVtZW50ZWQgdGhlIGludGVy
ZmFjZQ0KRGVjIDI0IDA1OjA5OjQyIG9ibWMgaXBtaWRbMTQ1N106IFRoZSBvcGVyYXRpb24gZmFp
bGVkIGludGVybmFsbHkuDQoNCklzIHRoaXMgc2FtZSBhcw0KaHR0cHM6Ly91cmxkZWZlbnNlLnBy
b29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19naXRodWIuY29tX29wZW5ibWNfb3BlbmJt
Y19pc3N1ZXNfMzUzMiZkPUR3TUdhUSZjPXVlOG1POHpnQzRWWjRxX2FOVkt0OEc5TUMwMVVGRG1p
c3ZNUjFrLUVvRE0mcj03ZzJEMVhEYzFFVDNDblkxeVNuYVdRWFB4UHhmcEx3dzFNaURiTFc0djhR
Jm09dkhXUjNJVTNIQWgwdUZ5VG14bkV3T2RsT05IaFczRlk0RlR6WjAxbWpSVSZzPXRiaHdhLWdo
cUVtdzRjZmdVenNmNjFJcTRCY29VN2ZNMEJpdzk0TzUweFEmZT0NCg0KV2hpY2ggYXBwL3NlcnZp
Y2UgaW1wbGVtZW50cyB0aGlzIGludGVyZmFjZT8NCg0KVGhhbmtzDQoNClJhag0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpUaGUgcHJpdmlsZWdlZCBjb25maWRl
bnRpYWwgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZW1haWwgaXMgaW50ZW5kZWQgZm9y
IHVzZSBvbmx5IGJ5IHRoZSBhZGRyZXNzZWVzIGFzIGluZGljYXRlZCBieSB0aGUgb3JpZ2luYWwg
c2VuZGVyIG9mIHRoaXMgZW1haWwuIElmIHlvdSBhcmUgbm90IHRoZSBhZGRyZXNzZWUgaW5kaWNh
dGVkIGluIHRoaXMgZW1haWwgb3IgYXJlIG5vdCByZXNwb25zaWJsZSBmb3IgZGVsaXZlcnkgb2Yg
dGhlIGVtYWlsIHRvIHN1Y2ggYSBwZXJzb24sIHBsZWFzZSBraW5kbHkgcmVwbHkgdG8gdGhlIHNl
bmRlciBpbmRpY2F0aW5nIHRoaXMgZmFjdCBhbmQgZGVsZXRlIGFsbCBjb3BpZXMgb2YgaXQgZnJv
bSB5b3VyIGNvbXB1dGVyIGFuZCBuZXR3b3JrIHNlcnZlciBpbW1lZGlhdGVseS4gWW91ciBjb29w
ZXJhdGlvbiBpcyBoaWdobHkgYXBwcmVjaWF0ZWQuIEl0IGlzIGFkdmlzZWQgdGhhdCBhbnkgdW5h
dXRob3JpemVkIHVzZSBvZiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gb2YgTnV2b3RvbiBpcyBz
dHJpY3RseSBwcm9oaWJpdGVkOyBhbmQgYW55IGluZm9ybWF0aW9uIGluIHRoaXMgZW1haWwgaXJy
ZWxldmFudCB0byB0aGUgb2ZmaWNpYWwgYnVzaW5lc3Mgb2YgTnV2b3RvbiBzaGFsbCBiZSBkZWVt
ZWQgYXMgbmVpdGhlciBnaXZlbiBub3IgZW5kb3JzZWQgYnkgTnV2b3Rvbi4NCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQogVGhlIHByaXZpbGVnZWQgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0
aGlzIGVtYWlsIGlzIGludGVuZGVkIGZvciB1c2Ugb25seSBieSB0aGUgYWRkcmVzc2VlcyBhcyBp
bmRpY2F0ZWQgYnkgdGhlIG9yaWdpbmFsIHNlbmRlciBvZiB0aGlzIGVtYWlsLiBJZiB5b3UgYXJl
IG5vdCB0aGUgYWRkcmVzc2VlIGluZGljYXRlZCBpbiB0aGlzIGVtYWlsIG9yIGFyZSBub3QgcmVz
cG9uc2libGUgZm9yIGRlbGl2ZXJ5IG9mIHRoZSBlbWFpbCB0byBzdWNoIGEgcGVyc29uLCBwbGVh
c2Uga2luZGx5IHJlcGx5IHRvIHRoZSBzZW5kZXIgaW5kaWNhdGluZyB0aGlzIGZhY3QgYW5kIGRl
bGV0ZSBhbGwgY29waWVzIG9mIGl0IGZyb20geW91ciBjb21wdXRlciBhbmQgbmV0d29yayBzZXJ2
ZXIgaW1tZWRpYXRlbHkuIFlvdXIgY29vcGVyYXRpb24gaXMgaGlnaGx5IGFwcHJlY2lhdGVkLiBJ
dCBpcyBhZHZpc2VkIHRoYXQgYW55IHVuYXV0aG9yaXplZCB1c2Ugb2YgY29uZmlkZW50aWFsIGlu
Zm9ybWF0aW9uIG9mIE51dm90b24gaXMgc3RyaWN0bHkgcHJvaGliaXRlZDsgYW5kIGFueSBpbmZv
cm1hdGlvbiBpbiB0aGlzIGVtYWlsIGlycmVsZXZhbnQgdG8gdGhlIG9mZmljaWFsIGJ1c2luZXNz
IG9mIE51dm90b24gc2hhbGwgYmUgZGVlbWVkIGFzIG5laXRoZXIgZ2l2ZW4gbm9yIGVuZG9yc2Vk
IGJ5IE51dm90b24uDQo=
