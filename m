Return-Path: <openbmc+bounces-668-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94979B8728E
	for <lists+openbmc@lfdr.de>; Thu, 18 Sep 2025 23:36:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSTS84y4yz3cdV;
	Fri, 19 Sep 2025 07:34:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758231288;
	cv=pass; b=FxKuWAEVm9zfancLMonxE03gsKQAtGFUAbAA4w+fD9Uc3Z+JD2sFSJ31OuATO17y50rOWYR54Yp7BuSoaKtUh7fIJ/+wA1ogxmi5Zfhj7++VJKihtYjzK3sS3URVokak6c/7ikYYWB4tT97TJX4fO7ff344y8Oao52aEv/uQ8ElUWxPX915c52whKpVM9QnWCvT1qvfS0mUOM/VgQTINl4EwPmpm6PKbgGwEgrbRGB3xXpuUgP8FIkgqzz5VqP/KCOa9S68/k34xIVHgwDoxG3w9rgHDel8y7haqSuMycUMbRlI/EOzjzZd1F/r4tIjSfBWgfkjsWJxpbOjM2xUbLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758231288; c=relaxed/relaxed;
	bh=Rg+jddakvJPBSX2u99sA4OWTQtpVrmc4UnQcdwJ7/v0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Tg8afA+bFwpzm5AYK+9sO3XcEKBPa+RVtZodjNw58QydwoFGkVAjprkXxIXYsyhfvjcCIjSuKMW9C/Kw3SOkC20EaY6sgZXtPl3nWrGom31C1CR3TjAvbvXbuco1voNDIszGkv3XmBMagE6GKXcdqszzBGpZyrdx3pXSJERrm1ZdxuMujGYRZCjxnWIr/TWlleixSfdUlfh+//11ql5w89sJnliUNjywlVdYQtW3BZQ4onDApjdlr9W9C3GmUaopKyQaqJPom2I+XxvoD87Pm9vJpSYj7Tit8tXOs4oubwCMhsFM8KjOF1YjkHvmAac2hPIkcN0sSrDUzCBR2XTdXg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qZeEJd5j; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qZeEJd5j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSTS74yRBz3ccr
	for <openbmc@lists.ozlabs.org>; Fri, 19 Sep 2025 07:34:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEAxbqMn3+5ezKnhWzja7gPukWqFuL/9ud9ktTOLFSKVorm/HCUpzE4Yd9Ho4NvQCLPir3LsujLtzsOunn0CiVXeLY5ne79BX6TvsoM4nQomtkTMYHh2bnRc3PpFKeTM6bZu5z0eIhjR52oAhcAoD2jX9f0hwv9dMQZHPo9nw9Fs5MtvumuhwPCbc80a3NnSFOX3JT/BmMVnYc6NZKGD+GIiGn0esN+7aoYtWGSJtZMSJ7vy25Su5xX2x2oubqeBeQXGDt+Be9kO1ShXJSZrWLsCrtzAVrzlDrU/fgHsUbu6C5BmBXCHhP6cv8A/ooigQutcZM1JiDnszp5FKkrEoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rg+jddakvJPBSX2u99sA4OWTQtpVrmc4UnQcdwJ7/v0=;
 b=xpz2IcYcr3Aa7RWEyAhMPSZ8SJTiRBR71EmfqhCiDgdH+XOE9vhUzSLJUPqVySWdzKJgk92lRP2RnHycXHCbKKFzEWywA6bdtCjeX0xsjutxrm1NeSRLcXLrvT5KIGdO+6WnEIGocGJSOODjIaY84XFwpwoiEKJt17iZPH653e4uASp5GI13D4TlmBZIQdy40b1P+yjTmOmFu0J5aDbNg0bNMaHEhXhoe9/0FSWkZZj3v2ipH8P8rcdMeeLbpcHoGMA9zsuXOughBMk/RW1mQfZBtn8dRpSHzYTUfoh1MG3Dl0sSEEW8K1ob7z73cacJzckNFElaH/9X6m6JmrzHTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rg+jddakvJPBSX2u99sA4OWTQtpVrmc4UnQcdwJ7/v0=;
 b=qZeEJd5jnxKA2u3CL0r5tBNYoNVBKsWjJh8khc3V2/nmfkqF6O7GXTqgW+UxY40ZKSHX30RVbTaJvQXvLM6y8ggxJvEgv9UT0VsLWBrp5ER+yAj6ZrOVeTIH398PL0d4JokxpURAx/PaKDfOiqxDVXvnOFSmrF7t60qqlO3ur/LBWk11dYE7rzR2XnUJd3dWUKVeDg+eys5t1zCtdvJIH2xDFNmevbEs7Sj3zYH6C8rX39HR2Gt0R0ctJF/9jnBZJjYpH4z/keB+KuQXZEnzpfnNtbtdAC7IMS4YBP0G7Fkv0q1YOG3a8KbwLedvqkU9gseJxJL1ev+qqrEj82+nZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by SA3PR12MB8024.namprd12.prod.outlook.com
 (2603:10b6:806:312::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 21:34:14 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8%4]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 21:34:14 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Thu, 18 Sep 2025 14:33:47 -0700
