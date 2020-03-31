Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA94198EBD
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 10:43:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s2sj6hqSzDqlp
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 19:43:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-sg2-obe.outbound.protection.outlook.com
 (client-ip=40.107.131.45; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=ctcchien@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=VmHmAAOh; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310045.outbound.protection.outlook.com [40.107.131.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s2s54TgVzDqjc
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 19:42:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gO0bJ/Eoheks9o8DTwZZe4rMi+k9raCbT6yL+vOe6R9hLCfIgSUp6KZimIeIp6PffD/glH7jcHNY6DJVJeLFSWvdiEEDieGE0+0Lbu9J2HJFlptHy7ND53WaHDrVEc/2gpN74t8mEUBe1TrDCwG9HDiQPSLyfhrO5Cy/kVa/alCpe2e4f+1jGjcA4F41fS16Y61LJraxBE1PntnxWc377p7Vf1OBXXNp96Z+zktmUAy4A3o+DP0DRW3I1gM+myNwbsp3hyhQzv33h5pf4aHtPJ/dBTYlEtRMzao5ISSa0vG8QbenPwjqhbUGnVe6JPZD+A5MlVFLHerZO1166k4yRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2lzOK0jWi0hBJGENNHx7X4HVyAB23czeOQCc2LKdWQ=;
 b=Si64finYE/5N0l0gMyxQ4gun415jAdYtrQ1K2jDjQQe0HkujXAQrEWQCsPFRi7UIyIUkkGWzONzvB4uuUmTGCRK4XA0Qm/UZSEJa4KCZyzriyKxI2gq7tl/vbikTfQp2ZgKNFS+nacmc/kcTYUlAsgwnyz9H6Z1HaG1z7hqjBqn9I7RLQM4CMIswIJofb62R3Z1o+athT/5shJbAcjygwi9Jpn9HJOPiyNtma9Vz1em3LyFxqi+QeWH0kJBTO0/IcH55lFDVep7vS77iERr0TcfHIloEPa43434bGz0fW4gsgy+5UcG2exR+/zlRynYiIt3btlmJotzVHLopWLmiRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2lzOK0jWi0hBJGENNHx7X4HVyAB23czeOQCc2LKdWQ=;
 b=VmHmAAOh+aicbEmMdIh1VHw9dGMjqI1qcqjc9eY9fbv3anS2oYOc2mu9aGHArhj54bLAHUYum4ybsMEu87uB/HlBgw2aOhgY6rbzYnk1L/TDDK7R2c6IXgIeg7h19p4VgJttf/r624DS4H7hLAu8cnIWAJuTxP70rEQTGKdXivE=
Received: from HK2PR03MB4531.apcprd03.prod.outlook.com (20.178.135.140) by
 HK2PR03MB4339.apcprd03.prod.outlook.com (10.170.158.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.11; Tue, 31 Mar 2020 08:42:42 +0000
Received: from HK2PR03MB4531.apcprd03.prod.outlook.com
 ([fe80::89d5:89f4:9ecc:d1b0]) by HK2PR03MB4531.apcprd03.prod.outlook.com
 ([fe80::89d5:89f4:9ecc:d1b0%3]) with mapi id 15.20.2878.013; Tue, 31 Mar 2020
 08:42:42 +0000
From: CS20 CTCchien <CTCCHIEN@nuvoton.com>
To: Patrick Venture <venture@google.com>, Benjamin Fair
 <benjaminfair@google.com>
Subject: phosphor-ipmi-flash: tools build fail
Thread-Topic: phosphor-ipmi-flash: tools build fail
Thread-Index: AdYHN4PbMcsuff8URaWdQAaqF179hw==
Date: Tue, 31 Mar 2020 08:42:42 +0000
Message-ID: <HK2PR03MB4531ACE1FAC28A9C8DF6A2EADFC80@HK2PR03MB4531.apcprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=CTCCHIEN@nuvoton.com; 
x-originating-ip: [60.250.194.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e0b5a2c-65df-4ee1-21d0-08d7d54f7a2e
x-ms-traffictypediagnostic: HK2PR03MB4339:|HK2PR03MB4339:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR03MB4339781DD44C8B41CDAE3BE2DFC80@HK2PR03MB4339.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR03MB4531.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(366004)(39840400004)(376002)(346002)(136003)(396003)(52536014)(186003)(4326008)(478600001)(26005)(55016002)(86362001)(5660300002)(9686003)(2906002)(71200400001)(81156014)(110136005)(81166006)(6506007)(54906003)(7696005)(8936002)(316002)(8676002)(76116006)(66946007)(64756008)(33656002)(107886003)(66556008)(66476007)(66446008);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: nuvoton.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q6VEzhbxTxRHlHEs7Om3aKmUYb8OCLDBhPBIQsjBEtQdC9HmVlqIPi5oM3IP31aiukZMbMgTvJ5DLs5aor5qMJPNbP+uPY2TsPrCuGAXOudu3feB0RqigEYZ+Ida4I2K/GvTDoPU+A5IBhRgLInHGhR8KfcB4P80mcobaGd0R1VWuJMcPisnkbEQmAKvUqnzb93Zz4XJZfwycp68hs4/g1yjs4tMMXDM5SDcejTpHcD015jKqhdRgHsuWDwlyRyT2HYC/RLTRoZCxAYxWySzt1mh6wd5aBNtbPVK/JgiVo5OqNxqwwZWQfD8AUQZocj4h8hUbCNwzGrjskdnie9xpd5/Zg7GgA8qr9ZxXUAaQxKhpNJgJMELSwL5TCwK9xlWR0XqtoG+iQ6yM37GW0MeOi/Y1j8eqV9/WqtmgNj6/RTfzQgqAfeqevBnbgRxVNpv
x-ms-exchange-antispam-messagedata: W5jKjY4uNi5PAVQ4ZrhXyotfT7Gv2CWIvHmOVGjpLkic7OzoQ+mEFIzGfGMqnO4pVR7dGw+hq8l0imNw2lQlThKqHYCI2Fod9juCFmLDQLj5BkJQeo7nKEumQn5glXSob9Sq5aC8Kiw+7ZmKQXg5yQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0b5a2c-65df-4ee1-21d0-08d7d54f7a2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 08:42:42.4311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O1TB/pYlE6+2/zlffAXKc571j7W1vXljrnK0hWv2dapUqaVuOSf9tSrNYX9Tv6jysRQkUgTvZM9sp+evF6eY5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4339
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
Cc: CS20 KWLiu <KWLIU@nuvoton.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgUGF0cmljaywNCg0KSSB1cGxvYWQgYSBjb21taXQgZm9yIHBob3NwaG9yLWlwbWktZmxhc2gv
dG9vbHMsIGJ1dCBKZW5raW5zIHNob3dzIGJ1aWxkIGZhaWwuDQpJIGFkZCB0d28gbW9yZSBvcHRp
b25zIGZvciBudXZvdG9uIHBjaSBkZXZpY2UNCmVuYWJsZS1udXZvdG9uLXAyYS12Z2EgYW5kIGVu
YWJsZS1udXZvdG9uLXAyYS1tYm94DQphbmQgSSBidWlsZCB3aXRoIGJlbG93IHRocmVlIGNvbW1h
bmQgc2V0cyBvbiBteSBQQw0KYW5kIHRoZXkgYWxsIGJ1aWxkIHN1Y2Nlc3NmdWxseQ0KDQoxLg0K
Li9ib290c3RyYXAuc2gNCi4vY29uZmlndXJlIC0tZGlzYWJsZS1idWlsZC1ibWMtYmxvYi1oYW5k
bGVyDQptYWtlDQpzdWRvIG1ha2UgaW5zdGFsbA0KDQoyLg0KLi9ib290c3RyYXAuc2gNCi4vY29u
ZmlndXJlIC0tZGlzYWJsZS1idWlsZC1ibWMtYmxvYi1oYW5kbGVyICAtLWVuYWJsZS1udXZvdG9u
LXAyYS1tYm94DQptYWtlDQpzdWRvIG1ha2UgaW5zdGFsbA0KDQozLg0KLi9ib290c3RyYXAuc2gN
Ci4vY29uZmlndXJlIC0tZGlzYWJsZS1idWlsZC1ibWMtYmxvYi1oYW5kbGVyICAtLWVuYWJsZS1u
dXZvdG9uLXAyYS12Z2ENCm1ha2UNCnN1ZG8gbWFrZSBpbnN0YWxsDQoNCnNvIHdvdWxkIHlvdSBw
bGVhc2UgaGVscCB0byBzb2x2ZSB0aGlzIHByb2JsZW0/IEkgaGF2ZSBubyBpZGVhIHdoYXQncyB3
cm9uZy4NClRoYW5rcyBhIGxvdA0KDQpCLlIuDQpNZWRhZA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQogVGhlIHByaXZp
bGVnZWQgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGVtYWlsIGlz
IGludGVuZGVkIGZvciB1c2Ugb25seSBieSB0aGUgYWRkcmVzc2VlcyBhcyBpbmRpY2F0ZWQgYnkg
dGhlIG9yaWdpbmFsIHNlbmRlciBvZiB0aGlzIGVtYWlsLiBJZiB5b3UgYXJlIG5vdCB0aGUgYWRk
cmVzc2VlIGluZGljYXRlZCBpbiB0aGlzIGVtYWlsIG9yIGFyZSBub3QgcmVzcG9uc2libGUgZm9y
IGRlbGl2ZXJ5IG9mIHRoZSBlbWFpbCB0byBzdWNoIGEgcGVyc29uLCBwbGVhc2Uga2luZGx5IHJl
cGx5IHRvIHRoZSBzZW5kZXIgaW5kaWNhdGluZyB0aGlzIGZhY3QgYW5kIGRlbGV0ZSBhbGwgY29w
aWVzIG9mIGl0IGZyb20geW91ciBjb21wdXRlciBhbmQgbmV0d29yayBzZXJ2ZXIgaW1tZWRpYXRl
bHkuIFlvdXIgY29vcGVyYXRpb24gaXMgaGlnaGx5IGFwcHJlY2lhdGVkLiBJdCBpcyBhZHZpc2Vk
IHRoYXQgYW55IHVuYXV0aG9yaXplZCB1c2Ugb2YgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIG9m
IE51dm90b24gaXMgc3RyaWN0bHkgcHJvaGliaXRlZDsgYW5kIGFueSBpbmZvcm1hdGlvbiBpbiB0
aGlzIGVtYWlsIGlycmVsZXZhbnQgdG8gdGhlIG9mZmljaWFsIGJ1c2luZXNzIG9mIE51dm90b24g
c2hhbGwgYmUgZGVlbWVkIGFzIG5laXRoZXIgZ2l2ZW4gbm9yIGVuZG9yc2VkIGJ5IE51dm90b24u
DQo=
