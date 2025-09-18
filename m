Return-Path: <openbmc+bounces-660-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4147BB8726C
	for <lists+openbmc@lfdr.de>; Thu, 18 Sep 2025 23:35:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSTS12qshz304h;
	Fri, 19 Sep 2025 07:34:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758231281;
	cv=pass; b=j0gcDeRg/twopANSNWIgo087MjRzG5Gs2BFjpPnsZIcfYYTJ7BXtcUd/M9emH0vMF3g6Dfg8OLDZcFWMqeiu4X6/KGl9WaaYRgK39jO2nS7CnNd04AkXIzHsPnLCrXskIxHOsuS4jT3U6i9qxzG0IwpZ/OK5yL9NnUjthzcLoMgSmYjavNHRVjDky31guijlC5bVavnZn83Dlg/7LEDGKRxl8YDpPxKiaeKrHhMNG1wT+tOkGiTQ+9tUQeyXzwDPx2qwtcd3xVgL1IuIbnYFJFRAmwPPGrFAFJH6UaGdpEidSuV7e0OVQwGs+OhV8cnIiWx39mPjvTQRJfsKwvDhMg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758231281; c=relaxed/relaxed;
	bh=czxmxfmMYStl7l9ZZ+NVEm3f79dNcfixA/Rwkz6u+uo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=X7hmYcO3npHV0GkzgfNeAsiHSka68Wq2auUl2QwGXruxSjgGSnMkcG9SxI60+9GmaaIHQW4hi21LnRCF8PXZhZmSfvwhHQSCaQj0Pyya3qPKxhbK+WTYf5lJdQjl1TK0+uRLB1J1W+jqJW/GTjibAUCHyBlheDwWbJvsCKTDcijbVxZRt+U8NfBM6bN1sI51UHtEPv9zGei7ZVTvRMDvLNi+7MLzBXP6cpqjwx641ARqZxrjm/Z5eMHJldKA2ZUeMpmcyq6Ra4oHrf3CIhqVOmU3XmlCfUq6BC2nLi6nC6Y9rfCjfhfPPxL6aLTzNeGfvLGhlTeE/q2ZI12+6wBT+w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nWaOk5Mm; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nWaOk5Mm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSTS046vMz30T8
	for <openbmc@lists.ozlabs.org>; Fri, 19 Sep 2025 07:34:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8mmUFU5R4eZAsTyDH1cOTQo//ggmGplyd87qFcWwzEBZv9Y3JeRIUsbL4tfqtvbLKTHbiNytD1IfEv+MxeQpwPVCEbF9sPi4zh+dDRJ8xie1kCnGNpzKyjGHnw2Z414yebnfLtcq41w7tlnMxL6CUvtUWCTaktru1LYdLMEmnG0AophzKyoIZkQE3ZhJNpvD5/MBzT/8I8BXN2KFqO4I9cAgRhtmn4EYR5L3NQ30ySqJn3kEyzYmOqM9nziPPVV3LLkyzqCoBejVp9a0ZVY0ZVPoxBcIammskE5hvMY0kVCu3kfMsAdyUUOZCC/I16NF2X7DnhZtzHlsGaBxYU0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czxmxfmMYStl7l9ZZ+NVEm3f79dNcfixA/Rwkz6u+uo=;
 b=uWOiSnz80nhQNNcEQek8/cVSyyIRlrBEGeWiSZaVCTW5CCV6+UPHl4twyG3xqpnywik6JUMJszob2mGs89vEpxGTQTzv44KQF4ELIIvKizKv7JWEGzFGXfCR6zP6FlmDEcnnYSa7w2cvDg0i/LRoBxbB8oq4x7a14qtoXdkmT7vF9l4shVhnzM71+iHXYl4BnbGnSzDH/RQQxUrzstDyK3Fv8it59eLPQfxKW/JzC6GfssJoInASRKk7cSJ5sHiIN7x8bTCMndbe4TFcvIL2d1jiqfp10HqlmyiJsNhp46+0HUgi+XjccyOsXbBqsHJW9IP2/GLunotUYCuRLHasiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czxmxfmMYStl7l9ZZ+NVEm3f79dNcfixA/Rwkz6u+uo=;
 b=nWaOk5MmzND1H5mzJ4H9QEbTyfp2sFLZ7zCxa/EQMY63heM0tOuS2FfpObBNmA0e2F9C288qRFTpjW3J5t8YUMoyFsK9P9N9ZpUdUlKoDKX/70tTDUzNsjTvwka0+SCb9rfmeCNA1kfwmWUA3yihxp/aP4Kk5K6/M48SkNSHll/kdEh5PEC+j/IQyfB4fQu0a6YtvG3THPGdeE1u50XZ/RsX2dVLgGf9js6sm3h0zwerqyOXJ2QiAHLhd/DNcZL1tfMr3je/qoe4xk/CRp/DzW0WEgxGt65d7+Oq5SB/VFkJp8K02d83qsBk+sGLMxRgj8U4lL05AeYKIBBslsa1WQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by SA3PR12MB8024.namprd12.prod.outlook.com
 (2603:10b6:806:312::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 21:34:21 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8%4]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 21:34:21 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Thu, 18 Sep 2025 14:33:51 -0700
