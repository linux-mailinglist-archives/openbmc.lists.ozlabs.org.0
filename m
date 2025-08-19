Return-Path: <openbmc+bounces-484-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BE1B2D087
	for <lists+openbmc@lfdr.de>; Wed, 20 Aug 2025 01:56:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c661k0GN5z307q;
	Wed, 20 Aug 2025 09:56:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2417::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755646631;
	cv=pass; b=aBs3KQSk2t/78fB0rba0AKJawSxsQwq0eJ3cZ22YOnt8hsjFJXiv7YIsYaL2VnnYEh/9JbuSly07sGYBtpKfw6RsKvGXQhE3Yu+m4yxSpzTBEjbbeg4pxdKpO2bfd7fz3lUZknV/9a+JNicJv3XftUOUMEx5QW3gXGufX8FFlLt1Rpau2G8Q6n9FMsgQM8FPzxws4NVvGqAqMHVng1TSpYhakdzpRPQlIgadnQfD+z5Ac21B/IOy8NRQTfgTqCMeNiHHdkvuaUDVvCg0cluxi6jbraMuUWKQ75V0cqriZp/5+D5Y+KVavTPTveW/GhUZsm95bkMPGXzamWugD6CzuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755646631; c=relaxed/relaxed;
	bh=UJhMHlDpMbq1RfuV65euDRLFWTAT4Y34Db3bkrGqaFc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Nog0X/lgbWiwbxZoBEenNx+jyJFzLoZBw9z43pgT8/deMu/kFsiSGUcUDYjya7j5jYObS1SjlWB2f3ncV/bJS+60QzBJoJzY1Vz9XIhIx07ma+TV2yDEXmZtRcD3OkL/uEOtmc9xPfiD2/SU1qpPo3pHyyZugU/Etup/gtuPHt5kRJLM36t8u5qIzz8i/MtlH9KNSPw0cCeCjiOp6vfcwqq59ctx/nGRd/YTiI0DBMnWITIuhiKjafEHd2NBvbZt7r5bYmgLmGp/pij08QCTZtOqDpYHpbIPuq2MoupXgXzpQ3E4ONiCCm9AeA6GSruV3Gpgw2S0wk7IhsIpKHtl6w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LM4HQkZd; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2417::609; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LM4HQkZd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::609; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c65bC1pMjz2xc8
	for <openbmc@lists.ozlabs.org>; Wed, 20 Aug 2025 09:37:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BN2TA6huYR4yHPmZoqn9ddicA5OLk/qxRwaAD5u5QLI4+MMYk0giskLXqT3A/AgT1jO9zcWyOeVKS5k8bbXrsgtAXJoy1x/2krsrN6fsHPlD4CcZ8XbQCr3SASeFRBOdNgm3RGiI6xpuSDjNgT7RHzziYg3AgCPS5PBkSGveDLhLtlFrQN7/OYvFeTyktwIf59TBQao4f0Mrp0O7ZYObJ81hK5w3A3F8/3osA0ALTeunqmo1ZIAk8GYuQw4APq7xdl2aG/lm+Lg10ZMr6cAD46EXAmAT6rFxggjMIkzE8rbUptfVYy2rZ+a1Kbmor3vY6aeVyRzvAzswg/a6vyU8Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJhMHlDpMbq1RfuV65euDRLFWTAT4Y34Db3bkrGqaFc=;
 b=qOI5Sbz0/JYPIzH/De0QMvToXeazAZnWpp37c/HbDasp7m/7VNNhpzhHwTKxzCsUXUulfx9FPu0h2KgI0HjWYUBC+erF2rLhHnn0sCOMkOCyGnU6i3YZHzIBHCqs8ixAn/wnIJnLcGcbnMUU0e5obZvW6Dncc33/9dMUKiSjkXKElDN8BgiVumX1VmX4nPbDvzdbt8XbiO8+iXP461bZs3wdMOx1s6Jc78nWj3FuQFEMeY/RCqpguryvxIkv9G9Uo3MOKwpvX0icYbvBxX5WjjRUdqU6JSE/TN9McxyKlcQV/g61FQemZI0iZzxT9RWsLE5ANH8LgiZa/y8K8eyxQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJhMHlDpMbq1RfuV65euDRLFWTAT4Y34Db3bkrGqaFc=;
 b=LM4HQkZd6Lrf9jSDNfIG3iD275OSc0JZHokDqrWinjH3Z9ohqQMtBZtKLQxVg4b93Wj1CDGuLuFmBmWgXQAgVqQovZ17mKjYqrRIr8lFGmd3fIbSPxNI2RNHAA3MIkBQh01Z2MT6oXmZhm+Qea08OyqLiNwcMA7ymFd2paC1BYT2zN8oUyeXtB6ZuNuwN7gSeBEO84omQks/rrI04wVBNkXOAFRrZm9nt79k1d8oi6jjn+GCFOZaSYG86vgIPmIFrvudk27br98uJ9oRy2KCzp2+7NOr/EJhZ5wD4Rko4EBd9A0GQVimbYnrFChUmcMH2kqBveuBaC2IsW+cWj4x8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS5PPFEAC589ED8.namprd12.prod.outlook.com
 (2603:10b6:f:fc00::667) by CYXPR12MB9443.namprd12.prod.outlook.com
 (2603:10b6:930:db::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Tue, 19 Aug
 2025 23:36:50 +0000
Received: from DS5PPFEAC589ED8.namprd12.prod.outlook.com
 ([fe80::fd4e:4c62:b756:96da]) by DS5PPFEAC589ED8.namprd12.prod.outlook.com
 ([fe80::fd4e:4c62:b756:96da%5]) with mapi id 15.20.9031.014; Tue, 19 Aug 2025
 23:36:50 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Tue, 19 Aug 2025 16:36:23 -0700
Subject: [PATCH 2/3] net: mctp: Add MCTP USB transport driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-mctp_over_usb_backport-v1-2-c655eb2a32ce@nvidia.com>
References: <20250819-mctp_over_usb_backport-v1-0-c655eb2a32ce@nvidia.com>
In-Reply-To: <20250819-mctp_over_usb_backport-v1-0-c655eb2a32ce@nvidia.com>
To: joel@jms.id.au, openbmc@lists.ozlabs.org
Cc: andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755646605; l=12389;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=e+tFV+3ps9sGrQ1MpgNcj27ptxux7OLIp2iyy9LFvGQ=;
 b=KB1mNtjlzzsq5q9WETLCRyHH3fX4dZRum4tww1P/Gu//mssP6qJbj9Nk/Rv2q7sc+WaLb8KFG
 e8WXTL8ewXVAViUQZ+MwoAyXtv2yG9ZtIrQUXx0OCFBlnPUmye1KAud
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4PR04CA0214.namprd04.prod.outlook.com
 (2603:10b6:303:87::9) To DS5PPFEAC589ED8.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS5PPFEAC589ED8:EE_|CYXPR12MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d976e80-5106-4447-74eb-08dddf794522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVF1QkthVlpzVVRuSkxLeUR6WHVvSVNocVRFL05OaXdic1IzdE5VeFZWVnpp?=
 =?utf-8?B?L1F4L3VvWmFRa1Y2RkRIUWY4RExPZjU0TytvOUx5SkwrdzEyMmtmVzRtcFRX?=
 =?utf-8?B?WjlPc2pZWDY4K25pbU9yc2VHMVpnK0xpMmRRVFRXVXEybm44Z3YxQ012U2RE?=
 =?utf-8?B?NGxQWkRDMjY3cVRrNXdkSUQxa0J2V1lvQzVWUnRJYUc3T3NRcUlrWVFDdmhz?=
 =?utf-8?B?UTNyaUNyMlBDWld1cDJYZkRQczEyT0FuM25ML1hOSFhlbHM5YXFMU1FCeGR2?=
 =?utf-8?B?RVhhYWVFVy9BRWh4b2VJMkppT2JZQlJ3L1UwWWk1L0xoeCsrZjNRNDd4eG5N?=
 =?utf-8?B?MnI5ak1ZSHpMMUZqSmt4SFNOY2thN3lFQm5FTllYVVhpeG1MWEFsV2ExemNm?=
 =?utf-8?B?TDFjWUxUeEFEUlNLelF0aGtDQkw0UDdrbkMraDJSSTNyWm12UUdQak01UmND?=
 =?utf-8?B?VHZ1bVBQWnRXSGF4UEVORS9ZdDFlK3drdFM1YWhDQVdqRDRaUmlTUFNGTXN4?=
 =?utf-8?B?b0JhY2tsbFlnODg1cTFaMWVrQmRyc1cvcm5JMUp6OTRpWVFaWVlncmsrSDFy?=
 =?utf-8?B?UThnSmVaWVlST0ZCSDhQOWFDVEIzOEhTUTdSaUVqaEVvUllmYit3MFF0cVVT?=
 =?utf-8?B?UjNaTWZwd2wxcjI1MmlYSHViQ1pzUzM0ckI3bitmZ0IwREliNjNkNjR3UUJQ?=
 =?utf-8?B?a1pWalRpQ0VjNUlQTGZ5bmk0cGdRam42YnBpdnFKMGQ5QTFHS1lzRTQ3RGRL?=
 =?utf-8?B?UkkxSDFFbERQZ0tJWS9aK0UyWTZadHhRajFxT2xleStWOEFhbkhzQmNjQXhi?=
 =?utf-8?B?cEJGTi9xSW1uQWNNU3NwOWhrRWlwdFczMXJyR21IZzBTU1Q0d3l4RS9OK2tG?=
 =?utf-8?B?T3FHN0hyM2VzL0VwU0dHdVFrWEh5UjFVSmFxdTI4bmlNcERNME5PV3lnYnlu?=
 =?utf-8?B?TTg5ZEZJS2ZsOS8yTXROem1PblZKdi9LWTVnd0tlWit5QURPb2tKeTBaakI0?=
 =?utf-8?B?WkNZbG9GMFBlK0NJQ0RiVldXTTVrdW5wNDV4R2hqRDR6ZGc3T3M3TWVYWlZz?=
 =?utf-8?B?enZWY2IvdlJZUDVnME8veXRpNGFqRzYyaklFb0dYRnA1SDY3UGlKUmd4Y000?=
 =?utf-8?B?WmFCTnQ5MlZkWXdyNHhLVllFd1I5enNFYmMxb29zZ3ZpQVhSUXZoNHBLbTQ4?=
 =?utf-8?B?S2ZoYUJWRHI1L1QwTTZoVVFDZHF3OVIra1U3RW1tZ0xINVd0NE9ObEZkTDFC?=
 =?utf-8?B?LzRGSnovZ2p3ckVKRUtuWUJwYkVXU21ONGlJNWFkbkZqWGJycGZ4WS9GVXk3?=
 =?utf-8?B?dFV4L3JOU3Y5VXUvdjhDUzQ0ZlExeFV0cE8yV0VwcU5LQlREM3ZmNUMvT0dZ?=
 =?utf-8?B?S3lON3RCbGFRbnR3VkwzQXhQWm1DdjFrTVpJYnltRGZNckkxbnZMTHV6TzZ5?=
 =?utf-8?B?a3dLK2NOdVFiNkhVR2ozMVlxQVovWEt5bVJVeGVOZzlzZkVhWDVPUmIrZ2JY?=
 =?utf-8?B?OW9pTHlrSk1RVy9JNHNNUERieVd6U1dkYkhQemdxS3FSWDZOSFNGQUFXWW8z?=
 =?utf-8?B?YjBPc0hNZUI5L0FQUjY1STBmbUdOYysvVUpNblpLT2t6RVoxSCtEU3RUendI?=
 =?utf-8?B?MXlYRHJMaDdJYWREWEpHSVc5RmJ4cmFRcSs2bVFaZFlLbXlvS3BHMy9UNVlR?=
 =?utf-8?B?RUEvYkN2RitpTG5jL3c4ejM1U1IzTGdTNlN5akJUdHVuRmJUQ3FxVEJGalh3?=
 =?utf-8?B?SU8zcG94c2szSTRCendCKzVhdEs2M2NaOFpheS9UdU5EOEtuMDAxeXdMdmxU?=
 =?utf-8?B?anZwSnVMZDd3NEFKQ21FSktPUnNJTGF5RG1iN0Z1ZnpWNFJGaWljRjRlSHhi?=
 =?utf-8?B?ajdVME13cDlmUzFjanlTSk9HL2hydDZxY0RkemRnd1loQXh3OWRUUGs0Tk1D?=
 =?utf-8?Q?+tu+OZ9Qahw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PPFEAC589ED8.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OG9yVXQ4a3hUYkhCek1LZlRVb0I0TTdCU2NGSG1RL3R0bWMrWnBZclJuS2pa?=
 =?utf-8?B?S3lOVmNKaEFMb0E1dUpWM3FSTzB4WTBxVUk2YXROZWdnaXdNRnpOSWFwVDNS?=
 =?utf-8?B?YnhLdkY0c0ZFRUgyTzVVZDYxbE5QTkZSUWNpRUd5NCsxVllpR2VaQUJSVmIx?=
 =?utf-8?B?UEk4NkNySlpmVnVTQk0zblFQOG5hOW9MZTNHUjFOOGtMTVo0N0ZwYndWNzQ2?=
 =?utf-8?B?V3BrNUx2a1VxZE5KenlES2pOVm5TZkxXSXlqcDN0OTd5QlUyQ1FYdDl0UmpV?=
 =?utf-8?B?ckpPd3FTbzZrR1FUVnB6LytEYVJ0RkIwQ3V1ZTd6azBKbFB2ZnZjbUNtU3hJ?=
 =?utf-8?B?VENOUkNNSTBhbkwxWnZpNmtSclY5YmExTHM4eE4zb045MHRtbzBMUklOU0x6?=
 =?utf-8?B?TVVUcGwwNUtYTHFzMGRxdnVzY1RKdnR2UXVqWDlZTjl2V0xFRlFVQkNXc0ZI?=
 =?utf-8?B?dHdqV1hDcDFGdWFnK215SkNxSnYzcGl3Tk1xdlNEMk5YMnlBYXhtd2dlclps?=
 =?utf-8?B?M1llWHVoOTFGeXZmS0lsQUY4QWJ5VmFPYW9kOUJSUSszQU9LbmZtWThqS1NG?=
 =?utf-8?B?RHl0ZjB3WU1KcGx4dFZSVU5rVVhXaHI5OTlVL0RFaERhWFd6RkYzZHhIdGE5?=
 =?utf-8?B?eXZ4Y0UrZ1FkZGIxVzRiSTQ5dUtrbWtDaWRSTnpLRFQ2SXFaN0JBS1RLY1Zz?=
 =?utf-8?B?UThMcUttdDBsYXlrNkxnTkhwQkpZZU9KYUUyamlQUXU3NmVWY1dtVHkzMDR4?=
 =?utf-8?B?UkJIY2RqZ1JDeDN2dHlxSmJicTN4SmVZa2hYaHEyZ1A1bHBQYk5zTjZDd1J3?=
 =?utf-8?B?WWkxbTZzalVwRUlJZFNIYTZSWlF3NkJ2Y3NEV3B0YlFFYys5dzZmYzhCOFdY?=
 =?utf-8?B?djRtcW5CKzFwUVJ6WlJNdVpPR2JpM0RBWmo0VFRDZk9NZVJQSDYvZStXVkw1?=
 =?utf-8?B?N3JNby9oa3phSENXaW9mcEJ6NFQ1OTNybU44enhGNXVyVUQ3TGNIV0tOYVh1?=
 =?utf-8?B?VmlVZStDeldkM2hmTVBQdllNbGxUaExFNUFJN3RwY2czaDkvWEJtOExQQngv?=
 =?utf-8?B?dFZPRkJMUW5nRjlkZm00SWdKTW5CTnVxbDlLb2lZR2oxTFBRNWRFUW03TWt5?=
 =?utf-8?B?cjQ1eHhnR25EUlN6T1dJOHVhaXZFRkxEaDMyVmlPSUp4UlQwaUlLeWcxTGNq?=
 =?utf-8?B?Mm5MYnBKRmtnRjdCcjFQOVNpdzBNMEYwUituRmpNSEQ0VmViYXNOczFlUFNI?=
 =?utf-8?B?TzFQaTdIRytPYVU4Z1ZWZXJSbEhqT3JpYnpIY09lb2lBMUtoYmtaenRKTzlS?=
 =?utf-8?B?SmF0ZmFsWjlWdHgxM2dXeE5oc0lGQ2lyY3ZFUFI5eVFzcDFpWURJUXl1TUds?=
 =?utf-8?B?RHJyd1A1Y2pNZHpXUWhzcUdRN0JtREd4c2lQelRsQUdqUFVYVGpIK0dMRm92?=
 =?utf-8?B?Z1VETG80Q1BuMmtiQ2dRQkxPbHZpSnV4S3p5VE1EUmczeW14VytiTHpKN1N2?=
 =?utf-8?B?T0thaHVoRWdoTGp5bElHQzVhcG5FK09INEcvSCtGREdHc0VSeEtXT3pGKzNl?=
 =?utf-8?B?ZDVnWU9LbWhSWlhHalZEYUxodHBoVUlENkhkR1NaTU8zQXNhNU55bjV6bmJz?=
 =?utf-8?B?R2ZKeG9LZndqSlo4TGt3czNrS0x6aCtqaEJFTGswMzEySTNtUEwwQkJvNGJY?=
 =?utf-8?B?VmpjQjk1SXZOdE5FZDZwZVhMc0JFYlBaU01tUkpvUmxLUWlLUUViNXpwNjhj?=
 =?utf-8?B?WUJZUFB2UEFJV2dyb0N1VjMwU3REdUpsTDMzdDhSQVRVZTFLNVBXVlgxRE1S?=
 =?utf-8?B?Nkx1UTY3SUlycHZhUStjd3Q5QzRhZ0IrOXM4MDlEZkdoblV2WHhhQUlEVkU3?=
 =?utf-8?B?LzZCSHBweFhsQ25BRXZ3S1dVYjJxNWRVdUlkbkZZNDgvL3Bzak5YSk83TUM1?=
 =?utf-8?B?YnV1WGpROHk4NDZjWk1jOUxqT0wzbUN4Z2tzNTUrSzdIL2NtMDdPWDlTcVh0?=
 =?utf-8?B?T3Q0R2lMNTIxbW8ydk5uWFhDbWxnM0V5SXFrejBrTWFNcmdtaFhyQytSNGMv?=
 =?utf-8?B?dEdBcXpveEIyOStRenpJbmozdDZCUGI0TWhTU1N2M0FUem45R0N6aFJ5MldH?=
 =?utf-8?Q?UDKwQUW9FqXKI8uM4iYoPVq0a?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d976e80-5106-4447-74eb-08dddf794522
X-MS-Exchange-CrossTenant-AuthSource: DS5PPFEAC589ED8.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 23:36:50.2126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ns3c5krVmq2Fk6uQhNQCXG2ECYbTeC5QcyHlVuSDyNgha7gRndqfhuxZC707s1mEDTNW0ZX3BLVQkEWQSthsjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9443
X-Spam-Status: No, score=-3.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jeremy Kerr <jk@codeconstruct.com.au>

Add an implementation for DMTF DSP0283, which defines a MCTP-over-USB
transport. As per that spec, we're restricted to full speed mode,
requiring 512-byte transfers.

Each MCTP-over-USB interface is a peer-to-peer link to a single MCTP
endpoint, so no physical addressing is required (of course, that MCTP
endpoint may then bridge to further MCTP endpoints). Consequently,
interfaces will report with no lladdr data:

    # mctp link
    dev lo index 1 address 00:00:00:00:00:00 net 1 mtu 65536 up
    dev mctpusb0 index 6 address none net 1 mtu 68 up

This is a simple initial implementation, with single rx & tx urbs, and
no multi-packet tx transfers - although we do accept multi-packet rx
from the device.

Includes suggested fixes and backport reworks from Santosh Puranik
<spuranik@nvidia.com>.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Santosh Puranik <spuranik@nvidia.com>
Link: https://patch.msgid.link/20250221-dev-mctp-usb-v3-2-3353030fe9cc@codeconstruct.com.au
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
(cherry picked from commit 0791c0327a6e4e7691d6fc5ad334c215de04dcc9)
[arj: squashed in Santosh's v6.6 rework into the backport]
Link: https://patch.msgid.link/20250507173806.5371-4-santosh.puranik.ibm@gmail.com
Signed-off-by: Santosh Puranik <santosh.puranik.ibm@gmail.com>
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
(cherry picked from commit 7f82dab41bf0dafac4cd4cce593104e658e7c54c)
Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
 drivers/net/mctp/Kconfig    |  10 ++
 drivers/net/mctp/Makefile   |   1 +
 drivers/net/mctp/mctp-usb.c | 386 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 397 insertions(+)

diff --git a/drivers/net/mctp/Kconfig b/drivers/net/mctp/Kconfig
index 15860d6ac39fef62847d7186f1f0d81c1d3cd619..cf325ab0b1ef555e21983ace1b838e10c7f34570 100644
--- a/drivers/net/mctp/Kconfig
+++ b/drivers/net/mctp/Kconfig
@@ -47,6 +47,16 @@ config MCTP_TRANSPORT_I3C
 	  A MCTP protocol network device is created for each I3C bus
 	  having a "mctp-controller" devicetree property.
 
+config MCTP_TRANSPORT_USB
+	tristate "MCTP USB transport"
+	depends on USB
+	help
+	  Provides a driver to access MCTP devices over USB transport,
+	  defined by DMTF specification DSP0283.
+
+	  MCTP-over-USB interfaces are peer-to-peer, so each interface
+	  represents a physical connection to one remote MCTP endpoint.
+
 endmenu
 
 endif
diff --git a/drivers/net/mctp/Makefile b/drivers/net/mctp/Makefile
index e1cb99ced54ac136db0347a9ee0435a5ed938955..c36006849a1e7d04f2cafafb8931329fc0992b63 100644
--- a/drivers/net/mctp/Makefile
+++ b/drivers/net/mctp/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_MCTP_SERIAL) += mctp-serial.o
 obj-$(CONFIG_MCTP_TRANSPORT_I2C) += mctp-i2c.o
 obj-$(CONFIG_MCTP_TRANSPORT_I3C) += mctp-i3c.o
+obj-$(CONFIG_MCTP_TRANSPORT_USB) += mctp-usb.o
diff --git a/drivers/net/mctp/mctp-usb.c b/drivers/net/mctp/mctp-usb.c
new file mode 100644
index 0000000000000000000000000000000000000000..c398aa45e40da4e36e8e179d0d49c473647b1ba2
--- /dev/null
+++ b/drivers/net/mctp/mctp-usb.c
@@ -0,0 +1,386 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mctp-usb.c - MCTP-over-USB (DMTF DSP0283) transport binding driver.
+ *
+ * DSP0283 is available at:
+ * https://www.dmtf.org/sites/default/files/standards/documents/DSP0283_1.0.1.pdf
+ *
+ * Copyright (C) 2024-2025 Code Construct Pty Ltd
+ */
+
+#include <linux/module.h>
+#include <linux/netdevice.h>
+#include <linux/usb.h>
+#include <linux/usb/mctp-usb.h>
+
+#include <net/mctp.h>
+#include <net/mctpdevice.h>
+#include <net/pkt_sched.h>
+
+#include <uapi/linux/if_arp.h>
+
+struct mctp_usb {
+	struct usb_device *usbdev;
+	struct usb_interface *intf;
+	bool stopped;
+
+	struct net_device *netdev;
+
+	u8 ep_in;
+	u8 ep_out;
+
+	struct urb *tx_urb;
+	struct urb *rx_urb;
+
+	struct delayed_work rx_retry_work;
+};
+
+static void mctp_usb_out_complete(struct urb *urb)
+{
+	struct sk_buff *skb = urb->context;
+	struct net_device *netdev = skb->dev;
+	int status;
+
+	status = urb->status;
+
+	switch (status) {
+	case -ENOENT:
+	case -ECONNRESET:
+	case -ESHUTDOWN:
+	case -EPROTO:
+		netdev->stats.tx_dropped++;
+		break;
+	case 0:
+		netdev->stats.tx_packets++;
+		netdev->stats.tx_bytes += skb->len;
+		netif_wake_queue(netdev);
+		consume_skb(skb);
+		return;
+	default:
+		netdev_dbg(netdev, "unexpected tx urb status: %d\n", status);
+		netdev->stats.tx_dropped++;
+	}
+
+	kfree_skb(skb);
+}
+
+static netdev_tx_t mctp_usb_start_xmit(struct sk_buff *skb,
+				       struct net_device *dev)
+{
+	struct mctp_usb *mctp_usb = netdev_priv(dev);
+	struct mctp_usb_hdr *hdr;
+	unsigned int plen;
+	struct urb *urb;
+	int rc;
+
+	plen = skb->len;
+
+	if (plen + sizeof(*hdr) > MCTP_USB_XFER_SIZE)
+		goto err_drop;
+
+	rc = skb_cow_head(skb, sizeof(*hdr));
+	if (rc)
+		goto err_drop;
+
+	hdr = skb_push(skb, sizeof(*hdr));
+	if (!hdr)
+		goto err_drop;
+
+	hdr->id = cpu_to_be16(MCTP_USB_DMTF_ID);
+	hdr->rsvd = 0;
+	hdr->len = plen + sizeof(*hdr);
+
+	urb = mctp_usb->tx_urb;
+
+	usb_fill_bulk_urb(urb, mctp_usb->usbdev,
+			  usb_sndbulkpipe(mctp_usb->usbdev, mctp_usb->ep_out),
+			  skb->data, skb->len,
+			  mctp_usb_out_complete, skb);
+
+	rc = usb_submit_urb(urb, GFP_ATOMIC);
+	if (rc)
+		goto err_drop;
+	else
+		netif_stop_queue(dev);
+
+	return NETDEV_TX_OK;
+
+err_drop:
+	dev->stats.tx_dropped++;
+	kfree_skb(skb);
+	return NETDEV_TX_OK;
+}
+
+static void mctp_usb_in_complete(struct urb *urb);
+
+/* If we fail to queue an in urb atomically (either due to skb allocation or
+ * urb submission), we will schedule a rx queue in nonatomic context
+ * after a delay, specified in jiffies
+ */
+static const unsigned long RX_RETRY_DELAY = HZ / 4;
+
+static int mctp_usb_rx_queue(struct mctp_usb *mctp_usb, gfp_t gfp)
+{
+	struct sk_buff *skb;
+	int rc;
+
+	skb = __netdev_alloc_skb(mctp_usb->netdev, MCTP_USB_XFER_SIZE, gfp);
+	if (!skb) {
+		rc = -ENOMEM;
+		goto err_retry;
+	}
+
+	usb_fill_bulk_urb(mctp_usb->rx_urb, mctp_usb->usbdev,
+			  usb_rcvbulkpipe(mctp_usb->usbdev, mctp_usb->ep_in),
+			  skb->data, MCTP_USB_XFER_SIZE,
+			  mctp_usb_in_complete, skb);
+
+	rc = usb_submit_urb(mctp_usb->rx_urb, gfp);
+	if (rc) {
+		netdev_dbg(mctp_usb->netdev, "rx urb submit failure: %d\n", rc);
+		kfree_skb(skb);
+		if (rc == -ENOMEM)
+			goto err_retry;
+	}
+
+	return rc;
+
+err_retry:
+	schedule_delayed_work(&mctp_usb->rx_retry_work, RX_RETRY_DELAY);
+	return rc;
+}
+
+static void mctp_usb_in_complete(struct urb *urb)
+{
+	struct sk_buff *skb = urb->context;
+	struct net_device *netdev = skb->dev;
+	struct mctp_usb *mctp_usb = netdev_priv(netdev);
+	struct mctp_skb_cb *cb;
+	unsigned int len;
+	int status;
+
+	status = urb->status;
+
+	switch (status) {
+	case -ENOENT:
+	case -ECONNRESET:
+	case -ESHUTDOWN:
+	case -EPROTO:
+		kfree_skb(skb);
+		return;
+	case 0:
+		break;
+	default:
+		netdev_dbg(netdev, "unexpected rx urb status: %d\n", status);
+		kfree_skb(skb);
+		return;
+	}
+
+	len = urb->actual_length;
+	__skb_put(skb, len);
+
+	while (skb) {
+		struct sk_buff *skb2 = NULL;
+		struct mctp_usb_hdr *hdr;
+		u8 pkt_len; /* length of MCTP packet, no USB header */
+
+		hdr = skb_pull_data(skb, sizeof(*hdr));
+		if (!hdr)
+			break;
+
+		if (be16_to_cpu(hdr->id) != MCTP_USB_DMTF_ID) {
+			netdev_dbg(netdev, "rx: invalid id %04x\n",
+				   be16_to_cpu(hdr->id));
+			break;
+		}
+
+		if (hdr->len <
+		    sizeof(struct mctp_hdr) + sizeof(struct mctp_usb_hdr)) {
+			netdev_dbg(netdev, "rx: short packet (hdr) %d\n",
+				   hdr->len);
+			break;
+		}
+
+		/* we know we have at least sizeof(struct mctp_usb_hdr) here */
+		pkt_len = hdr->len - sizeof(struct mctp_usb_hdr);
+		if (pkt_len > skb->len) {
+			netdev_dbg(netdev,
+				   "rx: short packet (xfer) %d, actual %d\n",
+				   hdr->len, skb->len);
+			break;
+		}
+
+		if (pkt_len < skb->len) {
+			/* more packets may follow - clone to a new
+			 * skb to use on the next iteration
+			 */
+			skb2 = skb_clone(skb, GFP_ATOMIC);
+			if (skb2) {
+				if (!skb_pull(skb2, pkt_len)) {
+					kfree_skb(skb2);
+					skb2 = NULL;
+				}
+			}
+			skb_trim(skb, pkt_len);
+		}
+
+		netdev->stats.rx_packets++;
+		netdev->stats.rx_bytes += skb->len;
+
+		skb->protocol = htons(ETH_P_MCTP);
+		skb_reset_network_header(skb);
+		cb = __mctp_cb(skb);
+		cb->halen = 0;
+		netif_rx(skb);
+
+		skb = skb2;
+	}
+
+	if (skb)
+		kfree_skb(skb);
+
+	mctp_usb_rx_queue(mctp_usb, GFP_ATOMIC);
+}
+
+static void mctp_usb_rx_retry_work(struct work_struct *work)
+{
+	struct mctp_usb *mctp_usb = container_of(work, struct mctp_usb,
+						 rx_retry_work.work);
+
+	if (READ_ONCE(mctp_usb->stopped))
+		return;
+
+	mctp_usb_rx_queue(mctp_usb, GFP_KERNEL);
+}
+
+static int mctp_usb_open(struct net_device *dev)
+{
+	struct mctp_usb *mctp_usb = netdev_priv(dev);
+
+	WRITE_ONCE(mctp_usb->stopped, false);
+
+	return mctp_usb_rx_queue(mctp_usb, GFP_KERNEL);
+}
+
+static int mctp_usb_stop(struct net_device *dev)
+{
+	struct mctp_usb *mctp_usb = netdev_priv(dev);
+
+	netif_stop_queue(dev);
+
+	/* prevent RX submission retry */
+	WRITE_ONCE(mctp_usb->stopped, true);
+
+	usb_kill_urb(mctp_usb->rx_urb);
+	usb_kill_urb(mctp_usb->tx_urb);
+
+	cancel_delayed_work_sync(&mctp_usb->rx_retry_work);
+
+	return 0;
+}
+
+static const struct net_device_ops mctp_usb_netdev_ops = {
+	.ndo_start_xmit = mctp_usb_start_xmit,
+	.ndo_open = mctp_usb_open,
+	.ndo_stop = mctp_usb_stop,
+};
+
+static void mctp_usb_netdev_setup(struct net_device *dev)
+{
+	dev->type = ARPHRD_MCTP;
+
+	dev->mtu = MCTP_USB_MTU_MIN;
+	dev->min_mtu = MCTP_USB_MTU_MIN;
+	dev->max_mtu = MCTP_USB_MTU_MAX;
+
+	dev->hard_header_len = sizeof(struct mctp_usb_hdr);
+	dev->tx_queue_len = DEFAULT_TX_QUEUE_LEN;
+	dev->flags = IFF_NOARP;
+	dev->netdev_ops = &mctp_usb_netdev_ops;
+}
+
+static int mctp_usb_probe(struct usb_interface *intf,
+			  const struct usb_device_id *id)
+{
+	struct usb_endpoint_descriptor *ep_in, *ep_out;
+	struct usb_host_interface *iface_desc;
+	struct net_device *netdev;
+	struct mctp_usb *dev;
+	int rc;
+
+	/* only one alternate */
+	iface_desc = intf->cur_altsetting;
+
+	rc = usb_find_common_endpoints(iface_desc, &ep_in, &ep_out, NULL, NULL);
+	if (rc) {
+		dev_err(&intf->dev, "invalid endpoints on device?\n");
+		return rc;
+	}
+
+	netdev = alloc_netdev(sizeof(*dev), "mctpusb%d", NET_NAME_ENUM,
+			      mctp_usb_netdev_setup);
+	if (!netdev)
+		return -ENOMEM;
+
+	SET_NETDEV_DEV(netdev, &intf->dev);
+	dev = netdev_priv(netdev);
+	dev->netdev = netdev;
+	dev->usbdev = usb_get_dev(interface_to_usbdev(intf));
+	dev->intf = intf;
+	usb_set_intfdata(intf, dev);
+
+	dev->ep_in = ep_in->bEndpointAddress;
+	dev->ep_out = ep_out->bEndpointAddress;
+
+	dev->tx_urb = usb_alloc_urb(0, GFP_KERNEL);
+	dev->rx_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!dev->tx_urb || !dev->rx_urb) {
+		rc = -ENOMEM;
+		goto err_free_urbs;
+	}
+
+	INIT_DELAYED_WORK(&dev->rx_retry_work, mctp_usb_rx_retry_work);
+
+	rc = mctp_register_netdev(netdev, NULL, MCTP_PHYS_BINDING_USB);
+	if (rc)
+		goto err_free_urbs;
+
+	return 0;
+
+err_free_urbs:
+	usb_free_urb(dev->tx_urb);
+	usb_free_urb(dev->rx_urb);
+	free_netdev(netdev);
+	return rc;
+}
+
+static void mctp_usb_disconnect(struct usb_interface *intf)
+{
+	struct mctp_usb *dev = usb_get_intfdata(intf);
+
+	mctp_unregister_netdev(dev->netdev);
+	usb_free_urb(dev->tx_urb);
+	usb_free_urb(dev->rx_urb);
+	usb_put_dev(dev->usbdev);
+	free_netdev(dev->netdev);
+}
+
+static const struct usb_device_id mctp_usb_devices[] = {
+	{ USB_INTERFACE_INFO(USB_CLASS_MCTP, 0x0, 0x1) },
+	{ 0 },
+};
+
+MODULE_DEVICE_TABLE(usb, mctp_usb_devices);
+
+static struct usb_driver mctp_usb_driver = {
+	.name		= "mctp-usb",
+	.id_table	= mctp_usb_devices,
+	.probe		= mctp_usb_probe,
+	.disconnect	= mctp_usb_disconnect,
+};
+
+module_usb_driver(mctp_usb_driver)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jeremy Kerr <jk@codeconstruct.com.au>");
+MODULE_DESCRIPTION("MCTP USB transport");

-- 
2.34.1


