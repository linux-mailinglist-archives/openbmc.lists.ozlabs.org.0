Return-Path: <openbmc+bounces-935-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F13C7BFAB
	for <lists+openbmc@lfdr.de>; Sat, 22 Nov 2025 01:04:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCsk11bf0z2yxk;
	Sat, 22 Nov 2025 11:03:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763769801;
	cv=pass; b=lStWDGE6KbfgZ6L0ioK8RYMCa0CRYMz/CuWUxCPVAkoaM3dEA8qPsgQ6nUstOG0fOZ7xGvYosUx3hgy94c+PsetO1UNkAwuMR2M7+ORHxVsLXG8kLr6lPIw/Dc/xybTmLYArSkIBRTD5pdk73lWqyzNpFHj0UrUH0EzREDs7l2I86Gct2pBG8sS6tq9Ou63JHQSBXAvMW51QPeXwR6RAoQzH6gz9gYJgzb98e6tRlq2vtWvjUaA5DCgrW4fQ7b8Ky8qYPVvsMlIP1NRM/KTLHN2h8yPp61cbMi6xKeZFGJm02v3wR2hE8jzYvk/e37iSfSD44mgYvckvKJ/6Cj9mEw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763769801; c=relaxed/relaxed;
	bh=2CmQsXVYlzWMUa/pdNylWMjFY82WovPNib1h7ZahMyM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:MIME-Version; b=Fyxh+2MwlOwiGobDLA4fdyL52cRSwHatv38n32ozGqDNjSIkRtPHAbLy5tZG/WMvDcMTR7I/dASMLPSvLsxSLIzqkpYPbIRo51ZXVFjIingmgOIlc9mUrRTLdahrvNm3d/cRp1VhQlxGvTNM4xzAcR6psLXfMsIcZdoQZr7srA1Xkbs4/PkNE+G//5W1CKftEpH562rEV+tvlaJd3/gw8wOfoYeKDWu+PJ+Kl2/w8Q0+3MiU+7IbqPH9EC93uTnJLNtDQKPCr69nf/n19vG0MZI4RWlsjOiO1gSi/yOhmqbIJqOn9dbcQfzPv9/Sb2JEc9S6ov3UfHCneDq6HR2MmA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Sd0ZMYLI; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::3; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Sd0ZMYLI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c107::3; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCsk03KcHz30B7
	for <openbmc@lists.ozlabs.org>; Sat, 22 Nov 2025 11:03:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1mSmAjblTLEuy0fMKVydMEhMNVlAjAhoHs5lc9j89Q72wre/QJUbWzkYeh4Djtvsl4fPuPsv1Z/YthV/ay8T5ubTCfXRTYRNzyiZAxdHfo0BAmlLngF7qYvFeBML+Awc0bxP4rx+d5SWJdDISG5dgUJzZd6k4DOkap6TY+M0JPBBmMyzN8Ulpzuk8H1NlYoiXp/pqF8M31wagBibPcq56JK7shQXyQzWOYWgbW3Zz2UbcsB7C6Ku9TZkiEp9K+K0i5SqI/1YYtx41MIipvGsEP8j/XrC/bQhJFF7Uejlam62tdpswB0QrezEF/JSz2DBXfuQb+NVVaT3kW8nRkNKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CmQsXVYlzWMUa/pdNylWMjFY82WovPNib1h7ZahMyM=;
 b=WaH08NO5H3T61plM4CjyLhrgFYeLnKd0i38n35cJCaGpJ/bMHiTkZHSdCyLB1kngtqCN4rwVk8tPZ2lyOZRUMITeATd2asQ4MYRcLhJsQB+it2zpV295+rM+q4shQ5MZljTrgZI1DS4tVlTpvr+01g229w5Ic3W6vBABmFOU9s/MOwwZ7g37NANiTVp6yP7gEmYEe0syudpj9rbFwrR/vFMGzPD+8kKsVdApc2SrMeQ2VPjaPYM7eywtPG8bYK/w+7FIdJg/VLb/l/9q2aPM7SVN/Ma+8fvVbRQJrc726UkYXpysKuwp/g8gNtYMK0bGgoAR6h8n0RK9lklOZY4EWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CmQsXVYlzWMUa/pdNylWMjFY82WovPNib1h7ZahMyM=;
 b=Sd0ZMYLIZt/TlS51Wr6jRTJaOKkr+l2+9p+wt8K8tdUQod5Xvp7x8+0i4O/cDtHHNgGQ2s6Py/UBnwM3vgvf6dX1J44NHdLC+sYAk/o3wHEINEHEjzH1rrcj+6O23cKq+NptbuxXB8UIVQjmhK+TScYrxSpomKBtVCVucxLME6akB4Sam41roq8fyCH9LX6/vDvpkyicnGuNf/i+wsyIw46KFYoUzXcmEnTiOvrveK0CpNLuMwEXDSsFMdQnhzWZUc5YWFx3lGQS8jwEqt+bWybeEpQJt/a0q8XL9IE4DAe7hI+ci9KwxlEyz4vIxecSLFfMvsyRsE7LWGtRh8fdcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS5PPFEAC589ED8.namprd12.prod.outlook.com
 (2603:10b6:f:fc00::667) by PH8PR12MB6820.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Sat, 22 Nov
 2025 00:02:51 +0000