Subject: [PATCH linux dev-6.12 05/14] net: mctp: test: Add an addressed
 device constructor
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-mctp_gateway_routing-v1-5-8fdedda742c3@nvidia.com>
References: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
In-Reply-To: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Cc: andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758231250; l=3190;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=HWNHlUqjSxf3+ifHMiEwrttp5eXYVdSMuXRxvJeCsFg=;
 b=ykLaBRJzj17u0KoCLHgX3lqjUFZm6vJeF/gMQVe3O/Ol4HGuDUbuI+PRmCIy3XGt7K0l9tJ+6
 eJNC7r4J9t1Cw13FA4lGXmjxbEZDBqtadl1nsrINZr64ha9L3A/GVT/
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4PR04CA0218.namprd04.prod.outlook.com
 (2603:10b6:303:87::13) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627)
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
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|SA3PR12MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a9d98a8-7efc-49a0-b4a3-08ddf6fb2102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3UvWnJLN2ZpTVhCbnk1N0t6YlRGcFR0bmp6Zk5ldWxYOHB1WlkrSUlDdW9k?=
 =?utf-8?B?SExGSkxTKzJPYVdDa2xwOWFTMEczN2llUmFyekh2RUNFWGZKVHV3VE13bzRN?=
 =?utf-8?B?WHRDUDRZalAzUkRKTVZtNThOem5iR2ZYc3oxdXhNcS8zQkl1aklkR1dsSmdJ?=
 =?utf-8?B?SE5mNjd3TjhhdWYyTXRMZng0U1lYTVFsRU8rVThyNEEwOEcrR2hIQkJlTFp2?=
 =?utf-8?B?ZDVxQnUzeGY2L1VJUXJPaW01VnlnT2M4bEhONzRHbm1MTzNFUHVReGdSeWdO?=
 =?utf-8?B?cnUraENPdGpVODVRT2VxaU9hNTZFdXhCVXdYL2k4ZUtseEpHL3lYaEgxN3d1?=
 =?utf-8?B?RktjSVl2ZmJiSVhjQlYrNDJJSFFPR3J4MGNJeDVZcExIRzlJS0ZILzAwWVJl?=
 =?utf-8?B?TWhvcFJHUUNXblY1V2pVeUhsbnRWY0NTTUlFNmROUmFSejdwdGxGQ1VxQm8x?=
 =?utf-8?B?dVorV0l3eStuK0FVbDIyazJXNGlhZ1doWVNBWlBIaHVjVmVDR1ZRV0pYcG1o?=
 =?utf-8?B?N0NNMkhJdURFanJDUmszUC9zZkFQekZwaG5YbEJDaCtXZVpZZ2U2UVprV2dB?=
 =?utf-8?B?Z3lLT1l6R0lqMnFGbHpxNUNQYmpRdVlKcWl5bEN4S2NQWlJVSjlvRTB0R1Zq?=
 =?utf-8?B?MFgvc1pnc0M1OWVuajJqNlMrMkFrWVF1VXlWaG9QdzNaSVNGTzEwdFpHU1BG?=
 =?utf-8?B?dnVqcGN1aUFvZ0g4N3A5ZVJjM2xBZkNzNDJaNjdnZVJWVElHRXYwVEo5WVVr?=
 =?utf-8?B?ck5kTDRMcTVQbncrbm1keko0QW9LUlRMTzJlQXM0MGlYUjVHS0daT2NwRHMr?=
 =?utf-8?B?RXVHejBDT01zMVlGeGxoalZKb2hndGM4dFNTZWoxOTdMQUxRRjh0Z0lGdGpx?=
 =?utf-8?B?V052Y3R2V3NHSzBuL0pGbTJmWWplN1ltWEpBcWRmODk3SzdXMThUR2FhV1NB?=
 =?utf-8?B?TTd6SmNDamZ4MWZEVkxFeWdReGI5V2lCVnpsS2ZlYVhUT0ExN0VVNCtwQWhq?=
 =?utf-8?B?SWt1U3h3TWxjYnduQ1BKMVlYQm90YXZENU8wTm45Y3hPaFdZY21zalJZZXE1?=
 =?utf-8?B?NmYwS3d5Tm45cFdRZG1pNUdGS3AzTkx1YUVicVBZeHpZbDdsa21TaVhQRGFv?=
 =?utf-8?B?TWpWL1U4Unkwdk5TeFpKVUExczJzbU8ycWZSMGdSTXNpVW1WZ2pGZXp1Nk5H?=
 =?utf-8?B?R21tZ1lJN2toOVQ3c2lmZWJKZ2gxbWlSaGhoMlJ0RHd3RE5uRDJqU2lodm9l?=
 =?utf-8?B?ZC8xY0JVcms1Q3VId21obDlPWEloSmFxa3o3b29reXYreVV3cW9Sb1ljKzZG?=
 =?utf-8?B?N1lqc3RQQytlaVEzaGdHbnR3d3Q0SjZ3aEd4emRoT2loTnJKNENpMEJ2M1lX?=
 =?utf-8?B?N1crUXB6RjlzOUFLb1JMY3ovVlpRaVlibmovaWI4elRldGtaeUZlUkkxOW52?=
 =?utf-8?B?dTFzeFRSZDZCQUZxd2JidHFHUUV0aS90NzZtbVQrMFRreW16OTU0dHhVbVkz?=
 =?utf-8?B?bWVabWo3TVQ2WURIeGQxZW00YzJuanRsUWZnaWxRbm4ybU4yb0pLR1ZsZkZ6?=
 =?utf-8?B?ZE9mcGZ6R1B1ZGZKUTk0b3hqVndWVklDdGZ5MVljUWhoRm9LSTdqRUJyQlps?=
 =?utf-8?B?YWtiZFBJOHVnR2F2NkViOTZwU1BSemYrWTlGZittbUhKSHdLWGNVenJvUG01?=
 =?utf-8?B?REpuV3h1bTAxZWNtdHNoVzQ1Mlhmd3BTRkJuNHh1U3FHSmhuRzdoM1VRMUZ3?=
 =?utf-8?B?WTNzZ1RVSWVYbjl3R3A4THFBOEt5SXZjbmdZTDJOc2hxMkxHTHBFKzhjeWJG?=
 =?utf-8?B?M3UyaXozQlRPR3h3bGt2OFdqWDgrWVZIcVhvMTM4RCtBa0RpZjZXOG9ZaEUw?=
 =?utf-8?B?V2VsR0ttTEVST3JJNUp6MVU2VnQ5N0VpME5kNUNSOFhtNHFLUGtpWkg0c1Er?=
 =?utf-8?Q?zuHfXN0OFLQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0F1UWRPU1Fvc0hvUUVTeEtsRU8xVnZ2eG9oTVVrNmdsK1ExN0kvWHAwc1c4?=
 =?utf-8?B?SmdoTHl6OXdrYklRaTAyU01sV0NaOGEyWGw1dUhPa1gvMVFOT3lxYmVFSXpm?=
 =?utf-8?B?Y2dTaW5HSnRld2ZyTCszN0YxSTZudWw4VjhaN3I0czAva2RqL0pvNGkxNmRq?=
 =?utf-8?B?MEdLMjFTcWtYRkwxTUhBUUptSTBVSlZxQXRobmpjZmUydHdiUGswWFU0dmVB?=
 =?utf-8?B?MnczNCtqWlB4VThiTnE2QndLTTMzaldzNlNsVmMxeHRjU2J3STcyTHpOcmM5?=
 =?utf-8?B?eUxGSlhEVnBOM3llUlNYZlh3OHc0WHVLR0NFNGxqS2FZdEthT2tENmpoa0hM?=
 =?utf-8?B?OFExSmo2c1dVNVZnNnFWSkJmZlZuZENUaXpaSzNkMTVmSjJCWUt1cXN4RjAy?=
 =?utf-8?B?SnJVQVk3b1FSaW1jeldreURiajJiTThiYWxOTnQ1amJCRlg1MXBkYlhIb3pT?=
 =?utf-8?B?VkxFN0h1SEsyT0hsN1pQelQ2NkJaL1pEZkQ5dHVrNjJ4K0ZUZWs3U2MzWGNh?=
 =?utf-8?B?Q1cwZUFuaXRldEZ3UTFnemlGU09peUFsb0IxYU51bWh1YVIwQTJKVHNhODd0?=
 =?utf-8?B?NHE2eThjbDlDbnR3K0ZXUXhjMkovbFBad2lhMDI4bnRIdWU1aGxocGNGdUF5?=
 =?utf-8?B?NWJ2cTVCQ05xWDJ2VTJJUC9zSUROTk1nbGFlVlVqSlljblcyNmcreEhGZTMr?=
 =?utf-8?B?R0ZPQ3kvSFVRaW84YTR6anQ0WXJXeWZwVHpOZWpNU0cwSlBkNnc3RGRDakxp?=
 =?utf-8?B?eW82T3A0dnNiWUZwYWQzTHFwSHd4RDYvcHFCbGQrUXJ5YWRzMnEyMzBHMW5r?=
 =?utf-8?B?aVI4ZXJIQUVVME0rUWxmQVl1clFPb3U3bllObHVVWmxsWUpIZlEyYVdhOW01?=
 =?utf-8?B?K3V6a1ZNTlRQL3hHa1dNeVNxTlJCNHJXeTBia1RqSVpXYkNWZTBtcUtHeEdG?=
 =?utf-8?B?MHpkUHNlNTdpNnJFc21mZWhxL2hqWmVmRllqTFMwTlhnNWxENUYwaEFuTjI5?=
 =?utf-8?B?NFUzY0lWK2g4QlJrYjUxRm51UmRsS0hBMGRsOStIQnVweHNXNnV2SkIyenBz?=
 =?utf-8?B?OW9JcDZvOGV6RnJ0c3laS000Z1N5d1lVS1gxYXZNTFpaRFIvbW1DRlFPODBG?=
 =?utf-8?B?UThMUHNRdnFodE9ZZDA1cGpRRGdWcTBuL2t0YzVRSVRkSm5aWWUzM3FlMTV4?=
 =?utf-8?B?TEFhWDVCcjNuTEFoZ0VhOHRCK3M4TlhJeUhiaks3TGx3ejMrNWtqYVBWRnFa?=
 =?utf-8?B?RGR3UkIwZDUrbU03R01xdXhIUEJseldCVGxLUCs4L1BWY1lka0xwVUNIUjZU?=
 =?utf-8?B?Rlk3bktUZEJuQzVLQ1crNkRSdTg1cmZQNTNLSXlVVTNwTkRNVmorSEVXOXMy?=
 =?utf-8?B?Z2dETEpON0JtRXlDMHZsbXR3c0Rtck1iT2VMME5VT3FrMktLUHZOQ1VWOWsv?=
 =?utf-8?B?VWNZK3FlcFJUQUZhZHhTeGFYRDkwU1QzcDc1UnNlNzBkR2VObytDWjFQNFN3?=
 =?utf-8?B?UExWR1ErdXpLcjBlZGNxYllCcGtjd2dYNjlic3pPVC92QVlIZDM4dzFPcjB5?=
 =?utf-8?B?VERuM0Z5Tkd1ZjNnSm9GaFFXcmt4SWk5NThSRUNya2dya2QzbXliZTZkeWwv?=
 =?utf-8?B?ZThEMUZEOTJJQWxRK0hIOXlTck5uSGZJU0QwN281QnNzMm9EZTc5andCTlF6?=
 =?utf-8?B?VmJwZ3N4b25zaEgrb0ZrN1lqWG4ySnN1Mit3ZUs3Q0YvaHdHaVU2UnNJSnlv?=
 =?utf-8?B?M1NoUWVNNzlMTGRmczI5WS9ob2JvV2tiWUVzUC9JRHBsaCtYa21MTkc4NVhE?=
 =?utf-8?B?cGFJYmpwMVlmL3BSK0Q1TFg2VVI1dFI3QksvdlYvZ2pwbiswZjk1V1I2amkv?=
 =?utf-8?B?S1dQS1dwZXdTdVBteURSakxCV0thVEVBSXVhUmYwZ0lBRVpsekRQZHdoSC9v?=
 =?utf-8?B?c2VKNHNrUmV4eWI0cWJRVEMrREVOdC82cTlYZmdRa2t6elRGWk0rdUgwZ2hw?=
 =?utf-8?B?UDFHR2xRRGdDUG1LTlRFazlSV2lrdHd6VzVqU2JyekNTbFRJd214cC90NUxL?=
 =?utf-8?B?MEFqVWhYcExKRHZYaUJ2TCt1bForbmZFUXRaOURHOGRBL04wSkhrM3JVWkxT?=
 =?utf-8?Q?j2NYy3D94KH130JeI7MrwF53L?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9d98a8-7efc-49a0-b4a3-08ddf6fb2102
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 21:34:20.9671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPpDNn4NVc2k7iTq0DkiSfB1t1oPNqSB+GiXTlHazmwliNDE/eRunuVr9xjU1AaJcuhJ6HfHPMjkBPDd4BM5eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jeremy Kerr <jk@codeconstruct.com.au>

