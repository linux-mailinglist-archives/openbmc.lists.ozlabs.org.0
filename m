Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E71B404715
	for <lists+openbmc@lfdr.de>; Thu,  9 Sep 2021 10:33:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4sjB087Nz2yN4
	for <lists+openbmc@lfdr.de>; Thu,  9 Sep 2021 18:33:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=G7AMuDvE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.130.107;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=G7AMuDvE; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300107.outbound.protection.outlook.com [40.107.130.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4shT1TzPz2xfw;
 Thu,  9 Sep 2021 18:32:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nv69fL0bCkWFz/4/ZNT7cfVssgySEsArgpi8HveC0/fLB62T9/C72lMgtF+BOxlHRipxSB5Ki2Ew410ba89djZGVo3SiyNnyhitilGIj5BWNbPDQFdCLTe63IKsC8quHoUyj6WLMlV0IHbiMHZpro8zDyZac3Vowpf/J1O/g1WxNOT7tFbC0gjc7zYB9/RXqWvPd+YdJiR4GI2I8fF8sFISqCp99ZD23cx25K9Fy3Oxtnmkq/XEMR4qh4VHNZ1wzbT0pVgNpBvNyjXgs5Cp7ix8PU8Wx35IposMJQ8UNVwafppTKCokJUGv75IGNnznH0BqFuClnE3on2ipfediCrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=hFAa+mK7cWTLZApJtC3iyIyQb+lbWxGMjYzrSH3daPU=;
 b=afi1RaMads7YnZt0UNK2uxVPQsMSjoL2SMpUyscV0d76Tv8JH+IixjfIXxqWo5i/EtdpQrQEoAENC4uQHbpF41B7Q57TS86D+5Tw3D2alnkthp2LbOWOh6maE3kieokBcqV5+p+vOmjGOHf6TH2QI1x6WWNlm2CPlCFLI0BZiObYQ4Pre6o4ztZNY1c6gWB+GE95zIauzkckiM5qZvPH05RGzdsevzQTnzq4/aGwkbtrY3hGftCUZ3w2CcQbZ3ldqfjOlJEyP+a56igjTCgRJrvYRUya3M29Tsuk209YsY0e9sSDk81jBgR49nEuahB5Bu6S/gxIdHhf0Trh9Fdbtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFAa+mK7cWTLZApJtC3iyIyQb+lbWxGMjYzrSH3daPU=;
 b=G7AMuDvEDNrXa6WfeCTHx9C9fBHrrs962KIy3m0JCPlAlGEt0/cwAYgwz+VtfBw6p2oFmrQADRR7sg7M3yQFHRmIhwLTQHCxbnjmNRywbWr8zzvCSyJMcVQp52qHWQf/+htJjqqxnnXBx6WUO+coc7zYH7PdleHm9SNszzTd3/xyA1TcPopzDOsgW1DI7ewNoFGYOlNtkhbgTTkk9Ht2/uYca3iLYYq8HFQI5cQr2yhMYlYQaiyGXK5G6UI2BD3KJSqMfvj2GbXDajG4Oqey0Yj0cJqGQHB9eT2p1GmYT2fZxsjn+RuyuEwVEjszlTEVazVVUTXZCaCRidLlp+ypAw==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK0PR06MB2963.apcprd06.prod.outlook.com (2603:1096:203:8a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 9 Sep
 2021 08:32:34 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62%3]) with mapi id 15.20.4457.026; Thu, 9 Sep 2021
 08:32:34 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: RE: [External] [PATCH v2 0/3] arm: aspeed: Add UART routing support
Thread-Topic: [External] [PATCH v2 0/3] arm: aspeed: Add UART routing support
Thread-Index: AQHXn6Ep4pfNy4cUzEmFUBdsNZd0kqubTzKAgAAbnsA=
Date: Thu, 9 Sep 2021 08:32:34 +0000
Message-ID: <HK0PR06MB3779FBC72887BCC2D915EBCA91D59@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210902021817.17506-1-chiawei_wang@aspeedtech.com>
 <CAGm54UERFkOLXtG3wwL9x1-HAXjmRoaG4ZRbZZOLjP1bLZ=LSg@mail.gmail.com>
In-Reply-To: <CAGm54UERFkOLXtG3wwL9x1-HAXjmRoaG4ZRbZZOLjP1bLZ=LSg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=none action=none
 header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d88c9b67-02f5-4a52-3fc8-08d9736c5f73
