Return-Path: <openbmc+bounces-963-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CECE9C9D5FD
	for <lists+openbmc@lfdr.de>; Wed, 03 Dec 2025 00:53:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLczc5YdHz2xqs;
	Wed, 03 Dec 2025 10:53:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764719612;
	cv=pass; b=c57eJOiS6CjNbIedMj36DJElAzoLAT8h6/X85xt3IJmGXQNyZmghrnfXVRSKQNk/3rt4skBCZQ6PxExHnO7YG753b1R4uV/gfJBDljHOE1sBKA619yW4yEmxrkMlDF6dG5G9ucrrbuqHO7pW0oBk/5QRrvH5/5KimwhNl3bzs8p9U+iGltJtoMFHZavWHbb4l1S44bJ2Cz0jGDDX3jDYq6snsH+u1eQXTXqmSO6cQoJ1Lf9i2SazqRhZZ5bqLXrNgWpCWxrW/ZOgcz7naZ3qWD5+SAIrgatNOH2FTw5vN9ep9gMX/uLZ9+ALMSxhVIKa7uovIfy1gDhfk/DiLwaRSg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764719612; c=relaxed/relaxed;
	bh=i5b4t+l+Yaj/v2mUxRZmM2dfeEUp7zFVlmnW/AWAmTE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fJ59jRyTkoO+PDfOtkRF13ZhRsQasVbYqrSqzpk2YX+5tYs7soMksytPJheEv/h11MFbPTq4LZLaveq34Tzmbk4ojiJNzAaQvB1YWioDjYEXdHsjb8kKUTBgEbhkELRG0F1U2ZWr7n0kHjj1V8SsWrgdIeS7fN37zVdTHkVIPxW3b4fFlpcjkdNd/CsbUSwIlK+DQBvy0pHDuJCf7jSrJHVeefZ0sjVaCOW4/iN/jYV1z7TzKGetbcEvWiEgFcMY3cq+1LNyC+C4JUzpE6JzlCT996igzdRPTefO8cmJb5dBmjoWHoQadPEHKwnySUrYi4YfXP10nJnFgS4uJIAI7g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bNTpX3Eo; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::3; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bNTpX3Eo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c107::3; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLczb0tfGz2xqg
	for <openbmc@lists.ozlabs.org>; Wed, 03 Dec 2025 10:53:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FKJAGK8VhyuDnkaA3h98r7SnOTjeCNLA/jCzovV6ateXZgRRplmLXH96VDAmFU3ajPTcHyJnxhh6rqrnktPco3cuD2u54KzWYNdzJ4zTQGdJPgR7qNwrem3rWSIH2M7AY9u+8jRVNB6TqXVxXB2Y0mcUNQqoreNGbJ41XibmxYgnun7sqTga1XXFxqcHVK1wtI4cnFFM+Sx6SOKtADN7c/3YKhHx80VdmsV/+4/2gr2+NTZpxKUA3c0Tv4ebue/vakLfNwbA8jU7d0uhaKh/774Q9srTpHk+E4vRuVVEszGMtPv44HB/asNVvoJsV/UPZtYYPKQM3BofqZxTC7GsMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5b4t+l+Yaj/v2mUxRZmM2dfeEUp7zFVlmnW/AWAmTE=;
 b=YWQZAsagJBTjrPfCbATcuA7YhHebj0iWOWEO8+8lO4R2r6PMS3eSME9LKAEwWZnmzaofbVA7kOxf7kyRCUlG8YrWbZSrso7JgKoSaaR0xz7HQo6mRZdnqkVHmEXcM/0/RyWxwc2E/5WbhYyxAn3HLniUUSBCy99uraDT6jH3TTBbOMB928N9ErBZYuXK0j2f9G8Cl4+/RJGkyKRzGGF+Z7z+Od+uPNX5k0CsD026ne55dc0b8Tqa8gDZ/cQkrx5lvxXiVpwWzCjFoBn7so8d2IHksXo9hh50l5JLeQ/fHX9co8I3Uizu7vOKSEL39bpHkE2BooqFLnD73celRvcEMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5b4t+l+Yaj/v2mUxRZmM2dfeEUp7zFVlmnW/AWAmTE=;
 b=bNTpX3Eo18VS92anMTbF8bv1A5VMNvzGTjkSpQJTgROSJmwsfvRNvE2INk0PbkSVM+bTbGKv4vlhN7gH65fUGLCGSFCn8QEDM84EYJDJEI62QvqYW71enCsPSIY1MXHKGREh4Dyrw48ytQqoPCrp8BefhcX6Q0TzA7forFPzTXz0r4V6wEJG5Wehq5o2V2C5MqQWiav3cVVoqMBWYIs/ofrX3Cb4H4Ca3XGMWJgQwSg/kJKtUaxbqEjetbMopmaDgQCb6rN5BM8jAyGVpT9A7PGCZr6rfyvZgGDVAICdB8hmXIuTzgpTEj5lAjVjNsFZqq2rUfTRoTXeoctOfzLpQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by DM6PR12MB4370.namprd12.prod.outlook.com
 (2603:10b6:5:2aa::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 23:53:07 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9%6]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 23:53:06 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Tue, 02 Dec 2025 15:52:40 -0800
