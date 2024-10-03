Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A199598E909
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2024 05:58:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJyZJ3nbQz3c6Q
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2024 13:58:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::704" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727927876;
	cv=pass; b=nWxf6Moalx2OlYp0FfWeySsIgBq6mCruuySPrPuGUgZxoMraSJoO4YFOP+dWWmvw5lDfktx0p8fZo2OXEFIvZfqpExeeMTnGzW9d0vREGQnoW7kvgXXoA9IXdJM3nnMOCfIedrHFTFrJHazU5KBYy2ywALU3ZCTxQiO5Fm1MF1d6lBboZsPgEqEhRBmpFO7TD93bgRxf1m4km4/pe+nPw0D+DxumXwdBIr/gD9yMpW9xKY2eDnw183At3jQ8mYbuIiRM6xmlAdZBMDU7NsgPRth0Na+0oXalmnhVapptmscGgU88Eh2UadXh5lsEtOC4BPl8kEIL7BVQO2HytGiQhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727927876; c=relaxed/relaxed;
	bh=jJlHKWpgbSRX29KlwAhXBhD08vLp8ykt6I2TKDE4oMQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dzhRHboDFnX5H64rOWcT7rvoYzzEeTljs6ZdaQnGoNmSTPNUbhGV7vENbt9mcZNjJYpKNdapyYdfV4/4wWZaXdoJyNyV4GvJTLtsuH7X2rmJ8q6IwwlPePyZHw/PMdBWe0vwBAi1H/XhTTtiOgGGjmU2jxqVmbB4Y0wnGjyjm/Fc92J/5RZlbGOYWLm3imhSFJEMoecW4dFV4SJhjCNgpJB9mtLicVCscpoCuWS+NeG2WWw3hFlTIcDJBEFh+kEkAPRRBleuRA9Y72cYC9Dg07HpcfesnYib80Qz5M36S8Znwb/IXQSDNyQtr2j5k/ElPpKKtpD91R1hDB6QAxAnSA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=MIX57z2V; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::704; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=MIX57z2V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:2011::704; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20704.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::704])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJyZD0DHCz2yFD
	for <openbmc@lists.ozlabs.org>; Thu,  3 Oct 2024 13:57:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGoP7eWpQTkp5TIV17U9weC0eUsEXrcjSCWQwWFLVICMFHyESOWUwckx/9pSNXVVak5zB1bD6B7lcI1wb0+khsbeiLxcrnMvAacVgAMq9/LsGpMQazeP8U3nTl82crwknJK2Z93Zh7VCgkI7x/zx7Yv2k0HpGxFwJNDGzrK1y4hmkRPSioIJNamQd5XznDi/PC5iyE9LVax6GanMVf/7u+TrtoTuG6PqU5G4oQItP1OhfjUaKhb/xcK6Dfd9tD5k+t1mpQILoODFJOe1993RsOCJpmApxJ98e4cdZVE54gVveHoo+rQgawfj1pP4L5Vq5yvqGMcd/0ntoyYQBn810g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJlHKWpgbSRX29KlwAhXBhD08vLp8ykt6I2TKDE4oMQ=;
 b=bo0NQAihRAF7Kyw0AFTkHMgrM7qhBiZSFVogJhKeDD9Pz8/Ce87T3LkBUYqr1GjHh8zHYTFJhAcIz9pRE7hGD2m6ydKZKk2JlTrs41jN7aZPK+J25zthSScmXjtC+PFIpnHK6dgVadBbcBtFIkNmaZt7//BfEUS40tuPXjkJn6joFxBRbeBovCF+9q3GeCZqNc9FOgA+9GrTvis2Mw6qNdapLD9OLzVwgfZPXbTvXw7pHTuPGnVpFG7PhJgqnkFyFwxR7vta4Mh2sSOEHnMPBJ1f9uEOJSAY1AD4TXuNX43S4Nb35TV1U2uAL3F439TCQHOo9NftIRawemB09G76zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJlHKWpgbSRX29KlwAhXBhD08vLp8ykt6I2TKDE4oMQ=;
 b=MIX57z2VR1AnWx9urLRtFyQHBHIPZio4lXwEAf/pD1aV7GYEejGySEjkahArzgtaHYINGNVIFcKbUfNw9E0BTVA+3d7Q4ZrR/qpC2AX8cr/h7tdH2keFGiJqswRvyqKLKlF5bTxs0bfmR3f15p3gjSW3Cwn3Md3ym3u9x8XIc7KXZXiekqezuQPSAEW5ZqqylDsprMvLHLzCsxuMSj/la4dkzy507wMeVXv5QuDkoJynEPO8xfVXN5ItoVqeXKXjtpXvNc6KKwoSjyV9oceHXZ5Xr8QiHt5TKHHTGcN1W6t92Y7ChcURj4/JpF4b4uK+tp3ANw/f9ZoHWr/2oBktTA==
