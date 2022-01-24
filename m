Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1FC497735
	for <lists+openbmc@lfdr.de>; Mon, 24 Jan 2022 03:23:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jhv1H6FTbz30Ll
	for <lists+openbmc@lfdr.de>; Mon, 24 Jan 2022 13:23:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=Se400Cfm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:febc::706;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=Se400Cfm; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0706.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::706])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jhv0n6pwXz2xrj
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jan 2022 13:23:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ighSk7kjfOYgY2kTsLSYnFveUJaNvE6nyqckGYB+qI51C9RV0bc91Gf/WNzUJZbGnrbyeBoQGxNF8TeRmUjd0TzrYjqRn4fy/34s0ZjS7gv9iBNbubbE8lFJ5EbyaZ33yU6ZEy7iDYME2S/Kfwz8vlkNCgRbYxKfqU+85ah68jVXL+UCFjv5E/Ue018c4xX4kCcWCq2vmcHoTy/Q8W5VLfqx/ty8msHW/01FRUztvob33e5CWYiwqxAW0F8TGt7zKJy2lGK8iTCWAh4H3+hMQxbHEPdyVkl2xQVvvmx827ifOXJDDb3xeO3C3pTYiUFqaZLRiSi5RXIBMnnCPulYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCPcKvuWv220XgJJnO+WtqiVsnP+6AqN7N3/rWY/9O8=;
 b=aTtvqPKXScX3xC9A85uLCTY71Enx7cl58otp5j1FK2JYQr8EU9pErwgd7JZZLfzBxLOd/29YoPdB73T3naPSNLguEO1fBs/UUBnsNyiisSXzbAO9fmDVZlgUWF96EW4KsAFExDg688rA4ZdObPdHnZJ1iMf1vZyQ9+NMIpu92x6K6Mfxu/a/Cr4DPvlT2ro4dTDLp7a3je64m0Kdnz6DaqkwZ/4NfzxVPThJhzeJnlhkcRkBSSxKwyTnVAyLtZATaJhrNrME/ZCGvS7+nkrkrXjhiZCElKyLWcm/W2tSMLK3DA4qeS0VsFWMaxPRvTxZumkM9kWNzXgwjJuTLOSxqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCPcKvuWv220XgJJnO+WtqiVsnP+6AqN7N3/rWY/9O8=;
 b=Se400CfmQ3nkA0Y8GlSpweLvUnU33t97HeiT+dfz7QoH613E5kVFF0AtYHccLAR7XU8w19D9byd9IEsde1hENGkWyl3t9bv6QRz2WnkP1lXTUTHptKFwkolGGiRNY9tTrtyiJmgfoJjbwYP/CaVe3yYj739ZqT0BohfrwmjYDWo=
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com (2603:1096:203:8f::22)
 by TY2PR04MB2736.apcprd04.prod.outlook.com (2603:1096:404:3e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Mon, 24 Jan
 2022 02:22:51 +0000
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::5994:f7bb:bf49:351c]) by HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::5994:f7bb:bf49:351c%5]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 02:22:51 +0000
From: =?big5?B?U3BlbmNlciBLdSAopWqlQLfsKQ==?= <Spencer.Ku@quantatw.com>
To: i.kononenko <i.kononenko@yadro.com>, Ed Tanous <edtanous@google.com>
Subject: RE: Implement Ethernet Interface Properties
Thread-Topic: Implement Ethernet Interface Properties
Thread-Index: AdfmmeLt8bsv+QLKRK2scPouEluJvQARsvaAABzs1sAJbZHE8AA0o1EAALl+nwA=
Date: Mon, 24 Jan 2022 02:22:51 +0000
Message-ID: <HK0PR04MB3299149FF576D92D818FFD6CE45E9@HK0PR04MB3299.apcprd04.prod.outlook.com>
References: <HK0PR04MB329947E4E37431B956A8D17AE4689@HK0PR04MB3299.apcprd04.prod.outlook.com>
 <CAH2-KxDx2BwNMWaGvzUeQZVt4me5WSBvkni3A0ig-ohtxiWEUQ@mail.gmail.com>
 <HK0PR04MB3299920FAFF33D27C503A218E4699@HK0PR04MB3299.apcprd04.prod.outlook.com>
 <HK0PR04MB3299DA39BBF0596CA83BC41EE45A9@HK0PR04MB3299.apcprd04.prod.outlook.com>
 <8076733c-ae3d-c239-d7ed-12d6612854c8@yadro.com>
