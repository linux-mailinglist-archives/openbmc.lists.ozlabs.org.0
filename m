Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA86415A98
	for <lists+openbmc@lfdr.de>; Thu, 23 Sep 2021 11:10:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFTrl04HVz2ywB
	for <lists+openbmc@lfdr.de>; Thu, 23 Sep 2021 19:09:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=B3OubFMC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.94;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=troy_lee@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=B3OubFMC; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310094.outbound.protection.outlook.com [40.107.131.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFTr86mRYz2xr1
 for <openbmc@lists.ozlabs.org>; Thu, 23 Sep 2021 19:09:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMazSlRW1/paNn3dMrJsdrOlPQ5zN5UjN8fSj4Ca2tPZ9hp0pWgA9djAGY38XOnOTVHJ2I7dziMYpS4/dDwqnlCoTdYa54vVf8/4iQcgzhDlf632NLDtyaw3ukqNTZvJJAJDZk2/7O7sKRryM66db+dn1/Womz3ZdXJm3u3NhN3Y/Tr1Q0N90F1gf8h7h2cc7mR01FLBtLRcpW2LVqrEHUGe4DIm7RMJvzMb4NsDtPk89e6UPZ33mXeThDBqX9enPJyyaK5t0m/q7sHhrsAInBj44GbD5mhpAyRPQ8Y6o8w8vv22Vzy7I6ui6uctq3DoknfPLWOvyQXV+XXXzy1uig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=knn92we1Na1NtGlZ+JlsXlVrPFjo9yK5anrEczK1VxU=;
 b=BxD5zshl+7AdcZILhLqDwrk3+NPPai3Tp1bhZYs6DnVNyArHXJlqL/RIjobSpTUM6tTyJNFnczAmccPgOsz8HTM7UB2KVx1249s3vLBFvzpF8Pe3v859XPlCdptmq4r0kPd8y7aaKNcGZa64N5tIHuEDhmSpbOQDIDSEKmcpkCbpNv08FS5qBX4P7U/mrKM+rHwpYfRIEJK/wHqulpLy3c2XGf0V3IOaXRHy3OchLU1mtbp7g8TQ1bAWCOnHmMtSrwB9X84kdyELA1UAUYrAAj61fIF3w9UXAAzCZGljSH9vZ2eeAC9oTaPI8T+b7FprAKkcW+/6D4pSpPdWvA9I4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knn92we1Na1NtGlZ+JlsXlVrPFjo9yK5anrEczK1VxU=;
 b=B3OubFMCNqRW4WxvlBa3W4+JdaBmxkE1NqBYjur8MI+6ix3AuGscbf79hb21n0X41s3dpWlwOw+WCJI0yNHj/hNKBUFOVGf0oF4mcdprfiu9x9w9VEiVV7ynTXAZXW3oNqZn3SOc3QVeb5G/YImZZVeWeAB3u3SoJ/5rSIi3cXVKk6Gry2FYDjYbgFbRRtmnKL6JX0KbV/vckJVB7Q453wNkMg9MwMW4eRLsaC6sxSaPFHr45kwvq9/aOlToXQWswtXgY5dGrUIL91PJmBJymun9he3neXh6l6WmipQnV+0Q1HEIBFfpBgEexfSWJqkRr5nQFmgGjgQRYTwJdR/9HA==
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com (2603:1096:203:4b::20)
 by HK2PR06MB3620.apcprd06.prod.outlook.com (2603:1096:202:37::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 09:09:03 +0000
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::129:4c2d:a33b:abcb]) by HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::129:4c2d:a33b:abcb%5]) with mapi id 15.20.4523.021; Thu, 23 Sep 2021
 09:09:02 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: Graeme Gregory <quic_ggregory@quicinc.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: AST2600 EVB eth0 (MAC1) Issue
Thread-Topic: AST2600 EVB eth0 (MAC1) Issue
Thread-Index: AQHXr8mYTmBOpgk5ikaBS3H2n9bWZauxT2Og
Date: Thu, 23 Sep 2021 09:09:02 +0000
Message-ID: <HK0PR06MB2145678C356EC1ADFB194D1E8AA39@HK0PR06MB2145.apcprd06.prod.outlook.com>
References: <8f36a6e9-eccf-5d9b-2c29-3546ded6ba5d@quicinc.com>
In-Reply-To: <8f36a6e9-eccf-5d9b-2c29-3546ded6ba5d@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: quicinc.com; dkim=none (message not signed)
 header.d=none; quicinc.com; dmarc=none action=none header.from=aspeedtech.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91c9e037-321b-48e7-6e6f-08d97e71c9a6
