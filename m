Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CDB41583D
	for <lists+openbmc@lfdr.de>; Thu, 23 Sep 2021 08:32:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFQLW0LDNz2yQ4
	for <lists+openbmc@lfdr.de>; Thu, 23 Sep 2021 16:32:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=CglgP+3o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.130.111;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chin-ting_kuo@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=CglgP+3o; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300111.outbound.protection.outlook.com [40.107.130.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFP0k3wlQz2yLg;
 Thu, 23 Sep 2021 15:31:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWLCUSX4xH9d3rFQPlYaboMxO8OvJymluOys9RTHNI+0HETfA8XLd1hzKBHCc9DjV/SjJaUW9f303n/dupEcueWH73k9w+aG+6qbola7JhOCL+eiSNUbNcjgjX/J5U63xiwJA0D1CDMz+KVjZoCESBf6kg7X2uaOQVGyTkyj1B487PRRNYXgHGFUWoo1oXd36CsCSAbuiwhQ5XMHTb1mE5FBZEZ+oZ1o9zOPx1hztUDLMPtqISEVdo/Me5GAcpEwF7JV3yr08vU9u3rWUWvhsC4vyotCK2gvoEntcDlEQnawZRs1wbIWnxJMDZa2+MbqvlL406mtVFIFsgBZ56xK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=u9g/48q06aL3pjrArsxxaJRuvH/rvaFWQJT5cGIUWEw=;
 b=evRSA4pok1JSA0wZzV7+QYV4mFJwRMFprrpo7r4UkslU/m3STNJzOzq/2nmK0FIYevOYNl9s9vbNID7O1tLzgj+TzTN/PfnHBTPfgs7RsDzjxYp3y6fJrjpMdZB3BL/KzWGrBNan9tQ5lNeRyBgDlSy+lzmA+TaxQiwFTqyETK7ovo4lQflHmqNRqzys9gCGAOye/PQXaFLxCs1mcdagOmWO5RUAYHdXKtYU5NRArvNjznIuEVCyoBWO1ETXHSvCYkEG75qrlyMLJ7C9Cdg2sb9kW1GO0cgt+KQcd6Q15GghTsJoQZjirt/Io1gSIW+Eq21W8JJRZG4zVYLcOOP+nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9g/48q06aL3pjrArsxxaJRuvH/rvaFWQJT5cGIUWEw=;
 b=CglgP+3ozHEIUizeZ/O+vgDblVR3eMxIgNhW9y/H4ZSeSY1nal+z0ob9ffyIWVEbgS/VKGSzxcc3u3xi339rGqf+McokezpJP4ix+89zy2V5z2CMOJbfQVAbgOQtblfmQqDkTIl2nA5yZIwfMIzSmKviPBy+BLJihsRtz5J7EYzj7oiEQql5a+m4BRzRr4JnzzjhYesgDIv3S4VpTET4d5TgfhLJ3/7kxFzlZL11RpyiwTW52QTNpJz3XGNRbgzCJZAqF5dMrWgEopzl6Mj0DauWtLXoE8mA5xIIOuxUka2I2Ggnlf8L96GIOLQ+YuAXMmr2b4kij99+ODuW5BL71g==
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com (2603:1096:203:5b::22)
 by HK2PR0601MB2033.apcprd06.prod.outlook.com (2603:1096:202:8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 23 Sep
 2021 05:31:08 +0000
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::ddf1:e9d4:c209:8ab8]) by HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::ddf1:e9d4:c209:8ab8%7]) with mapi id 15.20.4523.021; Thu, 23 Sep 2021
 05:31:08 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH 01/10] clk: aspeed: ast2600: Porting sdhci clock source
Thread-Topic: [PATCH 01/10] clk: aspeed: ast2600: Porting sdhci clock source
Thread-Index: AQHXr50B2Joa/cUtbEObI5DULpTJPKuwvVCAgABAw5A=
Date: Thu, 23 Sep 2021 05:31:08 +0000
Message-ID: <HK0PR06MB2786CF9338751160A3BA55CFB2A39@HK0PR06MB2786.apcprd06.prod.outlook.com>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
 <20210922103116.30652-2-chin-ting_kuo@aspeedtech.com>
 <CACPK8XeeEeQb52ZHYaN49r_Vso-xUHamDyrA+bFvP4_ESQs9dA@mail.gmail.com>
