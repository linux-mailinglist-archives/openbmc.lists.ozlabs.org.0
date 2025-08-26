Return-Path: <openbmc+bounces-511-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D877BB35162
	for <lists+openbmc@lfdr.de>; Tue, 26 Aug 2025 04:09:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9rhM57MLz3d2Y;
	Tue, 26 Aug 2025 12:09:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756174179;
	cv=pass; b=DkmKZwivlUIxLGpP9me8b5a96YZOKNTxPjheNTUPXe5XiDwfhv4wYqoDglu8ulpjJ3fRnNG1lhv/EOQZRXfBww9A5q6FhFkjRrbDzqhAZqafWMZ53Tkh/DwMCQG8kRuHqOj+kOBSJ4dzlWxAYtjOiXL2FEY7RlUNdgII5Raydvp+UfMEG52bFJLyLmGzhuAksz8Idc0GaobqolLvypKUin5H7FZnr44t8vPS7fbuMUEM6yzUPG3pzvYZIkZPXLQKFaBInqTAaJ2WXRIwLkzAOXCTBOAeeYQL5bZlASpGWr36qdHZf9xcU4egfYY64alfPe2p9ecqiGVKTssVapgMBA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756174179; c=relaxed/relaxed;
	bh=0H9N4ayrSwyVALwlc7F6GS9NKwU3mgmAnRD7g+0RwkI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dr9OpH+HaS0wk+3ZIE9AxKeD67/ybIsShLksNn36JXknmyBO8g/IfCTos6NBW9n6TNmhyHcahd2gXHs2iX7ryqSwFxyy6y43jmSt433rb4AJUK7IF3eANXZeqR19O1TSgrtD77jO9rEdYLJHFbJDOO3Ep8lBSSS+HQwrep6CCPXJsSrzabLLajrY2IfiZICcmEcn4r60t8tCiGWPJklfMkRhr0m7dSVgx2UQb8tdq6drS1no7cJKsJEejUaN9a8o5dgq0Hf03YwrvCafjzP3cFrUq02xF3riiR/53QO+LFJnbITQ4HTOjtYhSf7wjVQuRZ7aERz9wuCw1YrhM7/i6g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=GipFHyEQ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=GipFHyEQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9rhL5bh0z3d28;
	Tue, 26 Aug 2025 12:09:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVC8aZ8l6I4jt03eOzr7OaduzS/LBdZxZQaX2WCjLhqHMeXVkD1UUN487IXwFguUIL6UD3EXX/84+/hselEw6tDjLG0j7lqqFo+QxNrXzyWQ59y9Dr+xKJV502aVc58nVSuiBFrD6bEwwzvUzS+5mzXFRpySRXbkx05hSQG9aA+nnnxjXHJRdt4qDP5NRTsdup62I+lRCBgt45uB+9sG/e8DyAucwGXV6aV31+pq4Y2p4fnRHPZ31bvsp6MTvFPtlkb2RxsotpphRzyZIxQL9J7v+1g632ogyuCyisYd0lQ938rWK45Ez8kcpwz8FGGZnorMq2RNX1YTCY5PyWrwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0H9N4ayrSwyVALwlc7F6GS9NKwU3mgmAnRD7g+0RwkI=;
 b=ifcVKg3x++UhnEQq8vWT2M9h+u3MMLYznNQe+bJ9NAu8UByn8nxxGLT5kE6qCzjLfHiguTMbWY9ENjg2pcazPj3W8NlHZPkvKCAQskHDrfx/55oLw2SYeo1th2A83DbYjG8SacJ4k6OBlwAENTusEHpy8pyO1s9I5HkEhIn9ljoYlBUjFvnn9jgnXtIiAKo9IOxSuR6Z6DiiJkRzOnXidjsmj7J6iyXteM8WcaYVWIhYbYgmNK36gpjvO+ytyUocFng6aW4GCNEFN8aMr8KBPrPqutfxzzz9tAsPO1j61FJ72fcp3dttYpCi61n/bX4SG+7D0biS+XkhENzPRr4TVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0H9N4ayrSwyVALwlc7F6GS9NKwU3mgmAnRD7g+0RwkI=;
 b=GipFHyEQ3BOSgmluhG7ooGezzge9HqCe8C03sfpfX9zcrfQmC4v45UXtlAw8aFgAmiRL5GPYO/5Oiu20dbkBJUQ1Wi39D8vffORVDxNI6EPXbcipGUr5MntiQpE0MUsUDLq2SrKOaJWNcDIAAZMYt2Ti7WyG6Mwo4GgO1nsRyu+CfJaW0LtU2kwD7dU+xDm4NRyE7UNgSlg5J9JJJsgw+oowKIGTI4pZ5qP28biuyPez/7zoCOojbJ/AebFV4XG8Nk7VgzFEQMT4PTgGCcopozSBneLwIrb7DFWtdmK1lwauBbJa9WjuFlfcD9TX+zjRdsyuYeo62zJPCk60cKmI8w==
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6)
 by JH0PR06MB6723.apcprd06.prod.outlook.com (2603:1096:990:36::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 02:09:14 +0000
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b]) by TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 02:09:14 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, "eajames@linux.ibm.com"
	<eajames@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v7 1/1] media: aspeed: Allow to capture from SoC display
 (GFX)