x-ms-traffictypediagnostic: HK2PR06MB3620:
x-microsoft-antispam-prvs: <HK2PR06MB3620D0648DEABD24595B41EB8AA39@HK2PR06MB3620.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wlK+6XSA8rfMKHQlp+sTLhJpWQUFPZDTV2m/ZIzAs5fck8Bx21MDx3a11WJZptp48PT8XwkiKY7GxhCM0gncV3IXOXe/kxQqzZYjPQSXfzVRSqYIVHih1FmtiqDN6iFZvFj6sUR88AsoqxPTHyovlj1bEQCTUZhhJ1YpqJwACvjrsLmo4c1SOka7641NXeki/6a7mj8qz/+KZ5drBFPJSqf9QZNNMF1Fz/og3Ix3NepOcmL/sIAE2iTHUg6Ow4yuk3YvrZkjDv+xrlLB5pcJEQnyF5NLKAfqpPAhm7f7CGfcR5OD1olVXTN+QrzbPFNr4L7XitiBGC9/wk7kBMRuyTUkMc0/EkF2zAsW9dfZWF+VQ5VKo2x1/ILKvpp1TaRJQq5Vdg46nDCanp9sTABWh7ee62jbfakPDNXQ4vglfbfVwWjihV7Hf/msP+YguiUwREtMhu8qTNJNkGh6zfw9ZRAlXr9yqCJP7McghQpRwVOo4mWd7Uigo3Zi0ZshRZqeSirjxcGUBwDL2unk7CZ9BOV3GJyszhl4oeJOfoPNzebK7ElxZaEyCUljmBrTR3o61NggVg5C78fglSeqJNupIdzz2xlTVmpxZzHzb+9r94kK3gBzGuSAzALNl76c0r2o9nIaVRPCAF/v3oBKvlL75wolnoWPWNsXm9zQ0eibjr8ZGLrPjciUjZPOWo4YDJ0IePr4Oe7qWO6Bl/eftgKu3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2145.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(366004)(39850400004)(136003)(346002)(2906002)(9686003)(316002)(4744005)(52536014)(76116006)(122000001)(33656002)(508600001)(110136005)(66476007)(38100700002)(66556008)(64756008)(66446008)(8936002)(66946007)(26005)(71200400001)(86362001)(6506007)(38070700005)(55016002)(8676002)(5660300002)(7696005)(53546011)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlRxcDI1RGtadTBZZUdkUUxvdFlCb3hxUDhxbTdqa3RxZ1phcVFmV1J1c1Qr?=
 =?utf-8?B?a21BSmJ3TU1CYUg3bTBtZ3hEeFJHazdzdHdqdldhWEJkWldveHYyV0MyaHdn?=
 =?utf-8?B?V3IzQjFvb0Nxc1Z4clN4MVQ2SWdUY3E5b090VTVWYjBnOGlnNHR0ZUFXOVJI?=
 =?utf-8?B?bGlqUkxkQkFrTTJYcDFxMU83UVQvdDlYelk3cmIyeklYUzErL1F2QlBPU3kv?=
 =?utf-8?B?Z042SWRmMUhLWUJMc2d4QWtkVUo2cHdpK0VnaXo4NC9hcU5yR21UdUhxa3hu?=
 =?utf-8?B?Rk4xTzhQNTcwbmpsZEZvU3kyZlMzOHhiMEhoalp4QWtvUG11M0JWNHdxY0VH?=
 =?utf-8?B?UUlKM0Z5TUFkZmZacXVobWs5YU9FVE5EZE5jbjl1bS8rR2lBZmFuWHVCSGU3?=
 =?utf-8?B?NUZlUExOd0lnbVZhQjJOTjZMSlhhVWdNd2dNYXptM0dXcTRFZldneVdZbyt4?=
 =?utf-8?B?ZWdDWkNrTUZNaEwrdUg1VFQ3V3ZENytKV0tPR1NRV2FuLzJaVXN6NGNNeEtR?=
 =?utf-8?B?RTVodVkvUEQrV3dFZkhYUkMrcDM0NlZFQ3Zza0dZc2o3NkdlQTFxZ1g1U2ti?=
 =?utf-8?B?VkJWUHJ0SnFERXdOQWtmYnVjNHg2clJGYitDSlFTMHlpcmUyUEhIOWp3UW5h?=
 =?utf-8?B?K2w2UXUrZk5zcmdDcGNGbHBxZHZWd0xSZWpwUlZQbDF6dzlXQndjSldqcWJE?=
 =?utf-8?B?d0VzRkFHZ0NTS295eWxjQ2pBYkQrRklTY3FFUlFOK3lZeGQzYXZVZGt5b3ZX?=
 =?utf-8?B?a3R1Z1Y2MU9jOVB6Qk9iNnRoVVBITDRyZlVzQVBkeUNUNVFqRWt1amljR2dQ?=
 =?utf-8?B?cXVmN2pCNGk1UUc5TnI5ajlySnFyU1RpbFY2bkdZdU1aV1RiTTlIdWJWRzhO?=
 =?utf-8?B?cS96MXhGQlF6dFdyM3dRV2hFbU9pRFowYzJ4ZjBDRlRmMy9YQXpEMVdDTmNV?=
 =?utf-8?B?am84ejFwbzJQdjVIaUpTUmtGbStwcUZNYzl3cVF6aVA3NytKMnk0V09zd1dQ?=
 =?utf-8?B?dTRvbTBsbCswdk5obklUMW5oNkNRenpXMitadUM3Tlo4VDN5Q1MvaXJ2a1Jp?=
 =?utf-8?B?cVdMZnIyL0NpZnZkSXhGaVlVOUdhSmJvR1lIa1pIdHRibjUrOEx3OWFzdXJ3?=
 =?utf-8?B?T2krNnQrMjNrVzFyVXNJajgzdVg5ckRLaWlLU1lad1hraTZ4c1VPc1J5L2Mr?=
 =?utf-8?B?VGJtaDVVdGlaTGFTaXYyR1JmSVY1a3JEeEdsUGN4a0REOTlHWkRkUzdET1Vl?=
 =?utf-8?B?Z2xPcjZyK0lXWkdwSzZ2c1hva0k3L0J3NVdBNVRoSUswM3BPZ1lzRUFvN0ky?=
 =?utf-8?B?MlAxaDhYYXJUR2YzVWFwWU1pNFpibUZQV3l4SG9RcVlUZEJmdlp0QXErRFNW?=
 =?utf-8?B?VE5tSGx6QUxlUnpHcFcrWDE0QTk4Z3JnYUplQjM2WnZUSEJYanZtcndWcy9l?=
 =?utf-8?B?SVZRbzdsREtCRitqRGRtUjVUY0pDSUZvNm90L2tPK1l0ekNUcXN3eTl4YVRX?=
 =?utf-8?B?VXFiTDVmd0R2MDEvVG9vT3FsZG1udThVQko0WWVsS3loNUdLSWcyb3pCTGJr?=
 =?utf-8?B?czlmZjlIeEtqK3FWajR2S0hkOEUzQmErRVBJR2xYeGY4S2EwVStuUWFKeDJI?=
 =?utf-8?B?VWNEdEhhSG5LL0luWkN3anFWYjlvdWV6NXZhTkdRL0FNMDU1QjFWZmdrd2Qx?=
 =?utf-8?B?bDRUMnJWWkRmSUZUTFFHRGdrRXdjQS8zT2pRWCttL2dmZEs0UWdreGdUd0hy?=
 =?utf-8?Q?Jr2ezd5SVEv6LSpn4okdn2DRd9fH2TDET0MU/kg?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2145.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c9e037-321b-48e7-6e6f-08d97e71c9a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2021 09:09:02.6749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O/plmlvxtpb9PwTwahwvOtgn3y4W9GqZN7cjaLP16VQlEaOTBj+el8l0QxlcBCh8FszBghZvFPz7/YjmXdlBCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3620
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgR2FlbWUsDQoNCldoaWNoIHNvYyByZXZpc2lvbiBhbmQgZXZiIGJvYXJkIHJldmlzaW9uIGFy
ZSB5b3UgdXNpbmc/IA0KQ2FuIHlvdSB0cnkgdG8gdXNlIHBoeS1tb2RlID0gInJnbWlpLXJ4aWQi
IGZvciBldGgwLzEgaW4geW91ciBkdHM/IA0KDQpUaGFua3MsDQpUcm95IExlZQ0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5ibWMgPG9wZW5ibWMtDQo+IGJvdW5j
ZXMrdHJveV9sZWU9YXNwZWVkdGVjaC5jb21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVoYWxmIE9m
IEdyYWVtZQ0KPiBHcmVnb3J5DQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDIyLCAyMDIx
IDExOjQ5IFBNDQo+IFRvOiBPcGVuQk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFicy5v
cmc+DQo+IFN1YmplY3Q6IEFTVDI2MDAgRVZCIGV0aDAgKE1BQzEpIElzc3VlDQo+IA0KPiBIaSwN
Cj4gDQo+IEkga25vdyBBMCB2ZXJzaW9ucyBvZiB0aGUgQVNUMjYwMCBoYWQgYW4gaXNzdWUgd2hl
cmUgZXRoMCB3YXMgbm90IHdvcmtpbmcsDQo+IGJ1dCB0aGUgZXJyYXRhIGluZGljYXRlcyB0aGlz
IGlzIGZpeGVkIGluIGxhdGVyIHJldmlzaW9ucy4NCj4gDQo+IEkgYW0gc2VlaW5nIGFuIGlzc3Vl
IG9uIHRoZSBFVkIgYm9hcmQgdGhvdWdoIHdoZXJlIGV0aDAgKE1BQzEpIGlzIG5vdA0KPiBmdW5j
dGlvbmFsLiBUaGUgb3RoZXIgdGhyZWUgcG9ydHMgYWxsIGZ1bmN0aW9uIGFzIGV4cGVjdGVkLg0K
PiANCj4gT24gbXkgREhDUCBob3N0IG1hY2hpbmUgSSBjYW4gc2VlIERIQ1AgcmVxdWVzdHMgZnJv
bSB0aGUgQVNUMjYwMCwgYW5kDQo+IHJlcGxpZXMgYXJlIHNlbnQuIExvb2tpbmcgYXQgL3Byb2Mv
aW50ZXJydXB0cyBpdCBsb29rcyB2ZXJ5IG11Y2ggbGlrZSBubyBJUlFzDQo+IGFyZSBldmVyIGdl
bmVyYXRlZCBmb3IgaW5jb21pbmcgcGFja2V0cy4NCj4gDQo+IFRoYW5rcw0KPiANCj4gR3JhZW1l
DQo+IA0KDQo=
