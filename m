Return-Path: <openbmc+bounces-672-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AA5B8729A
	for <lists+openbmc@lfdr.de>; Thu, 18 Sep 2025 23:37:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSTSL3GJJz3cgd;
	Fri, 19 Sep 2025 07:34:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c001::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758231298;
	cv=pass; b=d3KzXxBjSleuF5L2tjhsCVkF0T99Ng8gSzmhqgSvaIJUyFblqPgnlyWMvGVpUN+1vpxdjXHE37YiI70FFUkmEuNP+CwqHRM6AB17VVwdrkJGVzQFcg2u0/IDyV1U0OaeJOFd2LQJg8bqMbQXrSrCXNbXBSkrRPVDic6oExK+LRPDkCycJF3MgNtqiQY1/nF2AbxsavA4mngOgM6MKS7whiYUXJy69NhpDM4mP8cyKip2NTJzVivwQbl7fOyQGaNPNI/+8IsCzsY4bLg7L+GSj1cDdTXQFQU60VwfIBYCEzPrG4ntVMzfjANFI5sz6N+5quAiDVw4wM8arXW9U7LoZw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758231298; c=relaxed/relaxed;
	bh=e6sSkfbszHKv5FDVRjjH85LJpe1ewN8XB3cYHu5IFoo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=obAuhZ2AepPkFzPp+oWGp5Oruux5RpJ+b63CUvL4v9Hyl4IiZKHTtAEmkZbRqrkflkxCExjQkrERous8JqlUqlX649nCha2RaKM3lNNJfWOoTqna4PoxVD4xAyBy63g/Y/FbOBU76GsxydSStkIbBCOpUf9sVnQQLw0gilYCkB4BXRks61iwpMriXqb1H1pgcgUQwSfHzWz1isR4XoGYl6cC4mnUCCIP2RjTqDxRjWR2d/09cgToJYwu2MuGV1he19QTMgFUloxa3YT2UgC+DZkLRPzjHf4KgKpGUOpRaxlBowOKJ/JT7SglKGSIcQXakoGjc896rhw3pK3nzVoW0Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=At/ar26l; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c001::2; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=At/ar26l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c001::2; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c001::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSTSK5dxpz3cfm
	for <openbmc@lists.ozlabs.org>; Fri, 19 Sep 2025 07:34:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJIWVf9dCaVQ0DOdvXFR5U67lo2B4eLshPKMDE01mjnZKLN4OWc2SfoXfPz07jEpYRTHFYQUKQAmKKVg9uGBufqyCY42Aoc903TNt016capiMa+tAnMXZ45CM5M52wdvJQxydP4AcJAiSrcVaCclaCeukWZ+hWI9rJkDuvIZY3YQvPIRrsfzJnMlER+aIoTLxms0ekDjO+8khJSFU/Pvwd0m9uG7+NPtqMhBnsiz9lMy5YF23l3WmOzsayOCs5x5/VqZUdrEcNH9MT0ExGws3SawYBCyLQJgLCnxE5/GU4sO71lhlqWbBNbiPpFK8IgFt9xn3h0gPYN+tVfqiZe2LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6sSkfbszHKv5FDVRjjH85LJpe1ewN8XB3cYHu5IFoo=;
 b=ftIzgRXAwt0jwFyXqx0SeubJO2xBcjaNaa45TB7HWlIs0h4gp0+I8ft6n1F+4Wz/PMp3+ebc969tfh2d4lfz+91vuuYin5fSh0d1js5HAGDM8ZKzCtwtrcoc2CLcpV2ZaYBDSMGvYkpoSEqoIxsYGKqae9MKaldCjaFrlHCpliiGbSLo67YJ+ritzbEJ47WAePkdev5/NW3WVGqiPbARwdFdlIKNpL6VOECCrqGTBIHs7UwKtnBVv/UOWLeJngTnqQw1ldl2rHEZvnvT7MU3ckS8KWPUQbjV2+imL1qh5RKwJhZEH9UVU/5ilji0gDQWdWPtnLNFlXoT0cF0R7aPBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6sSkfbszHKv5FDVRjjH85LJpe1ewN8XB3cYHu5IFoo=;
 b=At/ar26lqQ73Hkyr2ZvxTg0U79EWr/YcwFKVJ6x+7JmXkElGqp08TNC69tnXEU2ZiM1WIItWPcxLHEHbQXjmOHNAh2Yy0s2FahOBO/uy6eO3nQSUUx5nk5FjSsnzLS+Y4hTDjY+uUJHYOtV6FfjASVtAN1iomi+mkzqN88oF6LLotMyvj9SLNGN5H8p84+j+/UFk5HZ0W+rfGdIxf9i0P0Be3cmi68dw/3sgr19TMSQfA8L1gPJs21HKrAhuvAhAwnEfLKIMx/kj2wg7QmaD5B3N/RGyQlwNmvW7/Zujg0m9guKb35C3RGP5ocXg/RVKfE4V2LBC+3Aj4RLsBXNGbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by SA3PR12MB8024.namprd12.prod.outlook.com
 (2603:10b6:806:312::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 21:34:16 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8%4]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 21:34:16 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Thu, 18 Sep 2025 14:33:48 -0700