Subject: [PATCH linux dev-6.12 01/14] net: mctp: don't use source cb data
 when forwarding, ensure pkt_type is set
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-mctp_gateway_routing-v1-1-8fdedda742c3@nvidia.com>
References: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
In-Reply-To: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Cc: andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758231249; l=2372;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=+qGWgu2fWMakeRw69yVxvhvfap912tXYEx98HQ1d9I4=;
 b=ON4Z2XlChcF/gAuZuDqsE+5MDXlz6tf/lfUs8IlvANVIIUBSvNCSlguWTD4xcdOJ1WKC7dNju
 HMcZWkMCS55DmjGmjL9FVf9WbnjmqBYAxsBZjQQOoh5JW6lKGu/6N5/
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::31) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: f16a1ced-3644-42be-b1ad-08ddf6fb1d02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGJYT1o1K3Vna3VjK0ZiVGdoREJ5QVU0Rm5oN1d4dzQrN0VUU3lsLy9SN3N2?=
 =?utf-8?B?ZFAzU2VIZ1FURnBMSkVHTWVmWVhXUVNhM3pSOWV6Z0pPSTFGZHhzTE9LK05B?=
 =?utf-8?B?QWNyTzlzVmMzc0s5RDdBWjRnWDdhNUQ2Y2l4Mmp6WnVnTXJPY0FzMnAycy8r?=
 =?utf-8?B?T2lJdjNCRE1TdldqNVcySzdtYWlSV082WE5hTEJIYWg4a1FVZEdaTUl5RGRw?=
 =?utf-8?B?dGNsYlVPT04rWFY5ZzVmMlRtbUtQSUNmM0daMCt0dFR1bnJ4czlId0hOS2xI?=
 =?utf-8?B?d25nc0l4cVR1eWFCM09zL3BLTllDVDlVMk5nTDgxRmd5MGxOQWJKNEkyd204?=
 =?utf-8?B?d1ArSWRQWEpBU0cwTU5wNTIwWDNhc0JVck1rdjJCck85cGl0UWc2Z1ZiYTFq?=
 =?utf-8?B?Qk0zZ3ovcExGUVBYUHZoa0orOVRvNHlUdTRxcjlhbDdzd0d3bjFJN0J3Rzda?=
 =?utf-8?B?ekVZM0o4QVYzTlpPalFDVmVYM1o2YW5CTjZDZUpPb0VOckFiQmNjZ3RKNVhV?=
 =?utf-8?B?ZVorUlFKTzFRZTE0T2U3NTRWandlRCtDYVNvdEtHZDF2ZnZCRkJKZiszZzRL?=
 =?utf-8?B?T3czeVp0VDdGbDNUVU9UOEdqdXZtbDJQNU10N1FtdUc1ZDlZUGNtT1NObnRt?=
 =?utf-8?B?WUdlYmtwenJNZlpYSlZHcnBMZ2hoc2RjWVkzN3p3Y0NXcjZZRlF1MmxLQ2Fy?=
 =?utf-8?B?TWVJQ1BxTGN4cXRMeW81c3Y0Qlk5dUxNNUdpd0xQZ3RJRnZINFN4VGx0cmZI?=
 =?utf-8?B?am9jdVQvSHI0anJUQ0ZGOHdFZXlKQkExbk1hVS8xRmhBK0hTVkxob3l5ak5V?=
 =?utf-8?B?eTlJZ2oyUnBtTm54TlQ1QTVzeStKWXRCWWZ5WXZSNmdLVEVKdk1vY2hKZC9O?=
 =?utf-8?B?ZlBVcmRiQjBJTnVOTitCeThkTEJZTkhpYnlaeTJmbWEwR1hHV2NZOVBBRFYw?=
 =?utf-8?B?MTNiRGx2MWJLTUtFR3kvV0FwQnZTYUZyeU1IRjVHd0xEU21aOFRhVFcvRGRa?=
 =?utf-8?B?QTZpOWdpN251WS8wVHM4Y3dUYk0waWx3cCt0RHREL3Q5dlBJTGkvSnExQmRZ?=
 =?utf-8?B?eFNncFJ0Y2EwckxnNDBiNThNMW5aMVRmeFNQMTZwWHJaUDRydFd3UE0vRnVo?=
 =?utf-8?B?SWEyQ3NVY1FlUWJWZ2hicGh2Z3lOMktSaXNBQzB0R3ljWENvbXFXOTBuUDhG?=
 =?utf-8?B?cUFuUVFrVzRadDBZNS83Y2dLYzNYTzUvaW1nOUJibnpsWFZFeUVtM1FVQlZi?=
 =?utf-8?B?Q085SWgwUHRKMlFnZnp0UENZSGJvamFqdG92T1NRNWlYV3NMNFI4czRIYkpT?=
 =?utf-8?B?MzFQZ2NoQ2VJWkpOUlpVdGVIQ2orRlJvdGZHbDhYaWRmT3loR0hVY3FkWUxM?=
 =?utf-8?B?SE54T0VkaU15ajYxN0tVWjFkSDlPTFV6SVBzV24veFFzMXpmQXRuWG1FQmsr?=
 =?utf-8?B?by9NNEh1STRvb01JMUROR2g2WVBSdUtveEZBS0hJamZJVklXbUJabU9sMEYz?=
 =?utf-8?B?Y0duR3NWVFhPYUpGMTFmMEFBbE40SDNFL0Z2R3hWTTVOQ0xDWlE2dmt0dUxj?=
 =?utf-8?B?OUlXRFdINVVyNHlHaXd1VnBITTVRbjh3blNrY0pYZW1ZQm9SQndpRXFGL05Y?=
 =?utf-8?B?TzlZUTE4c0c1RkpNQnRTbU9td0szRDZZZ2c2SnFGekFXbmppb2NheWlHYUhh?=
 =?utf-8?B?OTBzbWhwMkVqZ0xZNXdCSHErNWI1bTdha2JYVWtxOGJyZTBMVGtWQ21HVGw0?=
 =?utf-8?B?Ry9tNWFqT2xSU25FKzZIWGkxU29iZU1CS1Zla3NQS1E5MGppMldOUzN3OGly?=
 =?utf-8?B?SkFQZWlEaUNCbEJZVW9EOFFyQnVNdzFnTmxxWTlCalpjckU1TkE4QlZNcmhw?=
 =?utf-8?B?NTg1T2ZPQndEZzBicUs2alVONFQ3VVgzak5ibERoNkRsRGdDM2JnWWQ3dGZC?=
 =?utf-8?Q?EzDENWFiNeg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTJybXZoNkNVYkh5MmNyU2xiRlNhSUowS25EY0RoY1JiUE1ZTU1iMGJVL0hw?=
 =?utf-8?B?aG0wNlVQc1dzTjB1dEY4WWdVV2IvSC9HTEQ0NHRlZ2tHZllGSUpzTFNxL2dC?=
 =?utf-8?B?L1hiSk5oUS9SZVdGNURVTFBzcnEvemdqNElGRXd5Smg5VGsyc2IxVitYSzlF?=
 =?utf-8?B?dDBBcThtQUNCYUo5S3I5L25Obm4wbDJnc0d0bDdLaWFWeEh0RTZnZkg1ZTRu?=
 =?utf-8?B?YXZOSHh1Q2tjbEI0TFFsOWoyN0JQWi9yR1c0RFdVdDFPQWFzREtobFlrWm5i?=
 =?utf-8?B?OUNKODlFS2lzR1h6dllZbVE0SlVkVDdDTEpSSytmdkt6VXBmcm14RGxHa3Ir?=
 =?utf-8?B?ZzEwSUN5NEZvVlhsc2paTjdiZ1lNbHh6cWRlZG02NjRnb1MzOWhJRWpaVTFX?=
 =?utf-8?B?UlFmVTV0WVdTK0RrVkF1dWZJcGJzb2k4U2tqekRYUXhDa3Znc2p3cjNja3Uv?=
 =?utf-8?B?dzFTcSt2T2syeTM0eVZYdElaeFp5R2JlR0dmbVF5a1o3and6dnBYb1FHZ3B2?=
 =?utf-8?B?b1BtSzZ6T3g2MG56eG94R3ltbEczbG5WalhabTgwaENKM3Qyd1JyeGVUYnQ1?=
 =?utf-8?B?SUloUnhDUzYrQWRXUnJ1VGEzazZUOHNlc0dzR0RoNldxVnBtUWR1R3lIRkVO?=
 =?utf-8?B?Q0NJR1Y5SkRvYTcvRklzWE9aYW5kbGZHL1UrdTVzS1lNUEhYVXZ3Q281OGs4?=
 =?utf-8?B?M2YwL2hpRXd1dTRYdWpINHV4Z1hsVjRCNGc1MXJXVWxhYWc0d083U2NSc2V4?=
 =?utf-8?B?S2l5ekNzcVR2c01hTU05M0I1VUZxeXNmZGJuWmsxNjRIVk55dEc5cW1menMw?=
 =?utf-8?B?QXpjaU1VbGpmRnQ4ZHJJQktBeHpHQVM2UTZnUnM1TEZEN0tUUmZPKzdoZFBj?=
 =?utf-8?B?cC8wVVFiTTQyN1J4WWt4UWxKNXVPWDlOM3VUUGFneE9GR0FmMkNoOXlRc1Rv?=
 =?utf-8?B?SXllWVU1MkxtK3krUlBIdHFtS29CVlJUTEJZN1l1TWxaRUxaOFNtVDM4SXhs?=
 =?utf-8?B?ejROV3R2dDR5RmtsUVV6NVhXVHk2c2hLVVFBT1hIVFlRZXlBVThIVGJaMzhQ?=
 =?utf-8?B?dEJlYVFzUG0zVGxDZFVCVFdNcWRYNFpDZ2lKbjdaZjFHc0xIbUNDRnplTTRa?=
 =?utf-8?B?Z0hVYVA0Z2FFZUlGN0dBRWRsb1lUblJJbnhlckRYYlFOSzdiTnpYK1NicWFR?=
 =?utf-8?B?TVZoR2svL2pXZ3krdU9kQUI3aGVjUFlKQ0xqQ2pKRitkeDdSbEIzK0E2T2Jk?=
 =?utf-8?B?Y1h0VEluRkFFTFhxcUs1ZldoZjVGYU5NaHoxb29OWlJCTi9HZE1FaTJhUDRh?=
 =?utf-8?B?U3U1eUkwbFFudjJ0RDJkOE9kNXBjM2NYdkF5c1dLakw5TnF3Y1FTNk51QjBG?=
 =?utf-8?B?WTBoYlllY2FndjFhZU91QzI5eTlNQmVFVTFnSGlqU1dBcG9RcW1GSFQ0WXo5?=
 =?utf-8?B?S0tEUlJFNEt1N1VERjYxY0VMQnNYcXZvQm1RSXFHdFQrM1NSTzg5dWJ4Y3FF?=
 =?utf-8?B?ME5KNEIySDBVK2QvclhFaFV4WnFwYzBZT0ZYY0FvMmpFb0g4Zmt0NTljcHpC?=
 =?utf-8?B?SGRpdzQ3aGZ2ZmduM2g4WTltMHhHRWtFWGNpaW0wanA5K3hpS0lhWnFKODRN?=
 =?utf-8?B?TEJYWnErR1hkQlludlVEbDVLMlMrYjdYbnkwUU90WXpqdEd1S3R5VTRETlEx?=
 =?utf-8?B?VE9lMkJpTmxPZUovUG5oWFQrUmp0SWJ1WHdQMytwcndvTEZCVHF4Uk9KdW5y?=
 =?utf-8?B?SFphUmlwbEpDTXJWa1RCMnF3bUNYKzZGUHYyUnE1OGdFM3NMVGpWUDRaU09j?=
 =?utf-8?B?R3BRSEpwWjhKVEpSenZXT0czOEVEbWNLYm1ENk1BaVhkNTk2Y01KcGMwdkZs?=
 =?utf-8?B?aGNtdmU0NVBZMnRPS1VDZ1VwdUphMVI5UXpGeWNqTXBYZmJXSS91L2lBM0cr?=
 =?utf-8?B?UnVYTlM1VUV5M1JVOHNBVFJvRVJVMzRWUVl2M1MxS3dXUVExVVFYMjJmbjA3?=
 =?utf-8?B?bXNTUE8rWmNlWlEyMVBQWUZZY2NoamZvYWg2V000QldEN1EzRFR2VS95b1JO?=
 =?utf-8?B?WWJadjFSRmFoNVhJK0dsa0hjNnFLL2ZkaVJlTzNYamcwL3JJSTRHSmtVZExo?=
 =?utf-8?Q?jZSZcuqxKeUzYoU13n9AgJ/yA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f16a1ced-3644-42be-b1ad-08ddf6fb1d02
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 21:34:14.2037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAzJvH3n+Quv3Hx/OhOdDfHMkGEmk38nj9E5uDxVIL9cKhO3+VtuvzEk0Ujk2Tx+utBO80lX1YHqjBGjsbIV+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jeremy Kerr <jk@codeconstruct.com.au>

