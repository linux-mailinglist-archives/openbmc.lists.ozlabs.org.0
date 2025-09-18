Return-Path: <openbmc+bounces-658-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EDCB87267
	for <lists+openbmc@lfdr.de>; Thu, 18 Sep 2025 23:34:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSTRz0zlMz2yqR;
	Fri, 19 Sep 2025 07:34:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758231279;
	cv=pass; b=dCOvWi2N5JpyB3oXR6sz8OFKVWZzoZLptEYlHZw5xNIIL2j+Uk8CQHZIVcuDqm2ng6YLJrInkPl6GKH7VepaPgByVKg755rD8vsJyoolnacnKcsbNM2WBN7DPSHuI4YJ6NPU3qRCAcnwY+XLNX+14XQqCpTRIdYAVJFYRLLE/Om5mtYB5sYmnIvXg8gJjHgLG0HuDxgzxNyKKNVwqFZOKkL4jdBQMUOdUeqiC+dHA/hcbX/FY2rrfqXpKm7Mp2Aff3oA0RDGtFKaJQoHyZHJ9R5n5SFlLwOqTNAgMrmFUZ4DPjVDo+j/V+mQdX3Uz1Rh2V6YxiyaafMGtUcZt41o+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758231279; c=relaxed/relaxed;
	bh=BJ09SPaUDePOBxn/0JyTHM/FG00bce3jBN0wuI9/BUM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Z0pUS/ScbdPLm7gi8UGYld7UxY/u0JIYgp13h92J0PK3q5vG1AXpjTH+559ijxctEiCD2kJ6hHk6ZCnHRKN/I0Z4Wc3IQtPoX5hNjLESjUgU2fwqZM7d0ALEo6wXkfXmVSF634HeMb/xC9V0aRj9mSkx+jLF9tgww+RVeu4E++g9afGhowZZTiH7FOBTMrtzOdyuy7ZwhUSYN/YZJkhP5cgPPHJwJTPLsAhqRKnhbgp1om0upVPqa7xxWBaae5CkL357jZLMGHDil7a9K/vJqw5cTaFYkjZkSw/CLFYn5T9MR6KK55mggHF5+XOWgmUUUSNizN+AOac8bhS9yim57g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=m8ByMJFY; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=m8ByMJFY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSTRx5vfpz2yRZ
	for <openbmc@lists.ozlabs.org>; Fri, 19 Sep 2025 07:34:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0ikh2xO97kGTTk+Uj8Gvc8g27B7T+6XtVB29sEEssa8BXYAEQn7gw5ylX8/HMNLfaM4d42hKbgXOSzCARwCTHimH8dOSU6jDWOmTn5ksHFgyJ6++fkBivfH7v0vOZAf8vSb71ZeUb/KdcHMo4Y7yvE5alGvK3KvEABEGap0TYJkeCy0FSTR/ooOomqYSc3qHfpi5tTP4ADW/x1dzc6BqXuIVKTeKbEAi1tEIzPp8fVlM5AI7X3fWk074AL7fzhRyqYtArM4mU5e+I5UiZZYDOcvph6nkrf/Y/RQ5xklfSM22zdImkCAQ4Un84R/QL/d4B9PW62YFxXSWVy6hcqEfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJ09SPaUDePOBxn/0JyTHM/FG00bce3jBN0wuI9/BUM=;
 b=dHJwRDJKvKNSYX+FvPwNbhFYJuHrnFmR+YuInOFwuoh0gyo3CWfJ2HSQHqf8eXxeLNZSYy6YGFAEGOGB55twO574iSA3PMIA3/yVMJ69sQ/FApIdZGjBy7HGbHcg8/4fesuI7eB+ASKr4QdoFH2JY4xGqgMIgL/zNyVYANPzT1MTHK7IlL2tB4WB1zHK+ChIJWI8BBhAMgQ3tLKsKo/bDsPRBIy4edvVzdwxgWJs28JuFIzb8B9/oXISBmLkqUgJh2Di3MYQ/Nr2DMPhS3zQJXVDF57Yt7wfVZJx9qoi4UZ0xzlGmRRQbKNelL7Nn2bRAeMcBu27OtJBs/0RYpvTqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJ09SPaUDePOBxn/0JyTHM/FG00bce3jBN0wuI9/BUM=;
 b=m8ByMJFYUP2uN0cglznOmLEFuPTQdHj2TO0shA/oteA2qF12cMNcST56CC5EsgBrRSB4NJmgVtOlRSNWiqqC9pQefkIHmpskmUaYHxpFrye8UW5kXxu6X0qkGqR6mFtRyKufM5Rvp7ow0NGwz+aw+wWkouhv4DR5dzmcAJ0HvA69DWfLtEM603YuQJb/SEdpAxHW7P+Mw/rfgGDfRJYfCVQP4mJCNCeEQeXRNLtpbTdLIlPH0tNV0QQjU5xe3OskHWioIdtPFmnwdPMzvGrSO7Knb0uKlRG4XDVeXk3oX9M+YxAA+yWe867L6pLn4Nix7xqkPj3+tJrY85Jzw8V/TQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by SA3PR12MB8024.namprd12.prod.outlook.com
 (2603:10b6:806:312::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 21:34:12 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8%4]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 21:34:12 +0000