Upcoming tests will check semantics of hardware addressing, which
require a dev with ->addr_len != 0. Add a constructor to create a
MCTP interface using a physically-addressed bus type.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Link: https://patch.msgid.link/20250702-dev-forwarding-v5-5-1468191da8a4@codeconstruct.com.au
Signed-off-by: Paolo Abeni <pabeni@redhat.com>

(cherry picked from commit 96b341a8e78272b70905a5ac8b01e0cb97ae07de)
---
 net/mctp/test/utils.c | 20 ++++++++++++++++++--
 net/mctp/test/utils.h |  7 +++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/net/mctp/test/utils.c b/net/mctp/test/utils.c
index 565763eb02114be8fd2a097fe0fe391d8f4bd2ae..26dce14dc7f246f03ff66e5b84274b33c48baf0e 100644
--- a/net/mctp/test/utils.c
+++ b/net/mctp/test/utils.c
@@ -26,19 +26,22 @@ static void mctp_test_dev_setup(struct net_device *ndev)
 	ndev->type = ARPHRD_MCTP;
 	ndev->mtu = MCTP_DEV_TEST_MTU;
 	ndev->hard_header_len = 0;
-	ndev->addr_len = 0;
 	ndev->tx_queue_len = DEFAULT_TX_QUEUE_LEN;
 	ndev->flags = IFF_NOARP;
 	ndev->netdev_ops = &mctp_test_netdev_ops;
 	ndev->needs_free_netdev = true;
 }
 
