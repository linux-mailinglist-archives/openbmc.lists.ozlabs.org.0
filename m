Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2664D41BD0D
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 05:04:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HK1SV0QVvz2ypP
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 13:04:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=1h1ZCGVN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.107;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chin-ting_kuo@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=1h1ZCGVN; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320107.outbound.protection.outlook.com [40.107.132.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HK1Rr0Zl5z2yHy;
 Wed, 29 Sep 2021 13:04:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emcbTd8efx5S0e0faKnJi/X66uLUIXlp1cqRuT9gnOGm+SFG3Fq3sH+WmZkEgLQM7sndmiZd41+UqbwLEqs2kLaNyfbxHTrspkd8ta5VSGXFOYPcKsIwGOThX7feVsci/pBIXvF3YmTJTTqu2g9zjJXAgiKPffs0rhxIEFx8tyvPIMgZGfETDHjt4XTcJUiL5VLCXVAm+q6itHfirWhuBVgqaGK9v1OKA6Iv9CU2fCJ5IaqL7T59Slxo+N1eNKCavUq79g/sZmiuheJwzKIz/w9P7uWqNy4t9CC+Pem1dU6gVwg1oHGP1mmwFrIAQA+LdAMc3YNPrUdDqo5Fg+6Crw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=47gpZ4wcuSiMuVU0zW1foMsE6PGPfylT1k3NoiWXXEQ=;
 b=MYce7PdElr4U9D1lafayqZW7piISHbR70lwamiuLmK+5H+wUpDrhwMlUk+E1NOAgJarUoAGyqy/xvvPYPJrohZeV3PSU3STyRE8wTpiniHyaRyPUiy/qJOc5g+Yq6jELo17FxqQOk5x3ETwyMt7YjMGhNVz9Kgm7IY8JDtFZ8OFCw0Degwzx07FofnvjjomPYuFxxjN+W+mRG++07vnCeWPJkl1ZyVB+FPgoRhErbvaZ4lIIUFnEYr89FAZPg8nsExBIlv4lVPexa6As/rYTZzuWXmowv7+RuBPzQvhXziXn60U04ZaLyAONixM844D0Hu+sZq9W1eGMSBsdM6PRDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47gpZ4wcuSiMuVU0zW1foMsE6PGPfylT1k3NoiWXXEQ=;
 b=1h1ZCGVNuSpHbBRSDwUYG1QNZ/8fQHB79VYDUq6GHZPR7Itgg9jP1utj0GXd8Opi2Q5hf0/dlg0AEnVkNkgXmx3mgIBeWx2TKW+0gaTOuNwMcTcJXOdkuS+QTXk/rIAk526Atk07aB58e18jbjetqvAwprB/NK9wNWSNDF5ra9pg3FaCKTBCt3sV9SVMvoJXwmfAPntXAqNY0Q7sebujWLqf7wl7W5PRGQmlxj1Nik//8e1Bwaf8mtGkWNxprhi+Sucpe04DCcJLsgs4Wf57rvCslE7X1Ty2xzmeG6RAhGb/qHbtLrQhgCk1NekbZkHtNTp0xt/YCYSPe8XjK65pbg==
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com (2603:1096:203:5b::22)
 by HK2PR0601MB1938.apcprd06.prod.outlook.com (2603:1096:202:d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.19; Wed, 29 Sep
 2021 03:03:44 +0000
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::ddf1:e9d4:c209:8ab8]) by HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::ddf1:e9d4:c209:8ab8%7]) with mapi id 15.20.4544.022; Wed, 29 Sep 2021
 03:03:44 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH 10/10] dt-bindings: mmc: aspeed: Add a new compatible
 string
Thread-Topic: [PATCH 10/10] dt-bindings: mmc: aspeed: Add a new compatible
 string
Thread-Index: AQHXs9HHr7TBfuGZLUCpoIBAXdEJGKu4upXggAFOF4CAAEp/kA==
Date: Wed, 29 Sep 2021 03:03:43 +0000
Message-ID: <HK0PR06MB278642C55052360B039853FAB2A99@HK0PR06MB2786.apcprd06.prod.outlook.com>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
 <20210922103116.30652-11-chin-ting_kuo@aspeedtech.com>
 <YVIUf7/4ukMcrOb9@robh.at.kernel.org>
 <HK0PR06MB2786DAAA2D6E58EA2E2FCB6BB2A89@HK0PR06MB2786.apcprd06.prod.outlook.com>
 <CAL_Jsq+TZFXrvfJTjofVcnT6jJat-3SvWj+jAq0QST8ndfeUMA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+TZFXrvfJTjofVcnT6jJat-3SvWj+jAq0QST8ndfeUMA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef6e649e-4e8b-4651-5f51-08d982f5bf8e
