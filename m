Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7785CDF749
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2019 23:06:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xq1s64m2zDqDl
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 08:06:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axentia.se (client-ip=40.107.4.99;
 helo=eur03-db5-obe.outbound.protection.outlook.com;
 envelope-from=peda@axentia.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" (0-bit key;
 unprotected) header.d=axentia.se header.i=@axentia.se header.b="JijF89Je"; 
 dkim-atps=neutral
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40099.outbound.protection.outlook.com [40.107.4.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xq0z4034zDqGn;
 Tue, 22 Oct 2019 08:05:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5VYTA21ulp2UzWB0dTDrfOlTouBelHWE6uFZF7hev1bDCoAu+ydmzmwRAMj5n3BiRvuIsvWD7JD+C/1W+7071NnJ5vHUoS6oq026tbndVARmLWv0gHluK2qh8S+pOAQpRDa9ou/TvEo58AddbZ3r0hklHndA2GXIKOIsYTJ0VlLuzvnMEcRmKl7Nqh8Pu8uMxuaFiTsxzy1JkpOBX7LwRdi9RbeSnQspPYDjLTzbRQU6ZSeiU1GckC8qyfAWiA5ByZiH0m2SYR/4yYCUjYoYeLRTKfem9qw56eFAOcGZOH5vsMkMGl3uNCcgdmNUUVXIxMZmXe88DegURT7Td68zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y07oKaaqKSnHSZU7ZErPJ0lOSrDEhxx/ej7WX712aP4=;
 b=XVz04L97rzkWK5Lr9m6vbvVJiLkypb+h5ZEec4S8SIBDWHYa40v6bpBtjKnh9x5kVwYybqYXsM49NOcc/ose1gtbvI+N9LJdtI9HpvN6Wej9U/riF0iSwq9ibureeTPTiO8bfwmIKItYkpGsCJf5P38fpxkz/eDeeoju4mFb0cEsOYhpbFrBIzRjwN2sJZTKiZwrXfXxq2QMFF/f8ebgZAXaz3cHVebhNpNiNYNosBNkQ4JBtgxenwYiKWWEsD2CtvFLFsZIfbi89hSYZ4t3xZ5MJkbFnmjTCy5+x6QyoQzai6eyOszoESC/VJ/yRVV1R2fS1Yb50kx8P4htGgHmQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y07oKaaqKSnHSZU7ZErPJ0lOSrDEhxx/ej7WX712aP4=;
 b=JijF89Je7rBmLGn2k9hrYcRZkb6BUZu7RBFmv3S/K1JaIbTzLGzf5X6ioijuskJTLmxvKFg9bKQtosEmWKiyaB85tYrEo9z9KMorMQVdjazygY8VzFJcREkqSfzsSDAT73NwXhnrHuM/1QEImLAJR840+tI+xirZybjkP3xmJoI=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3513.eurprd02.prod.outlook.com (52.134.68.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Mon, 21 Oct 2019 21:05:30 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe%7]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 21:05:30 +0000
From: Peter Rosin <peda@axentia.se>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Wolfram Sang <wsa@the-dreams.de>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew
 Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>, Cedric Le Goater
 <clg@kaod.org>
Subject: Re: [PATCH i2c-next 1/2] dt-bindings: i2c: aspeed: add hardware
 timeout support
Thread-Topic: [PATCH i2c-next 1/2] dt-bindings: i2c: aspeed: add hardware
 timeout support
Thread-Index: AQHViE2KU5aZojIjkUqCdR4ab3gQm6dlleoA
Date: Mon, 21 Oct 2019 21:05:30 +0000
Message-ID: <0a629f7b-b829-c332-27d8-dc825205ff72@axentia.se>
References: <20191021202414.17484-1-jae.hyun.yoo@linux.intel.com>
 <20191021202414.17484-2-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20191021202414.17484-2-jae.hyun.yoo@linux.intel.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR05CA0367.eurprd05.prod.outlook.com
 (2603:10a6:7:94::26) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91d0eb2c-01b2-461a-2091-08d7566a67be
x-ms-traffictypediagnostic: DB3PR0202MB3513:
x-microsoft-antispam-prvs: <DB3PR0202MB3513DAFA5FCC7AD4146097BCBC690@DB3PR0202MB3513.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(396003)(366004)(346002)(39830400003)(199004)(52314003)(189003)(7736002)(31686004)(11346002)(8936002)(71200400001)(71190400001)(31696002)(5660300002)(52116002)(2616005)(446003)(476003)(508600001)(305945005)(486006)(14444005)(3846002)(25786009)(7416002)(6116002)(256004)(316002)(76176011)(2906002)(86362001)(6436002)(58126008)(66556008)(66476007)(64756008)(66446008)(66066001)(99286004)(110136005)(4326008)(65956001)(54906003)(65806001)(6486002)(66946007)(229853002)(36756003)(6512007)(14454004)(26005)(81166006)(81156014)(186003)(6506007)(53546011)(102836004)(6246003)(386003)(4001150100001)(8676002)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3513;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mJqj2ZbhUlIhrfXqL98P05v/azoe2H35E7KthchOMKKzRLo01+l0N1w5ELQQueY80Cdy5mZONO6GZdcrM9KhO2shn5gCvX3l6xQFzuwTPjmxFdu/dI7s2CoOL3YGv8GdC5tuW91RQL1tbI7QjN/0kleF8C09RM0cvesWDa6jdVy6/MDf2ZsZfZT2rG8YxAah8le4WACndK/nT6AN5u3NvxiMwQPfEt9QUrc3jyS8/zsQGC2am6OzI8aQz2C4qVTauhm6teBV7OEY2aRtY7aqNRFiUKzV/7y5g9uCKMBZ7E0xm0hkFaTmVVI43O9PtxmYIMmijLrs6zHNHmTD2EPR+Pc41elp3xKpsDtEcprF3FCMQe2KVY61rPIHTmR3BaatwcaBJgXysZkB9oW53QY12LOR03Ulp1BNW3+IpvWVtG9yOHNgZtkSKq2j/Mv/J1Gh
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <08F8C0D291CEAA46A8C814AED28C379A@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d0eb2c-01b2-461a-2091-08d7566a67be
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 21:05:30.4539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qjCxwIOnZ9iL7XFNToBawV2OwLWNd5V7TOhZA8Z9CNeEl2o/DBABErzUMOKG0b0n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3513
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gMjAxOS0xMC0yMSAyMjoyNCwgSmFlIEh5dW4gWW9vIHdyb3RlOg0KPiBBcHBlbmQgYSBiaW5k
aW5nIHRvIHN1cHBvcnQgaGFyZHdhcmUgdGltZW91dCBmZWF0dXJlLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogSmFlIEh5dW4gWW9vIDxqYWUuaHl1bi55b29AbGludXguaW50ZWwuY29tPg0KPiAtLS0N
Cj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLWFzcGVlZC50eHQg
fCAyICsrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtYXNwZWVkLnR4
dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLWFzcGVlZC50eHQN
Cj4gaW5kZXggYjQ3ZjZjY2IxOTZhLi4xMzNiZmVkZjRjZGQgMTAwNjQ0DQo+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLWFzcGVlZC50eHQNCj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtYXNwZWVkLnR4dA0KPiBA
QCAtMTcsNiArMTcsOCBAQCBPcHRpb25hbCBQcm9wZXJ0aWVzOg0KPiAgLSBidXMtZnJlcXVlbmN5
CTogZnJlcXVlbmN5IG9mIHRoZSBidXMgY2xvY2sgaW4gSHogZGVmYXVsdHMgdG8gMTAwIGtIeiB3
aGVuIG5vdA0KPiAgCQkgIHNwZWNpZmllZA0KPiAgLSBtdWx0aS1tYXN0ZXIJOiBzdGF0ZXMgdGhh
dCB0aGVyZSBpcyBhbm90aGVyIG1hc3RlciBhY3RpdmUgb24gdGhpcyBidXMuDQo+ICstIGFzcGVl
ZCxody10aW1lb3V0LW1zCTogSGFyZHdhcmUgdGltZW91dCBpbiBtaWxsaXNlY29uZHMuIElmIGl0
J3Mgbm90DQo+ICsJCQkgIHNwZWNpZmllZCwgdGhlIEgvVyB0aW1lb3V0IGZlYXR1cmUgd2lsbCBi
ZSBkaXNhYmxlZC4NCj4gIA0KPiAgRXhhbXBsZToNCj4gIA0KPiANCg0KU29tZSBTTUJ1cyBjbGll
bnRzIHN1cHBvcnQgYSBzbWJ1cy10aW1lb3V0LWRpc2FibGUgYmluZGluZyBmb3IgZGlzYWJsaW5n
DQp0aW1lb3V0cyBsaWtlIHRoaXMsIGZvciBjYXNlcyB3aGVyZSB0aGUgSTJDIGFkYXB0ZXIgaW4g
cXVlc3Rpb24gb24gb2NjYXNpb24NCmlzIHVuYWJsZSB0byBrZWVwIHRoZSBwYWNlLiBBZGRpbmcg
dGhhdCBwcm9wZXJ0eSB0aHVzIGF2b2lkcyB1bmRlc2lyZWQNCnRpbWVvdXRzIHdoZW4gdGhlIGNs
aWVudCBpcyBTTUJ1cyBjb25mb3JtYW50IHdpdGhvdXQgaXQuIFlvdXIgbmV3IGJpbmRpbmcNCmlz
IHRoZSByZXZlcnNlIHNpdHVhdGlvbiwgd2hlcmUgeW91IHdhbnQgdG8gYWRkIGEgdGltZW91dCB3
aGVyZSBvbmUgaXMNCm90aGVyd2lzZSBtaXNzaW5nLg0KDQpBbnl3YXksIHNpbmNlIEkyQyBkb2Vz
IG5vdCBoYXZlIGEgc3BlY2lmaWVkIGxvd2VzdCBwb3NzaWJsZSBmcmVxdWVuY3ksIHRoaXMNCmZl
ZWxzIGxpa2Ugc29tZXRoaW5nIHRoYXQgaXMgbW9yZSBpbiB0aGUgU01CdXMgYXJlbmEuIFNob3Vs
ZCB0aGUgcHJvcGVydHkNCnBlcmhhcHMgYmUgYSBnZW5lcmljIHByb3BlcnR5IG5hbWVkIHNtYnVz
LXRpbWVvdXQtbXMsIG9yIHNvbWV0aGluZyBsaWtlDQp0aGF0Pw0KDQpJZiB0aGUgYWJvdmUgaXMg
bm90IHdhbnRlZCBvciBhcHByb3ByaWF0ZSwgdGhlbiBJIHdvdWxkIHBlcnNvbmFsbHkgcHJlZmVy
DQphc3BlZWQsYnVzLXRpbWVvdXQtbXMgb3ZlciBhc3BlZWQsaHctdGltZW91dC1tcy4gVG8gbWUs
IGh3LXRpbWVvdXQtbXMgc291bmRzDQpsaWtlIGEgKG1vcmUgc2VyaW91cykgdGltZW91dCBiZXR3
ZWVuIHRoZSBDUFUgYW5kIHRoZSBJMkMgcGVyaXBoZXJhbCB1bml0DQpvciBzb21ldGhpbmcgbGlr
ZSB0aGF0LiBCdXQgSSBkb24ndCBjYXJlIGRlZXBseS4uLg0KDQpDaGVlcnMsDQpQZXRlcg0KDQo=
