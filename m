Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 621814AD7AD
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 12:39:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtLds0Vpfz30gg
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 22:39:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=WyWWP36C;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nuvoton.com (client-ip=2a01:111:f400:febc::613;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=tali.perry@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=WyWWP36C; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::613])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtDhh2Jpxz3bV4
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 18:11:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C17Gyl0pULMghZUGMM6P8nryAyu4RGHTq5t8kUP2Cgg70pf00REHW4mtUz7nYqC7mYvvZZ26sKxwjZ+WPeVZMT4aBDIsdMZFqVi5z4fS09I432hdksqQlrnebuxr5NG7j15U72OvIUp6EyCLwhKD4t8KzS/A5HPuLWx/+Lbum9ka+wCk7Hd2Y8HFoNUjE96zrT4RBByjyhvvtaXn0lvz7Oy+tu9wn+QOh46+HIevgV3GAXz8mvulcO0QkVielEamQfFsQsqhOcnakIQwacICknXe6Y9BZcK+XBtm1SfVnJIq4R+Dd6Anx4MvnaFXk7Xjw0PiapVVv9n48kFm4kkDVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9j5qbbvY+wvkYB3fHmthRBd1wP96tKB5QzOElG4XFEE=;
 b=Cnbq/l1geZlYL4g8WHMav84WkuO+YqnzK/BlAhy8ruId+oMFJABJHzZ1WXA/zxkzGoOfF0HGcSsYAG824EMlsd3Qy2+3X5/4V96GAmV7HDbqMN9muuLJKd54si7aQU3z9yEEQNaCnJEHjF9pBctdaN4+jVlHvaHIMqR+AnQDi2zHUzIURVSE0x0KYw+yDDqxQNGnfgfrP/Tp2Rq1mQ75CjAz+CRdUg0poq0DhzNPuO2cH17OurAmnIvcsD8xQPRYsWnJ5nlhxDcit8vC2TBco+ZsWDaD/W0BmArIj3nAK8RtCAXUtU1nOkMpt2y3U3Yw1GnKxW9nEmyvLEYlNG0boA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9j5qbbvY+wvkYB3fHmthRBd1wP96tKB5QzOElG4XFEE=;
 b=WyWWP36C2l7GrYj8/8C31xx+wmyvMa6/7DcXUXwhVLEEmaXqFW9B7wHaY4QcrjbP5BLPumbzBEwwFfJNc2xE+/k64nKDvYYZ4p87Iq0cdW6jYLzsd+lxqVgCQ9qxv0zyld499iKSAWhvOMsxhy4uc0Qbr7/bb/X+pYueY31fR3c=
