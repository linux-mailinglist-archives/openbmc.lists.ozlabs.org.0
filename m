Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2295221D5C7
	for <lists+openbmc@lfdr.de>; Mon, 13 Jul 2020 14:22:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B52px3tfNzDqRS
	for <lists+openbmc@lfdr.de>; Mon, 13 Jul 2020 22:22:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.253.103;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=GA8trn6w; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253103.outbound.protection.outlook.com [40.92.253.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B52mL1z0czDqRH
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jul 2020 22:20:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fILe8brcXRuR3AmGUz8DBr9syzDNb2bkjOq+ixVZzL7eT4i/B+ybGXwggTGaIMjiQeQicWmDaZXC4fWnbEO4kglxRUx7LGHeIb1rHxeE6SN2kcDIkPrpXaLQO9DEaCi3jD8jow/1trF8Frquh47lQ8Oyfxa02sGhfENOQuFed9HrHfjY5aOhbsaGoO9VKSx/aKARPr5CrH2Mx2AuWFIe++5RIPVSd4dz8YbD222pGZ3SEw3YqDhddioVvAce8HSQ8OmoKnERv+HwrjaQXZHaP9eVJVyYt9HsAla/kKoFUnecHmKpQ3CNxbgHoy5obDLyeGiP2NuXrRhnHxyvvf/cng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CGuKEzj7ri9R4kA2YYSbjJq2oMAQLHCH1wDbWJCUug=;
 b=WuywRQF38xr6j1b6Z6ur+xYau9lc3BFg4RiYHntxwpU0Hi01soywUfxohFK28yYM5iyKu42qI6KyFPK5rDojA09KsAaU+rrlQzwafG+mucyMLsMieMBiva5yIVCKM5mAvjLi6z/IeS/xXG173ZHpPHdj6NFsVj0oKDVMDOl1Myxni5E+pgdnOVLQiKHGqOMh+w4sqJkV+4vNkUwhIV1uxgekVgHCqLvLauyNolfEZuUP27Zl09RXjdjAsdKpsSdAXqyPaUVZXjoFbIE3eIpnQqO4BQqrbfM410RGC1lZZ4r3H41eBCohbZJwNnMyZ7G3preAqFN7XmQkmLJuzZaUZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CGuKEzj7ri9R4kA2YYSbjJq2oMAQLHCH1wDbWJCUug=;
 b=GA8trn6wqisB7JyuugCvinA7/Nm52n/wU2fmotboCTyqLKveXiocmKnQiN7XBKJWEl8oCBb9rbRBd0rnsGvGuAsqPKO9AzTYHaB1U0gOxvRtDM3Lxb0qNPaHW+BVPzek8sj97MztBjK7OEgD6XtZ2X0PC+VNLHncQQpdmVBbG+Te0Y34fzhRdV6mZy2hmtwDf9fbJu6D/Lbj/bttEBJth4nidhKawZelPciwPvDOFK5CEackpOvMXcHV9cnWIIc/o/QvbbN1cl01cguFsT8RnwFWK/QTUJGz1OW0vzV02zs+s5nb0s4eNkvq+lQElGBamJrwpraLM599KXp1BEBM0w==
Received: from HK2APC01FT032.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::53) by
 HK2APC01HT045.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::268)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Mon, 13 Jul
 2020 12:20:27 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebc::4b) by HK2APC01FT032.mail.protection.outlook.com
 (2a01:111:e400:7ebc::188) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Mon, 13 Jul 2020 12:20:27 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::88c3:5243:9944:700f]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::88c3:5243:9944:700f%6]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 12:20:27 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Subject: =?gb2312?B?u9i4tDogYnVzY3RsIGNhbGwgImxlZCBtZXRob2QiIGZhaWxlZA==?=
Thread-Topic: busctl call "led method" failed
Thread-Index: AQHWWOqIeDidKmsYQEOnQI+B0F5CRqkFNuEAgAAs02WAAAlE+w==
Date: Mon, 13 Jul 2020 12:20:26 +0000
Message-ID: <HK2PR04MB3826F276CE819BBB58CA6C89FE600@HK2PR04MB3826.apcprd04.prod.outlook.com>
References: <HK2PR04MB38264AF28981EE1CCA3FBCA2FE600@HK2PR04MB3826.apcprd04.prod.outlook.com>,
 <062A643D-06BA-4019-A075-80D5BB763172@linux.vnet.ibm.com>,
 <HK2PR04MB38260F9F252A567A42ED3A80FE600@HK2PR04MB3826.apcprd04.prod.outlook.com>
