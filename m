Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE308558D7
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 02:57:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=h1MXznkq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZyqf3Yl8z3cCr
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 12:57:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::727; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20727.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::727])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZypj4Tkdz30f5;
	Thu, 15 Feb 2024 12:56:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FR9/nq9Nc8d/bw8akzQgZEDT+zJ36FGGwgR4Vl+0mLOFo47QPYHi+J/0uG70T12tR1YqHv9C8Ws2R+zayytHnbGndhCeZg+eT4O4zio2w0VkzTLslOW9paRh/+qc1rPEn8KAJZI5/Tn3u9jPAVE1Iwu06+nEkSN6FqmizOZwP4s6ntuOPowEWM+SM1jGd0VEVt72gltL6H8ZPHsVpYRVM31DtEj1vZWfloAYaWzhLOn/1h5FfgwMMQFenQx4hAGWf04El5oKPsR6tMKt8xidkDZ3ow1Eb1zrSD115pYV5BPMR6/8s+Pw7JOX6I+8QztEB870ODh8YvGNgUdnh80ydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlvHYIbNt+s4/WW6jhR330/e71dpEO/qNL/YjEBiJkI=;
 b=ZP/qrLr0eNFkoK0WwnvPQhddNiUu77DrkyuIpdM64ztfYtVV2pkNV/oPpJC7V/m5bC/fZmOcEOYDm8vi8FMj16m2CWQ6nsk3WeurfID+5T9wwtJENRu577dS8xeSFLCAKfgfyf++U1iUm78q5hHBNbSBaqYSbhzSScoxGBwTrTIw+ANB8SIR6eKoMuRBYKGs/oPziZ9hp8Lu0eZURtYQI+9Cqw9oDBOb3PsmPidOocB9wd62BsQnjZC1DLmGOg1fzpvr9+FDXQZp8YzrJ6yt/wRjIVIIlgEdDlFpbInAwwB8AK0cyxYKm3SMP+6j0PbE9Qm9ppMK5b+Qc50h9OblQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlvHYIbNt+s4/WW6jhR330/e71dpEO/qNL/YjEBiJkI=;
 b=h1MXznkqhG1RMM4neFtv6eN9DBK1eKKyj1iGTWlMBrgkoSppqbe8yoH6g65y0nRQC23sq1FlfsORjp9fRXaRTidRwS8ApjEUqKxLkvKcyAhPGdehiW7HUh5iYHytD98lRDeUXdp1r0yXQQhbThn2qmecubD0EiobuPN0+TNkh0zPSJBZFndBBVKLYajEoBXATJlGJ8owqMVED9X7MMgxe7yGJ6c5fb8PL8V76BXLjl0EPT0/UYGnZBQjZonTlEApwyo2GxtcMrXVm3a8Qw2uNWWQeQCAmRnqDsP+qQJdS2jYWexj17HjzxEn3TVwUqLsnoeLRpuIGaIbOFdhfFQnHQ==
Received: from TYZPR06MB6640.apcprd06.prod.outlook.com (2603:1096:400:44c::10)
 by TYZPR06MB6893.apcprd06.prod.outlook.com (2603:1096:405:1f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 01:56:00 +0000
Received: from TYZPR06MB6640.apcprd06.prod.outlook.com
 ([fe80::e77d:5a7a:3205:d527]) by TYZPR06MB6640.apcprd06.prod.outlook.com
 ([fe80::e77d:5a7a:3205:d527%4]) with mapi id 15.20.7292.026; Thu, 15 Feb 2024
 01:56:00 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Conor Dooley <conor@kernel.org>
Subject:  =?utf-8?B?UkU6IOWbnuimhjogW1BBVENIXSBBZGQgZVNQSSBkZXZpY2UgZHJpdmVyIChm?=
 =?utf-8?Q?lash_channel)?=
Thread-Topic:  =?utf-8?B?5Zue6KaGOiBbUEFUQ0hdIEFkZCBlU1BJIGRldmljZSBkcml2ZXIgKGZsYXNo?=
 =?utf-8?Q?_channel)?=
Thread-Index: AQHaXooDcj/dRKED5EijCru7OZnLmbEJqwsogAB/zICAAHchIA==
Date: Thu, 15 Feb 2024 01:56:00 +0000
Message-ID:  <TYZPR06MB6640F82C539F0B17BCDCC55E914D2@TYZPR06MB6640.apcprd06.prod.outlook.com>
References: <20240213-espi_driver-v1-1-92741c812843@gmail.com>
 <KL1PR06MB665234A65DB334B3BDF6AFA6914E2@KL1PR06MB6652.apcprd06.prod.outlook.com>
 <20240214-yoyo-platinum-dcd0e7e16a22@spud>
