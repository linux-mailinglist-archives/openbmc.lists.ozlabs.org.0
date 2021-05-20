Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 439E038ABC9
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 13:29:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm6vp1s69z3084
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 21:29:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=2q20Be2g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.137;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=2q20Be2g; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310137.outbound.protection.outlook.com [40.107.131.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm6vQ3jc2z2xZS;
 Thu, 20 May 2021 21:29:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+jmUuFPt1KQ3lwwkQnzoHFZpBqplpg3MSKUkJeiknu76LH1VMeM3y0yYROMDmOsTWh92HfL1ebW7Gr+UBWqvKgPVxa0gF5XfC0LCKOtqYW5VQjanHLgO576DLcUzea0A27ZGAtrB7jou/+QLXDHsOF1R160rY2vZY6Xu0b2bYO1UOcTtVamJ0apKKuyCH5W2LQPcuXzjJaaN5I7EhhQFipxQ+RP5bkVlwp+U6FhVbE8CLO5niWcvqW7Z6fxr+Cmo9VlcPc+Uuv80xiYVW6R6OD2wk6k/F1sI3AHgXUyVoZTMBGzEyh8AccTm5UVeV78fiS8V0rk64ZdVsVgoekMrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gs7zI1JsXrqyljc3mFMjF+/D3mgAIJn+TVqdI5LubsU=;
 b=m5RRUSGVx/pK3UNvho3E2IrQyXwGTe8fTMp0AWDwnk0NQm4inSQ6gZZdVk3aTFaHFo49w8CrmjcBCGISrym+zyVFSGjmejifNxSubK4KfTBlS9YltcdX2r5+gAciGgOKCtEhdpC+D8o+lgYzgslUcifnHKu/t/57Poattuu3VUX8DkGcmMXobRWf/+1ot0P+E8fWlTparrcr9b35AWD1aV/H2Wk0ZTu9OvyjsEgiUUDqf6GX995DzOtTsCuQLKgzxA2w2MLOxxRKw3UpvaHjEKUDaoDrcJYiiIenfg7vKm8nh7FHl/RkL8xoZSXRrITPE/XSCaUfwWLYLGRwCUUcjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gs7zI1JsXrqyljc3mFMjF+/D3mgAIJn+TVqdI5LubsU=;
 b=2q20Be2gXHHYTJoBfxaeEbHhGH66Xv/jAi7vCxDnyJMH9ddgdZ6XFHxWO2PovGiynUPYriyB2FO8dcUkjYLtyYJ33rO9gMwNe37jYB4wVgiE3HhEO8GpyiRcfT9VeO70FXBUmwsgjRNUNTrV6w9974M2j0YUJx+H7ZFA8LDd1Tr2eaVvoie4nAEHhQeEqqVYkKgFa3AHQ/TagyK26ykm+NW7OoU9v7S2mYPN2DpEe4hbW42zM2dC9/pFwtbmd3Vg2s4d1MZ4a1nrn7hT/PgGlUV+jdgYWIZiYLt1aFBGQxf+mJMgWOvlYaxqD5QI5jhnqxl54njRJhiyvlYxccSFbw==
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK0PR06MB3124.apcprd06.prod.outlook.com (2603:1096:203:8b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 11:28:59 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::2984:f1bd:e1f9:5ed6]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::2984:f1bd:e1f9:5ed6%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 11:28:58 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, Quan Nguyen <quan@os.amperecomputing.com>
Subject: RE: [PATCH v3 3/7] i2c: aspeed: Fix unhandled Tx done with NAK
Thread-Topic: [PATCH v3 3/7] i2c: aspeed: Fix unhandled Tx done with NAK
Thread-Index: AQHXTIPiaDlIMxFG4EScG2hlz3/zyKrrdFqAgADIwhA=
Date: Thu, 20 May 2021 11:28:58 +0000
Message-ID: <HK0PR06MB3380D7B693922C3D6B3C14F0F22A9@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-4-quan@os.amperecomputing.com>
 <CACPK8XeFsuEXeCvG9DC0z+tiri6ptjOFOXe3x+COEZTVqUbVFg@mail.gmail.com>
In-Reply-To: <CACPK8XeFsuEXeCvG9DC0z+tiri6ptjOFOXe3x+COEZTVqUbVFg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14e8e689-ba9d-4bca-1087-08d91b827608
x-ms-traffictypediagnostic: HK0PR06MB3124:
x-microsoft-antispam-prvs: <HK0PR06MB31242AF71CFB022423C4E75BF22A9@HK0PR06MB3124.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FV1IVRyFZ2jDKwCfATrk1HSRZcvRJkSp45XkhlPITmJfN31iJz+3R2QdkGdJ+VAz3gIBK7kR8+h4ynqeSmPsfXgo4Qqv8QQehPOc2o5JqKqELBA+sfeFOqNO8Oocl0+qnz4ITQ9u2Fv4uTTDGdfEiZxBtkwK6sUtH2TPe5Lkg558JpDuJRDMHUDP/VBoj+kUneHLTgBomo/ej5bzAmpeeZ7bXwBRwVVKUvb3r2IxogyYoT2GJibYucX76bn89PvFp2mwUPDeBWDRkgLvmttb2wIp91/8SrH2/Gx6/uHSNtiKt8t8JeiRkd1IkYK59HbXEaH2kdy+YiKbMfez250wOc/rMP0Q3bFt1wCYblzj7x7a4xLNPFUeMtsmaoVpMztGKMLsBX3pMMIR66wyafOzIl9hN5Qi+pL808opkVQ1TJaf2JTfOAIh9M5lexpGvr22FEOhlmNRaFzSsTIh9b9Lzs2kxK0OnGBc58uNqZ/x1FKYhRZJfb0QJlcI2YRXghB4DL7p5pSRIHipK5RCpG8ZVWTjJtmblybfdaBukidTp0o4K630V/2q7qyezg5H8sH2zMUN8F5Ew0+nWuXIujIxXFSF+SVdnyLvO24pVi59rsc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(346002)(39850400004)(366004)(396003)(8936002)(86362001)(9686003)(2906002)(7416002)(478600001)(55016002)(8676002)(66946007)(83380400001)(76116006)(66446008)(53546011)(64756008)(110136005)(66476007)(55236004)(7696005)(54906003)(26005)(66556008)(52536014)(71200400001)(33656002)(38100700002)(6506007)(186003)(5660300002)(122000001)(316002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MVlSSVZiMnlPRm1iQmxhaXZWbFluM2dxSmhWYU9mamZwTWp5bjZiK2lkYzVk?=
 =?utf-8?B?NENHbWNGVXJxam9ib0lXTk0zM1UvUC8wVHVXV0xuU09iQ2p6YXdpNVhUVmhO?=
 =?utf-8?B?ZXNhTFlqWDlGd1FVNE83aDhvbVhoL3FjSS9hWFR0MUwrMTRaN1VVTytTVzVN?=
 =?utf-8?B?ZXNWcTJhejNleVBEWi9DT29mMGRPQUZpNUQwMEdBQzc2QTdJeGIrYWdUYVBP?=
 =?utf-8?B?R2F2RW1xT0dmdE5HalRIQjFxb21nSVNncFpEUWM1M001QklwcUYxY2ZOOTA0?=
 =?utf-8?B?VnZzQlhtYk9ZKzEwamhIN0Q1bUNUWWRGcHNuV1NUdkJVeDByc1VEMldHTUFX?=
 =?utf-8?B?a0M1bk1adWcydUdHV3c3M2YwMUZUWEY0TmhmTXN4VVN1K2NJeXpBYWY2OXdm?=
 =?utf-8?B?b2Q1NnpsTHVZZGhFR3R0eU12aVNXMlJCek1rNENaUFNOZWhkTFppMjV3b1Iw?=
 =?utf-8?B?b2lLMS9obnlQVEJWZ1JZNUV0V0FOVlpVM01vSUltL21iczhRSmwxc0dTZGkr?=
 =?utf-8?B?OXlScVZ5T2h5cnc2aWpkYlNYYmxaa0dvNXE2bGpBN3VIL0V4SGt2S0R0eDZ6?=
 =?utf-8?B?UkFmZHBobVJoUUloZlMwQ3VCcG80K1h4UHA2aFQ5cWh1bGVVbmhCa3FtZzBN?=
 =?utf-8?B?d0habWRjYVhFYVh4Z3I2ZFVkbVp1cXdzM2tBMkttaXMrcXFTV2pJYTNvMkNs?=
 =?utf-8?B?aUVWZndXaitoV0pPMFJLOC9nZ0taTUhVTXR2MzBNVm5reXVyU01IQzZSZ3VW?=
 =?utf-8?B?ME1nWVdlRjZVWStqeG1jVnJTdHBaWVlVSnpIVjVEMzNMOTdCSFJqV1U3b2xq?=
 =?utf-8?B?OHd0RllwY2VFRzV1aCtyYk50Z0Zra0dUVlFVaUZyTGVDaHM5b3FTcEozTlM3?=
 =?utf-8?B?dzBrb25YQktEcmQ4T2RwdW9SZjZLdEF6SEk1WXpSZFRiSnV5Q2swbEJwUGU4?=
 =?utf-8?B?NUpIK290alZrT25uSlFKbHVKOFQ1b2tDZGRRYkRscHBCeEVVQ2E0Qmw0dmg5?=
 =?utf-8?B?Ni9NSnBjdHZla1o0UDR6T2QzWTRWei9lOUNkcWN5czRUWjZicWFYa0k5NFBR?=
 =?utf-8?B?RmpFa2ZxNnYvVDF2eGR0Q01tZjUxMlZTQmMvWjZnNWJua1RkVG9rKzFFUFpZ?=
 =?utf-8?B?SlV6NWdKVG9raUZXL2NUL2JCNmxTaDExMStBUm5YV0FmMVdwTEFYYmJtSTdW?=
 =?utf-8?B?eHJ4dFo2Y2lLUXNxTitIQTFBanRyR05iTXN0ajZYZ1Z4M2g5eHBmemRQNG9I?=
 =?utf-8?B?dyszWmNDNzk3L1UyQmNTdWdzN21LV1g0RjhDU2RtaTE2UktsbXMzRWljbzVa?=
 =?utf-8?B?TlA5NW9tcnozMDk1b3hMUUdFb2JFQVE3L0NBeFVtUGtOV0pnNkZiWmhZL1N6?=
 =?utf-8?B?U1I5SExXU3BNSXFucVVRSW1nWXpYeXBKOWJzbHl5SEhEcldDWlVhdzlOdGEz?=
 =?utf-8?B?ajdrRVBhVko2TEpjM1VlVWFHRjdWT2Q2Z1RWRVdkOWp0NGZ4RGQ5aGVPOTJs?=
 =?utf-8?B?a2FkYjRzK0psbXpvZHFPZTdRdnMxcHEvQ0FoZkFqeEVHNG41S2ppRS9sWSs1?=
 =?utf-8?B?QkZ4WnZMMkFrMlNxTDhIaERyT0VWbWNlNnRMQytLSlJDQ2hPWUVQZzBmQkVX?=
 =?utf-8?B?MXNUL0JUOTJKVXd3cVZzZ0laT1dKSlM5bUIzaEdiTGVGM0d3Z1NvNXhVNXR0?=
 =?utf-8?B?RHdpVjRvVTlvVUtmaUYvWmxoL1VwYTl2SlJOWmpudm1XazQ4WktWN0k1ZzRE?=
 =?utf-8?Q?uAh4iNIpCJTI6wIOVh9wp5+R50C8jvivZe1Ae/+?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e8e689-ba9d-4bca-1087-08d91b827608
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2021 11:28:58.7845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r8gnCH5KT6kR+bRAhCTJ16lv6e+O/P966Mlc0iGjg/TTvDLJ5kxWOdE0n0eFo52GSZXLLevR+ttA7agYPIuQNw/7Pey/qeX+VlGsqUFhMwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3124
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Corey Minyard <minyard@acm.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 Open Source Submission <patches@amperecomputing.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb2VsIFN0YW5sZXkgPGpvZWxA
am1zLmlkLmF1Pg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDIwLCAyMDIxIDc6MjkgQU0NCj4gVG86
IFF1YW4gTmd1eWVuIDxxdWFuQG9zLmFtcGVyZWNvbXB1dGluZy5jb20+OyBSeWFuIENoZW4NCj4g
PHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCj4gQ2M6IENvcmV5IE1pbnlhcmQgPG1pbnlhcmRA
YWNtLm9yZz47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Ow0KPiBBbmRyZXcgSmVm
ZmVyeSA8YW5kcmV3QGFqLmlkLmF1PjsgQnJlbmRhbiBIaWdnaW5zDQo+IDxicmVuZGFuaGlnZ2lu
c0Bnb29nbGUuY29tPjsgQmVuamFtaW4gSGVycmVuc2NobWlkdA0KPiA8YmVuaEBrZXJuZWwuY3Jh
c2hpbmcub3JnPjsgV29sZnJhbSBTYW5nIDx3c2FAa2VybmVsLm9yZz47IFBoaWxpcHAgWmFiZWwN
Cj4gPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+OyBvcGVuaXBtaS1kZXZlbG9wZXJAbGlzdHMuc291
cmNlZm9yZ2UubmV0Ow0KPiBkZXZpY2V0cmVlIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZz47
IExpbnV4IEFSTQ0KPiA8bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPjsgbGlu
dXgtYXNwZWVkDQo+IDxsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZz47IExpbnV4IEtlcm5l
bCBNYWlsaW5nIExpc3QNCj4gPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBsaW51eC1p
MmNAdmdlci5rZXJuZWwub3JnOyBPcGVuIFNvdXJjZQ0KPiBTdWJtaXNzaW9uIDxwYXRjaGVzQGFt
cGVyZWNvbXB1dGluZy5jb20+OyBQaG9uZyBWbw0KPiA8cGhvbmdAb3MuYW1wZXJlY29tcHV0aW5n
LmNvbT47IFRoYW5nIFEgLiBOZ3V5ZW4NCj4gPHRoYW5nQG9zLmFtcGVyZWNvbXB1dGluZy5jb20+
OyBPcGVuQk1DIE1haWxsaXN0DQo+IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjMgMy83XSBpMmM6IGFzcGVlZDogRml4IHVuaGFuZGxlZCBUeCBkb25l
IHdpdGggTkFLDQo+IA0KPiBSeWFuLCBjYW4geW91IHBsZWFzZSByZXZpZXcgdGhpcyBjaGFuZ2U/
DQo+IA0KPiBPbiBXZWQsIDE5IE1heSAyMDIxIGF0IDA3OjUwLCBRdWFuIE5ndXllbg0KPiA8cXVh
bkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPiB3cm90ZToNCj4gPg0KPiA+IEl0IGlzIG9ic2VydmVk
IHRoYXQgaW4gbm9ybWFsIGNvbmRpdGlvbiwgd2hlbiB0aGUgbGFzdCBieXRlIHNlbnQgYnkNCj4g
PiBzbGF2ZSwgdGhlIFR4IERvbmUgd2l0aCBOQUsgaXJxIHdpbGwgcmFpc2UuDQo+ID4gQnV0IGl0
IGlzIGFsc28gb2JzZXJ2ZWQgdGhhdCBzb21ldGltZXMgbWFzdGVyIGlzc3VlcyBuZXh0IHRyYW5z
YWN0aW9uDQo+ID4gdG9vIHF1aWNrIHdoaWxlIHRoZSBzbGF2ZSBpcnEgaGFuZGxlciBpcyBub3Qg
eWV0IGludm9rZWQgYW5kIFR4IERvbmUNCj4gPiB3aXRoIE5BSyBpcnEgb2YgbGFzdCBieXRlIG9m
IHByZXZpb3VzIFJFQUQgUFJPQ0VTU0VEIHdhcyBub3QgYWNrJ2VkLg0KPiA+IFRoaXMgVHggRG9u
ZSB3aXRoIE5BSyBpcnEgaXMgcmFpc2VkIHRvZ2V0aGVyIHdpdGggdGhlIFNsYXZlIE1hdGNoIGFu
ZA0KPiA+IFJ4IERvbmUgaXJxIG9mIHRoZSBuZXh0IGNvbWluZyB0cmFuc2FjdGlvbiBmcm9tIG1h
c3Rlci4NCj4gPiBVbmZvcnR1bmF0ZWx5LCB0aGUgY3VycmVudCBzbGF2ZSBpcnEgaGFuZGxlciBo
YW5kbGVzIHRoZSBTbGF2ZSBNYXRjaA0KPiA+IGFuZCBSeCBEb25lIG9ubHkgaW4gaGlnaGVyIHBy
aW9yaXR5IGFuZCBpZ25vcmUgdGhlIFR4IERvbmUgd2l0aCBOQUssDQo+ID4gY2F1c2luZyB0aGUg
Y29tcGxhaW4gYXMgYmVsb3c6DQo+ID4gImFzcGVlZC1pMmMtYnVzIDFlNzhhMDQwLmkyYy1idXM6
IGlycSBoYW5kbGVkICE9IGlycS4gZXhwZWN0ZWQNCj4gPiAweDAwMDAwMDg2LCBidXQgd2FzIDB4
MDAwMDAwODQiDQo+ID4NCj4gPiBUaGlzIGNvbW1pdCBoYW5kbGVzIHRoaXMgY2FzZSBieSBlbWl0
dGluZyBhIFNsYXZlIFN0b3AgZXZlbnQgZm9yIHRoZQ0KPiA+IFR4IERvbmUgd2l0aCBOQUsgYmVm
b3JlIHByb2Nlc3NpbmcgU2xhdmUgTWF0Y2ggYW5kIFJ4IERvbmUgZm9yIHRoZQ0KPiA+IGNvbWlu
ZyB0cmFuc2FjdGlvbiBmcm9tIG1hc3Rlci4NCj4gDQo+IEl0IHNvdW5kcyBsaWtlIHRoaXMgcGF0
Y2ggaXMgaW5kZXBlbmRlbnQgb2YgdGhlIHJlc3Qgb2YgdGhlIHNlcmllcywgYW5kIGNhbiBnbyBp
bg0KPiBvbiBpdCdzIG93bi4gUGxlYXNlIHNlbmQgaXQgc2VwYXJhdGVseSB0byB0aGUgaTJjIG1h
aW50YWluZXJzIGFuZCBhZGQgYSBzdWl0YWJsZQ0KPiBGaXhlcyBsaW5lLCBzdWNoIGFzOg0KPiAN
Cj4gICBGaXhlczogZjllYjkxMzUwYmIyICgiaTJjOiBhc3BlZWQ6IGFkZGVkIHNsYXZlIHN1cHBv
cnQgZm9yIEFzcGVlZCBJMkMNCj4gZHJpdmVyIikNCj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBRdWFuIE5ndXllbiA8cXVhbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPg0KPiA+IC0tLQ0KPiA+
IHYzOg0KPiA+ICAgKyBGaXJzdCBpbnRyb2R1Y2UgaW4gdjMgW1F1YW5dDQo+ID4NCj4gPiAgZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1hc3BlZWQuYyB8IDUgKysrKysNCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtYXNwZWVkLmMNCj4gPiBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXNwZWVkLmMg
aW5kZXggNzI0YmYzMDYwMGQ2Li4zZmIzN2MzZjIzZDQNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzcGVlZC5jDQo+ID4gKysrIGIvZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1hc3BlZWQuYw0KPiA+IEBAIC0yNTQsNiArMjU0LDExIEBAIHN0YXRpYyB1MzIgYXNw
ZWVkX2kyY19zbGF2ZV9pcnEoc3RydWN0DQo+ID4gYXNwZWVkX2kyY19idXMgKmJ1cywgdTMyIGly
cV9zdGF0dXMpDQo+ID4NCj4gPiAgICAgICAgIC8qIFNsYXZlIHdhcyByZXF1ZXN0ZWQsIHJlc3Rh
cnQgc3RhdGUgbWFjaGluZS4gKi8NCj4gPiAgICAgICAgIGlmIChpcnFfc3RhdHVzICYgQVNQRUVE
X0kyQ0RfSU5UUl9TTEFWRV9NQVRDSCkgew0KPiANCj4gQ2FuIHlvdSBleHBsYWluIHdoeSB5b3Ug
bmVlZCB0byBkbyB0aGlzIGhhbmRpbmcgaW5zaWRlIHRoZSBTTEFWRV9NQVRDSA0KPiBjYXNlPw0K
PiANCj4gQ291bGQgeW91IGluc3RlYWQgbW92ZSB0aGUgVFhfTkFLIGhhbmRsaW5nIHRvIGJlIGFi
b3ZlIHRoZSBTTEFWRV9NQVRDSA0KPiBjYXNlPw0KPiANCj4gPiArICAgICAgICAgICAgICAgaWYg
KGlycV9zdGF0dXMgJiBBU1BFRURfSTJDRF9JTlRSX1RYX05BSyAmJg0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgYnVzLT5zbGF2ZV9zdGF0ZSA9PQ0KPiA+ICsgQVNQRUVEX0kyQ19TTEFWRV9SRUFE
X1BST0NFU1NFRCkgew0KPiANCj4gRWl0aGVyIHdheSwgdGhpcyBuZWVkcyBhIGNvbW1lbnQgdG8g
ZXhwbGFpbiB3aGF0IHdlJ3JlIHdvcmtpbmcgYXJvdW5kLg0KPiANCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBpcnFfaGFuZGxlZCB8PSBBU1BFRURfSTJDRF9JTlRSX1RYX05BSzsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBpMmNfc2xhdmVfZXZlbnQoc2xhdmUsIEkyQ19TTEFWRV9T
VE9QLA0KPiAmdmFsdWUpOw0KDQpBY2NvcmRpbmcgdGhlIHBhdGNoIGFzc3VtZSBzbGF2ZSByZWNl
aXZlIFRYX05BSyB3aWxsIGJlIGdvIHRvIFNMQVZFX1NUT1Agc3RhdGU/DQoNCj4gPiArICAgICAg
ICAgICAgICAgfQ0KPiA+ICAgICAgICAgICAgICAgICBpcnFfaGFuZGxlZCB8PSBBU1BFRURfSTJD
RF9JTlRSX1NMQVZFX01BVENIOw0KPiA+ICAgICAgICAgICAgICAgICBidXMtPnNsYXZlX3N0YXRl
ID0gQVNQRUVEX0kyQ19TTEFWRV9TVEFSVDsNCj4gPiAgICAgICAgIH0NCj4gPiAtLQ0KPiA+IDIu
MjguMA0KPiA+DQo=