In-Reply-To: <HK2PR04MB38260F9F252A567A42ED3A80FE600@HK2PR04MB3826.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:FEFDABD296A32B4B16979B2B842B85DE86E6D02B5EFB8B644EB75AC1C6DE7281;
 UpperCasedChecksum:3FB0377A40C9B23A1F72610CBE20B0EDB3507C18E5748D47644F4829D4F0E2C9;
 SizeAsReceived:7134; Count:44
x-tmn: [bq9BfpVVD+9sv60Y4Ts2Q12bKQr/TzMw]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 1ab20cde-6b6a-49e9-daba-08d82727203c
x-ms-traffictypediagnostic: HK2APC01HT045:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: azV16oIYvzpnquTsLrmIgpWKp7UUbLIKpbDKjdLBS4IEtMETjqZ0gEsGQI0DPonmQ7a8lEyX2/UY1f4iXP92XCfEBumsbM0ByfHgkQUdxF6NKnTf6OIO2lyuEILbk59rIrkEaRUCfTOMLs7nLujKmjP7NFWbiImEG3t2d6ExB5BjHh4m105ekkF/8l5wTS0WU/cavRDBl6MnSMfR4EFjUA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: ZPCnLM2FCrGLBWEiOGWPyOgRYjZ6otu4T4H7qBUwuhypMSR04zf/ZCtp0fOjVBmU4/dESnn5cofGa8ccOvfGakH/uDU683C/4LP1SmQgVVQX5obiPipzBDt4d2ZMW9IptmseTW0+VWpFgkfxsKwaoA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB3826F276CE819BBB58CA6C89FE600HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT032.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab20cde-6b6a-49e9-daba-08d82727203c
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2020 12:20:26.9982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT045
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
Cc: "uperic@163.com" <uperic@163.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK2PR04MB3826F276CE819BBB58CA6C89FE600HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgVmlzaHdhDQoNCiAgICAgVGhlIEdQSU8gUElOIGNvbmZpZ3VyYXRpb24gY29uZmxpY3QgaXMg
aW4gbXkgRFRTLCBpdCB3aWxsIGJlIGZpbmUgYWZ0ZXIgaXQgaXMgcmVzb2x2ZWQsIHRoYW5rIHlv
daOhDQoNCmFzIGZvbGxvd3Ojug0Kcm9vdEBzdGFybGFrZTojIC9zeXMvY2xhc3MvbGVkcyMgbHMN
CmZhdWx0ICAgICBpZGVudGlmeSAgcG93ZXINCg0Kcm9vdEBzdGFybGFrZTojIGJ1c2N0bCAtLXZl
cmJvc2UgIGNhbGwgeHl6Lm9wZW5ibWNfcHJvamVjdC5MRUQuR3JvdXBNYW5hZ2VyIC94eXovb3Bl
bmJtY19wcm9qZWN0L2xlZC9ncm91cHMvcG93ZXJfb24gb3JnLmZyZWVkZXNrdG9wLkRCdXMuUHJv
cGVydGllcyBTZXQgc3N2IHh5ei5vcGVuYm1jX3Byb2plY3QuTGVkLkdyb3VwIEFzc2VydGVkIGIg
dHJ1ZQ0KDQpoYXJsZXkNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7I
yzog1twg1LbH5SA8emhvdXl1YW5xaW5nOEBvdXRsb29rLmNvbT4NCreiy83KsbzkOiAyMDIwxOo3
1MIxM8jVIDE5OjUxDQrK1bz+yMs6IFZpc2h3YW5hdGhhIFN1YmJhbm5hIDx2aXNod2FAbGludXgu
dm5ldC5pYm0uY29tPg0Ks63LzTogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIDxvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmc+OyB1cGVyaWNAMTYzLmNvbSA8dXBlcmljQDE2My5jb20+DQrW98ziOiC7
2Li0OiBidXNjdGwgY2FsbCAibGVkIG1ldGhvZCIgZmFpbGVkDQoNCkhpIFZpc2h3YQ0KDQogICAg
SSBjb3BpZWQgeW91ciBjb21tYW5kIGFuZCB0ZXN0ZWQgaXQgYWdhaW4sIHRoZSBwcm9ibGVtIGlz
IHN0aWxsIHRoZSBzYW1lLg0KDQogICAgSSBsb29rZWQgYXQgdGhlIHBob3NwaG9yLWxlZC1tYW5h
Z2VyLW1hc3RlciBkb2N1bWVudCBhbmQgc2F3IHRoYXQgdGhlIHN5cy9jbGFzcy9sZWRzIGRpcmVj
dG9yeSBuZWVkcyB0byBnZW5lcmF0ZSB0aGUgZm9sbG93aW5nIGZpbGVzLg0KDQogbHMgLWwgL3N5
cy9jbGFzcy9sZWRzL2ZhdWx0Lw0KdG90YWwgMA0KLXJ3LXItLXItLSAgICAxIHJvb3QgICAgIHJv
b3QgICAgICAgICAgNDA5NiBKdW4gMjEgMjA6MDQgYnJpZ2h0bmVzcw0KbHJ3eHJ3eHJ3eCAgICAx
IHJvb3QgICAgIHJvb3QgICAgICAgICAgICAgMCBKdW4gMjEgMjA6MjkgZGV2aWNlIC0+IC4uLy4u
Ly4uL2xlZHMNCi1yLS1yLS1yLS0gICAgMSByb290ICAgICByb290ICAgICAgICAgIDQwOTYgSnVu
IDIxIDIwOjI5IG1heF9icmlnaHRuZXNzDQpkcnd4ci14ci14ICAgIDIgcm9vdCAgICAgcm9vdCAg
ICAgICAgICAgICAwIEp1biAyMSAyMDoyOSBwb3dlcg0KbHJ3eHJ3eHJ3eCAgICAxIHJvb3QgICAg
IHJvb3QgICAgICAgICAgICAgMCBKdW4gMjEgMjA6MDQgc3Vic3lzdGVtIC0+IC4uLy4uLy4uLy4u
Ly4uL2NsYXNzL2xlZHMNCi1ydy1yLS1yLS0gICAgMSByb290ICAgICByb290ICAgICAgICAgIDQw
OTYgSnVuIDIxIDIwOjA0IHRyaWdnZXINCi1ydy1yLS1yLS0gICAgMSByb290ICAgICByb290ICAg
ICAgICAgIDQwOTYgSnVuIDIxIDIwOjA0IHVldmVudA0KDQogICAgIEhvd2V2ZXIsIC9zeXMvY2xh
c3MvbGVkcyBpcyBlbXB0eSBvbiBteSBib2FyZC4gSSBhbSBub3Qgc3VyZSBpZiBpdCB3aWxsIGFm
ZmVjdCB0aGlzIHByb2JsZW0uDQoNCnJvb3RAc3Rhcmxha2U6Oi8jIGxzIC9zeXMvY2xhc3MvbGVk
cy8NCnJvb3RAc3Rhcmxha2U6Oi8jDQoNCnJvb3RAc3Rhcmxha2U6L3N5cy9maXJtd2FyZS9kZXZp
Y2V0cmVlL2Jhc2UvbGVkcyMgbHMNCmNvbXBhdGlibGUgIGZhdWx0ICAgICAgIGlkZW50aWZ5ICAg
IG5hbWUgICAgICAgIHBvd2VyDQpyb290QHN0YXJsYWtlOi9zeXMvZmlybXdhcmUvZGV2aWNldHJl
ZS9iYXNlL2xlZHMjIGNkIGZhdWx0Lw0Kcm9vdEBzdGFybGFrZTovc3lzL2Zpcm13YXJlL2Rldmlj
ZXRyZWUvYmFzZS9sZWRzL2ZhdWx0IyBscw0KZ3Bpb3MgIG5hbWUNCnJvb3RAc3Rhcmxha2U6L3N5
cy9maXJtd2FyZS9kZXZpY2V0cmVlL2Jhc2UvbGVkcy9mYXVsdCMNCg0KDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6IFZpc2h3YW5hdGhhIFN1YmJhbm5hIDx2aXNo
d2FAbGludXgudm5ldC5pYm0uY29tPg0Kt6LLzcqxvOQ6IDIwMjDE6jfUwjEzyNUgMTc6MDINCsrV
vP7Iyzog1twg1LbH5SA8emhvdXl1YW5xaW5nOEBvdXRsb29rLmNvbT4NCrOty806IG9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZyA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPjsgdXBlcmljQDE2My5j
b20gPHVwZXJpY0AxNjMuY29tPg0K1vfM4jogUmU6IGJ1c2N0bCBjYWxsICJsZWQgbWV0aG9kIiBm
YWlsZWQNCg0KSGkgaGFybGV5LA0KDQpJIGFtIGFibGUgdG8gc2VlIGl0IHdvcmtpbmcuIFBsZWFz
ZSBjaGVjayBpZiB0aGVyZSB3YXMgYW55IHR5cG8gZXRjLi4gam91cm5hbGN0bCB3b3VsZCBoYXZl
IHRoZSBpbmZvDQoNCnJvb3RAcmFpbjRibWM6fiMgYnVzY3RsIC0tdmVyYm9zZSAgY2FsbCB4eXou
b3BlbmJtY19wcm9qZWN0LkxFRC5Hcm91cE1hbmFnZXIgL3h5ei9vcGVuYm1jX3Byb2plY3QvbGVk
L2dyb3Vwcy9wb3dlcl9vbiBvcmcuZnJlZWRlc2t0b3AuREJ1cy5Qcm9wZXJ0aWVzIEdldCBzcyB4
eXoub3BlbmJtY19wcm9qZWN0LkxlZC5Hcm91cCBBc3NlcnRlZA0KTUVTU0FHRSAidiIgew0KICAg
ICAgICBWQVJJQU5UICJiIiB7DQogICAgICAgICAgICAgICAgQk9PTEVBTiBmYWxzZTsNCiAgICAg
ICAgfTsNCn07DQoNCnJvb3RAcmFpbjRibWM6fiMgYnVzY3RsIC0tdmVyYm9zZSAgY2FsbCB4eXou
b3BlbmJtY19wcm9qZWN0LkxFRC5Hcm91cE1hbmFnZXIgL3h5ei9vcGVuYm1jX3Byb2plY3QvbGVk
L2dyb3Vwcy9wb3dlcl9vbiBvcmcuZnJlZWRlc2t0b3AuREJ1cy5Qcm9wZXJ0aWVzIFNldCBzc3Yg
eHl6Lm9wZW5ibWNfcHJvamVjdC5MZWQuR3JvdXAgQXNzZXJ0ZWQgYiB0cnVlDQoNCnJvb3RAcmFp
bjRibWM6fiMgYnVzY3RsIC0tdmVyYm9zZSAgY2FsbCB4eXoub3BlbmJtY19wcm9qZWN0LkxFRC5H
cm91cE1hbmFnZXIgL3h5ei9vcGVuYm1jX3Byb2plY3QvbGVkL2dyb3Vwcy9wb3dlcl9vbiBvcmcu
ZnJlZWRlc2t0b3AuREJ1cy5Qcm9wZXJ0aWVzIEdldCBzcyB4eXoub3BlbmJtY19wcm9qZWN0Lkxl
ZC5Hcm91cCBBc3NlcnRlZA0KTUVTU0FHRSAidiIgew0KICAgICAgICBWQVJJQU5UICJiIiB7DQog
ICAgICAgICAgICAgICAgQk9PTEVBTiB0cnVlOw0KICAgICAgICB9Ow0KfTsNCg0Kcm9vdEByYWlu
NGJtYzp+IyBidXNjdGwgLS12ZXJib3NlICBjYWxsIHh5ei5vcGVuYm1jX3Byb2plY3QuTEVELkdy
b3VwTWFuYWdlciAveHl6L29wZW5ibWNfcHJvamVjdC9sZWQvZ3JvdXBzL3Bvd2VyX29uIG9yZy5m
cmVlZGVza3RvcC5EQnVzLlByb3BlcnRpZXMgU2V0IHNzdiB4eXoub3BlbmJtY19wcm9qZWN0Lkxl
ZC5Hcm91cCBBc3NlcnRlZCBiIGZhbHNlDQoNCnJvb3RAcmFpbjRibWM6fiMgYnVzY3RsIC0tdmVy
Ym9zZSAgY2FsbCB4eXoub3BlbmJtY19wcm9qZWN0LkxFRC5Hcm91cE1hbmFnZXIgL3h5ei9vcGVu
Ym1jX3Byb2plY3QvbGVkL2dyb3Vwcy9wb3dlcl9vbiBvcmcuZnJlZWRlc2t0b3AuREJ1cy5Qcm9w
ZXJ0aWVzIEdldCBzcyB4eXoub3BlbmJtY19wcm9qZWN0LkxlZC5Hcm91cCBBc3NlcnRlZA0KTUVT
U0FHRSAidiIgew0KICAgICAgICBWQVJJQU5UICJiIiB7DQogICAgICAgICAgICAgICAgQk9PTEVB
TiBmYWxzZTsNCiAgICAgICAgfTsNCn07DQoNCnJvb3RAcmFpbjRibWM6fiMNCg0KQWx0ZXJuYXRp
dmVseSwgeW91IGNvdWxkIHVzZSBidXN0bGUgc2V0LXByb3BlcnR5DQoNCmJ1c2N0bCBzZXQtcHJv
cGVydHkgeHl6Lm9wZW5ibWNfcHJvamVjdC5MRUQuR3JvdXBNYW5hZ2VyIC94eXovb3BlbmJtY19w
cm9qZWN0L2xlZC9ncm91cHMvcG93ZXJfb24geHl6Lm9wZW5ibWNfcHJvamVjdC5MZWQuR3JvdXAg
QXNzZXJ0ZWQgYiB0cnVlDQoNCmJ1c2N0bCBnZXQtcHJvcGVydHkgeHl6Lm9wZW5ibWNfcHJvamVj
dC5MRUQuR3JvdXBNYW5hZ2VyIC94eXovb3BlbmJtY19wcm9qZWN0L2xlZC9ncm91cHMvcG93ZXJf
b24geHl6Lm9wZW5ibWNfcHJvamVjdC5MZWQuR3JvdXAgQXNzZXJ0ZWQNCg0KVGhhbmtzLA0KISEg
VmlzaHdhICEhDQoNCg0KT24gMTMtSnVsLTIwMjAsIGF0IDI6MDcgUE0sINbcINS2x+UgPHpob3V5
dWFucWluZzhAb3V0bG9vay5jb208bWFpbHRvOnpob3V5dWFucWluZzhAb3V0bG9vay5jb20+PiB3
cm90ZToNCg0KSGVsbG8gZXZlcnlvbmWjrA0KDQogICAgICAgICBUaGVyZSBhcmUgdGhlIGZvbGxv
d2luZyBjYWxscyB0byBidXNjdGwsIGl0IGlzIG5vcm1hbCB0byB1c2UgdGhlIGdldCBjb21tYW5k
LCBidXQgdGhlIHNldCBjb21tYW5kIHByb21wdHMgIkNhbGwgZmFpbGVkOiBwYXRoIG9yIG9iamVj
dCBub3QgZm91bmQiLCBhbmQgbm8gb3RoZXIgbG9nIGluZm9ybWF0aW9uIGlzIG91dHB1dCB0aHJv
dWdoIHRoZSBqb3VybmFsY3RsIGNvbW1hbmQuIFBsZWFzZSB0YWtlIGEgbG9vayBhdCBob3cgdG8g
bG9jYXRlIHRoaXMgcHJvYmxlbS4gVGhhbmsgeW91o6ENCg0KDQogfiMgYnVzY3RsIC0tdmVyYm9z
ZSAgY2FsbCB4eXoub3BlbmJtY19wcm9qZWN0LkxFRC5Hcm91cE1hbmFnZXIgL3h5ei9vcGVuYm1j
X3Byb2plY3QvbGVkL2dyb3Vwcy9wb3dlcl9vbiBvcmcuZnJlZWRlc2t0b3AuREJ1cy5Qcm9wZXJ0
aWVzIEdldCBzcyB4eXoub3BlbmJtY19wcm9qZWN0LkxlZC5Hcm91cCBBc3NlcnRlZA0KTUVTU0FH
RSAidiIgew0KICAgICAgICBWQVJJQU5UICJiIiB7DQogICAgICAgICAgICAgICAgQk9PTEVBTiBm
YWxzZTsNCiAgICAgICAgfTsNCn07DQoNCiB+IyBidXNjdGwgLS12ZXJib3NlICBjYWxsIHh5ei5v
cGVuYm1jX3Byb2plY3QuTEVELkdyb3VwTWFuYWdlciAveHl6L29wZW5ibWNfcHJvamVjdC9sZWQv
Z3JvdXBzL3Bvd2VyX29uIG9yZy5mcmVlZGVza3RvcC5EQnVzLlByb3BlcnRpZXMgU2V0IHNzdiB4
eXoub3BlbmJtY19wcm9qZWN0LkxlZC5Hcm91cCBBc3NlcnRlZCBiIHRydWUNCkNhbGwgZmFpbGVk
OiBwYXRoIG9yIG9iamVjdCBub3QgZm91bmQNCg0KaGFybGV5DQoNCg==

