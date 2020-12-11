Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 846AB2D7469
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 12:01:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Csnsr2tS2zDqw6
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 22:01:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.128;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320128.outbound.protection.outlook.com [40.107.132.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Csnrp3n7VzDq83;
 Fri, 11 Dec 2020 22:00:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bP1JlbArtkkU5NLjLfI53jSdbmVBTijtPwxBHtJas5+X4zz4yg9DeBO1QlfIvo6bdFVTYOaLcHDAHZiIlfs+Ui90GkztjfAT9YBALV3gnFd9tq0paqXnLah1xzAWvL4QK/NDBAKYc7Vvb4Lt4cumQtCdAHI626UKUfnn0Ogi0GOQMuYGFuDiLrlmm44AlUkXD69Yd9XkQ/Is14JDj0EHtSn7+N5vH8fo2G1RSt40k3XDcAEOwePqjcf+NSElwBRV+yJI4tdRpvyZUPZSeILAUZKwWF38nubrS6MkzdALiZRtFvTl37AmaZ6IOsqnZ+BEwQ+PHhLgYseJpmCzV8vXHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THlelBhT3hH8Flr6mh54KQAGrwhizbWxJo/7OHOxm9I=;
 b=Uk0RRHYBgmYI9bLr2pZ0+iyGGNM0HV5CupOGGKYawg+yJqUAB34UMdIik3m0sMCcG9fvXVYt5wsY3t0Hy7KdvuwWR1rmmtm6+aCtnv/W5xyb4FTSKR7SFbhFz+8u8Nj0MlqUprQh45riCUtMGpLTUg7bxA2fRncAxGVnwBMTTQ0nWWTcTxV2JFE9Hr5IRYNXJVwYFByb6Uu1tATKyF2VUh8+jqWnr67LttBLXQ1MKabYoqvLNXhV/Aq38kj6gY0VXHXmMf1yhnn0dAzmTIl4X+w9xX48F6h69ROfn38j6KmAv0fQkSxUz+eK73Ehc/Hb8ovzgWF1zy6se/WBvLlc8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from PU1PR06MB2167.apcprd06.prod.outlook.com (2603:1096:803:39::19)
 by PSAPR06MB4072.apcprd06.prod.outlook.com (2603:1096:301:31::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 11:00:49 +0000
Received: from PU1PR06MB2167.apcprd06.prod.outlook.com
 ([fe80::f1f9:3e07:1f9f:9d31]) by PU1PR06MB2167.apcprd06.prod.outlook.com
 ([fe80::f1f9:3e07:1f9f:9d31%5]) with mapi id 15.20.3632.027; Fri, 11 Dec 2020
 11:00:48 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] driver: aspeed: g6: Fix PWMG0 pinctrl setting
Thread-Topic: [PATCH] driver: aspeed: g6: Fix PWMG0 pinctrl setting
Thread-Index: AQHWz2wy281n4pCZxkmLwBG4hQfTFKnxuWSAgACHmQA=
Date: Fri, 11 Dec 2020 11:00:48 +0000
Message-ID: <D9745FBC-BEA7-421E-B56C-21EA9AAE094E@aspeedtech.com>
References: <20201211031741.23711-1-billy_tsai@aspeedtech.com>
 <CACPK8XdDn7GfGKAwZnoZrFc5wZW4p=xMuLmCcHvEyyNJZ8rGvw@mail.gmail.com>
In-Reply-To: <CACPK8XdDn7GfGKAwZnoZrFc5wZW4p=xMuLmCcHvEyyNJZ8rGvw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4fbd20f-4565-478f-9a4c-08d89dc4049f
x-ms-traffictypediagnostic: PSAPR06MB4072:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PSAPR06MB4072080AA695C3B4628B97F68BCA0@PSAPR06MB4072.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kt1Adk9tHbqmir61ysM8jzMzN+PAcgtkOu/yRvgK/C9EUm6A68GS1kDKi2NIxowh2Wb1tlb4Pj2/CSRW1c/f9GCDgBrOMSa7J+kQQKKDDLVMgJJTO5IeOyXCHJBA0GWX+NtPIQ91p3yaxK4D/YJf0BzKgO4EVhcrgxcSrpt6giGyBxbcpssv0E7yuYbQuxpUbK+leatMYGEkBpLJoLPM8Z4SdD9A6A8vE4snuEB4TLp4kqmpsnme1XLpknx6XikX2+c0ovQEn/e3So0Vc8k08BzpsKCLuiiPNsXZLSDgprgh0JaZnbTtnqwkjPx4Q34XLH85KXuw2Q90Lbsd39DHyMGUwpxmrSFk+i5HAIYgvPoUhLwIVlpj+J4dQUGKnnxB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PU1PR06MB2167.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(396003)(376002)(346002)(366004)(136003)(26005)(478600001)(76116006)(316002)(86362001)(91956017)(6512007)(6486002)(66556008)(83380400001)(8936002)(8676002)(2906002)(54906003)(66476007)(66946007)(66446008)(33656002)(36756003)(55236004)(186003)(107886003)(71200400001)(64756008)(6916009)(5660300002)(2616005)(6506007)(4326008)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y0w0ZnZ0aXZnMWRzeXZZSUJ0VkRYRkNpTml2aTdhTEk2QU1WbklOWnFXVmxy?=
 =?utf-8?B?VEhxZ084NXcyRUZabVdNV3RhVHRrZGpUdld2dElVSks3bDluVDRJY3NoRkxt?=
 =?utf-8?B?UkxXK3pQZG5UbGp3bGFSRExvb2ZLM0RjUS9xUzFaVGwzU2JhZmtYNysvK21D?=
 =?utf-8?B?QjZPS0ZScDdxSTFodkdSVDVDSVFERHppUDJ4Wk9ZbjYzMEUvQTFQWW9yTnRP?=
 =?utf-8?B?Sjd5ajlRWjlHVnBkYW5WT1R3VUEyQncwZGpHbWVPZ1g4TmZjSzJicksxY0Qw?=
 =?utf-8?B?R2F0QmVRdGp1dGhKS3UxeS95cEM5V3h5ZkdsaW9GeW9HTnQvRVhqb3JYQlFL?=
 =?utf-8?B?MDhCM281UlRQMHc5MUJjNEhqY0d6LzlIWHdKcks0VmhSM2pTTmUxeHgzT0dL?=
 =?utf-8?B?K1pXblIxR3Y0Nkw4WGxsQzNCc0szeUJXNjg5cGU5TFE3K25qQ0ZXamRmcGRV?=
 =?utf-8?B?Zk1oNlpqcHNoVkJwYXdUTGNmUEt4TTA0QmtYQ0c2Z2R6dzA0R3hLWHNUQ2FC?=
 =?utf-8?B?VkVjRmRTbTY2Z0FiUS9GYkxXM3VIN0Y3ZVhvUnpTUFkzNEJ6K1cyOW8wVzJ6?=
 =?utf-8?B?aThUV3pqcEVWUlVuNWNDWVNQNUN5OSs3UlpUMUw3aGM1VUQrcTBoNktJb3JN?=
 =?utf-8?B?UHFXTlFHUnZjNiszZmo2QmJIcXkyMU1QaDl6K1EzWU9JNVhNNmMzU09YeElN?=
 =?utf-8?B?VDN3L1hPS216enlESEhvUVh5dGNaMk1yRGpYOTRtdEo4aHk3clRLRUNHYkpt?=
 =?utf-8?B?RmJGT1djYUFCSVNab2l0T0dMTXppUHBCYzFEaCtOek03M1EyQitnanNUa2VY?=
 =?utf-8?B?RjhsOVZFQWhLUXpyYVFjQmVPcmhYemtwSHpPdWo3TFJpZzlHcHp2WlMzaGtT?=
 =?utf-8?B?emIyb0RxNHhvTVJNUDFQdHVBSFRqUWdhTGg4NFBhc2FSK0JCYWFkellnMFUv?=
 =?utf-8?B?aWJkb0t6ZjlQMG9HSmlRdkw0bUE0bnBUYTdqWmNQbUZBdW42ZE1qMmZIMkU3?=
 =?utf-8?B?S3lqZjYwMWFiTUlwWlJFKzBIT0Q3allZQjFkL1FuaXlhWTdVZG5YNGZ5OENm?=
 =?utf-8?B?SUwyMXVkekN3UVNQbVArNE5FSGNML3pqQmd3YU05RDh3dkl5ZXNjN3pZNnV0?=
 =?utf-8?B?Ty9icnB6NEJ6YUdrMW1NZkFoM3I5MDBWMzNhNzIrWDMyYnJyREp4R0JDTHVV?=
 =?utf-8?B?YXdjNnBmYWNtNURWVjZxdlZ3R09XNFdrRE83eDhxMmJoYTdZa3hWZFcrdTNN?=
 =?utf-8?B?MnRwb2ZwRUdNZjBGMlJTYWNpQ3JNajVHT2RHN1VhOW5YWGJPK3RVd1prUkR1?=
 =?utf-8?Q?sj9OSKHbo0wDI2sOU6OxgV/v5guUbchgBd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1A2014CC522844E85AC11528F88D24A@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU1PR06MB2167.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4fbd20f-4565-478f-9a4c-08d89dc4049f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 11:00:48.8525 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kB1x0gl4p2UJuLGL/Bhallo56uvMPlfs9BXh/ZjyVlWA7Ucv1iQej1J5TxowEIDxWdSktsnq1/vj8o7kXI91rQ6u68IOgxpNG5HvRs04130=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4072
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSm9lbCwNCg0K77u/T24gMjAyMC8xMi8xMSwgNjo1NSBQTSwgSm9lbCBTdGFubGV5IHdyb3Rl
Og0KDQogICAgT24gRnJpLCAxMSBEZWMgMjAyMCBhdCAwMzoxOCwgQmlsbHkgVHNhaSA8YmlsbHlf
dHNhaUBhc3BlZWR0ZWNoLmNvbT4gd3JvdGU6DQogICAgPg0KICAgID4gVGhlIFNDVSBvZmZzZXQg
Zm9yIHNpZ25hbCBQV004IGluIGdyb3VwIFBXTThHMCBpcyB3cm9uZywgZml4IGl0IGZyb20NCiAg
ICA+IFNDVTQxNCB0byBTQ1U0QjQuDQogICAgPiBCZXNpZGVzIHRoYXQsIFdoZW4gUFdNOH4xNSBv
ZiBQV01HMCBzZXQgaXQgbmVlZHMgdG8gY2xlYXIgU0NVNDE0IGJpdHMgYXQNCiAgICA+IHRoZSBz
YW1lIHRpbWUuDQogICAgPg0KICAgID4gRml4ZXM6IDJlZGExY2RlYzQ5ZiAoInBpbmN0cmw6IGFz
cGVlZDogQWRkIEFTVDI2MDAgcGlubXV4IHN1cHBvcnQiKQ0KICAgID4NCiAgICA+IFNpZ25lZC1v
ZmYtYnk6IEJpbGx5IFRzYWkgPGJpbGx5X3RzYWlAYXNwZWVkdGVjaC5jb20+DQogICAgPiAtLS0N
CiAgICA+ICBkcml2ZXJzL3BpbmN0cmwvYXNwZWVkL3BpbmN0cmwtYXNwZWVkLWc2LmMgfCAyNiAr
KysrKysrKysrKysrKy0tLS0tLS0tDQogICAgPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKyksIDkgZGVsZXRpb25zKC0pDQogICAgPg0KICAgID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cGluY3RybC9hc3BlZWQvcGluY3RybC1hc3BlZWQtZzYuYyBiL2RyaXZlcnMvcGluY3RybC9hc3Bl
ZWQvcGluY3RybC1hc3BlZWQtZzYuYw0KICAgID4gaW5kZXggMzQ4MDNhNmM3NjY0Li42ZTYxZjA0
NTkzNmYgMTAwNjQ0DQogICAgPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvYXNwZWVkL3BpbmN0cmwt
YXNwZWVkLWc2LmMNCiAgICA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9hc3BlZWQvcGluY3RybC1h
c3BlZWQtZzYuYw0KICAgID4gQEAgLTM0Niw1MCArMzQ2LDU4IEBAIEZVTkNfR1JPVVBfREVDTChS
R01JSTQsIEYyNCwgRTIzLCBFMjQsIEUyNSwgRDI2LCBEMjQsIEMyNSwgQzI2LCBDMjQsIEIyNiwg
QjI1LA0KICAgID4gIEZVTkNfR1JPVVBfREVDTChSTUlJNCwgRjI0LCBFMjMsIEUyNCwgRTI1LCBD
MjUsIEMyNCwgQjI2LCBCMjUsIEIyNCk7DQogICAgPg0KICAgID4gICNkZWZpbmUgRDIyIDQwDQog
ICAgPiAtU0lHX0VYUFJfTElTVF9ERUNMX1NFU0coRDIyLCBTRDFDTEssIFNEMSwgU0lHX0RFU0Nf
U0VUKFNDVTQxNCwgOCkpOw0KICAgID4gLVNJR19FWFBSX0xJU1RfREVDTF9TRU1HKEQyMiwgUFdN
OCwgUFdNOEcwLCBQV004LCBTSUdfREVTQ19TRVQoU0NVNDE0LCA4KSk7DQogICAgPiArU0lHX0VY
UFJfTElTVF9ERUNMX1NFU0coRDIyLCBTRDFDTEssIFNEMSwgU0lHX0RFU0NfU0VUKFNDVTQxNCwg
OCkpDQogICAgDQogICAgSXMgdGhpcyBtaXNzaW5nIGEgc2VtaWNvbG9uPw0KDQpZZXMsIHRoYW5r
cyBmb3IgeW91ciBjaGVjay4gSSB3aWxsIHNlbmQgdjIgdG8gZml4IGl0Lg0KICAgIA0KICAgID4g
K1NJR19FWFBSX0xJU1RfREVDTF9TRU1HKEQyMiwgUFdNOCwgUFdNOEcwLCBQV004LCBTSUdfREVT
Q19TRVQoU0NVNEI0LCA4KSwNCiAgICA+ICsgICAgICAgICAgICAgICAgICAgICAgIFNJR19ERVND
X0NMRUFSKFNDVTQxNCwgOCkpOw0KICAgIA0KDQo=