Subject: [PATCH u-boot v2 1/2] drivers: spi: Add support for disabling
 FMC_WDT2 for aspeed
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-msx4-v2-1-a605d448bd02@nvidia.com>
References: <20251202-msx4-v2-0-a605d448bd02@nvidia.com>
In-Reply-To: <20251202-msx4-v2-0-a605d448bd02@nvidia.com>
To: andrew@codeconstruct.com.au, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, eajames@linux.ibm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764719583; l=3054;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=U1k7Eem2E4FEV7XTC/PvX/bDb1+oQqnoQY3b+gLTwOo=;
 b=a6tEQoA3xT7/Q60tn1ZhLA9zctvbolY+IaxDvaUM8jPcNCDJA5Koi6Fuo4Wgyjy0LP+P1e3RC
 VDw2Ld30pChDMzVmwNfMnc5cSN5Sbv9DQshudfY7wqirYdKOUUd3rs+
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4P221CA0009.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::14) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|DM6PR12MB4370:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b3673e-be7a-4c58-423a-08de31fdf089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXRNS3MwK3lYMGhLRTdiTXFIZzZ5eXV6QVlyTnM1V0JQWElzK0FheTRpRGds?=
 =?utf-8?B?azdqWkg1b0dwSjcveWNYVnp0cFhQd0hyT0hjUzQvQXhxOU1FY1VMUU52T09O?=
 =?utf-8?B?MDc4SWNMakIzR3JSdFQ4dnRreHVmTm1NcXdEcVlkRSttVVpqK0l5MGVuUXdz?=
 =?utf-8?B?eUxQQS9xU2taYjJ6L3ZRS3ZoVTIrS0I5VGhXZ1BJTStOSFBqb290bGdjZWFp?=
 =?utf-8?B?VDZkamdNbUlpa0REMmV0U3NGc1BZUjFPTmZPTlF1UXhaZFRSMnpEZTRyeDNx?=
 =?utf-8?B?ZEt2L0V2STFHQmdTWUZuVkMxcXlWZzZMem0rYkwyUENuQkZIb0JlSmQxSzcy?=
 =?utf-8?B?Tms5d3o4VVJxQTZycDgrWWRFTXo0SGMzSmt4OElhZUtXME1UekpyZUlXYzhE?=
 =?utf-8?B?dFNVTUJZZGpCUHB4QnYxK0o0WUdhbE1LcGQ3QXZiS3lUZi9ESWtOU1lKdHJK?=
 =?utf-8?B?REYwN1lDWE9OWkhRZ1VXUC9wa1VtNWl0NDJXVXpDWDJHRi9HeC9maDFDb0xH?=
 =?utf-8?B?MCtjdWM4Zm8rWUtLT1IxNGQwcDZscDJ6MnBLeXlxZ2hBd0ZLSFUxWVNBOGpp?=
 =?utf-8?B?TmJUWnE3SVBqT1cxM1FPcjFsL0Z1M0t0MUJiSVhVWmxJd1BBellXMURwaDRu?=
 =?utf-8?B?bXd6eURYS1NKdG5zOTdnZm9lTjhoNGNJaUhMMmx6dGZSUTZhRlJueXkzdzRs?=
 =?utf-8?B?eklEV0hBaFJEeTBXWWtvR1luM1FkYjB2dkZVNkJUaFJHbDkvR0ZCbU1pYmEx?=
 =?utf-8?B?MlRxNmczS1dkTU1iMDQ0S2ladHBPNGwycXE5OVl5djBYOFVhVG9lb0lST0Rl?=
 =?utf-8?B?SUFTcEVKT1cxOWcyd3N5Y0wxbGdhVVJDSG05M2VoaW5EdGhIQk0zTWJNT0Rt?=
 =?utf-8?B?MkFwOGYxNTdJaU8wK0lGeCtSVDZ1cUQ4dFBxU01IK1FnSC9rMy9MVGw2d2dk?=
 =?utf-8?B?ZmJmTFRUaUN0Tm9yN1g4eXdzM0Vma1ROcW5ac1hFVWFFamNGTVFGM2I2SHpa?=
 =?utf-8?B?VUsyQ0dMeUtHQlB5b0NYUHk5bUttTzZ3WkorWlhrU2JzdDU5bjJGSnJSSWZ1?=
 =?utf-8?B?RXJmN1pvTk9HMUdHOUE1OU9UeWswSTNTWDNXNUNNcHVGV0o2dDh1NEcrc3VP?=
 =?utf-8?B?cDBIQ08xazFIQmN5ajhMQ3RaY0g0MnNoa002NVRyZEZRdzgxQWVnbmtxdFVQ?=
 =?utf-8?B?eGRwSjlDMWVjQ1FlQnpoelA2MUV4bDBmd0lNajNhK0ppWENybXVqTGVOZjJr?=
 =?utf-8?B?Z3I5cFZRTE1CaVczYmhkRjVucFpsalYwTEphWG9qTE5ETzFodGgyNk16WVB6?=
 =?utf-8?B?RktyRWZidUEzQ1l4SDZnbDJIOUp2QXpjVmRHUXZZaW9sTDRXWmpaTjg2aU1s?=
 =?utf-8?B?Uld4OXc4ak9vemo4Yi8rRitvamNvaGszUVB3ZmV6MzMrMGR6bTlSNFZabG14?=
 =?utf-8?B?WEphdVZiUTQvajVyREVrMml0SFpnd1lFOVNYOEhKZWh1UllnNi9peWhtbExi?=
 =?utf-8?B?Q0lkM0RrVWwzTU5Wc1dydkhmNjZZL0lsSkh5NjJsTzJsbDB6REg3dDBSQ0tX?=
 =?utf-8?B?c1RSM0lFYVdUNzJVdmhITXlJcXBKWHV3eVhqcFNHSUZoZjZmU1lzNXdkUGhy?=
 =?utf-8?B?NmVvRmpyL1hkTlIvRFR3aytXYmFCTUJ4cGkwbnEvbkIvUmpXQXFWcEo3MnUz?=
 =?utf-8?B?OWVmMmVobm1CZk5lSHpQdlhQdExYRWpiM25Md1RUWmdCTHlnK1BKaEU1SzVQ?=
 =?utf-8?B?dG05UkxibGd1WWpGeHRIdFJRS0tvcnRlL3MreXJtck9FR01ka3NSenBQYSt6?=
 =?utf-8?B?bm9NQW10bmlKeWoweGh3cmtrcjVHRGpmakRFdUhGUnJmdUUzdWZrMzdubVRU?=
 =?utf-8?B?aGI3dGRMa2VhR3Vqd0dnaTVCTHc0bkpqVkdZckZXejU2YjFOb3pEc1hIM25P?=
 =?utf-8?Q?3+HozkBpFjHy+G85eVvaVmuaTE/Pa2ct?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L29jSjIwOFg2YVJjRktpekNDeGZWZEpJY0hWbmRTREZxeHJsR01Fa2lrQ3U4?=
 =?utf-8?B?NXRwQ28wL3hHZ2VHc1FhbDFFemY1YVFNaU0ySWtvR0xrN2IxQWl0K3JaSmYv?=
 =?utf-8?B?dE1tMENPd0NhMmNpRXUxbzFYRERqSzJiMGd4dTJPcWJPOS9DN09LVnVvNm1N?=
 =?utf-8?B?bGRoRkorQXZsNHpMQTJlaiswMjV5VEVvUk02OERCdVpkRno1T2hHQk4yNXJj?=
 =?utf-8?B?cTh3Y09OamthM1J1Y1BoanZyYmFLSFNIMVBBTFpnRklYM28wK1I0R0xiUERF?=
 =?utf-8?B?UDZZT3l3RkxVZVZqcjBCUERVaVprSHpVUVdPVzdFRzVlNmVCMTZZYlNSZjFX?=
 =?utf-8?B?QlVva095cHlmZUVqZDJMa3Vwa0ZiZmMrQ2NlN3lpTW5RbGYrNStJa3pObjFL?=
 =?utf-8?B?dTZuVHIxcHlXdUlhVFhWSHV5b2FlRVVVeTRsMGtxazRqK1Y3WTRzQlNyMEJE?=
 =?utf-8?B?cG1sRW1mR3ppSFhRWmZ0bEFNVTZLZ2drR3NTVTNvNVdBNXdmelhhY3U0aGVi?=
 =?utf-8?B?VkxVdGRSOHcxVW5IT1JheXpIUVh3UTZ4ZXhrZVdGckh1RWhOSThQQkQrVStZ?=
 =?utf-8?B?QVZvQjB1azlJSXhtMnIzRmNaWFh0Rk95bFBtWmRTQkpHbGtIUERCbG56ZDcw?=
 =?utf-8?B?Nys3a3o1ZTU2QndpZzRRT3NWbkdsUzV5V2Mra1dFV0VTRkdXQ2VXMzQwdEdv?=
 =?utf-8?B?bkFsZ0Q2UWpGMVRTRUxQS2tHOVhCSXZCU3IrSXpWTzMxR3BuQy96M21iQWVQ?=
 =?utf-8?B?K1FlTkhrVWlYVEF6TnNRa05mZDBMR29aSnoyWjhqWlBoeDY1TGE0Vms1MU9W?=
 =?utf-8?B?UE1LczJqSmFGMWVZVUh2Q1VJVHIvU0RnSkJqcTY4bjE4UURPczZrTE4vTmg4?=
 =?utf-8?B?eTBUSXJON1VHSVVuSXdDU1JIY051LzArQWZuL3E5dml3U1RlbUNXTy9qNnlI?=
 =?utf-8?B?a2wwbTdSQXV6UHdtT045cXhzalo2ZTl6OEptbnVicnc2b0RnQjN6cTYyQnRH?=
 =?utf-8?B?TzljdmVES0VDcDMvb29yeGVJdGdLbHhVKzdlVmRvMnJSTWVqYWtZVW1DK2dB?=
 =?utf-8?B?ZVNZR3FhMkFSMy9hN0V0dUdlOEtSRFJsRFBqallraTRRK1MyUlprY0dNT0dG?=
 =?utf-8?B?Q3FVblplUlRrQWlEYThSMjBZc3lQZGRkaEdwdEZpamZRKzgrRzJEcUg0SE1U?=
 =?utf-8?B?YTRMcmcrWTlxcjZxcTk2bnF4d3I2Qko0Q1RZOHBwdm9oUUpHTlVkOWwxTWd3?=
 =?utf-8?B?dHd6TTRiYTF4TXNKelU2c2pZY29pV040WWJ0ZC9MWnpBbDliaXFPZkc0Y2dp?=
 =?utf-8?B?ZW8vc0xDNmtqZEdTSzBkUVFRNUtRQzV2L1I2QTR5ZGJuN1ZHMXBrOVY0TGpp?=
 =?utf-8?B?UDUvNThQYnFUU2RkamFuSmMxS0RDNkJwRngydWJ3V1NLdXhwdmlrRGRWMG9v?=
 =?utf-8?B?L1pZZ0N1bVU4VHpZakc3a0RCdGVxTUZIVVRENUlHckhRaW9YU0FsdUFwdlhR?=
 =?utf-8?B?d2dxb29UK3N1cDNFVW9qV1VObjdWTjQxemdmN3JsR2Nhcit1cWttR1laV2o1?=
 =?utf-8?B?M3h4NWZpYTVVSU1scGI3bVpEK2JleC9EendlN0RSbm9nb20xVVhXcys1cW40?=
 =?utf-8?B?OGF4eWRNVTlUaUFYRDFxTGRldFNpYzdUcEU3VGhTMXI4OTM5NmE3Uk1Ucmta?=
 =?utf-8?B?aTRlSVZsNzVRNGkrVGZQWXpJZEdnSWgySldQSFZMMjMrZWVEQUdpbEw4ZWlB?=
 =?utf-8?B?Y0JScHh5YzJyOCtQZHl5clhsdTk2d215ZDQ0MWhDK0RtbXBEc2poRGRFdUo5?=
 =?utf-8?B?bk4xTWVpa3RhcGRHbUU5dXZrSEFpQlBUUWhzclV1Y2ZmTEd0VUlrYVl5S2xt?=
 =?utf-8?B?a0hwTzMyaEhVcEpTemdLQTFlMGFoenZSWUdLNkxDUEdmSnA4WlZYaWJ3Tlg1?=
 =?utf-8?B?UG9PTzRJcUNOdWlPVjM1STJRWjdvQUx0MGE2SVhvc0kwVnFCZFZvWVRSVDgr?=
 =?utf-8?B?WTFyM2ZVTVJha1dQVGhCd1FaZ2Eyby9UV2JjMnRpQ3QwYjVaWElwSVNjem0z?=
 =?utf-8?B?S0JOa2RzNUFqVWFFdzYzejV5K2RMZzUzNWloNy9lSCtVa2RyVmhmdGllMEU2?=
 =?utf-8?Q?Qi8BjcyY8u3oT8fvf7Kv6C45G?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b3673e-be7a-4c58-423a-08de31fdf089
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 23:53:06.7840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yxlJVmSBa7JCU/gfvGvqY7CdwDDbOjKR6wxxJhAxvldfAV3G4V0K7FN+tbJoc2hPdgoSstYnEK73JhfutW11g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4370
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Adds support for disabling the ast2600 FMC_WDT2 through
a device tree entry in the fmc node.
Set `aspeed,watchdog-disable` in your device tree to have
the driver disable it.

Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
 drivers/spi/aspeed_spi.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/aspeed_spi.c b/drivers/spi/aspeed_spi.c