--_000_HK2PR04MB3826F276CE819BBB58CA6C89FE600HK2PR04MB3826apcp_
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
<span style=3D"caret-color: rgb(50, 49, 48); color: rgb(50, 49, 48); font-f=
amily: Calibri, Arial, Helvetica, sans-serif; background-color: rgb(255, 25=
5, 255); display: inline !important">Hi Vishwa</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;The GPIO PIN configuration conflict is in my DTS, it wi=
ll be fine after it is resolved, thank you=A3=A1</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt;">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt;">
as follows=A3=BA<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><span style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, s=
ans-serif; caret-color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);=
 display: inline !important">root@starlake:</span><span style=3D"caret-colo=
r: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; backgr=
ound-color: rgb(255, 255, 255); display: inline !important">#<span>&nbsp;</=
span></span>/sys/class/leds#
 ls<br>
</span>
<div>fault &nbsp; &nbsp; identify &nbsp;power<br>
</div>
<span></span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial=
, Helvetica, sans-serif; background-color: rgb(255, 255, 255); display: inl=
ine !important">root@starlake:</span># busctl --verbose &nbsp;call xyz.open=
bmc_project.LED.GroupManager /xyz/openbmc_project/led/groups/power_on
 org.freedesktop.DBus.Properties Set ssv xyz.openbmc_project.Led.Group Asse=