From: Marc Olberding <molberding@nvidia.com>
Subject: [PATCH linux dev-6.12 00/14] net: mctp: backport of mctp routing
 for bridged endpoints.
Date: Thu, 18 Sep 2025 14:33:46 -0700
Message-Id: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALt6zGgC/x3MTQrDIBBA4avIrGtxJDVtr1JKEJ2agdYENX+E3
 D3S5bd4b4dMiSnDU+yQaObMQ6zAiwDX2xhIsq8GrfRNPbCVP1fGLthCi926NEyFY5Dk78460yg
 0CDUdE314/W9f8OU4rcLTLM0VNbyP4wQwWJDsdgAAAA==
X-Change-ID: 20250917-mctp_gateway_routing-ed8cac640161
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Cc: andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758231249; l=1847;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=dNucOb/rhbG1W2fmme0tprZD/xumb2GvyOcKNvGfRpU=;
 b=VkG+cKgEfpl6ui6ew2iME0a3exS9zqfgrA3taZ3gEeK/u8J91fjZ2PhEOP7TkhZoQHhRqMZUl
 /lfCfL3V2bZCKUI6GFv3HkML2ZQRPyL96BDH9ooIXwOQC5dmhQSyL8j
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:303:b7::17) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: b4ac0c42-4757-490c-6fbf-08ddf6fb1bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUpvaDFWMzZVUWEvMXJLYWlGekJrZytTTjFRRW5yc3JWeHRPeFJ1dTVWVEdX?=
 =?utf-8?B?Zk9UZ3E5a0x4L1pyeDJ3enJRMDJKSUZsWDYzYjZ4YXQrQjBjT3N5eWF6ZnNT?=
 =?utf-8?B?QXB5dnpmZ0YyeGlpL3g5V29zQmI0dndERlZiWGlYalJaVnd3cTE0ZzlqMmRN?=
 =?utf-8?B?VENwVDhPOEtDZFVHVEtJRVRQRDJtdWJpbTUwWVk1WWt5N3l5RkFQUFJFdnlN?=
 =?utf-8?B?M3VmT1RXQ1J0elN0eHZydElGWFhVdVRyV0NYaktTMS9XNXJ3MnoxYnBIT2hR?=
 =?utf-8?B?T01nV1RGcHkwQllYSk5BZHBUV0lYai81VmN1eDBJaVE1Vk1uT2pnSW5vNkc5?=
 =?utf-8?B?Y1p5N1AybklpSzlZZFZjK3hocTVCOURKVTgxSm9JbUZQMFRkWmRxQU5oNjBE?=
 =?utf-8?B?MzlVNGFIMm02ZkZXOXcxNU1uUEpxT1NwaGxzdUlocWtGL29oQ3NRVDVkY3Uy?=
 =?utf-8?B?b0ppdVIzNG50MzBLcEJ0U3dIaUtIaHJGYktuMnBiZzVBbHRuVkc0ZzNkVWZp?=
 =?utf-8?B?cXAzM1NMOE5YWXA4TTJRM1ZRV1hiNXo4aXdzbU82WU4yai81L3lkbng2azFL?=
 =?utf-8?B?aHRGTEhDdDE2U2tSNWFjTDVoUTJ6TVZhQWoxTWVhd0NNMmI1eFdmOWZNUWdH?=
 =?utf-8?B?RUJHMnNZOHZ1VGw5a2ZSbU8vVkdMVk9yc2tEdVdiK0g1NWlRbTNYVFRtNEYw?=
 =?utf-8?B?ZGxoV3YrcmYvVVV0RjBVak5zZWg1Sk9NeERTVkdrdEEvQUFOdmFnK011eFpy?=
 =?utf-8?B?WXpEdkVhWmhSb2JXaWQvOUlDQnU3aThicDhRb1JzOUMxa3g3UE84bWw2Uzly?=
 =?utf-8?B?ZDVaWEdLekUzbG93ZTBlMENEWXM5WDc5dlRnNDY3M0E3ZFBDTjBNVEd0dTVt?=
 =?utf-8?B?UlZJTFEwN0lIVXhGUjljVU1TejJabWpaU0dYc3pheVJzZGlOZUZhSjMxUTdx?=
 =?utf-8?B?N0krZkxzMWlLVnFIM2MrVTlyR2NOQ0FXYW15OG8rRjZXclNvcHc2QURSRW5P?=
 =?utf-8?B?TzBQVmh1ZW1sdC8wa1FtU2hiWGRCVzhCM3RkNDl0eGxjNldHOUEraG9DRnI4?=
 =?utf-8?B?eWdnWldFNlpkalNNZWlwSFVTOVdFT3gwVTJyZVNQWkx2Q25yMGNSTytJbkFS?=
 =?utf-8?B?WHczZUpzNFVyZXk5QzdlTHcwb0lNQXVEUDB6aXhtSnU4UEJxV2c2azFRM0RH?=
 =?utf-8?B?ajhkTDRpSm1wUjVQRUY0SklUTDk1NXNvcVFCNndCNnVUYXhmOEdoMGFvZ1U4?=
 =?utf-8?B?OVlmVFV4U0JIdXZTcTF1N21TOU9sYTdSbHkzaDZ4TVBPTE5nUGVCZ1N4VzJm?=
 =?utf-8?B?QkFCMGY3dU43K1lDTDdqdDlIZnE4WnBEVHluV25XMXhmMElzOWMxYlBFdUZ2?=
 =?utf-8?B?MWx0V0d4S0psWjdLV2JtTEkyTG04dkJDbGo1OExTS3c3WW9jZUE1MUt1bk5Q?=
 =?utf-8?B?TFpLRVFFampiN20yK3dxdERFdHBrWmdCazBuYTFESEIrN1FqdzUzOTNMbXhS?=
 =?utf-8?B?Z2RzamJHVDMydTlVc3NlVXNVU2hNaXBWQU5FMit0a3IzWXVOK25QOHprWWlx?=
 =?utf-8?B?eFU0TDJObm1QZG1zb3J6eVdYYXJkeDFpbHpZd3lBVDdlUTBVUzlTUjF0ajhy?=
 =?utf-8?B?VHdNd3RhV0F5d3UxTzJyaTNJUVFzMmY2ME01cUh1THphemN6akhsaHRGb1Ba?=
 =?utf-8?B?Zmk0V0dwWDNPT2hZOTI1QXZ1Y3ZiWlZ5T1RheCsvOXZkMjhka3VWajltektU?=
 =?utf-8?B?MmdHVkE5ZzRSRFZHSjBISGFzZkZOM3ZrWEY0aFdMRGlaTGkxY2RJc2FreUk5?=
 =?utf-8?B?NytPclVXbVRBbnNicTM5K0NVa3psYW45U1h0dEp0Tzg0WERVd2Q0czQ3MDRX?=
 =?utf-8?B?aDh3bDJMMXNtM050QmNEZjI4bWxXOU9icDVPRDA3VjdMNnFpMzNFNXZSL0R6?=
 =?utf-8?Q?YQtzoYGisbI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHBmbHQ2bFNqWUxWeE9OVnY0VkIyZ1BnR05Oc2w4OC9xQnE4Vk5McXUwRTY5?=
 =?utf-8?B?T0toZWdCeURQRFRFVmJuSC9rNU9mbnNvK2pLZ1dBQktJRnZJM3N4YWJtclEr?=
 =?utf-8?B?V012d21NdXN5UG8yNDNML2lnVmVxaXJvamxHbkwvcnBZZGxwY0pvVlEveHRo?=
 =?utf-8?B?TjFMRTVyTWF3L1BLMENxTVZiRjhPQUtRMDRBRUpVOWV5SnZ5K05FcEhCdS9H?=
 =?utf-8?B?eTR1RHRkRkFGWEM4ZlkyRGNjNUdHQ0R1VVBkaUorZ0s1WHU4OHJ0ZTNENTRa?=
 =?utf-8?B?M2xjcE1ORW95NzNDSDBieG9aTCtQbEFMc0lqL1hDWlhYME0vQitKMTdMc1c3?=
 =?utf-8?B?T3U0cUlNQzl0TUQwckx0aWlZYWtxWFkwaEI4YUdXL1NtU2MvdFVwNXVXZ2tx?=
 =?utf-8?B?VjloZkR6a0VqbHYrRFhzdnFDQlYrQXV5R2FXek1wTUduc1BwT0JsZ0FXQW8y?=
 =?utf-8?B?SktXMTFFRFdWWFhZTWovRUJHNU04bWxINXE0UWhBbjEzeG9qQnJLRi91eEhm?=
 =?utf-8?B?T1YvOVdVVzBTb3Q0UXF5TEtvWHBUMXZ0Myt1bHVzV2p4dThEMUVXOSswZEtV?=
 =?utf-8?B?Qm5UQXc0eDRyU1RWOTZ1aHA2aXRiVk5YZjhnQk13bzJqeThSVDRUUjNVWVJa?=
 =?utf-8?B?NE1CZzdUKzkxRFlFT2duTGtjRFZoOGFBUzlIemxBVGhIQTlDWHBneXhtaFpn?=
 =?utf-8?B?NnBYck1hQnZYSDQ3Z2ZYVVpyMlE3WHE3Q1Q2TXcwUnlWWm90eThFV0JJNjlV?=
 =?utf-8?B?YTlJUXFxWHp2Q24zbTMzc0JmdGs2dWhqZGw0UHBXN2JRNStKM3NzbHI3UE1N?=
 =?utf-8?B?andRZG9hcFRxSUxocFRKSURjUXlDazB6ZlJaVHJyaWdoRjhIa0hSR2lsbzkw?=
 =?utf-8?B?dVJYSHM4amY4bS9tcXJwdTNLdTJ0WHA5blVkSEp2TnBxSEhOQjBoL1lkSUlx?=
 =?utf-8?B?ZWVHY2xoWkN3VTNHSE5maWVmcjlkbkx0RzBmQlh6ZStPaHRTZFN6ZzQrU1hs?=
 =?utf-8?B?ZWxPLytqOE9FVytSRlNvdU55N2REYUlNWFpxTnN6cFgwQS9jbDhHdHRBdi9T?=
 =?utf-8?B?Z1UzbW81TXhzanZqTlErQnRUQkphZDBKK0VPcjM1VzBGaWU3bkorMXBqN1RO?=
 =?utf-8?B?dFh1eDFXckswY1FNaDI1L1hrY2tvUFhNUEhCcHhBZEo3YmMvRTR1ZEFJVEFk?=
 =?utf-8?B?RXFHdjlGb3ZCK0x2QkZ6K2VIZGNCam5DSGFhUmN2b05xSDR0UU1Nellhd2J3?=
 =?utf-8?B?dUI2bGgrb0s5ZmhsSFQySDkzUS85Q1RmRUZTWWRUWU12V2xwTTFmc0hNSi81?=
 =?utf-8?B?MkxER2tyY3VpM003NEJ1eHlkVHFDQ1lxNlBkVXU3N3RxZU9TTFEyTGlkQ251?=
 =?utf-8?B?N3I3N1h0Zms1VloyNWtvYVl6U1ppUjBFNC8wdnlNMGJtcEphUzBuTzZBOGpU?=
 =?utf-8?B?a1JMeVFtd3hxS21BalExdlp2WnNrbVBHeUxQSDl6UlNCWUx4N2c0eUtFcEh3?=
 =?utf-8?B?VmdlbGhJYXUrNTJucDlQMVovcWpiaW01MW1uV2hFV0R3TUNHYnNJbGk5UjA1?=
 =?utf-8?B?OVo0ZHNmbXNJTTRMa3RPVkxLRjhncHdDbTZKNkxDQXVyS3NIaTMrbmErdFAw?=
 =?utf-8?B?eXdWcEZXdFcxYmFIRnYzanlva1dEVHhnQnZWQTBObVhTWW1VQ21jdnFvQUpC?=
 =?utf-8?B?aHNURGlyYXIzQ0I3TFpZVjE1TXlDMlUwbUZ1bWkvTEs5M01OL1piMXM3eVF4?=
 =?utf-8?B?R0kyakhDUXM4UENaUUhTcm10RkY3MG9Sd0FVWmdqUjhuRnJiazZLZ2hGVWZ1?=
 =?utf-8?B?UnlXM1l0NytHVDdESmRYVTc4Y29sUGpLVzd6Z2RSdGhndWQrNVE2Z25ia0d1?=
 =?utf-8?B?Z09sRnQrWWdhSHM1SUxFaC9TbUMxczV0cTVYQ3RleUptbnNNRHAxWVNvSVph?=
 =?utf-8?B?U09ONXIyUm5iYklmYmNqZzlORURaSWlubCtXbWIrYkZTSFRxcW9WTENyclVm?=
 =?utf-8?B?QnZ5blRQem41OXdRTS91aHo1ZGpKWGZFTlMxdVF2ZUNSb0FsWk5XN1VxU2s4?=
 =?utf-8?B?UWZVbnpzZk1ZalQwSGFtdnQ4Q0g3M2xFaCswaWxpUjliKyt4RzRXWnVUMCtR?=
 =?utf-8?Q?pXxmwbiJSLBY+/O6FUqUtIYC4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ac0c42-4757-490c-6fbf-08ddf6fb1bfe
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 21:34:12.4972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/H7g8sjDh09PrsaapElEEny+Y6YyP3zlYnt2uFPxOXFwNauwQ4POopacPwAaGf/b8z/7e0Qur4yRgBb5mmg9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is a backport of mctp routing for bridged endpoints
to dev-6.12, taken from net-next. This allows us to use
the current tip of the mctp repo to deal with bridged
endpoints. This was tested on an nvl32-obmc model, with
the current tip of the mctp repo using mctp-daemon.

Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
Jeremy Kerr (14):
      net: mctp: don't use source cb data when forwarding, ensure pkt_type is set
      net: mctp: test: make cloned_frag buffers more appropriately-sized
      net: mctp: separate routing database from routing operations
      net: mctp: separate cb from direct-addressing routing
      net: mctp: test: Add an addressed device constructor
      net: mctp: test: Add extaddr routing output test
      net: mctp: test: move functions into utils.[ch]
      net: mctp: test: add sock test infrastructure
      net: mctp: test: Add initial socket tests
      net: mctp: pass net into route creation
      net: mctp: remove routes by netid, not by device
      net: mctp: allow NL parsing directly into a struct mctp_route
      net: mctp: add gateway routing support
      net: mctp: test: Add tests for gateway routes

 include/net/mctp.h         |  52 +++-
 include/uapi/linux/mctp.h  |   8 +
 net/mctp/af_mctp.c         |  66 ++---
 net/mctp/route.c           | 574 ++++++++++++++++++++++++++++--------------
 net/mctp/test/route-test.c | 612 +++++++++++++++++++++++++++++----------------
 net/mctp/test/sock-test.c  | 229 +++++++++++++++++
 net/mctp/test/utils.c      | 196 ++++++++++++++-
 net/mctp/test/utils.h      |  44 ++++
 8 files changed, 1324 insertions(+), 457 deletions(-)
---
base-commit: 050998469a36ed1dca7ff3b9ed21ef1ab65a9ae0
change-id: 20250917-mctp_gateway_routing-ed8cac640161

Best regards,
-- 
Marc Olberding <molberding@nvidia.com>


