Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B32B132F267
	for <lists+openbmc@lfdr.de>; Fri,  5 Mar 2021 19:24:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsbjJ5CMtz3dJ4
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 05:24:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=InventecCorp.onmicrosoft.com header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-InventecCorp-onmicrosoft-com header.b=ltJCGXRH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=2a01:111:f400:febe::721;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=mohammed.habeeb@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=InventecCorp.onmicrosoft.com
 header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-InventecCorp-onmicrosoft-com header.b=ltJCGXRH; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-pu1apc01on0721.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febe::721])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dsbj30Yjmz2xYc
 for <openbmc@lists.ozlabs.org>; Sat,  6 Mar 2021 05:23:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2ymTlZRHPUt8Wmlu+L6KGDyIrz6AKCpg5Aaaa597AW5doHOalHuX3qn3xjhywJNu3N3g+VB4dPtOWi8sljIpNllE/u97lYzkBkZy+JQ2GMdiNHIqFY+EA+GW+dJAqHr1Bd+KkKXiYl6WgMKIPDbr17ofd2i3lYrjVnOw4SCtxLJLLKixGMi3tgsX94kuKLj3tA5+CWyQPcB5vN/z7ZkQuZMTDCammtswm2OqwUswPmzFsevw9wZVKtdPPn0YRYmksmyyLszY75zGcvhHzU506I/Dv4hAChXJ+fB5cZ0sApIjx0QKTZ8RaKKmnYTn1mfCr3mcfGH6eNYdkpHhuqW8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZJ2fpCL1X226eN5A8Py5tEJeTtFzOPzjaAD0by4FfM=;
 b=aV3wScaGadlWDW8YfsegoVocrnAOTFvG/ZHy1h/M0MjAcpKSv+yJnNd9pgF2Z7Z53GVctbZBqbxi4/n7Hk969dLY/Mw/2GhiPj1UCkziqpHR8jxK401+jtS0GGUu2Jqo8F3qeyoEMedv1gebxf6XvTajL+kAk6vCintLb2mMIRqXB7zReevapNovRMWQqkB7me63okRIQqlQSjCix/keJs0ZAl5dJ/fbd8tHX4hC1iCsOrIC0YcwLCFaYJHjELht5fuRAR6mDlXNjFwASsx4MANX+d/vFNZ3w+GWeEwnx3+vFEuXgIYP7n/d4naogJVe8IgWhrgUJ7DRTvu/Tz4VCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inventec.com; dmarc=pass action=none header.from=inventec.com;
 dkim=pass header.d=inventec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=InventecCorp.onmicrosoft.com; s=selector2-InventecCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZJ2fpCL1X226eN5A8Py5tEJeTtFzOPzjaAD0by4FfM=;
 b=ltJCGXRHcE06TmcueQCEES2FARoqlApd6MFvEgIAgp54UsIBewbzDefrtYYgZ95ukydKr1pxQ9ezi1/iRACfy1IVowA4d2XBfa1QFB2GyKysEiyCq/mtw1CuLGx8golq4QeRrFWc9AV+YcuNAv+VDByyWDfgde62ft3ysSv/f7w=
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com (2603:1096:300:48::10)
 by PSAPR02MB4872.apcprd02.prod.outlook.com (2603:1096:301:60::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Fri, 5 Mar
 2021 18:22:47 +0000
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::a961:e487:9aff:5524]) by PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::a961:e487:9aff:5524%5]) with mapi id 15.20.3890.032; Fri, 5 Mar 2021
 18:22:47 +0000