In the output path, only check the skb->cb data when we know it's from
a local socket; input packets will have source address information there
instead.

In order to detect when we're forwarding, set skb->pkt_type on
input/output.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Link: https://patch.msgid.link/20250702-dev-forwarding-v5-1-1468191da8a4@codeconstruct.com.au
Signed-off-by: Paolo Abeni <pabeni@redhat.com>

(cherry picked from commit e0f3c79cc0bbf4925de1afde5abf148b7f7f4398)
---
 net/mctp/route.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/net/mctp/route.c b/net/mctp/route.c
index d9c8e5a5f9ce9aefbf16730c65a1f54caa5592b9..128ac46dda5eb882994960b8c0eb671007ad8583 100644
--- a/net/mctp/route.c
+++ b/net/mctp/route.c
@@ -392,6 +392,9 @@ static int mctp_route_input(struct mctp_route *route, struct sk_buff *skb)
 	 */
 	skb_orphan(skb);
 
+	if (skb->pkt_type == PACKET_OUTGOING)
+		skb->pkt_type = PACKET_LOOPBACK;
+
 	/* ensure we have enough data for a header and a type */
 	if (skb->len < sizeof(struct mctp_hdr) + 1)
 		goto out;
@@ -578,7 +581,13 @@ static int mctp_route_output(struct mctp_route *route, struct sk_buff *skb)
 		return -EMSGSIZE;
 	}
 
