Return-Path: <openbmc+bounces-1144-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4080D0CAEE
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 02:09:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dp0sv4HzVz2xWS;
	Sat, 10 Jan 2026 12:09:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.201.134 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767950834;
	cv=pass; b=oB3cGkTdP2Do3CU7RQ1rIpPJATeg+A0AOx9EfI5zqMsaZmiapLCklUOzfcJfPhzSszg35scGpj8CeiariUEp69z3mzWqw8j8YmtP1cSzRqNrJ0wPe1T0zWBKK88A3v0W45NH4E2F95iLM2XkNbFZ8sMXRW6iQ5C8A7EzwRcwTAkL8qyaEOB97VPWCQLu7HMh2FSrcXaKAzk/2AM4EcvHxt7p8QoTITQE38KLdTfT6LyQ65DAE/8Y2OOjej83f0lyTVUAecmXM5l627+F5y08Y7xueh16TQY0KjJKma/+hQtUasYigCyoySszWl9r5qYkBvP60D0FZYGlCEf38gcIdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767950834; c=relaxed/relaxed;
	bh=7HA2sFoBNP6wVN+uTvij3TArnSAMx7o7u+fZs5fLfvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OI117julerkRCtWnfWrt0XRdo3pMoiuFS8gMbU7Lgk2Sv99kJH4CUxA01fgSYhr2cT1XKfSGNQpatlWf9JupqmN3ggFRT899hgUnIUZmQUyYlnTnjXKiq83xZxx3oGFWovoNqQ6UOHH+dZY5PyyeQ774mpSJ/S02q1EYmxFVsq2qup4b0arbq3tri+E+DFGyLMT6wWMuaO93vqH9tGdZfotaLzzvISGAkPDle46obZ8fCxkz5Ysx4q/z88tSSNe0GxdMI1Vi+K3mxs5aE5AFfuRoZiviYzNxgQ32HKbdK+pz3hixlFFr25i8cu4Bs2hbP1/Q6EZTfWabDxVDIBuGIg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=ekCmx+mm; dkim-atps=neutral; spf=pass (client-ip=52.101.201.134; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=syang@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=ekCmx+mm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=52.101.201.134; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=syang@axiado.com; receiver=lists.ozlabs.org)
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11020134.outbound.protection.outlook.com [52.101.201.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnbyT6Cxzz2xSN
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 20:27:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjDGzZhffvrRPp0bsYNhZ43znFA2wVqPl//7by7IhKlwUb3hDyXKtp/hWd2+F0lrAl/A1XR0Zfw0gC7IjuBcdwdF1j4dPu9h5UbUatAMB81/G9wQ36/a1noyQs4zQnUGSO2072kJsPO5W82RgPtulvaUtTfyY68Bxg7F2he02u1s8yNgRzqQYB3AzlLm7xkCetUf6fkyzvV2l3IGeiDbMn/4sJhx3satszR/Qu04r0QUXaWMcTOFxmGgFZ4PWxnF5HmfYvxEi2bofwx6CvGL4fFH+4TGBe3EDZf6ZHaYpyM1BoTYd+NdrxFiWeZi13Ygygg490sJgpJ+1bVrHT1XOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HA2sFoBNP6wVN+uTvij3TArnSAMx7o7u+fZs5fLfvQ=;
 b=sIt1CKB6fQIUZ4GckhwRcLG9BNRp4gT3bVLHQea/+CecMuoMJOYnoURw4bCL7OVzbUqTaZ1GvBmtUm9btkCd0l5dsxCfbps1CTTvGXD2/a+YQu1zSYY1r3HJet5IDSuwxBwqI6DdIpEf5ANYUHTuWCxGl2sMwIgn0gRtsZWq2aVPHBiWR2jxkQqP8R8mIDfzYQa/iu82/n0lrbNDOEP9ICxXo0bpIKMFRioO+9Iijhj8y4caPYoXgiDpM1Fdh/UJ6t1AfQRQryJ4YOExy/Zfge/nB6n9dFOQgTFsKmQPdCmSFTX00KvYVduoPQl+/p2AsoTII7vM6lYVUgcfIQl6sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HA2sFoBNP6wVN+uTvij3TArnSAMx7o7u+fZs5fLfvQ=;
 b=ekCmx+mmPz6FXz5N2Oh/fVJel2CGNjvzwdJkQCdx946omEM7vCdJhcbFnoRXc4JKmjyYl+LoeA8weKYg7X3q8diZs000BEH3Y7T1kX6RlR32/RXIImqptCRoo/M8bkiga5tx4RJujknM7gWWa5Yi5xHCssSHmuS5nW/IcWu4Z4v0zsy92HhmrkiTaaDJs1QlHvhxIny3ZiDdmyQlk8FsbjjNvJzS/IUSsMP3egUIQ0fFIgR+80IzPmsCs1VdgUihEy8DmbXEzh1jFGuAO0JBujBqNBfGuGA5ZYqLn6WJD7F8XHfaEDfdQxB419VJMZaFMaWWKth+orWs2aLxe9B2fg==
Received: from CH0PR03CA0414.namprd03.prod.outlook.com (2603:10b6:610:11b::32)
 by PH7PR18MB5258.namprd18.prod.outlook.com (2603:10b6:510:246::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 09:26:30 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::76) by CH0PR03CA0414.outlook.office365.com
 (2603:10b6:610:11b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 09:26:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=[127.0.0.1];
Received: from [127.0.0.1] (4.227.125.105) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Fri, 9 Jan 2026 09:26:29 +0000
From: Swark Yang <syang@axiado.com>
Date: Fri, 09 Jan 2026 01:26:07 -0800
Subject: [PATCH v2 2/2] gpio: cadence: Add support for edge-triggered
 interrupts
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
Message-Id: <20260109-axiado-ax3000-cadence-gpio-support-v2-2-fc1e28edf68a@axiado.com>
References: <20260109-axiado-ax3000-cadence-gpio-support-v2-0-fc1e28edf68a@axiado.com>
In-Reply-To: <20260109-axiado-ax3000-cadence-gpio-support-v2-0-fc1e28edf68a@axiado.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Swark Yang <syang@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2589; i=syang@axiado.com;
 h=from:subject:message-id; bh=+Ei84sJkYh5IrNtOI64McozQSee+JmlnIaM3DQK3poY=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhsyEk4cOtEekLFp1IG1vUlWS35TfsXekbcvOfrma0Fjt1
 HhpyxL7jlIWBjEOBlkxRZavOt/yT+Zq3+vcu7IUZg4rE8gQBi5OAZhIdSwjwxpegbvSLW7BDzpu
 3JY/I3z23P9ZT8zClL1maHxX+rYijJPhn/Yzq6U7TtgudJz7qZulxXnbp3uGuufjl156XjrdWe7
 Se3YA
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|PH7PR18MB5258:EE_
X-MS-Office365-Filtering-Correlation-Id: d2268bc2-8653-48f5-f329-08de4f612c04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWN0YnVmTlJIeklYQU9pRHhxcFdHLzFOWFhieG9BOGpjbTRzZTQzYUoxMGxV?=
 =?utf-8?B?WWRmbE5XdW93MS9ic0N1Lzg5YnVJNEUreUNtV0Z6Q2JZVFovSmNqZkdubVQw?=
 =?utf-8?B?aERWRkxmLzMzbmtIUHM5bldnNzdSbm43RXNDL1NhOVJoQkFYaFJrNUlabXNY?=
 =?utf-8?B?cmFMVUhRZWRJTitESG9kNzhCSTJqb1pEV3VWcDVGR2ZsTEgvMCtMS3gybjVj?=
 =?utf-8?B?aDkyR3BmRmQ2QkgwNTB4SGhZT1N2V3VZRVFUQ2h1b0k2R1V5RktJY05YUExT?=
 =?utf-8?B?OEhIMGVJVXdHUnZDaEpKM3RBaUlMQzRPUGozVUxuUzQvUFJKbUF5azZpWjYz?=
 =?utf-8?B?TGVwUHNPZ28xSEUyd3Yram50Yml4eXNkTzJCTzBDZmlaV3ZqSExVOWJiaWVN?=
 =?utf-8?B?Vy9oampUYjJpMFBkb0JKZktvVExnTFMyT3FKOHdVOWMyUmxYcnFIREVYb3BY?=
 =?utf-8?B?QjgxdHd0RTgxM0ZQVzVpQ1Z6OG10QXBIbUN4N1FkeTV3SXk0NVJvUnhzc0xI?=
 =?utf-8?B?WVdOcEJFTXpuNkIrQ0x6OGx1ZlV2enM0OFprR3NJVndrN1JBbHJWelBwVUdp?=
 =?utf-8?B?OTdRSVFqZVFyeHBNeXRQYVVyUWg4UGR1cHEvRjF6TWR5QjJhdzJJNUFSUWVm?=
 =?utf-8?B?aVdhTlc0VGFiS2xEdEhXamNlSEZhTkxYellablpabHE0cUhTYnNLdlkvWUFq?=
 =?utf-8?B?b0dPSXBzVVJBUlZxa2I0TFdxbUNWTTBvVlpESEFzY0wxS25FRW1UZjRhUVFv?=
 =?utf-8?B?NUluWml2YmN5akVBS3c0aFJvTWVmbVMxNG15WFdxbUJPMUszVndGL0NxZzBq?=
 =?utf-8?B?TXYwUHdjWi9UWU9JTjVCV2hHOVJxQmZEb1NEVjZGTXhOdm8vbGlBSmFmSWkv?=
 =?utf-8?B?MjVkQ3ZkL1ZzS0VHTDlVWUoxM3cwNVArb0Q5WUVzdUpTd0w2M3I0Z3h5TlFY?=
 =?utf-8?B?YktydEJyWkpEYjB3SFlqdHpPY3BKS25Da0hpaWY0bkhzL3B0eHZUOUVqNXBj?=
 =?utf-8?B?dXRzVzlmMjNZM2dZT3g3NzVabU8wYjh6clJnVk43WFY1b3k5Wm1VTEhkcWRF?=
 =?utf-8?B?ejlMczMwTkZhUmJ5YzFveHppK3lPaC9xVWhoby9USHFzNGVlQ01KaDVYR2c2?=
 =?utf-8?B?NmwyMlBtZjh4UGJvSXM0MlZFam9tY2RrMk5QOC9Qa3VrbUhJVDA5dTB3MG94?=
 =?utf-8?B?WTJ6RWFLa0RJa1NzNDc0eXNlMXZwaGs4TnZyRVhQVm9XSVFRNWhMT3ozRW53?=
 =?utf-8?B?S0dGQ2tRTURLM04zNjIrR3pjKzRqZnVaOGIrRVpzcWhIcG9sTFY1SFJUejNJ?=
 =?utf-8?B?K3lyd0xXa01JNWtXK1g1WnBPQ3kwSG90TGJPVEE3WWFsNUozZFNxZWFUbVRo?=
 =?utf-8?B?bzBaWThlRmc3RUVod3pWTDQxbnZock1JazRZZkQvd2VYMFBKSnZmM0hhUDF0?=
 =?utf-8?B?RzFMcUlvVzZQZUdobWF6eVFhejNzRWdKNWVqNHN0dnRwWjkwYlB2UWFWdzU3?=
 =?utf-8?B?L3MzT3NQZ1pVS2RPUk5KYUFNSlZrWTB2V1ZNR29JKzFGLzI5TnlzbTNiRisr?=
 =?utf-8?B?Y0g3SCtSTlZpUVpFei8rMm9OT1Nna0FrWHpmTXN4cVRaMXpzMXJFNk92ZitT?=
 =?utf-8?B?SDgyY3daWnVXa0c2L3FFRXk3Mmk0YjA1V1JzeFd0VldrWFBPaWNjQXRBMWY0?=
 =?utf-8?B?djRPVnVaSnQwWEc1anNjS0tTNEhrZmY2dFVneHR5YXZCc0hSdFhQaHlxbVha?=
 =?utf-8?B?ZXhFUm5HajRtdlVuQmVqOUVWaTJUSVdOaVIyN1I1TmRvYnM2S2w0VFluSmNo?=
 =?utf-8?B?MnAyeUNOWno4dlRJalRFNUIzNHRucGNOZGFmTkRRbm05RzlxZkdmbi9DaS8v?=
 =?utf-8?B?TCs1WkcreFNYQll4OFlEZGtVTlFjZDFVRVRKbFBJNm5wRG5waFVpYW5WSWxu?=
 =?utf-8?B?T1BBQ2cvZEQ3eGtuYXFqNGxzbDgrWHJydGVYdU11b2ZUVTY5S3N5VEcwcG9x?=
 =?utf-8?B?R1BTbHdzVVY5WVRZWFhRVU5saWpPSHlNd1BKUDMvZXN2UUU3Y0RtY0QxUDBy?=
 =?utf-8?B?MWVmRFlLdlFTTGhneUkzM1ZoakhScWphN2lpZDJEVngwSzBsWUtMSVg4TmRx?=
 =?utf-8?Q?q3ok=3D?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:26:29.6179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2268bc2-8653-48f5-f329-08de4f612c04
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR18MB5258
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Tzu-Hao Wei <twei@axiado.com>

The Cadence GPIO controller (CDNS IP6508) supports edge-triggered
interrupts (rising, falling, and both) via IRQ_TYPE, IRQ_VALUE,
and IRQ_ANY_EDGE registers. This commit enables support for these
modes in cdns_gpio_irq_set_type().

Although the interrupt status register is cleared on read and lacks
per-pin acknowledgment, the driver already handles this safely by
reading the ISR once and dispatching all pending interrupts immediately.
This allows edge IRQs to be used reliably in controlled environments.

Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Swark Yang <syang@axiado.com>
---
 drivers/gpio/gpio-cadence.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index 85aef54d0aec..d7790fc35c22 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -98,6 +98,7 @@ static int cdns_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
 	u32 int_value;
 	u32 int_type;
+	u32 int_any;
 	u32 mask = BIT(d->hwirq);
 	int ret = 0;
 
@@ -105,24 +106,35 @@ static int cdns_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 	int_value = ioread32(cgpio->regs + CDNS_GPIO_IRQ_VALUE) & ~mask;
 	int_type = ioread32(cgpio->regs + CDNS_GPIO_IRQ_TYPE) & ~mask;
-
 	/*
-	 * The GPIO controller doesn't have an ACK register.
-	 * All interrupt statuses are cleared on a status register read.
-	 * Don't support edge interrupts for now.
+	 * Interrupt polarity and trigger behaviour is configured like this:
+	 *
+	 * (type, value)
+	 * (0, 0) = Falling edge triggered
+	 * (0, 1) = Rising edge triggered
+	 * (1, 0) = Low level triggered
+	 * (1, 1) = High level triggered
 	 */
+	int_any = ioread32(cgpio->regs + CDNS_GPIO_IRQ_ANY_EDGE) & ~mask;
 
 	if (type == IRQ_TYPE_LEVEL_HIGH) {
 		int_type |= mask;
 		int_value |= mask;
 	} else if (type == IRQ_TYPE_LEVEL_LOW) {
 		int_type |= mask;
+	} else if (type == IRQ_TYPE_EDGE_RISING) {
+		int_value |= mask;
+	} else if (type == IRQ_TYPE_EDGE_FALLING) {
+		/* edge trigger, int_value remains cleared for falling */
+	} else if (type == IRQ_TYPE_EDGE_BOTH) {
+		int_any |= mask;
 	} else {
 		return -EINVAL;
 	}
 
 	iowrite32(int_value, cgpio->regs + CDNS_GPIO_IRQ_VALUE);
 	iowrite32(int_type, cgpio->regs + CDNS_GPIO_IRQ_TYPE);
+	iowrite32(int_any, cgpio->regs + CDNS_GPIO_IRQ_ANY_EDGE);
 
 	return ret;
 }

-- 
2.34.1


