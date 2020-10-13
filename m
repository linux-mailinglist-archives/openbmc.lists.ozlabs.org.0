Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 131C228CA58
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 10:37:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9TRq1yX2zDqs8
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 19:36:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.255.55;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=CH9cFwfm; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-oln040092255055.outbound.protection.outlook.com [40.92.255.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9TQs4BP7zDqcS
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 19:36:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ms7TZFvkpm0l9zzBI+JHSGWGLpKppXEsoOTFdz/PUENPk5pJwyHyWX/tD1z1mbJzdSasZd4N8Hmlsv6SHNrg/MB2Ex3jCpMx2OhbeHWIopbUJz+CkQsAy868/rnqFhiv+kXAJ1ICD5U4afgTtwOcIKMy+ltDTz5pGZaunEiEUmHTmcJP5tmYO7RoJL2Boh7sfXTMNngmqv4LJdm6k8eLU5zYs3UeYLhK9/K+bb0sP5v0vuLotEsR/bmw/91vB36QYmdLtddBA9BvPbVBlWsdcaNLXoKxHxNLdpl9J3zX6WRWjvgWDaBZz23lA2f+44l+c51DsNfmOMqe6kk0qez9mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxfrcyeN/J0UQAjSOvvxz16fwQlmQEvM9HmO0yr6+KY=;
 b=STsX/bBAUXr4duvK6NOJLw74VhMskjXbX5UnY1ZP+Yh87Ca4xoL0a5HRybUdMPXZIMJmmfUZ+vMprh34IWS7MG42z6rPXC8BA3nV2J01CawKIpALfTBrjByoDw3m9bqX+ENW6Rfi4NTDWYab5IUMZfX9wICXJGHhq/BfKscioOn+Wx/3D8d8Kytpq5CgOm7yRuDoWjNyzY/13GjJWC/5ip5/TUv//JJGiwz3XIcS9UK7L+NyiNYGO1rmjMxZUgBc9BQqcMFQIIYAfZEAxlKP1X806tDMYYRztdQx/GzyyU2LSUpFdF2WfTKd9xrOPHYLOdqtJyhYl/dnavOoiClnOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxfrcyeN/J0UQAjSOvvxz16fwQlmQEvM9HmO0yr6+KY=;
 b=CH9cFwfmznRp1bQK3lB1E555sav9WaCEcapR71TSy4YQqh9mzuaXWUM1Of1hev89maKLnOLcC9JBaXBSpnGebCVYZW/3sNvWrv2VKEZbuloIT9INumLP9jsr54jhWSJ2QQ9NrfDP024ieYs/9Uy5Vsh8C7TUdNVmTPtvjFOog9Wdj/likgs5kECewDxZg1Yb2iffKpIi5TOAMjka3Jx8Ni/0JPKRKozlL2D1lisgqQTOX2nNFlqejZjLRBNor+Hz5kF2lZGEC33oKDnqMp/wGM62awmXaHCXzhmyZg1VK4yNUwTOTZBTq20OQn8KqE4FwmAgg89YU5tfjZ9LHRZnAg==
Received: from PU1APC01FT021.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::41) by
 PU1APC01HT071.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::397)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Tue, 13 Oct
 2020 08:35:23 +0000