-struct mctp_test_dev *mctp_test_create_dev(void)
+static struct mctp_test_dev *__mctp_test_create_dev(unsigned short lladdr_len,
+						    const unsigned char *lladdr)
 {
 	struct mctp_test_dev *dev;
 	struct net_device *ndev;
 	int rc;
 
+	if (WARN_ON(lladdr_len > MAX_ADDR_LEN))
+		return NULL;
+
 	ndev = alloc_netdev(sizeof(*dev), "mctptest%d", NET_NAME_ENUM,
 			    mctp_test_dev_setup);
 	if (!ndev)
@@ -46,6 +49,8 @@ struct mctp_test_dev *mctp_test_create_dev(void)
 
 	dev = netdev_priv(ndev);
 	dev->ndev = ndev;
+	ndev->addr_len = lladdr_len;
+	dev_addr_set(ndev, lladdr);
 
 	rc = register_netdev(ndev);
 	if (rc) {
@@ -61,6 +66,17 @@ struct mctp_test_dev *mctp_test_create_dev(void)
 	return dev;
 }
 
+struct mctp_test_dev *mctp_test_create_dev(void)
+{
+	return __mctp_test_create_dev(0, NULL);
+}
+
+struct mctp_test_dev *mctp_test_create_dev_lladdr(unsigned short lladdr_len,
+						  const unsigned char *lladdr)
+{
+	return __mctp_test_create_dev(lladdr_len, lladdr);
+}
+
 void mctp_test_destroy_dev(struct mctp_test_dev *dev)
 {
 	mctp_dev_put(dev->mdev);
diff --git a/net/mctp/test/utils.h b/net/mctp/test/utils.h
index df6aa1c03440922c18eec337b220b8428d1c684e..c702f4a6b5ff9f2de06f6a6bfee0c3653abfdefd 100644
--- a/net/mctp/test/utils.h
+++ b/net/mctp/test/utils.h
@@ -3,6 +3,8 @@
 #ifndef __NET_MCTP_TEST_UTILS_H
 #define __NET_MCTP_TEST_UTILS_H
 
+#include <uapi/linux/netdevice.h>
+
 #include <kunit/test.h>
 
 #define MCTP_DEV_TEST_MTU	68
@@ -10,11 +12,16 @@
 struct mctp_test_dev {
 	struct net_device *ndev;
 	struct mctp_dev *mdev;
+
+	unsigned short lladdr_len;
+	unsigned char lladdr[MAX_ADDR_LEN];
 };
 
 struct mctp_test_dev;
 
 struct mctp_test_dev *mctp_test_create_dev(void);
+struct mctp_test_dev *mctp_test_create_dev_lladdr(unsigned short lladdr_len,
+						  const unsigned char *lladdr);
 void mctp_test_destroy_dev(struct mctp_test_dev *dev);
 
 #endif /* __NET_MCTP_TEST_UTILS_H */

-- 
2.34.1