Received: from DS5PPFEAC589ED8.namprd12.prod.outlook.com
 ([fe80::50eb:dafb:9932:c621]) by DS5PPFEAC589ED8.namprd12.prod.outlook.com
 ([fe80::50eb:dafb:9932:c621%5]) with mapi id 15.20.9320.021; Sat, 22 Nov 2025
 00:02:51 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Fri, 21 Nov 2025 16:02:23 -0800
Subject: [PATCH u-boot 2/2] arch: arm: dts: Add dts for the nvidia msx4
 board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-msx4-v1-2-fc0118b666c1@nvidia.com>
References: <20251121-msx4-v1-0-fc0118b666c1@nvidia.com>
In-Reply-To: <20251121-msx4-v1-0-fc0118b666c1@nvidia.com>
To: joel@jms.id.au, andrew@codeconstruct.com.au, openbmc@lists.ozlabs.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763769765; l=2843;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=jl/FE4atilED9yqRmBdBILw80AI6H6JOg1AJ9LPOw7Y=;
 b=DbJnbkS1NP5Bo/tsQEO7oc/+nSFWdduMkiVL0QUOGB+gRaJAAOJNWk+fd9857Gm8YKilD3UTK
 NHK7L87/EjSCYvOTAVuWlmFYzUAANTD+jc5KdCNtfIs3c/r0kDlFpLa
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4P221CA0004.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::9) To DS5PPFEAC589ED8.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS5PPFEAC589ED8:EE_|PH8PR12MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: a5813033-c61b-4e31-1e36-08de295a7a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjdKWTZPTE5heFR2bzJKQXQ0M1FGdkpDNVd5YjRHRzZJU2JpUW1hdG1jVXJQ?=
 =?utf-8?B?N1psVmxyd0FsdzMya0pDVW0wZmpzQjFzRndvUnpVRlhoZWxGQ25jbmdXVUFI?=
 =?utf-8?B?WTV4dHJuOWpDUjkyUjhXYktOM3g4dC80a1JhOVJiUFFmckpURTk1RTlZUk5q?=
 =?utf-8?B?eWhvQ3BjTDJkWERPUmd5RUFFUjJST3NaZENCOXF5OWNHbzVVU3BtNCtKY3hV?=
 =?utf-8?B?aWo5NGcxUm5WeW1vYVpoM21wbnBSWDRqa094UjBlcURPcFRBeWMzZmNSZS9h?=
 =?utf-8?B?RkVIUEhqWHpGVks4NElvOXJ3b1NtNmJWRXdGTEFVa0R3bUlENjZuZ2h0OHVx?=
 =?utf-8?B?Wk5rRG15UXQyaDZHcmRsa0sxaE52RmxyRnVyM3pYWk1NVTJEYXZTemhzK3dz?=
 =?utf-8?B?VjYxQmF3bVlrOXZOSm1MN1J3VVQzcjdLWnJxM3k3QVNrVWNRZ25kUG1xMHVK?=
 =?utf-8?B?bG4wRkFrOXp6N0tEUjRWM3dIVnkrNU1PR1FOcDVOc0oxT2N4TDUvYVE3Q05I?=
 =?utf-8?B?T0Q0aGNabjNPY2RxTjBKQk1YeXBPRzJUa3Z0eXgzcER2bmgySnI5cmltWXJx?=
 =?utf-8?B?aXBFdWRUenBaUktXalNVTUF3TTZ3ZVB5Si84QW9VQTByV2tjcEZvUW40aW1o?=
 =?utf-8?B?ZkorekI3Zy9ud3BPMjgzeGpOZEJaYzBPNkRVYVFjNUc5TENYWUxGT3RvSnVQ?=
 =?utf-8?B?Vmp1S0dZOEtDaU5HMjQrb3dNQUkyQzRELzloem9xMGdDWDBDTmJnaThGbkF4?=
 =?utf-8?B?dWpvbzV6RWRiRDhqQWpKS1JWeDY1cDJCRnBLZVlFRUVyWDFOY1k3Smx6QjJh?=
 =?utf-8?B?UTArb21ac09URnZvT3NRMS9MUTBrZ3hZb21yVThHZS9uMTUxZ3JmTjlsZGcw?=
 =?utf-8?B?aGd3MW0zNmRYUjZzUGhUOE9xK0tNRk9zNmRweHNIdys3WFJDdGQyZGFtQURW?=
 =?utf-8?B?akhqVTRCSG5BNTVLdFVSb3l3aXVod0k5dE5yMmQ0Y2hObzlZUEVUV1J4UXdW?=
 =?utf-8?B?MEV2ZnpxQUxsQUduWTFHMjdJSjJBTTRxZld5L0Fab1BXWGdvTEdQZFFkQ3ZT?=
 =?utf-8?B?aG1yc1UvS1E0L2c1dVZDZHg5bUVGcjhxWFlXbnQybXlDY1ZNUGJnekgzdG81?=
 =?utf-8?B?UEw1RUdTY0MySkZKQTBmM0c1anZZelByVk4zdU13ajQ5NXd0dE5XbkJjRVZ6?=
 =?utf-8?B?b1Vma0pNZFc0MDR3TW5OS29hekpaOTlrTkJqNGgzVXRhWGJkaXJqTDNvVGJL?=
 =?utf-8?B?QUIyS3BlMkVmMGNRaW1sSEtRZ1dlQ1gyaTNvWk1lOTVCR1p3TVJKNjEwZy8y?=
 =?utf-8?B?WlN3d24waWxKS3ZjenJqSlErcmlza0EzWjhHMkFJbS9SR0dEQ2h6ZTdjSnR1?=
 =?utf-8?B?N3ozUVloYXBWQk9kUFZwZ2pha0l6SFJIYWd5aDIyQWZUVnowQ3ZIVlVGMlF2?=
 =?utf-8?B?Vm5GVTl5cVlsdTdCejhUODRSOFFxT1N2a3Z1LzdFUEV3TS9UNStvcjI1a0pu?=
 =?utf-8?B?QVM2R1oyMnN6ZFE1SDVJemlsbzZGZnYrbDNMb3BHL0MzanJiOG5PTThVNUti?=
 =?utf-8?B?LzIrTzA4R0VpZkVOTXVjakM4TEZpcEtmbWEyNHdKamZrakNSUkM2a0JJL2VD?=
 =?utf-8?B?NEMxK0FldkxreUpmdXlUZTlDSzRiMVhxMDZLSVIrWmZyU3RwcllEanZpZDVN?=
 =?utf-8?B?SDBRWHNaZEJpQlMwZlM2SFl1eDM2RXd5K1VLRDY2cDAvaXZtcEMwQXo4NzBr?=
 =?utf-8?B?SEcwZ0hOaURGRUdOR1BYS3lzdmY0REpkYnR1RXl2Rk8zWElrRC8zOHQxVGhv?=
 =?utf-8?B?bFNGVFFNYXVqcFdndUg0UEJmV1RzWElZMncrRVJjTW5oMk9LWFBVN0c1dmo0?=
 =?utf-8?B?WXQ4My9tWHpnTlU4cjIrVGRlZXBPTGNWOHltVkVwSWNoT2NBY21pZ29NSkpX?=
 =?utf-8?Q?UYWLUNj1Dnfh6id4hGsKQUqpegQIkKmU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PPFEAC589ED8.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUo0UW1yTGMrTXdPdElNWHhtWVlGL2hYVWV3YXk4MlNkSGo5V3RVRnAyUzNq?=
 =?utf-8?B?dFlrTVlodk9Vd3BwdlZDN1BBNjd3UDB6VnpZRUVxTDRxb0ZkbDk5OUlKY00w?=
 =?utf-8?B?ekh4dTBoeTBNNzg2RUVXcm92REMzQWVLYnkyTXVjTTFUTG14T05sc3FKdUhJ?=
 =?utf-8?B?bDVkU2FVK1NSY3dyQ2I2Mnc5WXRhUWJ6NCtTaHRML3pvUDZlekxHS3BRc3JZ?=
 =?utf-8?B?YUh4S3hiSm9hTEtvK1k5cjJ6R1BuMmtTN083N3FHZkFXUGt3Q1F3dDBuUTcr?=
 =?utf-8?B?TmxUU09SQmlDLzMzV2prUGtYQkVPaWE1akh5dHF2SVEwazUwd1F2UmI4TVZS?=
 =?utf-8?B?WmNvdm1FRC96dFoyVmxFWTVRK1VHQXBVd0ZYWktKNmhQUWwvaWJraEtWdFM0?=
 =?utf-8?B?V2RzeVllVG9VUHVZRHBOUnVBK01pem43dm14aWQvU3ZYSUdQRnZ3Z3ViZGxB?=
 =?utf-8?B?T1JwOERVcllxQkhXcG01d1NXN0FDZjFydE9POU1ibUU5MDJhM1NYa0d4dlNt?=
 =?utf-8?B?U0EzR0k4S0ZyM1BFRWtJYVRhV1Z6V3pEWWpMTVM4bmR5UVVaYXdJcWVlbFhp?=
 =?utf-8?B?eG1zUG4zVW9reEF3R2xuWDZJcWdpd0UwK1Uyd3hTUDhOOTcxL2RNdHkvZGdR?=
 =?utf-8?B?ZXpRY0kwL3c1aGFTM2RHY2YvVjY2amxYWkFUdDdCWDNxS0JlVVdyNElycXFv?=
 =?utf-8?B?TlJoNjQ1aXhvNkJiR3lGSEx1NXZBdW5xVjE2aE8zV0ZFcnA5N0l5WnIyWU5y?=
 =?utf-8?B?S1BKUUNvTm1GTk9JbkdWbUNuaDdGbklyUzVHb25CbGZ3V2FOeWNvYkpaRjYw?=
 =?utf-8?B?VFhxUTFFb1BYS21GdmNLWW9hMUF1UnVVVnlGaXVhRVFEejJ6WEtiaEdzSTJs?=
 =?utf-8?B?Vmt2R29FSlVYeGhnZ1BMV25NcXBneERUOURZUHU3TGVob1hLRDh4TmJhYVpa?=
 =?utf-8?B?V3ZiS0RBeThKbDNBc0cyamF3RlVQU1JlRHR4MmNpdGxRMHVTVWFEZ0ZjMUZs?=
 =?utf-8?B?Z2M2TW54V0NuOUhjMVBHaG1YSUFxWTRMbHA1bWxycEFjekEyQWRVbjVETFFw?=
 =?utf-8?B?bHdrMUhUSFQ5TXp3YU9OYzUwVWR2Vmx1Y3hlaHV4SW0xTXdYaTZmcmYrdWwy?=
 =?utf-8?B?SDI1dGZTL1ovcUE2a0ljVGxSTzVjQWg3SUZDdHBZNi9URmJoRUV2cUpsWkxo?=
 =?utf-8?B?Z1grNElLQVBGaTNja05OL0pBbFpUMU4xRERCOENnUVpRakxqY0F2cVRYOFE2?=
 =?utf-8?B?S2JSdDJVWFJ2TFBaRmV1akM5cjIrbVFOSTJYMkIzQzV3ZGs2S0puSGJ6SW9k?=
 =?utf-8?B?RDVidFBmOG9TcWhhM3QrQnBKaGVsbXNCelB5YnFFK3VtazRoY0cyWVNhaXVx?=
 =?utf-8?B?Wm4wTU1rSzNPMCtjRFBXb3AvYkpGRXVkUHU0Y0VuNlZIWDBvWXFNYWhoMVFZ?=
 =?utf-8?B?WFpYYSsvU2dJVGtOM0wvbnk1L1kvQUhKaTRzR2k5dW1yNGRWSmljVVpFYlc2?=
 =?utf-8?B?S09hWS81Z1RxQ3piQndWTnRBWWdrSG9jWWVQamczUERXcFpDVTNnSXZ5Z1RP?=
 =?utf-8?B?TDhHRGIxYW9aUFFicUtyMXUwVno1OVYrdkpDWjNLdTV3a205ODlmQTZqbFJO?=
 =?utf-8?B?RkorUEtBSWc1SHo2WXVrQ3E5ZzJTYXQ5aFUwK1U2dXBJN1dWT29vN3hvUUE2?=
 =?utf-8?B?dkhmUVNld0wrdCtNU3Zib2dEQno1VSs2cVZJM0cxODN0Rzc3U3BtWDdHdG1S?=
 =?utf-8?B?NnFjamgrSzlYNElMbHNIYTR3cEZFcFpWYU5jOFZDeXZzQmIwMUVLVnpZK0xs?=
 =?utf-8?B?TTBlZ2kvNVdmZmdCOVVUSzAvWStlVFpkVGcvcXZ6c2dXd0hXcWkxemFHK3ZS?=
 =?utf-8?B?NHRHcUp5c2hvZHFGMnByODMySUZUdEswYlhCTnJGeFJsRWtQWWZNQ2RwR1Na?=
 =?utf-8?B?eXB0dktFaDI0aFNNZ2ZGQ3pkNTVKS3FyTHlaMUFQZ1VaWFNIK05XNm44TFVu?=
 =?utf-8?B?REtiTWV5ekR1Ri8zWU10SzI2Q2RsMXl6ZWxSTzRhNk9uN0tEZDE5TUNVSE1i?=
 =?utf-8?B?UDVVaFZpbDh5TXJqZ0tUeDF5ZitDc0lLQ1NUS2lNZzYvTWFjclpTK3NJL1hY?=
 =?utf-8?Q?kUTJfrtxjjCC6juJvHRMVzICL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5813033-c61b-4e31-1e36-08de295a7a5a