Received: from SI2PR03MB6167.apcprd03.prod.outlook.com (2603:1096:4:14f::8) by
 TYZPR03MB5966.apcprd03.prod.outlook.com (2603:1096:400:126::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.8; Tue, 8 Feb 2022 07:11:25 +0000
Received: from SI2PR03MB6167.apcprd03.prod.outlook.com
 ([fe80::1d94:11fc:8817:a6db]) by SI2PR03MB6167.apcprd03.prod.outlook.com
 ([fe80::1d94:11fc:8817:a6db%3]) with mapi id 15.20.4975.011; Tue, 8 Feb 2022
 07:11:25 +0000
From: "tali.perry@nuvoton.com" <tali.perry@nuvoton.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?utf-8?B?Sm9uYXRoYW4gTmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>, Tyrone Ting
 <warp5tw@gmail.com>
Subject: RE: [PATCH v1 6/6] i2c: npcm: Support NPCM845
Thread-Topic: [PATCH v1 6/6] i2c: npcm: Support NPCM845
Thread-Index: AQHYG+y1yrN55WwJ0EuOPAWW90cpF6yH/LUAgAA5mgCAAQVPgA==
Date: Tue, 8 Feb 2022 07:11:25 +0000
Message-ID: <SI2PR03MB6167FAAD0820B0A8F1305A7C902D9@SI2PR03MB6167.apcprd03.prod.outlook.com>
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-7-warp5tw@gmail.com> <YgEJ1M40AG9EuRPI@latitude>
 <086655b0-b9d2-30ed-1496-47cdc6346003@canonical.com>
In-Reply-To: <086655b0-b9d2-30ed-1496-47cdc6346003@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1f4b5d9-1423-48c5-7252-08d9ead23840
x-ms-traffictypediagnostic: TYZPR03MB5966:EE_
x-microsoft-antispam-prvs: <TYZPR03MB59665482AF370A718747D432902D9@TYZPR03MB5966.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c1J6BD0f2tAcQPwBuSfsOJo+rcdXNcBikQY4s3qTLoRtCNFLnJYWnuVEcZNNj22YNdMXUwgyVeest5k8reF3H+wTp9qI1AitYO+1Fmki8mod1tiTOJy3v6d0+TkVSv093rkBA4geaP8zVVCrMZ3xRb0slbCYANmIzxTA/tGOVuTfMGHfs0qRdazT0XIMXGLlHNBcI6SahGync6NGsLd50+a7yIXHKF7Bkc3z2ZAjVK7FkkLzMK34a4AnsuTYFCvLVFnEpTaBzVzBAR2ItPa3orUv/HuJSvi0pRr9Sc4MXhiHmWvijeaHl8bZWp7NSByz7sB4Kyhz98ZoCet8FNbNXqApwXkt17K5t6bWng8kMboTNpOHfJ9qOpyAqJRz0EVUWgzqpm8egnpDqZUjUQwWE+se4kBYCIMYMt7iHZ2OtF0DoIvMacWhQBn0/xeW/WnD5RAJxwAzf70axIegmSLcR50CwNbIKzvVr8724pGU3RmSlF4omv9A3kDcd40X67corgHgJUd8c5ZuJQAujiJcqKyv1HjFwuhyaMz8sxMeferDfFSuyeEUOiFhF3XfzbQMZ+8wSsXiqOEMvu22caNVxxMwynQjAwni5xrbgE2tr7HzH/wRqVL1pFXi3unKv5eO3uUblNeGZcqQedNeH/NVDRMQ0gfgs7+psq70yXzYsA7l8lwWI5M8OIZcrNF/LhdRpUOoOEZZtyBtDLtrtfrDhQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB6167.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(38070700005)(4326008)(83380400001)(508600001)(5660300002)(76116006)(52536014)(2906002)(86362001)(66476007)(64756008)(7416002)(8676002)(8936002)(66946007)(316002)(54906003)(186003)(110136005)(66556008)(9686003)(55016003)(7696005)(6506007)(66574015)(71200400001)(26005)(122000001)(66446008)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RnlmSm1mSThUbWdQY2xJZXJSejNobHBWcXZjR2g0K1hObXFqR2RTYkc5a0l0?=
 =?utf-8?B?a2lWVlFMb3hCMTR3NjBnM1ZQT3JWODI1Y1BEUGlaamRRbkpWMkR5Y3VVSnBx?=
 =?utf-8?B?dlVqQVNxWldPVjJUT1ZOaDJ5RGhQZGJJWXdXRGlzdEZwcURjVFFGZlp0V3g5?=
 =?utf-8?B?d0NlTENvOUtQeDZrMTRoc3NvS0cwdTA4QXBMTXo5eWo2dHA2YTRmQkNveU52?=
 =?utf-8?B?R29XSXVGalNjdVF5dzJvMWdldlN4c3VPQkJ0YlFoaVBzZjFPYmN6YUFoeXZX?=
 =?utf-8?B?N2V2MENUb2toTVI3R2JsZ2lyWElWSEExeEoraGdOb3Y5NDA2RDZtNk1yK091?=
 =?utf-8?B?L0JVcUFnY0lFazVnYkV0Wm9aa0tNRnpDbjhYT0swNWdoaW1rRnRpNGtnTFhX?=
 =?utf-8?B?SGFONzYyaXVrbDFDaUEwV2lmdmhpaFJXckd5bzF2SHBtTUwyUFJFQjZ2OHVy?=
 =?utf-8?B?OWpCTkNGMzBkdysrNWRnc1RNdjNLWTZ3bHB6aGZOVGhwaEFaSzhmVFRsSkFv?=
 =?utf-8?B?RFIycGxNVXcvV1hBaXVwOU1MOCtkNGE5RDZRZW9kNWRVRzZuMk5KbUtDWHdO?=
 =?utf-8?B?d0RVQlBRWW9oTEtYWG5GWlZyMEVzQkpzNXZFUGh2cXczSHcraGZkYkR4TWQ0?=
 =?utf-8?B?aTgxOVVkdm9kanRGeGJ3NUZzQXRqTjFGWkRqdzRoajVLWmZtWVpMcGhMQVkv?=
 =?utf-8?B?Z2hmeFo4bjBydjNpaWNRL0FlVkhWY1BtcGMyYm9PclpaRWJiTUhkUStjOFBm?=
 =?utf-8?B?RjBPaTFzd1ZXLzc0N0pjSmJjRmRHTGZIZDdUcWhqVFJQeml0c2ttRDhTY0dD?=
 =?utf-8?B?dkNqdUpkWXp5RHdqdjRRUDJDcGdTT3NnaVVlcHFENmJCWENJem4xY0tjSGxC?=
 =?utf-8?B?aXFSWGt6VGJwcUczMnBlYkNLY1cyaXk2UWZ6SVZYRy80bThwK3k1SXQ4TmhZ?=
 =?utf-8?B?VnVibmliRno4UFdPY0s4MFVyTURrYkgvL21TQ3pRd3Q0aVJsbmZESHh6S21p?=
 =?utf-8?B?emRJdjRmVHdnWGtVcEhKY0pmSFMyUm9QREg1eHBTWlJrZXR4K25jRUQxMWpn?=
 =?utf-8?B?c2dHU1dJK1owcVBpLy9hNmRwMVkwQzZpbHFhQVlYUGZYZFY5VEpZOVI5eml6?=
 =?utf-8?B?UDZ1NXpIckpVVHh2NEZJdnVTcXVzRmYzb1dXd2U5WkNHbk9odkhzeFJCckZz?=
 =?utf-8?B?OGEzM0VZMkZGMEQvVzkyR3RrNGNycG5RdjB3cHBhNEVuM2RpZS9tazRHQUox?=
 =?utf-8?B?bVAwWVRrV1Vqd0xKaGt0YzYzTjBlMjlMWkNCSDJ1Zkp5NlY1alRhRWcwVnBr?=
 =?utf-8?B?Slg4WWQzQVJqa2llZEppZDhjcUFpVmtvZ1VUM25ETGw3dFI5RDB4UVZDMC9y?=
 =?utf-8?B?YkVkYTc4T2t0SVBhZVpWeHFzQURlSy96Nzk2VlVHT2V6U1cwU1ZYZzhBK04x?=
 =?utf-8?B?RnBDVUVQZ20vQ3BNajRxRUdxSEpndzFJdkVXeXRQbE02d2VaZXFtRS8yK0RY?=
 =?utf-8?B?OC8wV21sZEN3cnA3RjVNTkF5WkorZ2RBRExjYldsejBiYm84c3ZucTJlZHF3?=
 =?utf-8?B?Q25SQnMyTnRUT3M1ZTZuV3VmMGJ0S0tvdnpEVEs0RGcwTVY2K3VUdmhOUE9L?=
 =?utf-8?B?WUcxdWV2ZWNZUzc2L0p4WFZHZzBEMVE1SEtRKzk4aGhaVWpKYWFlWEEyOVZB?=
 =?utf-8?B?eVhDR2lMNE1TMUI1L1NSREw5NzJsUjYzUWxDY3Y2a3BFWHF3VmM3Z3BUVmc1?=
 =?utf-8?B?RTlaRWZwdlcwQnFTa1NqSEFZcm1CYTNDZFpIMzNua0w5WmRka20wY2d4SHhu?=
 =?utf-8?B?M2NadWhqYTNONU9SVUpWeGF4RkU1SERta040RmpRZzE2K3RKYW5FMXlsMEtS?=
 =?utf-8?B?NWxGRkw2dlBlaVFVSWZVbnZublRnbjF1WE5rV0VYcGFya0FvMU9JWUdZeWRC?=
 =?utf-8?B?TnNlenVrdjE0d2YzTjlpbkp2ejV2OUpmcWtNek82WEN1RTM4U2F5SXY1QVBk?=
 =?utf-8?B?SlY2ZGUvOUEyWFpWSzduNXZhU1h2OHIxYXRCa3NjaC93L1RqUk43Q2pRRFUw?=
 =?utf-8?B?b0NzQmJFZFBSb0pKa3BKZGtId2t4RFVsR3hMdzBTUnA5YWdYSzZQTFRpRGxT?=
 =?utf-8?B?NXdLOXJMaVJsVEhKMXcweFNBejNvb0dzWFh1V1lhNU02d3JJcU1GRjVORnVQ?=
 =?utf-8?Q?KvGhLgLbkBJ6YuvVbKMZu4s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6167.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f4b5d9-1423-48c5-7252-08d9ead23840
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 07:11:25.6311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T3d7TV42LmGyLMjnYOyABeHGnz4Dy5wsomhOZKBAl6fqdd37sviPjyuKUikwbIRVGZOvUhzxjLNrCZb7BCHdPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5966
X-Mailman-Approved-At: Tue, 08 Feb 2022 22:39:24 +1100
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
Cc: "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "JJLIU0@nuvoton.com" <JJLIU0@nuvoton.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "tomer.maimon@nuvoton.com" <tomer.maimon@nuvoton.com>,
 "KWLIU@nuvoton.com" <KWLIU@nuvoton.com>,
 "bence98@sch.bme.hu" <bence98@sch.bme.hu>, "arnd@arndb.de" <arnd@arndb.de>,
 "sven@svenpeter.dev" <sven@svenpeter.dev>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Avi.Fishman@nuvoton.com" <Avi.Fishman@nuvoton.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "semen.protsenko@linaro.org" <semen.protsenko@linaro.org>,
 "jie.deng@intel.com" <jie.deng@intel.com>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "yangyicong@hisilicon.com" <yangyicong@hisilicon.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wsa@kernel.org" <wsa@kernel.org>, "KFTING@nuvoton.com" <KFTING@nuvoton.com>,
 "olof@lixom.net" <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbT4NCj5TZW50OiBNb25kYXksIEZl
YnJ1YXJ5IDcsIDIwMjIgNToyNyBQTQ0KPlRvOiBKb25hdGhhbiBOZXVzY2jDpGZlciA8ai5uZXVz
Y2hhZWZlckBnbXgubmV0PjsgVHlyb25lIFRpbmcgPHdhcnA1dHdAZ21haWwuY29tPg0KPkNjOiBh
dmlmaXNobWFuNzBAZ21haWwuY29tOyB0bWFpbW9uNzdAZ21haWwuY29tOyB0YWxpLnBlcnJ5MUBn
bWFpbC5jb207IHZlbnR1cmVAZ29vZ2xlLmNvbTsgeXVlbm5AZ29vZ2xlLmNvbTsgYmVuamFtaW5m
YWlyQGdvb2dsZS5jb207IHJvYmgrZHRAa2VybmVsLm9yZzsgc2VtZW4ucHJvdHNlbmtvQGxpbmFy
by5vcmc7IHlhbmd5aWNvbmdAaGlzaWxpY29uLmNvbTsgd3NhQGtlcm5lbC5vcmc7IGppZS5kZW5n
QGludGVsLmNvbTsgc3ZlbkBzdmVucGV0ZXIuZGV2OyBiZW5jZTk4QHNjaC5ibWUuaHU7IGx1a2Fz
LmJ1bHdhaG5AZ21haWwuY29tOyBhcm5kQGFybmRiLmRlOyBvbG9mQGxpeG9tLm5ldDsgYW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tOyBJUzIwIFRhbGkgUGVycnkgPHRhbGkucGVycnlA
bnV2b3Rvbi5jb20+OyBJUzIwIEF2aSBGaXNobWFuIDxBdmkuRmlzaG1hbkBudXZvdG9uLmNvbT47
IElTMjAgVG9tZXIgTWFpbW9uIDx0b21lci5tYWltb25AbnV2b3Rvbi5jb20+OyBDUzIwIEtXTGl1
IDxLV0xJVUBudXZvdG9uLmNvbT47IENTMjAgSkpMaXUwIDxKSkxJVTBAbnV2b3Rvbi5jb20+OyBD
UzIwIEtGVGluZyA8S0ZUSU5HQG51dm90b24uY29tPjsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmc7IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPlN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgNi82
XSBpMmM6IG5wY206IFN1cHBvcnQgTlBDTTg0NQ0KPg0KPk9uIDA3LzAyLzIwMjIgMTM6MDAsIEpv
bmF0aGFuIE5ldXNjaMOkZmVyIHdyb3RlOg0KPj4gSGVsbG8sDQo+Pg0KPj4gT24gTW9uLCBGZWIg
MDcsIDIwMjIgYXQgMDI6MzM6MzhQTSArMDgwMCwgVHlyb25lIFRpbmcgd3JvdGU6DQo+Pj4gRnJv
bTogVHlyb25lIFRpbmcgPGtmdGluZ0BudXZvdG9uLmNvbT4NCj4+Pg0KPj4+IE5QQ004WFggdXNl
cyBhIHNpbWlsYXIgaTJjIG1vZHVsZSBhcyBOUENNN1hYLg0KPj4+IFRoZSBvbmx5IGRpZmZlcmVu
Y2UgaXMgdGhhdCB0aGUgaW50ZXJuYWwgSFcgRklGTyBpcyBsYXJnZXIuDQo+Pj4NCj4+PiBSZWxh
dGVkIE1ha2VmaWxlIGFuZCBLY29uZmlnIGZpbGVzIGFyZSBtb2RpZmllZCB0byBzdXBwb3J0IGFz
IHdlbGwuDQo+Pj4NCj4+PiBGaXhlczogNTZhMTQ4NWIxMDJlICgiaTJjOiBucGNtN3h4OiBBZGQg
TnV2b3RvbiBOUENNIEkyQyBjb250cm9sbGVyDQo+Pj4gZHJpdmVyIikNCj4+DQo+PiBJdCdzIG5v
dCByZWFsbHkgYSBidWcgZml4LCBidXQgcmF0aGVyIGFuIGFkZGl0aW9uYWwgZmVhdHVyZS4NCj4+
IFRoZXJlZm9yZSwgSSBzdWdnZXN0IHJlbW92aW5nIHRoZSBGaXhlcyB0YWcgZnJvbSB0aGlzIHBh
dGNoLg0KPj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBUeXJvbmUgVGluZyA8a2Z0aW5nQG51dm90b24u
Y29tPg0KPj4+IFNpZ25lZC1vZmYtYnk6IFRhbGkgUGVycnkgPHRhbGkucGVycnkxQGdtYWlsLmNv
bT4NCj4+PiAtLS0NCj4+IFsuLi5dDQo+Pj4gIC8qIGluaXQgcmVnaXN0ZXIgYW5kIGRlZmF1bHQg
dmFsdWUgcmVxdWlyZWQgdG8gZW5hYmxlIG1vZHVsZSAqLw0KPj4+ICAjZGVmaW5lIE5QQ01fSTJD
U0VHQ1RMICAgICAgICAgICAgICAgICAgICAgMHhFNA0KPj4+ICsjaWZkZWYgQ09ORklHX0FSQ0hf
TlBDTTdYWA0KPj4+ICAjZGVmaW5lIE5QQ01fSTJDU0VHQ1RMX0lOSVRfVkFMICAgICAgICAgICAg
MHgwMzMzRjAwMA0KPj4+ICsjZWxzZQ0KPj4+ICsjZGVmaW5lIE5QQ01fSTJDU0VHQ1RMX0lOSVRf
VkFMICAgICAgICAgICAgMHg5MzMzRjAwMA0KPj4+ICsjZW5kaWYNCj4+DQo+PiBUaGlzIGlzIGdv
aW5nIHRvIGNhdXNlIHByb2JsZW1zIHdoZW4gc29tZW9uZSB0cmllcyB0byBjb21waWxlIGEga2Vy
bmVsDQo+PiB0aGF0IHJ1bnMgb24gYm90aCBOUENNN3h4IGFuZCBOUENNOHh4IChiZWNhdXNlIHRo
ZSBkcml2ZXIgd2lsbCB0aGVuDQo+PiBvbmx5IHdvcmsgb24gTlBDTTd4eCkuDQo+DQo+WWVzLCBn
b29kIGNhdGNoLg0KPg0KPlRoZSBOUENNN1hYIGlzIG11bHRpcGxhdGZvcm0sIEkgZ3Vlc3MgTlBD
TTh4eCB3aWxsIGJlIGFzIHdlbGwsIHNvIHRoaXMgbG9va3MgbGlrZSBhbiBpbnZhbGlkIGNvZGUu
IEhvdyBzdWNoIGNvZGUgaXMgc3VwcG9zZWQgdG8gd29yayBvbiBtdWx0aXBsYXRmb3JtIGtlcm5l
bD8NCj4NCg0KDQpOUENNN3h4IGFuZCBOUENNOHh4IGFyZSB2ZXJ5IGRpZmZlcmVudCBkZXZpY2Vz
Lg0KVGhleSBzaGFyZSBzYW1lIGRyaXZlciBzb3VyY2VzIGZvciBzb21lIG9mIHRoZSBtb2R1bGVz
IGJ1dCBpdCdzIG5vdCBBQkkuDQpVc2VycyBjYW5ub3QgY29tcGlsZSBhIHNpbmdsZSBrZXJuZWwg
d2l0aCB0d28gc2VwYXJhdGUgRFRTLg0KSW4gY2FzZSBvZiB0aGUgaTJjIGNvbnRyb2xsZXIsIHRo
ZSBucGNtN3h4IGhhcyBhIDE2IGJ5dGUgSFcgRklGTywNCmFuZCB0aGUgTlBDTTh4eCBoYXMgMzIg
Ynl0ZXMgSFcgRklGTy4NClRoaXMgYWxzbyBtZWFucyB0aGF0IHJlZ2lzdGVycyBmaWVsZHMgYXJl
IHNsaWdodGx5IGRpZmZlcmVudC4NCkZvciBpbml0IGRhdGEgd2UgY2FuIG1vdmUgaXQgdG8gdGhl
IERUUywgYnV0IHJlZ2lzdGVyIGZpZWxkIHNpemVzDQpjYW4ndCBiZSBoYW5kbGVkIHdpdGggdGhp
cyBhcHByb2FjaC4NCg0KDQoNCj4+DQo+PiBBbmQgZXZlcnkgdGltZSBhbm90aGVyIHBsYXRmb3Jt
IGlzIGFkZGVkLCB0aGlzIGFwcHJvYWNoIHdpbGwgbWFrZSB0aGUNCj4+IGNvZGUgbGVzcyByZWFk
YWJsZS4NCj4+DQo+PiBBIG1vcmUgZnV0dXJlLXByb29mIGFwcHJvYWNoIGlzIHByb2JhYmx5IHRv
IGhhdmUgYSBzdHJ1Y3Qgd2l0aCBjaGlwLQ0KPj4gc3BlY2lmaWMgZGF0YSAoc3VjaCBhcyB0aGUg
STJDU0VDQ1RMIGluaXRpYWxpemF0aW9uIHZhbHVlKSwgd2hpY2ggaXMNCj4+IHRoZW4gc2VsZWN0
ZWQgdmlhIHRoZSAuZGF0YSBmaWVsZCBpbiBvZl9kZXZpY2VfaWQuDQo+DQo+DQo+QmVzdCByZWdh
cmRzLA0KPktyenlzenRvZg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXchDQpUYWxpIFBlcnJ5LCBO
dXZvdG9uLg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQogVGhlIHByaXZpbGVnZWQgY29uZmlkZW50aWFsIGluZm9ybWF0
aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGVtYWlsIGlzIGludGVuZGVkIGZvciB1c2Ugb25seSBieSB0
aGUgYWRkcmVzc2VlcyBhcyBpbmRpY2F0ZWQgYnkgdGhlIG9yaWdpbmFsIHNlbmRlciBvZiB0aGlz
IGVtYWlsLiBJZiB5b3UgYXJlIG5vdCB0aGUgYWRkcmVzc2VlIGluZGljYXRlZCBpbiB0aGlzIGVt
YWlsIG9yIGFyZSBub3QgcmVzcG9uc2libGUgZm9yIGRlbGl2ZXJ5IG9mIHRoZSBlbWFpbCB0byBz
dWNoIGEgcGVyc29uLCBwbGVhc2Uga2luZGx5IHJlcGx5IHRvIHRoZSBzZW5kZXIgaW5kaWNhdGlu
ZyB0aGlzIGZhY3QgYW5kIGRlbGV0ZSBhbGwgY29waWVzIG9mIGl0IGZyb20geW91ciBjb21wdXRl
ciBhbmQgbmV0d29yayBzZXJ2ZXIgaW1tZWRpYXRlbHkuIFlvdXIgY29vcGVyYXRpb24gaXMgaGln
aGx5IGFwcHJlY2lhdGVkLiBJdCBpcyBhZHZpc2VkIHRoYXQgYW55IHVuYXV0aG9yaXplZCB1c2Ug
b2YgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIG9mIE51dm90b24gaXMgc3RyaWN0bHkgcHJvaGli
aXRlZDsgYW5kIGFueSBpbmZvcm1hdGlvbiBpbiB0aGlzIGVtYWlsIGlycmVsZXZhbnQgdG8gdGhl
IG9mZmljaWFsIGJ1c2luZXNzIG9mIE51dm90b24gc2hhbGwgYmUgZGVlbWVkIGFzIG5laXRoZXIg
Z2l2ZW4gbm9yIGVuZG9yc2VkIGJ5IE51dm90b24uDQo=