In-Reply-To: <8076733c-ae3d-c239-d7ed-12d6612854c8@yadro.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b167c134-0bf5-47dc-6a52-08d9dee06be3
x-ms-traffictypediagnostic: TY2PR04MB2736:EE_
x-microsoft-antispam-prvs: <TY2PR04MB2736D0B0C35C8BB44D7E4859E45E9@TY2PR04MB2736.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FVjzgfMr2XdcCKw7gNDX24DRDYfA8qNzZWdEFsXMoF/LEdDRdiEQ5MitLXCu0vJUSXHLG3LIYUANPFtOMc3Z31jm94Xm/upXuxiizmJZukukTvPZfHEwiwvLkPkUrqYDO1O80jK7F4N+41iaMXiaN5op4iM0Yfi89GP5BsbXldn3upmfDTjaNThSoNql7ebRY3+Bez/J8UMSeD25+xdTtuY6iyhi11C3r/CIsIdW01QMO9AFbsGCJBRnoCNUwG3Ke5xFOQ88giKla5D+Bb1mzzNeQfxAUXIoPc98V8rKOZo6AOQfq+iRd3pDAs+hK4DARcXiUwIivwSiiING8F4okGxkjba5JZHhzBf3fiHryWAVfKbhrioumkqSgM/ODvrgzV4XxWzG4IebwM0CSM4fk+DFMPCqKPFYagQKpSRASxAUU86W91fxNrbDH8NSrvpNNZEYGpLdidp82yu7cza9gd0WajHWNrtM73vJ7UBBYqAg82ElSg3Y5DpUp1IvkdB5ATjrTIBg95ZujkEBwE6D+R/v43Mf5vLg2KH4nOj82HiSncWIHMwPafpe3MuArSq9rdmbJ6yMA3Tak9wOpi0CTL+HG43ugaB83YCL/0UbxCWGc+XVBAgziHVYNvTJwY0kx+hIIz9PgbDHdJPf6tCwtvT7iL5YX3Pf61/544gDvFRYqg8aRFaxs0QGewnplrpT3BqWjXijkD4L9xiA8TxMvbpzEL22ifvGK8lAaZU17ReGApDJpHuKf7R+2cVcSolC/HArZMycGeWxZmzUdldPjfABrcnVa6OizTW2kEkfqDk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3299.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(55016003)(9686003)(966005)(66446008)(110136005)(66476007)(3480700007)(54906003)(316002)(7696005)(66946007)(8676002)(66556008)(64756008)(86362001)(45080400002)(122000001)(71200400001)(38100700002)(4326008)(6506007)(83380400001)(76116006)(38070700005)(8936002)(26005)(85182001)(53546011)(2906002)(508600001)(5660300002)(33656002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?aitRKzJFY1FtVkZaOGFYSGFnQitmTXpTK3daYU1pb2Fsd05GZExydnJxMTNwUHky?=
 =?big5?B?RkQrS0NSN3NvMkpGUHV6MyswUjZMSEhZdk00akVYUFh4aFFJNGY5OHJndkw3RWxt?=
 =?big5?B?MTY3dTREL2NqU0lhaVBZS1JHY2JlUE1FaFBoWGRkWHptaHlPTUV2Y1hiZzZZTll5?=
 =?big5?B?c25odVdZZHJKQXNYc3dqV0dMVVpZV3VlQVVncnBHUVdZMW9WdzYxbEk5Z2IvMW92?=
 =?big5?B?cXhkY0tOMlExWjlXVHdKQm1pbVJpVi9DbFNWUmN3L25BU3RwRlR6K2ZKcDQvK08v?=
 =?big5?B?K1B4Ky9STzl5c0RQb3dpS05GSm9pMnFYT2VrZXh4YzJvbTltVGhmVlJZM1VrU1Nk?=
 =?big5?B?bU5pdUk5aVZ3V0tSbk9Ja1pQYVpDVy81czU3dWlLNFJBTzJuQzJFSStwVC8vS2hP?=
 =?big5?B?WGlqZTJsRjYvWkI4cldoelJoNEk4Yk1Eb0F3R2cwaHlBTGo0TERCNjNyMzlwQ09q?=
 =?big5?B?OHFmeEdQVFpZc0JzTFRpSjM2SksyeFczUnhuUlcrdk4zSTFkZ2lpbnBFeUVUVFMy?=
 =?big5?B?QzVWWXo5ajcvL1Y0M1lKUGQzYXNPL1psNWlQYjZLVHpXbm55cFI1T1FMZlFoL2tM?=
 =?big5?B?UjFtamhxcTV0MnVGa2R1UjM4N25WdTVlUWhjWFR3VnJPQ20vN20weUlLektmUEdw?=
 =?big5?B?OFZuYzN5d3U4V0RGV2drVi9rTmlVbXpUQ1hZekRvc0pDb08vTEZqQXJTVUJnbGRn?=
 =?big5?B?Z04wMFFVeVo1UGNqdnhQSGpBZTVaNjViQmk3bkxDaVk5WXk3S1B0aXUyVHd5MnNN?=
 =?big5?B?Mi9acDNlY3REajJIdU5Pd1A4aGhXT3pqUXQ5aTQxaU5CSWJpbjVBK1VWUGRLWmxy?=
 =?big5?B?NERlaUJwWDVCVFBqampZOGNjRkVLYi9iUzNVek9SaFJQSkFTMFZGekhwOHhzU3g2?=
 =?big5?B?Unh6ZDU2eDZDejkvSHIxdlpBaUdqZitlcFVnb2c1aXpDUE9WcG8wd1ZZZC9WWisw?=
 =?big5?B?RkJkOVJRam8wV1Q5Z3lSeHU5OXJLdU5leTR3L05mdWltYzYxSllreU1YRjVsb3JH?=
 =?big5?B?cUNwdytyUHUwaG9YN1F6a2VBc3ZFcG1xelhvV3hOL2N6aiswMXNzYk56STU0SmhJ?=
 =?big5?B?dG9vT1oyNi9xWHNvY3JOZ1NKVGNYSXRJalJObHM3amxxc003dSt1Y1hIQkZ5UTRM?=
 =?big5?B?RHFxZktSaTcvZjdrY1pMZXA4NXg2OGozbnNOaTEyTnpkbkFaWDQrM2VSQURJOTlK?=
 =?big5?B?VVphcTBCaUNYY2xhckdjaXRFNUY2UXhUbDN0OU1BVFZzbXRRMVlMT1FWTWpqNktv?=
 =?big5?B?V0w0Rjd4QldLeUZVcDdTRER1eitYZGRwVzRVUk9NcVBENmxHTnhMREIxenBBcmxC?=
 =?big5?B?Sk5DQlB1NmtDTERmWkpIWFhBOXV2empZZ0diSDl1K2VWTzU1eWNiUmVZTmlNQVN5?=
 =?big5?B?UERBVzZML005cERFdlpuK0E1OFRudWxiZXh0SXpVZXBqY0VPZVlhS3h1eXgzaDVJ?=
 =?big5?B?S0NYUVd4Wk5sNUE1T1Y1WUdFSG1JdWlkL1JNby9yRDVzWURmZ2htV1BDdkZGVzNn?=
 =?big5?B?MUtlY05Xb1l2REdId1ZNOHdIdm5jeHN2YVk0WVRnSTgzMjhmOTF1S05FUnhJdEpW?=
 =?big5?B?YVR6R3ZaMmh3d1BjVE9xMHVkV1U1SkF3NnRCSklMN29JMjQxeS92T2R6RmNYTStB?=
 =?big5?B?RnJIRm05eVhJcXBib1lMZStNVUQ4WlpKenJPNXFpK3lrd0J1bTBGZnhuVERtYi9j?=
 =?big5?B?dkkySnZUek05RmF4WlY4bzZZdG93RngrYXh2VzhqQnRWZi8yTFgyZUdFVERKd2tH?=
 =?big5?B?MVkxeHVBdzFGRWo3OHNCaWI2THB2MktXNUhFek1zQysvdjdYc1Bybko2OUhmNzNH?=
 =?big5?B?cjFnWHhjK1FSTkR5SFM3YkJTYnFob3BMSldYSzNHdW41Qk5mQ0p5TEUyeHhWS0U4?=
 =?big5?B?NWdPeUt6bmg3enBibmF5bU1NbkRUUjArSkpnZ1hvQ1E0eUhxTjB6Rncra09jOS9S?=
 =?big5?B?S0R1YStXc29UNW9VL29GRi9qM0R4Ynk3TEszQ1lIUXAvbjdPd1g3bzVXS1Roenpw?=
 =?big5?B?MllBbTllaHAvYU11bG8waE1ka2pkdExMRlhabllXaEpwenNOcDUrcjBHRWt6THFo?=
 =?big5?Q?BOn3gDNdf14=3D?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3299.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b167c134-0bf5-47dc-6a52-08d9dee06be3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2022 02:22:51.2648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /D0ZaNWgbDT6lfts6vEg78CNu/4wHFdxtV96vFsOfATdCPALnxqjiRDXvHR9X2g1ZJZvWWnhOTkHB83FhwUQhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB2736
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>,
 =?big5?B?TGl0enVuZyBDaGVuICizr6dR2nop?= <Litzung.Chen@quantatw.com>,
 Nan Zhou <nanzhou@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgS29ub25lbmtvLCBUaGFua3MgZm9yIHlvdXIgcmVwbHkhDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogaS5rb25vbmVua28gPGkua29ub25lbmtvQHlhZHJvLmNvbT4N
Cj4gU3ViamVjdDogUmU6IEltcGxlbWVudCBFdGhlcm5ldCBJbnRlcmZhY2UgUHJvcGVydGllcw0K
PiANCj4gSGkgU3BlbmNlciENCj4gDQo+IE9uIDIwLjAxLjIwMjIgMTE6NDIsIFNwZW5jZXIgS3Ug
KKVqpUC37Ckgd3JvdGU6DQo+ID4gSGkgQWxsLA0KPiA+DQo+ID4gV2UgZmluYWxseSBkZWNpZGUg
dG8gaW1wbGVtZW50IHNpeCBwcm9wZXJ0aWVzIHRvIEV0aGVybmV0IGludGVyZmFjZToNCj4gPiBS
eFBhY2tldHMsIFR4UGFja2V0cywgUnhCeXRlcywgVHhCeXRlcywgUnhEcm9wcGVkLCBhbmQgVHhE
cm9wcGVkLg0KPiA+DQo+ID4gVGhvc2UgaW5mb3JtYXRpb24gY29tZSBmcm9tIEV0aGVybmV0IHN0
YXRpc3RpY3MgYW5kIHdlIGNhbiByZWFkIHRoZQ0KPiA+IGZpbGUgdG8gZ2V0IHRoZSBwcm9wZXJ0
eSB2YWx1ZSBkaXJlY3RseS4gKHVuZGVyDQo+ID4gL3N5cy9jbGFzcy9uZXQvPEV0aGVybmV0IG5h
bWU+L3N0YXRpc3RpY3MpDQo+ID4NCj4gPiBGb3IgdGhlIHN1aXRhYmxlIHByb3BlcnR5IGluIEV0
aGVybmV0SW50ZXJmYWNlIG1vZGVsLCB3ZSBnb3QgdGhlDQo+ID4gZmVlZGJhY2sgZm9ybSBSZWRm
aXNoIGZvcnVtIGFuZCB0aGV5IHNhaWQgT0VNIHByb3BlcnRpZXMgd291bGQgYmUgdGhlDQo+ID4g
b25seSBvdGhlciBvcHRpb24gYXQgdGhpcyB0aW1lLiBGb3IgbW9yZSBkaXNjdXNzaW9uIGRldGFp
bDoNCj4gPiBodHRwczovL2FwYzAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91
cmw9aHR0cHMlM0ElMkYlMkZyZWRmDQo+ID4gaXNoZm9ydW0uY29tJTJGdGhyZWFkJTJGNTc5JTJG
YWRkaXRpb25hbC1pbmZvcm1hdGlvbi1ldGhlcm5ldC1pbnRlcmZhYw0KPiA+DQo+IGUmYW1wO2Rh
dGE9MDQlN0MwMSU3Q1NwZW5jZXIuS3UlNDBxdWFudGF0dy5jb20lN0NlMjEyMGE3YTJiYjI0Ng0K
PiA5ZjQwOWMwDQo+ID4NCj4gOGQ5ZGJmNDYxMDAlN0MxNzliMDMyNzA3ZmM0OTczYWM3MzhkZTcz
MTM1NjFiMiU3QzElN0MwJTdDNjM3NzgyDQo+IDY2NjEzMTgNCj4gPg0KPiA1MzEwMyU3Q1Vua25v
d24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdQ0KPiBNeklp
TENKQg0KPiA+DQo+IFRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCZhbXA7c2RhdGE9
ZklFT0RLUmYxZWxBb2VwSWRTYnBHDQo+IFNMOW5ZDQo+ID4gTUUzRlRFUW0xSW9vSktPTHMlM0Qm
YW1wO3Jlc2VydmVkPTANCj4gPg0KPiANCj4gSSdkIHN1Z2dlc3QgcmVmZXJyaW5nIHRvIHRoZSBb
MV0gKio5LjcuIFJlc291cmNlIGV4dGVuc2liaWxpdHkqKiB0byBleGFtaW5lIHRoZQ0KPiBwcm9w
ZXIgd2F5IG9mIE9FTS1wcm9wZXJ0aWVzIGRlZmluaXRpb24uDQo+IA0KDQpBcyB3ZSBkaXNjdXNz
ZWQgaW4gdGhlIFBSICwgSSBuZWVkIHRvIGRlZmluZSBhbmQgY3JlYXRlIHRoZSBKU09OIHNjaGVt
YSAiT2VtRXRoZXJuZXRJbnRlcmZhY2UiLg0KSSB3aWxsIHB1c2ggdGhlIHNjaGVtYSB0byBnZXJy
aXQgc29vbiB3aGVuIEkgZmluaXNoIGl0Lg0KDQo+IA0KPiA+IFRoZSBmb2xsb3dpbmcgb3V0cHV0
IGlzIHRoZSByZXN1bHQgb2YgbXkgY3VycmVudGx5IE9FTSBpbXBsZW1lbnQ6DQo+ID4gaHR0cHM6
Ly8ke2JtY30vcmVkZmlzaC92MS9NYW5hZ2Vycy9ibWMvRWhlcm5ldEludGVyZmFjZXMvZXRoMA0K
PiA+IHsNCj4gPiAgICJAb2RhdGEuaWQiOiAiL3JlZGZpc2gvdjEvTWFuYWdlcnMvYm1jL0V0aGVy
bmV0SW50ZXJmYWNlcy9ldGgwIiwNCj4gPiAgIC4uLg0KPiA+ICAgIk9lbSI6IHsNCj4gPiAgICAg
IlN0YXRpc3RpY3MiOiBbDQo+IA0KPiBMb29rcyBsaWtlICJAb2RhdGEudHlwZSIgcmVxdWlyZWQg
ZmllbGQgaXMgbWlzc2VkLiBUaGUgKio5LjcuNC4gT0VNIHByb3BlcnR5DQo+IGV4YW1wbGVzKioN
Cj4gY29udGFpbnMgdGhlIGV4YW1wbGUgb2YgdGhlIHJpZ2h0IHdheSB0byBkZWZpbmUgT0VNLXBy
b3BlcnRpZXMuDQo+IA0KPiA+ICAgICAgIHsNCj4gPiAgICAgICAgICJSeEJ5dGVzIjogNDgyNDQw
MjYsDQo+ID4gICAgICAgICAiUnhEcm9wcGVkIjogMjIyODU2LA0KPiA+ICAgICAgICAgIlJ4UGFj
a2V0cyI6IDQ4NDMxNSwNCj4gPiAgICAgICAgICJUeEJ5dGVzIjogODI1ODQ1LA0KPiA+ICAgICAg
ICAgIlR4RHJvcHBlZCI6IDAsDQo+ID4gICAgICAgICAiVHhQYWNrZXRzIjogNTQ3Mg0KPiA+ICAg
ICAgIH0NCj4gPiAgICAgXQ0KPiA+ICAgfSwNCj4gPiAgICJTcGVlZE1icHMiOiAxMDAsDQo+ID4g
ICAuLi4NCj4gPiB9DQo+ID4NCj4gPiBCdXQgaXQgY2Fubm90IHBhc3MgdGhlIFJlZGZpc2ggdmFs
aWRhdG9yLCBhbmQgaGVyZSBpcyB0aGUgZXJyb3IgbWVzc2FnZXM6DQo+ID4gRVJST1IgLSBUaGlz
IGNvbXBsZXggb2JqZWN0IFJ4Qnl0ZXMgc2hvdWxkIGJlIGEgZGljdGlvbmFyeSBvciBOb25lLCBi
dXQgaXQncw0KPiBvZiB0eXBlIC4uLg0KPiANCj4gRG9lcyBpdCByZXF1aXJlIHRvIGhhdmUgdGhl
IGludGVnZXIgdmFsdWVzPyBJIGd1ZXNzIGVhY2ggbWVudGlvbmVkIGZpZWxkIG1pZ2h0DQo+IGNv
bnRhaW4gc3RyaW5nIHZhbHVlcy4NCj4gDQoNCkkgdGhpbmsgdGhlIG1haW4gcmVhc29uIHdoaWNo
IG9jY3VycyB0aGUgZXJyb3IgaXMgdGhhdCBJIGRpZG4ndCBkZWZpbmUgdGhlIG9kYXRhIElEIGFu
ZCB0eXBlLiANClRoZXkgY2Fubm90IGZpbmQgdGhlIHJlZmVyZW5jZSB0byBhbmFseXplIHRoZSBw
cm9wZXJ0eS4gSSBhZGQgdGhlIHRlbXAgb2RhdGEgZmllbGQgKHBhdGNoIDMgaW4gdGhlIFBSKSwg
YW5kIHRoZSBlcnJvciBtZXNzYWdlcyBoYXMgYmVlbiBjaGFuZ2VkIHRvIFdSQU5JTkc6DQoNCldB
Uk5JTkcgLSBDb3VsZG4ndCBnZXQgc2NoZW1hIGZvciBvYmplY3QsIHNraXBwaW5nIE9lbU9iamVj
dCBPcGVuQm1jDQpXQVJOSU5HIC0gU3RhdGlzdGljcyBub3QgZGVmaW5lZCBpbiBzY2hlbWEgQ29t
cGxleCBPcGVuQm1jIFJlc291cmNlLk9lbU9iamVjdCAoY2hlY2sgdmVyc2lvbiwgc3BlbGxpbmcg
YW5kIGNhc2luZykNCg0KSSB3aWxsIHJ1biB0aGUgUmVkZmlzaCB2YWxpZGF0b3IgYWdhaW4gd2hl
biBJIGZpbmlzaCB0aGUgc2NoZW1hLg0KDQo+ID4gRVJST1IgLSBSeEJ5dGVzOiBDb3VsZCBub3Qg
ZmluaXNoIGNoZWNrIG9uIHRoaXMgcHJvcGVydHkgKCdpbnQnIG9iamVjdCBpcyBub3QNCj4gaXRl
cmFibGUpDQo+ID4NCj4gPiBJcyB0aGVyZSBhbnl0aGluZyBJIGRpZG4ndCBub3RpY2U/IE9yIGhh
cyB0aGVyZSBhbnkgc3BlYyBvciBleGFtcGxlIHRoYXQgSSBjYW4NCj4gZm9sbG93IHRvIGltcGxl
bWVudD8NCj4gPg0KPiA+IEkgaGFkIGFscmVhZHkgcHVzaCB0aGUgaW1wbGVtZW50YXRpb24gdG8g
Z2Vycml0IGFuZCBtYXJrIGFzIFdJUC4gSGVyZSBpcyB0aGUNCj4gbGluazoNCj4gPg0KPiBodHRw
czovL2FwYzAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0El
MkYlMkZnZXJyaXQub3ANCj4gZW5ibWMtcHJvamVjdC54eXolMkZjJTJGb3BlbmJtYyUyRmJtY3dl
YiUyRiUyQiUyRjUwNTIyJmFtcDtkYXRhDQo+ID0wNCU3QzAxJTdDU3BlbmNlci5LdSU0MHF1YW50
YXR3LmNvbSU3Q2UyMTIwYTdhMmJiMjQ2OWY0MDljMDhkOWQNCj4gYmY0NjEwMCU3QzE3OWIwMzI3
MDdmYzQ5NzNhYzczOGRlNzMxMzU2MWIyJTdDMSU3QzAlN0M2Mzc3ODI2NjYxDQo+IDMxODUzMTAz
JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMg0K
PiBsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJmFtcDtzZGF0YT1k
diUyRlhIRktUdg0KPiBJUG5iSERnQkZiRTBVVSUyQkg4RzZqemZzNFh2R1lWdWx0RG8lM0QmYW1w
O3Jlc2VydmVkPTANCj4gPg0KPiA+IFdlIGFyZSB3aWxsaW5nIHRvIHNlZSBhbnkgc3VnZ2VzdGlv
bnMgYW5kIGFsdGVybmF0aXZlcyBhcyB3ZWxsLiBUaGFua3MhDQo+ID4NCj4gPiBTaW5jZXJlbHks
DQo+ID4gU3BlbmNlciBLdQ0KPiA+DQo+IA0KPiBMaW5rczoNCj4gWzFdIERTUDAyNjYgUmVkZmlz
aCBTcGVjaWZpY2F0aW9uOg0KPiANCj4gaHR0cHM6Ly9hcGMwMS5zYWZlbGlua3MucHJvdGVjdGlv
bi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGd3d3LmRtDQo+IHRmLm9yZyUyRnNpdGVz
JTJGZGVmYXVsdCUyRmZpbGVzJTJGc3RhbmRhcmRzJTJGZG9jdW1lbnRzJTJGRFNQMDI2Nl8xLjgN
Cj4gLjAucGRmJmFtcDtkYXRhPTA0JTdDMDElN0NTcGVuY2VyLkt1JTQwcXVhbnRhdHcuY29tJTdD
ZTIxMjBhN2EyYmINCj4gMjQ2OWY0MDljMDhkOWRiZjQ2MTAwJTdDMTc5YjAzMjcwN2ZjNDk3M2Fj
NzM4ZGU3MzEzNTYxYjIlN0MxJTdDMA0KPiAlN0M2Mzc3ODI2NjYxMzE4NTMxMDMlN0NVbmtub3du
JTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBDQo+IHdNREFpTENKUUlqb2lWMmx1TXpJaUxD
SkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAmYW1wO3NkDQo+IGF0YT1rUDZrZFB4
N1NHYlJVMlA4dE1aQ0dmdnE2TUloejhqT3AlMkJRZiUyQlNtT3dUSSUzRCZhbXA7cmVzDQo+IGVy
dmVkPTANCj4gDQo+IC0tDQo+IEJlc3QgcmVnYXJkcywNCj4gDQo+IElnb3IgS29ub25lbmtvDQoN
ClNpbmNlcmVseSwNClNwZW5jZXIgS3UNCg==