Received: from SI6PR06MB7535.apcprd06.prod.outlook.com (2603:1096:4:235::12)
 by SEZPR06MB7080.apcprd06.prod.outlook.com (2603:1096:101:1f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 03:41:57 +0000
Received: from SI6PR06MB7535.apcprd06.prod.outlook.com
 ([fe80::8af2:b731:a5e5:169f]) by SI6PR06MB7535.apcprd06.prod.outlook.com
 ([fe80::8af2:b731:a5e5:169f%4]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 03:41:57 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v14 0/3] Add ASPEED AST2600 I2Cv2 controller driver
Thread-Topic: [PATCH v14 0/3] Add ASPEED AST2600 I2Cv2 controller driver
Thread-Index: AQHbFJkFQwNKPZEeEUm4WxILxLvNH7Jzh3+AgADa1uA=
Date: Thu, 3 Oct 2024 03:41:57 +0000
Message-ID:  <SI6PR06MB75359904E108D7D0CC89A329F2712@SI6PR06MB7535.apcprd06.prod.outlook.com>
References: <20241002070213.1165263-1-ryan_chen@aspeedtech.com>
 <Zv1aOedi9xl2mg9b@smile.fi.intel.com>
In-Reply-To: <Zv1aOedi9xl2mg9b@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI6PR06MB7535:EE_|SEZPR06MB7080:EE_
x-ms-office365-filtering-correlation-id: 9ac76ddb-6936-4b93-0a88-08dce35d54aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:  =?us-ascii?Q?m4Re7qiN+gRKQqN/iYvIuHapJysKSh2KTQD3NK2TBMZ1PTFDtzojKv8KIxyV?=
 =?us-ascii?Q?5q8ETGjB3h1VFXJZQWOQMOkJBzX36Kp4YlaKqnFtAq2As62ehI90Mv4ryeq/?=
 =?us-ascii?Q?0pBghbYzNiPtqG5QRz6eOXQp3lLAzlCr/TQmZF2LQfCoeNR9n1k7oS+fySZ/?=
 =?us-ascii?Q?Xl/a8oyx6PrMgorbqIzSV5gZjGEj31BrGUHOCCiM8ncSiw0UOdWkZY9vMwL+?=
 =?us-ascii?Q?h0DNjKB83T5MPwQHw3IqQGNsA3I5cv0v51UAIMlVxAlw48VQB0NuMWB7rW85?=
 =?us-ascii?Q?0M4bsvnx7xYcStGjB2V/mbb/LOh3TAfiuxyIxbY5jr24ElLo6aSlGEZk8kjq?=
 =?us-ascii?Q?tYDTOi3sXJXKKQzw1JlLNfFdSgS3CDacxjIxUMIbfzYrVtAttg/bv7V4x1L6?=
 =?us-ascii?Q?JNbXu6n6iofScEqqcdjpQWlooJXizISiae4NMz1edEAK8bhAkRi/andhflv2?=
 =?us-ascii?Q?OalTY+vHiMhEIBK4Y9X9qjGjzR1b3AZjpDY/+MXCETuTRMI9/xtZdR2dGPfr?=
 =?us-ascii?Q?bCfdurZ95LTy7i1akGShrxStTHhkTaC1dVYYFjwcxy+7coE7Ra27pgkTsxSm?=
 =?us-ascii?Q?hq0OAhCGk75KVaem+oz4HT+YbXS788gLzBSthpboMnhA0CIrXcYA+VGNpjCf?=
 =?us-ascii?Q?UgLh+1tdMXWjiixhQnJ8Nr1Dg1cf7Hg3J6ppGxiSwJ4rkKCEg/jAgy7AEPEU?=
 =?us-ascii?Q?ewmeMlOAtStFJ4/hjQ8+a1PJSLSx9rGpByHIwwBHjS1dZ55Q1aiIbsx7NeDM?=
 =?us-ascii?Q?RRqFkuLZYUJoOc/qg0Gmxaw2a4d2hj1YfohWI/eFUQSIvhtEeyly35HeOY8t?=
 =?us-ascii?Q?1HtCJ0lYVO3kdy/BxFQ5GaMxoWsr14ygN7gWYxELRwQ9i6Va0h1uYAQlJLAU?=
 =?us-ascii?Q?MWDmicilqUouPVrWDUv3KZLvtATMo3bJFDcIEPJQ6/ZaqZ3RnC+UG2GlY9Ud?=
 =?us-ascii?Q?JbRaNDbctWiKC4UWP2HwZavaQ34ybC0HsiMxwYOWLdg64vJ/+9XeYkB2Fn5v?=
 =?us-ascii?Q?VcBueFBvNxb6jpN+y8X6BrzV98HkEX7FF0a5FckVV01QtbIGGbECgBQWjLmx?=
 =?us-ascii?Q?c3kkw/ADhKQOGKOADqXeF8Km51yD0YpiAW6SxxEg0oyJWSzg7UqlT/j5nVO3?=
 =?us-ascii?Q?z3hNXQsAg49XU/qt5vjF1p1Dc3F521iqNxywVlx/kMEJLqurNbYXzMOxDzUr?=
 =?us-ascii?Q?+xauUi1EEBs7BZKD/kQ90LJQb72VLoTLGR/lm7h/APqShWr0IOffvu3Mayz3?=
 =?us-ascii?Q?VydH2i4WLCqh9zBp3M5G9T33N+orPnyru34KPoqetprh3QgmqNdh86P4lG/l?=
 =?us-ascii?Q?/UtFL9ZTvSqWLYeDMs1N0hvuR8rrMsiZkg3/xVb9TVGvPA=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI6PR06MB7535.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?J2O1qOoFJ3MyXIJQwmHWhQVl/e+f4wmIjNhI8Gxf8a2x3L0MpA3YxEhE0ns8?=
 =?us-ascii?Q?pLqGXwK5xl+O6AtxX5LXr46XBvPVfRIZgRlsMmfacvjJ6jB6Wx85trnodPAf?=
 =?us-ascii?Q?dvXRLDqtugVWcZ+YuOlRdJNHOCH0KLk3TfVNoM6spjAV9hodqgt9UlTmgdCc?=
 =?us-ascii?Q?K1Cq5pe5Us/4UC2vEFMK+8BIb2qNjfD+flOcvVOVDycNW2nYwWA+iyDGHw8Y?=
 =?us-ascii?Q?buYgBLVHFyaLcFXpTAJblcDJgRTFPE8pr3Xy0FWgjN40mvItp0eByHykH/7Y?=
 =?us-ascii?Q?WGVKLy2qIX/Mw82uLWDRtJhzex9MEDiJ+NSLcQuJvuVvC/osjG+ZgnW1N9Uu?=
 =?us-ascii?Q?7NMOqz+TcvAOPoB6spk4ATqyExRQK6Ox+fUGiRYnxTTPdxLZ9a9cnEpWtyc4?=
 =?us-ascii?Q?HybFnHvT7gso6x2ua2+rikMu7Rp6GlRI7uJCiPBwIqZtCHg5HQAogteB+Tk/?=
 =?us-ascii?Q?bTIx5j+QO8JepTdFBtRy2OxoYvFFppxQGCyA9G3iT/UmmQfQ4ggrxegvz/t1?=
 =?us-ascii?Q?6hZ59Wr4XS5SsKQ4eI6+Qxwqxr3VzYTBAyGSNy9Ao25kqay/om7skDbY3F/q?=
 =?us-ascii?Q?FKW1wXpp7HhiCFLrr790IKP5uSXx/5X1Hl6Ts9jCKwhJ0PhrBuwCjRgGrf0F?=
 =?us-ascii?Q?pFzVVXuMLLqKoGCe2E6kxbW1n20tTG04bsgKU6OQalMZJ9OnOzI4PJ8OdALZ?=
 =?us-ascii?Q?6JttcBe4ohRrithS1ts714rCXkkdTm7LrxS4xHhWWXQvwRXE9ZYf1J2EGhcv?=
 =?us-ascii?Q?0+AyNg123l8CdrXqSgulw7rVbL42D+y5sfWDABvpM14tR4GfbunRKZwxL72t?=
 =?us-ascii?Q?lECWdfNNEhpUs6fsxPBhGbbGg8R16Z3nARS2t0Pil1CAuH6h7JUDr882EVQI?=
 =?us-ascii?Q?WwApKKMJgFMzlwN7m7ldggl9j61zUAkPr7damMDmKYu5JigWJTN8nB9IruV7?=
 =?us-ascii?Q?dsJbsRhLKPnDDIpICGAhkSTYzkSqaREASJG036tN7EoLRf3lZWu05aUkRMtB?=
 =?us-ascii?Q?eD/Eu9raysRz1cSxSpBID567YhIGI0ab4lGCRdGQSLVKKY0By5Xw+AYJtkOJ?=
 =?us-ascii?Q?zD5XgrIvjMxSwtC7nJOWbdWMnta8XcRWo/mosLMV/H1VtxJFLbV96jek/h6N?=
 =?us-ascii?Q?IY0iajrNwq3F/bxguN+S/2CEGW0dANA7POUrKec1NCnBUpwn3tkE/LDXp4BQ?=
 =?us-ascii?Q?QSBi3uW20+x2YcZ/uPVAOhhv2i9YXFjaKHFj3G7Z4trdmo5EqHsdClBNNeTP?=
 =?us-ascii?Q?OkVz8cHRTOCRcb5OwsPHdprucZG9N8v9+SPH+nkkJUDXOENufFPMblhxq7zv?=
 =?us-ascii?Q?C6ft75RbWS30fLt7YeyTi/35l728Ayfw8CzTmZ/gyfXH1ixjaxBE3XwpstLJ?=
 =?us-ascii?Q?S/fT/vGCRIC7zr/Ui4HfBT5XUEfNQ1uZH8BVbeafzkftGZdrvBeBEGNkYPT/?=
 =?us-ascii?Q?z1dROc+32Fxy+Iek8Szz205Qa7bieCq1axQlW3Ikikhs7FB51oifvlpjDoyR?=
 =?us-ascii?Q?6yMbpQEh7qW37kj2I1BA+QdsfJUE44HwjmscM3bflPp7dBv9LtG1ATEKo63z?=
 =?us-ascii?Q?FIdCE8dn2WLzF3qRYiI8HmTbBEMp35MaL8jfDH4y?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI6PR06MB7535.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac76ddb-6936-4b93-0a88-08dce35d54aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 03:41:57.1638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: soVA/5tN2MVckh2cyOzODQKMGz7iBIftSi+CGRp8qu2eyQLjl3gVhj1iLmcKZ5glwGEdDDhUrmqvrMPVuoqrYB6A14CgzDLoU5v+zAEJIM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7080
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Subject: Re: [PATCH v14 0/3] Add ASPEED AST2600 I2Cv2 controller driver
>=20
> On Wed, Oct 02, 2024 at 03:02:10PM +0800, Ryan Chen wrote:
> > This series add AST2600 i2cv2 new register set driver. The i2cv2
> > driver is new register set that have new clock divider option for more
> > flexiable generation. And also have separate i2c master and slave
> > register set for control, patch #2 is i2c master driver only, patch #3
> > is add i2c slave mode driver.
> >
> > The legacy register layout is mix master/slave register control togethe=
r.
> > The following is add more detail description about new register layout.
> > And new feature set add for register.
> >
> > -Add new clock divider option for more flexible and accurate clock
> > rate generation -Add tCKHighMin timing to guarantee SCL high pulse widt=
h.
> > -Add support dual pool buffer mode, split 32 bytes pool buffer of each
> > device into 2 x 16 bytes for Tx and Rx individually.
> > -Increase DMA buffer size to 4096 bytes and support byte alignment.
> > -Re-define the base address of BUS1 ~ BUS16 and Pool buffer.
> > -Re-define registers for separating master and slave mode control.
> > -Support 4 individual DMA buffers for master Tx and Rx, slave Tx and Rx=
.
> >
> > And following is new register set for package transfer sequence.
> > -New Master operation mode:
> >  S -> Aw -> P
> >  S -> Aw -> TxD -> P
> >  S -> Ar -> RxD -> P
> >  S -> Aw -> RxD -> Sr -> Ar -> TxD -> P -Bus SDA lock auto-release
> > capability for new master DMA command mode.
> > -Bus auto timeout for new master/slave DMA mode.
> >
> > The following is two versus register layout.
> > Old:
> > {I2CD00}: Function Control Register
> > {I2CD04}: Clock and AC Timing Control Register
> > {I2CD08}: Clock and AC Timing Control Register
> > {I2CD0C}: Interrupt Control Register
> > {I2CD10}: Interrupt Status Register
> > {I2CD14}: Command/Status Register
> > {I2CD18}: Slave Device Address Register
> > {I2CD1C}: Pool Buffer Control Register
> > {I2CD20}: Transmit/Receive Byte Buffer Register
> > {I2CD24}: DMA Mode Buffer Address Register
> > {I2CD28}: DMA Transfer Length Register
> > {I2CD2C}: Original DMA Mode Buffer Address Setting
> > {I2CD30}: Original DMA Transfer Length Setting and Final Status
> >
> > New Register mode
> > {I2CC00}: Master/Slave Function Control Register
> > {I2CC04}: Master/Slave Clock and AC Timing Control Register
> > {I2CC08}: Master/Slave Transmit/Receive Byte Buffer Register
> > {I2CC0C}: Master/Slave Pool Buffer Control Register
> > {I2CM10}: Master Interrupt Control Register
> > {I2CM14}: Master Interrupt Status Register
> > {I2CM18}: Master Command/Status Register
> > {I2CM1C}: Master DMA Buffer Length Register
> > {I2CS20}: Slave~ Interrupt Control Register
> > {I2CS24}: Slave~ Interrupt Status Register
> > {I2CS28}: Slave~ Command/Status Register
> > {I2CS2C}: Slave~ DMA Buffer Length Register
> > {I2CM30}: Master DMA Mode Tx Buffer Base Address
> > {I2CM34}: Master DMA Mode Rx Buffer Base Address
> > {I2CS38}: Slave~ DMA Mode Tx Buffer Base Address
> > {I2CS3C}: Slave~ DMA Mode Rx Buffer Base Address
> > {I2CS40}: Slave Device Address Register
> > {I2CM48}: Master DMA Length Status Register
> > {I2CS4C}: Slave  DMA Length Status Register
> > {I2CC50}: Current DMA Operating Address Status
> > {I2CC54}: Current DMA Operating Length  Status
> >
> > aspeed,global-regs:
> > This global register is needed, global register is setting for new
> > clock divide control, and new register set control.
> >
> > ASPEED SOC chip is server product, i2c bus may have fingerprint
> > connect to another board. And also support hotplug.
> > The following is board-specific design example.
> > Board A                                         Board B
> > -------------------------                       -----------------------=
-
> > |i2c bus#1(master/slave)  <=3D=3D=3Dfingerprint =3D=3D=3D> i2c bus#x (m=
aster/slave)|
> > |i2c bus#2(master)-> tmp i2c device |          |
> |
> > |i2c bus#3(master)-> adc i2c device |          |
> |
> > -------------------------                       -----------------------=
-
> >
> > i2c-scl-clk-low-timeout-us:
> > For example I2C controller as slave mode, and suddenly disconnected.
> > Slave state machine will keep waiting for master clock in for rx/tx
> > transmit. So it need timeout setting to enable timeout unlock
> > controller state. And in another side. In Master side also need avoid
> > suddenly slave miss(un-plug), Master will timeout and release the SDA/S=
CL.
> >
> > aspeed,enable-dma:
> > For example The bus#1 have trunk data needed for transfer, it can
> > enable bus dma mode transfer, it can reduce cpu utilized.
> > Others bus bus#2/3 use defautl buffer mode.
>=20
> Is it possible to switch to new terminology wherever it's possible?
> I.e. master --> controller, slave --> target. See, for example, f872d2850=
0bd
> ("i2c: uniphier-f: reword according to newest specification").
>=20
Just for cover latter? Or I should modify for each patches commit message?
Or entire i2c driver statement need switch to target?
> --
> With Best Regards,
> Andy Shevchenko
>=20