From: Mohammed.Habeeb ISV <mohammed.habeeb@inventec.com>
To: Ed Tanous <ed@tanous.net>, Gunnar Mills <gmills@linux.vnet.ibm.com>
Subject: RE: No option to delete SSL certificates
Thread-Topic: No option to delete SSL certificates
Thread-Index: AdcRckvtxgq9NM8/RTq5wOhGZ63EjAAdKYGAAABa5YAAAPbS4A==
Date: Fri, 5 Mar 2021 18:22:47 +0000
Message-ID: <PS2PR02MB35417EED21FEB3CA941D56C890969@PS2PR02MB3541.apcprd02.prod.outlook.com>
References: <PS2PR02MB35414D7358C4248DF668A4E790969@PS2PR02MB3541.apcprd02.prod.outlook.com>
 <6fafb378-5de7-74e3-4fef-17cb93d61c41@linux.vnet.ibm.com>
 <CACWQX83ouxxsU+zqeix56feoHerQXJ9uKD+gmgfG8PDSoU6y1Q@mail.gmail.com>
In-Reply-To: <CACWQX83ouxxsU+zqeix56feoHerQXJ9uKD+gmgfG8PDSoU6y1Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=inventec.com;
x-originating-ip: [2601:647:5b80:8dd0:f9ce:b619:a7c1:fa75]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0920f638-861d-4651-edda-08d8e003ad81
x-ms-traffictypediagnostic: PSAPR02MB4872:
x-microsoft-antispam-prvs: <PSAPR02MB48720467EB5085D614A4D4B990969@PSAPR02MB4872.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5WfBx0qMYLZAxjFr3S8j48MeAC6HpJDXS3SF8omdUoh6qJSeupEwYtNCNZKTJYzghBrBeaNoW3gGaimqX6a5R/SB2KP4DxI3FULRV8ERqfdW3eX0KXm5ABlDvGRCapX7XrRM16G3u/1SlMV8lH2Ikw8X6v+yMNix+mHfj6OLuTds//5QeJ/UznDFS4U9jPArn48vRkg8PJ495dw6HUGxQNmbw1IyVf8YJX91RHuZ9yduVv0rjVa6jLygBIOeSbxGRt+OG8fX1GdDXtnte0A+6D4D2fTiSnXqMOi4/oUlmH4wUTyA7LC8HYQU/H/hjH5X6KviM6EHmF7qbLAU6nmwopf7/x3ze90Zw3t9EZsxeKtkRXH/FOckkgF+Y3C705vJ/x+CiWXV8o01iq90hvfNBdJyOgPNUvyluRizIcgCZ71eExIKoxnl5oeP24vZnSZshPQR+s4wg1KegQT8PdjLUWNnrKxR1e5hFawsCG9XKEs1VQF36VSnkgAAqQ1DL6Zif8hWdXhjNzDxsMc25geK6RsML2KZgf0WMlzrO/ZPlR/4IJ8yVxnoghg66VA0etnhwGPOT1nhHyfe2EcAsqzwRZaVPnHlq4VIvGhEXvEA9Oo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS2PR02MB3541.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39850400004)(376002)(396003)(346002)(52536014)(110136005)(76116006)(316002)(54906003)(8676002)(4326008)(186003)(7696005)(9686003)(8936002)(86362001)(6506007)(33656002)(64756008)(2906002)(66446008)(71200400001)(478600001)(966005)(66946007)(5660300002)(66556008)(55016002)(83380400001)(66476007)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bmlYRG5rUGFZT3p0MjBxbVhNZlpsVVY2QzdGSlprdUlGSUdNZVBjcllRWmIx?=
 =?utf-8?B?NGNFRmU2YzN2bEUxSlB1V3FRaml3MTAxUXppMWVNTExWYzdHNzZCcndmWDdl?=
 =?utf-8?B?bzBMTVdMYlROcGhGNlpPUWtkZzVFalc4bXdDYWMvNlpDNHE4SGtheXVaYVI2?=
 =?utf-8?B?MDI3ZlZiVzE4MlA1S0g4VFk5bkVhRnY3NDJUeE4xdmN4RmRVby9uQk1oNEVR?=
 =?utf-8?B?SU00dUxrYmN2bXJ0UkdpRjM1RVhIZ3hwNTRZZ0VHU0NYVDI5MDdCNmJmTnVN?=
 =?utf-8?B?ZWJPVjVwK1hKWjZtWHRmSGlCVGxGWGVlS3ZEcGh6ZStJZ2gxV3ZhUVRIejU0?=
 =?utf-8?B?NStyVFM3UzlVcy9RSWx2QlFLYXN1ZFZBR08yMXNqSHRmMXA5eEhPa2R3TFFz?=
 =?utf-8?B?a1NIZXd5d1VLL29OQUROVk9EcFhFWk1nblRTVHBaVGNqdVpsMEtUK2lBREJM?=
 =?utf-8?B?NTNNcE5zZllHZW1TeEpYSnM0U05WTEFPRS81bXNiK1FPMFBwd1crMUdUOE9B?=
 =?utf-8?B?ejc2VDlKNVR3NWNWKy9QbE9uTW5YeGJ0bWZuazZvbWtPYjRkbG83d1U0c25G?=
 =?utf-8?B?N1EvejFkL3N3UkNvSENra0grWmlhaHEwZkR6bUE2NXJ4LzhVWFFERll6QUti?=
 =?utf-8?B?d29Xd0ZDa2k2bHp3Q3Q5TmJheFNBZXpsSkZNbTRkbjlzNHNXVkIrdGM3WHc5?=
 =?utf-8?B?Nzc3cWxzeEJENUNxbVBBY2dnZFlrdXlqbDZvd0NjdTlmVE5CckttdWFxL3FN?=
 =?utf-8?B?UitVWTB3Zm4zNngzVlZFUWJLWTIwcHFXLzcvMENVTFBMUDVXS1Q1Sy9adllr?=
 =?utf-8?B?bUkvcEpuUTVWcjB1YU5odFJaeENOWHNhQzBuME5YYTNhRENTcGtwYTdRUU4z?=
 =?utf-8?B?SkVBbDVVOW9vQ3B5V3p1ZUZOZTJHUFo4MmR1ZXlEUnIreGJUQTdiNnM3dGhG?=
 =?utf-8?B?UkhhbFhQWFQ2ZUZZcVFQZ3poZXBlcWZwNnRaS0tqZjhxQU1nN1o3ZUlPY3Fn?=
 =?utf-8?B?MFpRMlc4WlF6WEdUc1hUdVJJbS91ZTd5UW9mZnREc1B0dnljenJIbEoyNGtJ?=
 =?utf-8?B?U1JTMzFSdWR4SEtVem5nZytPaG1NOWczVUk5M3d2SjJOaEp6OU5ZM0VoWDZD?=
 =?utf-8?B?cDZGVEdRQWdOVXdneGlWdWRmRmlWcVptOTVzMEUxWTllc01jc0dwTTlJOW94?=
 =?utf-8?B?aHVITkNBVDdxSTdlZmhLYXN6azNjR2FkS1JJTnlMdmxKM2F0K3krNlhoMnJF?=
 =?utf-8?B?RWNNTkNWNFY5Z3Q3OWEwUXNNeUVDcGg1QWNhS2lpbFdYeUx6SFBDaGx4clJD?=
 =?utf-8?B?YUpvd00vaXN4Wjc5WkNocXNXd3dLdEE1Tzc1TlFDU3ZYSGF6Qy9QSTBtQ0dU?=
 =?utf-8?B?bUNPTVcxeUFTOU01NkNmNURCdGs4T0RKaGFTVHhaZjRjUURZd29NMEhoc1pr?=
 =?utf-8?B?OENWYWdiY1phUWlhS3VuWkhyYm9ubm5ZLzhKK1I3NzZ0akxlaitvTjR0ZWhk?=
 =?utf-8?B?SGZ2QTBUVnp1UHJuQTdKN3pEU0JNcCswKzNMTmFTQ0ViVGRybWdLRVJCYkRM?=
 =?utf-8?B?UFhGaUxQZlFKUWlSb0JBQi9sRzVEckF0UG9WT1V1UzhiTmhFS3cyZ0JUYXlB?=
 =?utf-8?B?bWRZLys4UWVtSzhtY3BGSUVDRlNvbG4vbzRHcDFGNzN1SW9OT2NWcEsxRnR1?=
 =?utf-8?B?YUNGRGdRbFZhZnMrN0FkaE1VeWtJSFRiK3NGaHVETjdNSTdlSWNoUUY4bDlF?=
 =?utf-8?B?Q0xMRjdxNVM0U0U3elRtY0wvQWhCd1FMRWJ4SXAxS25PNk1QVjJmZUFoUWl4?=
 =?utf-8?B?NXF1bzl4ckZObXVDcUh1dDVwbTFaaVYvQUZ2NHE4YXBBQ1FhMSt1NlZXZGtH?=
 =?utf-8?Q?IkIdYZj+kBSTE?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: inventec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2PR02MB3541.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0920f638-861d-4651-edda-08d8e003ad81
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2021 18:22:47.1933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ae41f0c-acca-40f1-9c63-49475ff38512
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 40/ZrW/owUjJ4snEUKy/rM4Gi8RGR3t/zUL0Z7Fkd90iGhRypFpuCUPyhFGGtyAt6sWIMfsFfj2Hb31luVaWwflRJ/O+R1S07M3Je09WjRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR02MB4872
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
Cc: "devenrao@in.ibm.com" <devenrao@in.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "ojayanth@in.ibm.com" <ojayanth@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBFZCBUYW5vdXMgPGVkQHRhbm91
cy5uZXQ+IA0KU2VudDogRnJpZGF5LCBNYXJjaCA1LCAyMDIxIDk6NTMgQU0NClRvOiBHdW5uYXIg
TWlsbHMgPGdtaWxsc0BsaW51eC52bmV0LmlibS5jb20+DQpDYzogTW9oYW1tZWQuSGFiZWViIElT
ViA8bW9oYW1tZWQuaGFiZWViQGludmVudGVjLmNvbT47IG9wZW5ibWNAbGlzdHMub3psYWJzLm9y
ZzsgZGV2ZW5yYW9AaW4uaWJtLmNvbTsgb2pheWFudGhAaW4uaWJtLmNvbQ0KU3ViamVjdDogUmU6
IE5vIG9wdGlvbiB0byBkZWxldGUgU1NMIGNlcnRpZmljYXRlcw0KDQpPbiBGcmksIE1hciA1LCAy
MDIxIGF0IDk6NDMgQU0gR3VubmFyIE1pbGxzIDxnbWlsbHNAbGludXgudm5ldC5pYm0uY29tPiB3
cm90ZToNCj4NCj4gT24gMy80LzIwMjEgODo1MiBQTSwgTW9oYW1tZWQuSGFiZWViIElTViB3cm90
ZToNCj4gPiBJbiB3ZWJ1aS12dWUgLCBTU0wgY2VydGlmaWNhdGVzIGhhcyBvbmx5IHJlcGxhY2Ug
b3B0aW9uLiBEZWxldGUgDQo+ID4gYnV0dG9uIGlzIGdyZXllZCBvdXQuDQo+ID4NCj4gPiBJcyB0
aGVyZSBhbnkgcmVhc29uIGZvciBub3QgcHJvdmlkaW5nIGRlbGV0ZSBvcHRpb24/DQoNCkkgY2Fu
J3QgZXhwbGFpbiB3aHkgdGhlIFRydXN0U3RvcmUgY2VydGlmaWNhdGUgaXNuJ3QgZGVsZXRhYmxl
LCB0aGF0IHNlZW1zIGxpa2UgYSBidWcgaW4gd2VidWktdnVlLg0KDQpUaGUgSFRUUFMgY2VydGlm
aWNhdGUgaXNuJ3QgZGVsZXRhYmxlIGJlY2F1c2UgdGhhdCB3b3VsZCBlZmZlY3RpdmVseSBkaXNh
YmxlIHRoZSBIVFRQUyBpbnRlcmZhY2UgZW50aXJlbHksIHdoaWNoIHNlZW1zIGxpa2UgYSBwcm9i
bGVtLCBnaXZlbiB0aGF0IHlvdSdyZSBjdXJyZW50bHkgdXNpbmcgdGhlIEhUVFBTIGludGVyZmFj
ZSB0byBjb21tdW5pY2F0ZSB3aXRoIHRoZSBCTUMuICBCZWNhdXNlIG9mIHRoYXQsIHdlIG9ubHkg
c3VwcG9ydCByZXBsYWNpbmcgdGhlIGNlcnRpZmljYXRlLiAgSW4gYSBwZXJmZWN0IHdvcmxkLCB3
ZSBjb3VsZCByZWdlbmVyYXRlIGEgbmV3IHNlbGYtc2lnbmVkIGNlcnRpZmljYXRlIGlmIHRoZSBv
bGQgb25lIHdhcyBkZWxldGVkLCBidXQgbm9ib2R5IGhhcyB3cml0dGVuIHRoYXQgY29kZSBzbyBm
YXIgYXMgSSdtIGF3YXJlLCBJIHN1c3BlY3QgYmVjYXVzZSBpdCdzIGp1c3QgYXMgZWFzeSB0byBy
ZXBsYWNlIHRoZSBjZXJ0aWZpY2F0ZSB3aXRoIHlvdXIgb3duIHNlbGYtc2lnbmVkIGNlcnQuDQoN
ClRoYW5rcyBmb3Igc2hhcmluZyB0aGUgaW5mb3JtYXRpb24uIEhvdyBhYm91dCBMREFQIGNlcnRp
ZmljYXRlIHR5cGU/IA0KPg0KPiBMb29raW5nIGF0IHRoZSBjb2RlLCBJIGJlbGlldmUgdGhlIG9u
bHkgY2VydGlmaWNhdGUgdGhhdCBjYW4gYmUgDQo+IGRlbGV0ZWQgaW4gYm1jd2ViIGlzIHRoZSBU
cnVzdCBTdG9yZSBDZXJ0aWZpY2F0ZQ0KPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9ibWN3
ZWIvYmxvYi9mZWFmMTUwMDU1NTVhMzA5OWM3ZjIyYTdlM2QxNmM5DQo+IDljY2I0MGU3Mi9yZWRm
aXNoLWNvcmUvbGliL2NlcnRpZmljYXRlX3NlcnZpY2UuaHBwI0wxMzQ3DQo+DQo+IEFuZCB0aGlz
IGlzIHJlZmxlY3RlZCBpbiB0aGUgd2VidWktdnVlIGNvZGU6DQo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9vcGVuYm1jL3dlYnVpLXZ1ZS9ibG9iLzRkYTk0OTU5MjVkNjAxYmI0ZWRmYjhiMDA3ZDUNCj4g
YjU0NzkyYjc0OTFiL3NyYy92aWV3cy9BY2Nlc3NDb250cm9sL1NzbENlcnRpZmljYXRlcy9Tc2xD
ZXJ0aWZpY2F0ZXMudg0KPiB1ZSNMMTgzDQo+DQo+IEkgYW0gbm90IHN1cmUgaWYgdGhlcmUgaXMg
YSByZWFzb24gZm9yIG5vdCBzdXBwb3J0aW5nIGRlbGV0aW5nIG90aGVyIA0KPiBjZXJ0aWZpY2F0
ZXMgb3IganVzdCBubyBvbmUgaGFzIGRvbmUgdGhlIHdvcmsuDQo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9vcGVuYm1jL2JtY3dlYi9jb21taXQvMDdhNjAyOTkzZjEwMDdiMGIwYjc2NGJkYjNmMTQNCj4g
ZjMwMmE4ZDJlMjYNCj4NCj4gVGhhbmtzLA0KPiBHdW5uYXINCg==
