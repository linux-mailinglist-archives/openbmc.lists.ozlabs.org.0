Return-Path: <openbmc+bounces-667-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95677B8728B
	for <lists+openbmc@lfdr.de>; Thu, 18 Sep 2025 23:36:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSTS83Cw4z3ccw;
	Fri, 19 Sep 2025 07:34:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758231288;
	cv=pass; b=n6NE6ZLSPDBNxs9sV65oVUzIVMl8mlseh6ragVouQOD5XPimti4JIxpviMUHkc0zHdB+tCM76dcNBzCDvqn2CT6VyWymibHDRYB8GOksdWQQaorgjv5hFKq+aRb8DJ79og155utmjFGtemEz/V/GW39oJiAZIWEDWBScvmMfTe4AAESJov8A5pyL5oU8ZOEiYltyBKej1bC1WQ/m3B3b8+LbNqHGlk2do8l+Q7xLILhdNe1DdSxrIimfj+eG2WjFf2jJmX9CsOxrf4qy5vhRszXARh4HcKcIznUAhDyIrCHA87ggnnMQVgXzrNMsK+3UqrtawGXJUBpFlP5ecejPLA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758231288; c=relaxed/relaxed;
	bh=sloUscAj7eB1J5SKBqQoD+qcosslvoQncUxe/jFTX4U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FdpmDLljC+gDs/Pn8E/oCrRqf51uRLVHTADwmZXIJxvBgfahXLU/h5RzcZUHBnETWy293I5ydTAxLusvGMzHdYwcdXZphzHLfGijwExJfFw7wE0LHIEMuQgpz5lE4m3Wh44DceX0DNkb7YGFqPtXZIfqVyjVXMU4ojDzaI+fb61MBGOpYWUPnyGvuvA7AwNE4CKmVRdgtJqz7ara28ZWBD0aNvf6DckA6iU/COsvvy6o6Le1P1O38lN+NzhNxAEbXarDlkWtLVcaN4l20wz6dHelmvr2Hrv6Nhy0mNeqRlR0Di1h+y9qY/OYT67za+eC9Rq3tBTpmaWSF2zV9tis5w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=g5CzAPF1; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=g5CzAPF1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSTS74Zjnz3cbL
	for <openbmc@lists.ozlabs.org>; Fri, 19 Sep 2025 07:34:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AeURnnWwGkGVxE4eJDFAoDbBx21/tdH9m1iQ4MjttzkGolRcSCS15KRpBCgGLPwKST0OC0VJrvF3Sv/9d+0GPjS06EprUlupHsZg25zp6BvarF66ZOce1E5+YVNLekA7yYlG+dqdxTDRbgW96Jxp6ljhyPMyOGCMjhhFm/f/cFXwelW8pI/6cgJRMuzYq3TzJRdxgDipo8Wj7+cBATX6TXAdaT0bP7S474xYSGpTlEUIUVeQrA4QPOM2c9Tj7rUAHhQ/nNE5+ummHx+f1tqOOMyjXURmvWFYdc2agRmenr1Vmx9W8HY7N9oC9/KrxpnB5e7ogBuldq5oepcMjxtzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sloUscAj7eB1J5SKBqQoD+qcosslvoQncUxe/jFTX4U=;
 b=VCNxn3Ij1SFuOcJ6kjskFcJjKTrkAcC6IZG+Uh65t3i8sUAbwn24tFwyDf0wIF0GJut/SdQwvBNreeCCbpXTe6K6F9GvuiGuRLXQcHFJPR2a48uK83P0mOQZoQ+NFIQASFfONzBxoIy4bF0uq9fZ2CGpwy1zH6qSjU/L4B4YoX+wrTexIlSvHxJHK+npkgO0AILYwo3/TrQwBR7zltqsabdTYhB2uoHJHyR8eAkv745fQ4a9/gnGB82oxHm15y81qKAvhXYO7Zxeqtw3uW4baRyR91AjzaNg+I2TZcMzkTTQ4L0gKxJhEpONpr0WsiAnuRb8clpctEQSJ32wI0522w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sloUscAj7eB1J5SKBqQoD+qcosslvoQncUxe/jFTX4U=;
 b=g5CzAPF1hX31LJV2Q5/Y7hCqRFgttfC4+SMhmEHJV84LnkidFGlIx0s7+i+xuMOFhiYGUqiZhauMQKvIyHtqqn7WFlPduLtksy3AHBVIDpmlIXXy+pthA+bhhoodnC1JLfykFLsH420SK38Bug9+3/3WCQhOBVjuynyGyPAWFXFCa1DWf84zi0LDYeOZVzrk1//skL1eGU8ZrepqX2rKecbwTJW70b9tdSYrEa5kWyDIx3Vxl2yedL6CmANmUDZNSjZ0FQzdyTrhq9kF0DC92mux4nwD1dIYreSO72JYjlnsPMiH3piP9U/7iBkP2fnLD2kHa383Y7Rk0Fk7AZTIBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by SA3PR12MB8024.namprd12.prod.outlook.com
 (2603:10b6:806:312::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 21:34:30 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8%4]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 21:34:30 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Thu, 18 Sep 2025 14:33:57 -0700
