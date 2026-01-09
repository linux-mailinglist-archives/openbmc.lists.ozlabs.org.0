Return-Path: <openbmc+bounces-1135-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B04B0D0C9F7
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 01:29:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnzyX5qJSz2yVB;
	Sat, 10 Jan 2026 11:28:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.201.120 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767950832;
	cv=pass; b=DtmkaYKn81uhzXVNxZdpL/97V7ODJJLIvP86lYW9KruGygJT0GIpl54o5gj2c+Pyqbep6ZH8rgzDXX9OVQEc7FPbhblSCnp/H0fO7ncOAZ51P9Nl6UjC42oHFB8kLga+K7e96RflNGWrX6rNlq/PZsRnEb6VFFeI4O4jm8YqJL9mvGcP5PUEhnTmzrkS4i4DCWy1DXlUVI2H0zIH7r0iuQDx5dONs/FQUIw/60xGa2oIdjQz6tPTphp6IsvCFKQ3R9yOJTP/VvMXlstzolJd58sthIsb2QGwNHTtunMDiVFw59BnE3zZUeYu+QyK4Hg36tf7D3u/Q7ZR86xucFC28Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767950832; c=relaxed/relaxed;
	bh=oz/0FWo9lxgS4PH1tNfTL/TbcWoWPEmEbFfHZnBInC0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RlvVhLY/IG3+k/PdUXfCoa6MnpXXZmwGZ9yBqDllyUo1DyR6FgfnxVHG108++lzxZRaThbvFvgAGkDI2DDBcX1YghmIACtLXbW7c1axGYCPGAvWcSvuDDCkdHWObp+x2Mlo9HRR8+3iXVAdmZ5TAjuZektUky5r0SbPkYoM9ArFBr6puXQGEEZs8ToQzmQLBFGUjkxG9uq2ImrvssoQC5zL8e4uIXsFRDq9fqWYwFgbQAavDI2eB3X86kFHXdgyZO0K4QAA3isavONj7cnkqJyTKyIbTrzWJfoy8UnNCmawLoLeJKaqO0FtgDZctxC6Ji+r1vUsWOAF6q3dZkSyq5A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=OnJblCx4; dkim-atps=neutral; spf=pass (client-ip=40.107.201.120; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=syang@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=OnJblCx4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=40.107.201.120; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=syang@axiado.com; receiver=lists.ozlabs.org)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11023120.outbound.protection.outlook.com [40.107.201.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnbyQ5B3Wz2xRv
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 20:27:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GctEpT+eYvO5/ECAE3o7Bv+mewODPb9dpWwNvbH6iNWH5r15tctouJ1deg3Cm0yJOYKO3Z6jpcBa40+DBfsEJJL2CtunSE2iOKeEzUQVzCUlcuXqGP4fcZUFE0F6+f3XpYAmTcq7v7LbKkRNTlDvxIYaO+lwYvQyhRZH+83Rz0VdcjJbU8sd5FRxnWIHsbyjd9/YTUXG+F25QZ5XuGQqJUB3PO0Jn0lkGxxJsSjBi+rvhEJZQEF1LWNwHytA0ToLDN0w8BtQDAouK90LLEVo5W19RWb346y3fNBuWjRJT/4eJIynsvluEbgL6yoCdB+nuxq01e+hj5AHBgtF2kbi4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oz/0FWo9lxgS4PH1tNfTL/TbcWoWPEmEbFfHZnBInC0=;
 b=GKLLLAYiIVv0cIHYLGlaNvl1qyU4pW3CJl6G/0vXk8+LITs0fH7DwXhvn3hd7VeKBi4vcpE6FzPGDNjJmUyaYRnns3GEHNzC4hsXz2OU4wHLX2rurfUZDaruO/2ld3NNzWcrdkymmNKLD4NfT9DGn49umsA39MoPMARqY3a0AiL79flQufzAfjltLYfKeXEzm0AYVFFpNMvpI1o4RRg3y5JuKluGn+Bj+rRgoceFlgOjk0K5bswNY6yRQukJ5TYw9YSH3iA+l7BR9ZTnAuN7vZnwXEQOKApqgF57VYjBPF8vE8956GUS9BkqOFI8f1KxSNcr+YBAT8boVy5fdsymTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oz/0FWo9lxgS4PH1tNfTL/TbcWoWPEmEbFfHZnBInC0=;
 b=OnJblCx4yh7Sm4dKLvAzGDO09xEjdYt701/zFhw4XAnEhxJTi5lBnCGrbKIzFoRfugFY+CXicP/hb78/uWuYPgLuh9MwwJd/dy1SSvkwP9AeeC0nkX9qqGkcbhVOdP8oFtm8iWElb7iWT9SkrSZ5M1XEbXSsqwVsyo8WBoSGRpLiONLcK5xMY1Cy22dMoN6WxL7AEAwFUDGx6MjttLByUEwEu44aqcfmS8HfWMz19WsjjD6QY/r8rSpWM//X7cv2GcP6frebFPMnNoRZrMa+jNh1YiqqdAysrmUXt8r9yECJXojDHJg2OMWAxfI4IR2xIozjy8Z91vMJAJRn1kEBlA==
Received: from CH0PR03CA0406.namprd03.prod.outlook.com (2603:10b6:610:11b::14)
 by BY3PR18MB4785.namprd18.prod.outlook.com (2603:10b6:a03:3cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 09:26:27 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::55) by CH0PR03CA0406.outlook.office365.com
 (2603:10b6:610:11b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 09:26:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=[127.0.0.1];
Received: from [127.0.0.1] (4.227.125.105) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Fri, 9 Jan 2026 09:26:26 +0000
From: Swark Yang <syang@axiado.com>
Subject: [PATCH v2 0/2] gpio: cadence: Add Axiado AX3000 support and edge
 interrupts
Date: Fri, 09 Jan 2026 01:26:05 -0800
Message-Id: <20260109-axiado-ax3000-cadence-gpio-support-v2-0-fc1e28edf68a@axiado.com>
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
X-B4-Tracking: v=1; b=H4sIAK3JYGkC/42NQQ6CMBBFr0Jm7Zi2goIr72FYlHaAWUibFhsM4
 e5W9ACuft6fzPsrRApMEa7FCoESR3ZTBnUowIx6GgjZZgYlVCWVrFAvrK3LcRJCoNGWJkM4eHY
 Yn967MOOlKpvOlGfqyxqyyAfqedlH7m3mkePswmvfTPLT/vRK/aNPEvOlob4mYUVn6PZ9Ohr3g
 HbbtjfgbiUM1QAAAA==
X-Change-ID: 20251215-axiado-ax3000-cadence-gpio-support-7549bc46ef48
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Swark Yang <syang@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2017; i=syang@axiado.com;
 h=from:subject:message-id; bh=zzpsSY+0JRXzBh/rngHXCGyyMo6UCRyfyhn4qMX0VGE=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhsyEk1u5PPxefOWfqcqYmLivW8Yiae6lxGXVpSdLfj9ds
 Cv5aFhGRykLgxgHg6yYIstXnW/5J3O173XuXVkKM4eVCWQIAxenAEzkjCLD/+iND1YtXD69SuWV
 wrI1b80Nn3VnB9+sU42wP2D4Qn+mRwcjwwYp9nsThaJ/C331fBJf26gYzjm1pnyW2x4dkbPKYr+
 0+AE=
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|BY3PR18MB4785:EE_
X-MS-Office365-Filtering-Correlation-Id: 73e2d076-1d1e-45c8-4cf6-08de4f612a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T25FdnZ3Q0JkaVRTbWxwMVA5WVlQaXExSEZFLzU4UmZHcHN3K1RxSmx4UWtl?=
 =?utf-8?B?TnVMeTdkUk9SeFFTcE0xYitVQTEzSzJSaGZMZnB1UUxuM0JDdHZybVd4L2Iy?=
 =?utf-8?B?OGVnc0NLQmplOFVnWlNmRmxHeDlBbmtCcW1XeG4rc3JmUmZBckZzSnlSaEJ2?=
 =?utf-8?B?K2NaS2tLUmFqd1dtL1I1dmZQY3VXWERQUmNiMFBJTnFML2ZqMkY5ZHZqaG5r?=
 =?utf-8?B?QjBmNUdWOUpTQVg4T3BGbVFoZ293bUVuMnJzTWtrdlFaOGNKQVZyK0piSHlD?=
 =?utf-8?B?OU5pNUptMFIvaHBmZTFFVDlRZDcxanl4QVhXU3BLS1plRHJUWkowK3V6SWhj?=
 =?utf-8?B?cnA4TkJTb1U0Tk4wYW5WeUhBSERKbCtJbVlnd3IrajB0TnFZekc5R3lzSkFm?=
 =?utf-8?B?dXR6VTZFZUJNbHpDTU0yRkVJN29hT3BBb3ZMNloycWtWZExNd0NKWEkrREhv?=
 =?utf-8?B?RlM5dyt3SW1McUh3N2Q5ZFgvSmtLdUxWUit6bDIzcEFuTGx0dERKVjVvT0xT?=
 =?utf-8?B?OThNSmNRblRQTThKNFozVnpSVVdObXU1RVpBR2JIUG1YTHpNZm92TXFIK0pN?=
 =?utf-8?B?VFRwVm90U2RhTXIyS3ExVXlCRGhkckhPd3hMV1J6cEZTUXJaN0RSLzZPM1hQ?=
 =?utf-8?B?a21HYzdUMG5LTnVYNUFCMTk3QUxidDBaSmE4ODRwTHRYZU1Qb2RhME91a2hG?=
 =?utf-8?B?SndKVXFlRlhnczlaY1lZMkRQTGdUanV3YXhPU3lQeGR2ZmdVVEhHZ0lUYnF5?=
 =?utf-8?B?TDFwVzZCUVNLWk9CS1RqSEJxZzd6d3YzWkRRM1U3K2NQSTU0em5la1Q0b3pM?=
 =?utf-8?B?UXVVQjIvQmhneUw1ZzdRY3hCN2Q2WEJEWFZucldFbzB4STVseG9rdms0RGRM?=
 =?utf-8?B?VFIyWnczT3Q3TjZ5QjdOQWh0Y2ZIUzRyTEJUeERMa21YZnJ3SFNHR2R6TC9j?=
 =?utf-8?B?SzQ1akpuaEZ0TlkzdG1nZzNoc05ta2h4YmhlbHdzK3Jha2FIT2g4R2FTOEIy?=
 =?utf-8?B?N2dOblQ4VFh3ZVFGbitFcENrbFdFSHp5bnpWK0hJTzdheSs5amYzZW1rWmNQ?=
 =?utf-8?B?VGxEZ3ZoaUZYTGdld3NPSldsMmVOOGd0cVQwbHo0cmN3SkJZWFdHVFlweUNl?=
 =?utf-8?B?eUtVRVh4Q1RrMTlLY0phalMwMXVid0dKT2JoVjdIZHNoUW5sdW9sTEhQQ0tO?=
 =?utf-8?B?bEVTOHplRWpYdHVCcU5ZZWdtUDN4VldsYTdndHNvcHNiMFhpY2k0RkNsNHAz?=
 =?utf-8?B?Y044T0R6RmwyRUxXMDgwN1dDTFhNNi93Q0k4Q2kxeFprcmlRTEZNSlpxclVZ?=
 =?utf-8?B?cWtqMURRY1RiTDVHL2Q5a0U3WnNZNkJ3U29JZHRTTHNRZHNlZ0RLMGxBZDRJ?=
 =?utf-8?B?V211c0N1NWNlT3R5UGo2VVlYSmxJclBrKzZPYU9TTEp2bUdCNFpOcDZQdWNM?=
 =?utf-8?B?MkdCbytlZHRxS0dGdTVTcEFQd2NhL1JGbTY5S2w5a0IvR1JJUTA5V29JSUFX?=
 =?utf-8?B?aWpIUTdqd1crbG5JNXpVcjZUbzQxS2kzdVF0SWNlR3RRemdqajdnVzZobUVP?=
 =?utf-8?B?OGpzanpDMXRiN3F0YkREOHJWWkZWd2VnTUZwYVVJQk5sSkFCOTNLR0FLWE5Y?=
 =?utf-8?B?aVdGdFAyUWRkbEdEUjRkdmU0bitEby8xR1cwWG96NFVWYmZoTW1uY29FZUhK?=
 =?utf-8?B?VGVRT1dRTE9KalJjNU1IQUdqTXIzMkE3b2VMcGpNQ3JPV2YrdUVOVXRUb1RM?=
 =?utf-8?B?SzdzSGZkdWlBVE5QVGZQV2t6OG8zSmhJcm1wWFI0NmtmZzFYTW50WTdpMU9s?=
 =?utf-8?B?UjJEKy9jVGxaalNWbmlIaVYraitUWnI0NnRQZ2wrT3lScmlnVFJpV1ErQS85?=
 =?utf-8?B?dWh0RU9FT2xtWlo1TWVReUpCZWFacVNha2treFNIcDZERXlDNDZkRUZ2Zlkx?=
 =?utf-8?B?VkJVbDFYWnlFbFlXek1xVU0zK2RGL1ZxN3piRkJialVMQ215MG84a1ZTNHA4?=
 =?utf-8?B?MTl6aGFjQmE5dlZrVzk3M0RkSm9LdkVERE1Td01WcnRFdlJRYzBlWDVDK1hH?=
 =?utf-8?B?UG5IN0pxNXhjN3R3RGtJWmEzRGZzUlRTdTZidHk3SklvUzlQZkhWMXU2bXFY?=
 =?utf-8?Q?pV6E=3D?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:26:26.4308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e2d076-1d1e-45c8-4cf6-08de4f612a21
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR18MB4785
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patch series updates the gpio-cadence driver to support the Axiado
AX3000 platform and extends its interrupt capabilities.

On the Axiado AX3000 platform, pinmux and pin configuration (such as
direction and output enable) are configured by the hardware/firmware at
boot time before Linux boots. To support this architecture, this series
introduces a platform-specific quirk to skip default pin initialization
during the probe sequence, preserving the pre-boot configuration.

The series also enables support for edge-triggered interrupts (rising,
falling, and both edges). The Cadence IP6508 hardware supports these
modes via its IRQ registers, but they were previously unimplemented in
the driver.

Patch breakdown:
 - Patch 1 adds a quirk for the Axiado AX3000 platform
 - Patch 2 enables edge-triggered interrupt support

These patches are expected to go via the GPIO subsystem tree.

Feedback is welcome.

Signed-off-by: Swark Yang <syang@axiado.com>
---
Changes in v2:
- Patch 1: Refactored quirk handling to use "struct cdns_gpio_quirks" 
  and "device_get_match_data()" instead of bitmasks, as suggested by 
  Linus Walleij and Bartosz Golaszewski.
- Patch 1: Moved Copyright notice to the correct location.
- Patch 2: Added a comment table explaining the interrupt trigger 
  behavior, as suggested by Linus Walleij.
- Patch 2: Collected Reviewed-by tag from Linus Walleij.
- Link to v1: https://lore.kernel.org/r/20251222-axiado-ax3000-cadence-gpio-support-v1-0-c9ef8e0d0bce@axiado.com

---
Swark Yang (1):
      gpio: cadence: Add quirk for Axiado AX3000 platform

Tzu-Hao Wei (1):
      gpio: cadence: Add support for edge-triggered interrupts

 drivers/gpio/gpio-cadence.c | 76 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 61 insertions(+), 15 deletions(-)
---
base-commit: 4d70843ea1294cf8ff78492643c73ddbe4663aea
change-id: 20251215-axiado-ax3000-cadence-gpio-support-7549bc46ef48

Best regards,
-- 
Swark Yang <syang@axiado.com>


