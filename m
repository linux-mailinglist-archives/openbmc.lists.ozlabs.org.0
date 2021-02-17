Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1C231E148
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 22:23:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgrRZ6sLlz3cV1
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 08:23:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=InventecCorp.onmicrosoft.com header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-InventecCorp-onmicrosoft-com header.b=ZSENm+3R;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=2a01:111:f400:febd::722;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=udupa.ashwini@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=InventecCorp.onmicrosoft.com
 header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-InventecCorp-onmicrosoft-com header.b=ZSENm+3R; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sg2apc01on0722.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febd::722])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgrRJ2n11z3cPm
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 08:23:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvznonP0TnV1fcRUG/LRmqRRjwwUymdJPCv1J+5SfwRmpEgMqmL707KLC2OCmXN7IiIAzsjxoMa3xK54nV6oqUHqntK4OXdSazty9kXbp1YW+worDs4xnsLwQVcLsyx/vyIwRMyilnZJhlgJ5Usd2nSc235liEvT2ACDelxW0AjT80JT793QVVBmPTKFh+yCdOWSfHsIeZnwc1jWA6YxLtDNFKJbWQSQAqIb2S3Prq16drR+7TFi/76c9v3HS1SUS3k/MSbwLWDk3N5pwMHqEjOp2GklrRGb1kcZtN9rrkiCHkPVFwzUxLA8VYMy8O84yeM34y2/BBvLwTM9j6Hppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzUm1xzZZ2MaX48/gBEz4sM9Xl4cu1BQS/4o2An5c4g=;
 b=CTJC65V53upFhYw8vEDbf+nL+jZcCZU0uBBW8s1N2O6fHvj0oQhxM1nBF4XbYUwl1xnQ97hR+6lm4Qw5CtfK2Udj7r5czzRYU45I5fvZTQdoLqd+groXjeLSGU7/CO4VitRxjXqAvthVZKxN/uo28TpZN33T1bPpgH5WomOG+BC24uMxfSaS0l2s4eqoynwyXrComO11oKpRVnzOlezQlNegcP6crYTMxjsie8I8lY9DqFROMkMpBcXfXKWp+jitXJGPOxgTy2o5P1+R3wKzXtEM7tEPmRFAM94qpQU5Gi2C0dTdSYunTezf54rcQrUoRcHEDi6d+oG1UkSNy2Emcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inventec.com; dmarc=pass action=none header.from=inventec.com;
 dkim=pass header.d=inventec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=InventecCorp.onmicrosoft.com; s=selector2-InventecCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzUm1xzZZ2MaX48/gBEz4sM9Xl4cu1BQS/4o2An5c4g=;
 b=ZSENm+3RzNzRGt+S9pW3rpozPScLAMEykvSXIlfsYuWuJDcq9Xsh7JzlophY/URy2f04ouWLaxQ6yQdRHCNWsx8CIJwE80LeSH94ouX4j2fYizevEAno7alxKe8tDdV46OO289jiyIskP4VqsqxYXUFKN2P97p+Sw3CQOyWSCXg=