Subject: [PATCH linux dev-6.12 11/14] net: mctp: remove routes by netid,
 not by device
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-mctp_gateway_routing-v1-11-8fdedda742c3@nvidia.com>
References: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
In-Reply-To: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Cc: andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758231250; l=2522;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=ch1dkxjc/1P9Jl+hZVIdIpAahcij2/hXC+mGbWiOTgE=;
 b=f5cpdAdUBiDlmZDwyYXoMgaKDwWt0IqLGhRsKNfjH6Ho6Qp0NCykPmFRGrl99lvIjCKcbM5SB
 BS+jsdR7zvOA/ybEVbvvEVJF3UqG9Db92prb/olNGVbP93IDjyTKaa3
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4P223CA0025.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::30) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: faf69400-7bc6-4e7b-e230-08ddf6fb2671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rmh2VDdYMElNMGV0Q291N2tRcVAreGFzWVVEdGZ3d2Z4VGFoazNpSDFMTjky?=
 =?utf-8?B?a3dJU3BaSUtBejd3cTlONTJEWU9JQTlNNUs5NWYzajF3a1dCNTZWZzVncEgv?=
 =?utf-8?B?dVhMaVY2cDQxeUxscUpjaHd1LzRCMFNNTjhZRjM4dXFGRFMvSDUraEhSeEE2?=
 =?utf-8?B?NlpQbEUwNTZiaEZQc2dTU3dFZVRrWEZPZUxIWjdBWlBzeW4reUg2KzZhL3Jk?=
 =?utf-8?B?bkMzY2JXSDY1M2k4Yk5iaVVjR0pkN2FTRW5qNmlqOXBNUU1OL2NCcXlLc3Rz?=
 =?utf-8?B?RFhoL0cvaXVDeEIxY0pwdjFPK1lDc1dvOEZSQWl6VVFsYStzV3pUNFZBTDRY?=
 =?utf-8?B?cEp5UXEyQUdGRVhtMGd0VjB3UDBpbXBEd2E3SzR2UytXTEQ4VUJnTmNLQS9D?=
 =?utf-8?B?TEFjdEF5OGdwUWdjMnhnZjFpQlBNQmphcm5wclAyMTVRTmhOUkhHYnd5aCtn?=
 =?utf-8?B?Yzlnb2R5aWlsOXAzZGgwcy9TSnpNbFF2RklwajZ2VlJZalh0RVJIV2xIV1Zu?=
 =?utf-8?B?ZjRaSnZGRFZZYVVPM25DK1pmOGh2d0FiQ3pCN0pKM1BNcitQdUFFeFZDMHp1?=
 =?utf-8?B?ZkQvTWxYV3piYk5MaWNjS2RpaUI3SUVPSDBINitZSnFMVFMrL0N5SU9qWVl0?=
 =?utf-8?B?RHBWTVMzeG9PK1Y5SEJtRDF3aWhnOWxvWmdLWkhLdjNYU0FyN3QvbGtuL2ln?=
 =?utf-8?B?VU5seWdQM3A4SU1pckZSZjE3VUlFelRtMk83UlZtRHc5ZWF2TUs5ckVVV0tm?=
 =?utf-8?B?VXUwMVI4Z01ZanIxV2xJQWk0bjU4bHhpSlF4YjdVUHhzSldid1dsN2w3WkNw?=
 =?utf-8?B?akVMV1FkTHB1a0lxZVc0YU85TE5RdjlzRmlBYnJSWUwxcjBpb3FrL0JaKzRJ?=
 =?utf-8?B?UkpOOFJsK2hHOEdOSnhudGlLN2svWlV2WDRlZmFyalhzenozRFB0K2JIdVhG?=
 =?utf-8?B?ak1IV1k4M1BqcU45UnlQRXFnMU1Lb1J3eXh0U0k5WFpxVHZOWDFjWjZRMDJ0?=
 =?utf-8?B?dmtxMy9ieU5rWjB4Y0o4bHB1aXoxeUtpeHBPUUxiSDFiODVIZzlIM0xHeG5l?=
 =?utf-8?B?ZVJjYkFPRHBiUFF3ditYV1kwblAySmx5NGJpTXlmYjJIUnZaVlpEeHZ2eG55?=
 =?utf-8?B?T3dydWlZMnVZSmgzdkpZRHh0UVBid3pxODUzaUpiYnNOeEg2MTN0cS9xTURC?=
 =?utf-8?B?WXF0VENGNzlZcXF5ZWRHVzM5alNzcVB3UndmV1hvd2dpaXJ1U2EzRjdsYTRa?=
 =?utf-8?B?UHBGTS9Nek9uQU9aa3lHZGdBZzAxWDFvNko1VWNCSXhjamEzQ05yWWpOaWFs?=
 =?utf-8?B?eVJYVWEyS3kvdzlzRlRBaEZqemhCV21VZWNEa3JUdmVadXRFNngxUHNhOGg3?=
 =?utf-8?B?eTBFMDg3ZmtyZUR6S2dBaWVtaWdVdHkwOC9vMDdKS3F2QXhsRTVNVld2WVhW?=
 =?utf-8?B?U3JSL0lZMEhOc2lab09RdE01UVYvcGNwZUdOaGl1NWtoblBFT0M0d0pDZmNB?=
 =?utf-8?B?SVdKTGhrRERkOUVwVHZsY0g5K0k5RGx1RFZ0dURHT0R0SGJMNGpMZSszUzNF?=
 =?utf-8?B?S1ZQYXRJR2RpZ2FNNXA5M0ExT09wWXZyV0o1NTNiZ3IzWGRkMi9qemQrRUxp?=
 =?utf-8?B?ZjhlaUtMYklnM3h4bHg2Y1kzQXhFRzFZTXM1ME5tZ0JGNzdZcEhaaXJIUU9j?=
 =?utf-8?B?RHlGM0dLQVhSRzlMa21Lc1VySHhiR1pyS0ROekFQNGxERkx1QThRSzFHN05O?=
 =?utf-8?B?OHBjUVdjQWFYT3M1QytyN01zL0x0b1UrZEFkQ1FsNlEvSlpBclNzazBRWlRL?=
 =?utf-8?B?dVljSlRKMWRsd2FRUXhsS2RWN28zckNCSXFqdDBGZUcrWGt1UzAvQ1Q4dHhn?=
 =?utf-8?B?OUtUd3pXdDgwNlhrNmVYdFFsV0thMTJFQnNTWUtQeVZQeld2Z0RabDRFZm9y?=
 =?utf-8?Q?CT/tNMfmmS0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzgwU0VYa3J0U3h5dVQzL0loT2Y1dGhWMTQyNW1McWRWMkRNNlBZNzRIc3Jv?=
 =?utf-8?B?SCt0WFg4RTFETHVtRHNySlFNL3cySlV3aEdlcnc1Y3diOU10Q0UwTnp6SDdu?=
 =?utf-8?B?aStRU2tDRThjOFIzcE9hSTgzN256NGhkQkpkbHdGd2ZEeUhZczdhRnNSSXVl?=
 =?utf-8?B?MkY0QWx3cEZCR0Z1ZDIwU05GaXZxWHhjWVZOQVVseW54MzlaZnJONWFaL1d5?=
 =?utf-8?B?NllzKzZGemNicncvZDRVTXc4eTEvcFRxU1gxN1dCaVM3bTJMdjhES2R1eWhG?=
 =?utf-8?B?elh5NjZ2T2MvZEJYd0VNTlVubWFIaXdxTkxManIrSTFkQ2MzN0N5djZlZmdl?=
 =?utf-8?B?RXh6Z2krdkhpRStUV3QwQmtzTFoxckpGajdueWF3N3VtZTdtU2cwZWIzMXlR?=
 =?utf-8?B?OVhxbnZjcGNOU09yYWg5bGFUZFJnT3Y3eklxMHFrQzlOcGFkR012SmJ6T3dp?=
 =?utf-8?B?aDZ2ZFpQV1RXbTRab1hHNS84ZnBuVFZZVkJPR245RVludFY2bXJIOFo1bEty?=
 =?utf-8?B?OFArOGRJWEloU21ha2N1akRxMlRiclVFR2pWbG5RVTVaTzlUMzlrbU9FTkJp?=
 =?utf-8?B?bFpwSzB5QlpnenNUNXhTV2NNaldJeXJpYzhaNkhLeUN0cEtqVWZPcVlsWjk3?=
 =?utf-8?B?TkxxVjE4SXRoWVJFUVNwR0dLcEFTY2YyWjJYNkNGRDBsMzN0cGhYblFQczhW?=
 =?utf-8?B?RjNETnJsaG5XUHNNdUZXQWRhL3RzTmVDV1pHdE5jN2tyTU5YWXM5b1RVcGdI?=
 =?utf-8?B?SElTc1o0c29tbU5EeTZPTWUxWk9wSWJNS2R4N3p1NWw3WE1PTVdrZjR1eVYz?=
 =?utf-8?B?bUVWTVkzbS8rZktiNjVwTUZwWkc2bVF1d1A0TC91WUpFSWNIdWhVYks2SHdv?=
 =?utf-8?B?NldRU0RlekJLYkJEejBKY1JycmxOOXoveVNFakQzTUV2Z29id2h2M1R5RVEw?=
 =?utf-8?B?VXNoMEVaOUQwTU1QbE9qMDR6dm9yWi9hQ21OZlpPYUZ5aktDVmFnNmxtQzNI?=
 =?utf-8?B?aUVocElZS1dHL3FIVWE3UVFCRmdlamE4Q1ZBM1Y0MGgvbDJCZUVDVFhtS05K?=
 =?utf-8?B?b0dWd0JycG1ZeUd3Y0FOSHV2WkZDREU5K1pHUWwwSkdYQWVjdWpqTjlzM0Nx?=
 =?utf-8?B?d2cxYURUWVNzaVY1UzQxQjE3RE9aN2VuUFA1cmpMRVF3SUFETEdOR3RySS9k?=
 =?utf-8?B?VUtWczRSYi85d3Ztb1Z1aW1aRk9MbkVRMDY0UVZabFdtWTFYZGE0bnNzb0p4?=
 =?utf-8?B?cms4WkhxRHlMeE4rVFM1Z01ObDdxZmNZUU9XNCtUcHRkdWRSZE84RTd1bE05?=
 =?utf-8?B?M0FTVC8rRlJ2cndSSHFwTkRVSlVuQjFHOCtzUGdTUFlJNnBVR0YxckE0Mmps?=
 =?utf-8?B?RUZibm5mOXBVbStjdHFab1k1M3BZVnluMXU0SXZFRVBPVjEycFM4aUMxcHky?=
 =?utf-8?B?eUdweDZWQUxjMWZGVlloTHVoUTJYZlBIaUMyM1QzdDJ3K3hYMVNxYU8xQ0pW?=
 =?utf-8?B?d3UzTXdHVlRCK3Q0OHp2cmZsU3lERmNFQnQ2OXgwSE53US9uaHAyMis1T1BH?=
 =?utf-8?B?MHc0MWUrUCtnVHRnVDA4Y2tqQXJ3RHdydnBwQU1YREgwcVN6amczWHFFcTJx?=
 =?utf-8?B?bURkcjI5SjVzM1FRclVxMUFCRGN0MzJNZXJGR0R6TjZURFo4UExFckNSNzVr?=
 =?utf-8?B?WTJzOXYxN0JKNjBTQUhzangzRXkrTjRMcGkrYW9aVmdYNUZtMllVTmtIQUUv?=
 =?utf-8?B?ZEFlSnJjejVldmN5TmVQdG1hMjRiK0Exa0lVL0tiSHpUd1NlNW9lNFBZalhF?=
 =?utf-8?B?Y3VZOWZjSWNxNk5IV2ZDUTh0Tk1MYjJ6YjdkcG9CemJxOVVUYlB5d3VkVWVD?=
 =?utf-8?B?UWVCQ1ZmNEhuVXJablJRUmhOaUt2djFiZzlBa08yRElycTJyY2JCYVVqQU4y?=
 =?utf-8?B?bkprWFoyRjh4anlBRlRZK1NYdWpxRUNOeGhCMFlTUlN5SlAyTHpkdWxQV0g3?=
 =?utf-8?B?eFNhdzVIUHNMdVNRYk1wWUFZMVVpbE4wNTJ3U05rS0JFaE1PR0lYeTdLRUtO?=
 =?utf-8?B?S1cvRTgvdWVPTVk3bElvZDR1VFFybmtQb2hCbzFTczVWb3lNeGhBakdyL3J6?=
 =?utf-8?Q?35k19ickNuezFftA1rDPCkHwd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faf69400-7bc6-4e7b-e230-08ddf6fb2671
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 21:34:29.9938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +++LG0Bu+9RMgXlG26HZuSIX9jjT00Y3eXsZklJ5iXOReKXTKwCBbF56bokEIFNmeLIjcE1LSB1vcXIqGBxubw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jeremy Kerr <jk@codeconstruct.com.au>