rted b true<br>
</span><span></span><br>
</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
harley</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> =D6=DC =
=D4=B6=C7=E5 &lt;zhouyuanqing8@outlook.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA7=D4=C213=C8=D5 19:51<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Vishwanatha Subbanna &lt;vishwa@linux.vnet.ibm.c=
om&gt;<br>
<b>=B3=AD=CB=CD:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&=
gt;; uperic@163.com &lt;uperic@163.com&gt;<br>
<b>=D6=F7=CC=E2:</b> =BB=D8=B8=B4: busctl call &quot;led method&quot; faile=
d</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"color:rgb(50,49,48); background-color:rgb(255,255,255); disp=
lay:inline!important">Hi Vishwa</span><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"color:rgb(50,49,48); background-color:rgb(255,255,255); disp=
lay:inline!important"><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"color:rgb(50,49,48); background-color:rgb(255,255,255); disp=
lay:inline!important">&nbsp; &nbsp;&nbsp;I copied your command and tested i=
t again, the problem is still the same.</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"color:rgb(50,49,48); background-color:rgb(255,255,255); disp=
lay:inline!important"><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"color:rgb(50,49,48); background-color:rgb(255,255,255); disp=
lay:inline!important">&nbsp; &nbsp;&nbsp;I looked at the phosphor-led-manag=
er-master document and saw that the sys/class/leds directory needs to gener=
ate the following files.</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"color:rgb(50,49,48); background-color:rgb(255,255,255); disp=
lay:inline!important">
<pre style=3D"font-weight:400; box-sizing:border-box; font-family:SFMono-Re=
gular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace; font-size:13.6p=
x; margin-top:0px; margin-bottom:16px; padding:16px; overflow:auto; line-he=
ight:1.45; background-color:rgb(246,248,250); border-top-left-radius:6px; b=
order-top-right-radius:6px; border-bottom-right-radius:6px; border-bottom-l=
eft-radius:6px; color:rgb(36,41,46); orphans:2; widows:2"><code style=3D"bo=
x-sizing:border-box; margin:0px; border-top-left-radius:6px; border-top-rig=
ht-radius:6px; border-bottom-right-radius:6px; border-bottom-left-radius:6p=
x; display:inline; background-position:initial initial; background-repeat:i=
nitial initial">&nbsp;ls -l /sys/class/leds/fault/=0A=
total 0=0A=
-rw-r--r-- &nbsp; &nbsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;4096 Jun 21 20:04 brightness=0A=
lrwxrwxrwx &nbsp; &nbsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; 0 Jun 21 20:29 device -&gt; ../../../leds=0A=
-r--r--r-- &nbsp; &nbsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;4096 Jun 21 20:29 max_brightness=0A=
drwxr-xr-x &nbsp; &nbsp;2 root &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; 0 Jun 21 20:29 power=0A=
lrwxrwxrwx &nbsp; &nbsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; 0 Jun 21 20:04 subsystem -&gt; ../../../../../class/leds=
=0A=
-rw-r--r-- &nbsp; &nbsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;4096 Jun 21 20:04 trigger=0A=
-rw-r--r-- &nbsp; &nbsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;4096 Jun 21 20:04 uevent</code></pre>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
&nbsp; &nbsp; &nbsp;However, /sys/class/leds is empty on my board. I am not=
 sure if it will affect this problem.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; background-c=