Subject: [PATCH linux dev-6.12 02/14] net: mctp: test: make cloned_frag
 buffers more appropriately-sized
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-mctp_gateway_routing-v1-2-8fdedda742c3@nvidia.com>
References: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
In-Reply-To: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Cc: andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758231249; l=1611;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=+o8hSKySwKHoFSE8gh9TCpdolyZuUPwkt8qm89t0DUc=;
 b=QviLjldkzCS8c9pOMCABN1GN3f2MZmBOHKuQ9T9xMbHRHxsL8uU/QeHJxEKNBudn2J7vDnJr5
 KrE/Zu21bDlBS5/oenYHp5jNz01E3Spig4rhP9i+9DWflHEXmlaP+0h
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4PR04CA0235.namprd04.prod.outlook.com
 (2603:10b6:303:87::30) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 8235ae7f-d60d-483f-e006-08ddf6fb1e11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzZIQ00zU0RkQXRDWmNEK0s4ZllQdDB6aGEvVWkzbjNmSm5IMlUxWWRnZHlj?=
 =?utf-8?B?ekRnWHJ0K1pZbkJaSG1PRVVQbExwWnFWcVM5TzUwQ1Y4TW1UU0ZPYm9PVmN1?=
 =?utf-8?B?ZWIrVjlycVV2SkVpVnZwSW4xK3VFUWR6Z1JySnc2L0Jxc2dZMFRrNkZlZG4x?=
 =?utf-8?B?SHBxR2RQNzhsNStaVWRBUnU2VW8xY1hBQjZjNlZtUVN1cUtTaGhDSEhmMnV0?=
 =?utf-8?B?ZTRxSFFQY3RsWTVYMHc5TUk2WjdKQTNURnJTWXNQdHRMZDkxeFJuQnNrV0hr?=
 =?utf-8?B?Q25OamZrdXFibmpFNUhFMVBFTDJpdnRIaC9LbzBzS1FEWERpOSt4YmNFcmJy?=
 =?utf-8?B?MU43SExQUy8wMXR4V0hFbDJVQVFIemtDYzNKelo1R3N6QWRUVzJKaVNDRXR2?=
 =?utf-8?B?WG5lcHlmb0xZNUJRTlljTlllQUZMeEtUNkRWanp4a2pNbXdNZkJaWEJIOU1B?=
 =?utf-8?B?VThzVXZoRTdUak1SbWVuL2orM0dBaTM1YVlJNnQ2aS8xNWdrZTFidkxwc2M3?=
 =?utf-8?B?ZWh1bVFIcnpxSFVPSGtXR0ludnJYQjBYNUR4SndGSlNUZ0FCMjlzajJqUHdz?=
 =?utf-8?B?bytkSEd1MFBlaXBSVER6dnYrdGJnTWw4Zk9PaDVLMW8rSGNKNTdZeHNMRS9X?=
 =?utf-8?B?UGcwTmwzYi9CcXlXT1pxeHJNeDg4c2g3bXkvUGZja2ttcmNDNzhZV3ZZZmVr?=
 =?utf-8?B?QzJmZVMvL2tkVVEzb01GVTdXakZTUGdmbXBSSWlxQW9LRTROWkxFVnFsbDJ1?=
 =?utf-8?B?aEt0Wm5rTTdjUThFNW0vb3JtV2VDQmlWb3BrQWUzNGR0eDJIRExJSmJCcnBo?=
 =?utf-8?B?dmR3RXM1dWpSbVNncC9IdFhVbm9LMUZqMG43L2E4Wnk4SCsxTERCdlkwNzA4?=
 =?utf-8?B?YnhUNGIvbHArb3Jna2g4c1hoVDJ6dmxvbGFyL0d1bHQ3MnNwSnBTUjJxemIv?=
 =?utf-8?B?VDZyR0lEL2oxaWhUc1BqK2o3NDg3d0pydlBlNzNZeUNyTGNwU1NZYTFZNDEr?=
 =?utf-8?B?dnd5OHV0eWVSa1VYeUxadlVBZ29JRjRqL1puYU9WWGtMVzFxYnQ0UWJsYnQz?=
 =?utf-8?B?TVZCTnpuOEtFR2p2MGFWUUhwUjIrZXk0RlNaVzlid1RYTWZtcWYxWVhFdjR1?=
 =?utf-8?B?UlpCOW9aNVE4MXl6SXJaRlZRY3FNOHlDYUcwajBQeU9JZkdEU2Y5eGdTVTFU?=
 =?utf-8?B?OGhrck9XdXRuU1N0ZFIvS05TN2VDSkR5UzFxR1p4YWc1SmtWVnBlbytTU1h5?=
 =?utf-8?B?WU9lSkpnRGtJQkR3bnlQdjBWc2M4WDR1VVZITWpNQXIrMjRZRk1RMHdtNkds?=
 =?utf-8?B?SEVaSXdEUkwvaTZMdmVhMEtMaGRFQ3cxcEFzeDgvYy9VRHd4RGhiT05oR3cz?=
 =?utf-8?B?cUpKandhUkVxc2Y1bmNzRnV3UTN6QWladkREdlluV1UwRU5aa2JBRGNWello?=
 =?utf-8?B?UVplazR3SndxL1IzQmVDR2FZcFdhNzZDUU1UOFRUV1FRRE0wZ0ZnQ1JnVmhL?=
 =?utf-8?B?U1VEQXczZlFmWGZCTE9ubTlXMzZMVXorajdlMWs5cnN5cGRlR3VjWHU5cGNW?=
 =?utf-8?B?YklxVS85Mkl2WXI2K1RmM3FWVkdsbzNLbkVLMU45VFNGTWE3blNMajVmR3Jz?=
 =?utf-8?B?d1NZQ2F6R3NxN3FsTktiL090eUtnYzhGYWs2STdBT254T1lSQWZVQ2FtQ25i?=
 =?utf-8?B?aUZGZERCRGlwZENCRTg4V3p2YUlSMHo5TGcvZGM0R0dRc2ZpWXQ1anpOWG1F?=
 =?utf-8?B?L3RRWGprelVpRk5DU1M5MEFoSXZaYmM5bWdVY0NCajR5dlYyU1lYSGhveTF1?=
 =?utf-8?B?ZGpoclpmUXdVQnlQRy9oOE9nSFMxWjA3Nml3bEdyQjRocSt6Vzc1ZUJKdlJh?=
 =?utf-8?B?cExQRG1Bb2swT1pXNXZVQlVwTXJIdjZuOExNN1QyRHkwNjJhNmhsUGZTeEhL?=
 =?utf-8?Q?SFD3ZWJv9+Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1U0a2J4a3p0a0w3OW5TS3Z4N1NralllcWI4NUg2UHpxNEJkbklXN0QvMEMy?=
 =?utf-8?B?eWcwS09YZ2VaRGx3TkpkK3ZBZ1RRanB5anNvMFV4blptMDZ1cnhBR3JPSTBp?=
 =?utf-8?B?Sk04QW1IMVFsVHVIL2ttUnNHNndXdUcyTmE5RElmVlVPb3VjMnJDVlRqYXVF?=
 =?utf-8?B?QXB5WXR6MjdYRnoxR3k5SU9maVNwREFaSjhWeGdUZGVPc3RNNGE5dkIvbUk4?=
 =?utf-8?B?eXRsMXdJcmlSMmRXMkNndnc1a1E2SVVwZE12WDFtWnkySlNaaGNSbmx0Ni9k?=
 =?utf-8?B?U25wL0Vya21DZEp0TGpLa0kwUllKc1d2QnBMYmpRMDQxN04xY2xHREFDZHdt?=
 =?utf-8?B?b0dyU3lNbDNsa0U1bUdPK2U2eVgwb3JjOGxFOGFjN0U3VmM1ektHNEpzWGM1?=
 =?utf-8?B?ekRha3RPYVdncnFBZ1d0ZFE3WnNJYlpNWm1ocGgzYnEzWjBJNnRxWS9jMmll?=
 =?utf-8?B?dHhmalFVcncxaHVlanZldytRNnQxclVrVW4vM0ppc3JjdzcrYkdTVW1MdUhN?=
 =?utf-8?B?UFdFdUZLV0tPV09QLzZoWE82RUljNGZjSjMveHJQdFcvYUV4eHF5OWMweW5s?=
 =?utf-8?B?ZTdPOVBVTlBKYUpSdVdxOHVTckdzTmpTNVB5OHdaVUhURHpEMktOSVExaUFZ?=
 =?utf-8?B?UGM0c3NOdy9KdDhwcHpkNlN4UURaVGdFOHVtTVBnYTJtTEl2VnpibXlCQ0V5?=
 =?utf-8?B?b3RnaVdmaEdxQlZYMENkNU0zSXlhZnpqdU1iVzRyN3dMenAyaTdCa0YvQWhz?=
 =?utf-8?B?bWMvZW1YR3JhcjY5dGNGV2J1WEhDRnVuVkNrZDhvMlMwK1dPb2F2TnhXdEwr?=
 =?utf-8?B?TGZjcDFHVEl5UTVtMkV6eFNiRUxaS0tXYklmTlJqcWkwQkVubUhnRW16SGwv?=
 =?utf-8?B?RUxpUVZ1NDhaUnlIQ2J5TzFNZEszUXpjYjVKK0R4cHNuZ0pNb0wvT2RSNkNj?=
 =?utf-8?B?aitnOUR0djJlQVlscGFqS1dFY0ZaNWhFTTdUbmxPZ2tjbWF1RE1BVVNTeldN?=
 =?utf-8?B?V25QTzcrRTZ3aFZQUFlQTlh4NGRoWE0wcjBHWkRpNGp3RytEUkFqZGZENkxW?=
 =?utf-8?B?UFBkcDVNdjhUYmF0N09ETXZmZWF4MDhNV0FtZ2YzeHFHL3c3R1pjV21qL05T?=
 =?utf-8?B?V0c0a1hDUzhTVkNOYVRXK0NzcjljMjRra3cyK0ZOdmRKc0lMdWFabFFtZ3F6?=
 =?utf-8?B?SWVQek5acEYrdUdhb3R2VlI2SnVtYmtCR1dDSkFGNW5HaWJibTB1WDJRUnpj?=
 =?utf-8?B?aHZDSU5sc0hiNmNNVldqV1QxbElvVWtLTXdoWFpRRXFTRk1UZldmeFVwUkho?=
 =?utf-8?B?QW5BT2pxVXpjZGhrSkszYmdjaDZ6L0xYdXpqZDU1L1VpbkM0ZlZldFFVL0JQ?=
 =?utf-8?B?U3ZJZE1nQW54QzNWK0VPU1hjY21xbUxremNaU2VqUm1JZEh6RXJnUndTVlBh?=
 =?utf-8?B?VXZKaFUyUmdPZkljMTJWSURwSVF0RHNlamEycTlWOXUxdDNSN3pacG5WbUov?=
 =?utf-8?B?UzhRSmxtWFhnSDZhNFA3bDI4TGdOWmY2Y0MvK1FGYnlLK1V0YmkvdElJaXZG?=
 =?utf-8?B?YmE5NXNYUFNYY1dVcFArUFFoQTFUZVNuSVhqWVh0LytqMkJIc2ZuL0FvVFlt?=
 =?utf-8?B?aituSy8yNVlOZHNGMVh6QzgrOVV0Ly90Y2VtaWU5NW5sei93U2VxVUt2SE9i?=
 =?utf-8?B?VTJvenlWUFVMWHBuOWJYaUNDOWdqVXBuWVYxWUpBWERaSDBYTngyNmFsMkVa?=
 =?utf-8?B?ZGtoRHF4QjdRZXBsUEZyNUZ2WUpPb3o0T2ZoLzBWRFBTYWt0OGRudjdsNG03?=
 =?utf-8?B?UU5Hc0RDdWR2QjlyUGR1emxaeU9qcXp3dVNYcTJ2M0NtR3pkbE8zUmdMTDQr?=
 =?utf-8?B?enV4MmhFY2l0Z0xHMmwxQ0Q5TVplS3AzUVJOR0hsSWhqS3Bha25jWWR0OFda?=
 =?utf-8?B?TFp2VnVYR3lKWklwdVV2M2cwY1RDa2wwdC9rTmUvaCtyRVVwalJ0dS8wdEh2?=
 =?utf-8?B?Qm9OL0NORkFaejZsd1RVRzZ1OFVzVk5oYkJEbzhXT0k3SXQ3U2xrK3lES2JC?=
 =?utf-8?B?RnJoZS9EZTFIbml3Q1J0cnA3VGhHcE1QWGFDRGtYYzZpMjVwQWIzOVp0RkNY?=
 =?utf-8?Q?Ieib7120u8err56TIIt99CE92?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8235ae7f-d60d-483f-e006-08ddf6fb1e11
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 21:34:15.9639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ME6qVXKMGojG39pOmnYuHoFGmQDA5+xrbQoUHf5/3NNzzo3zTB+R9M2zDqjWaNvK6b+B7XFxtrxe3gfh/r6AWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jeremy Kerr <jk@codeconstruct.com.au>