Received: from HK0PR04MB2883.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebe::41) by PU1APC01FT021.mail.protection.outlook.com
 (2a01:111:e400:7ebe::221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Tue, 13 Oct 2020 08:35:23 +0000
Received: from HK0PR04MB2883.apcprd04.prod.outlook.com
 ([fe80::5c81:1d05:59a:3639]) by HK0PR04MB2883.apcprd04.prod.outlook.com
 ([fe80::5c81:1d05:59a:3639%4]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 08:35:23 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: The latest code of openbmc-master failed to compile, please take a
 look, thank you.
Thread-Topic: The latest code of openbmc-master failed to compile, please take
 a look, thank you.
Thread-Index: AQHWoTri8Y04pEMsaESWljNQT0sD/Q==
Date: Tue, 13 Oct 2020 08:35:23 +0000
Message-ID: <HK0PR04MB28839DFD113446F4DE202799FE040@HK0PR04MB2883.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:3A320451495B65A6CEC6893B3634DE5EC06526A6419FBF62E32F0D694F69EABD;
 UpperCasedChecksum:08750FE4F5D03CFFDA1E03D7B4674160744BF6FBD766C21761C36BC5409EB9F7;
 SizeAsReceived:6773; Count:42
x-tmn: [lJSVdZQ1HZwM3dW3n55bddVhi2IZbKHC]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 1920e8ee-90dc-4313-cef8-08d86f52eda4
x-ms-traffictypediagnostic: PU1APC01HT071:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GyDhu81FKW0lDVlSBzTiD0l5k365ggjLlKLy8z3XsoXfGWBH4TdqjIZKY2OfTilNqAXsGn9b/tB8kEfxoeMPCISiaVMiwu2g6/Bir1noMW1Aa/Tn5EgdbBHmXrtE6mZ2jOkxxZADMvWugASVqnNrMi41MZZlA+sNpBxsITUuFdGlp+Oymd5r2rhz++xB0WmBXTndXHsnGCGyVeEuwTKrRw==
x-ms-exchange-antispam-messagedata: hoXEwlTV2lfb0HPE5xPpdRxj07lhujJmEs7TmHBVHeRwixhnAMJmdhiHSqn4B+pcJx+3CLpe8jilIZKn+Jh7Iylv06g/ASqDq170g7IvEHUxTUmQO9JQ7HofQgnyEOyxqU/x+uI+ZBhne9CuWIygyA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB28839DFD113446F4DE202799FE040HK0PR04MB2883apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT021.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1920e8ee-90dc-4313-cef8-08d86f52eda4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2020 08:35:23.6728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT071
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
Cc: "uperic@163.com" <uperic@163.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB28839DFD113446F4DE202799FE040HK0PR04MB2883apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGVsbG8gZXZlcnlvbmUsDQoNCiAgICAgICAgSSBkb3dubG9hZGVkIHRoZSBsYXRlc3QgY29kZSBm
cm9tIGdpdEBnaXRodWIuY29tOm9wZW5ibWMvb3BlbmJtYy5naXQgeWVzdGVyZGF5LCBjb21waWxl
ZCBpdCB3aXRob3V0IGFueSBtb2RpZmljYXRpb24sIGFuZCBmb3VuZCB0aGUgZm9sbG93aW5nIHR3
byBwcm9ibGVtcywgcGxlYXNlIGhlbHAgdG8gc2VlIHdoYXQncyBnb2luZyBvbiwgdGhhbmsgeW91
IQ0KDQp0aGUgZXJyb3IgYXMgZm9sbG93Og0Kem1hOiBNZW1vcnkgYWxsb2NhdGlvbiBmYWlsZWRl
cnJvcjogbGlibHptYTogTWVtb3J5IGFsbG9jYXRpb24gZmFpbGVkZXJyb3I6IGxpYmx6bWE6IE1l
bW9yeSBhbGxvY2F0aW9uIGZhaWxlZGVycm9yOiBsaWJsem1hOiBNZW1vcnkgYWxsb2NhdGlvbiBm
YWlsZWRlcnJvcjogbGlibHptYTogTWVtb3J5IGFsbG9jYXRpb24gZmFpbGVkZXJyb3I6IGxpYmx6
bWE6IE1lbW9yeSBhbGxvY2F0aW9uIGZhaWxlZGVycm9yOiBsaWJsem1hOiBNZW1vcnkgYWxsb2Nh
dGlvbiBmYWlsZWRlcnJvcjogbGlibHptYTogTWVtb3J5IGFsbG9jYXRpb24gZmFpbGVkZXJyb3I6
IGxpYmx6bWE6IE1lbW9yeSBhbGxvY2F0aW9uIGZhaWxlZFdyb3RlOiAvaG9tZS96eXEvbWFzdGVy
LW9wZW5ibWMvb3BlbmJtYy9idWlsZC90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgt
Z251ZWFiaS9wZXJsLzUuMzIuMC1yMC9kZXBsb3ktcnBtcy9hcm0xMTc2anpzL3BlcmwtbW9kdWxl
LXBvZC1wZXJsZG9jLXRvbWFuLTUuMzIuMC1yMC5hcm0xMTc2anpzLnJwbQ0KV3JvdGU6IC9ob21l
L3p5cS9tYXN0ZXItb3BlbmJtYy9vcGVuYm1jL2J1aWxkL3RtcC93b3JrL2FybTExNzZqenMtb3Bl
bmJtYy1saW51eC1nbnVlYWJpL3BlcmwvNS4zMi4wLXIwL2RlcGxveS1ycG1zL2FybTExNzZqenMv
cGVybC1wb2QtNS4zMi4wLXIwLmFybTExNzZqenMucnBtDQpXcm90ZTogL2hvbWUvenlxL21hc3Rl
ci1vcGVuYm1jL29wZW5ibWMvYnVpbGQvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4
LWdudWVhYmkvcGVybC81LjMyLjAtcjAvZGVwbG95LXJwbXMvYXJtMTE3Nmp6cy9wZXJsLWRvYy01
LjMyLjAtcjAuYXJtMTE3Nmp6cy5ycG0NCg0KDQpSUE0gYnVpbGQgZXJyb3JzOg0KICAgIERlcHJl
Y2F0ZWQgZXh0ZXJuYWwgZGVwZW5kZW5jeSBnZW5lcmF0b3IgaXMgdXNlZCENCiAgICBEZXByZWNh
dGVkIGV4dGVybmFsIGRlcGVuZGVuY3kgZ2VuZXJhdG9yIGlzIHVzZWQhDQogICAgRGVwcmVjYXRl
ZCBleHRlcm5hbCBkZXBlbmRlbmN5IGdlbmVyYXRvciBpcyB1c2VkIQ0KICAgIERlcHJlY2F0ZWQg
ZXh0ZXJuYWwgZGVwZW5kZW5jeSBnZW5lcmF0b3IgaXMgdXNlZCENCiAgICBEZXByZWNhdGVkIGV4
dGVybmFsIGRlcGVuZGVuY3kgZ2VuZXJhdG9yIGlzIHVzZWQhDQogICAgRGVwcmVjYXRlZCBleHRl
cm5hbCBkZXBlbmRlbmN5IGdlbmVyYXRvciBpcyB1c2VkIQ0KICAgIERlcHJlY2F0ZWQgZXh0ZXJu
YWwgZGVwZW5kZW5jeSBnZW5lcmF0b3IgaXMgdXNlZCENCiAgICBEZXByZWNhdGVkIGV4dGVybmFs
IGRlcGVuZGVuY3kgZ2VuZXJhdG9yIGlzIHVzZWQhDQogICAgRGVwcmVjYXRlZCBleHRlcm5hbCBk
ZXBlbmRlbmN5IGdlbmVyYXRvciBpcyB1c2VkIQ0KICAgIERlcHJlY2F0ZWQgZXh0ZXJuYWwgZGVw
ZW5kZW5jeSBnZW5lcmF0b3IgaXMgdXNlZCENCiAgICBEZXByZWNhdGVkIGV4dGVybmFsIGRlcGVu
ZGVuY3kgZ2VuZXJhdG9yIGlzIHVzZWQhDQogICAgRGVwcmVjYXRlZCBleHRlcm5hbCBkZXBlbmRl
bmN5IGdlbmVyYXRvciBpcyB1c2VkIQ0KICAgIERlcHJlY2F0ZWQgZXh0ZXJuYWwgZGVwZW5kZW5j
eSBnZW5lcmF0b3IgaXMgdXNlZCENCiAgICBEZXByZWNhdGVkIGV4dGVybmFsIGRlcGVuZGVuY3kg
Z2VuZXJhdG9yIGlzIHVzZWQhDQogICAgRGVwcmVjYXRlZCBleHRlcm5hbCBkZXBlbmRlbmN5IGdl
bmVyYXRvciBpcyB1c2VkIQ0KICAgIERlcHJlY2F0ZWQgZXh0ZXJuYWwgZGVwZW5kZW5jeSBnZW5l
cmF0b3IgaXMgdXNlZCENCiAgICBEZXByZWNhdGVkIGV4dGVybmFsIGRlcGVuZGVuY3kgZ2VuZXJh
dG9yIGlzIHVzZWQhDQogICAgRGVwcmVjYXRlZCBleHRlcm5hbCBkZXBlbmRlbmN5IGdlbmVyYXRv
ciBpcyB1c2VkIQ0KICAgIERlcHJlY2F0ZWQgZXh0ZXJuYWwgZGVwZW5kZW5jeSBnZW5lcmF0b3Ig
aXMgdXNlZCENCiAgICBEZXByZWNhdGVkIGV4dGVybmFsIGRlcGVuZGVuY3kgZ2VuZXJhdG9yIGlz
IHVzZWQhDQogICAgRGVwcmVjYXRlZCBleHRlcm5hbCBkZXBlbmRlbmN5IGdlbmVyYXRvciBpcyB1
c2VkIQ0KDQoNCmRlbiAtZnZpc2liaWxpdHktaW5saW5lcy1oaWRkZW4gLWZzdGFjay1wcm90ZWN0
b3Itc3Ryb25nIC1mUElFIC1mUElDIC1EX0ZPUlRJRllfU09VUkNFPTIgLVdmb3JtYXQgLVdmb3Jt
YXQtc2VjdXJpdHkgLURCT09TVF9BU0lPX1VTRV9UU19FWEVDVVRPUl9BU19ERUZBVUxUIC1EQk9P
U1RfQVNJT19ESVNBQkxFX1RIUkVBRFMgLURCT09TVF9CRUFTVF9VU0VfU1REX1NUUklOR19WSUVX
IC1EQk9PU1RfRVJST1JfQ09ERV9IRUFERVJfT05MWSAtREJPT1NUX1NZU1RFTV9OT19ERVBSRUNB
VEVEIC1EQk9PU1RfQVNJT19OT19ERVBSRUNBVEVEIC1EQk9PU1RfTk9fUlRUSSAtREJPT1NUX05P
X1RZUEVJRA0KLURCT09TVF9DT1JPVVRJTkVTX05PX0RFUFJFQ0FUSU9OX1dBUk5JTkcgLURCT09T
VF9VUkxfU1RBTkRBTE9ORSAtREJPT1NUX1VSTF9IRUFERVJfT05MWSAtT3MgLWZ2aXNpYmlsaXR5
LWlubGluZXMtaGlkZGVuIC1EQk9PU1RfQUxMX05PX0xJQiAtTUQgLU1RIGJtY3dlYi5wL3NyY193
ZWJzZXJ2ZXJfbWFpbi5jcHAubyAtTUYgYm1jd2ViLnAvc3JjX3dlYnNlcnZlcl9tYWluLmNwcC5v
LmQgLW8gYm1jd2ViLnAvc3JjX3dlYnNlcnZlcl9tYWluLmNwcC5vIC1jIC4uL2dpdC9zcmMvd2Vi
c2VydmVyX21haW4uY3BwDQpJbiBmaWxlIGluY2x1ZGVkIGZyb20gL2hvbWUvenlxL21hc3Rlci1v
cGVuYm1jL29wZW5ibWMvYnVpbGQvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdu
dWVhYmkvYm1jd2ViLzEuMCtnaXRBVVRPSU5DK2U0MzYwMDgzNzctcjAvcmVjaXBlLXN5c3Jvb3Qv
dXNyL2luY2x1ZGUvYm9vc3QvY29uZmlnL2hlYWRlcl9kZXByZWNhdGVkLmhwcDoxOCwNCiAgICAg
ICAgICAgICAgICAgZnJvbSAvaG9tZS96eXEvbWFzdGVyLW9wZW5ibWMvb3BlbmJtYy9idWlsZC90
bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9ibWN3ZWIvMS4wK2dpdEFV
VE9JTkMrZTQzNjAwODM3Ny1yMC9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9ib29zdC9kZXRh
aWwvc2NvcGVkX2VudW1fZW11bGF0aW9uLmhwcDoxNSwNCiAgICAgICAgICAgICAgICAgZnJvbSAv
aG9tZS96eXEvbWFzdGVyLW9wZW5ibWMvb3BlbmJtYy9idWlsZC90bXAvd29yay9hcm0xMTc2anpz
LW9wZW5ibWMtbGludXgtZ251ZWFiaS9ibWN3ZWIvMS4wK2dpdEFVVE9JTkMrZTQzNjAwODM3Ny1y
MC9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9ib29zdC9jb3JvdXRpbmUvZXhjZXB0aW9ucy5o
cHA6MTQsDQogICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvenlxL21hc3Rlci1vcGVuYm1jL29w
ZW5ibWMvYnVpbGQvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvYm1j
d2ViLzEuMCtnaXRBVVRPSU5DK2U0MzYwMDgzNzctcjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1
ZGUvYm9vc3QvY29yb3V0aW5lL2FzeW1tZXRyaWNfY29yb3V0aW5lLmhwcDoyNCwNCiAgICAgICAg
ICAgICAgICAgZnJvbSAvaG9tZS96eXEvbWFzdGVyLW9wZW5ibWMvb3BlbmJtYy9idWlsZC90bXAv
d29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9ibWN3ZWIvMS4wK2dpdEFVVE9J
TkMrZTQzNjAwODM3Ny1yMC9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9ib29zdC9jb3JvdXRp
bmUvY29yb3V0aW5lLmhwcDoxMCwNCiAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS96eXEvbWFz
dGVyLW9wZW5ibWMvb3BlbmJtYy9idWlsZC90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGlu
dXgtZ251ZWFiaS9ibWN3ZWIvMS4wK2dpdEFVVE9JTkMrZTQzNjAwODM3Ny1yMC9yZWNpcGUtc3lz
cm9vdC91c3IvaW5jbHVkZS9ib29zdC9jb3JvdXRpbmUvYWxsLmhwcDoxMSwNCiAgICAgICAgICAg
ICAgICAgZnJvbSAvaG9tZS96eXEvbWFzdGVyLW9wZW5ibWMvb3BlbmJtYy9idWlsZC90bXAvd29y
ay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9ibWN3ZWIvMS4wK2dpdEFVVE9JTkMr
ZTQzNjAwODM3Ny1yMC9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9ib29zdC9hc2lvL3NwYXdu
LmhwcDoxOSwNCiAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS96eXEvbWFzdGVyLW9wZW5ibWMv
b3BlbmJtYy9idWlsZC90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9i
bWN3ZWIvMS4wK2dpdEFVVE9JTkMrZTQzNjAwODM3Ny1yMC9yZWNpcGUtc3lzcm9vdC91c3IvaW5j
bHVkZS9zZGJ1c3BsdXMvYXNpby9jb25uZWN0aW9uLmhwcDoyOCwNCiAgICAgICAgICAgICAgICAg
ZnJvbSAuLi9naXQvaW5jbHVkZS9kYnVzX3NpbmdsZXRvbi5ocHA6MiwNCiAgICAgICAgICAgICAg
ICAgZnJvbSAuLi9naXQvaW5jbHVkZS9zZXNzaW9ucy5ocHA6MTIsDQogICAgICAgICAgICAgICAg
IGZyb20gLi4vZ2l0L2h0dHAvaHR0cF9yZXF1ZXN0Lmg6NSwNCiAgICAgICAgICAgICAgICAgZnJv
bSAuLi9naXQvaHR0cC9hcHAuaDozLA0KICAgICAgICAgICAgICAgICBmcm9tIC4uL2dpdC9zcmMv
d2Vic2VydmVyX21haW4uY3BwOjE6DQovaG9tZS96eXEvbWFzdGVyLW9wZW5ibWMvb3BlbmJtYy9i
dWlsZC90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9ibWN3ZWIvMS4w
K2dpdEFVVE9JTkMrZTQzNjAwODM3Ny1yMC9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9ib29z
dC9kZXRhaWwvc2NvcGVkX2VudW1fZW11bGF0aW9uLmhwcDoxNzoxOiBub3RlOiAnI3ByYWdtYSBt
ZXNzYWdlOiBUaGlzIGhlYWRlciBpcyBkZXByZWNhdGVkLiBVc2UgPGJvb3N0L2NvcmUvc2NvcGVk
X2VudW0uaHBwPiBpbnN0ZWFkLicNCiAgIDE3IHwgQk9PU1RfSEVBREVSX0RFUFJFQ0FURUQoIjxi
b29zdC9jb3JlL3Njb3BlZF9lbnVtLmhwcD4iKQ0KICAgICAgfCBefn5+fn5+fn5+fn5+fn5+fn5+
fn5+fg0KdmlydHVhbCBtZW1vcnkgZXhoYXVzdGVkOiBDYW5ub3QgYWxsb2NhdGUgbWVtb3J5DQpu
aW5qYTogYnVpbGQgc3RvcHBlZDogc3ViY29tbWFuZCBmYWlsZWQuDQpXQVJOSU5HOiBleGl0IGNv
ZGUgMSBmcm9tIGEgc2hlbGwgY29tbWFuZC4NCg0KRVJST1I6IExvZ2ZpbGUgb2YgZmFpbHVyZSBz
dG9yZWQgaW46IC9ob21lL3p5cS9tYXN0ZXItb3BlbmJtYy9vcGVuYm1jL2J1aWxkL3RtcC93b3Jr
L2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL2JtY3dlYi8xLjArZ2l0QVVUT0lOQytl
NDM2MDA4Mzc3LXIwL3RlbXAvbG9nLmRvX2NvbXBpbGUuMzQxNw0KTG9nIGRhdGEgZm9sbG93czoN
CnwgREVCVUc6IEV4ZWN1dGluZyBzaGVsbCBmdW5jdGlvbiBkb19jb21waWxlDQoNCmhhcmxleQ0K

--_000_HK0PR04MB28839DFD113446F4DE202799FE040HK0PR04MB2883apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hello everyone,&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; I downloaded the latest code from git@github.co=
m:openbmc/openbmc.git yesterday, compiled it without any modification, and =
found the following two problems, please help to see what's going on, thank=
 you!<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
the error as follow:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
zma: Memory allocation failederror: liblzma: Memory allocation failederror:=
 liblzma: Memory allocation failederror: liblzma: Memory allocation failede=
rror: liblzma: Memory allocation failederror: liblzma: Memory allocation fa=
ilederror: liblzma: Memory allocation
 failederror: liblzma: Memory allocation failederror: liblzma: Memory alloc=
ation failedWrote: /home/zyq/master-openbmc/openbmc/build/tmp/work/arm1176j=
zs-openbmc-linux-gnueabi/perl/5.32.0-r0/deploy-rpms/arm1176jzs/perl-module-=
pod-perldoc-toman-5.32.0-r0.arm1176jzs.rpm
<div>Wrote: /home/zyq/master-openbmc/openbmc/build/tmp/work/arm1176jzs-open=
bmc-linux-gnueabi/perl/5.32.0-r0/deploy-rpms/arm1176jzs/perl-pod-5.32.0-r0.=
arm1176jzs.rpm</div>
<div>Wrote: /home/zyq/master-openbmc/openbmc/build/tmp/work/arm1176jzs-open=
bmc-linux-gnueabi/perl/5.32.0-r0/deploy-rpms/arm1176jzs/perl-doc-5.32.0-r0.=
arm1176jzs.rpm</div>
<div><br>
</div>
<div><br>
</div>
<div>RPM build errors:</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
<div>&nbsp; &nbsp; Deprecated external dependency generator is used!</div>
&nbsp; &nbsp; Deprecated external dependency generator is used!<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
den -fvisibility-inlines-hidden -fstack-protector-strong -fPIE -fPIC -D_FOR=
TIFY_SOURCE=3D2 -Wformat -Wformat-security -DBOOST_ASIO_USE_TS_EXECUTOR_AS_=
DEFAULT -DBOOST_ASIO_DISABLE_THREADS -DBOOST_BEAST_USE_STD_STRING_VIEW -DBO=
OST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
 -DBOOST_ASIO_NO_DEPRECATED -DBOOST_NO_RTTI -DBOOST_NO_TYPEID
<div>-DBOOST_COROUTINES_NO_DEPRECATION_WARNING -DBOOST_URL_STANDALONE -DBOO=
ST_URL_HEADER_ONLY -Os -fvisibility-inlines-hidden -DBOOST_ALL_NO_LIB -MD -=
MQ bmcweb.p/src_webserver_main.cpp.o -MF bmcweb.p/src_webserver_main.cpp.o.=
d -o bmcweb.p/src_webserver_main.cpp.o
 -c ../git/src/webserver_main.cpp</div>
<div>In file included from /home/zyq/master-openbmc/openbmc/build/tmp/work/=
arm1176jzs-openbmc-linux-gnueabi/bmcweb/1.0+gitAUTOINC+e436008377-r0/recipe=
-sysroot/usr/include/boost/config/header_deprecated.hpp:18,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /ho=
me/zyq/master-openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnuea=
bi/bmcweb/1.0+gitAUTOINC+e436008377-r0/recipe-sysroot/usr/include/boost/det=
ail/scoped_enum_emulation.hpp:15,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /ho=
me/zyq/master-openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnuea=
bi/bmcweb/1.0+gitAUTOINC+e436008377-r0/recipe-sysroot/usr/include/boost/cor=
outine/exceptions.hpp:14,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /ho=
me/zyq/master-openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnuea=
bi/bmcweb/1.0+gitAUTOINC+e436008377-r0/recipe-sysroot/usr/include/boost/cor=
outine/asymmetric_coroutine.hpp:24,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /ho=
me/zyq/master-openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnuea=
bi/bmcweb/1.0+gitAUTOINC+e436008377-r0/recipe-sysroot/usr/include/boost/cor=
outine/coroutine.hpp:10,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /ho=
me/zyq/master-openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnuea=
bi/bmcweb/1.0+gitAUTOINC+e436008377-r0/recipe-sysroot/usr/include/boost/cor=
outine/all.hpp:11,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /ho=
me/zyq/master-openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnuea=
bi/bmcweb/1.0+gitAUTOINC+e436008377-r0/recipe-sysroot/usr/include/boost/asi=
o/spawn.hpp:19,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /ho=
me/zyq/master-openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnuea=
bi/bmcweb/1.0+gitAUTOINC+e436008377-r0/recipe-sysroot/usr/include/sdbusplus=
/asio/connection.hpp:28,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from ../=
git/include/dbus_singleton.hpp:2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from ../=
git/include/sessions.hpp:12,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from ../=
git/http/http_request.h:5,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from ../=
git/http/app.h:3,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from ../=
git/src/webserver_main.cpp:1:</div>
<div>/home/zyq/master-openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-lin=
ux-gnueabi/bmcweb/1.0+gitAUTOINC+e436008377-r0/recipe-sysroot/usr/include/b=
oost/detail/scoped_enum_emulation.hpp:17:1: note: '#pragma message: This he=
ader is deprecated. Use &lt;boost/core/scoped_enum.hpp&gt;
 instead.'</div>
<div>&nbsp; &nbsp;17 | BOOST_HEADER_DEPRECATED(&quot;&lt;boost/core/scoped_=
enum.hpp&gt;&quot;)</div>
<div>&nbsp; &nbsp; &nbsp; | ^~~~~~~~~~~~~~~~~~~~~~~</div>
<div>virtual memory exhausted: Cannot allocate memory</div>
<div>ninja: build stopped: subcommand failed.</div>
<div>WARNING: exit code 1 from a shell command.</div>
<div><br>
</div>
<div>ERROR: Logfile of failure stored in: /home/zyq/master-openbmc/openbmc/=
build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/bmcweb/1.0+gitAUTOINC+e4360=
08377-r0/temp/log.do_compile.3417</div>
<div>Log data follows:</div>
| DEBUG: Executing shell function do_compile<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
harley</div>
</body>
</html>

--_000_HK0PR04MB28839DFD113446F4DE202799FE040HK0PR04MB2883apcp_--