olor:rgb(255,255,255); display:inline!important"><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; background-c=
olor:rgb(255,255,255); display:inline!important"><span><span style=3D"font-=
family:Calibri,Arial,Helvetica,sans-serif; background-color:rgb(255,255,255=
); display:inline!important">root@starlake:</span>:/#
 ls /sys/class/leds/<br>
</span>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; backgro=
und-color:rgb(255,255,255); display:inline!important">root@starlake:</span>=
:/#<br>
</div>
<div><br>
</div>
<span></span></span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span>root@starlake:/sys/firmware/devicetree/base/leds# ls<br>
</span>
<div>compatible &nbsp;fault &nbsp; &nbsp; &nbsp; identify &nbsp; &nbsp;name=
 &nbsp; &nbsp; &nbsp; &nbsp;power<br>
</div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; backgro=
und-color:rgb(255,255,255); display:inline!important">root@starlake</span>:=
/sys/firmware/devicetree/base/leds# cd fault/<br>
</div>
<div>root@<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; ba=
ckground-color:rgb(255,255,255); display:inline!important">starlake</span>:=
/sys/firmware/devicetree/base/leds/fault# ls<br>
</div>
<div>gpios &nbsp;name<br>
</div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; backgro=
und-color:rgb(255,255,255); display:inline!important">root@starlake</span>:=
/sys/firmware/devicetree/base/leds/fault#<br>
</div>
<span></span><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div>
<div id=3D"x_appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> Vishw=
anatha Subbanna &lt;vishwa@linux.vnet.ibm.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA7=D4=C213=C8=D5 17:02<br>
<b>=CA=D5=BC=FE=C8=CB:</b> =D6=DC =D4=B6=C7=E5 &lt;zhouyuanqing8@outlook.co=
m&gt;<br>
<b>=B3=AD=CB=CD:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&=
gt;; uperic@163.com &lt;uperic@163.com&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: busctl call &quot;led method&quot; failed</font>
<div>&nbsp;</div>
</div>
<div class=3D"" style=3D"word-wrap:break-word; line-break:after-white-space=
">
<div class=3D"">Hi harley,</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">I am able to see it working. Please check if there was any =
typo etc.. journalctl would have the info</div>
<div class=3D""><br class=3D"">
</div>
root@rain4bmc:~# busctl --verbose &nbsp;call xyz.openbmc_project.LED.GroupM=
anager /xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Proper=
ties Get ss&nbsp;xyz.openbmc_project.Led.Group Asserted<br class=3D"">
MESSAGE &quot;v&quot; {<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; VARIANT &quot;b&quot; {<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; BOOLEAN false;<br c=
lass=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; };<br class=3D"">
};<br class=3D"">
<br class=3D"">
root@rain4bmc:~# busctl --verbose &nbsp;call xyz.openbmc_project.LED.GroupM=
anager /xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Proper=
ties Set ssv&nbsp;xyz.openbmc_project.Led.Group Asserted b true&nbsp;
<div class=3D""><br class=3D"">
root@rain4bmc:~# busctl --verbose &nbsp;call xyz.openbmc_project.LED.GroupM=
anager /xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Proper=
ties Get ss&nbsp;xyz.openbmc_project.Led.Group Asserted<br class=3D"">
MESSAGE &quot;v&quot; {<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; VARIANT &quot;b&quot; {<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; BOOLEAN true;<br cl=
ass=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; };<br class=3D"">
};<br class=3D"">
<br class=3D"">
root@rain4bmc:~# busctl --verbose &nbsp;call xyz.openbmc_project.LED.GroupM=
anager /xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Proper=
ties Set ssv&nbsp;xyz.openbmc_project.Led.Group Asserted b false</div>
<div class=3D""><br class=3D"">
root@rain4bmc:~# busctl --verbose &nbsp;call xyz.openbmc_project.LED.GroupM=
anager /xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Proper=
ties Get ss&nbsp;xyz.openbmc_project.Led.Group Asserted<br class=3D"">
MESSAGE &quot;v&quot; {<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; VARIANT &quot;b&quot; {<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; BOOLEAN false;<br c=
lass=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; };<br class=3D"">
};<br class=3D"">
<br class=3D"">
root@rain4bmc:~#&nbsp;</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">Alternatively, you could use bustle set-property&nbsp;</div=
>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">
<div class=3D"" style=3D"margin:0px; font-stretch:normal; line-height:norma=
l; color:rgb(59,35,34); background-color:rgb(215,211,183)">
<span class=3D"" style=3D"font-variant-ligatures:no-common-ligatures">busct=
l set-property xyz.openbmc_project.LED.GroupManager /xyz/openbmc_project/le=
d/groups/power_on xyz.openbmc_project.Led.Group Asserted b true</span></div=
>
</div>
<div class=3D"" style=3D"margin:0px; font-stretch:normal; line-height:norma=
l; color:rgb(59,35,34); background-color:rgb(215,211,183)">
<span class=3D"" style=3D"font-variant-ligatures:no-common-ligatures"><br c=
lass=3D"">
</span></div>
<div class=3D""><span class=3D"" style=3D"color:rgb(59,35,34); background-c=
olor:rgb(215,211,183)">busctl get-property xyz.openbmc_project.LED.GroupMan=
ager /xyz/openbmc_project/led/groups/power_on xyz.openbmc_project.Led.Group=
 Asserted</span></div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">Thanks,</div>
