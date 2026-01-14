Return-Path: <openbmc+bounces-1198-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7220ED2192A
	for <lists+openbmc@lfdr.de>; Wed, 14 Jan 2026 23:31:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds16l3NsBz2xpg;
	Thu, 15 Jan 2026 09:31:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c207::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768411192;
	cv=pass; b=k4NV6WSmVEIHHUDxenuFhEbBVNugf/Xz3sG+allyro2PvXp8r9EoiMMmFsq+bSAlptKIJ4c9csqf53Iak/bk2jmChBZT98uvENPqoqpzRWn5mfdoH60o888gxInYsqfH2iQLMe7kNcC7ZlPfMPv+HuvhqMydakUNNO+uzVELyT5v5PP3uuLjG5LIo66VwuR+svZ9C0mVgfVdCwkVHBoUPDjoL8hePHbqJTGs+zA+tbYXQQBjA1gtyxAVUyip9j9rmTxL7p3nxsIzdMmb71EmLbob0ctJDwCTi4QzCLztP7rZ8FPdGGDVX3SBqHtYLl4IuUsPx732x7lQiukXUfibCA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768411192; c=relaxed/relaxed;
	bh=EvWuWXWXjEUxNLU5czt6GUjFPl1XLAbh1E6O8lrPmX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YaJ1eKEtfAzYXYrkdND3aFGML1Qah9blno5r5imrdtPXwB1trJxb3LnbikQRfP4XhsmXYXsv+OHf5PlE61EbqtsR5AV03TPz4F8P+sLsIAd/9AJi5R+Un8uQmxIlWCTSsUmhVPFI0X6oxRDrWn4Luhx+At+pO1+QIUxz2EfNjoU5KwMKlu/R08qCuwmIYZeNA49R0TErNaW84yHn3+T4/uN9RM+uhQMiIGLJPx8nLItBnFAaKJ0l7G085+yQvsbA6RA3RXrfkwtBzDosuiWfBGuGAJRF4udEg1yiDZ1KrCRourMSjCPrMi8i2dDLsCDPv+d8ZQ/mUHUgR+dl4MRSdQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=SSJ3ifyS; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=patrice.chotard@foss.st.com; receiver=lists.ozlabs.org) smtp.mailfrom=foss.st.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=SSJ3ifyS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=foss.st.com (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=patrice.chotard@foss.st.com; receiver=lists.ozlabs.org)
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drtCV4GL2z2xJ6;
	Thu, 15 Jan 2026 04:19:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aN/oJMas+EtmGo+jsBisOZy7V9mPyRjMw0oCon/LAN63hFJOwrWcTxSQ+eaypB0zmSPQ960LOPNZs0yohpdJAcWS5AISglwnv11sxQ/9Bd+oZna1clFWyZVhQD+66l21d2hTwR5gbmyvqv7PKdMb76y5KnUfy+v+NE17xnWFt+A4tqCBlcI9SuxDSF24ELZWqedrANpGNU2O4Wm49xxJixXnGYeQZHxejnFIjlucxWPQ6FoafhDubQav3UkXveqrMMtjGYRcmbrB4uR+golJUvw6X0xjHcXipbr1/tGVeufOMWq0PqaUw2qW186mpQo847473XLYuZkAjPivbP5rTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvWuWXWXjEUxNLU5czt6GUjFPl1XLAbh1E6O8lrPmX8=;
 b=p8HGdCWdsyr+Z/DGdJGzjNjM++fV9OL/biqFBIGyKv/gzcYReNAB7Bijkp5IeKswwA1yVgpMg7nL2PU3f0Ksn5UrRnvWwqeKJmFR1BcIKZGfqmUiIKMkmIfc4MB175PUAAEUyLLcVJTNEiz3N5eNENMP2fnC8oAD4bxcmS1JF5s4rRWYMB87FeHbyls17AY3cEqacUdwN7LwjZEDgSiStVT/sMsc6el3hXNtvo1vl5Hixrhii3hPjkzDq0KLF/M3TxzXYoFqHrscGK/moQabOvJtXg7/ZAFkwfiICk6rigbhJt5HASJugoUq90bRQU2Do4umCEvHGIshBqiH78Ypqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvWuWXWXjEUxNLU5czt6GUjFPl1XLAbh1E6O8lrPmX8=;
 b=SSJ3ifyStutH3IR7GhpCTD1UCW3oBYFPkNMh8c6Ev1+R6vhbSewxVTUGogKIakcCAseaxd0F9erbxnDkkCNGe811W54m290haBQtRiv0YBv8rZeWLzAEPSv3PPUjpdSyWpdklwv0MKQKwCX3ADOfEiXBnOZ8VfWcNrU6N1ikI7SdVZ0vpS3mfAGuBPmgvGFIELr0E+uFlcuZVvRmwd6nvaIRtQcKACw8BHrs5gQ9fi9HhTmT+D8MeN+MzyB8x+OnxU4OOcVlTTUH1mE7vs2PfkxTGmcSpxhTu/iFCLzAvI2c+Yd/1sQnq7XrTGNntkdrhZfrFgtbyuWpm7jFmYSGGg==
