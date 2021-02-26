Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14227325BB0
	for <lists+openbmc@lfdr.de>; Fri, 26 Feb 2021 03:41:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dmv6j0Yjrz3cl4
	for <lists+openbmc@lfdr.de>; Fri, 26 Feb 2021 13:41:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=QqvI1CzE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=6841323e9=scron.chang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=QqvI1CzE; 
 dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Fri, 26 Feb 2021 13:41:01 AEDT
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Dmv6P4sFkz2y0G
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2021 13:41:00 +1100 (AEDT)
IronPort-SDR: O2IcMMLGUrrr6cmS873wog97mu5j/ALKZwqC4q6wvQf5DHKEIsnnEcRyYAWF6xKfCGQvo/EgGW
 eiayE/7V8dlA==
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx01.quantatw.com with ESMTP; 26 Feb 2021 10:39:53 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 26 Feb
 2021 10:39:52 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (104.47.126.59)
 by mailbx05.quanta.corp (10.243.91.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4
 via Frontend Transport; Fri, 26 Feb 2021 10:39:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+QU3I4pzQphleprXvQgTUGKHtbtNcxAsBbvaCxwpYDvR0ECLxGhWY8ubSAYfAk6yRmwUwglZYJDRy3FwzwoKFr7TedqlEG1SjyZ12a90dZOgMGu3VKOtG8FFl70BRPuT+SctbiCN1oa+QNoEQSwdFynsXh1hs/s3izh2sKjJ/sFJiy3/DZaljv4bapo+IBtpbTaKXU0Sxpk0MA5y8EO6Hut8BZdoq6SMrZWXJp4ncREeGO1VG7zLUHynXv+y/XW+hOxNw18uxJ3EcIZGiXmTgxa9NXJQ7Vl7hJIkiEIv2+yjdxexC3QhUTlMEoYQKozv6MHSpPGqA7OrJIUPUYT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkG3IoNyYnmJjKXRIFA32xrU0mlTRYHRjt6pUIY6t4U=;
 b=PE1Hvs1EqKO2VowOQ0IOeU7T9M7vlIkcjjgBR78a9pM/zZ8uoEHiYMMImjqzhYjFG8KUmbqsYmaC+sMJMdF+Wpa+tFITjIUib6c62+ANrvuf7X8EU2MQah2lsY4X+UlRHOqZfHsJHlfOEnluRSbs/DWKdS4/OMo6iPYndqcxLkCamO/R2Xg+NFQzAHRfwDvWR5vQ9rVN62VkhPULOCm+gdbYPhZKO+hGTyvMNpo/ATzOySF47GuWbbdCGwlfluNvYen+x4G+36pfjJ+jaw7LhMAQSd8cye08ackrhGDJdcjFBXTPD1CS9/B9Oe6npEsSkr1GsF2BYYpO/1GPPxnysQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkG3IoNyYnmJjKXRIFA32xrU0mlTRYHRjt6pUIY6t4U=;
 b=QqvI1CzEXHKHpwDOlGOr7HMYN43XCtnDMlMhCemnkgqcUPbVS6jLcCeEmR8zFfmgEDeOfVoipP8S9AVNV00UCF7GVIRHELydMzQlvoXFpMYQl3kN7InbZhr6cY7DnsIAkybNVLklHwx3GKUQRC+lzxduBnDZnarDu7VgqvITiVo=
Received: from HK0PR04MB2564.apcprd04.prod.outlook.com (2603:1096:203:67::10)
 by HK0PR04MB2292.apcprd04.prod.outlook.com (2603:1096:203:4b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Fri, 26 Feb
 2021 02:39:51 +0000
Received: from HK0PR04MB2564.apcprd04.prod.outlook.com
 ([fe80::8cc7:12a2:abfd:c51]) by HK0PR04MB2564.apcprd04.prod.outlook.com
 ([fe80::8cc7:12a2:abfd:c51%7]) with mapi id 15.20.3890.019; Fri, 26 Feb 2021
 02:39:51 +0000
From: =?big5?B?U2Nyb24gQ2hhbmcgKLFppfKptSk=?= <Scron.Chang@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: The entityID and entityInstance always be 0.1.
Thread-Topic: The entityID and entityInstance always be 0.1.
Thread-Index: AdcL5d/3mIPE6KpESgGvXuHOrcuXfQ==
Date: Fri, 26 Feb 2021 02:39:51 +0000
Message-ID: <HK0PR04MB25640ECCDEBE6D56436E8C1B869D9@HK0PR04MB2564.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [60.251.243.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52f2d4ee-7915-4410-3503-08d8d9ffcab7
x-ms-traffictypediagnostic: HK0PR04MB2292:
x-ms-exchange-minimumurldomainage: github.com#4889
x-microsoft-antispam-prvs: <HK0PR04MB22928125A405ABE41BD857CE869D9@HK0PR04MB2292.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tjolvO57rGfW/AIQo3lYd8LT/qGKK8EAOvOGtmkwMMYHvK6Td4DcR3dHv6oIzHt+P7SuHrmpfpvBJHs4Vt3dZUVk8ANVVFz0Itt8BYCvRKuUbq5i79BSDhyqA0r2oMkJgIofd50tBB+PYyF6fJhr//QwdtBiDztQR3zBoJHuAXEv97mf/cg6UF1sZOpDnTmhEyA96HoE4tqCMdFTNHBDCqOuZiXZa4rV3q1xWSK8VQy7L5Nr2EiCFziv7BjviurjZFHTv7gUQsFQwueqkdw8drRsmvLRom9KyTvJVEtK+bGfUjwuqD1gbRFGbg2rgq23AwRHrA8GmrgtI1Z/eOgDtmQHXE4Bj8HB/UIyATN1hauwuwDs+JJMyXna75f5eg2Gcc0cpCWe5i1ouZI76+FUO2ycRVY8p7t1y2Rwj6uRL2IzY835j3Q0G0zfzfHP+UUe9OTDnGYbh7V/ZZmXPoB1FZm56LhEXxDatJp9wY7V3ISfn0paM5FOZpu/BQ2C1IgyOjGejCVvYWUIGJLbwQDnlthfdPssGSSNbk9YwldLQVHsygy5lwqQlIgEyyp/PosQb5Tpbv9AE5BxMb7PcNlIvSQMD1025c2wF0D+nXfIois=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2564.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(966005)(86362001)(33656002)(5660300002)(478600001)(52536014)(71200400001)(316002)(85182001)(6916009)(186003)(8676002)(8936002)(6506007)(4744005)(55016002)(76116006)(66446008)(66556008)(9686003)(64756008)(66476007)(66946007)(26005)(7696005)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?MEpBK013THQ0Y2xUVVU5TXVUVS9laHBjZEFodk1OZlVrUlZ1eG5BZkQySlNPMXgz?=
 =?big5?B?MDZCVDNnRjRPSzlWWTVPV3ZVR25LcEoxWXU1K0tMSHdrck5IVlcyMjdMZ1liTUh4?=
 =?big5?B?V3hNZUx0V2kwVXVpVEJLdlB3UnhSWGVDbFk0OWkyQjl5R25LOUp5SVhOSlBsZDBh?=
 =?big5?B?eFp0ck1pb0pQWjJ3RDdIeWw4aVM4UmkzL3Z1VDhuOFNsYko0U2FJSHJoYVlvdGNo?=
 =?big5?B?MERvVkY1R00xUkFWYnhsMHBwQTRBMFh5MVd2L0RLa0pLY29pS09mcTdrNkNPYXRt?=
 =?big5?B?cmRmOU5vdmJ6NUlTcHBlRnFKZHgzSG1qb09icXBtc0FaZW9FMytVMWplSnBJNDZK?=
 =?big5?B?a0N5YzRzNXZzQi9WUHFMNmxIcGVTYXNETDNybGIvdzFWa1NFNDh6U2dGNDhOYmZN?=
 =?big5?B?b2hTV3BhcUg5ZVRXS2ZDSDBKT3BoOGRlWUVVZzFRWkFRSDFSQnBnWVdvVGpSazg0?=
 =?big5?B?Mk83YkFJaHNVWGZGOEV1USt0TlZETVVMOFRFZ3JweXFkMXFEaHZ3aXpqVVQyRDNj?=
 =?big5?B?Nm1EanQwZERKUUozeWZ3WUozVTgzdHVJcGxHYU4zNzJGeml3a2lPREFlYVI1SWRs?=
 =?big5?B?ZGVRWW5Sb21TcHRHaGw1dy9SZWw3UVdqUitKbzJtR0lwMC8rUWd1VzZjZXcySE9w?=
 =?big5?B?ZTFJZmh1TnM4R1BuVXVpVklSMFNzUjAwc25iczN1MmNpZTBwNVorU1hsV0lIdGZp?=
 =?big5?B?Q3NIUjFwT1haL3Y5L05rakpmd3g2OGQvVUlCL0JUbGtMV08vMzhoT0M1WVlNQUVo?=
 =?big5?B?d1VtSGZjcEU2VUxJN2JMcXR2cVR3dU10c205eTVwQVdoaUZzYlgxQy9Vc1RKNHlN?=
 =?big5?B?Sjc4QXJneE9iQWJjWkJrS1FyeUFkK2NRWkRtOEsrbStTT0lMTFJtZ2lQUlFSSnNl?=
 =?big5?B?WGpQUmJnQ3kxWEF2c09NMU5lRUduc0NMMjV2WEJZNUx2SEZZallPSEtNU3RGN2Nm?=
 =?big5?B?bkNZVk41UWFXSUI0dmNnQWp6NXE3cXlJblB3ZXNaQW4rME81WkMwU1p6UEk0N3NL?=
 =?big5?B?QVdNcE4yZ2hNdUU3cGlaL3hPU0ZUaHhOVHlLaU9xNStXRlc4MSt2amt3THY2NnMr?=
 =?big5?B?Mzh3RmpwQzlVcmIrK0RuOXJxaTVoalgzSXl0Q0VaZVlqR1g1NlRZY3I5Nm5XRkpW?=
 =?big5?B?Smdzc1huMXBZNmQ1SU8rRkx6YmVGMi9mbTVqYzg0cGdlblZwLzNrU3VWYkNNNjN1?=
 =?big5?B?aGFrdEIxcWhnNkFNSkhtdWdIaUJtK2dwcEVjdXRjY2dQM2FKT3FWQTlKTXFTWnN3?=
 =?big5?B?cUdZTHR4aGNmNE5ORzFpb1poUjNwaytTZlpSOWtlNmZYVHB0Y08zODZ0U3c5Nldi?=
 =?big5?B?emtZS2twalpVWTRVdjJOdW13TGlPeG15SFd4c3FGL0JCOStDWUJkQW1JSndDRXZy?=
 =?big5?B?N1huOUl4Qml5dEFweThrd0o3c1Z4T0pmQ1BTcEtmRVZxUmoyTkhTWk51NS9kVnkz?=
 =?big5?B?a2tIZS91TFRnbVg1bCtZZDZwZzBMc1FMcnhkVzhLbC9LSCtWRzVOWk1RNlVuN1Fl?=
 =?big5?B?OGlaTCtOS0M1K0RjRElhQml1cndhb0ExYlVBaGNpdWtGT1U5dGpmUHFDb3lUU0l5?=
 =?big5?B?a2lySDRMUzFucVkwUi9SaUxrOXVZK2g1Q0pxdHpGTll5K3hoZVI1WGgrQTk5akpn?=
 =?big5?Q?HitlKXXdnV12iusVDwEOHWe63Dg=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2564.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f2d4ee-7915-4410-3503-08d8d9ffcab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2021 02:39:51.3597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0uK5eoAzGxAXUsfpz5ea+l1/oWuUrRJZp+AmVkyAcYeBjdCt1qYdlmacqFt4f86l/25JXimU2miJQEeqsLFpnNoriEIzTo2RjWtrLxPojdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2292
X-OriginatorOrg: quantatw.com
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

SGkgYWxsLA0KDQpJbiBteSBjYXNlLCB0aGUgQk1DIHVzZXMgaW50ZWwtaXBtaS1vZW0sIGVudGl0
eS1tYW5hZ2VyLCBhbmQgZGJ1cy1zZW5zb3JzIHRvIG1hbmFnZSB0aGUgbW90aGVyYm9hcmQncyBz
ZW5zb3JzLg0KSSBpbnRlbmQgdG8gcmV0cmlldmUgZW50aXR5SUQgYW5kIGVudGl0eUluc3RhbmNl
IHZpYSBJUE1JIGNvbW1hbmQsIGUuZy4sIGlwbWl0b29sIHNlbnNvciBnZXQgPHNlbnNvciBuYW1l
Pi4NCkhvd2V2ZXIsIGludGVsLWlwbWktb2VtIGFsd2F5cyB0cmllcyB0byBmaW5kIHRoZSBzZW5z
b3IncyAiZW50aXR5SUQiIGFuZCAiZW50aXR5SW5zdGFuY2UiIGZyb20gaXRzIGVudGl0eS1tYW5h
Z2VyIGVudHJ5LiANCihwbGVhc2UgcmVmZXIgdG8NCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1j
L2ludGVsLWlwbWktb2VtL2Jsb2IvMDk3MDFlZmE5M2YyZTliMjViMTljNDU2MGRiNjBjMTg3OGVm
OGE5Yy9pbmNsdWRlL3NkcnV0aWxzLmhwcCNMNDM4IGFuZA0KaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5ibWMvaW50ZWwtaXBtaS1vZW0vYmxvYi8wOTcwMWVmYTkzZjJlOWIyNWIxOWM0NTYwZGI2MGMx
ODc4ZWY4YTljL2luY2x1ZGUvc2RydXRpbHMuaHBwI0w0NzApIA0KDQpJdCBzZWVtcyBsaWtlIHRo
ZSBlbnRpdHktbWFuYWdlciBzaG91bGQgY3JlYXRlIHRoZXNlIHR3byBhdHRyaWJ1dGVzIGNvbnN1
bWVkIGJ5IGludGVsLWlwbWktb2VtLCBidXQgc2NoZW1hIGRvZXNuJ3QgaW5jbHVkZSB0aGVtLg0K
QmVzaWRlcywgZW50aXR5LW1hbmFnZXIgZG9lc24ndCBjcmVhdGUgImVudGl0eUlEIiBhbmQgImVu
dGl0eUluc3RhbmNlIiBieSBpdHNlbGYuDQpJJ20gY3VyaW91cyBob3cgaW5pdGlhbGx5IGVudGl0
eS1tYW5hZ2VyIG9yIGludGVsLWlwbWktb2VtIHBsYW5zIHRvIGltcGxlbWVudCB0aGlzIGZlYXR1
cmUuDQoNCkFueSBzdWdnZXN0aW9uIHdpbGwgYmUgdmVyeSBhcHByZWNpYXRlZC4NCg0KU2Nyb24g
Q2hhbmcNCkUtTWFpbCAgU2Nyb24uQ2hhbmdAcXVhbnRhdHcuY29tDQpFeHQuICAgIDExOTM2DQoN
Cg==