In upcoming changes, a route may not have a device associated. Since the
route is matched on the (network, eid) tuple, pass the netid itself into
mctp_route_remove.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Link: https://patch.msgid.link/20250702-dev-forwarding-v5-11-1468191da8a4@codeconstruct.com.au
Signed-off-by: Paolo Abeni <pabeni@redhat.com>

(cherry picked from commit 4a1de053d7f0940936f6602ad53fe077bb10ff7f)
---
 net/mctp/route.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/net/mctp/route.c b/net/mctp/route.c
index 66395f782759b6a2131342fda099fe5d7cdc4c38..f96265acf16f4ecedad7a3edf2367cfc7f56be7f 100644
--- a/net/mctp/route.c
+++ b/net/mctp/route.c
@@ -1085,6 +1085,11 @@ int mctp_local_output(struct sock *sk, struct mctp_dst *dst,
 	return rc;
 }
 
+static unsigned int mctp_route_netid(struct mctp_route *rt)
+{
+	return rt->dev->net;
+}
+
 /* route management */
 static int mctp_route_add(struct net *net, struct mctp_dev *mdev,
 			  mctp_eid_t daddr_start, unsigned int daddr_extent,
@@ -1137,7 +1142,7 @@ static int mctp_route_add(struct net *net, struct mctp_dev *mdev,
 	return 0;
 }
 
-static int mctp_route_remove(struct net *net, struct mctp_dev *mdev,
+static int mctp_route_remove(struct net *net, unsigned int netid,
 			     mctp_eid_t daddr_start, unsigned int daddr_extent,
 			     unsigned char type)
 {
@@ -1154,7 +1159,7 @@ static int mctp_route_remove(struct net *net, struct mctp_dev *mdev,
 	ASSERT_RTNL();
 
 	list_for_each_entry_safe(rt, tmp, &net->mctp.routes, list) {
-		if (rt->dev == mdev &&
+		if (mctp_route_netid(rt) == netid &&
 		    rt->min == daddr_start && rt->max == daddr_end &&
 		    rt->type == type) {
 			list_del_rcu(&rt->list);
@@ -1174,7 +1179,8 @@ int mctp_route_add_local(struct mctp_dev *mdev, mctp_eid_t addr)
 
 int mctp_route_remove_local(struct mctp_dev *mdev, mctp_eid_t addr)
 {
-	return mctp_route_remove(dev_net(mdev->dev), mdev, addr, 0, RTN_LOCAL);
+	return mctp_route_remove(dev_net(mdev->dev), mdev->net,
+				 addr, 0, RTN_LOCAL);
 }
 
 /* removes all entries for a given device */
@@ -1394,7 +1400,7 @@ static int mctp_delroute(struct sk_buff *skb, struct nlmsghdr *nlh,
 	if (rtm->rtm_type != RTN_UNICAST)
 		return -EINVAL;
 
-	rc = mctp_route_remove(net, mdev, daddr_start, rtm->rtm_dst_len,
+	rc = mctp_route_remove(net, mdev->net, daddr_start, rtm->rtm_dst_len,
 			       RTN_UNICAST);
 	return rc;
 }

-- 
2.34.1