x-ms-traffictypediagnostic: HK0PR06MB2963:
x-microsoft-antispam-prvs: <HK0PR06MB2963C3B5189679B60404B23B91D59@HK0PR06MB2963.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u5ko+LYF5+K3Zn50PGnD67v87tdDsjm6H0/I7yysQdzprdfXAh4cxMI5hbKyYzZRvYfzqSCbTL2P0PsCh2WAnP3lsu82YcJmZ+R2CxlhfFQgc5mtkSCllVYUXJhD0JimvsDIxCotCA7FQYLDeblNhUErn+302FmAbh//T83SuuH+4INzZExYBu7q+pJzmST1F6Ak4oXR7v/DB3V7PmOHuXFQQhn3ovo7doj+1q7rXVBzlUhzx6z0qxJWI10MDDMu+vDcOcU/DbmYmA/p1209qZEyuXGRJGatoPghKEXf41ZvzxCnADDZwJoRIN686dw1Z5Ixk7C6LHFyVASMITUakelQIW4YrHv66X5wCXmWsK/e1gfCMLjS8EynDB4KHzuDUenij0EKkUMjrM9zgajWby2NINC0She4UhuVzvFg7iHtgoIa7ZVN+T+M+t/oBww1TL+DCEQNLq/cXQvjdfjaOASKiSKdJBUJ9SXUbitYn4K8PdSSmJe8SEp0Qbvvn1Xz3WaVTHy5r7CX/pnSYATJw+NFKp6vOYlmnxMJsdRoGN9LnMP5FdJF6GPT6f0/RqRmYhnRpBKZJ//gfSir+850w83Q25qh+TdLES0esTbXl2VeD4AGPRbB/Z/b42bQEfbDHqIxGgbhXNMFYXYceiDHGQ2qE5xTgKz8eQsrBtO83e8XnUSS18qbPldH3+2yw1LQZ3LvSM0jFZcuIN6EjM0T50uGQniBK3qXVwZF066spG3p9whpA/OE5ZCB/Jm4pF0QSj+QUvmzEyp2pQPc+2BPj5+80v5i9n9J0rXHvQanZLw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(136003)(366004)(346002)(39840400004)(7416002)(64756008)(66946007)(66476007)(66556008)(76116006)(52536014)(53546011)(6506007)(966005)(26005)(186003)(6916009)(8676002)(478600001)(55016002)(9686003)(66446008)(2906002)(316002)(7696005)(5660300002)(86362001)(71200400001)(38070700005)(83380400001)(8936002)(33656002)(38100700002)(4326008)(54906003)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N093L2pWajhadTBFdTd4M1VqZTAvR1dnbzFPR3Y1UTBnMDZ3Zi9UWWdYN254?=
 =?utf-8?B?emJDUXpJM29lcFZvcFNicDBwbUlEdjlWeVFNMkZxd0ZnWG1UbkI1eVR2SUEw?=
 =?utf-8?B?alcrUXg0Wm9Qd2IyUGZJTC85NkRyRjFrU2VuaS9vN3AxK2Qxak5JSGdLVytq?=
 =?utf-8?B?V0lEU1E1dG40OFRxNUhiOU5vdFY5dy9ZWXlkRFdyUW5GVk5TQnVWMURYaitW?=
 =?utf-8?B?MDBrcEJlTmpqRnNraXpTQ0FaWXBESlZnazhiYmM1WFBHTGVucTRJY1JFYVhI?=
 =?utf-8?B?U1RPVFZNT0ZVOGRVOWk0TUlSUkNzbGZDSm80VmU2cTdCMFg0MGJRZXV4MzVL?=
 =?utf-8?B?QW5sNEN4OGdoaHpzUXc3L0V3dGNmQXlWNVRiSTR3UVpwQTRQWEUxY3d4QThh?=
 =?utf-8?B?bEZuTmlIVUwwdC85aXkxZnRBd2ZPMXNoUzBYYW5mTkxkSnhaMFh4My83eS9M?=
 =?utf-8?B?SzQwZTJCbzd4RHNBTFBycFdWaTFRWjQzVmJCbnFXblhRTEpET0s5cExSeGxz?=
 =?utf-8?B?dlN1eTd3bGwyQmZaN01Va3Fyc0FFdURKRlhyZGJIT0NQdmZLR2ZZN0Q5bGNn?=
 =?utf-8?B?eUMxYkZ4dTVpRU9RU1JaL0F5Z1duU0YvTjdndUIvNnNKaUlBQXhPZ05sS2hq?=
 =?utf-8?B?ZG8rQWM3NEhlUlNZU0Z6aTdwajF6d1dEcVcvK1lYQU00N3VPeVRKUDBNVnJu?=
 =?utf-8?B?eDVENUtBMml0RXZoaURsQ09zQnNtT2lpMm9rQUkvUHhRSjdBVXBmUTBpcHFp?=
 =?utf-8?B?Y2k1SWo4ek9QOTdCZ0ViTkJKemhDaEtXNnVtMFZhOVZxa1UxcDFvcHpFWDdV?=
 =?utf-8?B?OXE2dDNGRTY3V0xxNUdBMTJac1Vzdm5tS1RlYzV3S1lwczBZQ2dhVmVqTWQ2?=
 =?utf-8?B?d1I1QW1KWmZPTnBobmEyVitkK1lnQXBDL0tLbUx1MVVVQlM1bHRTSFU5T0N2?=
 =?utf-8?B?cTJJZ1hKWkU4NUZCUFFEWkJJQWozcEtaVTJBeWxzUHE5TE5JVGVVcGk1ZlA0?=
 =?utf-8?B?SzVwKzJ3Q3RlcHJqNkp2UkpVNmRzZmM1Qk1RSzN5cUJSYXJrYkxMZUJVS0x0?=
 =?utf-8?B?cG8ydFdFYmovZzBvQXpPNHhwSmVJL083YlJGa0t2bWNrNzkwc0pWUzVxNnFx?=
 =?utf-8?B?QkREdDNxajlSUk9ubWJmMkdqaGUzM1VLMDRjVFlwd2hKcy9wWjlaSDBlNUNV?=
 =?utf-8?B?Y2tCRk9tZWdQNDlLQzh4a09rZzRrNU5BSTZYN3ViYzhGMVlkd1dLZkZoTlkv?=
 =?utf-8?B?RUp3STRqb3FWbmZONlFDT3VYcXdrOExHU2ZTSm13a1Z1akNTWkRLQ1BpQ2Fj?=
 =?utf-8?B?VU1GOGJWRjE3clArWitnQ0c4bXBXdEltVEFLR3J1SmRocUNCejBHMWsvRWND?=
 =?utf-8?B?QXNnWnF5cXRyeTVUWnZnRi94MUxMc1Y0aE11NlB1ZkRVMlBodXQ3TW1POWli?=
 =?utf-8?B?b2pRdTNJTkYxQXM4SzdHVnRiUit2dmhQSkRIeW5YRjBRYXdJbTFKamRBUEhi?=
 =?utf-8?B?dkx0N0k1NjlFS1Z6ekpFc3luNVBqL2JreXA0enlFbHBiNC84UjlpK29LTlE4?=
 =?utf-8?B?M1dhdzFOREd1R2w5R0JFM0l6aW1GZ3EvVURBeXpyeHVWTXlLYkNzTlpHSXVK?=
 =?utf-8?B?cnRmY3Ztc0ZuUWIzcVBQQnp2QStodDU2T2RVb2tuZVhMV0NMUklRSENCbGNo?=
 =?utf-8?B?cThBSEowL2IwRzIyT0RhR3I2NzE2N2xZVXpJd2VJcW9xY3U0R0Z0QjRDeHo1?=
 =?utf-8?Q?zezWiD5XG2qOr8H4VBUpoTzRnVIeCafrsjyzyhJ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d88c9b67-02f5-4a52-3fc8-08d9736c5f73
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 08:32:34.4356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hgn2dsqyFTomfbk1UOctf6OD/bxH1+1LOCup/Bs5YkGQKoe+OL+gMFCMnduD9jrM6XxUWx4ZaK9mQMAgV+xdLGnWGdc9EuuPginyRqZB5SU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2963
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc <openbmc@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>, "moderated list:ARM/ASPEED
 MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>,
 Oskar Senft <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgTGVpLA0KDQpUaGFua3MgZm9yIHRoZSBUZXN0ZWQtYnkgdGFnLg0KV2lsbCBpbmNsdWRlIGl0
