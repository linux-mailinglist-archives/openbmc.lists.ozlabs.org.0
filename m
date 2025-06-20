Return-Path: <openbmc+bounces-275-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14572AE2703
	for <lists+openbmc@lfdr.de>; Sat, 21 Jun 2025 04:08:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bPHl43LSTz30Wg;
	Sat, 21 Jun 2025 12:06:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750407572;
	cv=pass; b=kKP4yEJqEtWtudNVezmF+ZN1jV4Y5zmGjaSTYzOn6JdXvmIXjd1RbshdF55/RViNhTcfZ7y+gA/RYYghHtswzHC7SVCjW8wNy36AMlEOVOmtrOlrdAj9FuDjIGOnM5jJ9Lm+YxAjdxr/052qPS03SueP58MctLNv3axHHtd/b0mDNLYep6FkkvWGThGkLbDOpKH4EooDJUPaXMKp2cC+KBLaMBOz3+K6HmUckPybK8ZZerdWhj0jUCOTEb7bZQu0K/7D1neottcI1PelPlY5kSb9TFQ9FrZzCgeY7xUP1xSLkOd4e5d9qzWsvL2dF3ButbL+qoFQYjJGY1u5AZ4znQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750407572; c=relaxed/relaxed;
	bh=KgAjJGPcGiUK/qRO0SUskcS3ceJh1Z/5PbXugPy9MLY=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PUXe/AkV74+7wibwN6kdjGMoAEdxta/kcg3CMeDShA87lCOdOQSCkA2M2HQwQkINLkTxCjY3rv4R5tzTj7UoGicBIrl8SMoQiukdxpbUsLKcqrj/s+td1ta+DOPOBdVCJFgorKFxEoMshpbLF3GoAkJDBjn8O6WQWVHWyqOm4RwikdbCmWRYL5xEmud1neFf5L4QHbg7OaD7KO8tyEueIixbc3hA4ZEd1/6V+EdzFjCc3QdIo5Qtadc3MnH4lGlxu8lEPrTiiCxvjMjniUrCzyQb7fd9vjRErmkOzMnCmfs7pZidrt85oDCsmtMPp/154xckpnoU9Ko922+DUpNPcA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNr3V5V8Yz2yYJ;
	Fri, 20 Jun 2025 18:18:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsfcxRj78O4S4I/FYWFEIWGjkEjsuZg4ywFkLO+1upKJDtGXIfe+qP5+zBemVA8LdSUhmu84W+9yt512LYM5IXsg1BlxB0JRpsvatbV4L0f0a+gtCxS95p+ig2PtGV9xGx5W/M7/ZMZTaXl8WUDT7g8+BPI8VuT4VQoyh8d3K/YJ8E8ojjAllnStOToM+48VPwOiPAJ+wyFbqy/BG9Wj1UbysQ5X6g8IRlOecIIWS9VrSsX5A2LdeG82cHsmSDcBJoZvsYBK/7rXdjrKjscXucfiUX0NTvSzBoIrTGV+bh/eVNqkvOKJmh9VnrM4cjIyfmwGvwWFkzJRGZRmSYiKqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgAjJGPcGiUK/qRO0SUskcS3ceJh1Z/5PbXugPy9MLY=;
 b=IYKF+FFoGrGqbb7d5MYD2itHShInI31DXKAAFCeeVcQGXJP50G2pOJ7WW0bhJk5uI0QvxemOArzOC3TCIEZIt12JmsyDL/+H9Hs8CcQhkI/3RyHRO+BERuvVG9J/zuU6JiRWvlM1VFe1VxTWzboMejm7vY5QJ7bT1nhSmm8AjeGa37wDeIh7RqaDhidiN4jp2SZFTvD1/CzG/5+eJwfKIOSlhUHIkOtzh8Xud9cpF5TF4tPbZrOUooK94EOdJU2i/hOcLHHcpR8610H1j5d7/G8DWysPUbzWLagSg2+4tNx3UN5+oqWW9/5Lnr2arxs9oVHftz+YUt9egRp9QHLlZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgAjJGPcGiUK/qRO0SUskcS3ceJh1Z/5PbXugPy9MLY=;
 b=mzPiDxzEX+o0bLb0BL6PxZzhDpfpx3H+Z1anl84LYMWfSCFwVPbCdntnRd+Gqr2I+PNP1MaIcBWyttsSuLvSTX0LX1M1Q07C1OTVRK1C2JpSIzikRAz722sDgkvMjGTIBVYG3bkGx4UUoLrBaEvKQXXzJaY6VMVbANis5IF5lceBZfa29adBxl/XRVNTFu2bMmlFWuAl4MKMc0xIy034ATDe6H5AZfANLU7Ahr8KFlBGW9GHEn+wi9OGaFGmmOQb5Ztx1oMidY158uH8Q4Rl1HkMNH2hT5oWdAxgiMW7QCiOopyqpENEdv94t93FdcI3aBG2FLfpkDVrT1iSywrdMw==