Thread-Topic: [PATCH v7 1/1] media: aspeed: Allow to capture from SoC display
 (GFX)
Thread-Index: AQHcFctDFRkh7k9QYEicVqDZ4nX1ObR0KVSw
Date: Tue, 26 Aug 2025 02:09:14 +0000
Message-ID:
 <TYZPR06MB65683585B910B097B3C255ADF139A@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20250603064500.94048-1-jammy_huang@aspeedtech.com>
 <20250603064500.94048-2-jammy_huang@aspeedtech.com>
 <495e8ffa-c826-45ff-a3fa-ec6e406f6b2c@kernel.org>
In-Reply-To: <495e8ffa-c826-45ff-a3fa-ec6e406f6b2c@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6568:EE_|JH0PR06MB6723:EE_
x-ms-office365-filtering-correlation-id: 8a3eb076-e84b-4d1c-8211-08dde4458e38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?jeXVcxPPH9x61l1juOwC/4dpHYI9ZbLFHsFO+vFPfYK4bQeyzPDkZgIqdBKO?=
 =?us-ascii?Q?QJrayog+dSc5zTzYV4vKJRZyy+SLx866Sqa107G9C8Ej1LyIjTKffJVtvb/2?=
 =?us-ascii?Q?6sMAFQbqw5OQddDEaUw+eEJmlG65jlAanVtP6DE08uF27iRRpFiA98ZKT8J8?=
 =?us-ascii?Q?HRbRd/37QZ4lbRIfmcz5FpXTTstQbI0vEvN/PCrQdWMA63tbp7DszOB3gY86?=
 =?us-ascii?Q?LK1vr1BMbhbYwFW8WfA82uuaj6KWrl55kix+N/CZTFGDUi58MVuuNBcAGb42?=
 =?us-ascii?Q?qugLRDY5l9x1LuJdhhbNC+l5UUTvXHmfo53CUDEGenpfvYRzmjrVnKL1tf7C?=
 =?us-ascii?Q?c7hWLmThexQQw2wusotZz1r2Ys/hQ7/CcIpFYdsnuBa14prv8lBNtUFgd0pr?=
 =?us-ascii?Q?yav8VVVUs2g1U6t2ie4vP4qYMRLALgto2z77ksZ/B9U4eUdOdmi11QUQ7HF1?=
 =?us-ascii?Q?Xd/JH98THCdBmFhYCDSa7tj5kYdptHgUijx3fiUB3GkxyTVHT0G9TxHc7jVj?=
 =?us-ascii?Q?+SmAjv8pyUFBWU6SGyeJDp5WYhvPzI2rgN1OTXK+9KK6AEHSxvFkJ2zZ/jjo?=
 =?us-ascii?Q?8Cz23RVwhmMYyyUnEd2UrHij01J6zejeNiVpn8pl59V82Q6k/KB05vEL3ddn?=
 =?us-ascii?Q?Q9dPv5+72yig2zmAI13qPCboldARHx07s0Flk8WPP3CKjDtZY+gOHfceKNF8?=
 =?us-ascii?Q?5HKrSRZuwC4iGLBvjrcthh6XvGqytWAGPghs3uEVj1avZUTLqd01/96e+NTv?=
 =?us-ascii?Q?OVDPNwNbXJA+gQDF/WHPXIuGIvDv5cxt6DYPeYaHqWUrFI+ZLnHM9xl5HlB+?=
 =?us-ascii?Q?bxWow+RxK/bOjr9pg4kwHB8iWVZLEDZRuew97v557GDcH5DJolNK8sI6buCG?=
 =?us-ascii?Q?7bkR6MxuO6/PWzcYSVmkXtyKz5ZxkI/BMtPgjau/eWA2oQgfOqgyTFux8Lib?=
 =?us-ascii?Q?2TkcjqfiVOIFts0QbVEI3XxVCHNIudjuEhj1v5/4ljtmr2WdVwfEGnDO41ZJ?=
 =?us-ascii?Q?BoSYWJc23fNW73Q0zNA87yKIi4hY1UDWFmQwKonctfVqN+6wY/lXZs/C5HGM?=
 =?us-ascii?Q?VQlUFfd979pXAOVNz6fEvGGgumcpZGBtCjpVGcrewEvYoZFbXCkf3Bhfbo0T?=
 =?us-ascii?Q?kiS9uPdObZ/3iOtVLuA/xcKeiMtJeWCZYxc0g38e+rhB+M4vZvJ1aPvOKokA?=
 =?us-ascii?Q?Y4pbNkk0Iwiezf7EY2Er/EhloqMtYOUbKq4IBGu0B+XzyTCo4t4KsAdPp/hz?=
 =?us-ascii?Q?cfknpFjRllEw5oWcIlumqltoHx6KBRh7no37Or7ZxGK5LHToPMtQhpmtuUle?=
 =?us-ascii?Q?b8jINmHU8DQhpEXhbCfeOJONPSGGF4ENn9DgxxbYWlZMsealuGiDc1IMtqhD?=
 =?us-ascii?Q?BpbJ6c1NCAblnG891TOvJ7/9V/o5Er6odpgFSXSZCIa4ljuMztMS9vHP26Oi?=
 =?us-ascii?Q?srVsvtN2t+InTfMkfIekgEWg0MZTp22moMCr7QHRbdmTNlSpfxyWnranU7Vv?=
 =?us-ascii?Q?VLpWz44ee3w8wx1cw2kRM499+WAuTBu9efYm?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6568.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Vh9H3uZ85h/lWAOC9g+B9BGNuf4ySMQmUh0j90/4lO7m8d3RimaRJ1AG7oA+?=
 =?us-ascii?Q?UpCJJ/zSmsWzip9xifoGACZAqx4QRxVCCM+jyRMFujPlWPcoeUpxAyS76yoX?=
 =?us-ascii?Q?dD8tcUKJRmG22VG5tm7ulaVKkPF3ll9MUsVE9RCQ+pRq3+nSyW4TEYhffC9L?=
 =?us-ascii?Q?dA0jChf6I5hD9gY9zgYf1FkovHPPiY0ipfmpb1zB1rOyFbfqkETx4bsbQ+k0?=
 =?us-ascii?Q?HjgnVLqrpa6ojhaPf9uRgPaE0eSUOJpWtvESbDedyQ+fGt1MjJhhNsffgX7X?=
 =?us-ascii?Q?GVl2VQStSUA0WJZGqQVQKdjRMFB9mZ5J4llNlmD1rzk8/ULRvJrU2DPYDzIZ?=
 =?us-ascii?Q?/qz7wpyX6YLiXCk3LJ5+fHl5S1mZBBPgRjg+Pxh13yy/CoqPoRY+2hA59VfQ?=
 =?us-ascii?Q?lZQF/xDw9Y6xmgXb8d9Srm3YGhdjDOFjrIXL/jFA2QrkKzBd6SHQ8Yzk65Zz?=
 =?us-ascii?Q?MFxgOESM0oGrB4zyI0/2/eG/BtaRu3LyN5yWeciKR99jZjSS4Hra3S5Wo+Vv?=
 =?us-ascii?Q?tdo1xkJn4vATwUrHkzTreBTc8CqGoFmI58EtO30CvvkJP2Wt3U4ny4rLbZMv?=
 =?us-ascii?Q?sxUuLX32qCgErSAhWm0TeKMPGyN/XFC98I4IrPxIe69T25fOtfIpRA8y6yXW?=
 =?us-ascii?Q?YdAk4Dm5sBAhhnLnt7GjLV3xU+/HFLPkWBd26ZLL0lTKNP70oFJccceZ08bM?=
 =?us-ascii?Q?v0xeB3QvKtQnzdkd71lp28PwEXa1pqqrcP4DdpFkQ+LTNFuV8pQIH9lsqBmq?=
 =?us-ascii?Q?7uWOhMDRJpPfntyXvggyNuHFCZzmCKpLkVPO9i/ZO9vvGp5+B67Ob1kiBEFM?=
 =?us-ascii?Q?8OTOrQYIdkHvs5VNaxrmsg13zucVn3+9jCEv4hwJHDUIlaamkPnkCX3cZHJ+?=
 =?us-ascii?Q?YfaFvesVbCVuyjaydSMckiZdNMrAyP2ytEPdM1Xew+hItMc+Aeq6uoNB/eZl?=
 =?us-ascii?Q?gd3FUmvhKoyYG3JUZo5dxX67S0BRfwoUr9Khn7CJOG/LmfIbGQGvd8KA6mDS?=
 =?us-ascii?Q?hmCQJN0XBtgyDdS/spyWFItABDtqFm/ltaQzt7M5qa4XlAbUsLv8kKRT0p6x?=
 =?us-ascii?Q?/bt0JTid1c0l8ZVqJFUNlA3qRY/KuiNAyRo3vU5I8lhMyWyOn7aeeTib1S5A?=
 =?us-ascii?Q?X80vGvYqMOWCocK1ivzDedriGpqb0+6Yf6F7lqDszbkuwt6b/B4EcsjqIbB0?=
 =?us-ascii?Q?d/2qBVbBY5IuPtRHNPmAG8sWVCcQ1iyul9EIWx8JC67X2lCxXY60qsBTNq2D?=
 =?us-ascii?Q?5Z292VuvMJn7x5EnObbl19IYV+34pSncslNse6A29knun7ahNNPxHpSq/3PB?=
 =?us-ascii?Q?GJwORdIe91JBzt/47CemimYUdvS/BpKLCZ+qXYU94pK+uSkZb12DKdxlZ/Mx?=
 =?us-ascii?Q?MTJnHR8bXwoLhrFsE+/BBoyGEu+VKYT7SJaCgYOGkN+i4lvxNFjKsFE6U1Vy?=
 =?us-ascii?Q?bideIu8dd+omEx3/E36QY10WhPDoIVpupXnzgwOKN+ww/6m7CDLy608xCyjU?=
 =?us-ascii?Q?cBq7RyxbYQK+ILuNeB8E0EvCxYCNAR2dt87g/wAqQ+gdwG8HRmZc5rE/YZtk?=
 =?us-ascii?Q?7FzXbK13B7tbWZ0041W4IfEqCT0la0uFvf175JrFLkeoK1XNffyoHqN0cqjm?=
 =?us-ascii?Q?DQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
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
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6568.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3eb076-e84b-4d1c-8211-08dde4458e38
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 02:09:14.5896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YE5X8DTckEf1bKIZJvzKUjLmDYPYA6f88rj462SGl8iGct6WjjIpY+RGhJ1apLKRbBVKTjIxABIaMGeOb7vTsMtGlrhqOSXR15X91wHtu3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6723
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Hans,