In-Reply-To: <CACPK8XeeEeQb52ZHYaN49r_Vso-xUHamDyrA+bFvP4_ESQs9dA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a58d964d-1414-425c-53ad-08d97e5358e3
x-ms-traffictypediagnostic: HK2PR0601MB2033:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR0601MB2033E58F53695F03BBA977CDB2A39@HK2PR0601MB2033.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ho/LEbrk39U+PC+/HapA7L0sHHIMhwr8ypLVGzDTel/8tEi08HcU74RfE41YvQeZ/yVYPVFTPSVMtmoj18r7mBnh0B0pzwaUHQsjHvEnHwlf71F185dDq2FmS6aWe4RRLkPE0wHuslc6g3l67RJQgjIEgdxWqlexC0YSsWRAsjswVLGMWVPeFW6ZmW9GNWfnpJ0HXJ3gFK5awnLjyO2wn6L7X1ZfCO8VhaO3U2Mkgdr1vYBBTEWtaG3AXPVok0GI7+fOnf4EiTVgcYDemqBao1YvzIPYm8GKJdo7GE3aYCc2rw/r0OH97br4tU2G0Wx0oNVkUi3UJJOKNUbifUtX6MhEEgX7hZCmyyhzHsH398lDBqJzcWXEKsFDo8I73vr1/gxjWm1fhbCPx0ahdIIKdRppDIFf7kPE6IOlGtlKBu5SBKwM7HxInlMQKaGBcxvlMB5sSP8Ko/DRG6Pd6MIKVgId0o5DfyfQqeqrfbQxj9Gwsfk77EFBc83cLVXdWPm/rwR0GqU1HyCCERl7PWRw2z8uZhCzgdSxyngUWf95XMeldsuEmAzmshZ7hHSmZVtdreeVhcAlyQji1bWm7ipKtMnxZhOLyO+7DRJDL+z2hlLEARXvqAOn8RuFjy/WuUU+NC5c5z+avq1mB2beFhwHZowQcuO9cgvRLeAhC4nxtZVdJI3GdFppqekaUv+NtxIYdnI58Rw1kj+cHgFaCGGli4g3IVBKMNnOkmTijoXGp1EgrNUjbaz4EZZsCpAl+VTuY0yi/G6+Yi/O8Lc7jh3jiFSjJABnQfZcE90N0c2uC/A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2786.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39850400004)(376002)(396003)(346002)(366004)(38070700005)(966005)(2906002)(33656002)(7416002)(5660300002)(8676002)(8936002)(508600001)(4326008)(26005)(107886003)(76116006)(64756008)(9686003)(86362001)(55016002)(66476007)(66556008)(66446008)(83380400001)(52536014)(6506007)(53546011)(71200400001)(66946007)(6916009)(186003)(7696005)(122000001)(38100700002)(54906003)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZllIemQvNkdVNkZvVlg0M0tEOXBOcUdxNnRtWVYrNlNVWnBXM3d4cXRUZkJn?=
 =?utf-8?B?Q3BsY0hjMGVxTmgyRGlZU082czFiTi9FeEVxR2JURFFwMHFzRzhFbmRjZGdU?=
 =?utf-8?B?Rk9udnFQSkFBQzB4TlQ1VTE4Zy9FY012c3N6M0l5YlZQRjJzTkxNZ1FXbGRV?=
 =?utf-8?B?MEx3YmpqVk5jUGcvUXVhK3BYZTc0NVN0QlJSTUlTNno3NkFsNkszcjR1QVBI?=
 =?utf-8?B?OWV4Q2d4aHN6SkZxZ09hVEJnV1BEeFJaTXRET2hKTlh1RWhuN1ZZVGpUZVJJ?=
 =?utf-8?B?YjVJbzlhbmtrQ2g1WTd5ZnNESlQwZDFRenR2bi9HcHVFUEdDTTZZTTJmY0Ev?=
 =?utf-8?B?UjNndlVFZytHeGsvQjI0V3Q5enpIekl6TTdnUjFYK3Rqb0pST1gwaHNWdDkw?=
 =?utf-8?B?bXlLbnBEMXArejZ2MytiSXZ5K1pHdWhxYkdzRUVhaXNoYm8wdi9DVXVnT1Zo?=
 =?utf-8?B?UlE4WlNMc2xjelc2RFJuWnE3SHRLc3RGeHgzL3pxVlZpU3ZEdXdjRWlpN0Ja?=
 =?utf-8?B?Rk1YTTEyU2NKY21ueXYwWWxmRnVBcVdhaVpNOVlRYkpLem9yQWVCc0Zadk9I?=
 =?utf-8?B?bkZrU3lHd1dXd1F5NFMvS0J3aWhncGdnNTk2TlJ5aXludlpMZkJiSzR2bVpI?=
 =?utf-8?B?SVJ1c0pGQnUrTVFnRjRqQkJlRUExMVQzV0hsVnRydTBIVWdyZ0d4eHhWN0lR?=
 =?utf-8?B?RXR1ODhtaW9rd21aT1R5emJyM3pqSUdrTnBxN0RmUlEwUXJFRTBtQ044amFk?=
 =?utf-8?B?alJiamVRemI4aUlYTEVQNGo4TzQyRlZTb2lTQ0ROdWd4U0J5cFZ1STBPV3NE?=
 =?utf-8?B?c3hjMGlJbUtPSk5EQlpiMTJQYkZtQVBVOVcwbWd5b0hkeFRDMTJORXo1OXZN?=
 =?utf-8?B?Y3ljRldDTUd2S2RBYWk3eTR5WmZKRE5sT0RzaVY0WloyZFRlN3FwZnJzQkVx?=
 =?utf-8?B?cW5iR1dGVWZQVXdVSkE4bHFEd1FNOXF5ZGtuQjNOZTJVQkdVU2hWVkowOG5p?=
 =?utf-8?B?N2VBVGkvU1RSTVh6aHl4dlVhdkpHUlpBRmQ1eTNLRHFGSGdkZWVndGpvTit4?=
 =?utf-8?B?NG1VQmNzWmI1aFVhMmpSYlFsaitDZ0xTWWo0NS9IaUU5aHBycStUa1ZiZE1q?=
 =?utf-8?B?VytWUzdqTEx2Q0g5K2FKd0c3NHQ5TUJnYm1IUjVEMjNRUzBzcXhBdDlqSFFi?=
 =?utf-8?B?QUdrWXBMa0czUzhuYkt5OFl3bXZTUUdZMENMb290alVqa2g0dm1kVEpKcjdS?=
 =?utf-8?B?cWJLSXIxcUcrVnhjelUzZnlHL0pjdVdldVFxTURKbnNlQjYzaXpNTDI4eEtk?=
 =?utf-8?B?NlhzendPN21ucXd3OG5qQjEyQStpcVQ4VkNKbVZzS2hUWndHd092VEpLSlU0?=
 =?utf-8?B?eG1GYTNxQkgyQUhUbm0xYkJLb1FGR3YrR0lram1sQWE2Vk5kUW5PMnlRZVp4?=
 =?utf-8?B?eFRmd1ZoR0hXM0hyTEw2YlJqR213VHNhRk14WWl4cnpBVFdyK256bGlVMVBw?=
 =?utf-8?B?eVVMYWhYejV0OWF3WUdmUzBSbzd1aUJFa1luVlhKdzIxaytMaVhFNUFNWHVl?=
 =?utf-8?B?OEc3Vm5oQ25XZFllcVlDOFFQVDhTY21BQ1kzVzJyak1GL1pZNmVhRXF5SDFG?=
 =?utf-8?B?RlRmVi9wbjZhRFRwYk0wRlgxY25jbUlGWDNqbG05OTFwc0ppMlJ2RjdkczlL?=
 =?utf-8?B?VWF3Wk5HdWE5andRUjRLRVNpYWxBNmFUMEE3ekk1TnBqVGxQU0RWQW1lQWF6?=
 =?utf-8?Q?GwJq9BJErr2Db20EM4hYJC70Z0wuQUiKs/g2mId?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2786.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a58d964d-1414-425c-53ad-08d97e5358e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2021 05:31:08.7184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wKAn2Em9pppMIo2Z0l8lVb9kOpHkYFfBV8viQR8wlp8Pymf31Fj3oCYWEEKL63B455d4KV4kqowZEKfHlY6j/Pfgft038Kp72Cvr/TeZ/pA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB2033