In-Reply-To: <20240214-yoyo-platinum-dcd0e7e16a22@spud>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6640:EE_|TYZPR06MB6893:EE_
x-ms-office365-filtering-correlation-id: 2abd40f6-4f4e-4c2e-917e-08dc2dc94240
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  c2n+BwRRf9sNZ1TqJDHGwzFc7pvHkUd1Tkd23o+08H/jgNjAXydSLvou+guoWzf7KWZfWmed9dqaJQjb0sYQJq/Mvy/aSts4hXkgbY1Ufkm65x4MpKk1jlRsSIx9HM8rRNZQWMvlhpVgj3h5B7AAFMQzg5uMr+ciF/ArHfUkisX9dBMMGS461C5iYC8UkdtqPlOpeklOW9RGyUR3G2Kl7z+qUK3jMqYfu5olmBS2AsNJ8BQSBnBs8H+bJbG91mR4CB4vxennz1OMVc5z1GkKxCAtW8aW8l1ue8P/STlCh+g+9gr3IUbrdgwYWzFUFzZwEWsu9VHrM5/PQAjF7H58lTt1zY5iRjFk7GfzY9C6rwqOlSrg/lmqH8dNiJWbuDRJ7HV/UnkD8d/3ZBe6y7YXz+RdpB0UcQjx+LAlqNIhTkVJcHLi9O4vqs73IMBTG66jlEE3XCkF8n9zpkb8wK0KQBFCMn43OFC2a/4gRSPdubd2hRyb0NCc0ur23+r+szXg26Mo1rzqfs010aGUJGSyvqqstsVpuS2/GRCZ+HPmLjn5gUsVwSqpeQaNvZd1RzNwkO8adQJNBrCNEE3CN6SLc2xpFdOcqEquE6NoIuRr7HaOMXoOn8sVQIpA+MRxGbqH
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6640.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(396003)(346002)(39830400003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(66446008)(66476007)(66556008)(316002)(54906003)(76116006)(6916009)(64756008)(55016003)(66946007)(8936002)(2906002)(7416002)(5660300002)(52536014)(38070700009)(4326008)(41300700001)(7696005)(86362001)(478600001)(33656002)(71200400001)(6506007)(9686003)(224303003)(26005)(83380400001)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UG84b0UwUDZENTRyTEdSTTNNVVlmRVdxWVc2RVRIWkJZVTFwVUFHbG5ESzY4?=
 =?utf-8?B?WTlpQ3kwTnk0cjNaaWIxeGxWNFphbWRPQVF5QUF2RzFha0pVa0VCTUYzRC9n?=
 =?utf-8?B?aU9uQnh6UHlBNUNYZFVxb21SYnhsR1ordkx6Z3U5VkVSeUd1ZTV4LzJBYzVD?=
 =?utf-8?B?dVlMd2hOcGNWcjFJdGROd0FaL0ZRNkhveW9VYTY3WkpwQ2NjUmZWbzV6cHU3?=
 =?utf-8?B?ajdBRmtNTld4eTQwSGtmMnBpUHhETitLZTVKOWRUc05SUTZZdlF3Sk43akVB?=
 =?utf-8?B?UjV5N2orWTZXNUN3S21jUTB5VC9HRlpiSDhyeWdGWnlEc284cWh5bVJkR3lT?=
 =?utf-8?B?cW52dGtPUk5wTXlpN0EwVVRTS1lSVk1OeWl6RDB2dWJybHVVRUV6OWROcVRF?=
 =?utf-8?B?L3pDZ2hBSVpQZ1h0Qi9RRzlhalV0RVZRdlFQTVd5THJYUUlZL09GR015Q3Zi?=
 =?utf-8?B?S0w5clp4M09OeHU1Zkw1ZGozYnUyUlJOV0VwZXQ2OTZXTTAzNW9pM29TMDZJ?=
 =?utf-8?B?ZnJ6bkxxNkZnMUV1a2ZIK2dYc0gzVFRCV2RtdnBFa1l3MDJ6ZStJcWl3WUNy?=
 =?utf-8?B?N2prWTRCOHQya0VyUFB3VnNLN0hTNEpPQmp3YVdwelkzODQvTTVGYlJJYzJM?=
 =?utf-8?B?VG5BanU0MFFOWnVXdDdtZkVUTTdDTFpERTkwQm1HM0pIUVZ0cGlLbTFjLzBT?=
 =?utf-8?B?V0F0TjdiUHl0VzNuNFV3eGllbS85ZExxT3hkZnhkbjVQV21xWllwbU1nbHc1?=
 =?utf-8?B?cWJkaTNSRmV4QmowQ0Vwcnl0cGw2Uk1TNlhXQU15dURFTmJ3ZkFNSEZrVUxy?=
 =?utf-8?B?K3pDTWdLTWIwa1dZMGxsVHhVeWxnUFIyOGt4d2FCdi9oa2w3ZDFkWGNuZzd5?=
 =?utf-8?B?c3NVYjdzU0Q3bEc3SlpOb2FIRDNUd0QybVNzOHpMOW1qU0dFS0tJR3Z2S0JO?=
 =?utf-8?B?dUtNRnd5TnFoTSs5WGNVVU4yK1JxdWdtelBwajc2aXZlWWRnUklXV3F1eGVN?=
 =?utf-8?B?U0pRWWd0ZXlralNyRmV5V1NvSjlReDdBUDRvd2pXekw2MU95cUtOK25ZUjBy?=
 =?utf-8?B?MjRMS0QzMS9zU2orV1ZEVG1QeXZrYmc0K1V1bitIV0Jkc0dHcUpPczErTXZu?=
 =?utf-8?B?OEJMNkhNYkc0YlRSUldTcnhXcXBuUFNMNmIrdmdGZjJTZDhlcmY0ZUZ6RFNa?=
 =?utf-8?B?WSt2YXAwRVA1Z1ltOXZNZXNuSUNKYXB3VWYwOEF1cU5OSkx2Z2VzWjdwWi9P?=
 =?utf-8?B?bkgwenZRcW5ZVlRRKzZYWUhWMjB4MkpQcEo2amdmQjJJQ1pvbTQxajhId0RX?=
 =?utf-8?B?aEN5NTJCYThudDRRWU1EMFFDaG9DVUpXNmpncE9xUHFVOHVzV0xUclVjZ0t2?=
 =?utf-8?B?MDlTVXJzTVluZkVHcWRCVm8zUG9FdmZiUHpRZUZ0Y3R2MnBsR2lRdUwyN3JF?=
 =?utf-8?B?UkhpaldLQ1ZDeDZWVjZQNlBUL1NneTluUDRrLzFzQTh1bVdIOEZnSnVHSnNU?=
 =?utf-8?B?Y0I1b2ZxV2U3aFRqMGRpbzlXQkw4aGJ4aURXUU13WDQ5cVdVS1VTWVdINEFK?=
 =?utf-8?B?UC9zOWNJa25PbVJyaDVpTUhKRTJ0Zmo1bTEwWUFycTROdVhmSDZaaDhpR2t5?=
 =?utf-8?B?UXpDYytqWUU5a08xRUJnNGRRVHdYcTdtcVBHZHNiQVMyNy9pUys2ck5Bc1lu?=
 =?utf-8?B?OHdVbmJBTEVzUU5oSXI4ZXY2dmE3c2Z1REN1SUJRMDQ3RmJoVE1pR3JBVDNY?=
 =?utf-8?B?RVo0aVVyUFcxdDRrY0V1aWlGWkY3VW5mWERhNEdNMUhjczk4dXdwb2VoQmRT?=
 =?utf-8?B?NEd6SkxPbk9VVTFycFA1SUd5WFFURUtPSWEvQStmR1paa2hYQlJIZGxwUXg2?=
 =?utf-8?B?M3I4aWhBRVIyUkNMSFdZYUFUWjFQK29IZCtBaitBZk9OTXlYbUhweEt3UkZL?=
 =?utf-8?B?VC9pN2VzaldrUVg2TlhwUGdETXdqU1RnSDcyOVROK252aGpyVWVDNWhPdXYy?=
 =?utf-8?B?Z1pkMkdBVTZtNlhXQ2w5MzBLL0hkM1BKbUxsdGpoblB3WGZUckdaMTU4Tkpz?=
 =?utf-8?B?c2J1Y1V1WHp1NWZuT1FPZDRGUklMaXMvYzJZOXJNNjFyamsxZWhkaGl1R2xs?=
 =?utf-8?B?WWJGdkJGc0VhK1pYVWJBUFBMY2ROUFk4dzlTZDZUUHhDblRsMlFDN1hqeDNH?=
 =?utf-8?B?alE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6640.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abd40f6-4f4e-4c2e-917e-08dc2dc94240
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2024 01:56:00.2719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PJrE+Op/HyOL9F1NUq31o2pKXDwYGZ78/AirhvlnflzZ2UY37cSWVNRgXknOv+/D3q6wydPRFjE4Th9XJSyTqKf+qEXiEXUAKI3SzcPMXn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6893
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
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, "zev@bewilderbeest.net" <zev@bewilderbeest.net>, Ryan Chen <ryan_chen@aspeedtech.com>, Vignesh Raghavendra <vigneshr@ti.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Richard Weinberger <richard@nod.at>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>, Patrick Rudolph <patrick.rudolph@9elements.com>, Manojkiran Eda <manojkiran.eda@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiANCj4gT24gV2VkLCBGZWIgMTQsIDIwMjQgYXQgMTE6MzQ6MzFBTSArMDAwMCwgQ2hpYVdlaSBX
YW5nIHdyb3RlOg0KPiA+IFdlIGFwcHJlY2lhdGUgdGhhdCB5b3UgYXJlIHdpbGxpbmcgdG8gaGVs
cCBvbiB0aGUgb3BlbiBzb3VyY2UgY29udHJpYnV0aW9uLg0KPiA+IEhvd2V2ZXIsIHBsZWFzZSBj
by13b3JrIHdpdGggQXNwZWVkIGJlZm9yZSBzdWJtaXR0aW5nIGRyaXZlcnMgb2YgQXNwZWVkDQo+
IEhXLg0KPiA+IE90aGVyd2lzZSwgYSBtaXNsZWFkaW5nIGRyaXZlciBvbiB0aGUgY29tbXVuaXR5
IGFyZSBnb2luZyB0byBicmluZyB0b25zIG9mDQo+IGN1c3RvbWVyIGlzc3VlcyB0byBBc3BlZWQu
DQo+IA0KPiBJdCBtYXkgbm90IGFwcGx5IGluIHRoaXMgcGFydGljdWxhciBjYXNlIGFzIEFzcGVl
ZCBkaWQgd3JpdGUgdGhlIG9yaWdpbmFsIGRyaXZlcg0KPiBhbmQgaXQgaXMgcG9saXRlIHRvIHdv
cmsgd2l0aCBwcmV2aW91cyBhdXRob3JzIHdoZW4gcmVzcGlubmluZyBhIHBhdGNoc2V0LCBidXQg
aW4NCj4gZ2VuZXJhbCB0aGVyZSBpcyBubyBuZWVkIHRvIHdvcmsgd2l0aCBhIGhhcmR3YXJlIHZl
bmRvciBiZWZvcmUgd3JpdGluZyBkcml2ZXJzDQo+IGZvciB0aGVpciBoYXJkd2FyZS4NCj4gDQo+
IEJsb2NraW5nIGEgZHJpdmVyIGJlY2F1c2UgdGhhdCBjb21wYW55IG1pZ2h0IHJlY2VpdmUgbW9y
ZSBzdXBwb3J0IHJlcXVlc3RzDQo+IGlzIG5vdCB0aGUga2VybmVsJ3MgcHJvYmxlbS4NCg0KSSBh
Z3JlZSB3aXRoIHRoYXQgYW5kIEFzcGVlZCB3aWxsIG5vdCByZWZ1c2UgdG8gc3VwcG9ydC4NCg0K
SG93ZXZlciwgaW4gdGhpcyBjYXNlLCB0aGUgYXV0aG9ycywgSUJNLCBhbmQgQXNwZWVkIGFscmVh
ZHkgaGF2ZSBkaXNjdXNzaW9uIChhdCBsZWFzdCA0IHRpbWVzKSBiZWZvcmUgYW5kIGZvcmVzZWUg
Imlzc3VlcyIgb24gcHJhY3RpY2FsIGVTUEkgU0FGUyB1c2UuDQpJZiB0aGVyZSBpcyBhbHJlYWR5
IGEga25vd24gaXNzdWUgb2YgdGhlIGRyaXZlciwgd2h5IGlnbm9yaW5nIHRoZSBwcmV2aW91cyBk
aXNjdXNzaW9uIGFuZCBwdXNoIGl0Pw0KQSBjb21wcm9taXNlIGlzIHRvIGFzayBmb3IgZHJpdmVy
IHJlbmFtaW5nIHRvIGVzcGktbWFmcyB0byBhdm9pZCBjb25mdXNpb24uDQpPdGhlcndpc2Ugd2Ug
bmVlZCB0byBleHBsYWluLCBhZ2Fpbiwgd2h5IHRoZSBkcml2ZXIgZG9lcyBub3QgZnVsZmlsbCB0
aGUgU0FGUyBleHBlY3RhdGlvbi4NCg0KUmVnYXJkcywNCkNoaWF3ZWkNCg0K
