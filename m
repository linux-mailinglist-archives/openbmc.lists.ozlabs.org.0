Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E437238E423
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 12:36:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpYXv67YCz307W
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 20:36:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=HtEJ6uHY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.135;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=HtEJ6uHY; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320135.outbound.protection.outlook.com [40.107.132.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpYXf0WsGz2yyC;
 Mon, 24 May 2021 20:36:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvXq4GCMP7YDGp2nYG/wGj/gLsTfnDGTwVZUHLWApa+QLVjALhIrkbzkhDwRwdRQ+HA8xYQQexmhYIVYN7l6rmCKVdzpe3Bhmozuo0BmQfWnWY9CpRWcpNN79KBSJgYT1e4JzQ97k3JR9l7/bA7XKaFVTYsPObf7Do9mKykxHh+Uoa+syR/LHnsL9Ta+ay63jQqHPQJakuqtSnOkpPk8uVZjpvV1DojlkBb0FKy8p7SgSUvPOxGY6Y/MFHWdyh7RtcKCi0WZm06NRzRHU93ofF5t+ELLMtepHD09BmXo86rUtKlRgbSSAktJrQC/IP1DiE0Zgc+0iGCRS1nbtUF6WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNy5YERQim1gGVi6HGWR47s5O8hgNp0Z7n7kgaSu550=;
 b=JACkyAt0C16nylZOHgqlxn+Ud3lvXzOBwn5UnJWNzAN8aDvNdwq9cfQBHrD6o/bdc7erXOE/h3vO6fPjEmDovBR1Fe5uTbHtTleEQ1qj6EbgpxDES5YoEM5n8LFxVSUIvXMnvzguSPbltQmRzf+58Yetma71Fv9V9RGekcLrRZ0CkHs6QLGJIzTWcNGhj0bOSVqaF+3fBRgaSucPeLLdUfbWkzlmWjueE+GINdknSOrRUuFhQKGtyEwJn7eJsvUz1Bxb+aWHUfLNWHY55GIAwK0QejRy2eaaNPNBxyMwad8EgQvu9IZDKn+dBH1FOnfTquzIhyBNynS1YjzQDDC35Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNy5YERQim1gGVi6HGWR47s5O8hgNp0Z7n7kgaSu550=;
 b=HtEJ6uHYU+rliy2VSN9Qx8DcoPCN9etvRR3vOUgt0senjcQbtRxYkb6isGA8G/lgUMdxtC8m6u2Mb5PWokP0Kr6yucF8Azm0JGv3FBMzClT89QyVHIB8Jv6RR5jO/8YZTw8xB457QY/rM/cOl+mpBuV4Sn0KjdWLcyzLDLnV+HsvUtH5+lU+QMnHG/IYogX8EcSmeHYXMEkl1+u1G3donUbZpeT2XTtZXjTo8A+OSR75x8+MYVshFuFeLggNFzR3HuDkWOx0ZIrytdScB+bOiBqtux9D+/dohzwohe26H7+nmcSm6CkIjTmrX03QdMlpmRkx8mL55BGYhZmDImeE2A==
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK0PR06MB2579.apcprd06.prod.outlook.com (2603:1096:203:6f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Mon, 24 May
 2021 10:36:10 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::ec25:881b:f113:93dc]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::ec25:881b:f113:93dc%6]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 10:36:09 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Quan Nguyen <quan@os.amperecomputing.com>, Corey Minyard
 <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Brendan Higgins
 <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Wolfram Sang <wsa@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v3 5/7] i2c: aspeed: Add aspeed_set_slave_busy()
Thread-Topic: [PATCH v3 5/7] i2c: aspeed: Add aspeed_set_slave_busy()
Thread-Index: AQHXTIQCISnhT+/XbEiDVKSu2FVXwqryb5QAgAAEGYCAAAKuUA==
Date: Mon, 24 May 2021 10:36:09 +0000
Message-ID: <HK0PR06MB338093E5E0D0DBA9EA7C1168F2269@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-6-quan@os.amperecomputing.com>
 <HK0PR06MB3380FD2B7649CFB48BEA2D4FF2269@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <1648966e-3e45-9661-c5dc-5ac2f40e2581@os.amperecomputing.com>