Thanks for your help. We will have a new patch per your review.

Regards
>=20
> Hi Jammy,
>=20
> Apologies for the long delay. It looks good, except for a few missing che=
cks
> when changing inputs, see below.
>=20
> On 03/06/2025 08:45, Jammy Huang wrote:
> > ASPEED BMC IC has 2 different display engines. Please find AST2600's
> > datasheet to get detailed information.
> >
> > 1. VGA on PCIe
> > 2. SoC Display (GFX)
> >
> > By default, video engine (VE) will capture video from VGA. This patch
> > adds an option to capture video from GFX with standard ioctl,
> > vidioc_s_input.
> >
> > An enum, aspeed_video_input, is added for this purpose.
> > enum aspeed_video_input {
> > 	VIDEO_INPUT_VGA =3D 0,
> > 	VIDEO_INPUT_GFX,
> > 	VIDEO_INPUT_MAX
> > };
> >
> > To test this feature, you will need to enable GFX first. Please refer
> > to ASPEED's SDK_User_Guide, 6.3.x Soc Display driver, for more informat=
ion.
> > In your application, you will need to use v4l2 ioctl, VIDIOC_S_INPUT,
> > as below to select before start streaming.
> >
> > int rc;
> > struct v4l2_input input;
> >
> > input.index =3D VIDEO_INPUT_GFX;
> > rc =3D ioctl(fd, VIDIOC_S_INPUT, &input); if (rc < 0) {
> > 	...
> > }
> >
> > Link: https://github.com/AspeedTech-BMC/openbmc/releases


> > Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> > ---
> >  drivers/media/platform/aspeed/aspeed-video.c | 189
> ++++++++++++++++---
> >  include/uapi/linux/aspeed-video.h            |   7 +
> >  2 files changed, 168 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/media/platform/aspeed/aspeed-video.c
> > b/drivers/media/platform/aspeed/aspeed-video.c
> > index 54cae0da9aca..97392ceed083 100644
> > --- a/drivers/media/platform/aspeed/aspeed-video.c
> > +++ b/drivers/media/platform/aspeed/aspeed-video.c
> > @@ -4,6 +4,7 @@
> >
> >  #include <linux/atomic.h>
> >  #include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> >  #include <linux/clk.h>
> >  #include <linux/delay.h>
> >  #include <linux/device.h>
> > @@ -25,6 +26,8 @@
> >  #include <linux/workqueue.h>
> >  #include <linux/debugfs.h>
> >  #include <linux/ktime.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/syscon.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-dev.h>
> >  #include <media/v4l2-device.h>
> > @@ -203,6 +206,25 @@
> >  #define VE_MEM_RESTRICT_START		0x310
> >  #define VE_MEM_RESTRICT_END		0x314
> >
> > +/* SCU's registers */
> > +#define SCU_MISC_CTRL			0xC0
> > +#define  SCU_DPLL_SOURCE		BIT(20)
> > +
> > +/* GFX's registers */
> > +#define GFX_CTRL			0x60
> > +#define  GFX_CTRL_ENABLE		BIT(0)
> > +#define  GFX_CTRL_FMT			GENMASK(9, 7)
> > +
> > +#define GFX_H_DISPLAY			0x70
> > +#define  GFX_H_DISPLAY_DE		GENMASK(28, 16)
> > +#define  GFX_H_DISPLAY_TOTAL		GENMASK(12, 0)
> > +
> > +#define GFX_V_DISPLAY			0x78
> > +#define  GFX_V_DISPLAY_DE		GENMASK(27, 16)
> > +#define  GFX_V_DISPLAY_TOTAL		GENMASK(11, 0)
> > +
> > +#define GFX_DISPLAY_ADDR		0x80
> > +
> >  /*
> >   * VIDEO_MODE_DETECT_DONE:	a flag raised if signal lock
> >   * VIDEO_RES_CHANGE:		a flag raised if res_change work on-going
> > @@ -262,6 +284,7 @@ struct aspeed_video_perf {
> >  /*
> >   * struct aspeed_video - driver data
> >   *
> > + * version:		holds the version of aspeed SoC
> >   * res_work:		holds the delayed_work for res-detection if unlock
> >   * buffers:		holds the list of buffer queued from user
> >   * flags:		holds the state of video
> > @@ -273,6 +296,7 @@ struct aspeed_video_perf {
> >   * yuv420:		a flag raised if JPEG subsampling is 420
> >   * format:		holds the video format
> >   * hq_mode:		a flag raised if HQ is enabled. Only for
> VIDEO_FMT_ASPEED
> > + * input:		holds the video input
> >   * frame_rate:		holds the frame_rate
> >   * jpeg_quality:	holds jpeq's quality (0~11)
> >   * jpeg_hq_quality:	holds hq's quality (1~12) only if hq_mode enabled
> > @@ -298,6 +322,9 @@ struct aspeed_video {
> >  	struct video_device vdev;
> >  	struct mutex video_lock;	/* v4l2 and videobuf2 lock */
> >
> > +	struct regmap *scu;
> > +	struct regmap *gfx;
> > +	u32 version;
> >  	u32 jpeg_mode;
> >  	u32 comp_size_read;
> >
> > @@ -316,6 +343,7 @@ struct aspeed_video {
> >  	bool yuv420;
> >  	enum aspeed_video_format format;
> >  	bool hq_mode;
> > +	enum aspeed_video_input input;
> >  	unsigned int frame_rate;
> >  	unsigned int jpeg_quality;
> >  	unsigned int jpeg_hq_quality;
> > @@ -331,21 +359,25 @@ struct aspeed_video {  #define
> > to_aspeed_video(x) container_of((x), struct aspeed_video, v4l2_dev)
> >
> >  struct aspeed_video_config {
> > +	u32 version;
> >  	u32 jpeg_mode;
> >  	u32 comp_size_read;
> >  };
> >
> >  static const struct aspeed_video_config ast2400_config =3D {
> > +	.version =3D 4,
> >  	.jpeg_mode =3D AST2400_VE_SEQ_CTRL_JPEG_MODE,
> >  	.comp_size_read =3D AST2400_VE_COMP_SIZE_READ_BACK,  };
> >
> >  static const struct aspeed_video_config ast2500_config =3D {
> > +	.version =3D 5,
> >  	.jpeg_mode =3D AST2500_VE_SEQ_CTRL_JPEG_MODE,
> >  	.comp_size_read =3D AST2400_VE_COMP_SIZE_READ_BACK,  };
> >
> >  static const struct aspeed_video_config ast2600_config =3D {
> > +	.version =3D 6,
> >  	.jpeg_mode =3D AST2500_VE_SEQ_CTRL_JPEG_MODE,
> >  	.comp_size_read =3D AST2600_VE_COMP_SIZE_READ_BACK,  }; @@
> -485,6
> > +517,7 @@ static const struct v4l2_dv_timings_cap
> > aspeed_video_timings_cap =3D {
> >
> >  static const char * const format_str[] =3D {"Standard JPEG",
> >  	"Aspeed JPEG"};
> > +static const char * const input_str[] =3D {"HOST VGA", "BMC GFX"};
> >
> >  static unsigned int debug;
> >
> > @@ -609,6 +642,14 @@ static int aspeed_video_start_frame(struct
> aspeed_video *video)
> >  		aspeed_video_free_buf(video, &video->bcd);
> >  	}
> >
> > +	if (video->input =3D=3D VIDEO_INPUT_GFX) {
> > +		u32 val;
> > +
> > +		// update input buffer address as gfx's
> > +		regmap_read(video->gfx, GFX_DISPLAY_ADDR, &val);
> > +		aspeed_video_write(video, VE_TGS_0, val);
> > +	}
> > +
> >  	spin_lock_irqsave(&video->lock, flags);
> >  	buf =3D list_first_entry_or_null(&video->buffers,
> >  				       struct aspeed_video_buffer, link); @@ -1026,9
> +1067,23 @@
> > static void aspeed_video_get_timings(struct aspeed_video *v,
> >  	}
> >  }
> >
> > +static void aspeed_video_get_resolution_gfx(struct aspeed_video *video=
,
> > +					    struct v4l2_bt_timings *det) {
> > +	u32 h_val, v_val;
> > +
> > +	regmap_read(video->gfx, GFX_H_DISPLAY, &h_val);
> > +	regmap_read(video->gfx, GFX_V_DISPLAY, &v_val);
> > +
> > +	det->width =3D FIELD_GET(GFX_H_DISPLAY_DE, h_val) + 1;
> > +	det->height =3D FIELD_GET(GFX_V_DISPLAY_DE, v_val) + 1;
> > +	video->v4l2_input_status =3D 0;
> > +}
> > +
> >  #define res_check(v) test_and_clear_bit(VIDEO_MODE_DETECT_DONE,
> > &(v)->flags)
> >
> > -static void aspeed_video_get_resolution(struct aspeed_video *video)
> > +static void aspeed_video_get_resolution_vga(struct aspeed_video *video=
,
> > +					    struct v4l2_bt_timings *det)
> >  {
> >  	bool invalid_resolution =3D true;
> >  	int rc;
> > @@ -1036,7 +1091,6 @@ static void aspeed_video_get_resolution(struct
> aspeed_video *video)
> >  	u32 mds;
> >  	u32 src_lr_edge;
> >  	u32 src_tb_edge;
> > -	struct v4l2_bt_timings *det =3D &video->detected_timings;
> >
> >  	det->width =3D MIN_WIDTH;
> >  	det->height =3D MIN_HEIGHT;
> > @@ -1113,14 +1167,20 @@ static void aspeed_video_get_resolution(struct
> > aspeed_video *video)
> >
> >  	aspeed_video_get_timings(video, det);
> >
> > -	/*
> > -	 * Enable mode-detect watchdog, resolution-change watchdog and
> > -	 * automatic compression after frame capture.
> > -	 */
> > +	/* Enable mode-detect watchdog, resolution-change watchdog */
> >  	aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
> >  			    VE_INTERRUPT_MODE_DETECT_WD);
> > -	aspeed_video_update(video, VE_SEQ_CTRL, 0,
> > -			    VE_SEQ_CTRL_AUTO_COMP |
> VE_SEQ_CTRL_EN_WATCHDOG);
> > +	aspeed_video_update(video, VE_SEQ_CTRL, 0,
> VE_SEQ_CTRL_EN_WATCHDOG);
> > +}
> > +
> > +static void aspeed_video_get_resolution(struct aspeed_video *video) {
> > +	struct v4l2_bt_timings *det =3D &video->detected_timings;
> > +
> > +	if (video->input =3D=3D VIDEO_INPUT_GFX)
> > +		aspeed_video_get_resolution_gfx(video, det);
> > +	else
> > +		aspeed_video_get_resolution_vga(video, det);
> >
> >  	v4l2_dbg(1, debug, &video->v4l2_dev, "Got resolution: %dx%d\n",
> >  		 det->width, det->height);
> > @@ -1156,7 +1216,7 @@ static void aspeed_video_set_resolution(struct
> aspeed_video *video)
> >  	aspeed_video_write(video, VE_SRC_SCANLINE_OFFSET, act->width * 4);
> >
> >  	/* Don't use direct mode below 1024 x 768 (irqs don't fire) */
> > -	if (size < DIRECT_FETCH_THRESHOLD) {
> > +	if (video->input =3D=3D VIDEO_INPUT_VGA && size <
> > +DIRECT_FETCH_THRESHOLD) {
> >  		v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Sync Mode\n");
> >  		aspeed_video_write(video, VE_TGS_0,
> >  				   FIELD_PREP(VE_TGS_FIRST,
> > @@ -1171,10 +1231,20 @@ static void aspeed_video_set_resolution(struct
> aspeed_video *video)
> >  				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
> >  				    VE_CTRL_INT_DE);
> >  	} else {
> > +		u32 ctrl, val, bpp;
> > +
> >  		v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Direct Mode\n");
> > +		ctrl =3D VE_CTRL_DIRECT_FETCH;
> > +		if (video->input =3D=3D VIDEO_INPUT_GFX) {
> > +			regmap_read(video->gfx, GFX_CTRL, &val);
> > +			bpp =3D FIELD_GET(GFX_CTRL_FMT, val) ? 32 : 16;
> > +			if (bpp =3D=3D 16)
> > +				ctrl |=3D VE_CTRL_INT_DE;
> > +			aspeed_video_write(video, VE_TGS_1, act->width * (bpp >> 3));
> > +		}
> >  		aspeed_video_update(video, VE_CTRL,
> >  				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
> > -				    VE_CTRL_DIRECT_FETCH);
> > +				    ctrl);
> >  	}
> >
> >  	size *=3D 4;
> > @@ -1207,6 +1277,22 @@ static void aspeed_video_set_resolution(struct
> aspeed_video *video)
> >  		aspeed_video_free_buf(video, &video->srcs[0]);  }
> >
> > +/*
> > + * Update relative parameters when timing changed.
> > + *
> > + * @video: the struct of aspeed_video
> > + * @timings: the new timings
> > + */
> > +static void aspeed_video_update_timings(struct aspeed_video *video,
> > +struct v4l2_bt_timings *timings) {
> > +	video->active_timings =3D *timings;
> > +	aspeed_video_set_resolution(video);
> > +
> > +	video->pix_fmt.width =3D timings->width;
> > +	video->pix_fmt.height =3D timings->height;
> > +	video->pix_fmt.sizeimage =3D video->max_compressed_size; }
> > +
> >  static void aspeed_video_update_regs(struct aspeed_video *video)  {
> >  	u8 jpeg_hq_quality =3D clamp((int)video->jpeg_hq_quality - 1, 0, @@
> > -1219,6 +1305,8 @@ static void aspeed_video_update_regs(struct
> aspeed_video *video)
> >  	u32 ctrl =3D 0;
> >  	u32 seq_ctrl =3D 0;
> >
> > +	v4l2_dbg(1, debug, &video->v4l2_dev, "input(%s)\n",
> > +		 input_str[video->input]);
> >  	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n",
> >  		 video->frame_rate);
> >  	v4l2_dbg(1, debug, &video->v4l2_dev, "jpeg format(%s)
> > subsample(%s)\n", @@ -1234,6 +1322,9 @@ static void
> aspeed_video_update_regs(struct aspeed_video *video)
> >  	else
> >  		aspeed_video_update(video, VE_BCD_CTRL, VE_BCD_CTRL_EN_BCD,
> 0);
> >
> > +	if (video->input =3D=3D VIDEO_INPUT_VGA)
> > +		ctrl |=3D VE_CTRL_AUTO_OR_CURSOR;
> > +
> >  	if (video->frame_rate)
> >  		ctrl |=3D FIELD_PREP(VE_CTRL_FRC, video->frame_rate);
> >
> > @@ -1252,7 +1343,9 @@ static void aspeed_video_update_regs(struct
> aspeed_video *video)
> >  	aspeed_video_update(video, VE_SEQ_CTRL,
> >  			    video->jpeg_mode | VE_SEQ_CTRL_YUV420,
> >  			    seq_ctrl);
> > -	aspeed_video_update(video, VE_CTRL, VE_CTRL_FRC, ctrl);
> > +	aspeed_video_update(video, VE_CTRL,
> > +			    VE_CTRL_FRC | VE_CTRL_AUTO_OR_CURSOR |
> > +			    VE_CTRL_SOURCE, ctrl);
> >  	aspeed_video_update(video, VE_COMP_CTRL,
> >  			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR |
> >  			    VE_COMP_CTRL_EN_HQ |
> VE_COMP_CTRL_HQ_DCT_LUM | @@ -1280,6
> > +1373,7 @@ static void aspeed_video_init_regs(struct aspeed_video *vide=
o)
> >  	aspeed_video_write(video, VE_JPEG_ADDR, video->jpeg.dma);
> >
> >  	/* Set control registers */
> > +	aspeed_video_write(video, VE_SEQ_CTRL, VE_SEQ_CTRL_AUTO_COMP);
> >  	aspeed_video_write(video, VE_CTRL, ctrl);
> >  	aspeed_video_write(video, VE_COMP_CTRL, VE_COMP_CTRL_RSVD);
> >
> > @@ -1311,12 +1405,7 @@ static void aspeed_video_start(struct
> aspeed_video *video)
> >  	aspeed_video_get_resolution(video);
> >
> >  	/* Set timings since the device is being opened for the first time */
> > -	video->active_timings =3D video->detected_timings;
> > -	aspeed_video_set_resolution(video);
> > -
> > -	video->pix_fmt.width =3D video->active_timings.width;
> > -	video->pix_fmt.height =3D video->active_timings.height;
> > -	video->pix_fmt.sizeimage =3D video->max_compressed_size;
> > +	aspeed_video_update_timings(video, &video->detected_timings);
> >  }
> >
> >  static void aspeed_video_stop(struct aspeed_video *video) @@ -1401,10
> > +1490,10 @@ static int aspeed_video_enum_input(struct file *file, void
> > *fh,  {
> >  	struct aspeed_video *video =3D video_drvdata(file);
> >
> > -	if (inp->index)
> > +	if (inp->index >=3D VIDEO_INPUT_MAX)
> >  		return -EINVAL;
> >
> > -	strscpy(inp->name, "Host VGA capture", sizeof(inp->name));
> > +	sprintf(inp->name, "%s capture", input_str[inp->index]);
> >  	inp->type =3D V4L2_INPUT_TYPE_CAMERA;
> >  	inp->capabilities =3D V4L2_IN_CAP_DV_TIMINGS;
> >  	inp->status =3D video->v4l2_input_status; @@ -1414,16 +1503,47 @@
> > static int aspeed_video_enum_input(struct file *file, void *fh,
> >
> >  static int aspeed_video_get_input(struct file *file, void *fh,
> > unsigned int *i)  {
> > -	*i =3D 0;
> > +	struct aspeed_video *video =3D video_drvdata(file);
> > +
> > +	*i =3D video->input;
> >
> >  	return 0;
> >  }
> >
> >  static int aspeed_video_set_input(struct file *file, void *fh,
> > unsigned int i)  {
> > -	if (i)
> > +	struct aspeed_video *video =3D video_drvdata(file);
> > +
> > +	if (i >=3D VIDEO_INPUT_MAX)
> >  		return -EINVAL;
> >
> > +	if (IS_ERR(video->scu)) {
> > +		v4l2_dbg(1, debug, &video->v4l2_dev, "%s: scu isn't ready for
> input-control\n", __func__);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (IS_ERR(video->gfx) && i =3D=3D VIDEO_INPUT_GFX) {
> > +		v4l2_dbg(1, debug, &video->v4l2_dev, "%s: gfx isn't ready for GFX
> input\n", __func__);
> > +		return -EINVAL;
> > +	}
>=20
> This need extra checks: one to just return 0 if the new input is the same=
 as the
> old one:
>=20
> 	if (video->input =3D=3D i)
> 		return 0;
>=20
> followed by a check to see if we're streaming:
>=20
> 	if (vb2_is_busy(&video->queue))
> 		return -EBUSY;
>=20
> Changing the input will also update the format, which is not allowed whil=
e
> streaming.
Agree!

>=20
> Regards,
>=20
> 	Hans
>=20
> > +
> > +	video->input =3D i;
> > +
> > +	if (video->version =3D=3D 6) {
> > +		/* modify dpll source per current input */
> > +		if (video->input =3D=3D VIDEO_INPUT_VGA)
> > +			regmap_update_bits(video->scu, SCU_MISC_CTRL,
> SCU_DPLL_SOURCE, 0);
> > +		else
> > +			regmap_update_bits(video->scu, SCU_MISC_CTRL,
> SCU_DPLL_SOURCE, SCU_DPLL_SOURCE);
> > +	}
> > +
> > +	aspeed_video_update_regs(video);
> > +
> > +	/* update signal status */
> > +	aspeed_video_get_resolution(video);
> > +	if (!video->v4l2_input_status)
> > +		aspeed_video_update_timings(video, &video->detected_timings);
> > +
> >  	return 0;
> >  }
> >
> > @@ -1527,13 +1647,7 @@ static int aspeed_video_set_dv_timings(struct
> file *file, void *fh,
> >  	if (vb2_is_busy(&video->queue))
> >  		return -EBUSY;
> >
> > -	video->active_timings =3D timings->bt;
> > -
> > -	aspeed_video_set_resolution(video);
> > -
> > -	video->pix_fmt.width =3D timings->bt.width;
> > -	video->pix_fmt.height =3D timings->bt.height;
> > -	video->pix_fmt.sizeimage =3D video->max_compressed_size;
> > +	aspeed_video_update_timings(video, &timings->bt);
> >
> >  	timings->type =3D V4L2_DV_BT_656_1120;
> >
> > @@ -1909,6 +2023,7 @@ static int aspeed_video_debugfs_show(struct
> seq_file *s, void *data)
> >  	val08 =3D aspeed_video_read(v, VE_CTRL);
> >  	if (FIELD_GET(VE_CTRL_DIRECT_FETCH, val08)) {
> >  		seq_printf(s, "  %-20s:\tDirect fetch\n", "Mode");
> > +		seq_printf(s, "  %-20s:\t%s\n", "Input", input_str[v->input]);
> >  		seq_printf(s, "  %-20s:\t%s\n", "VGA bpp mode",
> >  			   FIELD_GET(VE_CTRL_INT_DE, val08) ? "16" : "32");
> >  	} else {
> > @@ -2068,12 +2183,29 @@ static int aspeed_video_setup_video(struct
> aspeed_video *video)
> >  	return 0;
> >  }
> >
> > +/*
> > + * Get regmap without checking res, such as clk/reset, that could
> > +lead to
> > + * conflict.
> > + */
> > +static struct regmap *aspeed_regmap_lookup(struct device_node *np,
> > +const char *property) {
> > +	struct device_node *syscon_np __free(device_node) =3D
> > +of_parse_phandle(np, property, 0);
> > +
> > +	if (!syscon_np)
> > +		return ERR_PTR(-ENODEV);
> > +
> > +	return device_node_to_regmap(syscon_np); }
> > +
> >  static int aspeed_video_init(struct aspeed_video *video)  {
> >  	int irq;
> >  	int rc;
> >  	struct device *dev =3D video->dev;
> >
> > +	video->scu =3D aspeed_regmap_lookup(dev->of_node, "aspeed,scu");
> > +	video->gfx =3D aspeed_regmap_lookup(dev->of_node, "aspeed,gfx");
> > +
> >  	irq =3D irq_of_parse_and_map(dev->of_node, 0);
> >  	if (!irq) {
> >  		dev_err(dev, "Unable to find IRQ\n"); @@ -2165,6 +2297,7 @@
> static
> > int aspeed_video_probe(struct platform_device *pdev)
> >  	if (!config)
> >  		return -ENODEV;
> >
> > +	video->version =3D config->version;
> >  	video->jpeg_mode =3D config->jpeg_mode;
> >  	video->comp_size_read =3D config->comp_size_read;
> >
> > diff --git a/include/uapi/linux/aspeed-video.h
> > b/include/uapi/linux/aspeed-video.h
> > index 6586a65548c4..15168e8c931e 100644
> > --- a/include/uapi/linux/aspeed-video.h
> > +++ b/include/uapi/linux/aspeed-video.h
> > @@ -8,6 +8,13 @@
> >
> >  #include <linux/v4l2-controls.h>
> >
> > +/* aspeed video's input types */
> > +enum aspeed_video_input {
> > +	VIDEO_INPUT_VGA =3D 0,
> > +	VIDEO_INPUT_GFX,
> > +	VIDEO_INPUT_MAX
> > +};
> > +
> >  #define V4L2_CID_ASPEED_HQ_MODE
> 	(V4L2_CID_USER_ASPEED_BASE  + 1)
> >  #define V4L2_CID_ASPEED_HQ_JPEG_QUALITY
> 	(V4L2_CID_USER_ASPEED_BASE  + 2)
> >