-	if (cb->ifindex) {
+	/* If we're forwarding, we don't want to use the input path's cb,
+	 * as it holds the *source* hardware addressing information.
+	 *
+	 * We will have a PACKET_HOST skb from the dev, or PACKET_OUTGOING
+	 * from a socket; only use cb in the latter case.
+	 */
+	if (skb->pkt_type == PACKET_OUTGOING && cb->ifindex) {
 		/* direct route; use the hwaddr we stashed in sendmsg */
 		if (cb->halen != skb->dev->addr_len) {
 			/* sanity check, sendmsg should have already caught this */
@@ -587,6 +596,7 @@ static int mctp_route_output(struct mctp_route *route, struct sk_buff *skb)
 		}
 		daddr = cb->haddr;
 	} else {
+		skb->pkt_type = PACKET_OUTGOING;
 		/* If lookup fails let the device handle daddr==NULL */
 		if (mctp_neigh_lookup(route->dev, hdr->dest, daddr_buf) == 0)
 			daddr = daddr_buf;
@@ -1032,6 +1042,7 @@ int mctp_local_output(struct sock *sk, struct mctp_route *rt,
 		tag = req_tag & MCTP_TAG_MASK;
 	}
 
+	skb->pkt_type = PACKET_OUTGOING;
 	skb->protocol = htons(ETH_P_MCTP);
 	skb->priority = 0;
 	skb_reset_transport_header(skb);

-- 
2.34.1


