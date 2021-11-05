Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 941AD445D4C
	for <lists+openbmc@lfdr.de>; Fri,  5 Nov 2021 02:28:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HljZB3QGpz2yPp
	for <lists+openbmc@lfdr.de>; Fri,  5 Nov 2021 12:28:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=AoPSqWmF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.120;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jammy_huang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=AoPSqWmF; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320120.outbound.protection.outlook.com [40.107.132.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HljYZ5D96z2xtN;
 Fri,  5 Nov 2021 12:27:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jeo6aznqylXLiFyFdNDZmgZZKkfki6ZyHRW5Od7Wa0rKi+GabyxD/Zwlklg93/f9bWzpoTBhE+QscN0Y5o+uEXrfkkPcnVb5+7KPnrvoh0EtAso9053h6dU+CVrHE3HkdHDeE6cyNCAeOLxXY6+a2XkGnlz4BBFRHmaJT5YDbBWKH8s6uF1ybsoC6xYhYKRVGXttZ2SCxonagGMGcXePjeE7II1UBgAYnWh1d9xRZJtPU2h/WlK0ZTeco444TyxZ1o0SIAVrWb3M5c9nxpOhTUPgKfSBqgqbluEBNi3Di/SRNfu+XtmoyIlBSvVP//2lX0mDc+D7wdg21KKuWsPFRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPEZatI3HBUaYJCd1a62hVb3iw+pmaSl9q4GmKiF+tQ=;
 b=hpx4JS27Fps7jJwnbsmAXIZzqYw6DNk3X0ymhuNj9/UIXKUDO7c+43k5o9TSZqozgJjdhhlm1yIe+RdfYVfrz0ptoXXHUXWlnIrZLhT9Gox80BCvw1i7DLo08rqyfAQQDaag+AnbNyUtVYK0mrvZOYF3oKTweuW/IZ2ab54hElbw2QNGJzkbU250Pjyvs2FMfgeeKI5UPovk/2Z8jiGv79hZ5590IdGrj6e8CylIy6fgqHjxku0OhooKyWcrB8q2TCFhgbPucQDhKpUmvpe6yKX1pgEQ3FcWkGUsgSm+oLd9v76EPZi7p6hnmFfULAlozu1CIYHcx1BqGv9bJYwjCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPEZatI3HBUaYJCd1a62hVb3iw+pmaSl9q4GmKiF+tQ=;
 b=AoPSqWmFDRFBOWpH9h8XQ5wrRHSa4Gc7NhMTUADWXeeydCdltkHI7V2JCtLc4JTM/vgQBlgXmlPIYvLiTJYohH0W5zQRFoq3u9B/HwykliaAs6GBq9hGfaG2Uz6tWvMWDgDI3xeqkQFtmKhUoCMBnnDhBNon/+6+xOLtgihMdPKNies/EqSqAmCrMAiWmBSNVCKj/uEiwPkraKMSdOehOcosu+Gl4X+e42/Fy0zKgUevRJqSBBNGwy/egDFmW+BKfrMbjugC6jZ3w8N2Y22ekLQf0TidjbzZ9VKnfaP7ANT4Z0li2rndcgbbiZyp1iLKM2o2LLzjShYARxJc2rLmHg==
Received: from HK0PR06MB2722.apcprd06.prod.outlook.com (2603:1096:203:56::14)
 by HK0PR06MB2628.apcprd06.prod.outlook.com (2603:1096:203:34::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.19; Fri, 5 Nov
 2021 01:27:27 +0000
Received: from HK0PR06MB2722.apcprd06.prod.outlook.com
 ([fe80::1090:c6f6:9427:fea2]) by HK0PR06MB2722.apcprd06.prod.outlook.com
 ([fe80::1090:c6f6:9427:fea2%6]) with mapi id 15.20.4669.013; Fri, 5 Nov 2021
 01:27:27 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, "eajames@linux.ibm.com"
 <eajames@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] media: aspeed: use reset to replace clk off/on
Thread-Topic: [PATCH] media: aspeed: use reset to replace clk off/on
Thread-Index: AQHX0HWk1k9H7vBNJU2y+eOzLIRHoqvzh4GAgACfv5A=
Date: Fri, 5 Nov 2021 01:27:27 +0000
Message-ID: <HK0PR06MB272258A4BA760E70CF609888F18E9@HK0PR06MB2722.apcprd06.prod.outlook.com>
References: <20211103054316.25272-1-jammy_huang@aspeedtech.com>
 <883dd517-7996-8c44-8cea-1c8838b367b6@linux.intel.com>
In-Reply-To: <883dd517-7996-8c44-8cea-1c8838b367b6@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa1d304e-b10b-4a61-98aa-08d99ffb6d76
x-ms-traffictypediagnostic: HK0PR06MB2628:
x-microsoft-antispam-prvs: <HK0PR06MB262869E376421344FF1BE3B1F18E9@HK0PR06MB2628.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4fJ/Q9pIwFISc97mMMC7O1zRh/ICiJ7M5DBtoGqKlnLFssmH+zn8QEUS9ayuLZUn0HwPbHD7DtjEiNiNIQiTbAPJqvqQ0KfqcoYpch2jyLsYocAYBX646NnAUp6xMXfwHlburHE4TYFHoMcUJjyclUpKRFVUg1yv2SFySr62uMRHIcCEw9HYpmD0jInNz51evk2oxeo9yTTHFdNOvBVpJ6jIkl98QBMvF7bKHTdB1cHxTxrXNfZ7ZUXv7UkMpIXXQlnREnKYWtdqx1hKCJonxiBRnDkttXS0qBn7AuB961dXy1XzdkzLptStnIT9xWiloDWTWhrlVJ4P9WnoLfeJP5Wcel8nyKHhV2gAhb8vKHwA+Lzyn3Hha90Re0BqjgTRS643ptcfZ28Ug30s1E9+HaMjWTSBq0NQlTi+yEfjJwIyBNEm4RWG+C/HuDMOmvpDwxy12PquuyZVVaS8XiBPyBEd9+fRyv0W7iqSNgvBkVi8hcaNgUsOrzRDkdF59pH//sR8AJmbZdJVqYXak92tcrvx94S4SC2N4F0cTnqgwVYziqq/fMkZ8L91/PUAk9nm1tzI+XUJiREiJRibYw9YgrXitI0eMq08JZ+Ln+C/siUQHB6dJXG53hajBxlG7UUnvyp5sSX3crcaXKyVPniAdtHVjpX+1l2vHsjAyfn/p565UFv4Js3qCd5QTlWq94uJrt0u0JpxvEkomyDVR3TsIV0398dBiI8qqWzV5Ledwik=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2722.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39840400004)(396003)(376002)(366004)(136003)(66946007)(76116006)(8936002)(6506007)(53546011)(52536014)(66476007)(66556008)(64756008)(7696005)(71200400001)(66446008)(33656002)(921005)(122000001)(38100700002)(55016002)(2906002)(9686003)(7416002)(5660300002)(86362001)(38070700005)(110136005)(316002)(83380400001)(26005)(186003)(8676002)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlcwbEhKcEVUUTlPRjRleVUzV1Q4WFV5QVNXMXovNlZHQ3BmbGp2ZDlJMmMx?=
 =?utf-8?B?SURUZDlRMVU1SmpxWVlrUkVIT2QyTjdlMkFDWFFRYzJzU2NjZUpLVGw5TDdi?=
 =?utf-8?B?K2dGNFFFUmNkZTBybWZuekR5NWVETm42bTQ3amhYMDdOOE1uekZtWlVpUHAx?=
 =?utf-8?B?b1Z0YmtlTzRlaFNGbjNVV0pPWmJKRE9KYnoxa1BVRFhJbWc0TW9TTU91ajQw?=
 =?utf-8?B?WmpZSldISlpuelRyd3Fub3J3eHZMbEw1SFVjcEZHS1NKOVhwODhvL3dBTEww?=
 =?utf-8?B?ckpzSDM5MDYyaXplUTdOQzFidkExVlpQY0V6R0xGOHN2bjRXK0lFWUZDMzVZ?=
 =?utf-8?B?N0lueXpFekxNQm1oN2dGOHJZZXdzR1h6V3pmQmsyWlBMZ2FSMlB5cmU3ZlBv?=
 =?utf-8?B?N1FxWkxzS3dqZDZXT0FSU3BodDNFTklFRVVHSXUwc0IzWVNpMXBGOXJDSHdS?=
 =?utf-8?B?S0lUWWduWEw4M0pueWZlMjlrajc5ZXYvdkh3QjlBcVFYTTlCU05iTGtMTjB5?=
 =?utf-8?B?VWdWdjFwQk5yMTRFSS9FL0lJK1MzSUNURW53S2hWNVViUFA3aEpQZ0Y5YjBZ?=
 =?utf-8?B?K2kyN1F6KzRJbUp2bmx1M1BBc09rckFUb0VYT21qYXFUM3lVUUdBTmw0K2pX?=
 =?utf-8?B?Vk9BMElvT2lNMUxvVVhhMFE4UmZ0ajBoY1h2L2lIS2M2Q2U4ckI5R0gxdnNT?=
 =?utf-8?B?NmxGMDBiY3Fhd0djdXdTbGJTUmVENHJDeko2RFlvRlVURGlWQlhOWkVVb3o1?=
 =?utf-8?B?Ty9SM0hvOWZlb1NJUFhzK1ZqMzNNYW9yZlF3djZlbW5LUkJsbnUxMVRUZjh3?=
 =?utf-8?B?RFl3OGtHbEVYRmwvaEROd2UvSTc4Yko1OXJaYUhMY0NxbzdwZG9vSlVkWWdI?=
 =?utf-8?B?MVBJOVNxRUpKenl0M3A5QmlTT201MHBjc2JOd3pLT3BDcUM2Ym1iMmFwNUM4?=
 =?utf-8?B?UVVqeXg5Q0Z2UUdnczZFYVpZNXVENFdZVmc4ZGxlVVh6TVBUa0E0R01SRmw1?=
 =?utf-8?B?bytIM1FXVURudUhNVTljQkM1bEJwbVI1MGVGK2FLNHhNa014bTZDbUhqRzVa?=
 =?utf-8?B?T1dnRGR5ZmtGb3dnc2hjQXR1bWhReFlBaDlab1hsNS9idkd2M0xHdjRseHRa?=
 =?utf-8?B?Ly9vbWY0ZU1Qa0xJL0RlOWY2KzR6dzZROEtLVGhzVnJybGlaVGd3bEZLNGFV?=
 =?utf-8?B?SVJaTGNLS3JPM0FWM3RVbk55eldqOGVIdFJjTnkwRzVJaFh1aGY1UmdxOG1H?=
 =?utf-8?B?M0xNeGQ5dDJUdEF5djNKTXl0RWlNTmN6TWpGR1F0NGE2a212R0liUWxtY0V2?=
 =?utf-8?B?bGZBbjZpckFSUXFIay9ReC8zSTlDcHpTcUFHeklOZXNDa29IVlYvVlRmTWx1?=
 =?utf-8?B?VlNHZ0dRV0tPMUpKWitDZ25RaFA1eXBXNUhaZHNEd2RXbFlMR0I5RjNIQmw1?=
 =?utf-8?B?S1lWc3dIL1VJWVdXYzFCaXp4dkF6VVRTNXR1UnhtdXNiZDhuR29GMytvNGlw?=
 =?utf-8?B?cjFDU1RQdnVOTzUyR090dGZkSEJ1V3FtTlRSbkZNcmJLQkZTQTRYeXUvSE1F?=
 =?utf-8?B?b1NiT3VjemZuT1pPcTFzTDB6VG1BVU1GK0pyU0d6V1lQNmRRVDdvbHpHUlBD?=
 =?utf-8?B?Z0lxQWVBdDdaWWhJOEw4TjJqMEhNWGtIZFpYL1gweW9qNFkyN29XaDBzOVR6?=
 =?utf-8?B?OElJTGdVaHFTdGIyMVdUYlVNV3Y2OTI3U1pwa1I0S094UzdEWHNnTHIxUENv?=
 =?utf-8?B?c0swWXZnSEpnOU5pTXFVMlF0ZmZlWlJ0MXA1TkZHRTcrRHMvcE9MK0RQL0ZW?=
 =?utf-8?B?Z2lrajJ2cGRYMVBGVVQ4V3VzWGlVZWxTUXFZQmJyeTFNYW9NSVFTK1QwTFhz?=
 =?utf-8?B?R0Y3UitTMFNwc3JqWHUzZjZCbDMwMSs5K0FkaVFpc3JLVDU4NGluTEdYRysw?=
 =?utf-8?B?NFNTZGZsRGd6amVILzRaVkQrZzIrazhrYWthdzhvMk1YbGxmMW5xMHpNa1Rx?=
 =?utf-8?B?dXFZeEtGMm51WlpjWGcrSk5veWViRDc3S0VjUTUxRjN6NjhOZ25Od1ozaWo0?=
 =?utf-8?B?UG81QnVDS1VKY1h3MU5KSDhrTTk4ZDZQdk05OWxzdWViQkpzNmNRaEFKd01X?=
 =?utf-8?B?a1d0TEc1QzdQZ0RFOURhQStzVGN6aktCQjByUEZPdU5maGgyb0haQXhUOTl2?=
 =?utf-8?B?clR6WFRFWGUzUUZUaDVkS0dWOURyUy95T2VnbDl5N29UODNid0JaUTIwbFg4?=
 =?utf-8?B?TUJRb3V5NDJrbDVBY2JYcndjV0Z3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2722.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1d304e-b10b-4a61-98aa-08d99ffb6d76
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2021 01:27:27.0962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0eOgRxJvvh9gxOT72BLY1UNPxpDvQl8+OE3HXjf5Ob4iTaN1UdzBLu/leSRonGp5eXe5ROoEq0nBqQr1z1HJKfqDFHSBx93j/YtlMQy89zs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2628
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

SGkgSmFlLA0KDQpPSywgSSBmb3VuZCBpdC4NClRoYW5rcyBmb3IgeW91ciBoZWxwLg0KDQpSZWdh
cmRzLA0KSmFtbXkgSHVhbmcNCg0KVGVsOiA4ODYtMy01NzUtMTE4NcKgIGV4dC44NjMwDQoNCioq
KioqKioqKioqKiogRW1haWwgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioq
KioqKg0KRElTQ0xBSU1FUjoNClRoaXMgbWVzc2FnZSAoYW5kIGFueSBhdHRhY2htZW50cykgbWF5
IGNvbnRhaW4gbGVnYWxseSBwcml2aWxlZ2VkIGFuZC9vciBvdGhlciBjb25maWRlbnRpYWwgaW5m
b3JtYXRpb24uIElmIHlvdSBoYXZlIHJlY2VpdmVkIGl0IGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5
IHRoZSBzZW5kZXIgYnkgcmVwbHkgZS1tYWlsIGFuZCBpbW1lZGlhdGVseSBkZWxldGUgdGhlIGUt
bWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIHdpdGhvdXQgY29weWluZyBvciBkaXNjbG9zaW5nIHRo
ZSBjb250ZW50cy4gVGhhbmsgeW91Lg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogSmFlIEh5dW4gWW9vIDxqYWUuaHl1bi55b29AbGludXguaW50ZWwuY29tPiANClNlbnQ6IFRo
dXJzZGF5LCBOb3ZlbWJlciA0LCAyMDIxIDExOjU0IFBNDQpUbzogSmFtbXkgSHVhbmcgPGphbW15
X2h1YW5nQGFzcGVlZHRlY2guY29tPjsgZWFqYW1lc0BsaW51eC5pYm0uY29tOyBtY2hlaGFiQGtl
cm5lbC5vcmc7IGpvZWxAam1zLmlkLmF1OyBhbmRyZXdAYWouaWQuYXU7IGxpbnV4LW1lZGlhQHZn
ZXIua2VybmVsLm9yZzsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnOyBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIXSBtZWRpYTogYXNw
ZWVkOiB1c2UgcmVzZXQgdG8gcmVwbGFjZSBjbGsgb2ZmL29uDQoNCkhpIEphbW15LA0KDQpPbiAx
MS8yLzIwMjEgMTA6NDMgUE0sIEphbW15IEh1YW5nIHdyb3RlOg0KPiByZXNldCBzaG91bGQgYmUg
bW9yZSBwcm9wZXIgdGhhbiBjbGsgb2ZmL29uIHRvIGJyaW5nIEhXIGJhY2sgdG8gZ29vZCANCj4g
c3RhdGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW1teSBIdWFuZyA8amFtbXlfaHVhbmdAYXNw
ZWVkdGVjaC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXNwZWVkLXZp
ZGVvLmMgfCAyMiArKysrKysrKysrKysrKysrKysrLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE5
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9hc3BlZWQtdmlkZW8uYyANCj4gYi9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL2FzcGVlZC12aWRlby5jDQo+IGluZGV4IGZlYTVlNGQwOTI3ZS4uMTBkMTgyMTM5ODA5IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FzcGVlZC12aWRlby5jDQo+ICsr
KyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXNwZWVkLXZpZGVvLmMNCj4gQEAgLTIzLDYgKzIz
LDcgQEANCj4gICAjaW5jbHVkZSA8bGludXgvd29ya3F1ZXVlLmg+DQo+ICAgI2luY2x1ZGUgPGxp
bnV4L2RlYnVnZnMuaD4NCj4gICAjaW5jbHVkZSA8bGludXgva3RpbWUuaD4NCj4gKyNpbmNsdWRl
IDxsaW51eC9yZXNldC5oPg0KPiAgICNpbmNsdWRlIDxtZWRpYS92NGwyLWN0cmxzLmg+DQo+ICAg
I2luY2x1ZGUgPG1lZGlhL3Y0bDItZGV2Lmg+DQo+ICAgI2luY2x1ZGUgPG1lZGlhL3Y0bDItZGV2
aWNlLmg+DQo+IEBAIC0yMjAsNiArMjIxLDcgQEAgc3RydWN0IGFzcGVlZF92aWRlbyB7DQo+ICAg
CXZvaWQgX19pb21lbSAqYmFzZTsNCj4gICAJc3RydWN0IGNsayAqZWNsazsNCj4gICAJc3RydWN0
IGNsayAqdmNsazsNCj4gKwlzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcmVzZXQ7DQo+ICAgDQo+ICAg
CXN0cnVjdCBkZXZpY2UgKmRldjsNCj4gICAJc3RydWN0IHY0bDJfY3RybF9oYW5kbGVyIGN0cmxf
aGFuZGxlcjsgQEAgLTU1NCw2ICs1NTYsMTMgQEAgc3RhdGljIA0KPiB2b2lkIGFzcGVlZF92aWRl
b19vbihzdHJ1Y3QgYXNwZWVkX3ZpZGVvICp2aWRlbykNCj4gICAJc2V0X2JpdChWSURFT19DTE9D
S1NfT04sICZ2aWRlby0+ZmxhZ3MpOw0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyB2b2lkIGFzcGVl
ZF92aWRlb19yZXNldChzdHJ1Y3QgYXNwZWVkX3ZpZGVvICp2KSB7DQo+ICsJcmVzZXRfY29udHJv
bF9hc3NlcnQodi0+cmVzZXQpOw0KPiArCXVkZWxheSgxMDApOw0KPiArCXJlc2V0X2NvbnRyb2xf
ZGVhc3NlcnQodi0+cmVzZXQpOw0KPiArfQ0KPiArDQo+ICAgc3RhdGljIHZvaWQgYXNwZWVkX3Zp
ZGVvX2J1ZnNfZG9uZShzdHJ1Y3QgYXNwZWVkX3ZpZGVvICp2aWRlbywNCj4gICAJCQkJICAgZW51
bSB2YjJfYnVmZmVyX3N0YXRlIHN0YXRlKQ0KPiAgIHsNCj4gQEAgLTU3NCw3ICs1ODMsOSBAQCBz
dGF0aWMgdm9pZCBhc3BlZWRfdmlkZW9faXJxX3Jlc19jaGFuZ2Uoc3RydWN0IGFzcGVlZF92aWRl
byAqdmlkZW8sIHVsb25nIGRlbGF5KQ0KPiAgIAlzZXRfYml0KFZJREVPX1JFU19DSEFOR0UsICZ2
aWRlby0+ZmxhZ3MpOw0KPiAgIAljbGVhcl9iaXQoVklERU9fRlJBTUVfSU5QUkcsICZ2aWRlby0+
ZmxhZ3MpOw0KPiAgIA0KPiAtCWFzcGVlZF92aWRlb19vZmYodmlkZW8pOw0KPiArCWFzcGVlZF92
aWRlb193cml0ZSh2aWRlbywgVkVfSU5URVJSVVBUX0NUUkwsIDApOw0KPiArCWFzcGVlZF92aWRl
b193cml0ZSh2aWRlbywgVkVfSU5URVJSVVBUX1NUQVRVUywgMHhmZmZmZmZmZik7DQo+ICsJYXNw
ZWVkX3ZpZGVvX3Jlc2V0KHZpZGVvKTsNCj4gICAJYXNwZWVkX3ZpZGVvX2J1ZnNfZG9uZSh2aWRl
bywgVkIyX0JVRl9TVEFURV9FUlJPUik7DQo+ICAgDQo+ICAgCXNjaGVkdWxlX2RlbGF5ZWRfd29y
aygmdmlkZW8tPnJlc193b3JrLCBkZWxheSk7IEBAIC0xNTA3LDggKzE1MTgsNyANCj4gQEAgc3Rh
dGljIHZvaWQgYXNwZWVkX3ZpZGVvX3N0b3Bfc3RyZWFtaW5nKHN0cnVjdCB2YjJfcXVldWUgKnEp
DQo+ICAgCQkgKiBOZWVkIHRvIGZvcmNlIHN0b3AgYW55IERNQSBhbmQgdHJ5IGFuZCBnZXQgSFcg
aW50byBhIGdvb2QNCj4gICAJCSAqIHN0YXRlIGZvciBmdXR1cmUgY2FsbHMgdG8gc3RhcnQgc3Ry
ZWFtaW5nIGFnYWluLg0KPiAgIAkJICovDQo+IC0JCWFzcGVlZF92aWRlb19vZmYodmlkZW8pOw0K
PiAtCQlhc3BlZWRfdmlkZW9fb24odmlkZW8pOw0KPiArCQlhc3BlZWRfdmlkZW9fcmVzZXQodmlk
ZW8pOw0KDQpZb3UgY2FuIGZpbmQgdGhlIEVDTEsgY29uZmlndXJhdGlvbiBpbiAnY2xrLWFzcGVl
ZC5jJyBvciBpbiAnY2xrLWFzdDI2MDAuYycgdGhhdCBpdCdzIGNvdXBsZWQgd2l0aCB0aGUgdmlk
ZW8gZW5naW5lIHJlc2V0IChTQ1UwNFs2XSBmb3IgQVNUMjUwMCAvIFNDVTA0MFs2XSBmb3IgQVNU
MjYwMCkuIEl0IG1lYW5zIHRoYXQgaWYgd2UgY2FsbA0KY2xrX2Rpc2FibGUoKSBhbmQgY2xrX2Vu
YWJsZSgpIHRocm91Z2ggYXNwZWVkX3ZpZGVvX29mZigpIGFuZCBhc3BlZWRfdmlkZW9fb24oKSwg
dGhlIHZpZGVvIGVuZ2luZSByZXNldCB3aWxsIGJlIGltcGxpY2l0bHkgYXNzZXJ0ZWQgYW5kIGRl
LWFzc2VydGVkIGJ5IHRoZSBjbG9jayBkcml2ZXIgc28gdGhlIHJlc2V0IG1lY2hhbmlzbSBpcyBh
bHJlYWR5IGluIHRoZSBleGlzdGluZyBjb2RlLg0KDQpUaGFua3MsDQpKYWUNCg0KPiAgIAkJYXNw
ZWVkX3ZpZGVvX2luaXRfcmVncyh2aWRlbyk7DQo+ICAgDQo+IEBAIC0xNzE1LDYgKzE3MjUsMTIg
QEAgc3RhdGljIGludCBhc3BlZWRfdmlkZW9faW5pdChzdHJ1Y3QgYXNwZWVkX3ZpZGVvICp2aWRl
bykNCj4gICAJCXJldHVybiByYzsNCj4gICAJfQ0KPiAgIA0KPiArCXZpZGVvLT5yZXNldCA9IGRl
dm1fcmVzZXRfY29udHJvbF9nZXQoZGV2LCBOVUxMKTsNCj4gKwlpZiAoSVNfRVJSKHZpZGVvLT5y
ZXNldCkpIHsNCj4gKwkJZGV2X2VycihkZXYsICJVbmFibGUgdG8gZ2V0IHJlc2V0XG4iKTsNCj4g
KwkJcmV0dXJuIFBUUl9FUlIodmlkZW8tPnJlc2V0KTsNCj4gKwl9DQo+ICsNCj4gICAJdmlkZW8t
PmVjbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAiZWNsayIpOw0KPiAgIAlpZiAoSVNfRVJSKHZpZGVv
LT5lY2xrKSkgew0KPiAgIAkJZGV2X2VycihkZXYsICJVbmFibGUgdG8gZ2V0IEVDTEtcbiIpOw0K
PiANCg==
