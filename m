Return-Path: <openbmc+bounces-1312-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJZhOjErgWlgEgMAu9opvQ
	(envelope-from <openbmc+bounces-1312-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 02 Feb 2026 23:54:41 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 332F6D284B
	for <lists+openbmc@lfdr.de>; Mon, 02 Feb 2026 23:54:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4hkD52pjz3bW7;
	Tue, 03 Feb 2026 09:53:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c005::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770038240;
	cv=pass; b=g0KPr9+b0U5YnSiseXS+Bozb+ItNplkWoQqql4X8ShSDzlXELWR+63N8UbEZRsVZm5o9jEKPFysf92xIAHojtTTdLIQAb4K0NU/bqB3SdRw6JFZpRIzt810lNQjkOLNpRouGO3++159k//HU9vwMKPjrkzp7fxVgoiTLNYk7kxtoR05K3l2c1Bnea34H+tfQ9xp0gjzMKhsbk+WtAXCJ7fBDdN249/6Kt+9tUG+soV3TgFRXBVrJhe8M2r+QPHS2dmTb72rOqjWUo34nYMZc+K3T9oRzDUZmtaFhwizSYALxUqoSJm/kE4GZolfsF7ZO9VCfqMP1aCpzPLPReT1a/A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770038240; c=relaxed/relaxed;
	bh=XE/gUTpMp05dQTr74GUgf3DlEpZZ4za0PyRVDLu5DXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hHxN4ZaDwFEbZ5lRJxLCBZIF5joBfOPoQgLAVw/VZI6NHoUrwGO4CfHWv5dn8gdG8dspdp0BGlnZWjnLwB/PwVuAFYZOakIUwQv8xr3tYFl2y0vssX6xbz9NDkDQywyPX2jLieLAV/2tNBtjNXiiK3IUjNLvPqWuc9J8vFBxA1zdfVhrnzo96n0m4q9RQf6lZWhhnddSQfNRX8FVsRIbsamMHEqZidTHmDNzvYEB4gmsqnxwHOl32ogpoOCTw0veG/jKMvkcSVyDg51baoJO2s0uuL7iNpFdSmQG1wCjiTzgR9gdJzFYaHdG2KZYgJg5ygzVpc6RytF3gntvimxinw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=JAp7Nzo5; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c005::5; helo=co1pr03cu002.outbound.protection.outlook.com; envelope-from=vmoravcevic@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=JAp7Nzo5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c005::5; helo=co1pr03cu002.outbound.protection.outlook.com; envelope-from=vmoravcevic@axiado.com; receiver=lists.ozlabs.org)
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c005::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4Rwv1YmYz30BR
	for <openbmc@lists.ozlabs.org>; Tue, 03 Feb 2026 00:17:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUzow0aNliCr5yP3rdhRrsm18qhc/mXa8lUdzCwhLdc/E+8HoaUmSnoykciFYffzaeVjYNDo1vd2hoC+GIXUwrq8YGOSnFheNaRt5r2udUmbvAc0z6cjjAqgX3fQoBjU2EF3iahmMa/OG814M/tE60mVcb7yPlwWsaGdDq4DmTzj1EZ6CsNPAan5dQ/OWi+yU04N4Mzujxe/AV/8uD1TVw6JR5JG5TtOHWNUahrXLJ2JyfWloGEYHRu8KTTnom3jcAo69qbS3q8r1QXdLa8q79f4CJllBKeExMB5ERpk8xcAlqIcIXz9816emE6ffJXWVI1CqaMlTt6SIeec9LVYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XE/gUTpMp05dQTr74GUgf3DlEpZZ4za0PyRVDLu5DXo=;
 b=W8UKcq/sB6agHMD+jfDAwQJpR+LBRrohMq1HmK8nO65yEzqp2H9gZ17w43pSCqTFa3rwzJFhD7TGvOzYpfCxPGRm3sMDK706hi7ynQss7/90cDdsJHHKPh1Mf2duj8cnFzonB3z29mpdgRXe3fvzCa74NGW6TVVCJQ3KXyT4tablUlkcsOJDkZeWHPN+IUbkzC3Itnt0A7DdbZMBuOngpa3vyabMD3+6F/BExrBAhlX0YvIpDGnIuvS9nldDj0gEVbefANnarYT7dS6i5cpo8n5cH0IE8A4tBDkvmvzDM8A93gLYxCl3vFA5+N6upAaCFoo0BSL03p3aVORbWizExg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XE/gUTpMp05dQTr74GUgf3DlEpZZ4za0PyRVDLu5DXo=;
 b=JAp7Nzo50x6Av264w2Sfz2TKNca5biynu71I1q4nw6LQqMB3ODvsnp8JBPM0Y26F5wgl682e7wLV+RvU45F2DfoTMPyFp2Cb9B1hh6AHCMUDkgZ/6Fbs4C0VhhYntlR+z57mj8qCk0UTJbYP6E5rn/BqlbP0IMqHn2l1S+GKmuEVoCdcmIFn0YMCL6FRji/c+Q12Etih2qAfFCOFRlegMUeKmkkhRsafb6XzbYmk2EQ3aDDj0SREYGv7I5w3odsNyd5Kb/ec6mvC/xP9tTmpzxwqkdwXzOn5X3w4BPCihFUWNlGKeyG+b/fZpnqwIAMm9RWosSjRTpUYY4K1/b2AWg==
