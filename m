Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7F3408281
	for <lists+openbmc@lfdr.de>; Mon, 13 Sep 2021 03:17:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H77qc1MHXz2yJf
	for <lists+openbmc@lfdr.de>; Mon, 13 Sep 2021 11:17:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=bkatNxuS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.138;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=bkatNxuS; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320138.outbound.protection.outlook.com [40.107.132.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H77q01ssbz2xfy;
 Mon, 13 Sep 2021 11:16:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7iDCNIilLrxrypUo9hFN2U5xl45rYinQFOPhTt3/kwL78kw6Fr0M1948qFVf4mBoIHZmj7erZdco3NiIvkD8kJFoNWhUMcAwioSNMF6hlHQH4e/zlqoGNl45Do9msqajXlDCEKulh4M6NVaoPAe51y6+v8JkyH4XQH8BdUnRCLrHJ/MassRf6HvQUckWzj9/dyMW1pjoZLwXvN9D6p46DcXGIjkIBnGCNaBpqg28b0G/aHCzrzfP05+r1Yk3J09ccsSa3xdWCaD3ohULTDIaOnFxBqIAP5Zrf8/FxSeLsGIVtJSP1PWbY6t/uq+bVqKv/f2Acq8FgOGS+53RUftyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=WHrFzqzwv9wl/EXSMziS7EZ64XHmKU0sU4QDNUWIHOI=;
 b=kFa2CUH+pHP91anYnMmSE1IZh14eORhbpMZjUPU8U7E2CSdK3iqi7HrlZvfXs+OjfEdNk5saxSCdiJNhOffFN3VICxgHGV3Vs+d4wjpBwh7OH5Jche/BKWEYmoFCW/TAP1zrfsWLD3ANneYi1bnABxlmu5pqX0LKwmp+8H2UvKGbIVcw1xEs+5SHtFp1GqYECoeK84mTamCkRANvL56Wiyj4ZbwtGg17b5W0PfGvfzjcCeGtzNvFIbS8wnZgERE07M0vt6shl8/DvJH9hTlJKjTy9rFhqJ2ivVwDnUptZr+Nh+2MfcGt4zXuYfd4vAJoaRUIvTCyGZJMh+8fyMDnKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHrFzqzwv9wl/EXSMziS7EZ64XHmKU0sU4QDNUWIHOI=;
 b=bkatNxuSF4HyZuVT8NRu3XrkItDytft1SW+d/rM9czaey6tIHjqHs6uPW3hlPf1lY1g5+FU8XzH88nOq2wNbFLmnROokWyfuNdQS8719nAPbF+kRlhv+4NIpR7H3ueDTRcpjqGp5Jx0WgRAnTa6+D6HK5tC+Ol2KlgXco+DPIlkL8S7pnNiAN9fqpvKQt/oGVdW8navjxFn2lKcJ3H1GcGBQgtWSI6t9e3Qer7OrMG9nxyVc4+/4mIdGXqYvB+im+xe8XKfIoQMwnMwmyIvSFQ/7N0O1xL3QSTprzDdHtmt3fQfRCnps+xjImPgmapOtaMmLjjpK3One+lrtx3Hwdw==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR0601MB1906.apcprd06.prod.outlook.com (2603:1096:202:c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 01:15:59 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::3517:6c51:50d:1a55]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::3517:6c51:50d:1a55%3]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 01:15:58 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v3 1/3] dt-bindings: aspeed: Add UART routing controller
Thread-Topic: [PATCH v3 1/3] dt-bindings: aspeed: Add UART routing controller
Thread-Index: AQHXpWWkyhyvOPma00qLCHgaz2i9raubotKAgADZLHCAAPJkgIADv8eA
Date: Mon, 13 Sep 2021 01:15:58 +0000
Message-ID: <HK0PR06MB3779641C22C5A07EAFCE91EB91D99@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210909102907.32037-1-chiawei_wang@aspeedtech.com>
 <20210909102907.32037-2-chiawei_wang@aspeedtech.com>
 <1631190773.304300.200343.nullmailer@robh.at.kernel.org>
 <HK0PR06MB3779990AF1A5BF5300DC9B0E91D69@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <CAL_JsqLdT3U2k8Znjo0LHUtC41vPidR4ZDDhcRPpxDC7atgEug@mail.gmail.com>