In our input_cloned_frag test, we currently allocate our test buffers
arbitrarily-sized at 100 bytes.

We only expect to receive a max of 15 bytes from the socket, so reduce
to a more appropriate size. There are some upcoming changes to the
routing code which hit a frame-size limit on s390, so reduce the usage
before that lands.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Link: https://patch.msgid.link/20250702-dev-forwarding-v5-2-1468191da8a4@codeconstruct.com.au
Signed-off-by: Paolo Abeni <pabeni@redhat.com>

(cherry picked from commit fc2b87d036e2155b16f8c53c8198df7b376fd616)
---
 net/mctp/test/route-test.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/net/mctp/test/route-test.c b/net/mctp/test/route-test.c
index 06c1897b685a8bdfd6bb4f1bccaacb53b0cd54ba..44ebc8e4e30c6a8f91360926ede99510df2576b2 100644
--- a/net/mctp/test/route-test.c
+++ b/net/mctp/test/route-test.c
@@ -933,20 +933,18 @@ static void mctp_test_route_input_cloned_frag(struct kunit *test)
 		RX_FRAG(FL_S, 0),
 		RX_FRAG(FL_E, 1),
 	};
+	const size_t data_len = 3; /* arbitrary */
+	u8 compare[3 * ARRAY_SIZE(hdrs)];
+	u8 flat[3 * ARRAY_SIZE(hdrs)];
 	struct mctp_test_route *rt;
 	struct mctp_test_dev *dev;
 	struct sk_buff *skb[5];
 	struct sk_buff *rx_skb;
 	struct socket *sock;
-	size_t data_len;
-	u8 compare[100];
-	u8 flat[100];
 	size_t total;
 	void *p;
 	int rc;
 
-	/* Arbitrary length */
-	data_len = 3;
 	total = data_len + sizeof(struct mctp_hdr);
 
 	__mctp_route_test_init(test, &dev, &rt, &sock, MCTP_NET_ANY);

-- 
2.34.1