X-MS-Exchange-CrossTenant-AuthSource: DS5PPFEAC589ED8.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 00:02:51.4996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRDv02Gr47xu/76r574i/0LJ5eJXWaodZgN6t8lpIMiGziLeWzN/IunAZ7e/u75maAAiJulp6Tjl3l/f4BEPfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6820
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Adds a dts for the nvidia msx4 board, a granite rapids based motherboard

Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
 arch/arm/dts/Makefile                    |   1 +
 arch/arm/dts/ast2600-msx4-bmc-nvidia.dts | 111 +++++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index dbb2fafc4f4c13302a02875cd678477ab95334cb..aebc5b60abc6b267669650be098315f5d5715074 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -689,6 +689,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-facebook.dtb \
 	ast2600-fpga.dtb \
 	ast2600-gb200nvl-bmc-nvidia.dtb \
+        ast2600-msx4-bmc-nvidia.dtb \
 	ast2600-greatlakes.dtb \
 	ast2600-intel.dtb \
 	ast2600-intel.dtb \
diff --git a/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts b/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts
new file mode 100644
index 0000000000000000000000000000000000000000..a3b258d99939dd4f6e465f35cb9413f8a703cc8c
--- /dev/null
+++ b/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "AST2600 MSX4 BMC";
+	compatible = "aspeed,ast2600-msx4", "aspeed,ast2600";
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	aliases {
+		spi0 = &fmc;
+		ethernet0 = &mac0;
+	};
+
+	cpus {
+		cpu@0 {
+			clock-frequency = <800000000>;
+		};
+		cpu@1 {
+			clock-frequency = <800000000>;
+		};
+	};
+};
+
+&display_port {
+	status = "okay";
+};
+
+&fmc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fmcquad_default>;
+	status = "okay";
+
+	flash@0 {
+		status = "okay";
+		spi-max-frequency = <10000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+
+	flash@1 {
+		status = "okay";
+		spi-max-frequency = <10000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+};
+
+&hace {
+	status = "okay";
+};
+
+&mac0 {
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy3>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mdio4_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ethphy3: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <2>;
+	};
+};
+
+&scu {
+	mac0-clk-delay = <0x1d 0x0a
+			  0x1d 0x0a
+			  0x1d 0x0a>;
+};
+
+&sdrammc {
+	clock-frequency = <400000000>;
+	aspeed,ecc-enabled;
+	aspeed,ecc-size-mb = <0>;
+};
+
+&uart5 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&wdt1 {
+	status = "okay";
+};
+
+&wdt2 {
+	status = "okay";
+};
+
+&wdt3 {
+	status = "okay";
+};

-- 
2.34.1