<div class=3D"">!! Vishwa !!</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D""><br class=3D"">
<blockquote type=3D"cite" class=3D"">On 13-Jul-2020, at 2:07 PM, =D6=DC =D4=
=B6=C7=E5 &lt;<a href=3D"mailto:zhouyuanqing8@outlook.com" class=3D"">zhouy=
uanqing8@outlook.com</a>&gt; wrote:<br class=3D"">
<br class=3D"">
Hello everyone=A3=AC<br class=3D"">
<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;There are the following calls to busctl, =
it is normal to use the get command, but the set command prompts &quot;Call=
 failed: path or object not found&quot;, and no other log information is ou=
tput through the journalctl command. Please take a look at&nbsp;how to loca=
te
 this problem. Thank you=A3=A1<br class=3D"">
<br class=3D"">
<br class=3D"">
&nbsp;~# busctl --verbose &nbsp;call xyz.openbmc_project.LED.GroupManager /=
xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Properties&nbs=
p;Get&nbsp;ss xyz.openbmc_project.Led.Group Asserted<br class=3D"">
MESSAGE &quot;v&quot; {<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; VARIANT &quot;b&quot; {<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; BOOLEAN false;<br c=
lass=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; };<br class=3D"">
};<br class=3D"">
<br class=3D"">
&nbsp;~# busctl --verbose &nbsp;call xyz.openbmc_project.LED.GroupManager /=
xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Properties&nbs=
p;Set&nbsp;ssv xyz.openbmc_project.Led.Group Asserted b true<br class=3D"">
Call failed: path or object not found<br class=3D"">
<br class=3D"">
harley<br class=3D"">
</blockquote>
<br class=3D"">
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_HK2PR04MB3826F276CE819BBB58CA6C89FE600HK2PR04MB3826apcp_--
