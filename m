Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A853E3FD441
	for <lists+openbmc@lfdr.de>; Wed,  1 Sep 2021 09:10:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzwFG45p6z2yJW
	for <lists+openbmc@lfdr.de>; Wed,  1 Sep 2021 17:10:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=A/a0c68k;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.104;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=A/a0c68k; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320104.outbound.protection.outlook.com [40.107.132.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzwDb71S8z2xYC;
 Wed,  1 Sep 2021 17:10:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bu/fhyeHMV6TvNQ6vSu7Lr2b3EktOJlA2JpX+gSwRtasbyFqcrDxp9y1K9543SutxegZbMj6bSFB/YqBslmW11bWnDfFA7qPQqIscUju/t4kBUHLl2QmbGaQornTa8ggsD7+DNOuoc2oRJLjZ5zWvyNFcqPBMbDTR6Wj50b1j98ZpNXICTlMNMu/1hd97MSYqjFE3pNACcVEYb6FiP3LKW9BeCZAmJR91k4WPZIg/ZtvrTW+eTRdBLE683/pv8kKL3/ZhsKaNW+HrjFWOS0MYOzDcMqzitwhwd7+VBOsipfVW1y4qyWv73fTfOLJ8TVLazS7l+zsEExCUEP5rbuEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9VL9lbmNet5ZlExhRyj/BifmT3ykC1NZsPHb6bhrUI=;
 b=KDh2Pqc9AdBv+bmTfMY5nHxpQCsNkfUx5xMq6aDwiVs/072CYH0WU7Vve07HbVgKyFmSW6ZLSNHvA6BjqDVCdvwCkdSh3t+Sgyn/VggNuhWpMUnajTrIZBwKuIX56VSoWfSgDlbexZkAOn4pTmpw3Uad0BIImJ7wMNKXKSum0PTiM5DcMJtwDKluc4D2niB5wuHn4OccnAZ04OFvdDzFWYcro1qqopKjJhZ7v9ZynyiCKi8DVFRXrS4x80ft7MhWvGDkZHmxOErqjt2MVaD93NmFkA5wVPQIiH5IC1C1w3aCgQu1hUPq6YOgearGWyC6VTtQ/V0WyyoQpJZg69cZoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9VL9lbmNet5ZlExhRyj/BifmT3ykC1NZsPHb6bhrUI=;
 b=A/a0c68kxTVThb8NoKtsXM5OwUy5IHMQjbXn6yUcVipUkvMrjdg8731UuRD+ewb7Q+ERl3VZLuAxn2rc10lIpOlv5BcYiCMgppe5dJ7Hp/4vOBQLnuL4r9yxz5T2Jp2GkIGZg5oGM8bJVLnrB1p+b3+Rpn5E9bbCkS14RTTIqzCyY5nzZdri7ppmJbROz9ZS7zgMnbzJBpex52SjIT14Wz8gdzwNWY2oLJ7SXuXZPNYgccPlzVazeVNxkwMGgawXQDUsGZYtcKIA5EF81nxAVNqFMuvfRNC8NF1rs0aspsCXkUy+HtSdsqKk+xT187RWzPQaPMZIckTnTfzQZyjIrA==
Received: from KL1PR0601MB3781.apcprd06.prod.outlook.com
 (2603:1096:820:11::14) by KL1PR0601MB3829.apcprd06.prod.outlook.com
 (2603:1096:820:19::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Wed, 1 Sep
 2021 07:09:46 +0000
Received: from KL1PR0601MB3781.apcprd06.prod.outlook.com
 ([fe80::7c94:f1d7:7cc:5da2]) by KL1PR0601MB3781.apcprd06.prod.outlook.com
 ([fe80::7c94:f1d7:7cc:5da2%3]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 07:09:46 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, John Wang <wangzhiqiang.bj@bytedance.com>, 
 Lei YU <yulei.sh@bytedance.com>
Subject: RE: [PATCH 0/2] arm: aspeed: Add LPC uart routing support
Thread-Topic: [PATCH 0/2] arm: aspeed: Add LPC uart routing support
Thread-Index: AQHXnvnvJt1quWOa206kT6fZPr2rrquOwRYAgAAAkgA=
Date: Wed, 1 Sep 2021 07:09:46 +0000
Message-ID: <KL1PR0601MB37810C5AB662895C0C716C8391CD9@KL1PR0601MB3781.apcprd06.prod.outlook.com>
References: <20210901062216.32675-1-chiawei_wang@aspeedtech.com>
 <CACPK8XfeU0+w03fgYxXVMVYOW-2woXQtUZ4FEDri3MSe+80_Wg@mail.gmail.com>
In-Reply-To: <CACPK8XfeU0+w03fgYxXVMVYOW-2woXQtUZ4FEDri3MSe+80_Wg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6921d5b2-d7a5-41db-21a1-08d96d177b28
x-ms-traffictypediagnostic: KL1PR0601MB3829:
x-microsoft-antispam-prvs: <KL1PR0601MB3829FC0C8469D75B4EDA185A91CD9@KL1PR0601MB3829.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zVGucEPA001thiCtApNkirJKNpb6aK2j4d7FHo2WwayS9Un/FNXb0w+oeOFBCDz1eQPxQ+lVseycIxlu6X7fY+Qt8gTUlxEO8elmzJ4vVvX93otxieReE+vjfwb3nYOibaF7KuP9xmqSY3x2YTj/x3qns2oNU0nnzT/eZokK36Gx14hOykLknNayCOSEqS1PjJT83L5l2rnfY/3rN3ZMgRKoE49HRjFyaPSHdC547r9TqdMInNBSUdd626t2Ps8zDeyK2RSeVLPStMKxoNoOAWXgGokeNrK/gCF7InbaaudjQL4fUMGvKfgoI6tG5ipzcqHPrqrke7vuzTvGJTIzL/43VNLIcYcAQs6qOVVPD4UjshY87w9EX+oICuR5GW/OEqdWMnJLS4/uiQvBstze1FR+0SFhNXdt14fZN2cb2Pv+47XHswPhyJalvu2qS4341x+7dhPlJfQ2Ev+RtFGKdaYbZYIieeBxMtEIZZbG1zuDyK+lvQUeB17kSYYKEDOiRDHiWlBZrawsKT3LYbJf80g+TTCya86lG80edZoEj77nTSciJIBJc3xIvDlYXOqE9HwKP9Bl2penmqtMgj8AFfJSF1wPusx7JSdFud47Yi7pVapHOENXZAuCKyoFy2XHMn0KJthNG7+b1lCAvxXg2rR5Kjzg3uSynfvBlDFx3l9sWVzL2peoSf8TCOjd9K0grQ95wHHCJOfjHRNai1I2fA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB3781.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39840400004)(366004)(396003)(346002)(376002)(64756008)(38100700002)(83380400001)(55016002)(38070700005)(66476007)(66446008)(71200400001)(186003)(7416002)(4744005)(76116006)(66556008)(66946007)(5660300002)(52536014)(4326008)(122000001)(316002)(6506007)(8936002)(508600001)(86362001)(26005)(33656002)(8676002)(7696005)(9686003)(110136005)(54906003)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTZ4bkJuaHQxSE5RTmZGOTFPTFBrekl2a0xZU2FNMWp2QzhKOWV6U1o2OUwv?=
 =?utf-8?B?OHVQa0FCZTlOUytuaDhYYWNSYldZT2p5eUxRZldwY092ZERNU1N3NWRrMEZ3?=
 =?utf-8?B?VWk0TmNrbVdyZHZZb2ViYmpUN0dnN0NNdUtaUFEwL2gwWWZQaHZmazVwYmJH?=
 =?utf-8?B?VFJXaE94WldJK1hJQVRDY1dLR3NVbytNTGEyR1Q1T0Eyb055dW5PRGxCNnZl?=
 =?utf-8?B?VzJBYUIzRmQ0NDI2MG4wVlhrODNCNWRQU3RXNU1xK3RNT2dCc3BwVTV4QXkz?=
 =?utf-8?B?TEpMM21XTGZzWWc0b3A4cEV6aWNFcmFZbU4yKzBaRWVMTjYrNUU0R0h3WXJB?=
 =?utf-8?B?SWdHRVFrNkVkVGErOHRhU3ArSE9KY3N4bUFrdnJPbzRKNldNWU9ac1M2WGla?=
 =?utf-8?B?WWpkYnMzUGVzR1QyMUhGUmdKQ1FtL093bUExdFJSdkZ2NEdWcC9jOUhtMjlV?=
 =?utf-8?B?aGhUcTZYS3lWVWdJN1hFb25nRk1zdWM3WWRlRHp3MGxvQkNUTUtZNUtLNkli?=
 =?utf-8?B?MmE1UXI4ZWhrb051N0dWUGlINkdvelJHdzBkei9PV3pzcExma1d3ckdkbzJN?=
 =?utf-8?B?L0Q4Y2R6Q0tPNjRGZnZhenlwOTRma1EwUXUzYndzUEtWWVpLT2hWVEJyVm5C?=
 =?utf-8?B?L1RMRmpQalozVjZ5bmVhdWwwMVpYcU9wNEJ2VHlzYkFqaDBtRUhmSnJ0ZEJp?=
 =?utf-8?B?eEN1T1luVTJDK09PVStGUXhVV0Y2S0RkQmNhdXdqRFUxS1FUb2tmWFlaSEdv?=
 =?utf-8?B?ZXhCb3pxV2x1QXY3T2Q0Q2JUYnZUWjFTeDB3S1VYNlVYd3VUeWQxZG1hbUsz?=
 =?utf-8?B?cWZnV3BFUy95RXZFbThhNFBlSHZ4VU5jSHJpUEZLbCs3VkF5bzNJeWJBa1VW?=
 =?utf-8?B?S1RoVUZCYk50c1BBQVVlNnpkd0hNUEtMY0JZNEpFWDFtalkyeWJFaTBPakNz?=
 =?utf-8?B?UUh5cnUxSnpSRUdlV2tXNm41VXoxT3VwdnRxTjlDaWRWWmVCRi9XRS9ROUZM?=
 =?utf-8?B?cS9ObWhJcGQxTGppQ1g4UUZKbGhtQURjUGFFTnkycjhzREFnSTJqTmVKeHQz?=
 =?utf-8?B?RGlabTh5SHhJcTlXcEJyMHo0alJ0V1VhMTdJcE9ObXQwaHVrQ01GNmNDU2V0?=
 =?utf-8?B?NXlET1BZOEhhVldMT0E5dnBCWkRkdnZVeFNPSUUyUEt3RjIySStuQkFlMVFm?=
 =?utf-8?B?NVJSWDhRUUdhMUx4dmZSVWJDekE4T0ovTVhydzVkb2xJSzM2VnN4S25NL1Bm?=
 =?utf-8?B?V1huenBEUEhPSEtCR2daMDVUN1M3S0FUL3NPWllqV1ZxRVQ5Um1QVTBHc0Vl?=
 =?utf-8?B?dmxMZC9SaTlROGZGNkluZGZlRWxhOGcwYTRTRVYxVWlOVEc5bC81SDZ0Wmdn?=
 =?utf-8?B?Z3hydnJxQ01reFpSTWM2ZEx6SVhmUXEza3J6WjFZTEJKMVlRTm5Sb0c5YnFo?=
 =?utf-8?B?V1ZnRTIwT0VCSlA2d3JxSW1CWHpFckZ0ZTRTLzBRcDFXWU9XT0dOV1hJU1lT?=
 =?utf-8?B?NkZIQnVPMGJSMkR4SGtuclVyMy9XNkpSbGNJcXk3L1JZTURkTTVnMkRXS2pC?=
 =?utf-8?B?Qi9JT1QvVVF2WG1ZNDUvNlhNWHYwODVicTErekFIYm1rUnJDaWNBaTVENTdv?=
 =?utf-8?B?aU5WUkthN21WR0gwdVJvc2h1Tld5aGNJMWRBditHWndDWUE3d1ZCQ0d1c1JB?=
 =?utf-8?B?RXU5MDdsN3VUWDBwQzJkYkZVV3d0bEc2MUoxWnZOcDF0QUErdEZRSlRkbU1u?=
 =?utf-8?Q?gKrYDGFb+7iMkjm6W53NZCPLUT3b2/HA1rVHKnk?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB3781.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6921d5b2-d7a5-41db-21a1-08d96d177b28
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 07:09:46.5639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SaD3ZekqiyiO3jYM/TGlDwdmdEhSt86fHMEMuHvJSSkEvR6dUYJ9XsObEkM1zBiItCNsxgnD+DtzZXw6otHrrYsBXYEmWnUulrkDkh8YLXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3829
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

SGkgSm9lbCwNCg0KPiBGcm9tOiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pg0KPiBTZW50
OiBXZWRuZXNkYXksIFNlcHRlbWJlciAxLCAyMDIxIDM6MDQgUE0NCj4gDQo+IE9uIFdlZCwgMSBT
ZXB0IDIwMjEgYXQgMDY6MjIsIENoaWEtV2VpIFdhbmcNCj4gPGNoaWF3ZWlfd2FuZ0Bhc3BlZWR0
ZWNoLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBBZGQgTFBDIHVhcnQgcm91dGluZyBkcml2ZXIgYW5k
IHRoZSBkZXZpY2UgdHJlZSBub2Rlcy4NCj4gDQo+IFRoYW5rcyBmb3Igc3VibWl0dGluZyB0aGlz
IGRyaXZlci4gVGhlcmUgYXJlIG1hbnkgcGFydGllcyB3aG8gYXJlIGludGVyZXN0ZWQgaW4NCj4g
dGhpcywgc28gaG9wZWZ1bGx5IHRoZXkgY2FuIHN0ZXAgZm9yd2FyZCBhbmQgcmV2aWV3Lg0KPiAN
Cj4gSXMgdGhpcyBMUEMgVUFSVCByb3V0aW5nLCBvciBVQVJUIHJvdXRpbmcgaW4gZ2VuZXJhbD8g
SSBrbm93IHRoZSByZWdpc3RlciB0bw0KPiBjb250cm9sIHRoZSByb3V0aW5nIGlzIGhpZGRlbiBp
biB0aGUgTFBDIHNwYWNlLCBidXQgSSB0aG91Z2h0IGl0IHdhcyBqdXN0IGdlbmVyYWwNCj4gcm91
dGluZy4gSSB3b3VsZCBkcm9wIHRoZSBMUEMgcGFydCBvZiB0aGUgbmFtZS4NCj4gDQo+IFlvdSBh
bHNvIG5lZWQgdG8gdXBkYXRlIHRoZSBiaW5kaW5ncyBkb2N1bWVudCB3aXRoIHRoZSBuZXcgY29t
cGF0aWJsZSBzdHJpbmcuDQo+IFNlbmQgYSBwYXRjaCBmb3IgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21mZC9hc3BlZWQtbHBjLnR4dC4NCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJh
Y2suDQoNClRoZSBVQVJUIHJvdXRpbmcgaXMgZ2VuZXJhbC4NCkkgd2lsbCBzZW5kIGEgdjIgcGF0
Y2ggd2hpY2ggZHJvcHMgdGhlIExQQyBwYXJ0IG9mIG5hbWUuDQpBbmQgdGhlIGNvbXBhdGlibGUg
c3RyaW5nIHdpbGwgYWxzbyBiZSB1cGRhdGVkIHRvIHRoZSBkdC1iaW5kaW5ncy4NCg0KQ2hpYXdl
aQ0K
