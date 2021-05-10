Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBF7379EED
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 07:05:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfQpz0xcTz302g
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 15:05:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=di1zkeNF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.22.109;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=di1zkeNF; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2109.outbound.protection.outlook.com [40.92.22.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfGJj2L5hz2yRy
 for <openbmc@lists.ozlabs.org>; Tue, 11 May 2021 08:42:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGAgENQEKYvbpMDy+RTCYeDL3bDbOT/gtiT6K7Y1EoQqclZ39unejzyF80rKmdj8izyekKMVYCx1aoXWlnzh0nz9bkd0uSrL5OkyIgQJDDykm0rGs+1e7FSOF8lyNQCcxUjaR6XsNsth9H/d0AHpV4aWTCdUvN+uCF01gQfDDBKE3aX8zAnLx+/afLszlasgNxCEop0K2fR9bZ6I8VMK91425SRalcG+aPQdqnh5OXqJxPEN10bQymCnc2Q1ccXoQ68R3pDA7cMizzebd9/CPLnzf/4jR8tJLAnW3itYsj5nEZE9OmZIOgGMEBVyV7eLiqaClZJ5JZbwOFp5BQbBkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYn8Iz3Hv/ye3bL1OHUkUQo5k8ah6KFtv/HH8nf8x3U=;
 b=mHy933tAIeMC8l4iJEtCFkJNNYoGa0zqhlDPOcMVnBrFDiYuzTY5DFBqui2kk66HBMRFrLR1/Vj/QswdHAsjZ/BsgJf50m1Z+eS7jNZpP2B4GyXT0e5yuRAhhj7SsxB8hwv1KofiYuFsEbrUQoCDahnRt5jDqPlU4YF1K84MfntA1GXGnOKVf+8psXjrTv5As1FIRh0BQUmM8yvyQLMptMDzA1gSJpWhhwkCH4QDrgEOdteyNqhU94gwYKCq+wfkP8JU2PfqWbAarm/1scsjNACzSJ1oh2AsHoAT4Vr+SbnzIL2F1mX6MTxwW2RFgJouIAOmhvQtWk7p6hGyu3qBXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYn8Iz3Hv/ye3bL1OHUkUQo5k8ah6KFtv/HH8nf8x3U=;
 b=di1zkeNFneLDBfBvViTbJ7sWhOdDd0mBtQWD90zevtoOr9QhuArciUDjsJBOGAbWkLcEsQ4Jdzu4RtPWppCqgo/COijYUCwAW8vNpowjNJ7roVe0smDfEdNIo3+gM/vOKIl1DkKx6GbvolxxOuUvCTpqOmNQw35TkUNY5IyjnWl7+FaHDKaXEAQahkPzqCSYB8jiX77lJNMlvnZYcFgUV8zAHR96D6E3C7LfwVViyD2z/+n57DRXrG1nQ6FrsxdYsQowqi84wHSsFogQfiALE4JNGCR4tYIyuIs0CHiuysCvqpd8ssZghrzfNXV3NPS6mIGobPkALNAPS+JWVZT0zQ==
Received: from MW2NAM12FT045.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc65::48) by
 MW2NAM12HT048.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc65::444)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.11; Mon, 10 May
 2021 22:42:06 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 (2a01:111:e400:fc65::4b) by MW2NAM12FT045.mail.protection.outlook.com
 (2a01:111:e400:fc65::268) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.11 via Frontend
 Transport; Mon, 10 May 2021 22:42:06 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::6d95:d8e7:6d78:c72b]) by BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::6d95:d8e7:6d78:c72b%6]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 22:42:06 +0000
From: Kun Zhao <zkxz@outlook.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Configuration categorization and reset-to-default based on it
Thread-Topic: Configuration categorization and reset-to-default based on it
Thread-Index: Adc94KldyJM+k52fS5OfGR64rZ3qfwIDNbXQ
Date: Mon, 10 May 2021 22:42:06 +0000
Message-ID: <BYAPR14MB2342B9AB105D810F6B95DEC6CF549@BYAPR14MB2342.namprd14.prod.outlook.com>
References: <BYAPR14MB23423DBD26B07D07A5E8C7DBCF5E9@BYAPR14MB2342.namprd14.prod.outlook.com>
In-Reply-To: <BYAPR14MB23423DBD26B07D07A5E8C7DBCF5E9@BYAPR14MB2342.namprd14.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:7616A2C30BC0EAEEA1AC65D31C65E7E7B7A821E7C4607CB86F5DFD8B97D1F85D;
 UpperCasedChecksum:3076EB0F281B785C751B976D6E2A91369CCFAA60BF357C4192FD6AB1FA1B057C;
 SizeAsReceived:6878; Count:43
