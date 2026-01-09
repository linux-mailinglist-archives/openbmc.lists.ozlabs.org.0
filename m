Return-Path: <openbmc+bounces-1133-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A18ED0C9F1
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 01:29:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnzyL5m5xz2yS0;
	Sat, 10 Jan 2026 11:28:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.196.138 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767951871;
	cv=pass; b=e3sdMxG8uDEk+v9xNmFgB4pTuQFJTn7B/VeYtTYwnlQCGq4FI1711+wdrPB6iNC2pFeTJGS3gBlMl1VeveeZo4JqecgzWGmrVkmZwosai64qoBt9MR+xbdahR9QLiUPhGu8f5ONn2wE97wFJuoem3MpGFwjkRc58p/6bz2hJnfOkPbOXBWtIj5STNuKuPZ0IbqIqOo1mdMkkHcfDKwSipbASV8svd6tOqJdIakvG8lyVrlLbaskwFqBhkW81Wx48C1WuwXQ3moefNg29O9NNj6wG6QAnRHIQ0WFT2kBhazXQ7gGwK/R1mY+FP4u9GVXXi1Cf7jY75As8n4XTMKmV5A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767951871; c=relaxed/relaxed;
	bh=gE4F19iCmwIGrEaQmq4m1BhO7d3BAuXMdRz1njzFaZ0=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=oMP8rr2+rgosiUdW5m1xqhtfEeJH7jie51WFRkAQvmeeHTLc0KnXNwZJcMg+DqfZvO0Q/CzMT0zL3FK7MgUegMqLNOcwcPulkE8cooafmmbT2u0OGcQDJDFUNzKipjECKFc7RTD0DsjDSo44HXaCI32i/p6AqmDmA+H2XrbMZifCcLteZ4Fy+t6B7GsB2xKu0nuYQGDv7EcyWhgKQiBgqErejqWvSqttaGEV3+n6iN+NWxktTKGn6g8x935c78NlKrbV8zXAj4IX66tQzEHJrR4/sgp5qRCAeheS4MmG3mvIpht1b947qHOEbP2sLob7AdQnjvXbkHUAWPfCHhPXVw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=vkHGTv15; dkim-atps=neutral; spf=pass (client-ip=40.93.196.138; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=vkHGTv15;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=40.93.196.138; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11023138.outbound.protection.outlook.com [40.93.196.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dncLQ54D2z2xP8
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 20:44:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwujjUVsUfNDcKIoaXntx/WDjsmJdiKoTFzrNyNWW4sWrV6J1js/9NCIfVfsBtSMSWjBKnaLrrwlx1fXPESq8ZFLsJ5Y7xcVbYn255qSpaGGB5dRcy1tvRCba0Rb2dKPnLksqA7QBdf9X4JAOgao+BOxNGdIAggQ2d41iqVxTX4OYfBJ+1zlFRso5J/7fj77zgggk3EQ3PepZmpm3bNdrKZeH71LnEkTfndlu3OQfXJm/dALI+MD/BWoL7tIv4k8yOxzgAd8T/8zZvUDfWSdSoTJYQoDjvv/Rg4OFPR2kwBPFYcmi6Ds0GbuYAv9Q8IrKpnwW3eqTsk7ZOw46eeT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gE4F19iCmwIGrEaQmq4m1BhO7d3BAuXMdRz1njzFaZ0=;
 b=evO6zVlP10TtB7wN7V6mTkizuBQeFWoQA8XBScS1TsLfE6BwwWhHG7Dok6uADPI3QHW/BsrcZ09rq/T/QE4uJ7NRzxI/WX0RiNxYWTQZVVLF9+6fNQbmNvZ51af2RsflFcq4+Hp4jvMQh/saepLPmz9GP6+4QmtXnUAHX7ul/AfFulJBXGLhgxz1XhlQI8x04FlLDjFIN2ojxjPaynw9ie/oiBxvbtu17wo1a1BcoYDng7UD8ccQHZ5uBouU/I4SbgSRIT048vGxK3DoECWAVN0DHqoh/vkatohUiBt3wCUIsM1VFDiXf1daWqc/6nr+9HQ2OvwGVGcGbQBIoZNzRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gE4F19iCmwIGrEaQmq4m1BhO7d3BAuXMdRz1njzFaZ0=;
 b=vkHGTv15FaTNdksSoZot1luoINpQrFSTFuPoAg651UqM0CBS82B325OYCXwv1SveWL2qaSbv3Mjg07NLZNp8JKV4+qs3FTFSkf+tWYDidLCQ7UMacGUga2h5NwTYzsx0QZ/AWH8enzl/Q1kAP8ctiBDhEfXGErn/VXpZyFj8j40j+asrSF081z+T8dCV1E5w5n+L9OhLZE/GeRPlPf4A0g4xc8e1kLVcpMAhhFIrdvbEb2iHXBW/e7Bxax9qF3SHz6qJEKNroy2XtNTHAxmeSbZTuBb/jpHRHIWDovJXZdDblcdOQ2z7hu64XvxZfkRGi8d9rAInLbY3Pc7AX4d/Qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by DM3PPF538CF913C.namprd18.prod.outlook.com (2603:10b6:f:fc00::6a6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 09:43:45 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%4]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 09:43:45 +0000
From: Tzu-Hao Wei <twei@axiado.com>
Subject: [PATCH 0/4] Add eMMC PHY support for Axiado AX3000 SoC
Date: Fri, 09 Jan 2026 17:43:28 +0800
Message-Id: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMHNYGkC/x2NQQqDQAwAvyI5N5DdwiL9SukhmKg56C7ZVhTx7
 108DXOZOaGqm1Z4dSe4blYtr03Co4Nh5nVSNGkOkWKiQD3ybiy54UlEyCKoyzJgmQ8Ut00d66+
 U7F+UFFhZ+jHFCK1XXEfb79f7c11/FpvW2XsAAAA=
X-Change-ID: 20260108-axiado-ax3000-add-emmc-phy-driver-support-d61aead8f622
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083; i=twei@axiado.com;
 h=from:subject:message-id; bh=QGrG16U5icXs86XMV96pMKXEUgAexMaSH9vMQBrYe3I=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBpYM3NEFsTizZNzoyYT9IcUUP/dEZmJVcP3Xsts
 WNkbBi4Xv+JAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaWDNzQAKCRB4EDBdxFrx
 1+ozDADO+sYs4gLyZ6mqyi8ZdHM7I9tPB5WzHlitJ6ADtaN02x2Kxzn7wKbdy08t5vaq2GC+t8O
 B6GzMdoOI+kZk2JFq/v0pqyv/NmHM6W2LJm73NMBTyEa5ZcEkGtMxG06Mi1SxcOOYmjrzM4gYEX
 0c/t8xa0FzgRks3YkUljP/1HPhWg71tXCDQTeaDYg7NCnJ4bpGFFLqVuZAWKVgj5OsAJSOYigHl
 +aICPL7xucxARFB4Au4BUWb5tb0X3JrhI879McDHFricqEKZ4vmk9PC4Hl77nxHA6cHPWHrgO1L
 kp1gL2TeF4gFOQHm+5o8D+ZTQ9qSKIpd68JO2bu78gwEBWt26Z+hUpXTPhUvbkBaCFm2ac2EBqS
 1b2aE3Gos10tkwhBbWsjAUyEKQa6E3vLXm3Cq5O9Ta2VWu/0nSeKRUSGsl3M4H6GyT5+pOuO/7w
 EyaM88PUoao/ZfYwBgdcGg3MfiTDBZmVDFj1+IW0GGrw5E9u2LuWZivGqm6oXGGjYcdsE=
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
X-MS-Office365-Filtering-Correlation-Id: 4b12a3c6-50fa-4f4c-3159-08de4f6394b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|366016|376014|42112799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEFhOWZZMFFqZ05OVEl3R1IzcVoxMm9VOURNMkhMWVp4OTFUWXl0RmNlM0Ny?=
 =?utf-8?B?VzgvVWdXVHREWUorT0xrNWdFZFFNdkF4cXh6Wkt0L2o4YVJXSkpzRmJFK05j?=
 =?utf-8?B?Y0t3dW04MXlMU0l6aGFTenlHeDBxRHBnZjd4R2dGQU42TjRnZ0dYS0ZQTjAx?=
 =?utf-8?B?bGw0ZnNmb25iM20wbmdsS1prdHNsWThhT24wZzY0RXFmT0tGRzJOa25QcVZs?=
 =?utf-8?B?bitXNE5zaWZVVTd5ZkhRN05xUHBYdUxJbnhsNi9jd2R6eGlhRlFobzlTekJP?=
 =?utf-8?B?T2ZhQ1A0RTEwR0pkMWRLNjVVL3U5cFBMWVF5dVpYb1RYa25aTGxmSmdUQllH?=
 =?utf-8?B?VXdjYkFBRDVnUW1jQUdSM1Q5SE9zUHhhN3pLWVZZNmVwcy9QczAzMW5KdVUv?=
 =?utf-8?B?QTNJVkk0amtmeUJDK2tlYzdidHdWeDJqeTcyTHZadkhCUHUzQi9ndVFJUjAv?=
 =?utf-8?B?TlU4S09tN2xNZDNGWlhVUXl4SFE2c3pqVEdzcXhTTSsydC81Tno2dTdHMWhy?=
 =?utf-8?B?R05DN3Zrb0RWSGZzRFY1YVdHaURBWlA3RTM3QUFzT0RiT0xXMld1UytLYnZF?=
 =?utf-8?B?aFAzb2J0N1N5Sk51bWZuOHVRRGFpVGt0emtoMFVjUytiMzFzQ3FwdDZVWVhG?=
 =?utf-8?B?NCtvVk9QRy85WmFNTkI5RG9xa0IyQTdNYkdGNGVKRFNlR2ZkdkRkRlFJa1p1?=
 =?utf-8?B?ckdPZHFNeE1QYjhaL1RMWnRUeTU0N2FuR0FOM29hWjg3cE1sclh1QTU5VUFV?=
 =?utf-8?B?VUl1aGptajFNcHF6VEgrQm5nTFJXUENjUFNiOGMwZnN1ZjE1b0VOandSQ2l5?=
 =?utf-8?B?c3I0b2FkZ0NyVzFZSU16TnprUU1VUEFTK0l5ejU0QytmUFFZUGRwZndPWDFE?=
 =?utf-8?B?TG4wVmRPZE1senVsalVSV0xBK1dzd3RuWVMyUVNmTFJUak1Qd2U3V1ZHWlQv?=
 =?utf-8?B?cWxIbEkxc2I0Ny9MVTBMdHo3TXl2MjhlZ2RQMnk4Ym1kWHJjK2ROZjZxSW1L?=
 =?utf-8?B?L1o5b3MrSUdNT1NkcWdjMEc4SUk4djNXeDlQTkovK0I4cHBmSXBYTkhMRkZx?=
 =?utf-8?B?azlCTlRiMUlwS0swNWFXci9lS2c3ZzQ4c3ZoTUNxRk9oWnRlbFdxZE52TjNr?=
 =?utf-8?B?MEcwZFpxUUorY25wTUEzd28yTXY5MzVQaElnKzU4bUVaK2FrMnBEdmd0Uzl4?=
 =?utf-8?B?dmtjVGptNWpiTTNObktPc1RENjRtSnh1VnNueXZUL1pqVnY3ayt6TnUvQk9i?=
 =?utf-8?B?bjZJVW9lazN4UWphREFPbG9yYzhuWkVocWZacnlsdzl5bkVHSFFzM05pczFk?=
 =?utf-8?B?elpXMkJhZXZvSTBaT2lTQnU2c0RDaW9yMmczV2pkM1BSNHl4T3RNeDNjdUpr?=
 =?utf-8?B?RUExZnRlck16aDhXNElyYkd3V2tRU0x2Skk1R0JiN252Ym1jNUx0R3g4RlBh?=
 =?utf-8?B?ODArVEtEUGZFZ0dlUDZVMEtLdm9Rb3VPOHNZUWNxWk16STNDTzNzaU8wQndB?=
 =?utf-8?B?Y1pCQ1RYdW1LMGluRnRNQncyMTVEeVhVbWJTY3pqVUpOb3MzYmFUck93aW1l?=
 =?utf-8?B?cGMyZFJHd2RXZU9Pd2tGVzBtZmtkbWVxU0dRcFdRdzFCQ2dPVnF3bjJ4d1Ro?=
 =?utf-8?B?UWk5NEh5dVM4RWJoQ3V2WmJJNWZLSmdNTTdlaHA1cjkwMExHblpLWHdRVzd5?=
 =?utf-8?B?dXlVaXFnSVVqRmdSTHQ4MCtOaGh5WmFGTnRUTDdwSkZ1VysrNml3VmpzWFFn?=
 =?utf-8?B?anFJZ0lQSlRNeUlrVm9JZlIrYkgzdkNOYlR6M3BmQktWRmNvdWJvZnNRUGFY?=
 =?utf-8?B?RVZJZEQ1YWFqS0NZUW0ramNCc0V0Ty9GOHEvSEZaVVkrbzg5VDBFcktGTWgz?=
 =?utf-8?B?Q3l1aGcwR1VvZkRDdDduYmdFQzRkdHB3azZiOUtMeG1SSnJwYk1JcVQvdG5O?=
 =?utf-8?B?b0V6TjFsRFdNaVFlVWtzeTdFSzZIZzMwYWxjb0NMVy8yc3hBaS9zMnRwOTBD?=
 =?utf-8?B?OUpYdGU4ZVZTNVJLWDkzSi9pRUQ3SVhLQ2hmaE5HUmlTNUtUenBOVXVLN1Nj?=
 =?utf-8?Q?j88fQQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(376014)(42112799006)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3B5NysyNmZzclQxZm1wdmkwT0kyMGFuTU1nTHdiT0xSelQvNHBHdWpqTi9C?=
 =?utf-8?B?dFpQejhwNXFra0NXQVh3M1RycDkxR3F1ZmkvTyttUHVaamVDZ3RUV2E5TURx?=
 =?utf-8?B?SmRDSElyT3dOcXNvdndIWGtFaUh0cHB4N1NBU2RybnlsTjJFNzJ0MTdFSHVC?=
 =?utf-8?B?Mm1uaURlT2lhSEdYMXRJOFBCeUhWa2dzM0RFUmwrQ1l5SjJzaStMSkVmVmJM?=
 =?utf-8?B?YTVsam56NmxmK2pKK2VKWGVVRWNxUHcwTXVhNFZqVUhUbkZFa0tETkdhZnlF?=
 =?utf-8?B?VEcrOEN1QlB6OVN1dFkvUGxhUXVIeGZsekg3SXQ3bFFEaThXTXQ3dDBhNXN3?=
 =?utf-8?B?bTd5VFZNUGVFSFNHODZuREc3MUlRVVk1SWZaSEQ4NW50dmplN2dQU2k2N1dX?=
 =?utf-8?B?ZENmZDltRXl6VENHMW01a0Q4WmhTeFNsOVFYZ2dzalRBRmJHU1NhUDVYM1Qw?=
 =?utf-8?B?alhHTUUzd0g2Yy9MTWVZdGxJZ1QxQjJpNGNXcW84SHk2b3Y5bFNta0R5VlBH?=
 =?utf-8?B?MUh6U3kzdFBQL2sxRldtZHVKMjB5bHN6T01wMUZLNjZqZDE5TEJHSE95a1d1?=
 =?utf-8?B?ZXpxelJSUFJlZGhYUFF2akt2aFk3SG4rVjdvcE5tZTh0dzNLQnAycTJzM256?=
 =?utf-8?B?MzFITzl4M1pTVzhhNlNFYy9ucjQyNXRJMlJ4SWRJTU9aVEdnQkM0OWdZV0FB?=
 =?utf-8?B?NWN1RW5WZW5TeVozbkJNQXZiNjN2THNDRTJuNFVvdk9rdENDUEkzc3ZVd2VD?=
 =?utf-8?B?L3J3dGxiRW9TdndWeHc5dFFja0JqWmZUVVM3bFhFcStRaWNxNU1KUTBKTEJ3?=
 =?utf-8?B?eHY3VXgyVGNwUWs4YzBRTWh6QkZlY0haS2JobXpwWks3blFVT1M5WjJyUGh6?=
 =?utf-8?B?WDBsOU1xbDlxMnd5aCtKYXR5c0w1eXZpRUxiQXJ2MXZ3NzRLcUJaVzdXelJj?=
 =?utf-8?B?WWlLc0FhRjdGdTZMM1cwRnFPYXFSR0JtQ2preHFOVDRscGdES3dvSThJYW1p?=
 =?utf-8?B?azVWVnVYNDQ1d24wTFM2ZkRBeXozZUEwckNHdS91b2ttTlFrZ1pSZUN6RThh?=
 =?utf-8?B?VFVsWkdBTEg4UGQ3NnpBR2w0ajhreUFDKzBSekZWZ080V3U3TDE5WUFnUWhN?=
 =?utf-8?B?UG95NUFhbXMyOWpjQ3I0UGZRTm1uZWw1ZFNaV3ozM3hrQ012NkluTWh0QnpX?=
 =?utf-8?B?bHlLQytDY3oxOFpzT3gyTXRXVmNJU2FvUW5JbmEyVm1FWTlBK3JKRFNZTnZL?=
 =?utf-8?B?RDhKRytJTnZoSEwySUZMODlJWEFUY0xacCszM29Wc0x4WkNBa2ZzYmw3dzcv?=
 =?utf-8?B?NDJwNnpqYTBHcXE0RGRhMDJIUWlDYXBVZUwrRUh3dHlhZTBGN0RiU2dGVmM5?=
 =?utf-8?B?dlRhckhNbHQ4ajZtemNlQ3FZaTRxREFpV2JyNEJDTUozRW9aZ21aTEtEVDI2?=
 =?utf-8?B?Ym85Rk9oUTYvYVc2WFo1bDcxSGsySzBsVWNHc093bUIxMzhyb0Uwc3NzZk4v?=
 =?utf-8?B?VVRvNWM1MmZKZzRkeEJvcDdGaWhqUmdldENRdFNvb01adWdVRm9hY3N6MjBi?=
 =?utf-8?B?dlNwclR4RUxzRTJnRXYzb25UMXh2N1dCSndqWG5wWHU5bEhsejRhVnVOK0xz?=
 =?utf-8?B?VFFZY3JvNWhTWXNtT3FqemtLa3dxNlJRbG9qK0xYRTRkQ3ZWdTlzSzVnQVBT?=
 =?utf-8?B?Y290ODdPc0o1a3FPRnJYU2VNRXlIT20rZSttbGJqMzhNS2M4cTVKYXNKenRP?=
 =?utf-8?B?cnIxNWFINHowcTVZVTRkV2ZydWdjZGlxb2Z3UU5tR3hzak40VEtZcXZsdTE2?=
 =?utf-8?B?S200LzhqZThRcTZwSFhaRkU1WXI4QWJiUlNZd05XdlB5MGg2QWNpRzVyMTR6?=
 =?utf-8?B?L2h3RENCbVNUKzFWTll4dlVkTDhlekVNUStTN2tmS2RvbzdEUzVzRENyN2kx?=
 =?utf-8?B?NUZ3UTJIek91czZ6cS9iUVJhek90ZndhcjNobnJ2ODdndFpjaFgrTzArTHRP?=
 =?utf-8?B?b29TY0dyWmtSR1hENGJWZkJ3V3kzL0R2K1hxb3FOVXFsK1ZRcG1YR3lwR0cr?=
 =?utf-8?B?cG80ckxqZlZUY1F1MUhyRlY3VWF6SDlSdUVPeHpMK3hoME5hKytOcU96N295?=
 =?utf-8?B?V3RySnJIUlppaWJ0SFBsYlR6NVJ6bnFPcEVhdGNiSi9MRk5JMjgyUXlDbGtz?=
 =?utf-8?B?NkZKZnNtYzRtR3hOd0pieE5aRVA4QlBWcitEOUFTMSs4UU8yczFBSm41QWU3?=
 =?utf-8?B?MkRoRjh4RkE2YlJrRlBHUGcySWJ6alBKS051ZTEzWGFYU2lZb3FvampSaG9U?=
 =?utf-8?B?MWhON3NlOW82a1ZoVU5jUTJpS3RjSXNsVzBQYjlxNU1iSEF1VUR0Zz09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b12a3c6-50fa-4f4c-3159-08de4f6394b7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:43:45.1290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTO5okUeeKhqIa4MaDJUTizRitFKRWiCcuU1+n5NeInICWk9aqD0kaU2NED7EW5b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF538CF913C
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Axiado AX3000 SoC contains Arasan PHY which provides the interface to the
HS200 eMMC controller.

This series includes:
1. Add bindings for Axiado AX3000 eMMC PHY
2. Add Axiado AX3000 eMMC phy driver
3. Update MAINTAINERS for the new driver
4. Update Axiado AX3000 device tree

Changes: (The previous version was mixed with Host driver, so I separate
the PHY driver as a new thread)
- Fix property order in required section to match properties section
- Fixed example to use lowercase hex and proper node naming
- Removed wrapper functions, use readl/writel directly
- Replaced manual polling loops with read_poll_timeout macro
- Used devm_platform_ioremap_resource instead of separate calls
- Removed unnecessary of_match_node check
- Used dev_err_probe for error reporting
- Added proper Kconfig dependencies (ARCH_AXIADO || COMPILE_TEST)
- Fixed various coding style issues
- Link to previous patches: https://lore.kernel.org/all/20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com/

Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
SriNavmani A (3):
      dt-bindings: phy: axiado,ax3000-emmc-phy: add Axiado eMMC PHY
      phy: axiado: add Axiado eMMC PHY driver
      arm64: dts: axiado: Add eMMC PHY node

Tzu-Hao Wei (1):
      MAINTAINERS: Add Axiado AX3000 eMMC PHY driver

 .../bindings/phy/axiado,ax3000-emmc-phy.yaml       |  38 ++++
 MAINTAINERS                                        |  10 +
 arch/arm64/boot/dts/axiado/ax3000.dtsi             |   7 +
 drivers/phy/Kconfig                                |   1 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/axiado/Kconfig                         |  11 ++
 drivers/phy/axiado/Makefile                        |   1 +
 drivers/phy/axiado/phy-axiado-emmc.c               | 220 +++++++++++++++++++++
 8 files changed, 289 insertions(+)
---
base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
change-id: 20260108-axiado-ax3000-add-emmc-phy-driver-support-d61aead8f622

Best regards,
-- 
Tzu-Hao Wei <twei@axiado.com>