Received: from SG2PR02MB2796.apcprd02.prod.outlook.com (2603:1096:4:59::20) by
 SG2PR02MB3957.apcprd02.prod.outlook.com (2603:1096:4:8c::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27; Wed, 17 Feb 2021 21:22:54 +0000
Received: from SG2PR02MB2796.apcprd02.prod.outlook.com
 ([fe80::740c:c7c0:872f:1ccc]) by SG2PR02MB2796.apcprd02.prod.outlook.com
 ([fe80::740c:c7c0:872f:1ccc%7]) with mapi id 15.20.3846.039; Wed, 17 Feb 2021
 21:22:54 +0000
From: Udupa.Ashwini ISV <udupa.ashwini@inventec.com>
To: Ed Tanous <ed@tanous.net>
Subject: RE: Redfish v1/Systems/system/EthernetInterfaces
Thread-Topic: Redfish v1/Systems/system/EthernetInterfaces
Thread-Index: AdcA6cGzNFkuOxBET+q6tGgjuo9o4ABSXQ1wAABT3oAAzSYpUAAAbvSAAAC2Q9AAAK55gAAAl2HA
Date: Wed, 17 Feb 2021 21:22:54 +0000
Message-ID: <SG2PR02MB2796CC3A1DDD20838992AF5185869@SG2PR02MB2796.apcprd02.prod.outlook.com>
References: <SG2PR02MB2796B5FB2DB9AAAE2594BA1E858B9@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <SG2PR02MB27961D3A938C94341747757C858A9@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <CACWQX807_KpeTHnMqPMt8E+h_ggMpKy0_Jr82HPV+oRushXdXw@mail.gmail.com>
 <SG2PR02MB2796736A2D3DCEB0AC9AEC9985869@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <CACWQX80r9dYEGbwftH32Sc6fRmDLHeYg24tdO+8hME9V_bDDCg@mail.gmail.com>
 <SG2PR02MB2796D7A6B15C18F348369F0A85869@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <CACWQX81Wg-+tcj+QbUCN8K=Ox7EeCmPL_b2VSYr3ziM-d2va4g@mail.gmail.com>
In-Reply-To: <CACWQX81Wg-+tcj+QbUCN8K=Ox7EeCmPL_b2VSYr3ziM-d2va4g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=inventec.com;
x-originating-ip: [24.6.83.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 100aaeba-1889-4ee2-81d1-08d8d38a304e
x-ms-traffictypediagnostic: SG2PR02MB3957:
x-microsoft-antispam-prvs: <SG2PR02MB3957B2957B992A3DDBDA470985869@SG2PR02MB3957.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HM+sFU1/85UQYKaB5IaTBYVuttq+H6vlk6iviGBIhg4uxhX9+NSzVfoyDULj9JzaNWb6M4DbugDwq+kqThbwS1t73uyrderFVDpQbhpQkpnugfrEr6VV6kZ/Ezo5vqyaOOaI74Oc3wMm9HhS9BVKJGHwKfVk0vC3ckUt3p79UYsetd5m3uoYnk1NmAZCvV6InZ3CZGMrB+SPrUp3Ni8jfB4uYG4MyYdkdb5bcqnWDNmyZVJqpgjLLul1/ZsmDkOeA4v6VqdUBwDPvzD97kash1eoXVr7Xu7YuH7D1R3rp3XN3RbAgCMD+EENw+9DvSlIJ0TFK6tgfweQtPIARzGnIH69l8BPNYJLWh9+xRTSx3hRgrYTpUKxLX4tMWKl8TB6Df65Yk8ZJukkalMZh8Q7lUzWuc4ndpMXHB3lmGtzomDzRxwmHrLNOeYcKF7bX30jXVSd/BLvxmFOiWinxEsO2QhNGRQ8gjcAmjgo6kwWKz2aHrBxajSWRfD2Xd9NGQ0phtJpeYVYFNVEwc9W35lN2QQKjYTWK4ftFahWcOWBZR/5P/rfnTiMIpQFIXpBfdENwVS2wfO09TwjaD1lVqlTzoeeEOoES7gsAKVGshXr6OY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR02MB2796.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(55016002)(966005)(86362001)(9686003)(33656002)(478600001)(316002)(186003)(83380400001)(6506007)(53546011)(4326008)(7696005)(26005)(6916009)(64756008)(66476007)(66446008)(8936002)(76116006)(2906002)(19627235002)(66946007)(66556008)(5660300002)(52536014)(71200400001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cmxjNWd1KzkzMVRFQVdCMjNBOE0rVlAvdXJ1dmRNdFpMSTlQVUQ1VE9wNjJL?=
 =?utf-8?B?RmUzSGlOTE5EeGNPY3dOcElmdGxhZitOMnZrend6bnlBTkFwTGZMU00wRnB0?=
 =?utf-8?B?czVMV3JEV0REUk10VE85SWRCYS8xZTMwdXFmU3FtekZHdTQwQUc3ODBOUHdu?=
 =?utf-8?B?TDBvdUM4RGhqbkNiRE1BSHQydk9iUm9ua2RCZjhxcjhqWFVzNUpGODFWUUpn?=
 =?utf-8?B?OVNScVRJY2hwcm9neG5QdXdGQ2I1eENlM3VNMlJyL3poTjQrKzVERGpMcURC?=
 =?utf-8?B?NWtNRlZCVWQ1dFByOE1FUnEyYXhFMzZEUTdycjdRV2xhSXFlQ0U0VkhRbmJ1?=
 =?utf-8?B?Q2EyNFpkTGY0ckZVQ3VxZ0taT3dCTGhQeGNPNlFBWitZZjdsYWpRNTFRRlF6?=
 =?utf-8?B?NUNQeGVNOXhXN3R1SnhkTHN4aGwwbFdaTEVWUHJjcWpnZ0FkTTFaN0FZQVpV?=
 =?utf-8?B?RFhxc0xDRis0NGZjajA1cnBybHUyaDVYSVMvUEZZQTQ4aFJpYXNLT1dQWTdY?=
 =?utf-8?B?cDhxbU9NN0xrcjZMYnMyU2xScjM5MUVTUThUaE1IajFuYm00LzNSU1Z6ajhs?=
 =?utf-8?B?ZWg4QUF1ZThvWHpOOXRweEFmNzM5NUdJZExLNCszOHMybUJteGJGb1JROEha?=
 =?utf-8?B?UmNqVktNcmVlVkRvOVJpRG8rUS9ieHRQOWtIT2R5QkhyQ3hha0pGQ3dJVGJq?=
 =?utf-8?B?eXIvZ3IzNytybnkvUUhkQ1VzWlpqZnRnNHpMT1doUkNRUmJEcUhZQlJ4UGcv?=
 =?utf-8?B?bExQQ09MTmY0S1hmdmxWWTBJSzYzN3RTVE1oNXZzQ2VmTFpGcEFWaFMxdm1Q?=
 =?utf-8?B?NWZNdzdNVm5JTUlhcFlkSEU3STFqK2xMR2JmbFpReFBCd3FWc0wyU09JWERV?=
 =?utf-8?B?VnB1QlB0QlcxVzlSeURmT2l1OEErNk1vc1ZTejRDSTQvazNPemxSbnBDaGxC?=
 =?utf-8?B?MkgvZG5iK09yNWYxRTl3NWxHdWgxc2t5ODlXUWZjYzZDMVpWbXlMeGtBbFBF?=
 =?utf-8?B?czk2ZmNGS05YUzM3TjJJb01EVTArODFpSW9Lc1lQejlLb2N4WE5iT2V1TnpJ?=
 =?utf-8?B?WGkzZ0l3SDlLSDgyelJpUWEzcG5FKzVBM0NWS1Z1TENocEtNRWlBUGNmRUFa?=
 =?utf-8?B?bHRBUk5RVis1TkdIRDNTdWo1eVVjMEZJMFpnd1lDVXQvYW1CYjlXdzNSRUV0?=
 =?utf-8?B?V2ROK3JBZjZ4Sy82WHZTam1EUjFYem85ZWFxd0IrMXZMdnhZeDdkY0tHV3BZ?=
 =?utf-8?B?aXErZUEyaDAzZGY4dFAzL2RrZXRwSWtWbmN0dnEyQmFKYUNqZFVib08zaVlI?=
 =?utf-8?B?SE42VkowK3hHc3FkcXA5TXlIaEw4K2ZwZjMveG9ZcVBwT0ZCRS9WUEZlK1RH?=
 =?utf-8?B?VU5WZEFyMDUwdFZpdFVMWGJheFdKRndsQVpkMGhOVWZEMnNYbXZjdVNkMzFU?=
 =?utf-8?B?NmNSQmVVS09telI2c1paaFVQQ05aK1hTQUd4MloySEN4WFFKWWkzbTRmZEpL?=
 =?utf-8?B?RlpUNEN4ZUNvempZUVQ4dTM4T1hndUhDbEswZ2R1YWlwRnFrRWJWS3ZwSXpq?=
 =?utf-8?B?Z2t5WUdlOFhMWkRkS0N4WXVpUTJ0WHcwRU10VXdHejhCMkNOK2NkMU1VcFJk?=
 =?utf-8?B?bFBpZk5vSVMzbTU1cTdVNzlqZ045VFY2YnpPY2dvRTV5cURBV0M0dC9DdEFF?=
 =?utf-8?B?cTlPWGJxUU9pcnFpY3ZHQW4zck1vQk9zclprZUh3alBVUk9PNlhYV2ZGWjF0?=
 =?utf-8?Q?JbAUGMAT3cbp/rWP4k=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: inventec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR02MB2796.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 100aaeba-1889-4ee2-81d1-08d8d38a304e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2021 21:22:54.1304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ae41f0c-acca-40f1-9c63-49475ff38512
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g9skEETt1lbj43wVupWP0wM07Tn5D0fpTPdQ+kGk5XMmvOaY8iVm/oIX2ADQXa9S6cIvQmNZYfYQ90tdJKs+bovx9u3YkgM/21QwcKc3QGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB3957
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gV2VkLCBGZWIgMTcsIDIwMjEgYXQgMTI6MTMgUE0gVWR1cGEuQXNod2luaSBJU1YgPHVkdXBh
LmFzaHdpbmlAaW52ZW50ZWMuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhpIEVkLA0KPiA+DQo+ID4N
Cj4gPg0KPiA+IEl0cyBJbnZlbnRlYyBwbGF0Zm9ybS4NCj4gPg0KPiA+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9vcGVuYm1jL29wZW5ibWMvdHJlZS9tYXN0ZXIvbWV0YS1pbnZlbnRlYw0KPiA+DQo+ID4g
SSBqdXN0IHdhbnRlZCB0byBrbm93IGhvdyB0byBpbXBsZW1lbnQgL3JlZGZpc2gvdjEvU3lzdGVt
cy9zeXN0ZW0vRXRoZXJuZXRJbnRlcmZhY2VzLg0KPg0KPiBFeGNlbGxlbnQsIHRoYXQgaGVscHMu
ICBJIG9yaWdpbmFsbHkgbWlzcmVhZCwgYW5kIHRob3VnaHQgdGhlIGludGVyZmFjZSB3YXMgbWlz
c2luZyBvbiB0aGUgcGxhdGZvcm0sIG5vdCB0aGF0IHlvdSB3ZXJlIHRyeWluZyB0byBhZGQgaXQg
dG8gcmVkZmlzaC4NCj4NCj4gPg0KPiA+DQo+ID4NCj4gPiBSZWdhcmRzLA0KPiA+DQo+ID4gQXNo
d2luaQ0KPg0KPiBQbGVhc2UgZG9uJ3QgdG9wIHBvc3QuDQo+DQo+ID4NCj4gPg0KPiA+DQo+ID4g
RnJvbTogRWQgVGFub3VzIDxlZEB0YW5vdXMubmV0Pg0KPiA+IFNlbnQ6IFNhdHVyZGF5LCBGZWJy
dWFyeSAxMywgMjAyMSAxMDoxOCBBTQ0KPiA+IFRvOiBVZHVwYS5Bc2h3aW5pIElTViA8dWR1cGEu
YXNod2luaUBpbnZlbnRlYy5jb20+DQo+ID4gQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0K
PiA+IFN1YmplY3Q6IFJlOiBSZWRmaXNoIHYxL1N5c3RlbXMvc3lzdGVtL0V0aGVybmV0SW50ZXJm
YWNlcw0KPiA+DQo+ID4NCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+DQo+ID4gT24gU2F0LCBGZWIg
MTMsIDIwMjEgYXQgMTA6MTEgQU0gVWR1cGEuQXNod2luaSBJU1YgPHVkdXBhLmFzaHdpbmlAaW52
ZW50ZWMuY29tPiB3cm90ZToNCj4gPg0KPiA+DQo+ID4NCj4gPiBIaSwNCj4gPg0KPiA+DQo+ID4N
Cj4gPiBJIGFtIG5ldyB0byBPcGVuQm1jIGFuZCBSZWRmaXNoLg0KPiA+DQo+ID4gSSBzYXcgaW4g
Ym1jd2ViL1JlZGZpc2gubWQsIHRoYXQgYmVsb3cgUmVkZmlzaCBpcyB0YXJnZXRlZCBmb3IgT3Bl
bkJtYzoNCj4NCj4gVGhpcyBkb2MgaXMgcmVhbGx5IG9sZCwgYW5kIHdhcyBvcmlnaW5hbGx5IHdy
aXR0ZW4gYXMgYW4gaW5pdGlhbCBzdGFiIGF0IHdoYXQgaW50ZXJmYWNlcyB3ZSBzaG91bGQgd3Jp
dGUuICBVbmZvcnR1bmF0ZWx5LCB3aGVuIGl0IGdvdCBjb252ZXJ0ZWQgaW50byBhICJoZXJlJ3Mg
dGhlIGludGVyZmFjZXMgd2Ugc3VwcG9ydCB0b2RheSIgZG9jLCB0aGF0IHBhdGggZGlkbid0IGdl
dCBzY3J1YmJlZC4gIFdlIGRvbid0IGhhdmUgYW4gaW1wbGVtZW50YXRpb24gb2YgaXQgdG9kYXku
ICBJIGNhbiBnZXQgYSByZXZpZXcgb3BlbiB0byB1cGRhdGUgdGhlIGRvYy4NCj4NCj4gPg0KPiA+
IC9yZWRmaXNoL3YxL1N5c3RlbXMvc3lzdGVtL0V0aGVybmV0SW50ZXJmYWNlcw0KPiA+DQo+ID4N
Cj4gPg0KPiA+IEJ1dCwgaW4gcmVkZmlzaC1jb3JlL2xpYi9zeXN0ZW1zLmhwcCwgSSBkb27igJl0
IHNlZSBFdGhlcm5ldEludGVyZmFjZXMgYW5kIEkgZG9u4oCZdCBzZWUgaXQgb24gbXkgc2VydmVy
IFJlZGZpc2ggdG9vLg0KPg0KPiBUb2RheSwgd2UgZG9uJ3QgaGF2ZSB0aGlzIGltcGxlbWVudGVk
IGJlY2F1c2Ugd2UgZG9uJ3QgcmVhbGx5IGhhdmUgYSBwYXRoIHRvIGdldCB0aGF0IGluZm9ybWF0
aW9uIGZyb20gdGhlIGhvc3QuICBEb2luZyB0aGF0IHdvdWxkIHJlcXVpcmUgZWl0aGVyIGFuIGlu
LWJhbmQgYXBwbGljYXRpb24gcnVubmluZyBvbiB0aGUgbWFpbiBwcm9jZXNzb3IgdG8gc2VuZCBu
ZXcgaXAgYWRkcmVzc2VzIHRvIHRoZSBibWMsIG9yIGFuIE5DU0ksIE1DVFAsIG9yIFBMRE0gY29u
bmVjdGlvbiBkaXJlY3RseSB0byB0aGUgTklDIHRoYXQgc3VwcG9ydGVkIGdldHRpbmcgdGhhdCBs
ZXZlbCBvZiBpbmZvcm1hdGlvbi4NCj4gQm90aCBvZiB3aGljaCBsaWtlbHkgcmVxdWlyZSBhIG5l
dyBkYWVtb24gdG8gZXhwb3NlIHRob3NlIEFQSXMgdG8gZGVidWcuDQoNClRoYW5rcyBFZC4NClNv
LCBvbmx5IHRob3NlIGltcGxlbWVudGVkIGluICJibWN3ZWIvcmVkZmlzaC1jb3JlL2xpYi8iICBh
cmUgY3VycmVudGx5IGltcGxlbWVudGVkIGluIE9wZW5CTUMgUmVkZmlzaCByaWdodD8NCkkgZG9u
4oCZdCBzZWUgYmVsb3cgaW1wbGVtZW50ZWQgdG9vOg0KU3lzdGVtcy9zeXN0ZW0vQm9vdE9wdGlv
bnMNClBsZWFzZSBjb25maXJtLg0KDQpCdXQsIGFyZSB0aGVzZSBpbXBsZW1lbnRlZD8gDQoxLiBT
eXN0ZW1zL3N5c3RlbS9OZXR3b3JrSW50ZXJmYWNlcw0KMi4gU3lzdGVtcy9zeXN0ZW0vUENJZUZ1
bmN0aW9ucw0KSWYgc28sIHdoYXQgY2hhbmdlcyBhcmUgbmVlZGVkIHRvIG1ha2UgdGhlc2Ugd29y
a2luZz8NCg0KDQo+IFdlIGRvIGhhdmUgL3JlZGZpc2gvdjEvU3lzdGVtcy9oeXBlcnZpc29yL0V0
aGVybmV0SW50ZXJmYWNlcyB0b2RheS4NCj4gV2UnZCBpZGVhbGx5IHdhbnQgdG8gZm9sbG93IHZl
cnkgY2xvc2VseSB0byB3aGF0IHRoYXQgZG9lcywgZXhwb3NlIGEgbmV3IHBhdGggb24gREJ1cyB0
aGF0IGltcGxlbWVudHMgdGhlIHh5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29yay5FdGhlcm5ldElu
dGVyZmFjZSBpbnRlcmZhY2UsIGFuZCBncmFiIHRoZSBkYXRhIGZyb20gaXQuDQo+DQo+ID4NCj4g
Pg0KPiA+DQo+ID4gV2hhdCB1cHN0cmVhbSBzeXN0ZW0gYXJlIHlvdSB0cnlpbmcgdGhpcyBvbj8g
IElmIHlvdXIgcGxhdGZvcm0gaXNu4oCZdCB1cHN0cmVhbSwgY2FuIHlvdSBwb2ludCBhdCB0aGUg
Y29kZSByZXZpZXcgd2hlcmUgeW914oCZcmUgYWRkaW5nIGl0Pw0KPiA+DQo+ID4NCj4gPg0KPiA+
IElmIHlvdSBkb27igJl0IGhhdmUgZWl0aGVyLCB0YWtlIG5vdGUgdGhhdCBpdOKAmXMgcmVhbGx5
IGRpZmZpY3VsdCB0byBoZWxwIGRlYnVnIG9yIG1ha2Ugc3VnZ2VzdGlvbnMgZm9yIHBsYXRmb3Jt
cyB0aGF0IHdlIGNhbuKAmXQgc2VlIHRoZSBjb2RlIGZvci4NCj4gPg0KPiA+DQo+ID4NCj4gPiBJ
dHMgb25seSBwcmVzZW50IGluIE1hbmFnZXJzL2JtYy9FdGhlcm5ldEludGVyZmFjZXMuDQo+ID4N
Cj4gPg0KPiA+DQo+ID4gSG93IGRvIEkgYWRkIFN5c3RlbXMvc3lzdGVtL0V0aGVybmV0SW50ZXJm
YWNlcyBSZWRmaXNoIHN1cHBvcnQ/IFdoYXQgY2hhbmdlcyBkbyBJIG5lZWQgdG8gbWFrZT8NCj4g
Pg0KPiA+DQo+ID4NCj4gPiBSZWdhcmRzLA0KPiA+DQo+ID4gQXNod2luaQ0KPiA+DQo+ID4NCj4g
Pg0KPiA+IC0tDQo+ID4NCj4gPiAtRWQNCg==
