Return-Path: <openbmc+bounces-1127-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAADD0C9DF
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 01:28:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnzxm1j7sz2yGq;
	Sat, 10 Jan 2026 11:27:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.52.114 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767952063;
	cv=pass; b=CFggSYWEwQkkql98NKs6wtIzbbLiadbeGt0SUw6varycH74MJfroGox4ISMygoQREOlyUQxs2xs8bke+hu6oittNg4OXNQj9oLkc+Hu9PfTAI2Mz7sC3B9JME7IBeb7lziECSOkREktguLQvgUVie+HBLRlL2e8FyE9ugZKFbu75slqpQgTcdWN80Brj7cOFJ3u//XQn262tbtB8r71iK8Fqt6fcTzKfjRw7kJIpZkqkCL6RpyLZP6geO7hIdYPw80ImiYtFeNUqwkO+vWetC/j5FlE4WsimTMSMaHCZvProi/V7+OSN9OJTuOU+qA2kGgJ57nPFHCnVteIfP/EOpw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767952063; c=relaxed/relaxed;
	bh=OXJZWgUr52qkbZ0WNpW4tH7jGKr6+6ZxXy67fAWoKdM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=np20RfJX7Ye7JF9GmQ7tQxB/oFyFaruDH18oe7m5k1bjnrVVK/dIIMEpMIat4d97uVom78NWcidHbTnea8rtPeGxGvZ4lPT3oa0Xqi1Pe4ldZOlwxIl0uBsbEaUOSZd7100jT9jm+ExFsAN9w21sSBvhyIi9knxmOriwgb/ELZTnoug+18dniTV8Yk9XMJhR6nQaJfs55bA11k6X+s7DhpBcts5uWoGTLku2MVjHZ6ueXt7wcgbPar6khbfDLkTgHzRUGw8k6mrsw74niPF2brJWsJtyObPBEFauoOfGFPFUOqkV7tf8PS1dH8l4kC3VnPVMX8vZ0PgLkDug0H/v0Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=FCzvhjSG; dkim-atps=neutral; spf=pass (client-ip=52.101.52.114; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=FCzvhjSG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=52.101.52.114; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11021114.outbound.protection.outlook.com [52.101.52.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dncQ65jTrz2xP8
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 20:47:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1FzpskiUXs0gCRBUVeuGTX9HwcCxq2vSE8HcyghHK1B8ytmbWHswKgxg7Skz1WMwTIPwHcjyJZlwbUOkHj4bnwlg1GNX4T/1obkbRDZ95sdKVgkKlYVmWEm1PdK4yZs82JoIbPUDBa0BL278gecsioAPd4zoD9oYktTUUASvlOEZ34j17Kbqbw7KJdG0wNR8T2fpUriDJev+z9ADAR8O7SUlJu/hlft3UASh9HDRkf2ArpJ8AeuUMv4hI7KVVnLc2vr1rFVQHZ2S+CHpl5+1ardx8YiK4U7Q255aR1KabQqk5OXnvYOKKNtm5ZnQWXm5S+eJqJosdWkLHxKWcSxuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXJZWgUr52qkbZ0WNpW4tH7jGKr6+6ZxXy67fAWoKdM=;
 b=H2TuA+9Wo7b1GyO0+QOsVOOi72LKWHc5BA3cIJ7hXjAAZ8WAW7ECZzIli0j2MMKT5zF2GbkVkEkonCjnQNXXLP1mXX3ReMfOAyBZcBzS44dWZJF1yLAQovenYahx2XzuIklp48Zx9cuv6o5Jd4KGDqXN2i0j69MW8gy3iRz77ovGbDrjpS8eyoeWIXpSd0l0Assgw3K6xSTdpjEuzGcAwSoNRm3G6feV1UL8u5XjraZnXMNbShRUrl2FpyTeDI4DB8HtmlnunkG8RPTmGLMyhhugY9iHatgOiH4DZUztyx/zkQSECehXjsbk5mqSlJWXKPUr2gIPNa0l6QNBUkqHuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXJZWgUr52qkbZ0WNpW4tH7jGKr6+6ZxXy67fAWoKdM=;
 b=FCzvhjSGDgQe7p2swYSiyexm3tnQqYWX5uDfWb32+SLnnOjThI96eYzAiSCJbVE13DBijqwMzNfHeEeMH5Z10QC84N6Q2Ovs7fQitvFVceZfyeuog3KdurweeXZBOextI3wBgMiaR+RDPKj6T2kARl0zXbbOA1DcMTUa2/6TI+dj9pBYAlM21I7tWJZlUZYy806bCjpZp3Elbc10KYiLelZARpvNeYRHEfrjc8hgY9ryVbsQEbb/aKFLNB/exqmioWNUwqoahWC7zXtGWqaiWBQjYfv3T+Gh7moWfkPgLR4P14+i0NC4NiYuDHzj1iPcSKwvJv4wGmXvpPajjlupeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by IA0PPFE0CDC467F.namprd18.prod.outlook.com (2603:10b6:20f:fc04::c48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 09:46:31 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%4]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 09:46:31 +0000
From: Tzu-Hao Wei <twei@axiado.com>
Date: Fri, 09 Jan 2026 17:46:25 +0800
Subject: [PATCH v2 1/2] dt-bindings: mmc: arasan,sdhci: Add Axiado AX3000
 SoC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-axiado-ax3000-add-emmc-host-driver-support-v2-1-934f1a61f7c0@axiado.com>
References: <20260109-axiado-ax3000-add-emmc-host-driver-support-v2-0-934f1a61f7c0@axiado.com>
In-Reply-To: <20260109-axiado-ax3000-add-emmc-host-driver-support-v2-0-934f1a61f7c0@axiado.com>
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, openbmc@lists.ozlabs.org, 
 Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; i=twei@axiado.com;
 h=from:subject:message-id; bh=KqVaSA0SxIPP/WLkfIZdG/wk2jww0OvEZJZpXe7D0tg=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBpYM51judHQgLgu7LMiji3jn+RDeXp5cQhF0wVr
 oeKSAAk8cuJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaWDOdQAKCRB4EDBdxFrx
 166AC/wKuKQFiGohnNC3l/jvZLFC5XlQUpgN3gENIdPxZXJiye+LKNbzdKlRvmnC9bB7z5UXsr1
 VSDimEQQfR/fmYNwWQ9lEDTKGyzlDfZPaSYaibPYFXV4fdOo2cEnycvgfYBk/tDeN/idQ9xfsPl
 emojoGq7EePUAx5585xR4VYpvShO+YcLmF+aRYh2elQ7Y6SUMXr35rL+xatc2IiIjrFTnmrRGes
 IopX5CoJBPfP+vd3K+i9m34H8HOn1IVcxb3NZlCUe3y8p67PZ8oL0JrMFxE8YwbMA+N1EBEY9Ku
 IcfB1V3fEG+xV8QpONktQkBtsXjRsT0rZnWUYebM6esFAdl4A2xs5pvQZv41zuXVQ8zS8qy0M4a
 QFtJjVq8D96I/4qpfzeeN/Lr1GPV2gw1mydm07cqKwfRsWmAXXa4sQa0qpMP0A75ABYrgfRGTyL
 f+6ASMty1AdUshY5GUB9GBMU4bwe4mxLOQWsgzlCVbhMVe2SlmpVgmQa/jdaQXEbZhZy0=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-ClientProxiedBy: PH8P222CA0010.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::8) To PH0PR18MB4558.namprd18.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|IA0PPFE0CDC467F:EE_
X-MS-Office365-Filtering-Correlation-Id: f16a8e12-7e5d-4f67-15a2-08de4f63f79c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|42112799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c1MrWVQ0a1RRSGdCWDRYTlIralJVNDdsWFBPWFZuWE9xa09JR1NramJRalhq?=
 =?utf-8?B?NzZkRXdiZFdQSzBObVQ1NjUzT2RldHd5TG1qVU5Ea0VmQmljQmhZYkhpVVZK?=
 =?utf-8?B?dVNaNVhWSFlLMldKU21PYUxiSDZQdkJFZzlnTTNraUF5M1R3ZjJ3NUhjN3JR?=
 =?utf-8?B?TkhhNkFrZWlZaGlXNkxHSjZ5NWNveTZIZUt5OERSbTRKYmtsOVczQ0JGQjlH?=
 =?utf-8?B?NVZlY0ZoYmc0Y0YvZU9US3pxcHZ1MkQxTzNwWWRXSkVRZFdoZ29LaWFmTFM1?=
 =?utf-8?B?VE1uVlNvTUFqUTZBd083NDQ5cHp4ampDVDhzNTBWNjlMQlRJRDZ6QTJtY3lV?=
 =?utf-8?B?UHBzRHRNYWdkYWFVQnNDNmdWQ0JKVm9sbktxcWNKZ0pocjdVajVrNDMrVzJS?=
 =?utf-8?B?T21TbnRpOWpFYWR6dGJoZ0hncGx1YUhmSER0MFo4VXNvS2NJZnlrUVVZb1E0?=
 =?utf-8?B?V0x0SDlhSVIzLytYTktHY3RhN0hjRTFLVVE5Y05hTmtvclNzK2krWHNjRkpn?=
 =?utf-8?B?ZElUSzhzRHYwUUhWTlA3TFFnZWlpY0R6VVZtKzhqb25STDBmYXdvZlErR1dx?=
 =?utf-8?B?bUp2a3NYOXp5NFNMcU9XTXpNUWhuaEpsTTVIa2ZVc3JpanZrUDN0Y2NWSHZQ?=
 =?utf-8?B?S1E2TytWV1hkUVZGMzJIUm56cFlxSnA1WUdiK3Fsdzd5U01mbEtGSHdBOXJI?=
 =?utf-8?B?MW1DNWZiWkdaLzVGOHd3Ulp4TmxidFEreldYZ2Y4SE5xVEdOVU9tWEFBdjMy?=
 =?utf-8?B?NnVaa3M3Y0V3aExQL2tQR2Jrb25QYSt5NFlpd0gwTHdYVkNSWmozYUExVGhP?=
 =?utf-8?B?L0lJK0VtTUUvVkF3bDZyaWd2TzUzZlFZZWYxVit4aFp6Q1ZtbUYzZjlIWUxz?=
 =?utf-8?B?bC9uSnJ6OFlxTFB2VnQ5aythVVQ4VXYwT3djNDYyQlY1VkttNGFDZjZrcG42?=
 =?utf-8?B?NmRhWHl3alZrS2REVFlQR3N5M1Y4cjFESVhBeEhwd1JhUkFUd1BHVXA3eUkz?=
 =?utf-8?B?bEtIZUFqZXcremNtV24wQU9UV1hXTHpNYU9oLysxTGRJS0NMb3dudnNaNE92?=
 =?utf-8?B?UHNEUWs1VjFCMEx3dzQyaHQ4RzQvU0ZCZlZubWtQSmFtUmljYVFIVlU2aWpP?=
 =?utf-8?B?a1pmZlFJSGtleGpCUWk2aENpVkhXTTdmTGp6Z2J0OXM5Vi9PSXFqUW85czNv?=
 =?utf-8?B?VUVaSHhqMDF6YVErd0FJR0w5ZnppaWx2WXJCd0xiWTFmSXEzSS93d0hXL1Yr?=
 =?utf-8?B?amZod0o5VnNYUUttMFJDOVNQdjYwYzFybkpSemVQL2lnL05oUWhDUWE0WE1k?=
 =?utf-8?B?cis0cTg3YktOM3ZLa1ltNU9qRjVPZlZkOWMveERoWTFzT3krRzFBNnhSL2pz?=
 =?utf-8?B?Q1B6WWNleHUyc0VaNUFwNlBLT090UmIyM09GN2g5a3ladlkzQTF1UTFJWjBt?=
 =?utf-8?B?bjVRTStJcWh6QUpPc1g5ZDJZUnNKSjRxb0RLMG83Y1AxYmZJVVF4NXczbDFL?=
 =?utf-8?B?N09iMlBwaTg0THkycnlDUDBwNkgyWjRTTDEvbjl3dVpibjV5eGxCWmI4RlpJ?=
 =?utf-8?B?TGpaalpOMlpEamZuVTd4NmkxOERKWkY3bHRZelczcWJ4SlJlWVAreFFOOVJw?=
 =?utf-8?B?TnRTWFk3SzJhNE5pUUJkUXpvZFlDdlIzR29VY1c2VXoyNUh5T2cwTFhLWWFD?=
 =?utf-8?B?aHo2U0Myek1qMW13ZkVGcjJqb1lDK2NoOFFuOTRHK0RneVIrcERJWDN6ditm?=
 =?utf-8?B?U09uR3JZNjk4elRDZ1pBakZ3ZHU3TDgxVGpXMTd5aWdVRUlCRnBJNi9SSjVm?=
 =?utf-8?B?aWVxTzFmRUlEV2dHVC9CUXovQjh6cGVzenBQd3JjLytNdDVONHBxZXduOW5v?=
 =?utf-8?B?UEl2Y0QrSTd3eWVVamgvcG1YQUR0bnlkcmpxWFBLTCswc3BYTTRVUFNMQ3hr?=
 =?utf-8?B?Z096eWVpYVFWbk50NGswOHIwL2VmQkNnSndINUdVTzF5a2U4NVhLZTFrQlNB?=
 =?utf-8?B?MXlja2wxbUxZYkdibTQ0WDQ4SnNieHc5R2twc0VGN0RMd3FRL1ZQelhxUHpQ?=
 =?utf-8?B?MERTUTRFaVYrWW9aOWxlRE1uWlpmcnF5VGoyUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(42112799006)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkt1YWtBSWQ2aDliOVZJeHl3SVdDaHB1ZnRrNnhOd1ZzM2VsRGxwNEZqNEhP?=
 =?utf-8?B?NG9FUmIrdlFXTUd6REMxMUd4UVVoNlYrMUZ2bXFtYkJxaFJWV2VDUnY0ZWxJ?=
 =?utf-8?B?Z2VMNXdzMVVOdEk3Vms0citZSWc2Vkk4VFlDUmVWNUdYcGhydGdjbmE5dE1O?=
 =?utf-8?B?UXZTTEVRdjJxcTBtVzA5aVJ3bi9nMFg0VGhkUHVaSTQyZGVsVlJSUDY2M0No?=
 =?utf-8?B?L3BGYjlBcG96eGdrUlgySHZxandyMVpYWUJiaEdIRG90ZDQ3VGo5dHpPVUk3?=
 =?utf-8?B?RTVjdXBNSTBXaHp5RmdZNDhIWW0xdGFQc09kY1RzeHc0U09CWEc5M2RSTkh4?=
 =?utf-8?B?enNWQjJ2d2JaSDFUbmlkN0puYzY0MlRQQzZ3WlJKd0dkYVdiVktJMmFUclA1?=
 =?utf-8?B?TXh3MFQ0dGQ0NlZ2d3RvZXFuZ0JRR0VETzZTVFlSVkhIWFFwbk9scXZNaVZz?=
 =?utf-8?B?RHJFeFI5SXZPRVhmbUZWbHJjZEVCcEUrV04rY0tlZ05nUDFvMS95aWw5eXhD?=
 =?utf-8?B?T3Z4K1RmbTBZaHg0L3d2U3JSTDFWSVJZMmtkQytQN0hDUWpVMVF2alhhY3ZN?=
 =?utf-8?B?Sk4ycnVUb0ZSQlNCbFVONTdJU0dHR282RDZIVE9vQVUzOXgwZ1g4L0pIVk4r?=
 =?utf-8?B?MFQ1dWphZ3MrUlJTT05DZ1o2NHZweFNrY2ZtMjJ0RHEyZEVyL2RaR0lRVFB4?=
 =?utf-8?B?UzRoVGEwQmg2aVRsVWZOWEtsODJOeDB5eC96WXFYc21YcnZ6QkJ6SXdjSUMz?=
 =?utf-8?B?V0J2Y29VbGJSLzAvTFpZYVdhS3EyKzhiK3R2REcyMWo4aURvR3N0RC9meFRr?=
 =?utf-8?B?RmpleTdFUzZRWkJ0bkpyTTBQRVZhY2pDRE9tYitGOU9DMWVQaHhlTmNKcC8r?=
 =?utf-8?B?a3FVemhYaE93cXJUcGhoZmQwS1VnU2psZnRYemhTVUwzWklRM2VwN2NMQk1V?=
 =?utf-8?B?SURNRmFjY3RMdURuWE9QRzZ1a0J4a29tTFIvbW0rN0tHS3lUTUFTckpiUmw2?=
 =?utf-8?B?T2QwNDMxTXdSSllNRGdDL2Fqd0o2Q0lWVXF0WnVpb3QvK1o5N0xtc2p6NlZK?=
 =?utf-8?B?V0ZOei9RREdTY0ozSjhsMzN0aGFocThhTzZQN3lNRTZEbUpxZk96UE9TaExG?=
 =?utf-8?B?R1p2dnhHWVFmWjQ0ZEhFK05jRU9QN3RwT2FQWHpORUZod1JaWHVlUURVbFNK?=
 =?utf-8?B?aUdFOVhXK3BxcWlOZ2RlcTltbk92SURua1RtNUdRZHBtR3ZacEtBb2N4eG9Q?=
 =?utf-8?B?TFhzTmF0U3FQNW96QmZXMnpXRENRTkJnbHVLemxEQnJHcU91Wk9CZUplVkY2?=
 =?utf-8?B?MFdLRmdWYi9vMFZsTmw1bzZQamh1L05XR2JHMS9ZcGhTZXBTeEZ1NkNpTXBM?=
 =?utf-8?B?ZTNmZlpPZ1FxT1M4ZDVOZnNabWNjTkwwY1BFUVRtclBoVStRNmlUVEFJMDBj?=
 =?utf-8?B?SnFQK0RLUjd6VFNpR3NGakg3Q1RBOHYzNWs2TFREbzF2WHNIeXp2WDZydDRY?=
 =?utf-8?B?ZEdoanVrYXNxSXplWmpyTzQ3eTgwWnhYUmJDazdBTXd6ekpKYWlPRk90T3Y5?=
 =?utf-8?B?Z29DV0hpdmZ0Y2FTcnV1RE5WMlB5K3RyWFYraHJQU0tXMlV4Y0dOeXRhdWFk?=
 =?utf-8?B?dzJCZWZVS2FlN3VBMzI2SnZwRWdGZDZpdS94RjRCUjhESWNySnRQczVxM2pP?=
 =?utf-8?B?RjhpUnhxNDZPNURNNXR0V1VlTlFKT0s2R1JVUko5bktISS9kSlpaSkxKMDhF?=
 =?utf-8?B?VC93SUViZXJyODE3YnRoREZxN1pMVDl2Q1lLaHhuR0RYVjFBZ25xQ0ZKMWlK?=
 =?utf-8?B?UDJ2TExrZHUzRWNqZFJHc3U2cmlGdk5GSlMrRE9qeXdIZUZtNW5GeUNuTHZ1?=
 =?utf-8?B?SDVHM09NT3RJcUFqZit3SWZWR3JPcjJRRUN3YVUwR2s2VUQyQVdia0t1WWNH?=
 =?utf-8?B?d1k3UHUxajQyZFZ3Ny9NYVN2bXhVK3U4dzFlQjVKbzdoQ2VqbloxcGF4Q3lr?=
 =?utf-8?B?cUE3eGRqQUdzd3J4WTJ6Si9RS1dXOXdyZkxoVURjWExXZnk0SkhSR1l1Yjlm?=
 =?utf-8?B?SWRkRXllSy8zRkk5Q3RlVGM4a2l0TDFsSUgrL21KYmc0a2pSczNGdVB2aGZX?=
 =?utf-8?B?eTRYckxwNFFsUVlDcURlWU42NmwvbW03WFBNVVQyWnNZVGhialJjSTUycjNL?=
 =?utf-8?B?KzljMDI1WTIwNnRaVjlFRUNmTHlkSDkzMjBiUmxuYUVJNFlidDI0QjdMU2w3?=
 =?utf-8?B?VXZmdjFsN2pZR0RTMys0dTEvNmRlZitWQ28vQjRKVjZtOHk2Y29jaVc2Ynln?=
 =?utf-8?B?UUlZZCtVRytUc0FmSGRzWCtjTlNlc3k4clRFVGtidTRaeE9uc1p4UT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f16a8e12-7e5d-4f67-15a2-08de4f63f79c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:46:31.0225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Q4umHmx6/akl9ZSpBK5k5OxYuAE7EZs2f8AnDFsza8xmyk85+SRroMVxtaV2PDv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFE0CDC467F
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: SriNavmani A <srinavmani@axiado.com>

Add compatible strings for Axiado AX3000 SoC eMMC controller which
is based on Arasan eMMC controller.

Signed-off-by: SriNavmani A <srinavmani@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml b/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
index 8e79de97b242a698a2c555b0b94e2975b1761710..17dfe220503a6722b9ab446cb6e1aeed56099caf 100644
--- a/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
@@ -106,6 +106,9 @@ properties:
         description:
           For this device it is strongly suggested to include
           arasan,soc-ctl-syscon.
+      - items:
+          - const: axiado,ax3000-sdhci-5.1-emmc  # Axiado AX3000 eMMC controller
+          - const: arasan,sdhci-5.1
 
   reg:
     maxItems: 1

-- 
2.34.1


