Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CAA3FDD3B
	for <lists+openbmc@lfdr.de>; Wed,  1 Sep 2021 15:41:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H04wX2Zlcz2yJN
	for <lists+openbmc@lfdr.de>; Wed,  1 Sep 2021 23:41:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=gYWAmoWm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.98;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=gYWAmoWm; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310098.outbound.protection.outlook.com [40.107.131.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H04vr4Dwtz2xYd;
 Wed,  1 Sep 2021 23:41:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLPN6oR1H5Zfnwltc9yD2qDw0/K3HuWDrtY0DLobyfHWf7s2ZuKJiiT1LGBbR6LpLZbFhbEJYhvU8ZGDbu2rUQNw3wkfJ4saiNejcn5EA2yuCEyzlOySxs63qTAqIUu1vL5+oa4exQgrQI5ZI2G1couKT2gZtFUbB3IvF6oeLTIkthu7MireD4Ku7M+XcZ6OXiUVdDOmOTuAUTfB2Mj7K6LNpTzOVXcffZd2zkDuCNvunjITV+8Ic1VAT870j5oMoVKGEINznTYyDqIAfzN84Gs8f/1KoG7udrMg/fQGbkh7yBBCE82Cq0Ya0C6o6OcSdwld82Y01LKWn6f6aGGBCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=LADTuqUjEDnyXLKOcF2FHyGbCx8qq9H2OESI05w1+pg=;
 b=LiPo1SDmIKndTuJUsygsqew2pzNsyi1+7fJPrIaihV6AFnZmHN6i1OqdGXgOeZb548DAPleiT3kvqHhnsaA0vwgOajty+a4aB+hNh7IvHBcxtDaMmuz1b395BKj+MiJjyactrv0xCjQ3ke8d8G/qMyGizpLmlNmAPuwM64ViPWnRUY0S7linWF19tOmSHQef/g2mFTOpKUgCuQph5YSYlp23+RGO7KczShmnYPbJ+ejv53tOw06kVUWmS979dCcGjrIouxE9MH8BIE4IqCQMQZG985T+bW7uaRwc9C578/OBmDRIprmNGc0CboktFZZlIpbLkSdllOjYrXBIYZXytA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LADTuqUjEDnyXLKOcF2FHyGbCx8qq9H2OESI05w1+pg=;
 b=gYWAmoWmYIdkq+ZpGoFn+KpSBXTP5Jq8VX6kQYpYFhakmJDj6v+Rc/uh2OJhce2gIhd7TmBImQCUZ0WmSa7dwU7X/LjFIWhs/s/vZ3gSOYcyyw1CseNMLGUZgrbuicxQ5HK2+CStHklLa+P/cVSr0DyeclMeq5NKOH6iLSOd5NXGhUUiOhz/vP6ygAM75++HrZRCTe7thFJYeTEVDFsDNXfLIZBm8T2LGOp/86tllKTXlfO+UyboUHI72ryy5LPfP+ZazlngNQtjekcx2/N1XdTYzQ6LVKx/tKQT1TywVBcy7BoMmc92HTgeBteV+tpfeyzbXL8GmlixAdvuOFZqRg==
Received: from TYZPR06MB3981.apcprd06.prod.outlook.com (20.182.87.70) by
 TYZPR06MB3981.apcprd06.prod.outlook.com (20.182.87.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19; Wed, 1 Sep 2021 13:40:44 +0000
Received: from TYZPR06MB3981.apcprd06.prod.outlook.com
 (fe80::c9b0:c183:7e11:7097%9) by TYZPR06MB3981.apcprd06.prod.outlook.com
 (fe80::c9b0:c183:7e11:7097%9) with TransportReplication id Version 15.20
 (Build 4478.19); Wed, 1 Sep 2021 13:40:38 +0000
Received: from KL1PR0601MB3781.apcprd06.prod.outlook.com
 ([fe80::7c94:f1d7:7cc:5da2]) by KL1PR0601MB3781.apcprd06.prod.outlook.com
 ([fe80::7c94:f1d7:7cc:5da2%3]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 09:43:30 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH 1/2] soc: aspeed: Add LPC UART routing support
Thread-Topic: [PATCH 1/2] soc: aspeed: Add LPC UART routing support
Thread-Index: AQHXnvoLXFz8c4jJtESdHp/5iuf+t6uOyjkAgAAieoA=
Date: Wed, 1 Sep 2021 09:43:30 +0000
Message-ID: <KL1PR0601MB378153208F9557A2B6B78B2491CD9@KL1PR0601MB3781.apcprd06.prod.outlook.com>
References: <20210901062216.32675-1-chiawei_wang@aspeedtech.com>
 <20210901062216.32675-2-chiawei_wang@aspeedtech.com>
 <CACPK8XerokBaLMZ3J=9rcRLD5eFqmNOSsXYGgf_Ze01=X6NwPA@mail.gmail.com>
In-Reply-To: <CACPK8XerokBaLMZ3J=9rcRLD5eFqmNOSsXYGgf_Ze01=X6NwPA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB3981:
x-ms-office365-filtering-correlation-id: 74e4cefd-4c68-4e46-6a70-08d96d2cf4ff
x-microsoft-antispam-prvs: <TYZPR06MB39815988F7D6E3BA67C5668591CD9@TYZPR06MB3981.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YUEb+X0gX3U7JykQlBuXBkDiG3QNx0uYkXwEWpnCxBTGU/Sh1YMUQr15BZfI2fIy4c41MYpZ2FZQhvT/0Wf9N7rZ1pMjlEqa1PaNOGghS+zkkp7/C7m8clBl7+Bu8ai+Mro2K+yD0arGZS8TK0NHvpzKQv77vXIP31NqBwJkzJh3JBRG/PgQyS/B1EvrRYcaSwvI1spFw/5O4DxUJmul5LmNt47VoDbWjJWoZSar4GGORv3vSjDWUL3QqC+Feocw24JTZ2Kts8761BCpxsZ+9ua/BIAz+SACjOMAug6wyjg3Bo3dHrrQ+PUF9N9z+0Y35SI21UtCkfBttFyQunDarklWFCzbALAx7Iq8U2okv2+Pk9MooGSWD6/VuGCu6FGbsDe+Qm1Cyke4jx/8VCDS4JKBJhZ6mJot5iCPtEiggS9lEfouX4tPTd4j5ctfBNMtRr0temTKbJSr2YEIV+gvpGf6o+LibFxnBn8OlvkvOkrJKTjPgLOdsJuhzYPeIgIzq/ASKkCypF09IY5+679WZ9IF4pqgXercTDK+gYZjZzLdZ4mBRmw6fWLMyWMj4RSn/qjYkwBAKWErFRM57E7xmIzVsA3SXX+04PtRY6xGHBUwHEI/HGqc9GDp0EqTR9rxjzD5niGDohNdhKaSR6nwsRsMsAF9BX57oxo6GCuJMFQi4/PjAR9z81Kyuz1b/P8Gsdo2qfAXFVZtL/YHaB4QQg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB3981.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(346002)(376002)(136003)(39850400004)(6916009)(55016002)(66556008)(64756008)(66446008)(2906002)(66476007)(7696005)(38100700002)(26005)(9686003)(76116006)(38070700005)(66946007)(86362001)(54906003)(6506007)(122000001)(316002)(71200400001)(8676002)(8936002)(4326008)(52536014)(5660300002)(83380400001)(33656002)(186003)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEVKemdyUGtrRkJ0NzhvejdIVHQ3RjFiaHhqQ3NNRkZib205RjgwUEtSN2pq?=
 =?utf-8?B?ZzNwVjVyRlVKVUxHdytid1pxamJ5eU8xd2c2dTQxZFF5NnNMQWJDU0pZdFBP?=
 =?utf-8?B?bCt0QTJPMGRSZ25rQ2pZVHRaRU1zRFVuVC8yYzBiYXhkeFJxV3lWdVRuTm43?=
 =?utf-8?B?aXVnMnJVVU1paXJ0eWJFZWZMZWRBdXhwekloTGROM2xEdk1YOFczeUsreWVX?=
 =?utf-8?B?ZFFGTHlGYnRtL2NYOFZIQVUxSWM3SXJxb2tIWlNmai8rYXdMNGp5d1Rlb0Fp?=
 =?utf-8?B?TEhsM1U2VC9PTGpCdlR6K1JhM3o0UFRBY00wdWt3NzF4dm8zekh5SlVEWUdR?=
 =?utf-8?B?dEZpOWNHVGExbTM3OVlqL0l6YThDN1JQcTdDTkNwRjdqQjlVMGRZUHJEWXZ3?=
 =?utf-8?B?djdodXdzN29ILzJUNG5VTUlqMmM3L3dieFovbDZMY05Nd3dvQUNnOHJ5MFZZ?=
 =?utf-8?B?RzJMTzkyUWVXQVVrd0ZxdlJFV2JhUWJDVitzLysvTWkrRWxXN0FsOWMxZEU2?=
 =?utf-8?B?TTNnRzNxcHFML3NwVnRqVHpILzY3SERCRjR2bWM0Wk94QVVqWHBIeFhNazhy?=
 =?utf-8?B?T2wxemR5bmNXL1ZMQkJzbC9iQkN4dng2OUNUYWJIdWcrWWxVbmxQTzV4OHRt?=
 =?utf-8?B?MEIzMUs2SUFkR052Q0tCRGo1Z21ZU2NaNVFBSk9MU09NZ1gzOHNFQjZKMUlT?=
 =?utf-8?B?Q3VuWk9jVDdsc2x6VjgrZEdSNVBNL0JiQmcxTEEySzVPalo5Tlp3SnJtTGJR?=
 =?utf-8?B?TURPQ0UwOWJQUDAzNTFHMVRscHVqeXhrRW0xTWlsVlVmckQ0UUpsVmNjbWFC?=
 =?utf-8?B?MHg5OCtsR09hWDZ5d2RxRm1uNlRDQS8wRmRnc0RMVDVXQlpKWmwrMHdObXRX?=
 =?utf-8?B?NkJEbG00ZVpLMWZORStTMzBuOXNPWDRvOFhBWkhialA5Vk14a1lUTXBydFNv?=
 =?utf-8?B?R1czaFpQbE83VGNrTUEvdklxY2ZNdFVpYW5NK3p0aHlyK2ZBVVo2ZnlvRjB1?=
 =?utf-8?B?SkNnZGdGM3JLVU9pNUt0bEVQTmpqMk5UeHZDRE9xMlF0NmdVRE9uamdrUk85?=
 =?utf-8?B?SW5NdjNpWHZkdEN3Umh4Wk43ZU0rQlRoZzVMNjJ3a3ZjeXMxdkgxYVNFaTFt?=
 =?utf-8?B?QmJjdzIyeVFwNDQ2Ly9ZUkdaRGZwOTFpdDQwU3F3TXBXQnErRTF0citnbExU?=
 =?utf-8?B?WUY4RFJUS0dtQnd5ZFpOMEk3WlpYajRKWmwxdlNmRG9NWHg3Z2Y5QjFtckFC?=
 =?utf-8?B?aWVXQUVnWkpkRWpQK2RoMmpQazJOYW4yNXBJUlRYQ1IzSXNUd1JvSmFUSjZV?=
 =?utf-8?B?cGF3NlFPdVV2WHJOeFFDeHZaUGpCenpHQkdQcCtONkx1djJKa1VqTm1zQ2VC?=
 =?utf-8?B?UWNWdHFLdm43NGVPbjU3a1dOOG9LV2wvWDdRRmZ1RDZjWFdVYkN3a1RiV2pu?=
 =?utf-8?B?UUxmZEdqbE9GSWc0NTZHaFFBL21EL0ZBeGkyZFpPQmNuNEtyUlpjbnZlRDVo?=
 =?utf-8?B?UTFNYnV6OW14ZlN6RWJ5dlFSeEx2ZU1xZjliTXNkeWx3UWtPdG1KcmJIVmpS?=
 =?utf-8?B?M0gyQlVlNjQvb25ybXpjZjBGZTBTa21VZllWRjRONWFyYUFIMDN3aEJ3bU1H?=
 =?utf-8?B?cGxKUVNkbE02dlhXWFJFRzhKcnRZcVNna3R4QzRyVm05eDBHY0JRZFVKU3Z5?=
 =?utf-8?B?aEtiU2VJdFVoNWF1cDRwYnpzbEVpcW5nbGZvWUdFd09zN2M4aFJwRG5iMmxI?=
 =?utf-8?Q?KnrexyW+29n7Wx+tnh7YrbhH6pUjl+Ged+BjRRp?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB3781.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e4cefd-4c68-4e46-6a70-08d96d2cf4ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 09:43:30.3195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EVPHS0HZF0eEW7S8rLhnXKU3hRzayRgY/8OiSE9JRjcD4NgHpsoizJYVDy7AbuEl6FY4gxnJbsgcmUl10jbAXDXJZs1XIRK8azJum7kogPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB3981
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Oskar Senft <osk@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb2VsIFN0YW5sZXkgPGpvZWxA
am1zLmlkLmF1Pg0KPiBTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAxLCAyMDIxIDM6MzcgUE0N
Cj4gDQo+IE9uIFdlZCwgMSBTZXB0IDIwMjEgYXQgMDY6MjIsIENoaWEtV2VpIFdhbmcNCj4gPGNo
aWF3ZWlfd2FuZ0Bhc3BlZWR0ZWNoLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBBZGQgZHJpdmVyIHN1
cHBvcnQgZm9yIHRoZSBMUEMgVUFSVCByb3V0aW5nIGNvbnRyb2wuIFVzZXJzIGNhbiBwZXJmb3Jt
DQo+IA0KPiBBcyB3ZSBkaXNjdXNzZWQsIHJlbW92ZSB0aGUgIkxQQyIgcGFydCBvZiB0aGUgbmFt
ZS4NCj4gDQo+ID4gcnVudGltZSBjb25maWd1cmF0aW9uIG9mIHRoZSBSWCBtdXhlcyBhbW9uZyB0
aGUgVUFSVCBjb250cm9sbGVycyBhbmQNCj4gPiB0aGUgVUFSVCBUWEQvUlhEIElPIHBpbnMuIFRo
aXMgaXMgYWNoaWV2ZWQgdGhyb3VnaCB0aGUgZXhwb3J0ZWQgc3lzZnMNCj4gaW50ZXJmYWNlLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hpYS1XZWkgV2FuZyA8Y2hpYXdlaV93YW5nQGFzcGVl
ZHRlY2guY29tPg0KPiANCj4gSXQgd291bGQgYmUgZ29vZCB0byBoYXZlIHNvbWUgZXhhbXBsZSBv
ZiBob3cgdG8gdXNlIGl0LCBhbmQgdGhlIG91dHB1dCBmcm9tDQo+IHN5c2ZzLg0KPiANCj4gWW91
IHNob3VsZCBhbHNvIGFkZCBhIHBhdGNoIHRvIGRvY3VtZW50IHRoZSBzeXNmcyBmaWxlcyBpbiBE
b2N1bWVudGF0aW9uL0FCSS4NCj4gDQoNCldpbGwgYWRkIGEgbmV3IGNvbW1pdCBmb3IgdGhlIHN5
c2ZzIGRlc2NyaXB0aW9uLg0KDQo+ID4gKysrIGIvZHJpdmVycy9zb2MvYXNwZWVkL2FzcGVlZC1s
cGMtdWFydC1yb3V0aW5nLmMNCj4gPiBAQCAtMCwwICsxLDYyMSBAQA0KPiA+ICsvLyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsNCj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0IChj
KSAyMDE4IEdvb2dsZSBMTEMNCj4gPiArICogQ29weXJpZ2h0IChjKSAyMDIxIEFzcGVlZCBUZWNo
bm9sb2d5IEluYy4NCj4gPiArICovDQo+ID4gKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCj4g
PiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvb2ZfZGV2
aWNlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9vZl9hZGRyZXNzLmg+DQo+IA0KPiBZb3UgY2Fu
IGRyb3AgdGhpcyBvbmUuDQoNClJldmlzZWQgYXMgc3VnZ2VzdGVkLg0KDQo+IA0KPiA+ICsjaW5j
bHVkZSA8bGludXgvb2ZfcGxhdGZvcm0uaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L21mZC9zeXNj
b24uaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPg0KPiA+ICsjaW5jbHVkZSA8bGlu
dXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ID4gKw0KPiA+ICsvKiByZWdpc3RlciBvZmZzZXRzICov
DQo+ID4gKyNkZWZpbmUgSElDUjkgIDB4OTgNCj4gPiArI2RlZmluZSBISUNSQSAgMHg5Yw0KPiA+
ICsNCj4gPiArLyogYXR0cmlidXRlcyBvcHRpb25zICovDQo+ID4gKyNkZWZpbmUgVUFSVF9ST1VU
SU5HX0lPMSAgICAgICAiaW8xIg0KPiA+ICsjZGVmaW5lIFVBUlRfUk9VVElOR19JTzIgICAgICAg
ImlvMiINCj4gPiArI2RlZmluZSBVQVJUX1JPVVRJTkdfSU8zICAgICAgICJpbzMiDQo+ID4gKyNk
ZWZpbmUgVUFSVF9ST1VUSU5HX0lPNCAgICAgICAiaW80Ig0KPiA+ICsjZGVmaW5lIFVBUlRfUk9V
VElOR19JTzUgICAgICAgImlvNSINCj4gPiArI2RlZmluZSBVQVJUX1JPVVRJTkdfSU82ICAgICAg
ICJpbzYiDQo+ID4gKyNkZWZpbmUgVUFSVF9ST1VUSU5HX0lPMTAgICAgICAiaW8xMCINCj4gPiAr
I2RlZmluZSBVQVJUX1JPVVRJTkdfVUFSVDEgICAgICJ1YXJ0MSINCj4gPiArI2RlZmluZSBVQVJU
X1JPVVRJTkdfVUFSVDIgICAgICJ1YXJ0MiINCj4gPiArI2RlZmluZSBVQVJUX1JPVVRJTkdfVUFS
VDMgICAgICJ1YXJ0MyINCj4gPiArI2RlZmluZSBVQVJUX1JPVVRJTkdfVUFSVDQgICAgICJ1YXJ0
NCINCj4gPiArI2RlZmluZSBVQVJUX1JPVVRJTkdfVUFSVDUgICAgICJ1YXJ0NSINCj4gPiArI2Rl
ZmluZSBVQVJUX1JPVVRJTkdfVUFSVDYgICAgICJ1YXJ0NiINCj4gPiArI2RlZmluZSBVQVJUX1JP
VVRJTkdfVUFSVDEwICAgICJ1YXJ0MTAiDQo+ID4gKyNkZWZpbmUgVUFSVF9ST1VUSU5HX1JFUyAg
ICAgICAicmVzZXJ2ZWQiDQo+ID4gKw0KPiA+ICtzdHJ1Y3QgYXNwZWVkX3VhcnRfcm91dGluZyB7
DQo+ID4gKyAgICAgICBzdHJ1Y3QgcmVnbWFwICptYXA7DQo+ID4gKyAgICAgICBzcGlubG9ja190
IGxvY2s7DQo+ID4gKyAgICAgICBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwIGNvbnN0ICphdHRyX2dy
cDsgfTsNCj4gPiArDQo+ID4gK3N0cnVjdCBhc3BlZWRfdWFydF9yb3V0aW5nX3NlbGVjdG9yIHsN
Cj4gPiArICAgICAgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlIGRldl9hdHRyOw0KPiA+ICsgICAg
ICAgdWludDMyX3QgcmVnOw0KPiA+ICsgICAgICAgdWludDMyX3QgbWFzazsNCj4gPiArICAgICAg
IHVpbnQzMl90IHNoaWZ0Ow0KPiANCj4gVGhlc2UgY2FuIGJlIHU4Lg0KDQpSZXZpc2VkIGFzIHN1
Z2dlc3RlZC4NCg0KPiANCj4gPiArc3RhdGljIHNzaXplX3QgYXNwZWVkX3VhcnRfcm91dGluZ19z
aG93KHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUNCj4gKmF0dHIsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNoYXIgKmJ1Zikgew0KPiA+ICsgICAg
ICAgc3RydWN0IGFzcGVlZF91YXJ0X3JvdXRpbmcgKnVhcnRfcm91dGluZyA9IGRldl9nZXRfZHJ2
ZGF0YShkZXYpOw0KPiA+ICsgICAgICAgc3RydWN0IGFzcGVlZF91YXJ0X3JvdXRpbmdfc2VsZWN0
b3IgKnNlbCA9DQo+IHRvX3JvdXRpbmdfc2VsZWN0b3IoYXR0cik7DQo+ID4gKyAgICAgICBpbnQg
dmFsLCBwb3MsIGxlbjsNCj4gPiArDQo+ID4gKyAgICAgICByZWdtYXBfcmVhZCh1YXJ0X3JvdXRp
bmctPm1hcCwgc2VsLT5yZWcsICZ2YWwpOw0KPiA+ICsgICAgICAgdmFsID0gKHZhbCA+PiBzZWwt
PnNoaWZ0KSAmIHNlbC0+bWFzazsNCj4gPiArDQo+ID4gKyAgICAgICBsZW4gPSAwOw0KPiA+ICsg
ICAgICAgZm9yIChwb3MgPSAwOyBzZWwtPm9wdGlvbnNbcG9zXSAhPSBOVUxMOyArK3Bvcykgew0K
PiA+ICsgICAgICAgICAgICAgICBpZiAocG9zID09IHZhbCkgew0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGxlbiArPSBzbnByaW50ZihidWYgKyBsZW4sIFBBR0VfU0laRSAtIDEgLSBsZW4s
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJbJXNdICIsIHNl
bC0+b3B0aW9uc1twb3NdKTsNCj4gPiArICAgICAgICAgICAgICAgfSBlbHNlIHsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBsZW4gKz0gc25wcmludGYoYnVmICsgbGVuLCBQQUdFX1NJWkUg
LSAxIC0gbGVuLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
JXMgIiwgc2VsLT5vcHRpb25zW3Bvc10pOw0KPiANCj4gVGhlIGtlcm5lbCBwcmVmZXJzIHN5c2Zz
X2VtaXQgYW5kIHN5c2ZzX2VtaXRfYXQgaW5zdGVhZGluZyBvZiB1c2luZyBzbnByaW50Zg0KPiBk
aXJlY3RseS4NCg0KUmV2aXNlZCBhcyBzdWdnZXN0ZWQuDQoNCj4gDQo+ID4gKyAgICAgICAgICAg
ICAgIH0NCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICBpZiAodmFsID49IHBvcykg
ew0KPiA+ICsgICAgICAgICAgICAgICBsZW4gKz0gc25wcmludGYoYnVmICsgbGVuLCBQQUdFX1NJ
WkUgLSAxIC0gbGVuLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIlt1bmtu
b3duKCVkKV0iLCB2YWwpOw0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIGxlbiAr
PSBzbnByaW50ZihidWYgKyBsZW4sIFBBR0VfU0laRSAtIDEgLSBsZW4sICJcbiIpOw0KPiA+ICsN
Cj4gPiArICAgICAgIHJldHVybiBsZW47DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBzc2l6
ZV90IGFzcGVlZF91YXJ0X3JvdXRpbmdfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRldmljZV9hdHRy
aWJ1dGUNCj4gKmF0dHIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBjaGFyICpidWYsIHNpemVfdA0KPiA+ICtjb3VudCkgew0KPiA+ICsgICAgICAg
dW5zaWduZWQgbG9uZyBmbGFnczsNCj4gPiArICAgICAgIHN0cnVjdCBhc3BlZWRfdWFydF9yb3V0
aW5nICp1YXJ0X3JvdXRpbmcgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPiArICAgICAgIHN0
cnVjdCBhc3BlZWRfdWFydF9yb3V0aW5nX3NlbGVjdG9yICpzZWwgPQ0KPiB0b19yb3V0aW5nX3Nl
bGVjdG9yKGF0dHIpOw0KPiA+ICsgICAgICAgaW50IHZhbDsNCj4gPiArDQo+ID4gKyAgICAgICB2
YWwgPSBtYXRjaF9zdHJpbmcoc2VsLT5vcHRpb25zLCAtMSwgYnVmKTsNCj4gPiArICAgICAgIGlm
ICh2YWwgPCAwKSB7DQo+ID4gKyAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiaW52YWxpZCB2
YWx1ZSBcIiVzXCJcbiIsIGJ1Zik7DQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Ow0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZ1
YXJ0X3JvdXRpbmctPmxvY2ssIGZsYWdzKTsNCj4gDQo+IEkgY2FuJ3Qgc2VlIHdoeSB5b3Ugd291
bGQgbmVlZCBhIHNwaW5sb2NrIGhlcmUuIFRoZSByZWdtYXAgaGFzIGl0J3Mgb3duDQo+IGxvY2tp
bmcgc28gaXQgd2lsbCBwcm90ZWN0IGFnYWluc3QgY29uY3VycmVudCB1cGRhdGVzIHRvIHRoZSBy
ZWdpc3RlcnMuDQoNCllvdSBhcmUgcmlnaHQuIExvY2sgaXMgbm90IG5lZWRlZCBoZXJlLiBXaWxs
IHJlbW92ZWQgaXQgYXMgc3VnZ2VzdGVkLg0KDQo+IA0KPiA+ICsNCj4gPiArICAgICAgIHJlZ21h
cF91cGRhdGVfYml0cyh1YXJ0X3JvdXRpbmctPm1hcCwgc2VsLT5yZWcsDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgKHNlbC0+bWFzayA8PCBzZWwtPnNoaWZ0KSwNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAodmFsICYgc2VsLT5tYXNrKSA8PCBzZWwtPnNoaWZ0KTsNCj4gPiArDQo+
ID4gKyAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ1YXJ0X3JvdXRpbmctPmxvY2ssIGZs
YWdzKTsNCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gY291bnQ7DQo+ID4gK30NCj4gPiArDQo+
ID4gK3N0YXRpYyBpbnQgYXNwZWVkX3VhcnRfcm91dGluZ19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KSB7DQo+ID4gKyAgICAgICBpbnQgcmM7DQo+ID4gKyAgICAgICBzdHJ1Y3Qg
ZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ICsgICAgICAgc3RydWN0IGFzcGVlZF91YXJ0
X3JvdXRpbmcgKnVhcnRfcm91dGluZzsNCj4gPiArDQo+ID4gKyAgICAgICB1YXJ0X3JvdXRpbmcg
PSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzaXplb2YoKnVhcnRfcm91dGluZyksDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgR0ZQX0tFUk5FTCk7DQo+IA0KPiBZb3UgY2FuIHJlZm9ybWF0IHRo
aXMgZmlsZSB0byBoYXZlIGxvbmdlciBsaW5lczsgdGhlIGtlcm5lbCBpcyBvayB3aXRoIHVwIHRv
IDEwMA0KPiBjb2x1bXNuIHRoZXNlIGRheXMuDQo+IA0KPiA+ICsgICAgICAgaWYgKCF1YXJ0X3Jv
dXRpbmcpIHsNCj4gPiArICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJjYW5ub3QgYWxsb2Nh
dGUgbWVtb3J5XG4iKTsNCj4gDQo+IEknZCBkcm9wIHRoaXMgZXJyb3IgbWVzc2FnZS4NCg0KUmV2
aXNlZCBhcyBzdWdnZXN0ZWQNCg0KPiANCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9N
RU07DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgdWFydF9yb3V0aW5nLT5tYXAg
PQ0KPiBzeXNjb25fbm9kZV90b19yZWdtYXAoZGV2LT5wYXJlbnQtPm9mX25vZGUpOw0KPiA+ICsg
ICAgICAgaWYgKElTX0VSUih1YXJ0X3JvdXRpbmctPm1hcCkpIHsNCj4gPiArICAgICAgICAgICAg
ICAgZGV2X2VycihkZXYsICJjYW5ub3QgZ2V0IHJlZ21hcFxuIik7DQo+ID4gKyAgICAgICAgICAg
ICAgIHJldHVybiBQVFJfRVJSKHVhcnRfcm91dGluZy0+bWFwKTsNCj4gPiArICAgICAgIH0NCj4g
PiArDQo+ID4gKyAgICAgICB1YXJ0X3JvdXRpbmctPmF0dHJfZ3JwID0gb2ZfZGV2aWNlX2dldF9t
YXRjaF9kYXRhKGRldik7DQo+ID4gKw0KPiA+ICsgICAgICAgc3Bpbl9sb2NrX2luaXQoJnVhcnRf
cm91dGluZy0+bG9jayk7DQo+IA0KPiBJIGRvbid0IHRoaW5rIHlvdSBuZWVkIHRoZSBsb2NrIGF0
IGFsbC4NCg0KU2FtZSBhcyBhYm92ZS4NCg0KVGhhbmtzIGZvciByZXZpZXdpbmcgdGhpcy4NClRo
ZSB2MiBwYXRjaCB3aWxsIGluY2x1ZGUgdGhlIGRyaXZlciByZWZhY3RvcmluZyBhbmQgYWRkaXRp
b25hbCBkb2N1bWVudGF0aW9uLg0KDQpDaGlhd2VpDQo=
