Return-Path: <openbmc+bounces-1204-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2AED2194B
	for <lists+openbmc@lfdr.de>; Wed, 14 Jan 2026 23:32:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds16s6GTpz2xqD;
	Thu, 15 Jan 2026 09:31:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c001::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768405932;
	cv=pass; b=LY+PQAQs0dPBY9dk60kDZBJSdlnCKt6AvdYSHQYm7oXpSvn8z3PTtjjQWoGnvJOyN9JRoYCJMoc+eHCmuTi+xYSrHEhw8+PdDwryN4yE7pkAhmYw2i6l9HJhQ/MdqRpO7IhjUuTSHnWomhTN1SPQh1UQ6rt5KBECu60TPV0R6rmcFaw8J6pGcLzRKSVLays2bZBodXQbb8wkYvKg12PE7qMdabOMiKOFZZuG9O7YXt1iodAuyKq2HC/+Zh7W6DcYlzMk4vLTyrzB2KPUfGUbJPgY4SZo6oQocnT0oTualzR9bFR7h4gfgj9ZLe9ND4v93s2y2E9s+VJI/Vw2CGVnTw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768405932; c=relaxed/relaxed;
	bh=Tn4VpkVI4Hj92Nu3lkFxjc5HEU4zfWLAVUiqWc+brgA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cwTo9jCTH7ZmMl0am3iQNvX4P0vx+WKUfFxlerzh4sU8+6jVBHyzlQpSuvDN541Lm8kxBP3gMk5F8HDdU2P9zxrfQjH2/zS+ZFdk7Qs0aBJssA6oJk/RZTvHq+/gJNDR26yShPd5CCvfnUOqJAlnqLUvzCYmL0ZU/ymNn8vgXliTrjsNPYBhwKM+gb6MOYnLfwso8T+4/ORZJFCQxcX5+tko3UeT0qZMVnx1mCAFQmvZEC4FhX/H2ohzJzsMEBsdO1cBZ4JOw4afe996KmO8NR3iCPyTpzJd8Tqe5YJcuAPxYO8NFFuqAifc8wXnUl3n59E0jSxJXJMofl92V6XvMA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Sow0NWFU; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c001::2; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=jonathanh@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Sow0NWFU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c001::2; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=jonathanh@nvidia.com; receiver=lists.ozlabs.org)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c001::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drrGL5kKLz2xNT;
	Thu, 15 Jan 2026 02:52:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pu1YY35iT95FvW1XhHJyT/021c+0dL8PBT7Q0sIBQfU/z8BYBtjOxW74GlQl+L8vb8qXIqlAEusmaM2sKgSz793c3d/GNcroHEikObZVmvdBT37lUqmsVPe1EBNTdKTllYbNH2GG6a0L1mpqYjfX+EK1NpG9QWydncklccz2rJxgXIYn6DWSL3upFndlmaTblyWnlTWknTQLnsadleb/lsxZSfWIVrmt6BbaucP1Zn6ulyelvg3hDJnU9vn8BZZ6SXGbw/afWKdtRUSAwMy3+2z/XVmSYa2j8boUonS5jWll40F8+fkxcYYCehjzADmJtkg9fA1O6K9viJZLOUKKQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tn4VpkVI4Hj92Nu3lkFxjc5HEU4zfWLAVUiqWc+brgA=;
 b=MaVXMx9a/ANnISRSyU/QIO4NwxOGWX2OEDlS/OxHt1F8d5eOiPKzSicQhiNQFQzbutAJKua0xOv/UcJoHyVpYEk+oNDQlLho/X/+RAgiLwLHYx911sJ3XDehIknPcMXH0mZWsxoWY1Lzb7esHpU4Cx1Iec4yKkip+zdyN3Smz0I4tvlsNeGLPJzacgjJzgaa1wdfDDz6Ul5XbyqVCObcpl576dP7udnBDLEyiIy/nN7iy9H4ekFY/yT7cTrRE+OOplGNr1BLQl//PV7SbPm78XkJHSBHPccV/h8GConq3wMl7mPSYZOmrFtI1FTWgtPNgzxKVawxs10fDer9cy5QQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tn4VpkVI4Hj92Nu3lkFxjc5HEU4zfWLAVUiqWc+brgA=;
 b=Sow0NWFUmoYJw5zuGgZr8N5D9QjB4h7Zyzli3kWUWyI+B6BM52/q+NwCQ2dr0Zn0KK7/edDfvpl/3MWb/ENncsjkLab13nvIyG0aIXRGLgINlUaY7+c+8aKj3ICrMUpaqbvZQ9Y8sCsRJtLTvJrIzs33NnSnF6dYZKTVNRP5fXV+9cNvJyF7FIv3Q0wx7Gz6cHmBtF8slg6ChHM5xKvuIdJBUzdJcyULp8Z+ZTiGfF2jHA0yYBKvvngYucIreFH+yMwSGz01TY0d3lKNvxhceyFw3CCN2nF9lFIIcLkKdJUwB6L1kynV16SFlf1s4fqjiFodAEBNvgRTqR6i993P0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by MN0PR12MB6176.namprd12.prod.outlook.com (2603:10b6:208:3c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 15:51:43 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 15:51:43 +0000
Message-ID: <af986bd3-0bb4-4888-861a-33fa09a7d139@nvidia.com>
Date: Wed, 14 Jan 2026 15:51:36 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] pinctrl: tegra-xusb: Simplify locking with guard()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
 <hal.feng@starfivetech.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Thierry Reding <thierry.reding@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
 <20260114-pinctrl-cleanup-guard-v1-9-a14572685cd3@oss.qualcomm.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-9-a14572685cd3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0451.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::31) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
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
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|MN0PR12MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d96c4ac-5fdc-44bd-1c1c-08de5384d06d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWdhbUpEb1cyaDF0akROU1lnSzlaYzlwRjVtRTJDQjlWWTRUblozODM3emxt?=
 =?utf-8?B?SFA4a0ZlL01kdy9GeWlITis2RUk3SDFtQnluVmoyR3FNTCtocFhoVE5Xa3F1?=
 =?utf-8?B?NUZlamk2aGRkRW1rY3VRQXh1ZTdibDJvR2g4MlJ6cmJrbFJOWVowbjRHVkhm?=
 =?utf-8?B?RGxnbHRRVE54cUgwN3AxM3JYSVdqam90c0YwMks0dDdtVmR2d0huVmwyWXdy?=
 =?utf-8?B?M21sRE04SndzUjVldG5ZdUhDclpsTVhtaTJjYlZST2JBTmNTU0g5TEQ2U09x?=
 =?utf-8?B?VHlvc2pFeVJTUnNIclVIMjFiZGhKNlFGejJEVTRYdkpkWkw4TEVOM2FOWlBD?=
 =?utf-8?B?MGNqb2liRzFvaExnT25vTUcwRDJHZGpJTWhOSVh5L2xMeWc3TzFTTnBwUVJj?=
 =?utf-8?B?TUs3QURDZnZXRTExYytHcU95U21VODFxaS9LRkdHTGtYTFJST2lrM3ZrTkxs?=
 =?utf-8?B?dGl3VE9VeWw1R3RmWG4zYVNydlQ4NmptUXRuUjJ1Tk45aHVmS29qRHpMdUNo?=
 =?utf-8?B?RUpxWEtYZDh6d1NxQnlsbzh6MkJFZnAxWXlsNXlTRDY5NUJ3Zmxld1BnRnEy?=
 =?utf-8?B?L21BSjJrbklUbm84a3VzMXJPV2NqTW5BK2EyWUZ3L3FhQ1NlU1dMUTErSzVo?=
 =?utf-8?B?SEFvNnppY2trWDBuZjNsTTlOcjN0d2xqaVJJRm1KVExSZDg1NmJzaGZWdkJs?=
 =?utf-8?B?RmJld3RGZFJZT2Q0WFVhSGJYNkFncTFzQmRRblV0UXRBd3JWMzR1OVl2em5X?=
 =?utf-8?B?bWFQMHVrWUpQeHJDZm8rUTJ3TlU4dFhxUUx4dC9rQ3h4T0JMaGNlSUZlUXE4?=
 =?utf-8?B?eE5kOWsvRk91Y1JhR1Q5WUxlaHBpazQ3bnNvRW42Ulc3TmdYY3BoVUJtS1lk?=
 =?utf-8?B?dnNBNHA5Zk9BaDdMVEZHaUZhL0NrWGQ1MDZBSnViMGlhb3ZCUlhoT2FuQitJ?=
 =?utf-8?B?ODd1ZDhYTk1EMEJvU0RCdnZvZmROYjZ1RzVTTXBHem5EdUhJU0ZLcG9jSDZW?=
 =?utf-8?B?SVFienZtUUJFRjBOdEwyZkphdWRDbS82dzBFUEdlVVFvNDN0NXRXWmpVTjMy?=
 =?utf-8?B?c2xHWmJEOE5PSi9UTWd2dmk3NlJhMG9UdzVVQ0RBbHl5RXRrSkRqaFhQN2Nw?=
 =?utf-8?B?VDF5V0FrNGJidGJWNjZqZGtJelVzNHZrMncrdHFLYi9YS3MwL1dyNHhBTGc2?=
 =?utf-8?B?VkhVdHkzRmJYYkpxR0g2eGd0M3g4QWFJMEhnVlpzVG1CRFZDM1cySnltVTNS?=
 =?utf-8?B?QjltU0tYUGpJYmFubytuSzg2TW1zQVp4QmtTeWNueiszZGRnckpBaGhUNjBS?=
 =?utf-8?B?N0Jkb1E2SWZ3Y1JSdTgzbDFTYUdNbHNIMnFid3Q1dFkvMStwK0djSm1Pcmdl?=
 =?utf-8?B?MlhLdUpjendiWnVNNUdUVStFNGtYZ1lBNE9zNk1kaktXcVlMRGg3YitkbVMr?=
 =?utf-8?B?WC9PeVFNN1lDdmdDSWVPVWRkSVh2bGNHSndreExjSnpnR0tUVGFKRzBqVTNq?=
 =?utf-8?B?UFBhZVV4MFJweE5sVUlTUHRlRXVBMitndDE2VTV5Tnp1Zk4yUXM4MVI5ejI0?=
 =?utf-8?B?SllqM1M0cjExMFRaQTNqYTJERytwWWs2Z1JHYmttY0RxOXNUOUYyNjdIZ01m?=
 =?utf-8?B?bjlFMmRLZkpHS1JjTTN0MUYwUDhrVUxVNUQ0bU9HSTkvMkNxcXJtMTNxK0du?=
 =?utf-8?B?dG5SVE8yOGh4OWtBeUp5RUdsY3c3WkkwUlVDZ1R2bUd6WGd1TnVxQ1JCZFJj?=
 =?utf-8?B?MGx0WmpERGRFTitVWktoK3FBajhUL0NsR3ZLSXlTMS9FcStoRjllcjh3Ynl0?=
 =?utf-8?B?Nmc5eG0rYkNyeG05bjB2QnNxcjdmQnpLZTR3dGpmUGs3L3NTQU00RkJFWkxP?=
 =?utf-8?B?STNnTC9SMmFJaEpPUUJ6RG1ibExoSHZNUnRvZnBtUUFNVklBQXFXTFUycitS?=
 =?utf-8?B?WGw0Qytod2NEelp6bUthZDhpd1VrSnJBVklwaUI4aGxPMk4rQ2RqaXhNZ1Ri?=
 =?utf-8?B?VDN2b0t2QlMvMS9KdENISGtpeElwZUtyeGVJZ2JYcUtZU3VmdWZodTFZZmJE?=
 =?utf-8?B?UWpvMjd4Y2dZZDVCVE9tNlBXTDVQbjVINExSTzZvT093VTRTTHl1S2hzc0oy?=
 =?utf-8?B?Ym5XSjZjRXZxVlE5cE5NREpUMnBlMSt1OTZQREUrajYxS05HNWhNWTRMaEdj?=
 =?utf-8?B?WGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dThXc2ZzTkZhS1BNYTYwMHhUMmZGN2laNVFHeDV4SmExdi9FWXEvaldzSHBY?=
 =?utf-8?B?S2NOUkFkWUNOOGpRQjVBTjZTcFh3UFcwa0hEZ3ExN29pQjJLWUEvWFZNeVJa?=
 =?utf-8?B?ZHdRcFJIVWs0QW9WQ20rb3VVdXFDaEtIcDFUd1ZsRVVJdGxVVmlCYlBzWCs5?=
 =?utf-8?B?NmhiUmNHUk02aG5JMW9SVCtWZXRPdW9sWVRNWXZyc0lnUFFabG5MUWI5QXJi?=
 =?utf-8?B?aGZOdXZDRUdVOEFtZG8rK0xCakN0bkwxbEpMRXN5TEFWSGNmeHpaSjlJQmdw?=
 =?utf-8?B?QWtIVUFOQ2VHLzhzY3EzZXc3QkpjTmZrTVMzdUI4MFMxSHZqY2o3Nm1vMW5v?=
 =?utf-8?B?VTU5c3VpOUMxTjVzZmZlUWxuUmNNZ2YrWlZSRmxmRVN0eUZvQXNsRmlrMGdT?=
 =?utf-8?B?cjYrU2lVU0l5YlhTOFpiV3ZjbC9BTzBMazdWK2ltOHJxdHdKekRPaitDSnJM?=
 =?utf-8?B?VFR4NmJrMytpeU5aQTFHZytXTlhFVmRmU1BpYmdWQTdWYnUxU0lXRnQyUFlH?=
 =?utf-8?B?dGU4QlVqbzVldzJpOFJqeFZHTkwvR0ZYN1NsMUlZSzMyTStoVGhiaWJGaTJt?=
 =?utf-8?B?cWpMQUluZVJsTHI2Wk5DMGlkL1p4VTcrckRFdnlpd3puZ0RKSFpta2lGQlRh?=
 =?utf-8?B?aGJEVjVsZ0RyZnhVV3lFblgwenplYXpDMlNHdWRkT0UzQ1pXVHYreEQwSWVp?=
 =?utf-8?B?a0xmdDl6eFdVK0JnbFFBeXVKeC9WdmMrN1JIRE9qV05DR0RUZFpDSm5NMElB?=
 =?utf-8?B?Mlg5N2FKL3JTakxEYUh6Q3hHSE1MUXpEeTRQTEJxNTZsZDEwQWYyUXVMOUd2?=
 =?utf-8?B?OS83TUFhcUVqZDRSVjFabmI5ZVRmeEgySGRUd0RlOUlYblJNOU9oc25lMkNl?=
 =?utf-8?B?TzczcG5GT0ZPS0pJQktqVXlxL1NYR2IzWG5sOXhKd1RIVXpQZ3hDSVpQNEIz?=
 =?utf-8?B?VzI0NHlqNXVUblpsTjVzU29CQjRBU1hLMkxPSWZLNmFHOElabk1MaDFJSEJz?=
 =?utf-8?B?S1lsNmpUQzIza0FzMXAwVVd2WXd6d0U1RW5OMGxoWTRnb3pGVzhobm1qYVd0?=
 =?utf-8?B?RWMyVFc2OWppUW1VOWpZRTMyVVhncUNpdXBKUFo0ZXA0cGJrMkUzVkdlSUZp?=
 =?utf-8?B?cm1zQmxMQTZMdFJRY25oYVNoNG15bnY1OFVzbG8zWDhmejdsd09ldzJsU2Ns?=
 =?utf-8?B?bTNJTmFxN2FpZWV4T0t6cDhDY1l0d2JMSytvcHl6ZVBTbzBSUTNGaWdpY0xY?=
 =?utf-8?B?UzRpQXV5OWl3RldQcnlqK0E0UlVmVkVpSE1mYnR2amNmeENEeUR4YTZhc3dE?=
 =?utf-8?B?STZVYTl0OVZrNGhsekl5N0tpaFQwZVIxVVlubG9YZ0w5aUN6eXVob29PRWxo?=
 =?utf-8?B?QjRVL0NoZFE4bjJsMEUrSFl3S1BybnU4a0F6VmFOSW1ZUjAvV0VKNkgwWEpz?=
 =?utf-8?B?NE5wVlEybUVFbFp1U05WcEk3cjV1eHV6SllOU3d3UjFvT3ozKzBVMGRvOFox?=
 =?utf-8?B?MGZuNHFuRUdQWUJ1Z3ZYdXNwMXBxZ3o4MU5XWmFVRXJZbVcwQ0dWdit4N3kr?=
 =?utf-8?B?RHphUlB0TkR2WVpicXh1Z3dUWmpnZHVJbTJlVThWc1lWbWZNM2RoVktkVUlw?=
 =?utf-8?B?NmlMWVZmVUxTRTlnZmtxZ2lFanFVWjFZRnlUY3BWdDV2WnVObE9uYXl4MSt0?=
 =?utf-8?B?Z3hnaW11SzlnRW1IbDJiaWFMOUt4ZEFZTEN0d3oreWxBSWwxUGNZc21vUTVJ?=
 =?utf-8?B?bksxK1pjdkM2cCtNOFpoZ1ZMQmpJZFJEU3dRL0Fxc1lPelJjQUZMT3c0Rll4?=
 =?utf-8?B?QmJvdE90SmtNY2lBNVNjWEw0Y2FSdFgvRWxPL2xiNjMzTm1LZ3JWaGdKUFlX?=
 =?utf-8?B?cXdSdUtXOFY5cDFPQmUzbHlMWjBuR1FFdXNDdThtbk5GZTNYclRRZEphTGZV?=
 =?utf-8?B?UjFndUh1c2l0Tk5TNjRoQnBPNEw5SXFLRFgxZEtSTS8wV2RJUTFaOVRycGF5?=
 =?utf-8?B?TlFnSEdsNmwxOEg1TFFYQ3Z6SmJDc21pdG1ZQTVSQTc2dStWUkRzWnFQSVlk?=
 =?utf-8?B?VzRqRDhucmFaTEREYkhqKzBadDBXbkpJTUx5TWkvNUVzVkRXZmpyMlVPa1RO?=
 =?utf-8?B?bXlDcHIyVWJOOTc0MWQxK1k1Q1JFTmFxdjVlL3g4ejNBb3RJdXNFRzBEa3Vp?=
 =?utf-8?B?bmRBbGU4N0hLaDR3Tk5WOFExV1B4QXlpVGdScTFySWlKdDl6TXBTRlpSR0E2?=
 =?utf-8?B?d0Y0ZGtTVkNjcnNhWDZOYXYyYTZTc0Npc2tia2NqK21WQ3REZHVsOWdZV0lZ?=
 =?utf-8?B?aDFTdEFzZTlzTzduUHZOS3dPYzBLMUNxNkEzdmVjRWJRdDRjbnM2TzczOG5j?=
 =?utf-8?Q?mTB3J/7K+TZL1dRhYKDesVls4XBNXvrhLxUwIkZXgT7EX?=
X-MS-Exchange-AntiSpam-MessageData-1: ZhMIU7ugv1QsOA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d96c4ac-5fdc-44bd-1c1c-08de5384d06d
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 15:51:43.2463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvUyfE9h7KxRuWBlZT9uNuqu7unK5ESbmwp1s/2Erzmwu6lul76WqxVeZFEdoccXPVX5l2tuNIE9RiT7XExjIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6176
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 14/01/2026 15:30, Krzysztof Kozlowski wrote:
> Simplify error handling (less gotos) over locks with guard().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
> index 34a373f7e04d..855f708ce510 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
> @@ -478,10 +478,10 @@ static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
>   {
>   	u32 value;
>   
> -	mutex_lock(&padctl->lock);
> +	guard(mutex)(&padctl->lock);
>   
>   	if (padctl->enable++ > 0)
> -		goto out;
> +		return;
>   
>   	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
>   	value &= ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN;
> @@ -499,7 +499,6 @@ static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
>   	value &= ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_VCORE_DOWN;
>   	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
>   
> -out:
>   	mutex_unlock(&padctl->lock);
>   }


I believe we need to remove the above unlock too?

Jon

-- 
nvpublic


