Return-Path: <openbmc+bounces-1141-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D84ED0CA09
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 01:31:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dp01L0tdhz2yQH;
	Sat, 10 Jan 2026 11:31:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.201.124 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767938620;
	cv=pass; b=I68z0KGURbsZWR+UWhrDWo5okIayCuDTOZpgNbwPJfJKo97kg0xViuS/G7Kj+9kps/OO4+Q488hUdLKHuS5nVVV15UDTaaGBbaXZL6YbHGeux6xOxolsvo7JUvGujjC6X2VoCWxQQW/ZamsONaMHLtKhz/7CQuvFI+ltwF5FLgbRsk7hbAUuTIyG8g0e3luXx8M8ya9jFXVB/ixTpxgFTbj4nzK22d6aVGDTNGXcHcxfI2hHmFINPMsZ7JTq36Vv6/WDReiA5c/n8vn2K1HrhMRJRauq8hAZ/Vp6HReE+wWMuYN0IVLNdEMxGWeuVgON7Yu1VdvKE+sHRzlbBEHG4w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767938620; c=relaxed/relaxed;
	bh=XaY0MPFvkcjhv9RFBR8WN5+4lBOHdRw56Bg5j/ffTIM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type; b=IshYn5JBOah+3SPOaHlYbZpI4U9mzJ+LD6i8uyksoqjjnVqqrqah51pZb5pyXRRulgJZKaV+S3M35vWEch7A3ab4rO7sVvRWqgkxagdI7FIlA/KDn3y5WGQ58c7L9NhFCtnqmTZdbFYFLokTgec0UGAYdUX9HFpxSrpotHZ2zLXwoxgfQbTqSXwnxkA5JBT0LWB+tw5LQcAd433vV1XtDt4o3mKZG0P+VPOX59sqe3hGg047+KcIFuHb/7wWvM+DNK5rdUNPw3Ozutzbi7mdXZac9QOQlwnBS+YEo8lLKB9HmNTFqZOK5onkFAwME8L/uQr+4edc9LO5x5+htmshcA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=WUzYenti; dkim-atps=neutral; spf=pass (client-ip=40.107.201.124; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=WUzYenti;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=40.107.201.124; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11023124.outbound.protection.outlook.com [40.107.201.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnWRb197Jz2xGF
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 17:03:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhINQ8s9Id/0XexTCWzuvzwpNs6CifQfe2LsvKCzFCZjaEfQjqJhguIwGzifDEFsmVlJBLUWCargG19EmnpO/UA2S24JbIX47d+t3Q61HurzSryFxW36w07eREQH11p6+TDxFY+aemZGS+MRnoiSJO7RfSKI/vncJ05G7ZK5C945gxPStpi2nVCh4fVJhGU9+iiPD0YpFXGna80Th5j6VyMMMc8/OXYQIC1FzyZ1v9jnqW8Y1Y8J70Ni5tvuCFxG6hNr0yNe3fXp2RssgICurQa9+Fkyc/uiJQKcX+cmYcTE+jqGJGgAZ3vT96xiOzGs72r2Ie8771VSllQltlOs0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaY0MPFvkcjhv9RFBR8WN5+4lBOHdRw56Bg5j/ffTIM=;
 b=g0cueAMNTcMfcdaFshGDLAv8baWPnNCp4Siig40e5j7Fq4GL8+7UG9Db2JsufIi7wOuyOiCtLPNo+wFuOBNS4Ya68REwjfJ9wXSgeFtbId7Hs9SNb+qhH0R5ptN7GYaHsEQppVKRhQxTH5z2qitckiC+jefzXTwWrGYRIuU+qpYuLywLRqu/u6UzMFl6Q4WshOb3f8tFXxWgFKFAu5iUlCX3qzUy7CVT/X/4P2AkSiTXIIb81xx0muHw2N7BCzYDVAm/+JyusZe1XAdUS+ymQVvP9rvnd8MFeLpgD69Ea9RrZCx6g++vutrqey8+I44IUU/0N+iD35xxPWfGbp7UPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaY0MPFvkcjhv9RFBR8WN5+4lBOHdRw56Bg5j/ffTIM=;
 b=WUzYentipI5WGCo4hvDjbSNPeiBPOPUIZ1wFFmCBENSguY+1Ppj4yTj89JlpxaVUsYk8Q0gt73pqjMc0/WXQwTbxnmyXYXO5FfB+P6YR9jFhJawoYzcWDkZJkGz4Iw0fPJQjVyJiwACWvSOVGrfdGqloudhZW/B5Nyfc07Q4HKe8Z9/CTCs9bwVxXxHwfl2l12n1Un7kkKx8h3Njb+t3AisVp1/vy2aqhnM0UIp8kUcM6JcLzc4YSF0TdGZPf7EmqkeT67ysQGdag7ypixBc5yV4W/if7MYE5wDnnDkXhygeDm36BLLqZU3xhKAy9edVBsNWg6ynvQgr49WVUY2kbQ==
Received: from BN9PR03CA0516.namprd03.prod.outlook.com (2603:10b6:408:131::11)
 by PH0PR18MB3797.namprd18.prod.outlook.com (2603:10b6:510:2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 06:02:56 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::f4) by BN9PR03CA0516.outlook.office365.com
 (2603:10b6:408:131::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 06:02:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=axiado.com;
Received: from axiado.com (4.227.125.105) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Fri, 9 Jan 2026 06:02:55 +0000
From: Kuan-Jui Chiu <kchiu@axiado.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [PATCH linux dev-6.12 v2 0/6] Add device tree for Axiado AX3000 EVK
Date: Thu,  8 Jan 2026 22:02:47 -0800
Message-Id: <20260109060254.1575868-1-kchiu@axiado.com>
X-Mailer: git-send-email 2.34.1
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
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|PH0PR18MB3797:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9dd2766f-3628-4e27-9a8f-08de4f44bbb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+2X8WOGFO67WFJpWBQudCFotu/zd6udpBfF4Q7ny23UvlSIHcWMPIIE2rTRQ?=
 =?us-ascii?Q?X+i0C45LmUl9zVQQ54mb9V6tJ+6fx4purp4uGJ/7cXzeUjwFx4UXm90zOZL5?=
 =?us-ascii?Q?uukWIfjbSaoBfK+mfC0Xucbgw+84+88wNTA0ypE5Tn9VAtTOHlx8vp6iYKt3?=
 =?us-ascii?Q?+EmcMwhGc+eyNnTud/IG3muFcDX2Rendpv4I59cuBAKvbXaSNEkWvm76mbce?=
 =?us-ascii?Q?KHs9CeicS00phN+T14/MS9CkW9p8gT6NGlspl/MTd+wSZWdZ5mXDaEzo1+XZ?=
 =?us-ascii?Q?UGNlE2hCytXKlfu0TuXCTF94hZk9QPxNdMaLKCY3x8sfuzACO8bcBwjoArDH?=
 =?us-ascii?Q?4xI2PIBLDX3Mlh3iNFox/wIb4AjxyBEEebtTXnbfnPCv2PpWCUJxyA2ug+GU?=
 =?us-ascii?Q?0Y3gMXu/TXn+MyLoG8EAB/ONN5Sg8rYsAAZ8FkEN1+aLgsDukNwm37dVtNwU?=
 =?us-ascii?Q?/53DR+6mkYqR2TkmcN6auuQG0C5NNrYl2Iyao1U5m7UOmhoGPm17/z4zMRU+?=
 =?us-ascii?Q?VdmKDhi17uKOrM3IhBl9cFUa9AcsQv6UGjhtVyF37stsjucXFEOiWOodhjaC?=
 =?us-ascii?Q?TTBPm1NaCH51oG3ZDvn4LHAdkjwNdY36kLXO+fxu0FUdelhwN3kZBByoD3Nw?=
 =?us-ascii?Q?nmyuB76QLyb4OGuwEilYFV9EK8sN9YsEUG81PiNqxgQFEhX1kDDK+1R3AnaI?=
 =?us-ascii?Q?th6hdN/36dqhmadd8gZ0eD64tOmkHAe5CR6pWoN8L8d334KWMFOON9QxZp83?=
 =?us-ascii?Q?PsXA4OjebRXO9ZrvC6hrCOMLrvkWYiTjS37kxKQ/eaPv2Z7OEyFWm9hnaBlJ?=
 =?us-ascii?Q?A6j4E/BaYWZzZ+HVL/ijWls90P50RwObR10e+KifW/8tCWdTduEICeFLvqLE?=
 =?us-ascii?Q?p8yDqvL48me92RVnTfoKD7JcBA34C5X1BG0eMSDsRUl8ENF/AVCSXIVl07Gy?=
 =?us-ascii?Q?iLxRvKFZtzdXuUqvRfBDyx1etWF0E9IY8SMoFdETLm7917bsN2sdXCZf8IND?=
 =?us-ascii?Q?yS/ieMjVmkTipGe1ro2X13jRIL2P8qCQ50fCXGLAC4qIphdJzmt4fk+pkq9p?=
 =?us-ascii?Q?98s+XsS1sWYxyheJBDlVBzljqbSMSxl1ZR7Pq9X4K0qGitAOgNNllFcn8Ufk?=
 =?us-ascii?Q?glYn8/h+uIb9hEtOlJzSTfCz496+Lyf56cmRT119oDuPhsnCXLa6R9xas5c+?=
 =?us-ascii?Q?wbFYwQdclEhThsZ0GGfUR5baeisUfJZXjGfCAS/tdZEN+toNa0E75w0uzmmf?=
 =?us-ascii?Q?Q3i1OCFKrw8Fz0N1p5j1sYuu2TfXrG6sTJix0WhB8fY48VuhC0G6v3ceNLpX?=
 =?us-ascii?Q?09yN9FVBuCHorX6XIK0OJhJyW9fiIo/Y6/oRXcGtsBwxGTwz9q4VclsQ1EGO?=
 =?us-ascii?Q?PFfRzedGarj0ckocHDWK5pmZyC/kNSXYwYSmGE2tzIWnsuwAxv17slFUfn52?=
 =?us-ascii?Q?agyCIBncY+8vJBiRvYP/akoshyKDlirLwwJNpiP4d4tghBge8CUKj+nnsbZ8?=
 =?us-ascii?Q?ciEvY2AHF9Pi8EUJPJQPrCOwDjzUO446i92VFqgs72RV3BbiD/2J6Us4jze/?=
 =?us-ascii?Q?O9VrbIxXOfSyxq4sxus=3D?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 06:02:55.5366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd2766f-3628-4e27-9a8f-08de4f44bbb1
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB3797
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This pacth series adds device tree for Axiado AX3000 Evaluation Kit
This device tree includes necessary device nodes for CPU, Clock,
Interrupt, GPIO, I3C, UART and Timer
The patch adds AX3000 into Cadence variant for device tree binding

Changes since v1:
 - Add cover letter for patch series
 - Add upstream commit info in patches

Harshit Shah (6):
  dt-bindings: gpio: cdns: convert to YAML
  dt-bindings: gpio: cdns: add Axiado AX3000 GPIO variant
  dt-bindings: serial: cdns: add Axiado AX3000 UART controller
  dt-bindings: i3c: cdns: add Axiado AX3000 I3C controller
  arm64: dts: axiado: Add initial support for AX3000 SoC and eval board
  arm64: dts: axiado: Add missing UART aliases

 .../devicetree/bindings/gpio/cdns,gpio.txt    |  43 --
 .../devicetree/bindings/gpio/cdns,gpio.yaml   |  84 +++
 .../bindings/i3c/cdns,i3c-master.yaml         |   7 +-
 .../devicetree/bindings/serial/cdns,uart.yaml |   7 +-
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/axiado/Makefile           |   2 +
 arch/arm64/boot/dts/axiado/ax3000-evk.dts     |  82 +++
 arch/arm64/boot/dts/axiado/ax3000.dtsi        | 520 ++++++++++++++++++
 8 files changed, 699 insertions(+), 47 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/cdns,gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
 create mode 100644 arch/arm64/boot/dts/axiado/Makefile
 create mode 100644 arch/arm64/boot/dts/axiado/ax3000-evk.dts
 create mode 100644 arch/arm64/boot/dts/axiado/ax3000.dtsi

-- 
2.34.1


