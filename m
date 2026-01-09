Return-Path: <openbmc+bounces-1134-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24892D0C9F4
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 01:29:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnzyS3kRQz2yFp;
	Sat, 10 Jan 2026 11:28:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.196.138 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767951869;
	cv=pass; b=ldMgHwClzIbcn18M0pqeOnPAfNFiSqpHyiV0tN1rE7Dfu/rdjKcnkMrHFdkAQU5hJJuUuEtAHRmoe/bD2G8MI1ghNmRiXHKV6OMznplUirz/SPP1z9Tj/KMFRFDn9Xx1JiGDqxBgUOJxUMxK2sqzZ2jVcIM0dAISRx2d0WhItIm73U0/tym/DrKpRtPnC+l2y9tb6Bx8cxPBg1vGKbu0boecyd+q5w300i3qgkr7mJ06PYeWsE7xSomFzm/miDSvsVlUapL5s41BXyDTccPtHTUq7mhFIr5Cn2GexyuPKYKxfx7RnBC5RA5DrE8pN0235iXj/RxnA82qfb8KaK2sHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767951869; c=relaxed/relaxed;
	bh=O4g5srWzDZcUCN1/LtQOwXipPYWUpLveaRZTFLhasPs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mLbt/QqEhsQJ80EN5lEMDmIKFYpY3MgkofCErYknJIXqG/VuY2ywm++dYBaexnjhgSXJiuanvqDzgeReuzEuIX0DOhADCz3Ucee5fW4vp3oubeWfNKtrEAzEzHUDGQZyCtQV1fZyp5bxbZSkHow05mOoz6DJbnuJlle8jJW9Ye+xNR6hwDMFNtvWRPkD0wpRDKikz7Jg+CuWm3RibVfVkQwHaQ7kIvbsXmgQO8vQ8OaWV2o706TKC+qPPxEp69LLp2DGoXvevMIMznMAQ+OIAp9FN7zQZOaaJrNEEBVVR9atrlSQNHGvlHCThRBoZKShfwvLKgkh1e36eU7ph86dww==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=pNJZb/oh; dkim-atps=neutral; spf=pass (client-ip=40.93.196.138; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=pNJZb/oh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=40.93.196.138; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11023138.outbound.protection.outlook.com [40.93.196.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dncLN18gMz2xP8
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 20:44:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4HGlF2unlw63kOC6jhsV1Nq5TJhbzKYa+h9WJMX0PeNozXJ881fxG3lcUNoRGX8STKdkN2oO8xPbsfyEfac7sHzKUaeOCet7BIgxHEw0smj2ct5oLNrcOCx4qR4DujMCGM/G5UdBU42I4U40MakW3vBlLu+L5xA6FEtfDRyL3fs2aVc95LgLsNNGWMvJO3cSJYQMeGTTVeJCaEx2pDCvPdJT4+J/f+ujBDl52Ct8SpQWXSYvgY74PjJN6VLF+rO+0MYo0n8Fx/3mW0T+ZBjtRR2vdHkF7CwEufHGECOtca3f+fywUENaufOeRPKLg88m2RSC7jthR4kLzm5y5cV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4g5srWzDZcUCN1/LtQOwXipPYWUpLveaRZTFLhasPs=;
 b=Nim1oEWK8WREC2ZIr6iMcpMc2Ct8066UJxGPHXRqgo06DMeSA2AFLlSk+MYCATBQN2M2szKp/Ix4C2/Xu+12I0KTFEDxTbJLjCPldrkluebTeDAzlGFY70R21/U4j/Q5twXSIZu/FkUH72cfVXYPxDkWO1SojEvEPs2StLAsBPQapcTIOjSPd79JlMRgpoXmw8Qj3BByOAuCYlPZpehiFsEei47mYYrrP4yf1BfdNaT/fDhCj0KBPNeM4rgyrb2AoJR5p3u7OllADvE2wKKjmoTikGaUNWB56PCWQoQ+VbUZgV+BKHsQSKKdR7BVMmZhahZaRnIupsFjV+ZWPT/BUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4g5srWzDZcUCN1/LtQOwXipPYWUpLveaRZTFLhasPs=;
 b=pNJZb/ohe+88lfUsJSMfIFpgorDRvHr8iEtEvkQWq66fBdfqltpKqxpbYgumGgQv7/h6ipXT6IQSbjjzSLNKBdpL/b1gVgRq5Cs3pK7pIDg5etqy79Tn+GJDB+Mp35jXu/qTRYnUkMckwOB8/IXGVSzMJ1q5AUpQsSUQUplY7MpzJV+M74j8FdxRpRGIZGaYvPmwid8subNUI0nR5n58O5NJR4X/ZBhheNbDprEcRjgW8Nb2PjpIIOLkhOHKvf1J21/kY29riRI11kJ2XLaH6kO+fQe/DleYXVd3fbWgWly1XuHl8is5ZipKHpphor//g1CuA3zFVkEWiApO8LawQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by DM3PPF538CF913C.namprd18.prod.outlook.com (2603:10b6:f:fc00::6a6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 09:43:47 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%4]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 09:43:47 +0000
From: Tzu-Hao Wei <twei@axiado.com>
Date: Fri, 09 Jan 2026 17:43:30 +0800
Subject: [PATCH 2/4] phy: axiado: add Axiado eMMC PHY driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-2-dd43459dbfea@axiado.com>
References: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com>
In-Reply-To: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com>
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9215; i=twei@axiado.com;
 h=from:subject:message-id; bh=YWrI8NS5tiCPF3wH8c+IToa+fCZIZcpe9EwV1/KMU5I=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBpYM3QACJciZCpErLcyKf0GeLvyRCSneBZBbpoP
 uUamOAH+6aJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaWDN0AAKCRB4EDBdxFrx
 15J6C/0UcGRDM4U4Em1iMRYkknqa0GEY23UMbNc0pu88Fbn1HxIGvINW7uaBOeKd6Y3ESq3zLeK
 GPJVT3g8tMxWFnjF7ZT92oOzP3jHFMdO5n/YGWShBKndDwWvVFmOhi1c/AIeyC+niU2BaD9v2Nl
 HCg/ukhQWr1fWOj+BcaiespJ6J08pW+USGwYMFIpASeWEKPBT9klDuueD7Y+1FrO5Y3FU4JsIrR
 n10XOupmR4b2+r5vNcRJif9wQ+n5uSCIxhC0o5nsYSehfKc4oS2Lx8tih2Pw0iwSFWSWuWZFD60
 +DjHOVfVCd4rochjBi9PRzpaGXNZ8l3HJTzbX5PHZbmL+PBUYUBtI1mYPFGyLzjdb/dan/ZhPta
 mySZpKN3bzpNtpIeOrcgud4nQMiSYeI5cJqItz7uFaA4xT1eQiyqh6SM2pQEqpRyOW0Fv8sDJZX
 leVOnzefAfyjTKi/HrbNgT9W2xFXN59O9YMOVNH3jAP3lbknP7qKZ6VOoIPATrGtfBM/Q=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-ClientProxiedBy: PH7P221CA0009.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::28) To PH0PR18MB4558.namprd18.prod.outlook.com
 (2603:10b6:510:ac::13)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|DM3PPF538CF913C:EE_
X-MS-Office365-Filtering-Correlation-Id: 9823ec55-4452-44c7-9874-08de4f639582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|366016|376014|42112799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b21XRC90dFdmc0dQSzcwTmFCeis1WURtV05aQkUzUUk1ZkVsZlhUdkFhdDZr?=
 =?utf-8?B?NG9kTlRyMzJZZzZrKzZRMTJxMUhNK2ViaGhnRnEzR2xMcFBaZTZuUjdtOXlN?=
 =?utf-8?B?RGloT1VmbEJ6Nkk5ZTZCS1UzTXZuakg1ZjNJWWRoZ0N2Q0JMd3pmdWJVNXNE?=
 =?utf-8?B?SnJUdTMxeWFjVFVKNGhQZncrZHZqY0ZPbkNSdGRoTFFtL0luSjJyOXhiWExL?=
 =?utf-8?B?d2pGSzNRWVI1aVp1OHRsWUpONDZYYUlEMWdMZExMakNyOUpBN0xDSTllRWU2?=
 =?utf-8?B?cmxhMEdueXpYby9KTnRScm9vT1ZONUtPWmRDOURtTU80SVdoWGV0czRGenlu?=
 =?utf-8?B?by9qb25ZaEphbHVRVnZvMWQxUEV6WkRNZmhyVHlSL2xsRVlPeFFYMEcydkRO?=
 =?utf-8?B?QnFEVHJXWkxvbWEybG5QRnRMU0trNkxIb3BxZDhEdmpGWC9RRnA4Z3UzTXYw?=
 =?utf-8?B?OG01SjhxQkJVWlRwWHMxV1p0M0JvRFMzQ3ozdnpGc0ZzOTloaHVkdzArNkVh?=
 =?utf-8?B?cTdiRi9zVkF4VzlFM1d1TjN3dVJDeWZDQjJ0eXdTSVBta0w0bXM0dWxXaDFE?=
 =?utf-8?B?OTZ5K0h2MjJFRHNmY0RyV1BTSUdxQUFjSlZsZlc5RlVFWDV1NFp4Q1A3eUR2?=
 =?utf-8?B?ekpYcHBkNCtRd3M3THhCK1RZdWZNWWR3SzlSTVdKdXNoMlUzbGI2L3A0bjdR?=
 =?utf-8?B?WWtjdDNWakQ2Mzk3VTN1b2x6QzRkVGt0ZVRaSXJISjZlTnBNTTFvbmF5bjBv?=
 =?utf-8?B?a1lPK0FVUDZlZlZyb2ZyZ0JXcnVyS0RNSTdHM3N3amF4ODQ4azA5Zmh0cktz?=
 =?utf-8?B?NUg3aSt1YUVpbnBOMFdyWC9kcytPclpFdkhzSnBLMzBoZThDY1hxMVFxWHpR?=
 =?utf-8?B?dHR5SkF1TXBYRnBBS2xxWmk1U3owcDJVaHVhblRMUkp3RGkwVitTc0xYWDYy?=
 =?utf-8?B?YjFTU3FmRkEvaGp4Y1d2NkxVUTFPMWx5SzJDSmk5VWpmS3UwTkdNRVY5ck9q?=
 =?utf-8?B?dW54ZHlGWXVUaDBtSTRKVVFrRkdJWktTdFo1eUJpK2cwUkpiWHF4V2JlVHhx?=
 =?utf-8?B?WTRqQkJnYkE2c1BhL2tkdWdlbU1NZlBybXhQdWcwd2V5R01IZFBaMzg1c0Y4?=
 =?utf-8?B?emp5Tlh1aFYwTHcybjlGWWlvcU9JcFpRN1ZEOWduZUxNK3V1Y0dUVTRnZGdQ?=
 =?utf-8?B?ZmVkR1ZmUEhkQS9YZWdQdENFWjMwYXVIcHpDV1huODVuQ3NWUjNHUEpyWkE4?=
 =?utf-8?B?T3IwUnZGcUtvbEpOdllZMWR2TEpqYVVhdjRVNWR2WFFyV0hINTZVRHh6ckN0?=
 =?utf-8?B?MUFmdndPWkdkcjB2WHJ0NGs5LzQ4Q2RLY2lTQlBpeE9FMUoxaGQ2OWFkYkcr?=
 =?utf-8?B?anF4Z0ZLdGZnYXZFK2lvc1d2K1dJU09Dd083cWdzaHhRNFExenkyVHhIUzFC?=
 =?utf-8?B?RktPaEw1RndUSk5KVXQwcXd3bTBSWjBBcnZMa3V6dGFtN3NsSnMvOUgwdGFt?=
 =?utf-8?B?MDFtNTVxaGY0Ymtwb1J5aUtaRDZlWXlEWTdWNk9iMTJtT291RTNJcFpISS9z?=
 =?utf-8?B?aUxyUWo4SFZQNlF6NnhtSDIzeWdSMkVXekVaTElGRG9kak5SUnNyNDhWTHFH?=
 =?utf-8?B?TTlBYkFKeVJKeHYzTU1PT3dxSDNLWnZ5U1lTT2JUWjJaWnNFck9pZkU4RjRP?=
 =?utf-8?B?YVhXVzVxTHBYMGVlYld2d2lOWm5lUFJjVmVOVHUwdFJyK1JESGROdjV6V1NC?=
 =?utf-8?B?d3VsSXVwSXZUdUhEbmZuUG5xNklkOGpqOTNRcUNqT0dNMm1zK1FKeUZpV0w0?=
 =?utf-8?B?SVY1dVJ5SDJoNTUwQ1VadzdaT3BEOWNuN3FwdllwUUx5Mm9WWjlVU1V5eGh4?=
 =?utf-8?B?c3hXQVB0NUp6L1B2YXV5enlDRUZSK3NFejFsNEFNU3JqZnFOai9nWktxT09I?=
 =?utf-8?B?dzJPQkxaQkQ1cEF4U1BaV2hIZUdkdE5MNUxqZG5mOTVjeGkwY1dRNm1zdDIw?=
 =?utf-8?B?UUVpK1h4cEsxc244NGV3MjQwN050S0RZUFY3SllzeUpIbDh0TzFTQVhXRzls?=
 =?utf-8?Q?tE4NkO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(376014)(42112799006)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWRWNHY0d0dISk9OemR5TE9xTWlwR0Z0RWp6WXVjZ2VpZ003blp1TTNxSXBB?=
 =?utf-8?B?SUM0RDg1TzBqQUpUMkEzMVdHZnQwdStyVFJOU3B6VjFncjcvK0pWTm42aFNU?=
 =?utf-8?B?MHovZ0xtY3FYR1U1d05wNXpsNjBWd3MrK0hpMTNncmpkUklCeElDbCsybVVN?=
 =?utf-8?B?TVBLaWhuTlo4eWRtd3pGYzlVQS9RdFBRUEdOTHJaQ2gzQ0lGd2JvWUxHOThj?=
 =?utf-8?B?K2VmYXFMZS9SRWluU3IvQ1QrQXZUbzRvcTdNVmNZd0FkZS96bzRVWTNPMVUv?=
 =?utf-8?B?MnYzT3dQd1lwYmRqaXVYUXdJajIvdGVyNmFiNkZ4WUJyS1pqOHJVQzRTOWdh?=
 =?utf-8?B?Um1vK25ac3RkclBEbHk0ZWxBZkJoaEhPZFVOYWttbTVOLytuaUlqTThWVUNO?=
 =?utf-8?B?MURlajBPd1llYm9qaHA0ZzR3aDV4enNUUXRWNWxhaGlROWgrR3lLUlZpdXF4?=
 =?utf-8?B?aXdGaGVJMGttRExXU0ZETHJCeHVpUVZqaE0yaDRPOTJLcUpUMkNvU2hLTktN?=
 =?utf-8?B?OE51dUJORk5RVXdsT1FQNTRKWlE3NjNzcGRrNlZ6dHFYNS91U0E3Q3o2dE4x?=
 =?utf-8?B?bzhLcVdFSmJESXFWQjd6bW9CLzcrTU52bzFRblAxb3hMMlNtbEg2U0pZVUJ6?=
 =?utf-8?B?T0dxYzBNNGcyck5vengyTGJKOWlYU3V6U1RXVUZBcFJ6WU93cXIvbTJvYWhz?=
 =?utf-8?B?cXdrS2MzV2FoV2pkQndnRDdPN21idThMOEozQUJJTFJQSzRwMEdNRXVweTBr?=
 =?utf-8?B?WkxybFc3ZW5CTFNCdVBsUlZ1UDlROENUL21VeUdVM2thM1h1NzUwNEZ6MWoy?=
 =?utf-8?B?THA2RTAvWkpRWmJBZ0NzaklzajBienJPYTFZSGhQanlPM3lIVHA1NHRnMHRI?=
 =?utf-8?B?T0EvMVhBZUJsVVU4NjZQOUJoenBqVTRaQ3BjalIyUUowVDhqZDB2MEhWS2ps?=
 =?utf-8?B?d0E1RDE4WHVEd1p4QWhhWmxrcERPNFlCV1hvck9nLzlieVM5dGVCRWg1c1lN?=
 =?utf-8?B?SmdZUDAyR2RNa1RuMjU4ZFRVWDZ0MUpVRVhkbG90WkhFL0NTVWYxOGJqRjdT?=
 =?utf-8?B?OTZlVnZSdUNSTUFoVk1KOVcxR3JXYXQ5MzRqYnRzWm53cUZ6UXNkbWJ5S3lD?=
 =?utf-8?B?a1NoeWlzSGFYSDlGdTVKSlFwdzMxcUxUVkJIRnVaM1BySGJiUXpEMmhoNVh5?=
 =?utf-8?B?YUVFajNCa0Rka25nWVJraGtzeVNQaE80R0xRcmdrakNTRnNNaUozUmRuV1N0?=
 =?utf-8?B?OE9RRmtmaXBoSHlHNXRlcUpkM2dYOUJHOFlBY3RHdjlNbmJkWE9uYXhlazVq?=
 =?utf-8?B?UVBpQWxmbFRmOGVzeUROUDk2aGRJMWU3UnhqbWhwRU0xMWlFanYvM0F3VGVh?=
 =?utf-8?B?THNoMTE4QmxITHNhekp5eDByS2o1SXQ1dnAxWEgzRDBRWXc0SVlCOC9mQlZ1?=
 =?utf-8?B?UUNFb1RPYVBrNitGTHJ2OEFJL2l2VFZqU2toVFh4RVpYd3lHWllGNitrejNs?=
 =?utf-8?B?UC9qb09zT25oWWs1TXRsWEZJOGhuSE5kREZ3SGhPdkNzRSswc3RJZ3hZZndy?=
 =?utf-8?B?VjYveVlZK24wY3hESG90ZFZZT1B3Skl2UjRNUys4ckFjNFYwWnJ5MGp2UUow?=
 =?utf-8?B?ek5BdzNhbEdwZEl4VmZSd0hOMXR3Smk0ZWYwemhzaFFHL0c1QkwwQ3l2NmlI?=
 =?utf-8?B?eTl6aUgxQytRMElUY1FDNVQ3SmRVdm1UOUl2ZGhJQU9FODVRSm8rUkFRM3VJ?=
 =?utf-8?B?ZDhYLzZIZnU0ZEhRVjNnNCs0S3NremRmOGorU2N6L1ZnTVpsSEkzMXQ2MVVT?=
 =?utf-8?B?cWFiczVLNWpwZnJPeUVMdUpnN202dnpYTlhXL0VVL3NBbm5rVXhERERNRkc4?=
 =?utf-8?B?K1o5MHhlMTZSVlZqVTIxSlhrMU1DSStzSWJzRFpBM2pYRTI2UHBZdXBEOHBI?=
 =?utf-8?B?TzM1M1NiQkljOS92b1h2OVdWRXNBUjBvcWNsSFFMQmZjOTMwWGVXMk1QeWJq?=
 =?utf-8?B?MG1JWWZxbFl0NG9wYmFJR3l0VEJjR01pMzZlcUNPS0UweFZ0WDJqNU00bGI2?=
 =?utf-8?B?eEFock9RMEhVZmt6WVp4dXpuUVZUejJvbG95QklwcWRwQWIrMW5oY2NjYm9U?=
 =?utf-8?B?N0lQa0RyT0lJOHRqT3YwS2pFVEx1Z2VRTDRhRFBaVmZvUWtEMHF5VHdIODVa?=
 =?utf-8?B?cU94U3A2dGFTZTFkTmNla2JjT1BYMHgzVEdZZDVkYUEwbUUyOXpMdGhRN1hC?=
 =?utf-8?B?dVhrRDRGaDJBSWEvOWt3ZzhraStMcW5Fa3BXanZkQ1BpSVVKcEJlMHRjWW9z?=
 =?utf-8?B?MlBzRHZBRk41cTdqNk5QS1NHRFRRci9zUXY1eEMwL3djZDUzVFlYUT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9823ec55-4452-44c7-9874-08de4f639582
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:43:46.3334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtBir+1m8rm2JXCYZMfNumbah+9WHEzQoxzTWrWy2fjKnqJEaL/yHGga72uoBx88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF538CF913C
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: SriNavmani A <srinavmani@axiado.com>

It provides the required configurations for Axiado eMMC PHY driver for
HS200 mode.

Signed-off-by: SriNavmani A <srinavmani@axiado.com>
Co-developed-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 drivers/phy/Kconfig                  |   1 +
 drivers/phy/Makefile                 |   1 +
 drivers/phy/axiado/Kconfig           |  11 ++
 drivers/phy/axiado/Makefile          |   1 +
 drivers/phy/axiado/phy-axiado-emmc.c | 220 +++++++++++++++++++++++++++++++++++
 5 files changed, 234 insertions(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 678dd0452f0aa0597773433f04d2a9ba77474d2a..b802274ea45a84bd36d7c0b7fb90e368a5c018b4 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -103,6 +103,7 @@ config PHY_NXP_PTN3222
 
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
+source "drivers/phy/axiado/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
 source "drivers/phy/cadence/Kconfig"
 source "drivers/phy/freescale/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index bfb27fb5a494283d7fd05dd670ebd1b12df8b1a1..f1b9e4a8673bcde3fdc0fdc06a3deddb5785ced1 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
 obj-y					+= allwinner/	\
 					   amlogic/	\
+					   axiado/	\
 					   broadcom/	\
 					   cadence/	\
 					   freescale/	\
diff --git a/drivers/phy/axiado/Kconfig b/drivers/phy/axiado/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..d159e0345345987c7f48dcd12d3237997735d2b5
--- /dev/null
+++ b/drivers/phy/axiado/Kconfig
@@ -0,0 +1,11 @@
+#
+# PHY drivers for Axiado platforms
+#
+
+config PHY_AX3000_EMMC
+	tristate "Axiado eMMC PHY driver"
+	depends on OF && (ARCH_AXIADO || COMPILE_TEST)
+	select GENERIC_PHY
+	help
+	  Enables this to support for the AX3000 EMMC PHY driver.
+	  If unsure, say N.
diff --git a/drivers/phy/axiado/Makefile b/drivers/phy/axiado/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..1e2b1ba016092eaffdbd7acbd9cdc8577d79b35c
--- /dev/null
+++ b/drivers/phy/axiado/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_PHY_AX3000_EMMC)		+= phy-axiado-emmc.o
diff --git a/drivers/phy/axiado/phy-axiado-emmc.c b/drivers/phy/axiado/phy-axiado-emmc.c
new file mode 100644
index 0000000000000000000000000000000000000000..7b18689fc6690750d7b016ebdcc457ebb81aa3e0
--- /dev/null
+++ b/drivers/phy/axiado/phy-axiado-emmc.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Axiado eMMC PHY driver
+ *
+ * Copyright (C) 2017 Arasan Chip Systems Inc.
+ * Copyright (C) 2022-2025 Axiado Corporation (or its affiliates).
+ *
+ * Based on Arasan Driver (sdhci-pci-arasan.c)
+ * sdhci-pci-arasan.c - Driver for Arasan PCI Controller with integrated phy.
+ */
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+
+/* Arasan eMMC 5.1 - PHY configuration registers */
+#define CAP_REG_IN_S1_LSB		0x00
+#define CAP_REG_IN_S1_MSB		0x04
+#define PHY_CTRL_1			0x38
+#define PHY_CTRL_2			0x3C
+#define PHY_CTRL_3			0x40
+#define STATUS				0x50
+
+#define DLL_ENBL	BIT(26)
+#define RTRIM_EN	BIT(21)
+#define PDB_ENBL	BIT(23)
+#define RETB_ENBL	BIT(1)
+
+#define REN_STRB	BIT(27)
+#define REN_CMD		BIT(12)
+#define REN_DAT0	BIT(13)
+#define REN_DAT1	BIT(14)
+#define REN_DAT2	BIT(15)
+#define REN_DAT3	BIT(16)
+#define REN_DAT4	BIT(17)
+#define REN_DAT5	BIT(18)
+#define REN_DAT6	BIT(19)
+#define REN_DAT7	BIT(20)
+#define REN_CMD_EN	(REN_CMD | REN_DAT0 | REN_DAT1 | REN_DAT2 | \
+		REN_DAT3 | REN_DAT4 | REN_DAT5 | REN_DAT6 | REN_DAT7)
+
+/* Pull-UP Enable on CMD Line */
+#define PU_CMD		BIT(3)
+#define PU_DAT0		BIT(4)
+#define PU_DAT1		BIT(5)
+#define PU_DAT2		BIT(6)
+#define PU_DAT3		BIT(7)
+#define PU_DAT4		BIT(8)
+#define PU_DAT5		BIT(9)
+#define PU_DAT6		BIT(10)
+#define PU_DAT7		BIT(11)
+#define PU_CMD_EN (PU_CMD | PU_DAT0 | PU_DAT1 | PU_DAT2 | PU_DAT3 | \
+		PU_DAT4 | PU_DAT5 | PU_DAT6 | PU_DAT7)
+
+/* Selection value for the optimum delay from 1-32 output tap lines */
+#define OTAP_DLY	0x02
+/* DLL charge pump current trim default [1000] */
+#define DLL_TRM_ICP	0x08
+/* Select the frequency range of DLL Operation */
+#define FRQ_SEL	0x01
+
+#define OTAP_SEL_MASK		GENMASK(10, 7)
+#define DLL_TRM_MASK		GENMASK(25, 22)
+#define DLL_FRQSEL_MASK		GENMASK(27, 25)
+
+#define OTAP_SEL(x)		(FIELD_PREP(OTAP_SEL_MASK, x) | OTAPDLY_EN)
+#define DLL_TRM(x)		(FIELD_PREP(DLL_TRM_MASK, x) | DLL_ENBL)
+#define DLL_FRQSEL(x)	FIELD_PREP(DLL_FRQSEL_MASK, x)
+
+#define OTAPDLY_EN	BIT(11)
+
+#define SEL_DLY_RXCLK	BIT(18)
+#define SEL_DLY_TXCLK	BIT(19)
+
+#define CALDONE_MASK	0x40
+#define DLL_RDY_MASK	0x1
+#define MAX_CLK_BUF0	BIT(20)
+#define MAX_CLK_BUF1	BIT(21)
+#define MAX_CLK_BUF2	BIT(22)
+
+#define CLK_MULTIPLIER	0xC008E
+#define POLL_TIMEOUT_MS	3000
+#define POLL_DELAY_US	100
+
+struct axiado_emmc_phy {
+	void __iomem *reg_base;
+	struct device *dev;
+};
+
+static int axiado_emmc_phy_init(struct phy *phy)
+{
+	struct axiado_emmc_phy *ax_phy = phy_get_drvdata(phy);
+	struct device *dev = ax_phy->dev;
+	u32 val;
+	int ret;
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_1);
+	writel(val | RETB_ENBL | RTRIM_EN, ax_phy->reg_base + PHY_CTRL_1);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | PDB_ENBL, ax_phy->reg_base + PHY_CTRL_3);
+
+	ret = read_poll_timeout(readl, val, val & CALDONE_MASK, POLL_DELAY_US,
+				POLL_TIMEOUT_MS * 1000, false,
+				ax_phy->reg_base + STATUS);
+	if (ret) {
+		dev_err(dev, "PHY calibration timeout\n");
+		return ret;
+	}
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_1);
+	writel(val | REN_CMD_EN | PU_CMD_EN, ax_phy->reg_base + PHY_CTRL_1);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_2);
+	writel(val | REN_STRB, ax_phy->reg_base + PHY_CTRL_2);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | MAX_CLK_BUF0 | MAX_CLK_BUF1 | MAX_CLK_BUF2,
+	       ax_phy->reg_base + PHY_CTRL_3);
+
+	writel(CLK_MULTIPLIER, ax_phy->reg_base + CAP_REG_IN_S1_MSB);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | SEL_DLY_RXCLK | SEL_DLY_TXCLK,
+	       ax_phy->reg_base + PHY_CTRL_3);
+
+	return 0;
+}
+
+static int axiado_emmc_phy_power_on(struct phy *phy)
+{
+	struct axiado_emmc_phy *ax_phy = phy_get_drvdata(phy);
+	struct device *dev = ax_phy->dev;
+	u32 val;
+	int ret;
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_1);
+	writel(val | RETB_ENBL, ax_phy->reg_base + PHY_CTRL_1);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | PDB_ENBL, ax_phy->reg_base + PHY_CTRL_3);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_2);
+	writel(val | OTAP_SEL(OTAP_DLY), ax_phy->reg_base + PHY_CTRL_2);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_1);
+	writel(val | DLL_TRM(DLL_TRM_ICP), ax_phy->reg_base + PHY_CTRL_1);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | DLL_FRQSEL(FRQ_SEL), ax_phy->reg_base + PHY_CTRL_3);
+
+	ret = read_poll_timeout(readl, val, val & DLL_RDY_MASK, POLL_DELAY_US,
+				POLL_TIMEOUT_MS * 1000, false,
+				ax_phy->reg_base + STATUS);
+	if (ret) {
+		dev_err(dev, "DLL ready timeout\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct phy_ops axiado_emmc_phy_ops = {
+	.init = axiado_emmc_phy_init,
+	.power_on = axiado_emmc_phy_power_on,
+	.owner = THIS_MODULE,
+};
+
+static const struct of_device_id axiado_emmc_phy_of_match[] = {
+	{ .compatible = "axiado,ax3000-emmc-phy" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, axiado_emmc_phy_of_match);
+
+static int axiado_emmc_phy_probe(struct platform_device *pdev)
+{
+	struct axiado_emmc_phy *ax_phy;
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct phy *generic_phy;
+
+	if (!dev->of_node)
+		return -ENODEV;
+
+	ax_phy = devm_kzalloc(dev, sizeof(*ax_phy), GFP_KERNEL);
+	if (!ax_phy)
+		return -ENOMEM;
+
+	ax_phy->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ax_phy->reg_base))
+		return PTR_ERR(ax_phy->reg_base);
+
+	ax_phy->dev = dev;
+
+	generic_phy = devm_phy_create(dev, dev->of_node, &axiado_emmc_phy_ops);
+	if (IS_ERR(generic_phy))
+		return dev_err_probe(dev, PTR_ERR(generic_phy),
+				     "failed to create PHY\n");
+
+	phy_set_drvdata(generic_phy, ax_phy);
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static struct platform_driver axiado_emmc_phy_driver = {
+	.probe = axiado_emmc_phy_probe,
+	.driver = {
+		.name = "axiado-emmc-phy",
+		.of_match_table = axiado_emmc_phy_of_match,
+	},
+};
+module_platform_driver(axiado_emmc_phy_driver);
+
+MODULE_DESCRIPTION("AX3000 eMMC PHY Driver");
+MODULE_AUTHOR("Axiado Corporation");
+MODULE_LICENSE("GPL");

-- 
2.34.1