IGluIHRoZSB1cGNvbWluZyB2MyBwYXRjaC4NCg0KPiBGcm9tOiBMZWkgWXUgPHl1bGVpLnNoQGJ5
dGVkYW5jZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgOSwgMjAyMSAyOjUyIFBN
DQo+IA0KPiBUaGUgcGF0Y2hlcyBhcmUgdGVzdGVkIG9uIG1ldGEtZzIyMGEgYnVpbGQgYW5kIGl0
IHdvcmtzIGZpbmUgd2l0aCBzb21lDQo+IGNoYW5nZXMgaW4gdGhlIHN5c2ZzIHBhdGhbMV0uDQo+
IA0KPiBUZXN0ZWQtYnk6IExlaSBZVSA8eXVsZWkuc2hAYnl0ZWRhbmNlLmNvbT4NCj4gDQo+IFsx
XToNCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvbWV0YS1ieXRlZGFuY2UvYmxvYi9tYXN0
ZXIvbWV0YS1nMjIwYS9yZWNpcA0KPiBlcy1waG9zcGhvci9jb25zb2xlL29ibWMtY29uc29sZS9v
Ym1jLWNvbnNvbGUlNDAuc2VydmljZSNMNy1MMTANCj4gDQo+IE9uIFRodSwgU2VwIDIsIDIwMjEg
YXQgMTA6MjAgQU0gQ2hpYS1XZWkgV2FuZw0KPiA8Y2hpYXdlaV93YW5nQGFzcGVlZHRlY2guY29t
PiB3cm90ZToNCj4gPg0KPiA+IEFkZCBVQVJUIHJvdXRpbmcgZHJpdmVyIGFuZCB0aGUgZGV2aWNl
IHRyZWUgbm9kZXMuDQo+ID4NCj4gPiB2MjoNCj4gPiAgLSBBZGQgZHQtYmluZGluZ3MNCj4gPiAg
LSBBZGQgQUJJIGRvY3VtZW50cyBmb3IgdGhlIGV4cG9ydGVkIHN5c2ZzIGludGVyZmFjZQ0KPiA+
ICAtIFJldmlzZSBkcml2ZXIgaW1wbGVtZW50YXRpb24gc3VnZ2VzdGVkIGJ5IEpvZWwNCj4gPg0K
PiA+IENoaWEtV2VpIFdhbmcgKDMpOg0KPiA+ICAgZHQtYmluZGluZ3M6IGFzcGVlZC1scGM6IEFk
ZCBVQVJUIHJvdXRpbmcgY29tcGF0aWJsZSBzdHJpbmcNCj4gPiAgIHNvYzogYXNwZWVkOiBBZGQg
VUFSVCByb3V0aW5nIHN1cHBvcnQNCj4gPiAgIEFSTTogZHRzOiBhc3BlZWQ6IEFkZCB1YXJ0IHJv
dXRpbmcgdG8gZGV2aWNlIHRyZWUNCj4gPg0KPiA+ICAuLi4vdGVzdGluZy9zeXNmcy1kcml2ZXIt
YXNwZWVkLXVhcnQtcm91dGluZyAgfCAgMTUgKw0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZmQvYXNwZWVkLWxwYy50eHQgICAgfCAgMjIgKw0KPiA+ICBhcmNoL2FybS9ib290L2R0cy9h
c3BlZWQtZzUuZHRzaSAgICAgICAgICAgICAgfCAgIDYgKw0KPiA+ICBhcmNoL2FybS9ib290L2R0
cy9hc3BlZWQtZzYuZHRzaSAgICAgICAgICAgICAgfCAgIDYgKw0KPiA+ICBkcml2ZXJzL3NvYy9h
c3BlZWQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgMTAgKw0KPiA+ICBkcml2ZXJzL3Nv
Yy9hc3BlZWQvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAgIDkgKy0NCj4gPiAgZHJpdmVy
cy9zb2MvYXNwZWVkL2FzcGVlZC11YXJ0LXJvdXRpbmcuYyAgICAgIHwgNjAxDQo+ICsrKysrKysr
KysrKysrKysrKw0KPiA+ICA3IGZpbGVzIGNoYW5nZWQsIDY2NSBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKSAgY3JlYXRlIG1vZGUNCj4gPiAxMDA2NDQgRG9jdW1lbnRhdGlvbi9BQkkvdGVz
dGluZy9zeXNmcy1kcml2ZXItYXNwZWVkLXVhcnQtcm91dGluZw0KPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9zb2MvYXNwZWVkL2FzcGVlZC11YXJ0LXJvdXRpbmcuYw0KPiA+DQo+ID4g
LS0NCj4gPiAyLjE3LjENCj4gPg0KPiANCj4gDQo+IC0tDQo+IEJScywNCj4gTGVpIFlVDQo=