index 54520122f1c48c8b2052b4b1e47445a9b990d25e..de954e477aa15e6d1be042a2aee47f5a501178da 100644
--- a/drivers/spi/aspeed_spi.c
+++ b/drivers/spi/aspeed_spi.c
@@ -30,14 +30,16 @@ struct aspeed_spi_regs {
 					/* 0x30 .. 0x38 Segment Address */
 	u32 _reserved1[5];		/* .. */
 	u32 soft_rst_cmd_ctrl;	/* 0x50 Auto Soft-Reset Command Control */
-	u32 _reserved2[11];		/* .. */
+	u32 _reserved2[4];		/* .. */
+	u32 wdt2_ctrl;			/* 0x64 FMC_WDT2 control */
+	u32 _reserved3[6];		/* .. */
 	u32 dma_ctrl;			/* 0x80 DMA Control/Status */
 	u32 dma_flash_addr;		/* 0x84 DMA Flash Side Address */
 	u32 dma_dram_addr;		/* 0x88 DMA DRAM Side Address */
 	u32 dma_len;			/* 0x8c DMA Length Register */
 	u32 dma_checksum;		/* 0x90 Checksum Calculation Result */
 	u32 timings;			/* 0x94 Read Timing Compensation */
-	u32 _reserved3[1];
+	u32 _reserved4[1];
 	/* not used */
 	u32 soft_strap_status;		/* 0x9c Software Strap Status */
 	u32 write_cmd_filter_ctrl;	/* 0xa0 Write Command Filter Control */
@@ -45,7 +47,7 @@ struct aspeed_spi_regs {
 	u32 lock_ctrl_reset;		/* 0xa8 Lock Control (SRST#) */
 	u32 lock_ctrl_wdt;		/* 0xac Lock Control (Watchdog) */
 	u32 write_addr_filter[8];	/* 0xb0 Write Address Filter */
-	u32 _reserved4[12];
+	u32 _reserved5[12];
 	u32 fully_qualified_cmd[20];	/* 0x100 Fully Qualified Command */
 	u32 addr_qualified_cmd[12];	/* 0x150 Address Qualified Command */
 };
@@ -163,7 +165,8 @@ struct aspeed_spi_regs {
 #define SPI_3B_AUTO_CLR_REG   0x1e6e2510
 #define SPI_3B_AUTO_CLR       BIT(9)
 
-
+/* FMC_WDT2 control register */
+#define WDT2_ENABLE		BIT(0)
 /*
  * flash related info
  */
@@ -267,6 +270,7 @@ struct aspeed_spi_priv {
 	ulong hclk_rate; /* AHB clock rate */
 	u8 num_cs;
 	bool is_fmc;
+	bool disable_wdt;
 
 	struct aspeed_spi_flash flashes[ASPEED_SPI_MAX_CS];
 	u32 flash_count;
@@ -683,6 +687,9 @@ static int aspeed_spi_controller_init(struct aspeed_spi_priv *priv)
 	setbits_le32(&priv->regs->conf,
 		     CONF_ENABLE_W2 | CONF_ENABLE_W1 | CONF_ENABLE_W0);
 
+	if (priv->is_fmc && priv->disable_wdt)
+		clrbits_le32(&priv->regs->wdt2_ctrl, WDT2_ENABLE);
+
 	/*
 	 * Set safe default settings for each device. These will be
 	 * tuned after the SPI flash devices are probed.
@@ -1907,6 +1914,10 @@ static int aspeed_spi_probe(struct udevice *bus)
 	 * SPI controllers
 	 */
 	priv->is_fmc = dev_get_driver_data(bus);
+	if (device_is_compatible(bus, "aspeed,ast2600-fmc") &&
+	    dev_read_bool(bus, "aspeed,watchdog-disable"))
+		priv->disable_wdt = true;
+
 
 	ret = aspeed_spi_controller_init(priv);
 	if (ret)

-- 
2.34.1


