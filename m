Return-Path: <openbmc+bounces-1318-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMkQCWkShGkTyAMAu9opvQ
	(envelope-from <openbmc+bounces-1318-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 05 Feb 2026 04:45:45 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8241BEE5E8
	for <lists+openbmc@lfdr.de>; Thu, 05 Feb 2026 04:45:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f635w3skXz2xrk;
	Thu, 05 Feb 2026 14:45:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c007::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770262685;
	cv=pass; b=lDP0IGi3jU+L340oO+O0IJ5t1d6gDp/++4AmnK6e5CUM5rcLRczk6Hsw6Q6TNweY5dWv5W6l2OQhXXONRDJJKZuf8oQmaSt7dSp5fXqA/OazuLix90dsDeT+UpR5nltAwHx8sr9hSN26bEqhiZc6wsr2ttP5D5J+ixyD8HMMruS3kGRYKSw90bCi/SnHTrolGOKRCpknJRpdrucajZNuQDIVqgaoSxpp8yFsFFkZT05sX9heTJ5FCm2yGDa63URNCIe1YC7uLPtyC+qgIIe6S1/e1QUwfvCfnEPGJhprfw6q3zgjXFhtd03Wl0WfgcXcsjzNmyLqpJ196HWeNqSCow==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770262685; c=relaxed/relaxed;
	bh=qthNorh4E62As3YKekjPSbt+F1R+zVQmFk4X5+sekpg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R0Bj8qoJCvFjIUqZenBx5CrRCH+m1yhZM3cu2Zo99GUBP6/sA7wuaWzk1PDf/HAOJPvLKVanXobz2Jdub9F/CQU91ud7dr/t8LgJvOtFZpJyURSYDvr+YBeO+xTmFwdTllvkK03uel1H78K7Zsa0hnIlDZ92ZEE6ezkryAidNp7QT24yIWrm0r6Fr7dleko4Mj2a/yJ1AO+tTi74QXF54l+N67tHq2zWh871qaFSjyuXPwjONEfqa5THtJnZ/b/2+Eu9BUhjJC8hf2LuG+Xz8100FOJ1jL/H0RFkJ45h6BAeUvUdm83yZ9tYyLWyXRUrUadp0Lb+njT/FBuigQEq6g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=qkN7Iyro; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=qkN7Iyro;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c007::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f62x727FSz2xHt
	for <openbmc@lists.ozlabs.org>; Thu, 05 Feb 2026 14:38:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cw2tB38/9M5dwdMe5X+dZQHh3Gu1GJYJ02xvLfCIL7GTtFHxOu/HSJprKSbIrciKUXSizrdIAcSUukWhVFy/KQvOFASeP5U5oaShdZK8OBI2FNXGJ3/I8p+WQQkzmSjTEchWe8U0pkD63yg8Fn2XeYCMeXTsltt+DCxzFgfBI8jTAa8a2qMeWd9GCZrL0nLLDdkxp6AG5YbICuMJMHp+CNH068FzQHShDBk2qOAQZCuCwngGbPDApPNqpPVtGwE/NaNHwDWg77q2JZroRLKpjr0M0sfCuBb0wRWIPv8GwYkEWXxNyvELZGv5/ol7xsGFLLTjuh3fsh/9nkrHPa/wsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qthNorh4E62As3YKekjPSbt+F1R+zVQmFk4X5+sekpg=;
 b=fF3gXLh6xG1s3c2wXdkzIZErm4XUWA2JoKcQ3tUWJIOtnATsGo++CF2RTh3daX1MMNBV46+OI3spYi4fgE8AbL5d2UqgunSMl1bNJ3vc09tj6hOIqXSFnWuIkUbPPD+ZhoBHj/6XJUckK759UkoRkj5YYHy03K+v1BxkTF5D586VwCFLu8uDRRi7hv9d9IskejrXCKET3wmUXHts/7EIaVRMV4Lwq3B6eMirIs3wmO3O8g+5yAOLzC+/J/JI5i6hr3asnunDYd5EeP3mMR/S1HqLoW1ZSXbMsz2fIUdGb+gd7r+styKoq3kXdNhBZdhjOWzH3X/jskd9ACTmFoBxOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qthNorh4E62As3YKekjPSbt+F1R+zVQmFk4X5+sekpg=;
 b=qkN7IyrokvIJCiZL3oiB7zA7ql4BHVjNEw3NAEbHBfU6OF4RCAXPtASUk8PfNM6ad4xVB+gNeoyXJHpiFUr2juwuz0oQiDVwAFHmPYzFhJf8LRZH3XzH91izWjO3xVhkZIODATYuGmjbiu6gRxvou5Qrxk7mq7WJQrqAgcHv3zfIm8pn883sy5kY17Tuanl+IkYpOVCiSM62fX7pEpqIMQSbw6Vj1Ri1NSYO88FDihBD/oJuwMIvIPOPHWYvsKJ+pczwGL15EeQt+HowO1ACOU8eFlGK44RsbSzTyPc5KTTr8toN70TLT6jLNQlmtFz7Ir2XL5lsE4j3IzR3uC9LfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by SA3PR18MB5391.namprd18.prod.outlook.com (2603:10b6:806:2f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 03:37:35 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%7]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 03:37:35 +0000
Message-ID: <6c5a41f3-f441-47a8-a671-c15d7318d89f@axiado.com>
Date: Thu, 5 Feb 2026 11:37:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mmc: sdhci-of-arasan: add support on Axiado AX3000
 SoC
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, openbmc@lists.ozlabs.org,
 SriNavmani A <srinavmani@axiado.com>,
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Michal Simek <michal.simek@amd.com>
References: <20260109-axiado-ax3000-add-emmc-host-driver-support-v2-0-934f1a61f7c0@axiado.com>
 <20260109-axiado-ax3000-add-emmc-host-driver-support-v2-2-934f1a61f7c0@axiado.com>
 <d370870a-d4f9-4989-ade3-e2b26b2a1134@intel.com>
Content-Language: en-US
From: Tzu-Hao Wei <twei@axiado.com>
In-Reply-To: <d370870a-d4f9-4989-ade3-e2b26b2a1134@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0048.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::19) To PH0PR18MB4558.namprd18.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|SA3PR18MB5391:EE_
X-MS-Office365-Filtering-Correlation-Id: a16cf63d-a8d3-407e-34f6-08de6467e6a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|42112799006|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aE5OWnFNV0tNRk9wZStxZ0xlYlQyWW1YdzNnTDlCbmQzbTc0L3J1cDMvblp3?=
 =?utf-8?B?czVUaVkxdHgrU2FlR1FEL0wraHE0TUFxb1YybXN5aUdCbUxBSkpWVzhUbkkw?=
 =?utf-8?B?aDFTV1piQWNkTVF4K0FsK0NOcEVHQXI2NVowSktrUFBYNyt1bWw1dERNV2Zm?=
 =?utf-8?B?N2xXMW9EYlhMekJwbkQvaXlPcFVieGxEOTkvR3dmNE1mWU1PdkU0NHI0djB1?=
 =?utf-8?B?c2lNWERoMVdXcDArTWUyVlFHNjVVZXh0N2hDVStmMVNtcjNGUHNlWGxXNWFX?=
 =?utf-8?B?MWZMSW5yVTBUODh0Q2VpMW9JTG00UmZ0VmF3WDY3SW1BQXd6R0tGam5lZ2tu?=
 =?utf-8?B?eHlaSkFBejl1UmlUejg3Z3l6TW8zdWphaUpnZHB2TTVaK1Q1Nk5rbDZnMU5Z?=
 =?utf-8?B?bkx3anFUQ3IrbExsNCtvNE92eFNPZ2l6SVoxL2hMQWkxZVZudjFMZ3dLUkN2?=
 =?utf-8?B?K05BV1VNRzlleUk4U3pxa2xuczJlaWRuK0JpVCtRbVdTVWV6UUpjanB3S2lP?=
 =?utf-8?B?RCtQQmRPMWxCaGQwVnBtcTRvMVVhUkVGcUYyNEoxY2twbGpqYkgxMVd5MXpv?=
 =?utf-8?B?cUhGbzdub2hCYVNyNXBWR3F2MklqU215UVo0ZmdmOG11Y1pzNFlwSWhqcS9Q?=
 =?utf-8?B?cmJEVjVjUWx3QjJ2enhRYmJ5ck4zMHUzWklTTUNob2FobTZpWnZSNGRrbmRQ?=
 =?utf-8?B?N3dKY1NZMEt6NFBEaXA5ZW4veVJNOXBjT3g2Qmg2U0Rac2dPeUs2RVpDVyty?=
 =?utf-8?B?Y1QydExYaDlpd01pTU9pTHlkZVI3M3JEdFZ6L3ptaFdCVFN4VnBMYnd3ZnZI?=
 =?utf-8?B?T3pCa0ExSDEwWHpicE1GK2xuRm5VRzFqUFFVeEpjMlUwSFJYME9TTDc2SUdE?=
 =?utf-8?B?MlBkbVV3VGdkUFFYVlFTMXcxMFk1dkI3Z1dMMFE4TWJTZHF1RnpadXQzTG5D?=
 =?utf-8?B?c2dzV0lLY2dKbm1kZTBscXpDRW5YNCt4aVhQRWUzMHViNkNXakdmVkxJeWVV?=
 =?utf-8?B?VytpT25vb3BJT1U0ZTFlVnFhTFRBcGl5LzNtQ3hXVFZ0eWRCNFZ4bktJZE41?=
 =?utf-8?B?YUl5dEp1ZDZPcUlCRWR2MnZHTXp1KzB5eVlOaTBpZFFxaWt0SHloZFM2YWFh?=
 =?utf-8?B?ZVJsYTNqb2RqMHIzTkN4bzY2YTJVTXBJVFFHcDFYaTFxcDVkZURWMzFyTW5q?=
 =?utf-8?B?K1o3VlM4VW1YSTBWcGpIbUpuQkQrSi9WdFkwUjhEVXRkNUpiQ2JYUTVidjE3?=
 =?utf-8?B?OVoyOTZoTlNvcnJrVFJjWFl1MjBMMExzMnNKSDBIbUdKNStSNTRadFJ1dnJl?=
 =?utf-8?B?MHJBVk1HOU5pK1NBSVUyVG13UFVsMzk4cUlmcjBIK3RNbHJMdG02d0p0TTFS?=
 =?utf-8?B?WFdlenVGbWllYUpJdmxSK2lEQmRhbWdscUFSWTFta05yV1pOMHJvTGs1TjQv?=
 =?utf-8?B?ZjFiM0trb09BQzdyUlNKVEtXY0FScklPN3BiVm1TV3dCTUtWQXo3Ry9NeWxE?=
 =?utf-8?B?aHNEYy9RQ1dXSE9rK1BzaE1obnlPdTJHUUtydVZQM0xySTRUQXRZdGc1M0pm?=
 =?utf-8?B?NUtIUHpLanVaWUtpR1VFQjQydHVON2hnS08zSUEwM1VNVzdSTDdxSHV2aTNF?=
 =?utf-8?B?MVN4YXMrbDc0aFpydjI1eWVaTGpQdEhPNmN4OTFLNGZ2L0JTejhDRWRLYlp0?=
 =?utf-8?B?MW1jQ3NodU01WloxOVNNNkF1bTlnRXUwSDArZFRON0FiREFsUmY0SDYycThk?=
 =?utf-8?B?SDRyNnhZMElyWHNTK1pDUGJidWxhRjZZcXpTdm5iQ1NrNzNvdnhta2ljaWdF?=
 =?utf-8?B?UkwyM2swUlM2Vytka2laSVpBN2Q2Y1JKTkQ4a1VEMkw1RVluS005V29pSmZJ?=
 =?utf-8?B?SWNPM1pkdFFMazNmallTTjc3SndkV3JYSW5na1ozQVZKT01wNHFBRXdzL1R1?=
 =?utf-8?B?OG9FaUI4aGJEUlJOUUVIcTV1VmZONlVqaE5qaFJlWi8zOSszR2YxbFhLaGkv?=
 =?utf-8?B?d1BhaEt2aXJwYUlPUk9uUmZJZnVtcEFuTVM4RzFSNFpHVWcvTVh5UEU0V2VN?=
 =?utf-8?B?aUhMOUpsZXJBYzUxc0pibjVsakhuQ3ZkSUVwZnJUR2VhOWJlZ0dWSU03ZGJK?=
 =?utf-8?Q?nMDw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(42112799006)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGJZazFOMEk2ay9TdjZMNTkxRUc0UitJS2ZjKy9lM2hlWnBULzdXWDNaTVlY?=
 =?utf-8?B?STlva0VWMWR2Kzh6aWF5clBLSmg4TmhOUFp5dUtNWFJDcWx2UUZ5ZWlaWVhl?=
 =?utf-8?B?RVJKRkFVNlEyV1UyUGhxZFVEL0xCV2VIUmJIZDhHVU04QTAzWXpnWjNibVRv?=
 =?utf-8?B?ZXN3TVVJSEpzM2JPZHBFZGl1VjFCelBTKzVZakVqQUxFVDFtYmJmNjU1SExK?=
 =?utf-8?B?aUNIR2orM2tzUmRkY3Z6MllidzRIT1lXd2g5Rm1hSlVCdWRGNXRJc1BJeHJN?=
 =?utf-8?B?VXBqYWVkNXF1OEtlSHdDYWtKN1Q2OXZqMktFV0hUVWJWZ2pmQ3lqT1RVR3NY?=
 =?utf-8?B?K0cxb01oekZMdlNpbWhLOHZGSTdpeGpYa3QzN1VXWDBWY0RtdVhoR1d1RGZi?=
 =?utf-8?B?RDBpQ240MUZNa0k4THdMbmhqb2NNeUkwaGNBZW15dSswYm00d3N0S3J0TTA5?=
 =?utf-8?B?ZW5vV1NiZzNmYTk1Z2ZzMWd0MWJkOVQwNlBqVjZOdnZQWktOa0k4Z3RlRnlO?=
 =?utf-8?B?MEN4WTZsRHZxbnVCUzY3aDA4eGVMVXBDL2tEZkM0TmpvR3ZYb1FFRXNDN1Fs?=
 =?utf-8?B?MmZORVpKdjN4MUEwOFVMMmw4MHRkOVoxSmxwQ3QrQjBWdzRxVHhqUFFXdWRL?=
 =?utf-8?B?V1ZPdm5ZZjdCRmZxTzc1VmtOL1AvYk02eWZhcnBXSUxBNm5SRzZBZHRCbDNJ?=
 =?utf-8?B?QUk0TW9uWkRCaExlUXhsNTYzR0tzZG84cE1Ua1FlZE9BdzhNRjNPc0VHU0lF?=
 =?utf-8?B?QUI4YnhFdDY0Vm5vN3dRaWRsMTQ0bFJOQkoxZTc4NlZqMll3azJZM28vaVp0?=
 =?utf-8?B?UDVWVkt3ZFhyWmN3VFRaNWZXVTAwVStDSlB4TzZMcVR2dDFBNFl3bWFaeVJB?=
 =?utf-8?B?N3pUcTU2TmdBOWJXTi94UjJ3SytYeWxSaEtCMUlhRFUxYm1QVXpybVNwK3VS?=
 =?utf-8?B?YzFEeFdGNnpTeEs0QklGcklKOFVHNXdmQXlPaFdzRk5QbXFFWDVRank3SVRE?=
 =?utf-8?B?aDBjWHlPdEVCQmJRVHdTRGIwZkVOay9CMXNZOXJzZktGeVMyVUpyQ2FTU2tU?=
 =?utf-8?B?OTVIb2ZnRjNyRURSMkF3SDJ3RlNKcVh1dDd1dFdOR1hmemdQVXlLMmVwbEVq?=
 =?utf-8?B?MVgxZHpCQ1pibXE1bEYwK1FxbzlyWEQxcGlSZEtDa3YrSTg1ZTVuT2RpV21H?=
 =?utf-8?B?cTJHMjhXUFhDeEUrY1FJUEM5UUZXNEpJTVM1ZmtHVjZDMHQwdFMvbmdPOWUx?=
 =?utf-8?B?QllZaVNNNHVPTGMvYzdGVGVrMTRGVjlYNGNZYWRYOHdrUloxNW00ZDh3aDlD?=
 =?utf-8?B?TC8ydmhsSWREUGxuT3V4akN5djFZdS9VWWN3Y2tGNnUrTlRVTVFaUDdSL0U3?=
 =?utf-8?B?STVrbXVINkxWNVFuVGphV3gzNk96b3Y5TFNEU3oxdnZyTU5ydDJpMnhGSnVC?=
 =?utf-8?B?STNPSzJEb0F5N1ZyN2xVUVlURzlPS3d6WXgrZmp4YUF3dEFmRkJZQW1iM2Ji?=
 =?utf-8?B?cCtybDZFNU9CK3J2MGNheGhCVVVqazIrUWY5bVdMb1oyZFhGdk8xMU5KMnV2?=
 =?utf-8?B?QjA2V3FLZDhRWVNHcm1BWkdXYjBhYVVqY2RLaUZjMk9vTlpvQmRPc1Q0alpo?=
 =?utf-8?B?TWhRa2hRbnRMdlRrM0JKSlhTeVNmTFg4NVZsM3JLZTgyeWZkM1lMclkrRTl2?=
 =?utf-8?B?SzJsZ0srSEFtUnVpMk5STWZXWW5DV3NjRUJCV01JZ2p5RS90Q2JwS0xZOFZl?=
 =?utf-8?B?QzNiZHFvdzUwMmRDQTdaaTdoK1BIZCtWSHUzV25KYlY2RDFQMm85TUp6QjQ2?=
 =?utf-8?B?Q1dZNVVHRHozNmdHU0tiR2ZIKzNHVHdXQndYZVNLY2FzLzd5aldaR0F2UFBJ?=
 =?utf-8?B?WjlPWkJZWExJd3ZLcG5JMk9RZVh1bDRJdUhYZ0lqbXRIVm0rR0o0VUU4Ukxi?=
 =?utf-8?B?ZzI3S3NIWFRYaWY3MWVURis0My8xNllEbGN0ZUQ5Vm5mT241RVpnYWdiNmN6?=
 =?utf-8?B?aldSNHRtejV4V2JXalMyNXgycCtvNy9MRlVWYUV1OXFxR0pDZUhFZkUxMC92?=
 =?utf-8?B?czJhYklVdlhwQWNUQmlnTmlSRURyKzlWT0VobGFSRThyL0dNc016YmNPYXAv?=
 =?utf-8?B?OHFwaGUwYlNEUXZRaEdXM3BSWEdPZXRpOGNHcHFBZWZwNTZMVHZqdTJnL01m?=
 =?utf-8?B?Njc5TnZLcDAwSW1ILzZJWDBqU0hKTWxyNmJLZzJZb0gwcUJUWFFaK2J3R1hO?=
 =?utf-8?B?SDNWanhBdXRLWnprcmozU1hGc1RjWFRjQ1MzbWFVZ3A4RE5UZkdkSTdpZEh4?=
 =?utf-8?B?SCttNHU3Wng1UG1QUzYrdlB4enpQbWt4YTByZENXUHd1RFNIZEwxQT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16cf63d-a8d3-407e-34f6-08de6467e6a3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 03:37:34.9842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBiBA6ym9/rOvEqzsvxX1Dfq4xK3Pc38MTs0AK0IhlJNLkDttX20Ra+trFCU2afX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR18MB5391
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.20 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[axiado.com:s=selector1];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:adrian.hunter@intel.com,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:srinavmani@axiado.com,m:pbolisetty@axiado.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ulf.hansson@linaro.org,m:michal.simek@amd.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[twei@axiado.com,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DMARC_NA(0.00)[axiado.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-1318-lists,openbmc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[twei@axiado.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[axiado.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[openbmc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[axiado.com:email,axiado.com:dkim,axiado.com:mid,intel.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 8241BEE5E8
X-Rspamd-Action: no action

On 1/12/2026 4:23 PM, Adrian Hunter wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> On 09/01/2026 11:46, Tzu-Hao Wei wrote:
>> From: SriNavmani A <srinavmani@axiado.com>
>>
>> Axiado AX3000 SoC eMMC controller is based on Arasan eMMC 5.1 host
>> controller IP.
>>
>> Signed-off-by: SriNavmani A <srinavmani@axiado.com>
>> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> 
> Apart from dt-bindings issues:
> 
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> 
>> ---
>>  drivers/mmc/host/sdhci-of-arasan.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
>> index ab7f0ffe7b4f007a58eb0a26868b08b0b02b40f3..5da915edd7416ab5c725a784867098c5e19236b6 100644
>> --- a/drivers/mmc/host/sdhci-of-arasan.c
>> +++ b/drivers/mmc/host/sdhci-of-arasan.c
>> @@ -1512,6 +1512,16 @@ static struct sdhci_arasan_of_data intel_keembay_sdio_data = {
>>       .clk_ops = &arasan_clk_ops,
>>  };
>>
>> +static const struct sdhci_pltfm_data sdhci_arasan_axiado_pdata = {
>> +     .ops = &sdhci_arasan_ops,
>> +     .quirks = SDHCI_QUIRK_BROKEN_CQE,
>> +};
>> +
>> +static struct sdhci_arasan_of_data sdhci_arasan_axiado_data = {
>> +     .pdata = &sdhci_arasan_axiado_pdata,
>> +     .clk_ops = &arasan_clk_ops,
>> +};
>> +
>>  static const struct of_device_id sdhci_arasan_of_match[] = {
>>       /* SoC-specific compatible strings w/ soc_ctl_map */
>>       {
>> @@ -1538,6 +1548,10 @@ static const struct of_device_id sdhci_arasan_of_match[] = {
>>               .compatible = "intel,keembay-sdhci-5.1-sdio",
>>               .data = &intel_keembay_sdio_data,
>>       },
>> +     {
>> +             .compatible = "axiado,ax3000-sdhci-5.1-emmc",
>> +             .data = &sdhci_arasan_axiado_data,
>> +     },
>>       /* Generic compatible below here */
>>       {
>>               .compatible = "arasan,sdhci-8.9a",
>>
> 
Thanks for reviewing.
There is one line change in the upcoming latest patch so I didn't add your Acked-by.

Best regards,
TH