x-tmn: [RwPRahUZTNB7ctZhIuf2aCU3Dp0a0nXS]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 86d2fe39-6b89-4977-a729-08d91404d6d4
x-ms-traffictypediagnostic: MW2NAM12HT048:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lipb3OCqMd9VbF9XP4ztF4ijIxMHEEfSZaqYazmrX2c2prgpKiF2TvVhbYEupbe0PpmDo5w8SIfmEdqdmsXb8fkZzFX4fD/Dcx7PoQUCbHgPXjFI3J6+W4rP748kvGvv0Ilk+wgqSygKlKPbNDjf7IFiKH13ShluSIaCabKUEQz84qa7k7CxeHIMaZhRTxQBBhbG0BXFf843OYPasutw314zloJ2rtjZhel9mHxuX1YxW8AUkceEziQMciw4Jr2YS/PVzmhY/hay54Oi+xF8BOXzw/EzR9/1rXKT8ty80knw0N8bzFbTH8Amfm6Az/Sv6aOKO6TMJuJdoR76HiWSfBuqA7DE8Nt+0eRD1k+2y7UrVNdJy4M+FPghGk+Z9SmZ
x-ms-exchange-antispam-messagedata: E5TWmCEh96HnG87L75oFq7nl4TzBRmivqdn2MNVBpJBC601/bVWAUdbfDb9qMvrhBerYFT2f3McusV7cO5TU2dOekyvq0RzJ/4E6mmsr12HouVTpFfy4wXoz3JFOR++7J8+HBo5nTtb0//tTGPOxdA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR14MB2342B9AB105D810F6B95DEC6CF549BYAPR14MB2342namp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT045.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d2fe39-6b89-4977-a729-08d91404d6d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2021 22:42:06.5641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2NAM12HT048
X-Mailman-Approved-At: Tue, 11 May 2021 15:05:15 +1000
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_BYAPR14MB2342B9AB105D810F6B95DEC6CF549BYAPR14MB2342namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UmVzZW5kaW5n4oCmIG5vdCBzdXJlIHdoeSBpdCB3YXMgbm90IHB1Ymxpc2hlZC4NCg0KRnJvbTog
S3VuIFpoYW8NClNlbnQ6IEZyaWRheSwgQXByaWwgMzAsIDIwMjEgOTo1OCBBTQ0KVG86IG9wZW5i
bWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogQ29uZmlndXJhdGlvbiBjYXRlZ29yaXphdGlv
biBhbmQgcmVzZXQtdG8tZGVmYXVsdCBiYXNlZCBvbiBpdA0KDQpIaSBFdmVyeW9uZSwNCg0KQ2Fu
IHdlIGxvYWQgZmFjdG9yeSBkZWZhdWx0IGZvciBzb21lIHBhcnRpY3VsYXIgQk1DIGNvbmZpZ3Vy
YXRpb25zIGJhc2VkIG9uIHVzZXIgc2VsZWN0aW9ucz8NCkxpa2UgdXNlciBjb3VsZCBjaG9vc2Ug
d2hhdCBjb25maWd1cmF0aW9uIGNhdGVnb3JpZXMgKG9yIG1vZHVsZXMpIHRvIGxvYWQgZGVmYXVs
dHMsIGUuZy4sDQotIHVzZXIgYWNjb3VudA0KLSBjZXJ0cy9rZXlzDQotIG5ldHdvcmsgc2V0dGlu
Z3MNCi0gU0VMDQotIFNEUg0KLSBMb2dzDQotIC4uLg0KDQpTb21ldGltZXMgdXNlciBtYXkgbm90
IHdhbnQgdG8gcmVzZXQgZXZlcnl0aGluZyBlc3BlY2lhbGx5IHRob3NlIHByb3Zpc2lvbmVkIHVz
ZXIvY2VydC9uZXR3b3JrIHNldHRpbmdzLg0KDQpUaGFua3MsDQpLdW4NCg==