In-Reply-To: <CAL_JsqLdT3U2k8Znjo0LHUtC41vPidR4ZDDhcRPpxDC7atgEug@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b605c22-2cb0-41db-5aa6-08d976540b56
x-ms-traffictypediagnostic: HK2PR0601MB1906:
x-microsoft-antispam-prvs: <HK2PR0601MB1906DAA9A105C53F797B310291D99@HK2PR0601MB1906.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S3Anlvnk0CCL00+FOaH5leq/yIgYBHisIDk4ngkYS1sMVGOHEbsPJIcJMWYa+kCBx1KFJtT921wNuWP8yTHno/xaINeAS8LHeTpzh5A3pUHF0WkfhhxPy8FxB8HXmJdAViRXgPuVOcDugEPNGJgBKiC0G5/eNvfAZE5RfUZMeBhbxPmIlmaMzu0Qke/4c4EoC6yUqj4YIDznxNeXuF5QHA/laGR27dQUPKIAtDoIM2B36oDhjBRjTZ4NQskLN9ykSV5NzsRGOcQHdLNS8yrU3UFlisKaIfk3lzqpcSQmVDAptNx3zBx3RVeu4IiSRbmedpu6VjMIhx04s5q9zA8fas9EY+utUGIo3mxuccDahxxS89OfbdKqhB+vlRz7GKBuVeArfGGjoWGDLYWAgsNMia85aQe4jn2Pkat52ZJcneJk123JeC4N/67Cqb9rtXean9v6DLtoyS5zlsqpJfCrzcNtPwWrUlSU6Lh4Nj3UHodsUCOhnRJrhxMJKH0ZJ/YlADmlf+N5Tys6BJ+oQWIU3SpTKjXF+D5/P99H8vdpQBqSIL8dG7z8h2NRF/18zAIxlSw8MwJpnrynTxJQASfKwmFiQ1UJC7RZp6GGvCMwC/8hJnPpi9NVLbUZ16a90gwtj+NdWt5WkORmg06ZVyB5zvi9gCE6eF0/OLGa71G58oZjX+x6DTmkRetP/E5qon/OxXPN3k1XNGyRd7cgWI6IvQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(396003)(136003)(366004)(39830400003)(66556008)(8676002)(76116006)(64756008)(122000001)(66476007)(38070700005)(7416002)(66446008)(26005)(54906003)(83380400001)(316002)(2906002)(86362001)(8936002)(9686003)(6916009)(53546011)(66946007)(33656002)(38100700002)(508600001)(55016002)(6506007)(5660300002)(52536014)(4326008)(71200400001)(7696005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTJBRFUwZ01XRTNVdUdwc2FjajB5emVTRDFjbkxxOXFGN09xdTdUaDdUTW1P?=
 =?utf-8?B?dG5rdDYzNXRjMWZNNWFkSFhneFpYZzFnWlRWR1d2a1dBalhWd0JwMDUrSzJM?=
 =?utf-8?B?ZG9ZVFlEekcwMzRmRUFHbk0zV3IzcE10ZkxudnByNHBiejhCVFBYclJuNjJy?=
 =?utf-8?B?dEo2MVZjN1YyMkgxYnArMFY2UE5kdEwxNEFoRElUN2R0azdCVzkrdWNFcEZ3?=
 =?utf-8?B?YnM1NXJxMlVYdzNQZW51M00xRkVHUkhxalZ2RW41bGt0UFhsWHlBMHk3V0Z3?=
 =?utf-8?B?ZGdJamcxOGRLcGxwM1ozcG9YVi93TzhiUXFHMGNCeEJXVnBQVGUvcmR4aFNy?=
 =?utf-8?B?SEFFYTZGbVNJM2VwdGw3RjBsdHZMUnQveDNRblhKY1VxRmxPYW52YTB6dTk1?=
 =?utf-8?B?c09DMkxuT2VLaWMyeFYzOTJzN2cvMXh1OHJBY2tRekhyOXZFZER3UjMvaXhY?=
 =?utf-8?B?ZVRTREFibnNCVnlBZzVsR2JYcERGUlhQcWdnMmVsdDlqVE4rL1hodzM0bmRY?=
 =?utf-8?B?Q3UyNHdjOFpaRXovOVh6dWcySXZMS2Z0cStEZWpPKzF0M3cyWTJPaG1SQ0tv?=
 =?utf-8?B?ajZhV3puNTZ5VUdKcGJaSEdJZXQybGlMSEx0U2lsSmNkRmd5cDcrSVZiMXZQ?=
 =?utf-8?B?VWZPS3JpaVN5YUxiSGM3T2Z1Y0s1bVltVlI3ZGo0NjlXQmREeUdwS0ZDc3p2?=
 =?utf-8?B?SEsxVDVEM0ptN2Z3djcxZGUyUndkZ2hjbW1maHcydi9hL0VkcVVheU41TTUy?=
 =?utf-8?B?SHFualhoME8zd3JtdVh2S3NFSDNqaE5UeUlvM3dUSmkzWThQL2RMVW9sQ3lQ?=
 =?utf-8?B?dUsvVTRSQkl1cmFWbTRkUWtDWkVhc25rOG1UU3FBSklLSlN3SlZHc2p1WjZk?=
 =?utf-8?B?dTRDc1g3LzdXTzB3TTZSNmIxcHMyQi9kRVFSVkhDYWZMV2t1eVg2dnQ4c1hk?=
 =?utf-8?B?eEQ0aUVZZ1Ryem43UWR3QTVUaHJKR0hiVXdxN1NvaCtWNGs2V3pORmVKdlNi?=
 =?utf-8?B?MHdYRXZLVDhCZ2xHc0o4NGNVM240NlV1Ukt1M1YxZ0ZURUozTFhkWE5iVm1t?=
 =?utf-8?B?WHdaL1FPZmVtRTM4MFlpL0pSZzBYZ2tPWlpjSS9LZCt4cFRrWHR2OHJReHBh?=
 =?utf-8?B?L05WYjVuc2c4amEvYlQzRXlPYkFpOE9Kc3BmQVN3N2YvUXNPN2tQcHpSbjFs?=
 =?utf-8?B?MDRqWW9OdHRucERtN0JMVktVNnZtcm5XSDVNU1FFdlhoUi9KQnVyQ1E5SU9q?=
 =?utf-8?B?ZGJFTXZuaThYNUJZSDRSclN4TjdwUlEzN2haU3JJeVphcElYUUI2aUtWTmFo?=
 =?utf-8?B?V1pKYWNmdGF4N0RNWVZ0dUNCcExDQVhWTThnUERFeHlVVjdEeGtCeVFjc2dZ?=
 =?utf-8?B?OWxYdzFOdUQydHRBQmJpeUwxQmsyOWx3VDhTQi90dmZBanRDZUdybFZMTGE1?=
 =?utf-8?B?bnhtK2owRTFESE4wMXpyOHJxUzEyODR6QXpaT0poaGdjbDI3Y2FOalE3VjJr?=
 =?utf-8?B?M2k1WnJvVVJhM1ZaNlpsY2wySTFZVjFpaElsdnZPRHMyRXlCeHQrY3lvMFJS?=
 =?utf-8?B?akxiYzlodEZPUnZBVjVMa2dwV1RZZjdBU251TkhQVU9kNFd5QXoxNVBPVE9h?=
 =?utf-8?B?RHBHd0ZIaXhxQmxmV20wZlBROEg0YzY4ZzlSa3d5ZW9qWGFyTUFGNFViR0E3?=
 =?utf-8?B?c0g5ajNvRVFvTGcrek9nemVjSUlOU2lDeHNNa1dqOVhFb0ZyTnlCOWFMQklh?=
 =?utf-8?Q?qdJotTH406jioK6hSwXL+PL1UpnOyHZxAiY0S8H?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b605c22-2cb0-41db-5aa6-08d976540b56
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 01:15:58.4877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dmylc3AXnHsoll+T003OGU2JIr5IwJzO/l2cysQlt/zNdlOnAE6dAWBdPDUZycoiTtuaCr574OqLehuRhevOLdZJ7b+sFYtYjfegHRxRGio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB1906
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
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "yulei.sh@bytedance.com" <yulei.sh@bytedance.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "osk@google.com" <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiBTZW50OiBGcmlkYXksIFNl
cHRlbWJlciAxMCwgMjAyMSAxMTo1OCBQTQ0KPiANCj4gT24gVGh1LCBTZXAgOSwgMjAyMSBhdCA4
OjM4IFBNIENoaWFXZWkgV2FuZw0KPiA8Y2hpYXdlaV93YW5nQGFzcGVlZHRlY2guY29tPiB3cm90
ZToNCj4gPg0KPiA+IEhpIFJvYiwNCj4gPg0KPiA+ID4gRnJvbTogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4NCj4gPiA+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgOSwgMjAyMSA4OjMz
IFBNDQo+ID4gPg0KPiA+ID4gT24gVGh1LCAwOSBTZXAgMjAyMSAxODoyOTowNSArMDgwMCwgQ2hp
YS1XZWkgV2FuZyB3cm90ZToNCj4gPiA+ID4gQWRkIGR0LWJpbmRpbmdzIGZvciBBc3BlZWQgVUFS
VCByb3V0aW5nIGNvbnRyb2xsZXIuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE9z
a2FyIFNlbmZ0IDxvc2tAZ29vZ2xlLmNvbT4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hpYS1X
ZWkgV2FuZyA8Y2hpYXdlaV93YW5nQGFzcGVlZHRlY2guY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+
ID4gIC4uLi9iaW5kaW5ncy9zb2MvYXNwZWVkL3VhcnQtcm91dGluZy55YW1sICAgICB8IDcwDQo+
ID4gPiArKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNzAgaW5z
ZXJ0aW9ucygrKQ0KPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvYXNwZWVkL3VhcnQtcm91dGluZy55YW1sDQo+
ID4gPiA+DQo+ID4gPg0KPiA+ID4gTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIERU
X0NIRUNLRVJfRkxBR1M9LW0NCj4gPiA+IGR0X2JpbmRpbmdfY2hlY2snDQo+ID4gPiBvbiB5b3Vy
IHBhdGNoIChEVF9DSEVDS0VSX0ZMQUdTIGlzIG5ldyBpbiB2NS4xMyk6DQo+ID4gPg0KPiA+ID4g
eWFtbGxpbnQgd2FybmluZ3MvZXJyb3JzOg0KPiA+ID4NCj4gPiA+IGR0c2NoZW1hL2R0YyB3YXJu
aW5ncy9lcnJvcnM6DQo+ID4gPg0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c29jL2FzcGVlZC91YXJ0LXJvdXRpbmcuZXhhbXBsZS5kdC55YW1sOg0KPiA+ID4gMDowOiAvZXhh
bXBsZS0wL2xwY0AxZTc4OTAwMDogZmFpbGVkIHRvIG1hdGNoIGFueSBzY2hlbWEgd2l0aA0KPiBj
b21wYXRpYmxlOg0KPiA+ID4gWydhc3BlZWQsYXN0MjYwMC1scGMtdjInLCAnc2ltcGxlLW1mZCcs
ICdzeXNjb24nXQ0KPiA+DQo+ID4gVGhlICJhc3BlZWQsYXN0MjYwMC1scGMtdjIiIGNvbXBhdGli
bGUgc3RyaW5nIGlzIGRlc2NyaWJlZCBpbiB0aGUgLnR4dCBmaWxlDQo+ICdhc3BlZWQtbHBjLnR4
dCcuDQo+ID4gRG8gd2UgaGF2ZSB0byBmaXJzdGx5IGNvbnZlcnQgdGhlIHRleHQgZmlsZSBpbnRv
IFlBTUwgb25lIHRvIHJlc29sdmUgdGhpcw0KPiBkZXBlbmRlbmN5IGlzc3VlPw0KPiANCj4gWWVz
LiBUaGlzIGlzIGEgc2lnbmlmaWNhbnQgY2hhbmdlIHRvIHRoZSBMUEMgYmxvY2sgYmluZGluZy4N
Cg0KVW5kZXJzdG9vZC4gV2lsbCBzZW5kIGEgdjQgcGF0Y2ggd2hpY2ggaW5jbHVkZXMgdGhlIFlB
TUwgY29udmVyc2lvbi4NClRoYW5rcy4NCg0KQ2hpYXdlaQ0KDQo=