Received: from DUZPR01CA0246.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::12) by DUZPR10MB8228.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:4b2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 17:19:25 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::da) by DUZPR01CA0246.outlook.office365.com
 (2603:10a6:10:4b5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 17:19:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 17:19:25 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 18:20:42 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 18:19:23 +0100
Message-ID: <92b95ceb-3c99-4977-b467-7bc5ee39a4d8@foss.st.com>
Date: Wed, 14 Jan 2026 18:19:22 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] pinctrl: st: Annotate st_pinconf_dbg_show() as
 holding mutex
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Linus Walleij <linusw@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
	<hal.feng@starfivetech.com>, Chen Wang <unicorn_wang@outlook.com>, "Inochi
 Amaoto" <inochiama@gmail.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Bartosz Golaszewski
	<brgl@kernel.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, "Daniel
 Machon" <daniel.machon@microchip.com>, <UNGLinuxDriver@microchip.com>,
	"Thierry Reding" <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>
CC: <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <sophgo@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
 <20260114-pinctrl-cleanup-guard-v1-11-a14572685cd3@oss.qualcomm.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-11-a14572685cd3@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008860:EE_|DUZPR10MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: 9be893a2-de39-4b63-3129-08de539110fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|32650700017|36860700013|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aU52cXNUbUZBcktMc2ZRM2QxNll1RFlvZ3BFd01ldUdrQUdqY1kwZldoMWpm?=
 =?utf-8?B?anJUeXVFUkhqMTlxWXNwY2VKNkhMdDVoME1vd0tOcGc0UEExbFRWYWJsUU0x?=
 =?utf-8?B?dExEMDl5NU5DcmtCb0FuUzU3Z0pZWEI2NnBNUGhQL2RjNExGV0ZRNmpyNUhK?=
 =?utf-8?B?RDhDUkNjejcwQTdOYVJ5NktmYkpNUjVsQ29vQmtJOGxZdmZBZXdiVkZsaFQv?=
 =?utf-8?B?R2ZLTldxTFVSdUpyblFhUUNGMHZ5N2d0U0tRMTg1WHRUUDhKbmdxNEpkZ29H?=
 =?utf-8?B?dVZyZ0NTNEczWlc2VE8ybmtwNGNvcUZmNWdPalJteXA0SnA1ZU9rVCswZU5n?=
 =?utf-8?B?Qy9WWHdmbzlVcHlYa0dhc044SkpxRUR2c3B6MWRIVm5rNFMrc1Y5ZGVHbnY3?=
 =?utf-8?B?SzBGcTA3cVJla1RYcWdiMGkxdkszZ2RrOHozNFhhOG1FZzVBS2RzbnBhWUl0?=
 =?utf-8?B?RURjQnJoWm55OGloRlBsOTMvZnBIRldnSVkra2U1RUlXbVpWTGQvdEpwRytq?=
 =?utf-8?B?YlZCSTI0cXIwaUNvMHJ1RUw4c1NPNXI4ZXN2SkZDb0V2bkFYNFpDc2FKNGMw?=
 =?utf-8?B?Y0FwVU5FMER0d0R5VnV2eGFrM2V2TEdtQ05SZnZ4R1NJb0t0VWJFeUhSS2VJ?=
 =?utf-8?B?Uk9ZbjRQNkdwN2ZneTN1Y2xqcFVmMUR3ejdJN1NLaDVMdDhHTm4rVlMwTjZV?=
 =?utf-8?B?TjE5RTNHYVVtdHRrTmE4SmZDcjBUeFhwWTh0b05QeGdUZ1UyKzNzR3NzSXJ2?=
 =?utf-8?B?Q0V6cVYySkFjNW1obUE3Z21pVTJiTzhDOG1RbEVMQzNSRzR6aHZCS2hYR20z?=
 =?utf-8?B?RjNQTUJ4MXBrS2NSNmJqWXNuNERXU1RmY2JWQWY0Y1ZEVWJCZnQxUWx2UDlF?=
 =?utf-8?B?YkZWYzJEY1liWi9xTUN4cjNnUngzT3pPSFRvOUJWOWluZXpaT1hyVDF1SE9Y?=
 =?utf-8?B?M1lhT1VUZ1gyQjZGR0NyWHFpTkVHL3VMcUxxbjdjd2Y1aWV6cWN3TlRmYWJY?=
 =?utf-8?B?K0dXQUhUcEs0QTlnbU4ycmdNNm9UV2RiYjNlZCtteEZNRElKUHBtWnJvV0tl?=
 =?utf-8?B?ZEdoT284LzhiY09oWXhLUGIxbTM4dHNDZGlKdklkSXlnK3V0dGtJcGdiUDJL?=
 =?utf-8?B?bVVhUHpORVVOZlVGbmZ5R3kzMDZ6ekh6VFF1S3lLWnhDTjNjTDVEQjJXUFA3?=
 =?utf-8?B?VU5OZVV0dW5rajQyTHA2SmVyaVdQQWVJRmZGU0xhWFNCcEI4WlRVVXFuVGRJ?=
 =?utf-8?B?TW1kOTF3OHB5TEJHK1YrTUpudFB3UndudVZuSjV6YlVhK0dncTc1YS9jR0Ft?=
 =?utf-8?B?eStmaGQwOUlnNmdkdEo3aU85dDFTbWhxZ0V5aWZVNUJOTVp3R0hyMmo3Yndh?=
 =?utf-8?B?blZDbU9PTURCMWVDV2YwU1VmTmE5dFFkeEFRUk9Tc1dEV1BXY1o0b1VnM2xH?=
 =?utf-8?B?eVp4aHZFUnNhMXNRQkFLbEEvd1lzWlphOXgyUlRJMmhhMXpld2xtdGlhdDRF?=
 =?utf-8?B?REFITkRPb0pGY04xU1BaOG53a0dWSWV2Snk0c20rbkR0a0hVVnJ4WlBZWGJu?=
 =?utf-8?B?NXAyN0Y3TGVwLzM0UXB2TVE0cG9NdFpSUlpjR3NEVGh1N3JVTGd4RGprcmow?=
 =?utf-8?B?MFlEN1hOR05kaEZER0RnM2tCMjU5dmRuN20wZXJzQnQxaUdPTUJ2bXJOMTFU?=
 =?utf-8?B?c1I1T0k4MU1wdHhQaGZmcXM2Mkt3eWVnaVFTNGlPVjJIckMydE5mV3E2c3NP?=
 =?utf-8?B?b3NOdGp0UnRBK2wySFVBUjhzV0JxUVBUZHluNlA0YUQ3ZjBSZmxQR3ZWK2dS?=
 =?utf-8?B?RlAwVVZrc3FubU9adHNHZndNSkhiVWs1NWo4bVpGdXRQWEtvelFIL29GV3o0?=
 =?utf-8?B?YndKckdab2RPT1N5STJaei8xMmhmT05IeHpuR2xEYTBOc0t5UUVnWTFJT3li?=
 =?utf-8?B?dExNWUE5c1V2NjI4MzFLSCtFTHNLQ3ltVEVsWjZGNitodDBDeWwrNGJpb1la?=
 =?utf-8?B?UnJEcG5GTE93cklwcFMrSUNDc2hxanFhUlhUNXA5OHFvN3VEc1lIT3haS0hB?=
 =?utf-8?B?blowMy95UVpjaUJ1K2I5cUxPbFNzZjN1Z0xRVkJlMmpMQVZXUnQ4MUUyTzlO?=
 =?utf-8?B?MXBya0xVY29oYXlYZFVYYVYvQXZxejhNRGE2MGxGS1hydXA5enhoazI4aWx3?=
 =?utf-8?B?d3ZjMkZuT21qY1FxUXJRdE1CSXMyZEtHby9lLzBRT2JaZ3FHdmhoV0NVc2x0?=
 =?utf-8?Q?ktY4lbFiL5eI7gMy5g69JDtgDcU1GxcGTMK0B4ra6w=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(32650700017)(36860700013)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A1bMcRBDS/lcQoSy1atY1UrHjea7eClkRqHv0eBCYATsFtlzmQxTF+1KUYUyMhF9CAqeqq7bumy9GP3SvwMoUVfDBbeoMDHGC7FM1aywJwT4pCv395XucmZjD7ySLBpPAjYm0UmhyxPTvvr9ksdXs56KPtULE7yoWnlcRiv4fx8ljgAkAphSCtoa9NzLm3Qyyds8qvW2A06CxNngIzNU0wjOw4ra4dFrZXiMK4Fzsg2uUaT7fBGNQx9iO7Jja/1bgCEIBDkBSvgD5cstUYH+EDz91Z7TA3lPLzuPOIfF38HAJ2oQZqukIXfZN/6w7mQnQtJJ6MS9EvOfCn3lk2WAakt51K7wV2NG85+l9j42t1S/TPJlpWEnThTUk7TZUZEV7YYPp5RBrI9WW8L7z1pRq7f1tM+PkSctfjsLvAwn0vyND3ZsndMxPTvnydsLhS9sHvXDPsi5hosQX5zkK7e1Aa6Xiik2Z2ot3JRVsWc5EEEfByi6wDp3/BkzUrfcj/qYaVZzC33qETncxKJ/T3slc3jCoYjaRJ9ghjT0cjaLyn1MC7DdEqfE++FQfOJhGW5sZh5hfG7B0mR4rQTysOniPpROK5XznrjrDRBrOWqJfWUlX1rn82tS7J71Z80gsdQsXAK/blGcB5gu8NKeiC8bN6Kmpjay2I7Vl2UgZNJuPRJUM934jhRk0T6zJ47y6uAp
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 17:19:25.2514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be893a2-de39-4b63-3129-08de539110fd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8228
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 1/14/26 16:30, Krzysztof Kozlowski wrote:
> st_pinconf_dbg_show() unlocks and locks the pinctrl_dev mutex, so it
> must be called by the pinctrl core with the mutex hold.  Annotate the
> function with sparse __must_hold, so any changes in pinctrl locking will
> be statically detected.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> I think this is still useful, although maybe a bit pointless if core
> explicitly always locks every pin_config_dbg_show() call? Anyway,
> pattern of unlock+lock feels to me like something worth annotating.
> 
> I left the patch at the end of the set so it can be nicely discarded.
> ---
>  drivers/pinctrl/pinctrl-st.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
> index d3cea3437d7f..8ce88e591f47 100644
> --- a/drivers/pinctrl/pinctrl-st.c
> +++ b/drivers/pinctrl/pinctrl-st.c
> @@ -987,6 +987,7 @@ static int st_pinconf_get(struct pinctrl_dev *pctldev,
>  
>  static void st_pinconf_dbg_show(struct pinctrl_dev *pctldev,
>  				   struct seq_file *s, unsigned pin_id)
> +	__must_hold(&pctldev->mutex)
>  {
>  	struct st_pio_control *pc;
>  	unsigned long config;
> 

Hi Krzysztof

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

