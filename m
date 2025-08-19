Return-Path: <openbmc+bounces-482-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C353EB2D083
	for <lists+openbmc@lfdr.de>; Wed, 20 Aug 2025 01:54:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c65zh226Bz2xPx;
	Wed, 20 Aug 2025 09:54:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2417::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755646629;
	cv=pass; b=GyxcN07+mlcgTcndGPG26KppgMq0QaE3cOOpKLwoZg2HG7i30DkVU++nXDUEPr++QxElaLlGBWVG1r/jfoz0Lr231kP3MGiGcNXJC2iN0EpTNbNQa7FukOZVRUi0gSPk/n9SBmWDuQsWzUSRDwbYIn9+8USV9G9pBRPWXWroijQRMXKw2uoxTXwZrGFYUp66ja6kGLZ0++wFyYS+BH2DB+GW46SLxw1cBQxBOgBTNDKp0IpxAFfRnQmIYXtyhQYkIcDny+8XVdQIgnbdkf2ipgb40sfQPALW6uW/YmeZ50yOg/0sxfUiLjJUB1KnQ13LKdnfzx1UReGMMrn6XAZjOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755646629; c=relaxed/relaxed;
	bh=yOq5T0ASBlrkHOEonHuQ6PEiJZuLIn8OH3B48RR8wKM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=MagMbRK/BKS0vK/tbkBf4uPN/l2Z3AREQ45xhRN5TpgCbXFLohcOFRu0LsARBQr2OkJxCJ1+AVHfZTi8UJl47AUlHusWA1QpkciFUG4tsaZRXmvBZKt69l8CCbCyY+jZ0eQM8AIboaFCq/VGc21ojPVT7YrviEGTFQmUaHh49+pmFhlS5dKUBrEur9b8LZJv6ol80lnZttCYBBs6puga+AWMeIc6eZlxcj4G4GzQNFe3286qeq+ty2VluhjVP+voes/sO7RVGQVahA868/TAopYIqfeOIhof8FIHRUcwnc8ZglZe+dSjc0bjnTfJ9f79n+gFo5RMVBRNoIkVlgXv5w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dpWIvOQu; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2417::609; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dpWIvOQu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::609; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c65b76fdzz2xK2
	for <openbmc@lists.ozlabs.org>; Wed, 20 Aug 2025 09:37:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R55MzArRh35q1wyqyvpbMH0KONzZfemBT5WfXktwWCTKf6ZysRFontwCUoDtwAmNtvQnZ2Fz0KAq5/VYYFxttPvp/2NnohE0obQhZMsqNuYTiR2CIX6cg2oE04CN0FwNoXz+FQSklrO0BX5DvhVoKDTw3aYjuojxetYSwVUC9YH0i0Jq6FadSoCSeIXsUzGLdaxTJdqawS3i61fDWd+Wmc9mjxPEkwlAGQ50WPdSQynAri5Oo7QIR0BDRfOA4f6XmI+QDYyWdAAKozA0pBKWZNJssHQ/wZywiWKR4UxP8guv/ic0BO29o/R6Vxq1hPnOYjPuGt2J1Z/UROIZo/FIAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOq5T0ASBlrkHOEonHuQ6PEiJZuLIn8OH3B48RR8wKM=;
 b=VBOwWiLadpo47/2pNKMyCPwgRxQ5h0tCCHKGuyzSE3IyRcenCMFlXLm5jevzFtbE5k+lIW1fmfNNlQixAGpg4J5mGXQj5ZocdVWzCPend19rk/o4YUsUKXwhGSMe8pcPH16Wmw0L7LXjbxZofWySbNPenDTbAji5mSXlMFU3oPiAvcfN0KGR1SlJUmVrxESccNIzycl6GiQQBCv0LQYpieGloLE0KTLoRZj3aG2cpt7UxqgUEgoNo4yVR9DPtTeyEbTVdKkbHdiLNmliGAHRgrszTfggm+uqE01NY/KCANDUM9t+uCnsTDStr4rxuTPEKpBUdjiiwhMvOSdClNDpsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOq5T0ASBlrkHOEonHuQ6PEiJZuLIn8OH3B48RR8wKM=;
 b=dpWIvOQuEtOyAmMiucCLlCg6YjjX3Q4RPSjmT5JQC16wTjOUShfTQpCCuAm+67d8a8JOPTob1c2b4FMLwFk5z9w6c/1Wk2rlkKHMc42Z675benDc6X82Zk4Hsb7LbOBVEci+gPZrEkyvTRx8wGemEdzYGkn1TE8TloIK5oHOmzm5lsXrtPdgk8rkOtvtDeZyLtXaG7KQvfx4xre/vbm4TVy10J/5CRC2kTCLuSuYdbpxxob4kiLjd+mTOI0zD1Un25iYvD86jeTh3JcqKyWBuVl5TqxV2rCQxPwC5ezzvQZVufOPpSgeWoOVZIomO9ja7fzOjectAhb8Eci23wasaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS5PPFEAC589ED8.namprd12.prod.outlook.com
 (2603:10b6:f:fc00::667) by CYXPR12MB9443.namprd12.prod.outlook.com
 (2603:10b6:930:db::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Tue, 19 Aug
 2025 23:36:47 +0000
Received: from DS5PPFEAC589ED8.namprd12.prod.outlook.com
 ([fe80::fd4e:4c62:b756:96da]) by DS5PPFEAC589ED8.namprd12.prod.outlook.com
 ([fe80::fd4e:4c62:b756:96da%5]) with mapi id 15.20.9031.014; Tue, 19 Aug 2025
 23:36:47 +0000
From: Marc Olberding <molberding@nvidia.com>
Subject: [PATCH 0/3] Backport MCTP over USB commits to 6.12
Date: Tue, 19 Aug 2025 16:36:21 -0700
Message-Id: <20250819-mctp_over_usb_backport-v1-0-c655eb2a32ce@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHUKpWgC/x3MQQqAIBBA0avErBNSCKurRIjZWEOUMlYE0d2Tl
 m/x/wMJmTBBVzzAeFGisGfIsgC32H1GQVM2qErVVSNbsbkjmnAhmzONZrRujYEPMelaeSm99tp
 CjiOjp/sf98P7fmgQvJRoAAAA
X-Change-ID: 20250819-mctp_over_usb_backport-d752f11f7f7a
To: joel@jms.id.au, openbmc@lists.ozlabs.org
Cc: andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755646605; l=1403;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=+4cdGIijDAaka/+xJFQ42t79iECysypf2McgFA0KhAw=;
 b=anfGBPaXRUG8swnY58M7aStOnw1eO883JkizbCkcocyijztNJyNMoPZG0fpNhzX5efg+JQCx3
 HPaPnFrbDz/DCZRSSQOdF9CNwHHWT9aiNi9U7/Xnxmri2hUyjdXpwU2
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4PR04CA0202.namprd04.prod.outlook.com
 (2603:10b6:303:86::27) To DS5PPFEAC589ED8.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: fe22dcea-ed89-441a-41d1-08dddf794340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTZVZzNzSjlVWnoxNm5RUWJKRFpkSmt5QzJZaHpRdmJESVlxUCtUSDUveHRu?=
 =?utf-8?B?bHVCLzRKaFNBUDNQaHlTVXJmUTFMQXNCQitwbzdZMzdLZlVyRHJxb0lBd0U1?=
 =?utf-8?B?bnpiMy80K0ZTVE05UndDWm1WZUMyQUo2Z3NhOHI2NU1RWTlWeTdISzd4WmMx?=
 =?utf-8?B?anBuNUhGOGhKaGhVYWlnK3Zqd1pkWHNEdjVlRkZPaTRtRS9IeWF6NGJkRlE2?=
 =?utf-8?B?ZVFpdURGaHhGQUwwMEFpY3d6VWQramxVVEgvR0F6UXhQdFc3dERETVUyaTdJ?=
 =?utf-8?B?SnJaWm9ocllpM2gwOGdYc1VRcXd0bGpNKzhhVWVMY0htdmtBaU40QSszZEI3?=
 =?utf-8?B?Z01BcGFzZ0dJOWs4WUhnVUVaVWIrQVdnZ2NTVEZ6TUVMcWFPZFdVQno4SjIr?=
 =?utf-8?B?M0QvV0xxT1lvaCs3T2RsRXpuK3BBNjF0ZVlrMjlxTkpwUUVlbGJqY1gzd0RJ?=
 =?utf-8?B?QXBaVXJ4UEx4V04rdWNkb0xHbGM4VXorMWFpRGZ4NlhhRWR3M2NFaFlhbmNK?=
 =?utf-8?B?cmUyRkEycHE4dnpJQjRkTnd1dDV6Y20rN0gzYlRPYXhVR2JTQ2ZSNGdXd1ZJ?=
 =?utf-8?B?RGlkVmMzTlhSNWtUcTZNeDFNeWpqZFQyR2cxMXRNUURuYmR4VjJZbUNwcjJX?=
 =?utf-8?B?eXBSOTR3VFRaL1JCeWdFWTBtRHR4RDM2MC9TNi92ZWx0VHJueFF1T0plTW9y?=
 =?utf-8?B?RmhWOTRsTVYxVW9uenJuckU4WE5YaUt1cmdTWS93VDNZYkdRYy9jZXpGK1kv?=
 =?utf-8?B?VGIvRW1BZzhrUG1LdkpHZUtna2NDei9ScUF1MDlCMDY1TlRyT3paQlpjYVIw?=
 =?utf-8?B?WmE0YklySDdnQm41cHhaQkJFL1daS0FCdlRRVFU2MjVncktkWnpEM0xYbXpm?=
 =?utf-8?B?Z1l6QTVuUFllanFTdWlNTVRGL3kzRFJhNktPWmUwcmc0SDdyTUdwZCt1QWwx?=
 =?utf-8?B?MzVCNFU0b2tWU25QY0tzZ2x6emNqeWNoOXQ0cTlHb1JOV0VEK2N1U3I4cy9x?=
 =?utf-8?B?RjF4eW9FNUQ0bDVvdjNyUXdta2c5MGxSOVlwZk5HWjN6N0FJYlRwdXNkUVF4?=
 =?utf-8?B?VUprdVF0WUF1K0dBZFBneVJZR0Y1WitXNjBhV1ZkQk03NXdmclh1cHU0UmFS?=
 =?utf-8?B?WGhweURuVUFaRHRkSmp3SyttOG1rMkp0OWdwdVdoOVA3NFhpT2RsZUtKYXVN?=
 =?utf-8?B?UEJuVWUza3lwU01BVXRVTmExNlg1Rm5YYWJiNW5DSHRFV1ZPd2FkeWhtWFhV?=
 =?utf-8?B?YS9iL3hxV3pyZkcwWm0vUmh2cXFHWUJhbTZiVlljZU56QWYzWVJYbG9kRXVV?=
 =?utf-8?B?VFJBOGhISVhCajNFcmxkakRyUWxwMU0xbmxuTUtlLzVPNUdoUTlxV0s1NG16?=
 =?utf-8?B?THlaV3VOSGptMWw3aHFNR0RkVTFIWmxYbmIxR2FhWVVqUk95NFMxTm56UU1S?=
 =?utf-8?B?VkR0TmQvaGkySmk1VWo5eFlhWnR2d0Y0WlBkd3Rhb0VsZU5Kb0d4N2xpRS9y?=
 =?utf-8?B?QUF6T3FNcUxUL3Ruamc1TWk4SDhnZEg4N0FzSUhQeTdrakdYM1JPWjFUNjFK?=
 =?utf-8?B?enJDRnpWNkJnazlibEI2M2pSQ2tNb0NCQXJ5djZMelQ2Sk5kT1lydzlyTHZs?=
 =?utf-8?B?ZmN5ZnFUWWMybXNYaExrbHhmSnhaQnpIWlFLS2NncXZFTHNjWXZOT25Yejcx?=
 =?utf-8?B?ZTNBQXRGVGdreE9UZFlQN2ZJV3dHSTIzUVlTKys4VGhtWDlyR3hOZ00rd0RI?=
 =?utf-8?B?a2pjNnBYTXhrcmxCeVAzOUc1cnNmcUZyZEc5cHNxc0pUWkpwSzh3RzFLaFps?=
 =?utf-8?B?aU1QcXdtKzlGdHg1LzVKU1J0SlZoUDlCM08wcUU3QWthMXdJT1VOR1I2MHF1?=
 =?utf-8?B?VzQxN2xrUnRlRXl6ckluMFVva3BseTBveGpXTDd4cWpBemYzNWZhbGtXcU5M?=
 =?utf-8?Q?5LTgRTe3tsI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PPFEAC589ED8.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVd0RmJ5NW4rbDFZaG9xWXFLRmJLWFVYRWtUT0psY3MzSjE1ejNPZHVZcWx1?=
 =?utf-8?B?UVk5WVAzYzhML012RHBVVGZ1R0x2eFFmSk5MSjVpYVViT0Fua0wvU2F1Zndi?=
 =?utf-8?B?bmhmY0ppVjJtNTZYc3BuQ1FFenBvYnZWTmJqRGxWU3N4UGo5Q1NNaCtaZmty?=
 =?utf-8?B?MTVCSGt2WldndnBhUllmS0xYMlIxbTVPWHFOc0lkdy9ZMFZTUFFZbGNxb1lP?=
 =?utf-8?B?Y0dRbTFWZDhlZEFtQkllMkRUMndsc2FYU09GbXplZWthOTE3ZjE0RW01amJ5?=
 =?utf-8?B?TzJqQXVOb05BTlhrUkZtWUkrU3VURkdLaEpRdklyMU5TdllsT1FCNTZOMnRi?=
 =?utf-8?B?d2J6OC96dDFBN1FiaktPNkJtc09PTm1kam9kY3JXbUk0WjB1RkFZaXBweUFq?=
 =?utf-8?B?ekgzc1E2Y2dNV2dvTVdMTGxtYjJXblZKcmJDTys4eWdwZXIvUWhkRE95NHhN?=
 =?utf-8?B?RkNmY3lLYnJza1hZUzRSSUlCZnNWMnJ6azFLQ2s1eHZYTnVyc0diaGEyN3hE?=
 =?utf-8?B?cE0xbFBEczN0NVlqOWtOQkNUbS9aa05icVBDODZudEpPQmxJRmFhWlB1VTRU?=
 =?utf-8?B?RnVCb01wbkUzUG9uQml0YjdkdnlrbmNwVkNYKzZhUG1aemkwMFUzUVZlTFNN?=
 =?utf-8?B?ZVZhRXc1dEFiaHY2TEdGMnJ2V3dHeU14UUdkNEgyTEdBRHo3WFByVE9FMmFt?=
 =?utf-8?B?aXRJc1JVS1doME80RDh6N29rOEJqQ21BSFRhUnlOUzduWFZGcnR2WDF1Tk9B?=
 =?utf-8?B?eS9BZnoyQng5ZmlkYXRsS3BaeUY4VlZ4NG9acDFuS3FoUTN6U0MxYTV2ejBD?=
 =?utf-8?B?Q3AwZkU1MzUyekVOMGtJd0d4RlBveXZET2FJNzBUUWVnNjJtOWwycEJQdTZQ?=
 =?utf-8?B?eCt4Y05vNjAvelBQMU5qcXgxeVd3MHlEM2V5T2VJNWl2TitvbUlVZml6UHE0?=
 =?utf-8?B?ZXJrdSsxMWVWK0p3aGp6ZGhIT3lJRm9hd3FrS3BRTG1pTXlGWkZvclBlWkNj?=
 =?utf-8?B?TW5wMjVIaUE4eStzOVFuZnIwQ0RxZVduR2dWR3dSdVRuUXZiSUk1TFdhRW04?=
 =?utf-8?B?ZGJGUkhOQVdSZUQ1RUw1bFFGYWM2Rjd4VmlMYkRqQUtNQlN0cTRDNFYyc2p0?=
 =?utf-8?B?Nit5UlMxNHlQVlN3and1NXV1S2FFWWlvYjYyTkhPdkFxOU80eWhlUmxKNHRR?=
 =?utf-8?B?OVI3SG52R0JJRHRUNjI3eFNMWXZ6dDd2SnMwNGo3Mkplc2Zic3VXR2VvczRl?=
 =?utf-8?B?bFdPMjhzMjFpbU0xZlhmZm84cVFMaWlFQWFvdGUwSm9zRk1NSnVXNHdHUUsx?=
 =?utf-8?B?Mm4xaTFKeU9WN1FaZmtUbmxzbmg4eXRNTUVDUjFRUHlPRVRWNlB2Z3YwWWRE?=
 =?utf-8?B?M1hTYit3S3F5UEI3cGxSYVEwTGE0M2xTc0xHU0F1VzY4VnZwdHBsSWV2SjFR?=
 =?utf-8?B?djJwdWJ1Ums3czFOKzFWL3lVN3NvVExnYVFKajBEYUMySWtCN2Z6eUMxK29h?=
 =?utf-8?B?RlkrVjZIQXMwako5Y2FhK1BPZ09ZTy9RbDVPdzBzTmpyVWx6cFMwOXJlbWNJ?=
 =?utf-8?B?akdPeE84RWJST1NWbjFPOEtuV0srQzhCeldzYlhMZU5yRkNKaHc4cUM3Z3Jj?=
 =?utf-8?B?ZEh5VlQyL0dYVThWUnVER2VKaVJOTDdZOWxBR3luTUZrLzY1Mzd5dlhiQlVJ?=
 =?utf-8?B?SzkyL25vOEFlcjJQZDdTSExFQ21td21tTUVFYWhqSUhqWGxxMFIyaUE3Z2VG?=
 =?utf-8?B?Q01zd2xDeEV0YXdpbFZSV3Q0bVF2Zy92K1p0Y1FPcUZFY2pIMkR2aTVZK2tD?=
 =?utf-8?B?bmVrM01HNEs2eHdLclp5ckFEemZGQjRyK3BhRGdHWTNJUDEvbm5Vc2JKNGxv?=
 =?utf-8?B?R1dNaVVFdmNPWVAxUUx5K0JScWxXYkFQSCtTbnJER1NZb0dkOERBdFZ6UEFu?=
 =?utf-8?B?S1RlTVlEZUVXZjBGVTNVS2hCQmdUaXdPRktFcjZ1eDRaYXErSEc1RTZOM3N5?=
 =?utf-8?B?TWZhN3ZscnRHdHRjaFR2ZXNicVdLL1dyQ2laejdIL1ZicjAyYkduOUlSejNa?=
 =?utf-8?B?dTFQSlYrb3g4WUJ2N1Y3WXlrbHBsbksySkw5TDdHTTRvNzUzb2o1b3JSS1d2?=
 =?utf-8?Q?lkorwKbheSwAoZax+qyltnnpZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe22dcea-ed89-441a-41d1-08dddf794340
X-MS-Exchange-CrossTenant-AuthSource: DS5PPFEAC589ED8.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 23:36:47.1493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBErzpMjKy1TKxDgbx7gVMPSKKwnRQA6/6p+h6Js8YePK6w4YYLjIpNu4eA9F4EKYMzQgZhmr9ehP/ke/gpVVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9443
X-Spam-Status: No, score=-3.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patch series backports MCTP over USB to the open-bmc 6.12 branch.
The commit series is mostly the base support, with the addition of bindings
via IFLA attributes. No out of tree fixes were added in this patch series.
The base for base support of the MCTP USB transport device were taken
with the fixes from 6.6

Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
Jeremy Kerr (2):
      usb: Add base USB MCTP definitions
      net: mctp: Add MCTP USB transport driver

Khang Nguyen (1):
      net: mctp: Expose transport binding identifier via IFLA attribute

 MAINTAINERS                    |   1 +
 drivers/net/mctp/Kconfig       |  10 ++
 drivers/net/mctp/Makefile      |   1 +
 drivers/net/mctp/mctp-i2c.c    |   3 +-
 drivers/net/mctp/mctp-i3c.c    |   2 +-
 drivers/net/mctp/mctp-serial.c |   5 +-
 drivers/net/mctp/mctp-usb.c    | 386 +++++++++++++++++++++++++++++++++++++++++
 include/linux/usb/mctp-usb.h   |  30 ++++
 include/net/mctp.h             |  18 ++
 include/net/mctpdevice.h       |   4 +-
 include/uapi/linux/if_link.h   |   1 +
 include/uapi/linux/usb/ch9.h   |   1 +
 net/mctp/device.c              |  12 +-
 13 files changed, 466 insertions(+), 8 deletions(-)
---
base-commit: 03ff31ad54522521755b55609eaad19db05ddf46
change-id: 20250819-mctp_over_usb_backport-d752f11f7f7a

Best regards,
-- 
Marc Olberding <molberding@nvidia.com>