Received: from SJ0PR13CA0225.namprd13.prod.outlook.com (2603:10b6:a03:2c1::20)
 by SA3PR18MB5626.namprd18.prod.outlook.com (2603:10b6:806:396::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Mon, 2 Feb
 2026 13:16:55 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::29) by SJ0PR13CA0225.outlook.office365.com
 (2603:10b6:a03:2c1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Mon,
 2 Feb 2026 13:16:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=[127.0.0.1];
Received: from [127.0.0.1] (4.227.125.105) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 2 Feb 2026 13:16:54 +0000
From: Vladimir Moravcevic <vmoravcevic@axiado.com>
Date: Mon, 02 Feb 2026 05:16:30 -0800
Subject: [PATCH 3/3] MAINTAINERS: Add entries for the Axiado USB UDC
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-axiado-ax3000-usb-device-controller-v1-3-45ce0a8b014f@axiado.com>
References: <20260202-axiado-ax3000-usb-device-controller-v1-0-45ce0a8b014f@axiado.com>
In-Reply-To: <20260202-axiado-ax3000-usb-device-controller-v1-0-45ce0a8b014f@axiado.com>
To: Krutik Shah <krutikshah@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Vladimir Moravcevic <vmoravcevic@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770038210; l=1165;
 i=vmoravcevic@axiado.com; s=20250904; h=from:subject:message-id;
 bh=a6qvZkig+pybK/x4cqEI0Br3sS95b4VbSIeqdNAr0wE=;
 b=Y+LRgCQrxVPRFnbFVYYY4wCtp2aBj9UntFkjIwHv6moaUP+ddKpQxuksrQ/b0efv5rOhw0YmB
 QJq0dHRnS05BDUXfWKpCQ/BKCYMmoV/7YJ58H4xYzjq3YWXSUiAnM9s
X-Developer-Key: i=vmoravcevic@axiado.com; a=ed25519;
 pk=iiyhWhM1F4HlCbbW3I3qKZhPCE8JsCrDQMgCBRg4YMA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|SA3PR18MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: 232cbf40-5070-4d69-978e-08de625d5670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVNzaEhSR0hkYmdNb0VyMG04ZG5zNHBlQXd2Mnc4aEI3NXBFM0t5bnhVOWV1?=
 =?utf-8?B?TXg5QjFUM210a0picGJXc2wvWk41a3lrZVRVcW1Ra29xYXZzdHBUZURQRnZM?=
 =?utf-8?B?ZXBxenhvazBFUUx4bHFQSWpac1ZxTDZ2LzViNXg2amJod3NJMW9TeWl1bVda?=
 =?utf-8?B?RlZkbTFsZWlwWEw0eGQ5SVBOdmU2ZFVvWHlrTk1hVHRzVWZwZ1htM1N5Tzk0?=
 =?utf-8?B?MXRqOHpWYkVGb1p6dmVraGRMN09kOHd4bVZ1NkdCV3NpQTI5RWpBV05XdmpP?=
 =?utf-8?B?bTNWcmdSdzRLU0x3bEtPaDE5OUdlU0lPSzZCejFhT004VDBEYlRtNGxrNmNv?=
 =?utf-8?B?OVJwV3FvVWgvWFZXaVhrc1FkaTdvREdsSi9xcXBIUnpHZS94L2ZvWDl6ODRq?=
 =?utf-8?B?SHpmZW50dDhKc21XT2hERUVvckJyVm9MVWRzM0JISVExRStpczl5Z0VTSzlS?=
 =?utf-8?B?OTZUdjJPd0JyWXpTM25vemx5cFFKRk9ubW1JQ2N3S2gzdHBTNGVmWlVxcFNE?=
 =?utf-8?B?cFN3aTdxanNsaVZ3N1lUTTdTZE14Qm5jWnNFMEZFWFE2VjlIT21ObEo0QTFP?=
 =?utf-8?B?Q0tUUHhwSmU2VnlmamRFYTJTc1V0T09RMGx4VUFqTEZ4T1B4dWYxcUEwV20v?=
 =?utf-8?B?dmFZdHZ0RnRZUjJET2txUEtOM0tQMjZKSzRLMmxxSDdmT0ZuRUpHM1BqQjky?=
 =?utf-8?B?enZaSDdFeW9nRVN0aXFmYml0TTVaQVB4MFlNVG5sQTNNbEtpanhNQ2Y1RmJQ?=
 =?utf-8?B?L3hobFY5bW8rR1ArZlZZM1ZYVXVubC9LUm9Ebk0vV3VpcHdRQ0t4SFdSbXN5?=
 =?utf-8?B?blpCbGlQYTBWVG00SlJGVUd5V1hMclhRQkJQZlNYVC9OR0tVZDJJODlCa29T?=
 =?utf-8?B?akMwQW8xdDhOV1h0aGJLZVIybGdEaEpiNkpvcWw4VW5BTjlKdDBQaE9UbEpG?=
 =?utf-8?B?aEI5OWNOY0Y5b2VWL3pGZmdVa201SlZia1RtTzBFWmJqZWZYNHF4NkZlOGxh?=
 =?utf-8?B?YVFwN203cXY4NXJFUVpUcE44ajBOR0ZKcVk0NlNrUmhVa1JvN3dGWGhZSkli?=
 =?utf-8?B?eXlVWnhYNUlLUmNHOGFxRWR0Q1NSbWVuNjVUT1RPcmJkUk9yQ2dhVFhhSlM1?=
 =?utf-8?B?ZUdETkVDeHdZVGpuQTI5cFJOUVd3NnpydkkwNVgzczh3TGxJNVZZdlhKdURi?=
 =?utf-8?B?M3BpVkp4L2t1QkdjMzBnVGJtd040TW15K2FZbEoreXd0anU3b3VPR0ZRaFR6?=
 =?utf-8?B?ZkVTSG94MXNKZ2doUFgrRXZiRzRwK3FpSU9Lcm82ODh3M08yNmNuTlFmejVp?=
 =?utf-8?B?S2JIVjUyYStkY3ZmVW9kb3dmc0xjM2pSRnFqWnR1RU0rSExKMGt5YUhuNnVE?=
 =?utf-8?B?c3h1cHUzN3BzRVVSWGRCaHZsb29FMHZxSGRWRWdXRVNKRjUzOWRYYXFLQU1N?=
 =?utf-8?B?Vlh4UG4xNzJmaVNRMmQ5MGpmN3E5akZpcjFXcnc0d3VoVkhBKzRudk5KWE1C?=
 =?utf-8?B?aWNuelRzZ0szNUViU1BzeVJUeWYyZlpIUkJIZndlRm83TTdpdG1QeThxYkpD?=
 =?utf-8?B?dVZEQmlaR3R5ZEpQcGd0dzhQcVo3Q1lLc1BXV3o5NXI0QjB3M20xaHV0Rk5B?=
 =?utf-8?B?OEtLSmg3WUhhVTFzTms2NkdJTStCTUJlOWxtVFpFcStJQ3Y2UUJXMU1EVVRj?=
 =?utf-8?B?OTdwZTJOTTkyM2Z3M0pFd1VBSUtMQWZGSjdIU2ZCYmhBRFBzMm9qMzdVck5X?=
 =?utf-8?B?by90azhGMXRodFBON0dzYm1Kd3poWjJPZkEzdFpQV0NzWWduRTFndUpPd2xI?=
 =?utf-8?B?RG9TZlRrdUNiQUQ0akZYeW9aRlN3M2pVTGNSbEJvUk52ZDM4Y1R1NlhjMFNy?=
 =?utf-8?B?Q003RWdZNTdZUGRpQllpRldBTDhtM1hHNWpza3VXVlFuYWVMVkRQV0dKcXdo?=
 =?utf-8?B?QTFoM045a0RGTUgzV09lS01XV1RSS3ZmUjBzRHpDMG10Wm5NcGFXYU9Fa3ds?=
 =?utf-8?B?MnlxaFN1REhwV01IRHNiODlYOFR5YmxIUTRnanNTcGJQS3hBK3ZyUnoyMVM5?=
 =?utf-8?B?UTJZYW5vMllHMWtHZkpMOEU4U0hTSE1ZNTFGUm1hdEZHMGllR0JMdTdVQllm?=
 =?utf-8?B?KzhHeEdsR1NUb2ppQ0JhdTY3RW85cy9IVWZ2cUxUcktIdVY4cVZBVmVuTkVs?=
 =?utf-8?B?K1U4OFlxcXFIVHMzMHpqdzVNVnNtc3dNOTJoUEZHNWVzdTc1Wm1lRmRuam92?=
 =?utf-8?B?bktLWHhmM1hIY0JtRW91VVJhR2JRPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DT7ri9IJSoRszv0ibvFSOGZIvxPRBd8dwenzPthuKVmlDQ/Nysk0bgLK8J/hfyiFDibZxusmXlpNFEdIG9c5uxChY58dAGCFRFCc3rOr8BuRdXo4EUOhgaW/OcKdIkM5lqr/XAGq7/yQqE1o8DupuwdMiTnUzPYn09HC2RiKhL78TkNNKliRHcrfWmEWT4BKqmczKW622YJ6GZvksIqqjqGd15qrhbrajXh4cn3BdWrGlv7hZNS919PR6FVPiUiCyvqFZPaW+4zFx2p5v2y3WStEEzN0K8izcTvsqXOiHnpjFbEwcEYYjtHUQa4Zf3OYkG1CvCER77lD7mI/Q8e6ar428KeDvpbgJh66SERomYCN/QCJkbqV6pUj2IJXT0Oz0+x/c3AvsuuoC8BRvGBfWWXvEV9/8jw9XLSzoALvVaJMYxmc3IQzzllqAoQKy5xt
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 13:16:54.9812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 232cbf40-5070-4d69-978e-08de625d5670
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR18MB5626
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.20 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_DKIM_ALLOW(-0.20)[axiado.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krutikshah@axiado.com,m:pbolisetty@axiado.com,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:vmoravcevic@axiado.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vmoravcevic@axiado.com,openbmc@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-1312-lists,openbmc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_NA(0.00)[axiado.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vmoravcevic@axiado.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[axiado.com:+];
	NEURAL_HAM(-0.00)[-0.990];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[openbmc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[axiado.com:email,axiado.com:dkim,axiado.com:mid,axis.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 332F6D284B
X-Rspamd-Action: no action

Add the MAINTAINERS entries for the Axiado USB Device Controller.

Co-developed-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Krutik Shah <krutikshah@axiado.com>
Co-developed-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Vladimir Moravcevic <vmoravcevic@axiado.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 67db88b04537..e63b6b308a3f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4234,6 +4234,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/axentia,*
 F:	sound/soc/atmel/tse850-pcm5142.c
 
+AXIADO USB UDC DRIVER
+M:	Krutik Shah <krutikshah@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+M:	Vladimir Moravcevic <vmoravcevic@axiado.com>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
+F:	drivers/usb/gadget/udc/crg_udc.c
+F:	drivers/usb/gadget/udc/crg_udc.h
+
 AXIS ARTPEC ARM64 SoC SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
 M:	Lars Persson <lars.persson@axis.com>

-- 
2.34.1


