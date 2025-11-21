Return-Path: <openbmc+bounces-932-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 045C4C7BA3F
	for <lists+openbmc@lfdr.de>; Fri, 21 Nov 2025 21:30:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCn0n4twhz302l;
	Sat, 22 Nov 2025 07:30:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c100::f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763757049;
	cv=pass; b=OzShGFuRH7L8qYgRbLRMOv9KwwM+l8xrpRgNCZc0lHvXu4UdzKzDkf9Eg7Bhc61bFEebxc/wy8/1men97vPCTjJGjyNLELbp1XB/6bYMEmgDQgaBWVIGA1vQBQ1XO9QdbNA2l1xrhNtQfjb0H4kmUWwnBm/3azU7xJy1M4G/WW3Jkcr1ZReyu3C0fJ7sZYh/TZ1RXdE397uwkyNBNn+v3WbtM9QCu3PcmzhdY0Z7MVfuRFAKUMt+WPlKVzZuwVmWLqk8dfOAzc4AOHJY1S8/v9qY0Z3YoSg+iXXdCi6XqzcXzIIwbNtJCmJ7H9RSpTQIspbPjB8Jpk5utmnDCxlEIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763757049; c=relaxed/relaxed;
	bh=XcyUXhMKNlVMfk6JqIMhPor9oKCVvpJakwGBQfTSZq4=;
	h=From:Date:Subject:Content-Type:Message-Id:To:MIME-Version; b=TBjKeuNpn4iPvQR8lIos8lGm7KVJqWqCc3felu3MoJjSgSDtCrHdmanplCxKXg4Ixcb3tTZzxKo7SHBua1PJAFqS/1U7NRCeE8JzuoVSB+f44AQBNn1YcIPKP9QNJu4W9Xvza+FPlPkI53+z2uizf2hSuXzhd5IJSZjKUnaeO2R9lTb9eMX6LMK/LVMR7fso80TxSXfo1o12mGnMHi6FSusu5tQGEpILSkjT8FkROUhsTGUrFsfKnzkau/zsOMox3enM52RPyMn4i7MTrwiaVqhj8ojd9pXuT361CP8x0skr8i89NPXh9Ng9GUkomNC7YbV3hFzHQTXBgdJhiMbLmw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oHL0Tkwc; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oHL0Tkwc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazlp17011000f.outbound.protection.outlook.com [IPv6:2a01:111:f403:c100::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCn0l3ZfFz302V
	for <openbmc@lists.ozlabs.org>; Sat, 22 Nov 2025 07:30:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SalKRjqohCqxPnt+LRbBy/an9OG7ZWMkzedB8kAXRfQyQHN0MaHUF6pz5zhjzaEEOzvb/nNGqsm/Jr4W3mtPU6vWGAZRF8A6UaIqau6GVAnuvJ31r2x7kPZ6ibVeegaTEn9ZtNZXWX0FGEkF+ESRQFwkIraE0e4d7C114X+496uJsWTd2Hkw3gN6PdFa/IpYewvar6fwKoHb8k6aUSN+AE0IKm2OVA7+j6/kXOVHrE8IPBKzuEQ9IF6ErO7THzisyfpBcRJgWY/cWh6xeZqjDxAvGa+dThbKPLxjeTnQUv/zys0cnnby9+EIPbGv3+ENfdqRL6vCbYIqhwy556BYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcyUXhMKNlVMfk6JqIMhPor9oKCVvpJakwGBQfTSZq4=;
 b=SQCIQ2G6+0gK9wgsCzAj6wCCXb6VLUfz5LqvL/H6wVvbGwcHCgVcPExyeHOF0dDazdm/zfs1867LwVHq/lHVApX5bHRgrkSYiqkRJtOVvOUM0WiZWrWCSGfX8zIZI3yfiFJch8Z4JWJp3ibkYNDz+z/605tE4xrDX+n/qMKfCSGttqskWlVyw/2xbKUZd1qcbjRRzK7YKEuNWN3p1H3sIKh47lqWKSPLZF2M0Sj8l+o3j7O4dLiCBNEhmAcdvEmw9AkUUhPbuZUw+qRMV78SsyawRTliH4ju1DLYvxsQhCRCOhsaoLXvoW+Pgj4jIo1VAk1tUDq6l5Iu1UsjPv6Ulw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcyUXhMKNlVMfk6JqIMhPor9oKCVvpJakwGBQfTSZq4=;
 b=oHL0TkwctNG0AU8PCTwuiIYaSi2DWXjU2gobFfJeqIT477sw/9EAk5dWnnQQs0rBR81gpHNNaX0Njn3WeVGsl22jwi6J9BJE7wbE57ITJy4bLgwt21J5JaDwj+cYBDa4iHv7nP2LXcR+tXzIPLd3VKGWBYY8rNrPeSmNQH+OrRsn2+ekb4oQ7MZg4q4FUmG/KkQIRe/jCJtPGvXYgCj5Zt0KbJs9Burj4WvdRbsA8eBn6glR2OldYr1w3H8Fcad/7dTg0smD65SrFiNQm0JJ2YW9YVHnNE5GbQm4559BoGrw4qI5WdDIV1A5wuqowfvq6FvXGiO7yZkYnF3qp349nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS5PPFEAC589ED8.namprd12.prod.outlook.com
 (2603:10b6:f:fc00::667) by PH0PR12MB5645.namprd12.prod.outlook.com
 (2603:10b6:510:140::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 21 Nov
 2025 20:30:17 +0000
Received: from DS5PPFEAC589ED8.namprd12.prod.outlook.com
 ([fe80::50eb:dafb:9932:c621]) by DS5PPFEAC589ED8.namprd12.prod.outlook.com
 ([fe80::50eb:dafb:9932:c621%5]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 20:30:17 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Fri, 21 Nov 2025 12:29:57 -0800
Subject: [PATCH] net: mctp: Fix tx queue stall
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-mctpusb-backport-v1-1-e53b4c80e06c@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAMXLIGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyND3dzkkoLS4iTdpMTk7IL8ohJdM1NLE4NUo2RzyzQjJaC2gqLUtMw
 KsJHRsbW1AIhGm69iAAAA
X-Change-ID: 20251121-mctpusb-backport-65940e2c79f2
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763757016; l=2209;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=lM+0iTQPBcw+fNuPp7axMEnELcewgdWfhPcTOvva6vs=;
 b=kM6Vh9Zc59ulB9TsKDj14RH0dT+36BJ++U0mks/LUbCfCYZTFb6VbiP6nAuuoSQFDSmxlJlvW
 atgJ+++iofvCOj/s1LDIwffGVAg3mAjTsvJPdXCxlzPGQOcQWgqYxVG
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::16) To DS5PPFEAC589ED8.namprd12.prod.outlook.com
 (2603:10b6:f:fc00::667)
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
X-MS-TrafficTypeDiagnostic: DS5PPFEAC589ED8:EE_|PH0PR12MB5645:EE_
X-MS-Office365-Filtering-Correlation-Id: 8653f15b-16a4-4023-40a0-08de293cc8a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzFXczgwOUViMThSRTE2NWxmejR2aDNrRXlRYk4yTWZ6T0ZmWEllZCttWVYw?=
 =?utf-8?B?aERaMG9DRlJiSVF5MEs2bU85b3JEeFhMWDQyZWhKV0loTEU2TkhLeDdEM3o4?=
 =?utf-8?B?NS90UkpHNDJRSkFUemtoQ3BEc1BTSGtxbytTRnhLdXNUYVA3aER4RzdDYzl0?=
 =?utf-8?B?RXQ4R3JMWmZEbDNmLzJ2SFZVcUhHTFVnRlRFcnlVdCtCdWd3U1FaT3NjSk1X?=
 =?utf-8?B?b3NBS2VVbVJGRW01UWx5L1lOWms1VGlzbWdWRHY4Q1VpT3doek1OU3drSUxu?=
 =?utf-8?B?L2J5NGJrMU9JTks3bExKQVRFWEZ4SkdHU0RpaWVEVjNZUE9DZTFCaVpHS2to?=
 =?utf-8?B?MUhKcWhaRXZ0enBLREhjbXpVYVVsTVpzVEoxT1pLVjZmOXlOLzYydVVWRy8z?=
 =?utf-8?B?dTlLYkFXcjVZOTdtZG10L0ZnR2toYnJDTjgycXptVXUzTWxNQTJlU0JNazBz?=
 =?utf-8?B?T2VjbDk2bmF6cXBuV254NERScWxXM1JGRk9YNGJMeGpMdjlHZSt2dEpqcmhK?=
 =?utf-8?B?WFpJUVFiVW80MXRsbEtHVWsrenhvVXJ3NXpxWUkzUm1qUDJ5b3JiVXhNYnlT?=
 =?utf-8?B?UGM0ZVpPRWdaRnZQaUpmQlhqS1V2ZFdhSnNLMmdpYXQ0b1ZFTE44c2pXY0ZS?=
 =?utf-8?B?YTlNK2RHUUdHbEIwT0xGU21ka1BiZzhXVEhlVitXVmU4OGc0Z1BuM3BueG5F?=
 =?utf-8?B?OFh1VDMyWnp1U2Y3OEN0TVNkZ3VpMXVqT2QwN1M5WGEvK3dSRXhjRmxuVWZS?=
 =?utf-8?B?dEx4dlFSamVHZ1YwT0V1L01QWmNIODNDWVFxZFBKWlRLZm5RRnJlRWhPWk41?=
 =?utf-8?B?SFVpZVRxaGRNaW9TQU9DY3J2cENuVmxPeXFjL1U4VU00SlJFT2NCZHBPZkVr?=
 =?utf-8?B?cnJiR0xzR1FHdllyc2R5MGgwZGZFaXYwNTV3eGlhRVR0elRmR1Z3Rnlab25l?=
 =?utf-8?B?M0FDZkEwb1J2R2tlemRpajFOVEQrTW1LK3I1UjNqcHZqeERudDBLWlIrcmZ0?=
 =?utf-8?B?aXlteFBVMytqc2d3Z0xRUjd4UTg3MnVDbzE0anF2YjBJR05ERENlWTdFbzk2?=
 =?utf-8?B?SzNuZ0VaWW9sU0E1SUdoN3ZzdU1vV0lkcitNZ0FNaEpnL2hQV2JHdjZsa0wr?=
 =?utf-8?B?cUg1WS9OUGZ3cllNbGNmQkIzUmFUTyswWkhzZzR6eXhJeHdyVlI5TXVtK1Jk?=
 =?utf-8?B?Z2FxRFVzVHZhQ1FlWXBQN2FqOU9UREVQSlUrVTFaN0JhQlZQUURobUdxTkVX?=
 =?utf-8?B?NFZNVlVXQk5hWFNDZWhUanUrSCtQcDdGdkFXcUFVNTl0RlZVbldRQWRzNVA4?=
 =?utf-8?B?WWVOdGZoY1FCVXRjQUlGcERnWkZ1dEtoSTZxNFlYY0JaZ1JwMkQ2TksyRjM4?=
 =?utf-8?B?ckZsYWgwSWRBc2NjTENLdXdXS0NpVlhubmY5bTlmOVAyZjhmY3FrZlh2Rklh?=
 =?utf-8?B?cTB4Y1NUNmpDT0hxTUFJSm4xUWNZVm9wRWZER2hkSGNTa21Ic1FNbzBMZTNX?=
 =?utf-8?B?NjRVbm1CeUtKNGpWK25xTllZQkpMaG9kNlpZNHkvb1kyRitjV0IrTXM2ZzRk?=
 =?utf-8?B?dTFLQkpQSVJMUENrUlZIaHpQTXphZEpYTktNSmJWMWlwTndSN0FzVVFIb3dj?=
 =?utf-8?B?bEl4N3hRaWdtLytaSm5XeUtSOVR6bGpyWDVxRjFMT1MxZHBSdVBxSTd3MDBS?=
 =?utf-8?B?ZVRkdFNjTUFobEZXbWtseXRvYmtYWWVCdU5Da3hEK2dHZkx5MGlBRS9jdDR5?=
 =?utf-8?B?NGxWNDhLN1d6SUtseXZVY1Z6bmozVStWemFmdjJVUjJVYkI4MmV4NnpDdGRh?=
 =?utf-8?B?aHVuWFRFZU5BeDk1VWFLZGlVYml2QUhKRnp3YXhZS3BCRGdIQ3IwbUNZM3pn?=
 =?utf-8?B?ZFc4YVdNeDNTOEU5RC8xUThIZ0U2UUVPS1grVGtqRzhNRUNHYlVybnl3V0dr?=
 =?utf-8?Q?DOi58DDkXCKAd9o041FGa5E83qMwzelH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PPFEAC589ED8.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUIwMGtwN3oreU41UGRIWE90eWNMcTNYeFk4QkxOSDk0aFZ3cVMvbmRrT25r?=
 =?utf-8?B?aXE2KzRib3FnNmtSekljWDF5bnFhby9pT1RmRTZodXYxUEw4UU0rbDRhdlJp?=
 =?utf-8?B?RCthM09yemNmMzBuU1ZDRWFkOVpEaUxNOGVlaUIvdzBuRlQwNEFUKzgxWmYz?=
 =?utf-8?B?TmhnYXZDVmZpTHIza25uRWp1WFR5NEZXVklJNzR0MTZIc3dOZ0QyVTd5U2RX?=
 =?utf-8?B?cW1VVTFLL2VvRVRTRVpUek1DdTcveElLQWt3VjFoQ01UNUJwdjV5dVBVT04z?=
 =?utf-8?B?aVJtWlJ2NWRsVnN5alNtTy9OeGMrejJmOGxCbTlGOCtyY0hDOG8ySll4Ynhs?=
 =?utf-8?B?R2ZPR2hBOUJreGFJUGczUWdDTWVOd2t0Y25LWHJacHNReWY1UmdkS2JHaFVo?=
 =?utf-8?B?cS9pd21TOGt1aGgzVys5VGJFLzlscFdYQ1Byc2h6K0NRMWdGcDgxcHR0OGtD?=
 =?utf-8?B?a1Q5Q2FCRldWY3pZczlRRzcvMTZQS0ZNNXk1ZlpOUDRJUGlBeWFGbGdkNkFS?=
 =?utf-8?B?YVlpeDhocHZRRnBSOHlzWXJ6L3pHSzlURzQxU3lNVEt3SVl4UmswRVpVeFJM?=
 =?utf-8?B?U1RLeHZuRWEweUp6NDg0TlltVThCSUFZWm8wSXpOK3Z4WkJwcWsyNUkxTTFU?=
 =?utf-8?B?WWt6OTVCZ3pEQzhzSVd0SGI2RGN3S0RNSHhvcG82YnpNanhHdklWeXNEUTNB?=
 =?utf-8?B?azBRcVlpUUd0OEJBK1grdENRM1hJMXlQdDN2WkZ6blU5MzN6ak56NytWR0Ft?=
 =?utf-8?B?ekxWd2hEVjBMcEhoL3d4OVVNaTk1Wnh0VlJPZ0VKWDl4aUVZOUh1RTFZZlg1?=
 =?utf-8?B?V1lOOWY5SGxzWXA3bE56NDhnOWNJeVpFc0Zrck0rMnJvMUpjZnZyVFY5UG0x?=
 =?utf-8?B?R3BGU2JvalpGOWRXNE4zTGF0QVdsdUdIYXBtWVJ2aXNCcVlGOW14bEZIeUlY?=
 =?utf-8?B?U25tbDFiSlFOek9JSi9GdFdqUlN5blpMTjIvcVVXbG9nR1JQYXlTd3l4aXND?=
 =?utf-8?B?eXNkWUdMMThTZFVrK0hCTjdJRG5ZZFV1V0doMHJNdGthMS83ZWI3NDhrd1dU?=
 =?utf-8?B?eVVQUFRmWFVCVW5EalBwUVVpVVJSOWFQWmdiOTREbkwxTDdld045MEFxY2NK?=
 =?utf-8?B?RytEa21WSGxQZEI5cWNtMnA0QWNKUlpibFhRWE16bGZBSUxwUUNzb3JuZ3Nk?=
 =?utf-8?B?WDdWZ1lad2ZuWDNZU0VKOGI3VjV0dHZnZExlUEx4T0IwdXM2QzJHODZPNWZH?=
 =?utf-8?B?M1Y4czAxeDFkbWtJSFRsMVRuRkUzUW5qYnJZUmdFRklzRzRIODJ6RmFFUDB3?=
 =?utf-8?B?ZTRGU2hlL0FJaUlLVmJoVkJQSk9KQS9STG90ZzJmLzhlVXhXN1UwTXJsYW0r?=
 =?utf-8?B?SktVbERBeGs1a2dQRTc3Yit1YStERGM2TEUrbHNsZ01QNnBMZWZobktTRGZk?=
 =?utf-8?B?Y2pZckZqQkVnVnJYVHYwb0poZUR5L1FBVitRT2p5VkU1YkxiUHRUc1oxM3h0?=
 =?utf-8?B?OEVYcVNrb3JiVU12bTBYdFlYdTZGc29iT0Y5TDRIMkpLdGV2a3BEano4Y0NF?=
 =?utf-8?B?aUdDQzMzVDZDWTRsNWZiN2JLR0NvbVpZbFhNR0FleENYVElrSnRNaHBoWlpR?=
 =?utf-8?B?b1hBRTFVOEtZLzJ0QWlsYWVkYWVSR3pmaSs0azNKcEJHRjFhRG5vZTNNNVRw?=
 =?utf-8?B?WnJpUFdQaEF5WGowUW94a2ZuTUVCN3luUHcrcHRHakVKOSt1c25pS1I4Wkgy?=
 =?utf-8?B?V1JxdE5HVTlMWU5CVkxhdzNVWUZNTzh6V2VmMXhMNEFtaGtUUUlSRnBsTEZF?=
 =?utf-8?B?QTNUYjJ5NngrWkYyR1NYWnA3OTFCeWN0eTgxN2UraWVIbFR1Z29xSXRJZnU1?=
 =?utf-8?B?Rk9FeWZXTm9yVmFhMXZSZExLUDVXejY5a0N4WUVUWkFKdEdjK1ZkVEJRdW1h?=
 =?utf-8?B?U1AxeDBRbEtqbXFaZ0IreWxWblI5RVErMzlWL3Q4b1V4SGQ0bVZQVklLZ0pV?=
 =?utf-8?B?Qy83Z284cGlWbC9MeHhTemtPODNHa2gwZStsWmp6bVVUT3c0L01iTTd1eGZj?=
 =?utf-8?B?VDlSUk13Yk1XNlZrM2RoWHFxWkJqdVUyMWVDWjVRRUQxYzJ1dE14eDdDVHo1?=
 =?utf-8?Q?bdstBgUID8rLCjjvvaI6wD1pI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8653f15b-16a4-4023-40a0-08de293cc8a6
X-MS-Exchange-CrossTenant-AuthSource: DS5PPFEAC589ED8.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 20:30:17.6320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTzfskHaGxpFiQq97PI71Ki/RFSetiDO2MyObkwHGXIOc5/zDw3n9b7Da7lYik7r1RKACrAWu47lLSEtQFJh8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5645
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jinliang Wang <jinliangw@google.com>

The tx queue can become permanently stuck in a stopped state due to a
race condition between the URB submission path and its completion
callback.

The URB completion callback can run immediately after usb_submit_urb()
returns, before the submitting function calls netif_stop_queue(). If
this occurs, the queue state management becomes desynchronized, leading
to a stall where the queue is never woken.

Fix this by moving the netif_stop_queue() call to before submitting the
URB. This closes the race window by ensuring the network stack is aware
the queue is stopped before the URB completion can possibly run.

(cherry picked from commit da2522df3fcc6f57068470cbdcd6516d9eb76b37)

Fixes: 0791c0327a6e ("net: mctp: Add MCTP USB transport driver")
Signed-off-by: Jinliang Wang <jinliangw@google.com>
Acked-by: Jeremy Kerr <jk@codeconstruct.com.au>
Link: https://patch.msgid.link/20251027065530.2045724-1-jinliangw@google.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
Backports a fix from net-next to openbmc 6.12 for a race condition
in the mctp-usb driver that results in an effective deadlock.
This was seen to fix issues on the nvl32-obmc model with pldm
firmware update

Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
 drivers/net/mctp/mctp-usb.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/mctp/mctp-usb.c b/drivers/net/mctp/mctp-usb.c
index c398aa45e40da4e36e8e179d0d49c473647b1ba2..f7936f952d17e43dde12853922fdda9ca5985c8d 100644
--- a/drivers/net/mctp/mctp-usb.c
+++ b/drivers/net/mctp/mctp-usb.c
@@ -97,11 +97,13 @@ static netdev_tx_t mctp_usb_start_xmit(struct sk_buff *skb,
 			  skb->data, skb->len,
 			  mctp_usb_out_complete, skb);
 
+	/* Stops TX queue first to prevent race condition with URB complete */
+	netif_stop_queue(dev);
 	rc = usb_submit_urb(urb, GFP_ATOMIC);
-	if (rc)
+	if (rc) {
+		netif_wake_queue(dev);
 		goto err_drop;
-	else
-		netif_stop_queue(dev);
+	}
 
 	return NETDEV_TX_OK;
 

---
base-commit: 3943d5e3e529495cf46ed1487af0edd54bf7b31d
change-id: 20251121-mctpusb-backport-65940e2c79f2

Best regards,
-- 
Marc Olberding <molberding@nvidia.com>


