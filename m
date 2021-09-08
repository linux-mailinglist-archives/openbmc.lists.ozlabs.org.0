Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4204036B8
	for <lists+openbmc@lfdr.de>; Wed,  8 Sep 2021 11:17:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4Gjn3CV5z2yNS
	for <lists+openbmc@lfdr.de>; Wed,  8 Sep 2021 19:17:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=o64CwNAl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.138;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=o64CwNAl; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320138.outbound.protection.outlook.com [40.107.132.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4Gj90TcSz2yHC;
 Wed,  8 Sep 2021 19:16:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8sVzFPgAY+tKKl3mFah9DooBD04xMh8zXumZUASGrDSCXyTQZkHGBf8KcSp+TqYk4JzSw2eOZFGVVjm7N8J8ITc8ZfxdThlfu2Y+df3M2kh14rptu+v8M83ctE+sXRhvSmq4kwHb7rxkMgwHa+RiuehZ+2y/8LTq2BVtU9tg3VjmZZDeOMcL4PrwIEuIjgux9ncTa8GNZqsKoA44biYIJImt4KRC3H/E2Rag9aN7YDr8f0/Rk1WtzCrWdF4U5uYirIQWGeMZYEAJl7QaEVyJtB7J59dt1ORf26Slz1X5Cv1ZrqQJ2OhmoNCVH+fPoDVYsKfTEE+lfOlI4Gw8Da04A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=R6fEQd2oLlzQvYXgPVrEjw+9Hxmidn2kYcK9XRrbOGY=;
 b=XphZu+dStSE19PAeEu4AKLVlLO2cZkb3S9WY5EG9CnB/XhZSGkkeVEYNB1zQqT2IFylsXyaucs/QdMHEO6l9QrSHxXjS7gseS10f3ZSAvfGFTWYlh1ZOq3Qnprs0RnxUNgHJuIJp5hDgOwISiRiX7xbp/J8S37otN1fk1EemXYzDrNtl1146s3+gKUWGmAGNZdWrxbzPXAdufkmJeUGtWkL8EQ3PmfC5tJjIuDe9lhn7Qze/LWX8oG4j6yJScJasvht3PzmEDW+/VHMgAOPfmTbFKpuY6kNIUtwtMdBlvh0EmSjVfiEJui+0GytcXKcccTj22iY6ky8oaFgQAauvRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6fEQd2oLlzQvYXgPVrEjw+9Hxmidn2kYcK9XRrbOGY=;
 b=o64CwNAl56+7Q45skASXTziBzWYFJBtfZ5bPYaaSRAqOTQAdtuhvvT5OjfN3CahQ6kG0XNMIbvwNiC4b4cuuM2tEArUECo/GpPDA2scMcHhm8PC06WgmTomv/QXNZu3BoXV11CaibWAvHrRDxdoUmEEQKWArgEAJfcjGTiu56Av76EUEOixsvcN/rhHVat9mZP1NHJ6YSEkbbQsbaG2RAfWSELnA44KDajcHArOfocumIKEqkTDRhR/0nyDU8+D1Doia8shgKuymr4+QYWv4mJkOk1ZFD34hYVmyGRhf6aBtcpBIFWQW1Jejo7ifbgB8E/glHL4qeg5zebGBn5Lvww==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK0PR06MB2209.apcprd06.prod.outlook.com (2603:1096:203:47::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Wed, 8 Sep
 2021 09:16:03 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62%3]) with mapi id 15.20.4457.026; Wed, 8 Sep 2021
 09:16:02 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 3/4] soc: aspeed: Add eSPI driver
Thread-Topic: [PATCH v4 3/4] soc: aspeed: Add eSPI driver
Thread-Index: AQHXnuHnLi9FHqbUxUOpf9SHGgAkS6uQF7yAgAAhRlCAABrbgIAF1b0AgAAz3gCAA0V20A==
Date: Wed, 8 Sep 2021 09:16:02 +0000
Message-ID: <HK0PR06MB377924CFCBFE9BD40E1C4A5D91D49@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210901033015.910-1-chiawei_wang@aspeedtech.com>
 <20210901033015.910-4-chiawei_wang@aspeedtech.com>
 <20c13b9bb023091758cac3a07fb4037b7d796578.camel@codeconstruct.com.au>
 <HK0PR06MB37792273A075533C2570002391CE9@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <513cb05f8d83d08a5c1e491dc0a9b6784195e7dd.camel@codeconstruct.com.au>
 <HK0PR06MB37799C48533B084CF864E49D91D29@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <6593206c0bc90186f255c6ea86339576576f70dc.camel@codeconstruct.com.au>