Received: from SEYPR06MB7072.apcprd06.prod.outlook.com (2603:1096:101:1db::9)
 by SE3PR06MB8106.apcprd06.prod.outlook.com (2603:1096:101:2e7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Fri, 20 Jun
 2025 08:18:20 +0000
Received: from SEYPR06MB7072.apcprd06.prod.outlook.com
 ([fe80::427f:4d26:e479:7659]) by SEYPR06MB7072.apcprd06.prod.outlook.com
 ([fe80::427f:4d26:e479:7659%4]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 08:18:20 +0000
From: Cool Lee <cool_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, "adrian.hunter@intel.com"
	<adrian.hunter@intel.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: RE: [PATCH 4/8] mmc: sdhci-of-aspeed: Get max clockk by using default
 api
Thread-Topic: [PATCH 4/8] mmc: sdhci-of-aspeed: Get max clockk by using
 default api
Thread-Index: AQHb3/ov45KkSg/hF0GO21HRVpxlyLQKDv+w
Date: Fri, 20 Jun 2025 08:18:19 +0000
Message-ID:
 <SEYPR06MB7072929C8CA435855ACC3A04957CA@SEYPR06MB7072.apcprd06.prod.outlook.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-5-cool_lee@aspeedtech.com>
 <4c380a2936fc5c1f37750f231eb48edc17aefa68.camel@codeconstruct.com.au>
In-Reply-To:
 <4c380a2936fc5c1f37750f231eb48edc17aefa68.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB7072:EE_|SE3PR06MB8106:EE_
x-ms-office365-filtering-correlation-id: bdabbf9a-8b7f-483d-46a8-08ddafd30437
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?1CQGu2MEqYoujlXMmvl8vGY7D+cGdOEi8gwhyYz4AArbcR4wZlCTKQrno3?=
 =?iso-8859-1?Q?m+FJ6uBiVe0FXrI5PT8WGAPZoSKJoCxsp26JyxmPG0JsxceQmGPepBJV9k?=
 =?iso-8859-1?Q?YZsjFmWJ7dHi1JScf3rqlgoHuVU1OdCvHzLxOamipcRg21QgUcIzM63lZf?=
 =?iso-8859-1?Q?qJ4IS7FbwHn9XWJZpNxK9VAm+eOIGD7e/dYWEuDTAFjau+Jp8sEdvyNhLd?=
 =?iso-8859-1?Q?R9lCznhDkzhJhrd4WH6jbu+7qr6BuVU6goCqKpG8saW2367ll+XEAfI5Gd?=
 =?iso-8859-1?Q?EqwTFOW9Fpztn9Z0atWACtdo83rxAXWeOhfMzCG1rUoyjTjNdzopnwa6jc?=
 =?iso-8859-1?Q?wpYvfJU7juehYqAENNvsSavCjECBgIjjURmVfbbbUwJkG7WoQ02uu1kc5a?=
 =?iso-8859-1?Q?V7+q5y8o1HCHU78wYQ6LJy58lK63o0RqlqYOw9jpgL640b4LxjYt4KfNoa?=
 =?iso-8859-1?Q?JroN2OQe7l0yi2iS1+Fsq+Ag09mKwGAq6vdUh1fymESvAabDcGaLuNMzh+?=
 =?iso-8859-1?Q?tjpNVDl1a636bYc+ej9xjcnRGikq1EzcPCe0Qf/erpMRRzXJsr/HP9ASC2?=
 =?iso-8859-1?Q?/zZgB5Rh8fdFzKweVeoeoE1M6IwO5oMwazvnIhGWhV9PMlGPeY6feZ5i9z?=
 =?iso-8859-1?Q?xUq7HWAr2PlYuUxw3HTiszJCpsa4IyEAkPG4tM6XlP0mNLS9/f6ksxwcN7?=
 =?iso-8859-1?Q?PBQ7Vk3CG64nAsL4aYGh0ui+MMMQna9mB5XymH5rAiwfQS6KImG6PSYPGH?=
 =?iso-8859-1?Q?Ej79WyaClyFuD5PIEEuEY7ri9HLkLXRT111RZnyl5WB/HdDir2VXNrRTem?=
 =?iso-8859-1?Q?mz0HrhjibDYS4V5WdGpGD8hP+jtV4HZR8/It/n7kkD0ulqcASANQtesyFD?=
 =?iso-8859-1?Q?LaC4gATsxvKBokHwsJxCay/ZOBzBiMsdTRbtdDPDYyZGr0vrtZNtBrUDXk?=
 =?iso-8859-1?Q?woQChfpSyXZvQWjNW0J+9u3DBmHKDTMfVIiLwbeceC2MFq5w1R4ZjgnohE?=
 =?iso-8859-1?Q?I4JldK+TdrIp4yhTN1Wg0/qRo8Lg+KGRveHGOCaxCfRcDQXsuUzyd+ZDMe?=
 =?iso-8859-1?Q?LXY3BUevuQ1KDttIgr9fNvfE2K+n8rnT9OCCAHefJgthAc7yk7w2YDoK8F?=
 =?iso-8859-1?Q?G0soozf4VDkF4qmFueEAOrHZFps7RcCVhqwHWhpkzlCEkQ9QSg76sUI0uN?=
 =?iso-8859-1?Q?RO/F/vZWHVD6ufceeDNfnfG7cIPrfuvRTOPEexGRcQnoHuDF5vjnv/C9T3?=
 =?iso-8859-1?Q?ZSmjWqPjLCc+YrkC4M69KGYmoJ/Ad+rzWfE9vT/9n9f9IrkVfydqow+ujE?=
 =?iso-8859-1?Q?au5hb82qj5ihiwj3qb+r/omUu4F3OGeCqYacdCPqRQ5VhYsOfGCxcr5W21?=
 =?iso-8859-1?Q?TnkztGTKdLW0obpiAYmCFU3d+tyLGPrJuoYtReAfMP4KTYzcGMPAnN+pXx?=
 =?iso-8859-1?Q?qywQrORwRUR5q4CHPoaYc23coiTik69MPCw6KOIaUDF6OUQGHx6Wgo0rjz?=
 =?iso-8859-1?Q?BQEg52/1Xm9DwD+W3Dev2x4mKd84UKgRQ9be7Z6lR+C/EteYgWRJOCbwkg?=
 =?iso-8859-1?Q?aJ6iXmhhxka8ugIfxLpHUejFGmgy?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB7072.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?i6t6EFCr6OtTmiXuVm2dapBEMHh/FBAEFRXj6+JgsT7wQ+QXX/vUQE4FpO?=
 =?iso-8859-1?Q?KOtpx8Ya5Z/QT8eSoAp2Qg36sKJOrEZKWBTdK4+1PvDW1y8fyewAeumNDA?=
 =?iso-8859-1?Q?eHDD9S5MS439BLEdWApzWhGhWfn4NeBGXRP1ldyydWkwWtARe+uy3aBERO?=
 =?iso-8859-1?Q?I9JeG50E+wshrY85kywizGv3B4iHjZCeJVVeKf3A+hJt3T7SZYSzSyUrFA?=
 =?iso-8859-1?Q?8/Gv7p2O/H+VOZb2DW8As43bF3REi1Xb9F5EAEAEvwbg5l58zwKAu3GH13?=
 =?iso-8859-1?Q?V5sTU+EzmxW/dsYZHCIPv35aUFQA2oeAx+ZX65O8Bz1W98Gkr8OucYkE2E?=
 =?iso-8859-1?Q?iQb17f6npUn4d5loRsEMMtv7b4PJn2D2//cTso3x9RBIAoX4nb+uWngRWW?=
 =?iso-8859-1?Q?mffIefkbUEa9SN3Cvr3SQVZbjrfkg22LixDawkOibLCrmW6angkR4g1ryu?=
 =?iso-8859-1?Q?aLKt7P1A/hM/WZ3DYDtFfgRT3+MTPZqO53F8ksRCJvxwvzvpmiNs0dQU7P?=
 =?iso-8859-1?Q?cms+Stj93U/CPMRrkighjLoRq0+pJwHDki11vhmwF2mSIkpDQrB3DdWEp0?=
 =?iso-8859-1?Q?EDqi4Cuqxp14c023QvNlEX/osFdQ6giZvHn2Vti1m5NvgGlBcFG9Yc2xrz?=
 =?iso-8859-1?Q?bHZDA1sVmF/6X9gAtPQzdXbvJ/P6FFv5I1Rk4eFq6Nf1Sg6vdO91V3EFku?=
 =?iso-8859-1?Q?3a87iNXoNX4swrEGw7eMiDU7mVQmmTonWwEirbvzM+4asPt15MkhK1GgtB?=
 =?iso-8859-1?Q?xgJk06UP9eDfQsigpsUDNSWq+G4AkilhSWmbr4ozgFwI5ZXCwhRdEJNxO+?=
 =?iso-8859-1?Q?vhJ4l1IRsQdZth0lScmZiee39JDqb6oO8+Re0c//aFS1vT59cWkRq/i3UU?=
 =?iso-8859-1?Q?jBQWJhtbJJ42R29kul65E61PjBiWuylelL8nl9f3HURlUNrQWp/lPiICgb?=
 =?iso-8859-1?Q?RTTcz3EOBw8J+OYT73/8QHu2ByftxR7fjhdXLA5nIPNKa4FOVMHN3yCn9H?=
 =?iso-8859-1?Q?Fa4XVoDLdfDlX4n9zeQB2awPZe6+g+QIC+/jxw5FF+PkT2McMHWGY/oZc8?=
 =?iso-8859-1?Q?ouqdBai2pR1ceSNcwJ2toKzs9Ji3Pi1YkH6eAH8sQRi9/ne2oJWxaDtPkW?=
 =?iso-8859-1?Q?NwQdqI+VM3DuMuzth46zsHaFkDC2jXRIbzuGrQJsou1KoseYo4IKnrcwbw?=
 =?iso-8859-1?Q?awAec/gQRP0RVX8wmar4iGc4821RkPHcTLhlKvaivAxOKsZSRfPSS3lJ6i?=
 =?iso-8859-1?Q?+NfwSsaxnJQuACiCO+e9HfPEahk7fogGPoZQNtsrtX9UUQ2ZRDtzSp3hcZ?=
 =?iso-8859-1?Q?5ifuv/cswW7fXTzH4EaVdfL5I8U3Txomo7ObucNBg5ERL/MdZ8JMMyX5Qy?=
 =?iso-8859-1?Q?Cr59+JY7C5p8Ua3u1pPDBkI2D2ssZzP8bn2RHS8Aw4q+h7SQSqenLEpGxx?=
 =?iso-8859-1?Q?+8dJgVsb0ocfjG3UOXMinwkdhL1zOnF0LfianOWrs+c7D9Oe0TDA4pMZ20?=
 =?iso-8859-1?Q?caX8nBe8cjAaZZOn8VP2VXgzazHn9LR3Sz4wtuf17AWgvMq8sNrkDp1f+r?=
 =?iso-8859-1?Q?6HMxLymEljMK1EEeG+FNNLNjXL+1c9L9xCZznm8IwzYbEkEeaXDQapziJ9?=
 =?iso-8859-1?Q?6aXPCjjTxXrWkUwptok7NOTrE8itBR3+bX?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB7072.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdabbf9a-8b7f-483d-46a8-08ddafd30437
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 08:18:19.9713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xeChORrD0t3I9RKpytOxn47InKN/4pIPnZY9RiW3x7RW3H2lJjUFOtSRNS6YgEpq1qB60Pc3OWDgDbGVkJDWqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8106
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


> > Don't limit clock frequency by f_max.
> >
> > Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
> > ---
> > =A0drivers/mmc/host/sdhci-of-aspeed.c | 10 +---------
> > =A01 file changed, 1 insertion(+), 9 deletions(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-aspeed.c
> > b/drivers/mmc/host/sdhci-of-aspeed.c
> > index 10160a706334..2bdd93a3f91f 100644
> > --- a/drivers/mmc/host/sdhci-of-aspeed.c
> > +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> > @@ -288,14 +288,6 @@ static void aspeed_sdhci_set_clock(struct
> > sdhci_host *host, unsigned int clock)
> > =A0=A0=A0=A0=A0=A0=A0=A0sdhci_enable_clk(host, clk);
> > =A0}
> >
> > -static unsigned int aspeed_sdhci_get_max_clock(struct sdhci_host
> > *host) -{
> > -=A0=A0=A0=A0=A0=A0=A0if (host->mmc->f_max)
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return host->mmc->f_max;
> > -
> > -=A0=A0=A0=A0=A0=A0=A0return sdhci_pltfm_clk_get_max_clock(host);
> > -}
> > -
> > =A0static void aspeed_sdhci_set_bus_width(struct sdhci_host *host, int
> > width)
> > =A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0struct sdhci_pltfm_host *pltfm_priv; @@ -446,7 =
+438,7 @@
> > static int aspeed_sdhci_execute_tuning(struct sdhci_host *host, u32
> > opcode)
> > =A0static const struct sdhci_ops aspeed_sdhci_ops =3D {
> > =A0=A0=A0=A0=A0=A0=A0=A0.read_l =3D aspeed_sdhci_readl,
> > =A0=A0=A0=A0=A0=A0=A0=A0.set_clock =3D aspeed_sdhci_set_clock,
> > -=A0=A0=A0=A0=A0=A0=A0.get_max_clock =3D aspeed_sdhci_get_max_clock,
> > +=A0=A0=A0=A0=A0=A0=A0.get_max_clock =3D sdhci_pltfm_clk_get_max_clock,
>=20
> This was used to limit the maximum bus speed via the devicetree. See:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?h=3D
> v6.16-rc2&id=3D0a0e8d7501cda79c9b20f6011814e2ec9b473ade
>=20
> Why remove it? There's no discussion of the motivation in the commit
> message.
Yes, you're right. There is no need to change this. I will remove this.
My original thinking is changing to use default sdhci_set_clock and sdhci_g=
et_max_clock that we can simplify the code.
But the aspeed_sdhci_set_clock handles different divider by legacy projects=
, so I keep that but just missed the get_max_clock.

>=20
> Andrew