--_000_BYAPR14MB2342B9AB105D810F6B95DEC6CF549BYAPR14MB2342namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
5a6L5L2TOw0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAxIDE7fQ0KQGZvbnQtZmFjZQ0KCXtm
b250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2IDMgMiA0
O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToyIDE1IDUg
MiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJcQOWui+S9kyI7DQoJ
cGFub3NlLTE6MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0K
cC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0K
CW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5
OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNv
LXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVu
ZGVybGluZTt9DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0
eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVy
bGluZTt9DQpwLk1zb0xpc3RQYXJhZ3JhcGgsIGxpLk1zb0xpc3RQYXJhZ3JhcGgsIGRpdi5Nc29M
aXN0UGFyYWdyYXBoDQoJe21zby1zdHlsZS1wcmlvcml0eTozNDsNCgltYXJnaW4tdG9wOjBpbjsN
CgltYXJnaW4tcmlnaHQ6MGluOw0KCW1hcmdpbi1ib3R0b206MGluOw0KCW1hcmdpbi1sZWZ0Oi41
aW47DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMS4wcHQ7DQoJZm9udC1m
YW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTgNCgl7bXNvLXN0
eWxlLXR5cGU6cGVyc29uYWw7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJ
Y29sb3I6d2luZG93dGV4dDt9DQpzcGFuLkVtYWlsU3R5bGUxOQ0KCXttc28tc3R5bGUtdHlwZTpw
ZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xv
cjojMUY0OTdEO30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5
Ow0KCWZvbnQtc2l6ZToxMC4wcHQ7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4g
MTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjI1aW4gMS4waW4gMS4yNWluO30NCmRpdi5Xb3JkU2Vj
dGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48IS0tW2lmIGd0ZSBtc28g
OV0+PHhtbD4NCjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9IjEwMjYiIC8+
DQo8L3htbD48IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlbGF5
b3V0IHY6ZXh0PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIxIiAvPg0KPC9v
OnNoYXBlbGF5b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4t
VVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0
aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iY29sb3I6IzFGNDk3RCI+
UmVzZW5kaW5n4oCmIG5vdCBzdXJlIHdoeSBpdCB3YXMgbm90IHB1Ymxpc2hlZC48bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iY29sb3I6IzFG
NDk3RCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPGRpdj4NCjxkaXYgc3R5bGU9ImJv
cmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0UxRTFFMSAxLjBwdDtwYWRkaW5nOjMuMHB0IDBp
biAwaW4gMGluIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPkZyb206PC9iPiBLdW4gWmhhbyA8
YnI+DQo8Yj5TZW50OjwvYj4gRnJpZGF5LCBBcHJpbCAzMCwgMjAyMSA5OjU4IEFNPGJyPg0KPGI+
VG86PC9iPiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc8YnI+DQo8Yj5TdWJqZWN0OjwvYj4gQ29u
ZmlndXJhdGlvbiBjYXRlZ29yaXphdGlvbiBhbmQgcmVzZXQtdG8tZGVmYXVsdCBiYXNlZCBvbiBp
dDxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxv
OnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SGkgRXZlcnlvbmUsPG86
cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPkNhbiB3ZSBsb2FkIGZhY3RvcnkgZGVmYXVsdCBmb3Igc29t
ZSBwYXJ0aWN1bGFyIEJNQyBjb25maWd1cmF0aW9ucyBiYXNlZCBvbiB1c2VyIHNlbGVjdGlvbnM/
PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5MaWtlIHVzZXIgY291bGQgY2hv
b3NlIHdoYXQgY29uZmlndXJhdGlvbiBjYXRlZ29yaWVzIChvciBtb2R1bGVzKSB0byBsb2FkIGRl
ZmF1bHRzLCBlLmcuLDxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+LSB1c2Vy
IGFjY291bnQ8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPi0gY2VydHMva2V5
czxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+LSBuZXR3b3JrIHNldHRpbmdz
PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4tIFNFTDxvOnA+PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+LSBTRFI8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPi0gTG9nczxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+LSAu
Li48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+U29tZXRpbWVzIHVzZXIgbWF5IG5vdCB3YW50IHRv
IHJlc2V0IGV2ZXJ5dGhpbmcgZXNwZWNpYWxseSB0aG9zZSBwcm92aXNpb25lZCB1c2VyL2NlcnQv
bmV0d29yayBzZXR0aW5ncy48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxv
OnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+VGhhbmtzLDxvOnA+PC9v
OnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+S3VuPG86cD48L286cD48L3A+DQo8L2Rpdj4N
CjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_BYAPR14MB2342B9AB105D810F6B95DEC6CF549BYAPR14MB2342namp_--
