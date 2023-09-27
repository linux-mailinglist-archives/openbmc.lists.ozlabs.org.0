Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D72DD7AF89D
	for <lists+openbmc@lfdr.de>; Wed, 27 Sep 2023 05:26:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=UN0SlSwr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwMTB52n8z3cNj
	for <lists+openbmc@lfdr.de>; Wed, 27 Sep 2023 13:26:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=UN0SlSwr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::72f; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=tommy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2072f.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::72f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwMSb46hTz2ys9;
	Wed, 27 Sep 2023 13:25:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lP7dHzOxlDeaju7RfwSrfnRj14ccyL0TdlfRT5z0UhHP8oRCsSPVU6hdrcnIuA3jFownDn4V4sVY00LYLDkuri1f2yg8f6IojN1CGVYvp/NQybJVhk0epDXNivZ3G24ZUh7AHNgdHzg4575GqQlaHjCgh4wE0BlUSnw/iMZiYlXrX1pCvAmwTRE6QTy9caBQMrCR/P2C12cQ6z5536m5NON5IQ1Y92ph/j/n9fm+OmGXdeV/NW53FOoG12rPGHeAnPdksIJ910sz6EpqUpDN2plejCtZ5Vls/NML1hTh+URGRjj3rbuxFewz47nPhHJ7CfFVHMoZ3wrgmeITNzYjqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FB85N7d617Mx0GDfc5iP9rttIqTZ3ulHKf6AjNKh3v0=;
 b=AuN7bf1GnlwUSrdOUwqxaWpd6nT+8qH1EzLuxYKbsz9LMR+j+RdnWwgXfIuPgzWb3Dk29mDqhvR0ny2ixU6O6UNJxjgpnaO5lLj9vb1fFDcD9BT9Y/XYAhsVpbi0SyRPFVmvIEoYjsUp8Vq8Zh7YqycDswQUV7IkO5mmtKDyTTI+Rll8RD2RIyQUdiSMpv19xPlE9oBIiuzl5rdY45tARC216IW+wg4Av5F0pt4th/GMBFuh15e6pbufv5sSvlMDVkTULDArOfzy0bQbmmRd8L5+zs0Pi+G3+MN6mbEp/sH/MoCO9WrbDRc+2OpTcI5wftbw3jb1pBRHnDepgnWPKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FB85N7d617Mx0GDfc5iP9rttIqTZ3ulHKf6AjNKh3v0=;
 b=UN0SlSwrAMitXSVzqAgE2YOSl7ErtXMpNK+zxnapnT/dtTs/lw75OsaFqAbEyH1ZrcP/YX2QiJvVtx9JVfh9BjXFkOFZ9L4P9hbaC9P1lNhF/yhHE4mcI9r1riy8kM0JmrRPCaRt1ujXLlVbI1NAGD+FJ7sx11PiUhvUx1GXyQZVwT9brobu08EgHrO06VL5Jz5CegCOITwADAHYAiaL9u0oxdQbArxzlJL765U4BnXj83SkcBT/PdX7Uauo9KGj9I6EofFXDxTEyzO1GmzYgcEkFWNJA+cmaGvouzf5bVYoU/rtx+SWf1Jk5HtYPUs5ciHD+oUmzzyyf3ugVovyhQ==