x-ms-traffictypediagnostic: HK2PR0601MB1938:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR0601MB19388E40F76C91F0BE916D26B2A99@HK2PR0601MB1938.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qMH1lC2y3CsoKvA9JalTKyz/5+vf8y8k3K4LaSvLWX/WP93djtXbcfv5iUUMdkTxSrNAeSL+Qs08WoJ+jXK1eZEzKzfcLrOf0rrxspoXHNo8bvtbwETcInIbULuh8bzFmPg4bkcBe5BIWKc8STKZvoZX5I33ESoiZCj1Kojfb7QzjmhQc8Hahtn5bjJBWGs0cf8mcfe9Hu7sZaVivtqJgQuL91RI+ibu4mksZ9fhFAO6rC41lzbbGUY3nJWGjW0FShOmfqOLScph8c3Q4lJnc1I5N1NA/DJfZWNG+HJi6LcTlPPL0gZ5cZClGg/7fHLWeOPLPVjVcN5lPUwMIsnyyTJOBaYInJ5/MUKudE7IGWr/jIA0O+XgVfn6QpSoi2g5S65SXeGHOassmJTB4pbl/ioxQgs6z8bAfwZHWBmufcypkQKz4/06v3vlgQ66YKHVeNNfVOuQBl8LJeUu0v3cwntvvKOTHlv6yNKFLr8KfKPCLOx5bj9DmF56lmUD0IH9PprltOji9aCovKHehgaczFuB0bNJB4B2josJdaeAtNcTL8tUUoME0NLhtbijugQjscyKFok/zhgPdcK7csTYBE8szT1dbRYSFnXbXRdRNnwzYuxsvr2YG3bpSHGR23YjCR2LO7buQT+K16VzFbB34zEugLeT0gotGKg+G00t4gcaeEKN2O2Z0PycGzOb76E8h1wj2On4jM3agrIsZlH+DQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2786.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(107886003)(86362001)(54906003)(38100700002)(316002)(508600001)(83380400001)(76116006)(122000001)(66946007)(26005)(8676002)(38070700005)(55016002)(66476007)(66446008)(64756008)(66556008)(5660300002)(71200400001)(186003)(7696005)(7416002)(2906002)(4326008)(6506007)(53546011)(9686003)(6916009)(52536014)(8936002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elhCc2J6cVBnbEcyb3Z4L3pJeGUzUVhmR1FaN0dIK2hTVVFBTEFkUlBoUmdV?=
 =?utf-8?B?U1ZodG5ZMnh5RE5VSUZJbFN2LzBxU2JtTXJ2MXVuaVBiSzRjS0t1UzJ2SnlB?=
 =?utf-8?B?aVFFMHhXTDdBSmhnOTc3SENnQitrbFlCUjNMcXJrL3RnMHlaQlRrWDJGR1dw?=
 =?utf-8?B?bWFreVNuYkpxZVl5bXIzaHZFRCtvVzlZZWFIYzFHNkdBalFMQzVSTlMwVElV?=
 =?utf-8?B?YlJWc09LWDNnQTlUM3hhQ3dVMTFZTlpzQWloazBjZEtVRSs2dDd3VmRhYmZ5?=
 =?utf-8?B?RnZaczFtdzNJMy9vbHIwMG5GcVlNbVIrT3JkM2xIZStYbURRMHd2Zjh5eGhZ?=
 =?utf-8?B?YzlpUFFWNUFrNU43bE93NmgxS1hFQm00NFBBNlVra2RMajRaSjlTWmpOaTF6?=
 =?utf-8?B?TGtDcXlOQ201M1lpdkhmR1E0Qk1hdmo0THlXWndyVU9MaURVeXA1M2c0OFpM?=
 =?utf-8?B?VldPTGJNdTByZEIzalJERXJRcGZhL0dvUGFzcjVLU3hXUzI4WWxwOCtxellz?=
 =?utf-8?B?SVdPVkN2KzBhMFpIandKbi9jdk9YY1pLK1lsazRwUUdNMVJ2dTh2K0o0cWpJ?=
 =?utf-8?B?RVphMnBhSjB5NXd1ZlgzOXlNMDNPV1pnQVoyUlR2NXZYLzBaQ25xOXNweVpv?=
 =?utf-8?B?UlhLKzVOZ0NrYUk5aGZuc1p2VlB1TGx5VVdCV1ZYL0hPOEFlbkhNVzkzVXBT?=
 =?utf-8?B?ajVmWmNsWUg0bVZOaXNURDJoQ2hvdW5WY1Z2a2ZLUVFhUm4rUXF2Y1BnSHI4?=
 =?utf-8?B?UTJ4TDVwcEJzajcrd2NpUTl1bnBHMzhBYThWdDRzNVdCcENvYUUrbkxOTVZ3?=
 =?utf-8?B?VUxNbzJhWSs1eS8xNHE0eE0yYnVINjI3Z2JTT05CTDNhRk9xbWpXeSthaXJE?=
 =?utf-8?B?Njd4WU1lNHFvYUFSVUJEUkZHTWE1Uk1Lc3RkTzI3RnNSc2JlMEN6NEwzQWxH?=
 =?utf-8?B?RFFXeG44QWs4aGlzRC8wL1VqaGthUDJsRU1yMEhBc2l1M21WUy90bDk1aGRT?=
 =?utf-8?B?Sis3UTgrQ0lBOFFSb2lKMkNVek8wQk9mTmdQcGVkTGtVWkxTUUx0RG1QbjFZ?=
 =?utf-8?B?Z01tV3V3bFoxNDF5YWN3QVlESzZHRWJTaXc4a3h1ejFTTmdOQmQrWVlSZHlS?=
 =?utf-8?B?VVpyTWc3ZndOYWlJZHVScmhUTFRTU1pZdHJuN2EzVWRkd1A4c3BlektoSnha?=
 =?utf-8?B?SHo3bUFndFVKU1cwK0E5NW8zbWk1dmZGVWV0UWErcHMvRHBLRHNON2Z2ZUk4?=
 =?utf-8?B?RExlK2pJREwyaUswdlZkeWhPOGV2QnZRZDRacWFoV01DRUwrMFI2Snkyc1hh?=
 =?utf-8?B?ZkdiUTlhYW0vYjJ1a2NiVHoyOEVNdC9nT2FZZVBPY3BNcm13RkxZQmsrdS9U?=
 =?utf-8?B?YWxqbnVmUTc1Zlp2RkM0RE1BVDhsbG1lY09hc0k3R05JZGtmU1FlK29UcFZW?=
 =?utf-8?B?bGNPaGlpOXZ3RFkwbUJ4MVdjUHZLakloMjJ4ZXJ3ZjlOclJZVWFpMUx1cVJJ?=
 =?utf-8?B?S1dTMzQ4ZVA0V0J6YktsTWQ2bjZzYlI3NTVvbFNIekg3TUdjSS9zdW1RSGd4?=
 =?utf-8?B?eUplVnphRkhIWllESlltUFEvZngvbjkwOURjRSthUXJuN24xMXd2cnRZL2VU?=
 =?utf-8?B?ZXVmbDQrRVArMURBelFubEthNHU3TFk4c0hZak90RVlXNFVWdkZKdDlLOHlI?=
 =?utf-8?B?RzV0YVFRVHpZRWVkc0x6SmZCUldWajhtNDFnSWpWa3VNREUxM1RNMVBySmFN?=
 =?utf-8?Q?svck7R44EpdkHsZI7jgYRM/0Kwpn112maj2SFl+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2786.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6e649e-4e8b-4651-5f51-08d982f5bf8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2021 03:03:44.0024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nl2JrpZUxNGUEGuRfELiCWXbD1RGLK8LROPFbPhn1UysXvjo/HSKEuBTlWwHEcGZdlJ+jexSPs62sBppG03HNqugeGsAgIt+PMhgoRbRhhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB1938
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
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 BMC-SW <BMC-SW@aspeedtech.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgUm9iDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMjksIDIw
MjEgNjoyOCBBTQ0KPiBUbzogQ2hpbi1UaW5nIEt1byA8Y2hpbi10aW5nX2t1b0Bhc3BlZWR0ZWNo
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxMC8xMF0gZHQtYmluZGluZ3M6IG1tYzogYXNw
ZWVkOiBBZGQgYSBuZXcgY29tcGF0aWJsZQ0KPiBzdHJpbmcNCj4gDQo+IE9uIE1vbiwgU2VwIDI3
LCAyMDIxIGF0IDk6NTEgUE0gQ2hpbi1UaW5nIEt1bw0KPiA8Y2hpbi10aW5nX2t1b0Bhc3BlZWR0
ZWNoLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBSb2IsDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
Pg0KPiA+ID4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDI4LCAyMDIxIDI6NTkgQU0NCj4gPiA+
IFRvOiBDaGluLVRpbmcgS3VvIDxjaGluLXRpbmdfa3VvQGFzcGVlZHRlY2guY29tPg0KPiA+ID4g
U3ViamVjdDogUmU6IFtQQVRDSCAxMC8xMF0gZHQtYmluZGluZ3M6IG1tYzogYXNwZWVkOiBBZGQg
YSBuZXcNCj4gPiA+IGNvbXBhdGlibGUgc3RyaW5nDQo+ID4gPg0KPiA+ID4gT24gV2VkLCBTZXAg
MjIsIDIwMjEgYXQgMDY6MzE6MTZQTSArMDgwMCwgQ2hpbi1UaW5nIEt1byB3cm90ZToNCj4gPiA+
ID4gQWRkICJhc3BlZWQsYXN0MjYwMC1lbW1jIiBjb21wYXRpYmxlIHN0cmluZyBmb3IgdGhlIHNh
a2Ugb2YNCj4gPiA+ID4gZGlzdGluZ3Vpc2hpbmcgYmV0d2VlbiBTRCBhbmQgZU1NQyBkZXZpY2Uu
DQo+ID4gPg0KPiA+ID4gV2h5Pw0KPiA+ID4NCj4gPiA+IElzIHRoZSBoL3cgYmxvY2sgZGlmZmVy
ZW50PyBXZSBhbHJlYWR5IGhhdmUgcHJvcGVydGllcyB0byBoYW5kbGUNCj4gPiA+IHNvbWUgb2Yg
dGhlIGVNTUMgc3BlY2lmaWNzLiBBbHNvLCB5b3UgY2FuIGhhdmUgYSBjaGlsZCBub2RlIGZvciB0
aGUNCj4gPiA+IGVNTUMgZGV2aWNlIGlmIHlvdSBuZWVkIHRoYXQuDQo+ID4NCj4gPiBUaGVyZSBh
cmUgdHdvIFNEL1NESU8gY29udHJvbGxlcnMgaW4gYSBBU1QyNjAwIFNvQy4NCj4gPiBPbmUgaXMg
Zm9yIFNEIGNhcmQgYW5kIHRoZSBvdGhlciBpcyBmb3IgZU1NQy4NCj4gPiBBbHRob3VnaCBib3Ro
IG9mIHRoZW0gYXJlIGVtYmVkZGVkIGluIHRoZSBzYW1lIFNvQywgdGhlIGRlc2lnbiBvZg0KPiA+
IGRlbGF5IGNlbGwgYW5kIHRoZSBtYW51ZmFjdHVyZSBwcm9jZXNzIGFyZSBkaWZmZXJlbnQuIFRo
ZSBkZWxheSBwaGFzZQ0KPiA+IGlzIGRlZmluaXRlbHkgZGlmZmVyZW50IGFuZCwgdGh1cywgd2Ug
bmVlZCBhIGZsYWcsIGNvbXBhdGlibGUsIHRvIGRpc3Rpbmd1aXNoIHRoZQ0KPiBkZXZpY2UsIFNE
IG9yIGVNTUMuDQo+ID4NCj4gPiBXaXRob3V0ICJhc3BlZWQsYXN0MjYwMC1lbW1jIiBjb21wYXRp
YmxlLCBvZiBjb3Vyc2UsIGVNTUMgZGV2aWNlIGNhbg0KPiA+IHdvcmsgd2l0aCBvcmlnaW5hbCBz
ZGhjaSBkcml2ZXIgYW5kIGRldmljZSB0cmVlIHNldHRpbmcuIEJ1dCwgZm9yDQo+ID4gdWx0cmEt
c3BlZWQgb3IgSFMyMDAgY2FzZSwgQVNUMjYwMCBTb0MgbmVlZHMgc29tZSBwaGFzZSBkZWxheSB3
aGljaA0KPiAobWF4aW11bSkgdmFsdWUgaXMgZGlmZmVyZW50IGJldHdlZW4gU0QgYW5kIGVNTUMg
ZGV2aWNlLg0KPiANCj4gVGhpcyBpcyBxdWl0ZSBjb21tb24gYXMgdHdlYWtpbmcgdGhlIHRpbWlu
ZyBpcyBhbHNvIG5lZWQgcGVyIGJvYXJkLg0KPiBMb29rIGF0IHdoYXQgb3RoZXIgYmluZGluZ3Mg
aGF2ZSBkb25lLiBBIHByb3BlcnR5IGlzIG1vcmUgYXBwcm9wcmlhdGUgaGVyZS4NCg0KT2theSwg
SSB3aWxsIHRyeSB0byBjaGVjayB3aGV0aGVyIHRoZXJlIGlzIGFuIGV4aXN0aW5nIGJpbmRpbmcg
d2hpY2ggY2FuIGFjaGlldmUgdGhpcyBwdXJwb3NlLg0KT3IsIG1heWJlLCBhcyB5b3Ugc2FpZCwg
YSBwcm9wZXJ0eSBpcyBiZXR0ZXIgc2luY2UgdGhpcyBwaGFzZSBkZWxheSBpcyBhIHByb3ByaWV0
YXJ5DQpIVyBkZXNpZ24gYW5kIGlzIGRpZmZlcmVudCBiZXR3ZWVuIGVhY2ggY2hpcHNldCB2ZXJz
aW9uLg0KDQo+IA0KPiBSb2INCg0KQ2hpbi1UaW5nDQo=