In-Reply-To: <1648966e-3e45-9661-c5dc-5ac2f40e2581@os.amperecomputing.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: adb13a9f-4454-4d9a-a631-08d91e9fbed1
x-ms-traffictypediagnostic: HK0PR06MB2579:
x-microsoft-antispam-prvs: <HK0PR06MB25790DB17182B446CB8360B5F2269@HK0PR06MB2579.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A+eB3lgIhSxqVAEfM6WEgw0mVE88S5KssbAdE4w8G+oa0oGmeCDvJ94Oj5XeD466IOZqIlZZj5YNpNf3Eb+zTM3apgZFintjR/11ZdRAY/sGRKJ4vzyiSJfc+tf44RBSl/u/K/8ghVRDjjR9fYJTzSW/7viedTfmZrDYGixD8ATp651jmSOSrkujIIi8Zm+Oc3GMnmJLmH3XdYE2jBEieuywFJpvmzNbLVfzq6xjpyyMDpFaL21dHkmlUAa+a/Z9j8ZjzweM/jbXwEkw2Oq71TnmZyiorRXkKimxhMrB26Qmr1H9g1TAIhzywhoPeskdHrLYrHGglVOvZRXyNLhFcFND0/Ktny+UwOoaMfBAvry3zku+276ZO7LimbiTM9nlqv+WvNjuM7LT92JwKXwnL7rhbgihhGp3/NSbQfd5Izjo2sBZFCp7dhPhPFmM/e1e74u9aanyYZ1ixmEeL6FQjMscSTnFZwG07U+jAACZaZsQlwmicvpHqWu9T+/Mu++BBtuuqprfgp89XCEvVrcOun1IZYU7zuRgy07ckg/BW8qCTMI2dcgX9oNPH8dgphzeV790srw6nvY06RBMG1CCzwO0JSQS2osM6Mh4U2xA6G/0e7E+sEFTAv7gwYbOmkem8SwC+5k1Y62jxFm1k5AkXw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(39840400004)(376002)(396003)(136003)(316002)(64756008)(2906002)(83380400001)(921005)(55016002)(5660300002)(8676002)(52536014)(66446008)(71200400001)(53546011)(7696005)(6506007)(478600001)(7416002)(186003)(8936002)(38100700002)(66476007)(9686003)(4326008)(66556008)(86362001)(66946007)(76116006)(55236004)(26005)(33656002)(122000001)(54906003)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cU9rMyt5UnFveGVkeDZLRU1SbnJiUXhVdFgrY1JNenFRTThPaTBNWHRIUkVS?=
 =?utf-8?B?QkFCS0k4c20zc1JFTWl4TEFCRVhtMFUzNGNha0NBTzEwTUM3NmpnM1JzVnJu?=
 =?utf-8?B?WENGbXMyOGRHZE51YTJicDZoNjdHSm9sdWx5TnU5eGcrVUQ2VEZJeFVEdnB4?=
 =?utf-8?B?WTdzUmhTY3VDQ0E1MUVvSGZDb1laMW0rVU9GTVhBWGN1OUVZN2RuQS9USnIw?=
 =?utf-8?B?OFU4QUJjWUJqbXhpVThkcnhDYUl3ZEt3VHF2UHVCM0pPZEdUbklPc1ZGd3Vn?=
 =?utf-8?B?QTQweS9wOEVYc0swZExMNUZ4UjFSL0F1WlN2SnpCbFNZTDlxcXJJWnhpTzR4?=
 =?utf-8?B?Vit0cTZjZk5UR2QzOHJBS1QrNW5uK2RJSDRlbW51NUIrZ29kWW9pNHpMN2ZS?=
 =?utf-8?B?YXZ3K1lRcmJmVkhjeVh4bzltVUQxcGVmUjd0VDRuckpKYVhuR0pYeUhqMTRQ?=
 =?utf-8?B?M1F0Mm8rT2todVI4Z0NBS2ZyZTR6WFRSWFhLK0FKUVdhNEZQd0lFS2NrSHdB?=
 =?utf-8?B?blFRMzh1N2ttOUl6TWFCK2hOR2RSZ0QrL3ZQWXhxWnVLajc3NDBsWDVjVWVV?=
 =?utf-8?B?Ym1yVUJ2VTVQdmQ4ZzM3cXM4Z2ZwNlNRdmtNdTlCL09IMHJLU2puTkN5elFJ?=
 =?utf-8?B?NU9rM3IzZkwrMW5JNWEvWFlrSy9TNEtKUTVDdXdwTHZSamVzVjM5OXllQzVi?=
 =?utf-8?B?eCtrc1ExMmxQQjBwdjM5eSs4Mit5Wm9sTHZ5N05xVjlWWllKL1dXRzVRY0Qw?=
 =?utf-8?B?WUJSQmY4RzFIREJ3TFFYQlVzQ0JndEVQQ09SSG50eXEwMHFtZGlWMk52T1Ju?=
 =?utf-8?B?d1ltTGQzbzdTcWlMeWU0ZDZkdFhiUnh1NlYxME40b0N6dWlOenozMlpiMW1G?=
 =?utf-8?B?TkgzV245eXJkWFloQUMrb0srQnFLQndhbUhwZXRINEozYkJBbUl3azloM01z?=
 =?utf-8?B?OUNCVU1mYVVvMUFlUHNHRElFTmFjSWtKNXJ4ZlVJY242TTlEZDVVc2pNNS9k?=
 =?utf-8?B?M2tlaTY1Ny9GYjdtVVNDNWpTSjVGV1p2VlRqYk1KRFJZL1g3ZWJkVjg0Mmwy?=
 =?utf-8?B?NTNvUGpzalRFWU1DY2ZiT2hkTFo3Y1A4SGhPamNZemR1N0RRRmpMSzNhMStH?=
 =?utf-8?B?TnlJdy9JQXZqc0VVTU5XVHNGRVRFRTdJOC9ySXoxa0szYW40Uk10b3hmS29q?=
 =?utf-8?B?V1Vycm5sZ3RJN0FGdThPWVpzdm1tMzBRQjE1REJ3SERWMjJIVTBDSm1FdWZm?=
 =?utf-8?B?a0JVUXpqUnJtSjhhUnNGMmxwVUI2Nlg0a2p0MXYzSERVaG1IMTlkd29HWnVK?=
 =?utf-8?B?Zmx2WmxnY1Y1NmlLcXczOUdsM2dhcURwaVVyMmtnWkNwV0tmZk1KVmVuemRU?=
 =?utf-8?B?cXRZQUFxSW9HTHN6a290V2VNbExvc21mYmxGNUdSeW9WM245OTBOV1p1bDFl?=
 =?utf-8?B?QVRUeGtBY0FyV1NqRmJxWGE3WXNjTTRzYlVGQy9kczdzRzJJTE9RNldsbzZq?=
 =?utf-8?B?V1NUTHhzWHEvMTBrR2xaZ0UzbmxiUW5teEVJdUZlRzNPbVJDd3dxOW12NURo?=
 =?utf-8?B?akh2RHlyc3F3T2lXVU9Xek9qdEFwRTEvM0VxTkpRak5GWFVkRTBVTTUrei9N?=
 =?utf-8?B?dFExU1JqR2phM1pKRjBMRTVOcXZwTG9oaDFJN2FZVVl6QTdUUmNPbUMzZ3Zv?=
 =?utf-8?B?MlpCMERURHd6OVRTN0VGbzJ0aEpURzhiaVlXQWdzREpyTUgweDd4b1VjbWZH?=
 =?utf-8?Q?vnhD+6PuMTXBLtfd4TEh+mdB0VC4P2cNudg449F?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb13a9f-4454-4d9a-a631-08d91e9fbed1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2021 10:36:09.7501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DtM7Truy/94H8628p+1LGH2gZHTCUC6nakg/GVojIKDk6ghUdNdoISWz1z4rh0UgHGak47aCzZnJfiZZe00doSb6cjOAq/c2ngHczg4SX68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2579
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBRdWFuIE5ndXllbiA8cXVhbkBv
cy5hbXBlcmVjb21wdXRpbmcuY29tPg0KPiBTZW50OiBNb25kYXksIE1heSAyNCwgMjAyMSA2OjIw
IFBNDQo+IFRvOiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IENvcmV5IE1p
bnlhcmQNCj4gPG1pbnlhcmRAYWNtLm9yZz47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5v
cmc+OyBKb2VsIFN0YW5sZXkNCj4gPGpvZWxAam1zLmlkLmF1PjsgQW5kcmV3IEplZmZlcnkgPGFu
ZHJld0Bhai5pZC5hdT47IEJyZW5kYW4gSGlnZ2lucw0KPiA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xl
LmNvbT47IEJlbmphbWluIEhlcnJlbnNjaG1pZHQNCj4gPGJlbmhAa2VybmVsLmNyYXNoaW5nLm9y
Zz47IFdvbGZyYW0gU2FuZyA8d3NhQGtlcm5lbC5vcmc+OyBQaGlsaXBwIFphYmVsDQo+IDxwLnph
YmVsQHBlbmd1dHJvbml4LmRlPjsgb3BlbmlwbWktZGV2ZWxvcGVyQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldDsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4g
Q2M6IE9wZW4gU291cmNlIFN1Ym1pc3Npb24gPHBhdGNoZXNAYW1wZXJlY29tcHV0aW5nLmNvbT47
IFRoYW5nIFEgLg0KPiBOZ3V5ZW4gPHRoYW5nQG9zLmFtcGVyZWNvbXB1dGluZy5jb20+OyBQaG9u
ZyBWbw0KPiA8cGhvbmdAb3MuYW1wZXJlY29tcHV0aW5nLmNvbT47IG9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDUvN10gaTJjOiBhc3BlZWQ6IEFkZCBh
c3BlZWRfc2V0X3NsYXZlX2J1c3koKQ0KPiANCj4gT24gMjQvMDUvMjAyMSAxNzowNiwgUnlhbiBD
aGVuIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBv
cGVuYm1jDQo+ID4+IDxvcGVuYm1jLWJvdW5jZXMrcnlhbl9jaGVuPWFzcGVlZHRlY2guY29tQGxp
c3RzLm96bGFicy5vcmc+IE9uDQo+IEJlaGFsZg0KPiA+PiBPZiBRdWFuIE5ndXllbg0KPiA+PiBT
ZW50OiBXZWRuZXNkYXksIE1heSAxOSwgMjAyMSAzOjUwIFBNDQo+ID4+IFRvOiBDb3JleSBNaW55
YXJkIDxtaW55YXJkQGFjbS5vcmc+OyBSb2IgSGVycmluZw0KPiA+PiA8cm9iaCtkdEBrZXJuZWwu
b3JnPjsgSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT47IEFuZHJldyBKZWZmZXJ5DQo+ID4+
IDxhbmRyZXdAYWouaWQuYXU+OyBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2ds
ZS5jb20+Ow0KPiA+PiBCZW5qYW1pbiBIZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5lbC5jcmFzaGlu
Zy5vcmc+OyBXb2xmcmFtIFNhbmcNCj4gPj4gPHdzYUBrZXJuZWwub3JnPjsgUGhpbGlwcCBaYWJl
bCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT47DQo+ID4+IG9wZW5pcG1pLWRldmVsb3BlckBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQ7DQo+ID4+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+ID4+IGxpbnV4LWFzcGVlZEBsaXN0
cy5vemxhYnMub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiA+PiBsaW51eC1p
MmNAdmdlci5rZXJuZWwub3JnDQo+ID4+IENjOiBPcGVuIFNvdXJjZSBTdWJtaXNzaW9uIDxwYXRj
aGVzQGFtcGVyZWNvbXB1dGluZy5jb20+OyBUaGFuZyBRIC4NCj4gPj4gTmd1eWVuIDx0aGFuZ0Bv
cy5hbXBlcmVjb21wdXRpbmcuY29tPjsgUGhvbmcgVm8NCj4gPj4gPHBob25nQG9zLmFtcGVyZWNv
bXB1dGluZy5jb20+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4gPj4gU3ViamVjdDogW1BB
VENIIHYzIDUvN10gaTJjOiBhc3BlZWQ6IEFkZCBhc3BlZWRfc2V0X3NsYXZlX2J1c3koKQ0KPiA+
Pg0KPiA+PiBTbGF2ZSBpMmMgZGV2aWNlIG9uIEFTVDI1MDAgcmVjZWl2ZWQgYSBsb3Qgb2Ygc2xh
dmUgaXJxIHdoaWxlIGl0IGlzDQo+ID4+IGJ1c3kgcHJvY2Vzc2luZyB0aGUgcmVzcG9uc2UuIFRv
IGhhbmRsZSB0aGlzIGNhc2UsIGFkZHMgYW5kIGV4cG9ydHMNCj4gPj4gYXNwZWVkX3NldF9zbGF2
ZV9idXN5KCkgZm9yIGNvbnRyb2xsZXIgdG8gdGVtcG9yYXJ5IHN0b3Agc2xhdmUgaXJxDQo+ID4+
IHdoaWxlIHNsYXZlIGlzIGhhbmRsaW5nIHRoZSByZXNwb25zZSwgYW5kIHJlLWVuYWJsZSB0aGVt
IGFnYWluIHdoZW4gdGhlDQo+IHJlc3BvbnNlIGlzIHJlYWR5Lg0KPiA+Pg0KPiA+PiBTaWduZWQt
b2ZmLWJ5OiBRdWFuIE5ndXllbiA8cXVhbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPg0KPiA+PiAt
LS0NCj4gPj4gdjM6DQo+ID4+ICAgICsgRmlyc3QgaW50cm9kdWNlIGluIHYzIFtRdWFuXQ0KPiA+
Pg0KPiA+PiAgIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXNwZWVkLmMgfCAyMCArKysrKysrKysr
KysrKysrKysrKw0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspDQo+ID4+
DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzcGVlZC5jDQo+ID4+
IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3BlZWQuYyBpbmRleCBiMmU5YzhmMGRkZjcuLjk5
MjZkMDQ4MzFhMg0KPiA+PiAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1hc3BlZWQuYw0KPiA+PiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzcGVlZC5jDQo+
ID4+IEBAIC05NDQsNiArOTQ0LDI2IEBAIHN0YXRpYyBpbnQgYXNwZWVkX2kyY19pbml0KHN0cnVj
dCBhc3BlZWRfaTJjX2J1cw0KPiA+PiAqYnVzLA0KPiA+PiAgIAlyZXR1cm4gMDsNCj4gPj4gICB9
DQo+ID4+DQo+ID4+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfSTJDX1NMQVZFKQ0KPiA+PiArdm9p
ZCBhc3BlZWRfc2V0X3NsYXZlX2J1c3koc3RydWN0IGkyY19hZGFwdGVyICphZGFwLCBib29sIGJ1
c3kpIHsNCj4gPj4gKwlzdHJ1Y3QgYXNwZWVkX2kyY19idXMgKmJ1cyA9IGkyY19nZXRfYWRhcGRh
dGEoYWRhcCk7DQo+ID4+ICsJdW5zaWduZWQgbG9uZyBjdXJyZW50X21hc2ssIGZsYWdzOw0KPiA+
PiArDQo+ID4+ICsJc3Bpbl9sb2NrX2lycXNhdmUoJmJ1cy0+bG9jaywgZmxhZ3MpOw0KPiA+PiAr
DQo+ID4+ICsJY3VycmVudF9tYXNrID0gcmVhZGwoYnVzLT5iYXNlICsgQVNQRUVEX0kyQ19JTlRS
X0NUUkxfUkVHKTsNCj4gPiBIZWxsbw0KPiA+IAlXaGVyZSB0aGUgYnVzLT5iYXNlIHRvIGJlIHJl
bWFwPw0KPiA+DQo+IA0KPiBIaSBSeWFuLA0KPiANCj4gSW4gIltQQVRDSCB2MyA2LzddIGlwbWk6
IHNzaWZfYm1jOiBBZGQgQXNwZWVkIFNTSUYgQk1DIGRyaXZlciIsIHRoZQ0KPiAtPnByaXYgaXMg
cmV0cmlldmVkIGJ5IGNhbGxpbmcgaTJjX2dldF9hZGFwZGF0YShjbGllbnQtPmFkYXB0ZXIpLiBB
bmQgaW4NCj4gYXNwZWVkX3NldF9zc2lmX2JtY19zdGF0dXMoKSwgY2FsbCB0aGUgZXhwb3J0ZWQg
YXNwZWVkX3NldF9zbGF2ZV9idXN5KCkNCj4gdXNpbmcgLT5wcml2IHBvaW50ZXIgYXMgY29kZSBi
ZWxvdy4NCj4gDQpZZXMsIEkgc2VlIHRoZSBwcm9iZSBmdW5jdGlvbiAiIHNzaWZfYm1jLT5wcml2
ID0gaTJjX2dldF9hZGFwZGF0YShjbGllbnQtPmFkYXB0ZXIpOyIgdG8gZ2V0IHByaXYuDQpCdXQg
bXkgcXVlc3Rpb24gSSBkb27igJl0IHNlZSB0aGUgYnVzLT5iYXNlIGFkZHJlc3MgYmUgYXNzaWdu
ZWQuIA0KDQo+ICtleHRlcm4gdm9pZCBhc3BlZWRfc2V0X3NsYXZlX2J1c3koc3RydWN0IGkyY19h
ZGFwdGVyICphZGFwLCBib29sIGJ1c3kpOw0KPiArc3RhdGljIHZvaWQgYXNwZWVkX3NldF9zc2lm
X2JtY19zdGF0dXMoc3RydWN0IHNzaWZfYm1jX2N0eCAqc3NpZl9ibWMsDQo+IHVuc2lnbmVkIGlu
dCBzdGF0dXMpDQo+ICt7DQo+ICsJaWYgKHN0YXR1cyAmIFNTSUZfQk1DX0JVU1kpDQo+ICsJCWFz
cGVlZF9zZXRfc2xhdmVfYnVzeSgoc3RydWN0IGkyY19hZGFwdGVyICopc3NpZl9ibWMtPnByaXYs
IHRydWUpOw0KPiArCWVsc2UgaWYgKHN0YXR1cyAmIFNTSUZfQk1DX1JFQURZKQ0KPiArCQlhc3Bl
ZWRfc2V0X3NsYXZlX2J1c3koKHN0cnVjdCBpMmNfYWRhcHRlciAqKXNzaWZfYm1jLT5wcml2LCBm
YWxzZSk7IH0NCj4gKw0KPiArc3RhdGljIGludCBzc2lmX2JtY19wcm9iZShzdHJ1Y3QgaTJjX2Ns
aWVudCAqY2xpZW50LCBjb25zdCBzdHJ1Y3QNCj4gaTJjX2RldmljZV9pZCAqaWQpDQo+ICt7DQo+
ICsJc3RydWN0IHNzaWZfYm1jX2N0eCAqc3NpZl9ibWM7DQo+ICsNCj4gKwlzc2lmX2JtYyA9IHNz
aWZfYm1jX2FsbG9jKGNsaWVudCwgMCk7DQo+ICsJaWYgKElTX0VSUihzc2lmX2JtYykpDQo+ICsJ
CXJldHVybiBQVFJfRVJSKHNzaWZfYm1jKTsNCj4gKw0KPiArCXNzaWZfYm1jLT5wcml2ID0gaTJj
X2dldF9hZGFwZGF0YShjbGllbnQtPmFkYXB0ZXIpOw0KPiArCXNzaWZfYm1jLT5zZXRfc3NpZl9i
bWNfc3RhdHVzID0gYXNwZWVkX3NldF9zc2lmX2JtY19zdGF0dXM7DQo+ICsNCj4gKwlyZXR1cm4g
MDsNCj4gK30NCj4gDQo+IC0gUXVhbg0KPiANCj4gDQoNCg==