In-Reply-To: <6593206c0bc90186f255c6ea86339576576f70dc.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeconstruct.com.au; dkim=none (message not signed)
 header.d=none;codeconstruct.com.au; dmarc=none action=none
 header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6c27e82-991d-4328-5509-08d972a947d0
x-ms-traffictypediagnostic: HK0PR06MB2209:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB22095CC1CF5CDF04D10EAF3391D49@HK0PR06MB2209.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1gDm+C5Mr/ONDYzbHFuxBOF6Rgl/5vOg8/d2FiySKHwW4X7hmYwW2ukXl4Z8It4C+XLkF7EUWSkouNb+NsRoboCJ25Ym0IU37ZYYFxX9OmuyC3z2DfKj7eIE6PbJqe++rBHiqCKJ4INplpBquJPxbRfutTwpAUizqdHcz+nz3lKjruRpWbnqcw9GetCAvPZ3N4toMLwHkGYrV2D14CUBEuw19MX15gqZ6bVULvx8naBefGB4Dm+4s8ByMMO0N3PzX5OBJQusGVs93B+pPKaSfBN7lSqsl3Pym9Fg6K81naItQzzUman49/CfLw0raHihRWaohKQn959hr6jr8anv5Zr0ety+MJl+OfMNjoaOdi8Uv4U2EbfDQuv+gj3y6MqUcr/pixnLGdFWPFSDSmylVZR5xKtAHzEGsyA0iq70tUA3TDpRoy8d+EM6M8I/EWG50HnNz5LbX+zyC/KpLrJLwK+NG0VORD+E9APh0A/gGuL5YFC0QY3UNMHSKUtWtQGIhuQLI49uw45bLXs/P3KVsZ5GLkuv05aaWpKsAbkVjexD0PlMuNhDPxrav1aAvIFVKaUIv4Ukx16xZuZYPMhMaqcQ/pUQe4s9OfYDM+XNAfojYIcs6qCi2I5bxFMyEs5VAiQvg0VFCRHu5r++bYnKU1MWEqF6Q46T1V5fWJ1xm+LEDM3/XzGYXSpuyrCPI/LRH72hO0BtnQYORDrmWbR0Kw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(376002)(346002)(366004)(136003)(396003)(66446008)(64756008)(66556008)(5660300002)(6506007)(7696005)(2906002)(66476007)(76116006)(66946007)(4326008)(38070700005)(52536014)(83380400001)(122000001)(71200400001)(38100700002)(33656002)(186003)(55016002)(8936002)(8676002)(86362001)(9686003)(107886003)(316002)(478600001)(54906003)(110136005)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N05EL3RBZVRtSkNsRStrSVhYR0NkTjI2QzVWTEtsYi9DTXVJMWNJMGNLenVy?=
 =?utf-8?B?ZTFTYlpXc1pzUU5RRlpQOFowS2RGTjF3VnBjYzJBSXZCNGRock9tSm40cW1l?=
 =?utf-8?B?Y2FxNVhEeGdVVVhoejlhcDQzNjJ5STVsaGJlYm9HbUpDcy9FbVQ1RE0zbUFC?=
 =?utf-8?B?TDhhMURWMTNuZE81OVF1ejcyUTRQNk1qbWRPclRhdjFEVk8yZW9hd3NTc3JN?=
 =?utf-8?B?QlE2WkVjVXh1YksybFBUdkRrZHZVbUFaM0FUWlN3RUsyRkJNOFpZRVFudWJ5?=
 =?utf-8?B?VmpZN1YxRTYrTm1qeVFrazFxODArNlFsTHpSQkVhVmJXa1oxMzNmTW8zdmZY?=
 =?utf-8?B?S2pIaVZqQktwbHhibVZxeE1MU2VwVEFUTEU5TFhTU2dmeXZUNEJKREFld0sx?=
 =?utf-8?B?N1JXS1VMV0VGMExMQ2ZmNTNuRTFia2hCYkpyY0k0SUJPMXZnaTI4ZkJEeHdp?=
 =?utf-8?B?bDVrL1BaelN2Q2w2WHdFL09oUXVNRmRhWlY3UHZGR0NCTTVjWEtqeGVGcEMv?=
 =?utf-8?B?MWVHZ044SFpRZTNEQ3NHSFlPRHg4cU0vc21hU3k0ZW9IV1FoeTdrR2s3bGR1?=
 =?utf-8?B?UGtXWEZSQ25SUU45SHBBY0pwUEVoUFdjWHY1NmRHUXlrY2hDeEpaazBUK1Fh?=
 =?utf-8?B?aVMvV0hLRHVzbldXeGhtY1JYRGhWU2JKYTBGa1R5dkFJSTdVK1RFTy8xREpm?=
 =?utf-8?B?a3JFOXJUVEVoVlZDanhUSEtHdnMwR1RvNGxXT0Jkbzkxalo5Qi96K1dHSWhT?=
 =?utf-8?B?TEhOa3RwbTI2dEF4MHhGNE1kQWgrSkF6VElmTkNIaTBIdTdiSjhwUnQ5Y21n?=
 =?utf-8?B?eEx5b2lnVzV3MWdYRWUwM0dWR0FLUWlETERhRHdsbTJ6Vk1YbEpqNmkzVFdH?=
 =?utf-8?B?RGRKMVZmV2FWbHp1L205d3hqanpYc3pXMDgvVDFPQTRoOTlicGJFcmVyR2J2?=
 =?utf-8?B?OTdDRy9FeWZlOUU0VGJqWDE3ck81dmtLanhiU0t5ck01eDhoemFYcHk5clBT?=
 =?utf-8?B?NUlhU29PZlZickt3allJL0xCbWdHUThXV2M1NXo2OTV0bm1kWmV1V0lUYmlW?=
 =?utf-8?B?UmpUTngzWTJETjJObVFZNDZiRWN0d1dsMFdqam4zeUl1VEY5WkM3UURnRFRm?=
 =?utf-8?B?dUNOZTQyaUo5czZoRCtPR0VKV05sOWw4RSs5RzdsZGF1MXZJNFhmeU05K0Vj?=
 =?utf-8?B?RzNnRnVvR1BUaVh4TDcyK0Y4dmJ3QmFVZlQrR25uZW1xQ1VzMzNpK3IzblVl?=
 =?utf-8?B?c082NUdFU2RXY1FWZU9DQ0QvTUpqWjlxcEdkcEhqeEpIL2wxZE5VOUVsYWNo?=
 =?utf-8?B?cHFYNTlsK2I1Mmd2c21lbTh1aXlBNzkxZGh0TVArR01ma1BWVmhrVTJxNDZD?=
 =?utf-8?B?eFJZaWg4alYvM05IRitoYnZBbzJSNGpYMXhRbXIxUVZCbTZwYzN5c2J0NnIv?=
 =?utf-8?B?NmxVK3ZwdVlPcVJZUGtuM0lTYzJ1OWhZTG9PRUgzbUNHYWZtTjdIZWhIWllU?=
 =?utf-8?B?Q2tBSE1FeURnb1BiY0ZhVnhtVlc0WitrSzMwR0QyZW80eTgrVkhUbDdaU3VX?=
 =?utf-8?B?N2hIekhkbFVFN1l1b1BpWVcxQzRWVEVHUkU0eXpWZDRSWnZXRXRTc2twRGhL?=
 =?utf-8?B?dkpXallkWEljcUJHQk1uaTdXK3F0ckNueFVLRE1WTXU2VXQ2V29IRzNQTmVT?=
 =?utf-8?B?YjBuMWZkVk1FNmZzVXFCMFNsNlJNZFlWUXFHNE9ZbUw1ZGpnM3JUQXlKS05E?=
 =?utf-8?Q?y0LAvkHfK9kynZNZCANLYu3UBdnmCaBhhrp4xq3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c27e82-991d-4328-5509-08d972a947d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2021 09:16:02.7042 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7rQp7axwPRj8wltFLs9EZKzQQpbLbeKUVE5jhT+ejcw+j725Iji3IRm7ggedopfSKpn7XAdRehAxYSMLkoMgnilsQ02MUK2dRWCITvFkF+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2209
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
Cc: Morris Mao <morris_mao@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSmVyZW15LA0KDQo+IEZyb206IEplcmVteSBLZXJyIDxqa0Bjb2RlY29uc3RydWN0LmNvbS5h
dT4NCj4gU2VudDogTW9uZGF5LCBTZXB0ZW1iZXIgNiwgMjAyMSAxMToxNyBBTQ0KPiANCj4gSGkg
Q2hpYXdlaSwNCj4gDQo+ID4gPiBJZiB0aGF0IG1vZGVsIGRvZXNuJ3QgZml0IHRob3VnaCwgdGhh
dCdzIE9LLCBidXQgSSB0aGluayB3ZSBuZWVkDQo+ID4gPiBzb21lIHJhdGlvbmFsZSB0aGVyZS4N
Cj4gPg0KPiA+IEFmdGVyIGFuIGludGVybmFsIGRpc2N1c3Npb24sIHdlIGZvdW5kIHRoYXQgb3Vy
IGVTUEkgVlcgZGV2aWNlIG1heSBub3QNCj4gPiBmaXQgaW50byBleGlzdGluZyBHUElPIG1vZGVs
Lg0KPiA+DQo+ID4gVGhlIHJlYXNvbiBpcyB0aGF0IEdQSU8gZGlyZWN0aW9uIGNoYW5nZXMgdGhy
b3VnaCBWVyBjaGFubmVsIGhhcyBubw0KPiA+IGludGVycnVwdHMgdHJpZ2dlcmVkLg0KPiA+IEFu
ZCB0aGUgZGlyZWN0aW9uIGlzIGNvbnRyb2xsZWQgYnkgdGhlIEhvc3QgYXMgYWZvcmVtZW50aW9u
ZWQuDQo+IA0KPiBUaGlzIHBpcXVlZCBteSBjdXJpb3NpdHksIHNvIEkgaGFkIGEgbG9vayB0aHJv
dWdoIHRoZSAyNTAwIGRhdGFzaGVldC4gSXQgYXBwZWFycw0KPiB0aGF0IHRoZSBob3N0IGhhcyBm
dWxsIGNvbnRyb2wgb2YgYm90aCB0aGUgZGlyZWN0aW9uICphbmQqIGhhcmR3YXJlIEdQSU8NCj4g
YXNzaWdubWVudCB0aG91Z2ggdGhlIHBsYXRmb3JtLXNwZWNpZmljIGVTUEkgY29uZmlndXJhdGlv
biByZWdpc3RlciBzZXQuDQo+IA0KPiBTbywgd2l0aCBWVyBHUElPcyBpbiBoYXJkd2FyZSBtb2Rl
IChFU1BJQ1RSTFs5XSA9IDAsIHRoZSBkZWZhdWx0KSwgdGhlIGhvc3QNCj4gaGFzIGFyYml0cmFy
eSBjb250cm9sIG9mIGFsbCBoYXJkd2FyZSBHUElPIGxpbmVzIChleGNlcHQgZm9yIHRoZSBHUElP
QUMgYmFuaywgSQ0KPiBndWVzcz8pLg0KPiANCj4gVGhlcmUncyBhIGh1Z2Ugc2VjdXJpdHkgaW1w
bGljYXRpb24gdGhlcmUgLSBmb3IgZXhhbXBsZSwgR1BJT3MgdGhhdCBhc3NlcnQNCj4gcGh5c2lj
YWwgcHJlc2VuY2UgY2FuIG5vdyBiZSBzZXQgYnkgdGhlIGhvc3QsIHBvc3NpYmx5IHJlbW90ZWx5
IC0gc28gSSdkDQo+ICpzdHJvbmdseSogcmVjb21tZW5kIHRoYXQgd2UgYWx3YXlzIGdldCBFU1BJ
Q1RSTFs5XSB0byAxLCB0byBzZXQNCj4gc29mdHdhcmUtb25seSBtb2RlLg0KDQpZZXMsIHRoZXJl
IGlzIHNlY3VyaXR5IGNvbmNlcm4gdXNpbmcgSFcgbW9kZS4NCk91ciBkZXNpZ25lciBpcyBjb25z
aWRlcmluZyB0byByZW1vdmUgdGhlIEhXIG1vZGUgc3VwcG9ydCBpbiB0aGUgbmV4dCBnZW5lcmF0
aW9uIG9mIEFzcGVlZCBTb0NzLg0KU28gZmFyIHdlIGhhdmVuJ3QgZW5jb3VudGVyZWQgYSBzY2Vu
YXJpbyBkZW1hbmRpbmcgSFcgbW9kZS4NCg0KPiANCj4gV2l0aCB0aGFuIGluIG1pbmQsIGlmIHdl
J3JlIGRpc2FibGluZyBoYXJkd2FyZSBtb2RlIC0gd2hhdCBkb2VzIHRoZSBkaXJlY3Rpb24NCj4g
Y29udHJvbCBzZXR0aW5nIGVmZmVjdCB3aGVuIHdlJ3JlIGluIHNvZnR3YXJlIG1vZGUgKEVTUElD
VFJMWzldID09IDEpPyBEb2VzIGl0DQo+IGV2ZW4gbWF0dGVyPw0KDQpZZXMsIHRoZSBkaXJlY3Rp
b24gbWF0dGVycyBldmVuIGluIFNXIG1vZGUuDQpXaGVuIHRoZSBkaXJlY3Rpb24gaXMgJ21hc3Rl
ci10by1zbGF2ZScgYW5kIHRoZSBHUElPIHZhbHVlIGlzIHVwZGF0ZWQgYnkgdGhlIEhvc3QgdGhy
b3VnaCBQVVRfVlcsIGEgVlcgaW50ZXJydXB0IGlzIHRyaWdnZXIgdG8gbm90aWZ5IEJNQy4NCkZv
ciB0aGUgJ3NsYXZlLXRvLW1hc3RlcicgR1BJTywgYSBhbGVydCBpcyBnZW5lcmF0ZWQgdG8gbm90
aWZ5IHRoZSBIb3N0IHRvIGlzc3VlIEdFVF9WVyBmb3IgdGhlIEdQSU8gdmFsdWUgdXBkYXRlZCBi
eSB0aGUgQk1DIGJ5IEVTUEkwOUMuDQoNCj4gDQo+IEZvciBleGFtcGxlLCB3aGF0IGhhcHBlbnMg
d2hlbiB0aGUgaG9zdCBnb2VzIGEgR0VUX1ZXIGN5Y2xlIGZvciBhIEdQSU8NCj4gdGhhdCBpcyBt
YXJrZWQgYXMgJ21hc3Rlci10by1zbGF2ZScgbW9kZT8gSXMgdGhlIHN0YXRlIG9mIHRoZSBHUElP
IGluIEVTUEkwOUMNCj4gc3RpbGwgcmVwb3J0ZWQ/DQoNClRoZSBIb3N0IGNhbiBvbmx5IGlzc3Vl
IEdFVF9WVyB3aGVuIEJNQyB1cGRhdGUgb25lIG9mIHRoZSAnc2xhdmUtdG8tbWFzdGVyJyBHUElP
IHBpbnMgYW5kIGhhdmUgZVNQSSBzdGF0dXMgVldfQVZBSUwgc2V0Lg0KQW5kIHRoZSBlU1BJIHNs
YXZlIHdpbGwgbm90IHJlcG9ydCB0aGUgdmFsdWUgb2YgR1BJTyBtYXJrZWQgYXMgJ21hc3Rlci10
by1zbGF2ZScuDQoNCj4gDQo+IElmIHRoYXQncyB0aGUgY2FzZSwgdGhlbiB3ZSBjYW4ganVzdCBp
Z25vcmUgdGhlIGRpcmVjdGlvbiBzZXR0aW5ncyBmcm9tDQo+IEVTUElDRkc4MDAgY29tcGxldGVs
eSwgYW5kIGhhdmUgdGhlIEJNQyBhc3NpZ24gZGlyZWN0aW9ucyB0byBzdGFuZGFyZA0KPiBncGlv
ZGV2cyBhcyBhcHByb3ByaWF0ZS4NCg0KSWYgdGhlIGRpcmVjdGlvbiBzZXR0aW5nIGZyb20gdGhl
IEhvc3QgaXMgaWdub3JlZCwgdGhlIHByZXNlbnRlZCB2aXJ0dWFsIEdQSU8gZG9lcyBub3QgcmVm
bGVjdCB0aGUgY29ycmVjdCBzdGF0ZS4NClBsdXMgdGhhdCB0aGUgZGlyZWN0aW9uIGNoYW5nZSBm
cm9tIHRoZSBIb3N0IGhhcyBubyBpbnRlcnJ1cHQgdG8gbm90aWZ5IEJNQy4NCk15IGNvbmNlcm4g
aXMgdGhhdCBpZiB0aGUgZ3Bpb2RldnMgd2F5IHdvcmtzIHBhcnRpYWxseSwgdGhlbiBpdCBzaG91
bGQgbm90IGJlIGFkb3B0ZWQgdG8gYXZvaWQgY29uZnVzaW5nIHVzZXJzLg0KDQo+IA0KPiBTZXBh
cmF0ZSBmcm9tIHRoaXM6IEknbSBhbHNvIHByb3Bvc2luZyB0aGF0IHdlIHJlcHJlc2VudCB0aGUg
c3lzdGVtIGV2ZW50IFZXcw0KPiBhcyBncGlvZGV2cyBhcyB3ZWxsLg0KPiANCj4gPiBBIHJhdyBw
YWNrZXQsIHByaW1pdGl2ZSBpbnRlcmZhY2Ugc2hvdWxkIGhhdmUgYmV0dGVyIGZsZXhpYmlsaXR5
IHRvDQo+ID4gbWFuYWdlIE1DVFAgcGFja2V0cyBvdmVyIHRoZSBPT0IgY2hhbm5lbC4NCj4gDQo+
IE9LLCBsZXQgbWUgcGhyYXNlIHRoaXMgZGlmZmVyZW50bHk6IGNhbiB0aGUgT09CIGNoYW5uZWwg
YmUgdXNlZCBmb3IgYW55dGhpbmcNCj4gb3RoZXIgdGhhbiBTTUJ1cyBtZXNzYWdpbmc/IElzIGl0
IHVzZWZ1bCB0byBwcm92aWRlIGFuIGludGVyZmFjZSB0aGF0IGlzbid0IGENCj4gc3RhbmRhcmQg
U01CdXMvaTJjIGRldmljZT8NCg0KWWVzLCB0aGUgUENIIHNwZWMuIGFsc28gZGVmaW5lcyB0d28g
YWRkaXRpb25hbCBwYWNrZXQgZm9ybWF0IGZvciBhbiBlU1BJIHNsYXZlIHRvIHJldHJpZXZlIFBD
SCBUZW1wZXJhdHVyZSBEYXRhIGFuZCBSVEMgdGltZS4NCkl0IHNob3VsZCBiZSB0cml2aWFsIHRv
IHByZXBhcmUgYSBieXRlIGJ1ZmZlciBpbiB0aGF0IGZvcm1hdCBhbmQgc2VuZCBpdCB0aHJvdWdo
IHRoZSByYXcgcGFja2V0IGludGVyZmFjZS4NCkFzcGVlZCBhbHNvIGhhdmUgZGVtbyBBUFBzIGRl
c2NyaWJlZCBpbiB0aGUgaGVhZGVyIGNvbW1lbnQuDQoNCj4gDQo+IElmIHlvdSBuZWVkIGN1c3Rv
bSB1YXBpIGRlZmluaXRpb25zIGZvciB0aGlzIGRyaXZlciwgdGhhdCBtaWdodCBiZSBva2F5LCBi
dXQgaXQncw0KPiBnb2luZyB0byBiZSBtb3JlIHdvcmsgZm9yIHlvdSAodG8gZGVmaW5lIGFuIGlu
dGVyZmFjZSB0aGF0IGNhbiBiZSBzdXBwb3J0ZWQNCj4gbG9uZy10ZXJtKSwgcmF0aGVyIHRoYW4g
dXNpbmcgc3RhbmRhcmQgaW5mcmFzdHJ1Y3R1cmUgdGhhdCBhbHJlYWR5IGV4aXN0cy4NCg0KVGh1
cyBJIHN1Z2dlc3RlZCB0aGF0IHdlIGNhbiByZWZlciB0byB0aGUgSVBNSSBLQ1MgQk1DIGRyaXZl
ciwgd2hpY2ggc3VwcG9ydHMgdGhlIHNlbGVjdGlvbiBvZiBkaWZmZXJlbnQgdXNlciBpbnRlcmZh
Y2VzLCBSQVcgb3IgSVBNSS4NCklmIGFueSBvdGhlciBpbnRlcmZhY2UgaXMgbmVlZGVkIGFmdGVy
d2FyZCwgdGhlIGRyaXZlciBjYW4gYmUgZW5oYW5jZWQgaW4gdGhhdCBmYXNoaW9uLg0KV2hpbGUg
dGhlIGVTUEkgcmF3IHBhY2tldCBUWC9SWCBoYW5kbGluZyBpcyBwcmVzZXJ2ZWQgYXMgdGhlIHBy
aW1pdGl2ZSBvcGVyYXRpb25zLg0KDQpJZiBJT0NUTCBpcyBjb25zaWRlcmVkIHRvIGJlIG5vdCB1
c2VyIGZyaWVuZGx5IG9yIG1hZ2ljIGNvZGUgcG9sbHV0aW5nLCBmaWxlLWJhc2VkIHJlYWQvd3Jp
dGUgb24gdGhlIG1pc2NkZXZpY2Ugbm9kZSBpcyBhbHNvIGFuIG9wdGlvbi4NCg==