Received: from KL1PR0601MB5614.apcprd06.prod.outlook.com (2603:1096:820:9b::8)
 by KL1PR06MB5884.apcprd06.prod.outlook.com (2603:1096:820:dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 03:24:53 +0000
Received: from KL1PR0601MB5614.apcprd06.prod.outlook.com
 ([fe80::d4b5:6925:c7b8:c19f]) by KL1PR0601MB5614.apcprd06.prod.outlook.com
 ([fe80::d4b5:6925:c7b8:c19f%3]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 03:24:53 +0000
From: Tommy Huang <tommy_huang@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, Jian Zhang <zhangjian.3032@bytedance.com>
Subject: RE: [External] Re: [PATCH] i2c: aspeed: Fix i2c bus hang in slave
 read
Thread-Topic: [External] Re: [PATCH] i2c: aspeed: Fix i2c bus hang in slave
 read
Thread-Index: AQHZ7SC77IIpxichCEygoyJWzP1SHLAm6tqAgAcTfACAAAI60A==
Date: Wed, 27 Sep 2023 03:24:53 +0000
Message-ID:  <KL1PR0601MB5614B0CCA2C96ADEB3AC8AC9E1C2A@KL1PR0601MB5614.apcprd06.prod.outlook.com>
References: <20230810072155.3726352-1-zhangjian.3032@bytedance.com>
 <CACPK8XfWKLS_4nBC+NCSw=21iQeaHzBXOROmz9T+S0qZHCBKeg@mail.gmail.com>
 <CA+J-oUtxiQBOT+VM3fbOUM8HL5TX-C4HqtbbT__b4_KsGAJy1w@mail.gmail.com>
 <CACPK8XeO404ok+B+k4U_bdFE3yYebzT-UNcTqcHStJfEnDh6jg@mail.gmail.com>
In-Reply-To:  <CACPK8XeO404ok+B+k4U_bdFE3yYebzT-UNcTqcHStJfEnDh6jg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB5614:EE_|KL1PR06MB5884:EE_
x-ms-office365-filtering-correlation-id: 54a665bb-3374-44bc-2899-08dbbf0950b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  xdPqa9cKC5PKiaq45XdcRUFsVf9zJXiYyOHLxpPI9t4un+VBKP7cbWdtsFOYCW6JMiovOi0FpRynuVKB5Zmyl3rqa+if2RADuiVfgsmsGQM9eL4BFWAZSy9qXfYz/mtGvB8goxyQ9t91RAxN/p74CZe3HCaLkePdjCkjCTmKziqXgh6XDckkQ6e/Em4mPtyncf0zvN5nn4213JZXcUuYFg0AfYzj7zO0oYgGm4FUZw3ssuBi8uKcKcYCcKO3wzfw+NJH3QcJsGZjXGaMF4j73iCGuRJTIBKm+GOAp7Ftwkd6ztPZY39t4gjzqP20+or/sXWlmDDDz6y/ptnAKigy922uE+oVfTJYDrhntRmUt2HBBMa4IllPodpG5Tj3fJ3fVc4GqLCfubwnhQFq2P5Fim3HvYEeB/0Qk93KoDrN239Fcm74byawRs7XP8a+Dc9A/wQ0aLfD6pwhrhyHVderXJer6ZTGVDarFpdDdRMG4yvt0BL4VlUH8LreLcBYrRC+EzmYMEx5T+Dqk2M7AJUb6g+uCI/Jw+LP1gRRQuLVCNVw8cXFaCg3aMXHM9//4BCw7QAI+EDYuvvt7bb5KrJ9M8myAQ6IO/fprV0s6RSyS4Y=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB5614.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39850400004)(396003)(84040400005)(230922051799003)(1800799009)(186009)(451199024)(66946007)(53546011)(2906002)(52536014)(316002)(41300700001)(8936002)(4326008)(8676002)(7416002)(55016003)(5660300002)(66446008)(66476007)(66556008)(33656002)(54906003)(64756008)(86362001)(110136005)(7696005)(9686003)(6506007)(71200400001)(76116006)(38070700005)(38100700002)(26005)(122000001)(83380400001)(966005)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QUdNSm9NbklOUmJHbmhETVJpaFM4RUZYbk16QTNDRGRoRGpKdHRaRG94NDdP?=
 =?utf-8?B?cU1SMWFnVVcvRG5hb2VoYzl4cEFVcXZaZzRuSGtSRGtMZ2IyNE1ZYUd1Zlox?=
 =?utf-8?B?SFJNVTdzMDZsYmFJM1J3NWtlSVJyWHpiR0lCQ2pDWllsM3lIMFF1Umc4QUNQ?=
 =?utf-8?B?TVk5dEJUT1ZyRmJ3S3o2QUFFVURUaEFoTy9lREtPMnNoNmVpVGpXMjBRWXYv?=
 =?utf-8?B?SXd2TGdCZmRoQjVVdEV3Ni9BeTBxTmZGUTZYWlVJL1BGNjRrMllXL3JDV1NX?=
 =?utf-8?B?N2dXSGFMOHJTZityenBXN1VJQytQNkZwR0lBMGlIeE9aUUlKQmdWTmtSempY?=
 =?utf-8?B?RGZoUDFvSng1b0ZBbDlteFBSUFZERmRNaHJaUHVwNHVBejlPOUdPRmlLb3o0?=
 =?utf-8?B?TGVWQUJPQTRlTzVkWStnaXBtR1lnTWRWUVZvelRUQjZhNmV3bnpRb0xzcHFx?=
 =?utf-8?B?NlorRHVEY0F4b29zNGhueUJBV3B4eG14K1owODV4VVJCRFBXNWxoOVNTVnpZ?=
 =?utf-8?B?Z2w0SUFjdVI1QkdGdHdQbk5wNFhmRnlLN1dUdkNpbnRuUWI4QWVzZktLL3Rw?=
 =?utf-8?B?cXU0WXB4bmI2VkdmcmdNVVRhelZGOGlrdGI3OG1MUVFRTXc1cUxISXFlZEdD?=
 =?utf-8?B?eEhJN25NYUwwcnFUYkVqUjVwVUV1RThDQS8rRnRKUnpTWlU2Y0pEcDFCUVdT?=
 =?utf-8?B?bnRpWjIzUXZnRFdmaTNGM2h2M0hHaWtQWWdHSTBrdGR3bXg0MGkrYnJXNVZk?=
 =?utf-8?B?VFNwcWdEVkdFUDk0TnRaa2g4RTBVOXR5UERNQW1sMktJS3FjWE1hY0tCMlAz?=
 =?utf-8?B?bTh1UnJYYXp4SWNyWlAwdk5mWmFjU0Qvd3lSK1VYVmtwa1ZOWFdFaXFWVHV4?=
 =?utf-8?B?Qk0xMWZ3MkQ3Q3o0aGhpcGJnVkJkZkRkRlgrdFBCMm1jd2c4ZmJDeGpYek5k?=
 =?utf-8?B?dXNCcURidzNsNFZTZWRaQTBTd0lBcDZ4TkNFMVhzUXVzdk5wNnhQa0QzUTZi?=
 =?utf-8?B?MmVDYXBxVUJYZDdBNDFZUDRZczNZdDNoS21UVnRmcGMxTzlQZ1E3TnU2RDND?=
 =?utf-8?B?aUhxbU9IWXIxdmRMQWM0SllhMUVSSnRFb2x1OWhJanpnWVZEUUZhU0txWTZY?=
 =?utf-8?B?WHZ1SllneUwrbEhZbWZoNW5RRUptRlZWWmU0YVpPa29zTjdheUhvb0w1YUs3?=
 =?utf-8?B?dUhUQ3VEa0FpUVNhNEFMOU1BUGdTMW1EYTJIV1JFTzBMZ04xUGIzeC9Nc24w?=
 =?utf-8?B?SnlnWEJiRjBwbWE0NVhXMDVVbmc0ejNwUXNBRmhmQWhPaWx6dTBYOURXMGF1?=
 =?utf-8?B?MVBYQ1lqTG9XT1JKR1pxaU0xcXNwWHZZdUZpTmZoTkU3NWFFL29WWmpTUmZS?=
 =?utf-8?B?S3NlTXZYVUx1MnpzeVNMZlk2ZFF5U1RValdWQ2JoVk92WW9mZ0FzcytTZ0p4?=
 =?utf-8?B?NkJvcjZUQ09ja3J4bFpnT1o0SGZZV1FFS1NTZzEzQ1NEU3VGdC9DWlE0Q1NW?=
 =?utf-8?B?aTcySkgrLzZFVkk5cVhzcHp2ZUNZMnE4STM3NHpka3VJMWo1eVREZkpNU2hw?=
 =?utf-8?B?dDdVWHpwWGdnbk5vMTdmUVd3dEJTRHU5S2lEY1lSY2ZLUnl2T2RkOFJGalBx?=
 =?utf-8?B?eXlKYk9KK252cTVYekNiTVlFcHBJUSs2NCs3SnY0b21TdnVzY0N4UFkrK2tC?=
 =?utf-8?B?QVRNRDlSd3V6eG9pRGJPbEkyUTdOK3o0RnY0WDNsenNaZUJXTkw3M0g0Q3I3?=
 =?utf-8?B?ejJYbHdCc2lsMEJqU0VOeElFdmJDRTgwcnJrNDNxNHRpSFlFSzZNd0hUdHA2?=
 =?utf-8?B?NW9YeU1CcUlFbm9FYnJzMnRuUHdPajBzVk5sSXA5bk9RVURsaEJtc2RHZFc2?=
 =?utf-8?B?T0R2N0MzREQ4TmMrZWlZV0pWS3JudzFhVjRXTVpuL2xhWHhiZEZuREc2aWJR?=
 =?utf-8?B?RzBrbDlya3NrU1d5WFhKWDhEZXQzWWlURHk1RFpnYzlCWWNQNUhPZlRHTkFl?=
 =?utf-8?B?bXY1UXVnSDdOL0o5K3IxWElGQ0NGdEI2SlRuVDk5Z3dQVmZMemVFN3hCMWEw?=
 =?utf-8?B?Q1g2eGxLdFQyWGgvei9iRU5RbzVsMTF2bEF5WWxFSXRVMnJqQTFPZ2lxdGZO?=
 =?utf-8?B?eUd2Q0FRN3JYWlFNNUlidi9GcTJUd3RjRExQek4wY21SWXliaEN3MGkzdVR3?=
 =?utf-8?B?d0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB5614.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a665bb-3374-44bc-2899-08dbbf0950b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 03:24:53.2556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yy6uNVoGkLrvFZ2zyJCL5lDCUTwXfUlKH9T/U+IBRRF64xYUuwNwMHZ5kwtBFW848RljgPK/3MI02a8fh1X/4+jtHWeNHXJF/hyViukeFcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5884
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
Cc: "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-aspeed@lists.ozlabs.org>, "andrew@aj.id.au" <andrew@aj.id.au>, "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>, "yulei.sh@bytedance.com" <yulei.sh@bytedance.com>, open list <linux-kernel@vger.kernel.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>, "zhangjian3032@gmail.com" <zhangjian3032@gmail.com>, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, "xiexinnan@bytedance.com" <xiexinnan@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSm9lbCAvIEppYW4sDQoNCglTb3JyeSB+IEkgZGlkbid0IG9ic2VydmUgdGhlIGxhc3QgbWFp
bCBmcm9tIEppYW4uDQoJDQoJTXkgbGFzdCBwYXRjaCB3YXMgdXNlZCB0byBhdm9pZCB0aGUgc2l0
dWF0aW9uIGxpa2UgYmVsb3cgbGluay4NCglodHRwczovL2xpc3RzLm96bGFicy5vcmcvcGlwZXJt
YWlsL29wZW5ibWMvMjAyMy1BdWd1c3QvMDMzNzU2Lmh0bWwNCg0KCUJlY2F1c2UgSSBoYXZlIGFw
cGxpZWQgY29udHJvbGxlciByZXNldCBpbiBteSBwYXRjaC4NCglUaGVyZWZvcmUsIEkgdGhpbmsg
eW91IGp1c3QgbmVlZCB0byByZXNldCB0aGUgc2xhdmUgc3RhdGUgYnkgImJ1cy0+c2xhdmVfc3Rh
dGUgPSBBU1BFRURfSTJDX1NMQVZFX0lOQUNUSVZFIiBpbiB5b3VyIGNhc2UuDQoNCglCUiwNCg0K
CWJ5IFRvbW15DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9lbCBT
dGFubGV5IDxqb2VsQGptcy5pZC5hdT4NCj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMjcs
IDIwMjMgMTA6NDMgQU0NCj4gVG86IEppYW4gWmhhbmcgPHpoYW5namlhbi4zMDMyQGJ5dGVkYW5j
ZS5jb20+DQo+IENjOiBUb21teSBIdWFuZyA8dG9tbXlfaHVhbmdAYXNwZWVkdGVjaC5jb20+Ow0K
PiBicmVuZGFuLmhpZ2dpbnNAbGludXguZGV2OyBiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc7IGFu
ZHJld0Bhai5pZC5hdTsNCj4gemhhbmdqaWFuMzAzMkBnbWFpbC5jb207IHl1bGVpLnNoQGJ5dGVk
YW5jZS5jb207DQo+IHhpZXhpbm5hbkBieXRlZGFuY2UuY29tOyBvcGVuIGxpc3Q6QVJNL0FTUEVF
RCBJMkMgRFJJVkVSDQo+IDxsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnPjsgbW9kZXJhdGVkIGxp
c3Q6QVJNL0FTUEVFRCBJMkMgRFJJVkVSDQo+IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+OyBt
b2RlcmF0ZWQgbGlzdDpBUk0vQVNQRUVEIE1BQ0hJTkUgU1VQUE9SVA0KPiA8bGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPjsgbW9kZXJhdGVkIGxpc3Q6QVJNL0FTUEVFRA0KPiBN
QUNISU5FIFNVUFBPUlQgPGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnPjsgb3BlbiBsaXN0
DQo+IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW0V4dGVy
bmFsXSBSZTogW1BBVENIXSBpMmM6IGFzcGVlZDogRml4IGkyYyBidXMgaGFuZyBpbiBzbGF2ZSBy
ZWFkDQo+IA0KPiBPbiBGcmksIDIyIFNlcHQgMjAyMyBhdCAxNDozOSwgSmlhbiBaaGFuZyA8emhh
bmdqaWFuLjMwMzJAYnl0ZWRhbmNlLmNvbT4NCj4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gVG9tbXkg
aGFzIHN1Ym1pdHRlZCBhIHNpbWlsYXIgZml4Og0KPiA+ID4NCj4gPiA+DQo+ID4gPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1pMmMvMjAyMzA5MDYwMDQ5MTAuNDE1NzMwNS0xLXRvbW15
X2h1YQ0KPiA+ID4gbmdAYXNwZWVkdGVjaC5jb20vDQo+ID4gPg0KPiA+ID4gSGlzIGNoYW5nZSBp
cyB2ZXJ5IGhlYXZ5IGhhbmRlZDsgaXQgcmVpbml0aWFsaXNlcyB0aGUgYnVzIGluY2x1ZGluZw0K
PiA+ID4gcmUtcGFyc2luZyB0aGUgZGV2aWNlIHRyZWUgKCEpLg0KPiA+ID4NCj4gPiA+IFNob3Vs
ZCB3ZSBoYXZlIG1lcmdlZCB0aGlzIGZpeCBpbnN0ZWFkPyBJZiBub3QsIGFyZSB5b3UgYWJsZSB0
bw0KPiA+ID4gY29uZmlybSB0aGF0IGhpcyBjaGFuZ2UgZml4ZXMgeW91ciBpc3N1ZT8NCj4gPg0K
PiA+IEkgZmVlbCBpdCdzIGZvciBzb2x2aW5nIHRoZSBzYW1lIGlzc3VlLCBidXQgSSB0aGluayB0
aGlzIHBhdGNoIGlzDQo+ID4gbWlzc2luZyB0aGUgYWN0aW9uIGBidXMtPnNsYXZlX3N0YXRlID0g
QVNQRUVEX0kyQ19TTEFWRV9JTkFDVElWRTtgLA0KPiA+IHdoaWNoIG1lYW5zIGl0IGNhbid0IHJl
c29sdmUgbXkgcHJvYmxlbS4gQFRvbW15LCBjYW4geW91IGhlbHAgY29uZmlybQ0KPiB0aGlzPw0K
PiANCj4gWW91J3JlIHJpZ2h0LCBpdCBkb2Vzbid0IGNoYW5nZSB0aGUgc2xhdmVfc3RhdGUgYXQg
YWxsLg0KPiANCj4gVW5mb3J0dW5hdGVseSwgZGVzcGl0ZSBubyBhY2tzIGZyb20gdGhlIG1haW50
YWluZXJzLCB0aGlzIHBhdGNoIGhhcyBub3cgYmVlbg0KPiBtZXJnZWQgYW5kIGJhY2twb3J0ZWQg
dG8gc3RhYmxlLiBXZSBzaG91bGQgY29tcGxldGUgdGhlIGZpeCwgb3IgcmV2ZXJ0IGl0DQo+IGFz
YXAuDQo=