X-Mailman-Approved-At: Thu, 23 Sep 2021 16:31:39 +1000
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
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, BMC-SW <BMC-SW@aspeedtech.com>,
 Stephen Boyd <sboyd@kernel.org>, Steven Lee <steven_lee@aspeedtech.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSm9lbCwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+DQo+IFNlbnQ6
IFRodXJzZGF5LCBTZXB0ZW1iZXIgMjMsIDIwMjEgODowMiBBTQ0KPiBUbzogQ2hpbi1UaW5nIEt1
byA8Y2hpbi10aW5nX2t1b0Bhc3BlZWR0ZWNoLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAw
MS8xMF0gY2xrOiBhc3BlZWQ6IGFzdDI2MDA6IFBvcnRpbmcgc2RoY2kgY2xvY2sgc291cmNlDQo+
IA0KPiBPbiBXZWQsIDIyIFNlcHQgMjAyMSBhdCAxMDozMSwgQ2hpbi1UaW5nIEt1bw0KPiA8Y2hp
bi10aW5nX2t1b0Bhc3BlZWR0ZWNoLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiAtIFRoZXJlIGFyZSB0
d28gY2xvY2sgc291cmNlcyB1c2VkIHRvIGdlbmVyYXRlDQo+ID4gICBTRC9TRElPIGNsb2NrLCBB
UExMIGNsb2NrIGFuZCBIQ0xLICgyMDBNSHopLg0KPiA+ICAgVXNlciBjYW4gc2VsZWN0IHdoaWNo
IGNsb2NrIHNvdXJjZSBzaG91bGQgYmUgdXNlZA0KPiA+ICAgYnkgY29uZmlndXJpbmcgU0NVMzEw
WzhdLg0KPiA+IC0gVGhlIFNEL1NESU8gY2xvY2sgZGl2aWRlciBzZWxlY3Rpb24gdGFibGUgU0NV
MzEwWzMwOjI4XQ0KPiA+ICAgaXMgZGlmZmVyZW50IGJldHdlZW4gQVNUMjYwMC1BMSBhbmQgQVNU
MjYwMC1BMi9BMy4NCj4gPiAgIEZvciBBU1QyNjAwLUExLCAyMDBNSHogU0QvU0RJTyBjbG9jayBj
YW5ub3QgYmUNCj4gPiAgIGdvdHRlbiBieSB0aGUgZGl2aWRlcnMgaW4gU0NVMzEwWzMwOjI4XSBp
ZiBBUExMDQo+ID4gICBpcyBub3QgdGhlIG11bHRpcGxlIG9mIDIwME1IeiBhbmQgSENMSyBpcyAy
MDBNSHouDQo+ID4gICBGb3IgQVNUMjYwMC1BMi9BMywgYSBuZXcgZGl2aWRlciwgIjEiLCBpcyBh
ZGRlZCBhbmQNCj4gPiAgIDIwME1IeiBTRC9TRElPIGNsb2NrIGNhbiBiZSBvYnRhaW5lZCBieSBh
ZG9wdGluZyBIQ0xLDQo+ID4gICBhcyBjbG9jayBzb3VyY2UgYW5kIHNldHRpbmcgU0NVMzEwWzMw
OjI4XSB0byAzYicxMTEuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGluLVRpbmcgS3VvIDxj
aGluLXRpbmdfa3VvQGFzcGVlZHRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2Nsay9j
bGstYXN0MjYwMC5jIHwgNjkNCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvY2xrLWFzdDI2MDAuYyBiL2Ry
aXZlcnMvY2xrL2Nsay1hc3QyNjAwLmMNCj4gPiBpbmRleCBiYzNiZTVmM2VhZTEuLmE2Nzc4YzE4
Mjc0YSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9jbGstYXN0MjYwMC5jDQo+ID4gKysr
IGIvZHJpdmVycy9jbGsvY2xrLWFzdDI2MDAuYw0KPiA+IEBAIC0xNjgsNiArMTY4LDMwIEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX2Rpdl90YWJsZSBhc3QyNjAwX2Rpdl90YWJsZVtdDQo+ID0g
ew0KPiA+ICAgICAgICAgeyAwIH0NCj4gPiAgfTsNCj4gPg0KPiA+ICtzdGF0aWMgY29uc3Qgc3Ry
dWN0IGNsa19kaXZfdGFibGUgYXN0MjYwMF9zZF9kaXZfYTFfdGFibGVbXSA9IHsNCj4gDQo+IExl
dCdzIHB1dCB0aGUgcmV2aXNpb24gbmV4dCB0byB0aGUgYXN0MjYwMCBsaWtlIHRoZSBvdGhlciB0
YWJsZXM6DQo+IA0KPiBhc3QyNjAwX2ExX3NkX2Rpdl90YWJsZQ0KPiANCj4gPiArICAgICAgIHsg
MHgwLCAyIH0sDQo+ID4gKyAgICAgICB7IDB4MSwgNCB9LA0KPiA+ICsgICAgICAgeyAweDIsIDYg
fSwNCj4gPiArICAgICAgIHsgMHgzLCA4IH0sDQo+ID4gKyAgICAgICB7IDB4NCwgMTAgfSwNCj4g
PiArICAgICAgIHsgMHg1LCAxMiB9LA0KPiA+ICsgICAgICAgeyAweDYsIDE0IH0sDQo+ID4gKyAg
ICAgICB7IDB4NywgMTYgfSwNCj4gPiArICAgICAgIHsgMCB9DQo+ID4gK307DQo+ID4gKw0KPiA+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19kaXZfdGFibGUgYXN0MjYwMF9zZF9kaXZfYTJfdGFi
bGVbXSA9IHsNCj4gDQoNCk9rYXksIHRoaXMgd2lsbCBiZSB1cGRhdGVkIGluIHRoZSBuZXh0IHBh
dGNoIHZlcnNpb24uDQoNCj4gRm9yIG5hbWluZzsgY2FuIEkgcHJvcG9zZSB3ZSBvbWl0IHRoZSBy
ZXZpc2lvbiBmb3IgdGhlIEEyL0EzKyBjYXNlPyBTbyB0aGlzDQo+IG9uZSB3b3VsZCBiZSBjYWxs
ZWQ6DQo+IA0KPiBhc3QyNjAwX3NkX2Rpdl90YWJsZQ0KPiANCg0KT2theSwgdGhpcyB3aWxsIGFs
c28gYmUgdXBkYXRlZCBpbiB0aGUgbmV4dCBwYXRjaCB2ZXJzaW9uLg0KDQo+ID4gKyAgICAgICB7
IDB4MCwgMiB9LA0KPiA+ICsgICAgICAgeyAweDEsIDQgfSwNCj4gPiArICAgICAgIHsgMHgyLCA2
IH0sDQo+ID4gKyAgICAgICB7IDB4MywgOCB9LA0KPiA+ICsgICAgICAgeyAweDQsIDEwIH0sDQo+
ID4gKyAgICAgICB7IDB4NSwgMTIgfSwNCj4gPiArICAgICAgIHsgMHg2LCAxNCB9LA0KPiA+ICsg
ICAgICAgeyAweDcsIDEgfSwNCj4gPiArICAgICAgIHsgMCB9DQo+ID4gK307DQo+ID4gKw0KPiA+
ICAvKiBGb3IgaHBsbC9kcGxsL2VwbGwvbXBsbCAqLw0KPiA+ICBzdGF0aWMgc3RydWN0IGNsa19o
dyAqYXN0MjYwMF9jYWxjX3BsbChjb25zdCBjaGFyICpuYW1lLCB1MzIgdmFsKSAgew0KPiA+IEBA
IC00MjQsNiArNDQ4LDExIEBAIHN0YXRpYyBjb25zdCBjaGFyICpjb25zdA0KPiBlbW1jX2V4dGNs
a19wYXJlbnRfbmFtZXNbXSA9IHsNCj4gPiAgICAgICAgICJtcGxsIiwNCj4gPiAgfTsNCj4gPg0K
PiA+ICtzdGF0aWMgY29uc3QgY2hhciAqY29uc3Qgc2RfZXh0Y2xrX3BhcmVudF9uYW1lc1tdID0g
ew0KPiA+ICsgICAgICAgImhjbGsiLA0KPiA+ICsgICAgICAgImFwbGwiLA0KPiA+ICt9Ow0KPiA+
ICsNCj4gPiAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCB2Y2xrX3BhcmVudF9uYW1lc1tdID0g
ew0KPiA+ICAgICAgICAgImRwbGwiLA0KPiA+ICAgICAgICAgImQxcGxsIiwNCj4gPiBAQCAtNTIz
LDE4ICs1NTIsNDIgQEAgc3RhdGljIGludCBhc3BlZWRfZzZfY2xrX3Byb2JlKHN0cnVjdA0KPiBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJS
KGh3KTsNCj4gPiAgICAgICAgIGFzcGVlZF9nNl9jbGtfZGF0YS0+aHdzW0FTUEVFRF9DTEtfRU1N
Q10gPSBodzsNCj4gPg0KPiA+IC0gICAgICAgLyogU0QvU0RJTyBjbG9jayBkaXZpZGVyIGFuZCBn
YXRlICovDQo+ID4gLSAgICAgICBodyA9IGNsa19od19yZWdpc3Rlcl9nYXRlKGRldiwgInNkX2V4
dGNsa19nYXRlIiwgImhwbGwiLCAwLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHNjdV9n
Nl9iYXNlICsgQVNQRUVEX0c2X0NMS19TRUxFQ1RJT040LA0KPiAzMSwgMCwNCj4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICAmYXNwZWVkX2c2X2Nsa19sb2NrKTsNCj4gPiArICAgICAgIGNsa19o
d19yZWdpc3Rlcl9maXhlZF9yYXRlKE5VTEwsICJoY2xrIiwgTlVMTCwgMCwgMjAwMDAwMDAwKTsN
Cj4gPiArDQo+ID4gKyAgICAgICByZWdtYXBfcmVhZChtYXAsIDB4MzEwLCAmdmFsKTsNCj4gDQo+
IFVzZSB0aGUgI2RlZmluZXMgZm9yIHRoZSByZWdpc3RlciBudW1iZXIuDQoNCk9rYXkuDQoNCj4g
DQo+ID4gKyAgICAgICBodyA9IGNsa19od19yZWdpc3Rlcl9tdXgoZGV2LCAic2RfZXh0Y2xrX211
eCIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2RfZXh0Y2xrX3BhcmVu
dF9uYW1lcywNCj4gPiArDQo+IEFSUkFZX1NJWkUoc2RfZXh0Y2xrX3BhcmVudF9uYW1lcyksIDAs
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2N1X2c2X2Jhc2UgKw0KPiBB
U1BFRURfRzZfQ0xLX1NFTEVDVElPTjQsIDgsIDEsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgMCwgJmFzcGVlZF9nNl9jbGtfbG9jayk7DQo+ID4gICAgICAgICBpZiAoSVNf
RVJSKGh3KSkNCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoaHcpOw0KPiA+IC0g
ICAgICAgaHcgPSBjbGtfaHdfcmVnaXN0ZXJfZGl2aWRlcl90YWJsZShkZXYsICJzZF9leHRjbGsi
LA0KPiAic2RfZXh0Y2xrX2dhdGUiLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIDAsIHNj
dV9nNl9iYXNlICsgQVNQRUVEX0c2X0NMS19TRUxFQ1RJT040LA0KPiAyOCwgMywgMCwNCj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICBhc3QyNjAwX2Rpdl90YWJsZSwNCj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAmYXNwZWVkX2c2X2Nsa19sb2NrKTsNCj4gPiArDQo+ID4gKyAgICAgICBo
dyA9IGNsa19od19yZWdpc3Rlcl9nYXRlKGRldiwgInNkX2V4dGNsa19nYXRlIiwgInNkX2V4dGNs
a19tdXgiLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLCBzY3VfZzZf
YmFzZSArDQo+IEFTUEVFRF9HNl9DTEtfU0VMRUNUSU9ONCwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMzEsIDAsICZhc3BlZWRfZzZfY2xrX2xvY2spOw0KPiA+ICAgICAg
ICAgaWYgKElTX0VSUihodykpDQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGh3
KTsNCj4gPiArDQo+ID4gKyAgICAgICByZWdtYXBfcmVhZChtYXAsIDB4MTQsICZ2YWwpOw0KPiA+
ICsgICAgICAgLyogQVNUMjYwMC1BMi9BMyBjbG9jayBkaXZpc29yIGlzIGRpZmZlcmVudCBmcm9t
IEFTVDI2MDAtQTEgKi8NCj4gPiArICAgICAgIGlmICgoKHZhbCAmIEdFTk1BU0soMjMsIDE2KSkg
Pj4gMTYpID49IDIpIHsNCj4gDQo+IEkndmUgZ290IGEgbGl0dGxlIHBhdGNoIHRoYXQgSSByZWNv
bW1lbmQgeW91IGJhc2UgeW91ciBzZXJpZXMgb24gKGZlZWwgZnJlZSB0bw0KPiBpbmNsdWRlIGl0
IGluIHlvdXIgc2VyaWVzIHdoZW4gcG9zdGluZyB2MiB0byBtYWtlIGl0DQo+IHNlbGYtY29udGFp
bmVkKToNCj4gDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIxMDkyMjIzNTQ0OS4y
MTM2MzEtMS1qb2VsQGptcy5pZC5hdS8NCj4gDQo+IFdpdGggdGhpcyBvbmUgeW91IGNhbiBkbzoN
Cj4gDQo+IGNvbnN0IHN0cnVjdCBjbGtfZGl2X3RhYmxlKiB0YWJsZTsNCj4gDQo+ICBpZiAoc29j
X3JldiA+PSAyKQ0KPiAgICB0YWJsZSA9IGFzdDI2MDBfc2RfZGl2X3RhYmxlOw0KPiBlbHNlDQo+
ICAgIHRhYmxlID0gYXN0MjYwMF9hMV9zZF9kaXZfdGFibGU7DQo+IA0KPiBUaGVuIHlvdSBkb24n
dCBuZWVkIHRvIGR1cGxpY2F0ZSB0aGUgcmVnaXN0cmF0aW9uIGZvciBlYWNoIGNhc2U6DQo+IA0K
PiAgICAgICAgICAgICAgICBodyA9IGNsa19od19yZWdpc3Rlcl9kaXZpZGVyX3RhYmxlKGRldiwg
InNkX2V4dGNsayIsDQo+ICJzZF9leHRjbGtfZ2F0ZSIsDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDAsIHNjdV9nNl9iYXNlICsNCj4gQVNQRUVEX0c2X0NMS19TRUxF
Q1RJT040LCAyOCwgMywgMCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdGFibGUsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZhc3Bl
ZWRfZzZfY2xrX2xvY2spOw0KPiAgICAgICAgICAgICAgICBpZiAoSVNfRVJSKGh3KSkNCj4gICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihodyk7DQo+IA0KDQpPa2F5LCBJIHdp
bGwgaW5jbHVkZSB5b3VyIHBhdGNoIGludG8gdGhpcyBwYXRjaCBzZXJpZXMgd2hlbiBwb3N0aW5n
IHYyLg0KDQo+ID4gKyAgICAgICAgICAgICAgIC8qIEFTVDI2MDAtQTIvQTMgKi8NCj4gPiArICAg
ICAgICAgICAgICAgaHcgPSBjbGtfaHdfcmVnaXN0ZXJfZGl2aWRlcl90YWJsZShkZXYsICJzZF9l
eHRjbGsiLA0KPiAic2RfZXh0Y2xrX2dhdGUiLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAwLCBzY3VfZzZfYmFzZSArDQo+IEFTUEVFRF9HNl9DTEtfU0VMRUNU
SU9ONCwgMjgsIDMsIDAsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGFzdDI2MDBfc2RfZGl2X2EyX3RhYmxlLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAmYXNwZWVkX2c2X2Nsa19sb2NrKTsNCj4gPiArICAgICAgICAgICAg
ICAgaWYgKElTX0VSUihodykpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFBU
Ul9FUlIoaHcpOw0KPiA+ICsgICAgICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAgICAgICAgLyog
QVNUMjYwMC1BMSAqLw0KPiA+ICsgICAgICAgICAgICAgICBodyA9IGNsa19od19yZWdpc3Rlcl9k
aXZpZGVyX3RhYmxlKGRldiwgInNkX2V4dGNsayIsDQo+ICJzZF9leHRjbGtfZ2F0ZSIsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAsIHNjdV9nNl9iYXNlICsN
Cj4gQVNQRUVEX0c2X0NMS19TRUxFQ1RJT040LCAyOCwgMywgMCwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYXN0MjYwMF9zZF9kaXZfYTFfdGFibGUsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZhc3BlZWRfZzZfY2xrX2xv
Y2spOw0KPiA+ICsgICAgICAgICAgICAgICBpZiAoSVNfRVJSKGh3KSkNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihodyk7DQo+ID4gKyAgICAgICB9DQo+ID4gICAg
ICAgICBhc3BlZWRfZzZfY2xrX2RhdGEtPmh3c1tBU1BFRURfQ0xLX1NESU9dID0gaHc7DQo+ID4N
Cj4gPiAgICAgICAgIC8qIE1BQzEvMiBSTUlJIDUwTUh6IFJDTEsgKi8NCj4gPiAtLQ0KPiA+IDIu
MTcuMQ0KPiA+DQo=
