Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4576982B92A
	for <lists+openbmc@lfdr.de>; Fri, 12 Jan 2024 02:37:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=OYxkPkm+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TB40y5GyMz3cYg
	for <lists+openbmc@lfdr.de>; Fri, 12 Jan 2024 12:37:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=OYxkPkm+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::62a; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TB40N5HJzz2yN3
	for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2024 12:37:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDw9pDAgQDRAbvHKBi3JtkCXulCWTt6auCSphZ++eJbQF5HOT88CrNzcQr7cryleulFoMNuO3PJXeICX3xFziv17jyXcybXpQDuQctBiyADUAOftfg7GSSuWAFR82EluQjyToVwjGwKK6tzQaCi2iU4cSRHVMjhdYHX/AWHTgAdKEDILsqAwblnvCUyuS3A3TAEMW28qe1WNaCUHgwCLvpE5Omhw0oCzC0BL5aZ73B8gLLQbSuZ4lde6EcHOmm/sEhW39Si12Rz5tg3mzlWFLMuI/MExFB3zkcIkWc/s32X5YJVIcqZ42/kwRQqQR019tatlKYSF6zajyp+b956R0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bORQcPCl6kkeb0sQsIMU1n7Bi1DxrRs/brMlo763yhU=;
 b=V6ZMocXazWUVoaCwcHrgiPtLzXs5tDe6Xh+9nNXPCjj+tkmisesy4EWUNM9VqdpwrNZzPhAhURIZwp9dh0elmT7hpc+ZeOXNl4SA3qpL9wUC/68osw44cxGARnY8GYMM2nvpSoScncBaqnjBXlv2gHjh2QtTfx8pWR3f15Ouesmu9LWXrcDE5Dqn7buQEyfeJzsioylag3KYbzYjDY01ybDa2s44Vy73+PRHPwGSBDRzbKVKbMveWIxm+da1Db8xyX7U4TyZmI9I3Scth2+w8NhoWL/1bmK68yigkujVB3fqBxSi3YAMHnvFeKLkL19+AOUuy6M0X5tip4QSzUXPeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bORQcPCl6kkeb0sQsIMU1n7Bi1DxrRs/brMlo763yhU=;
 b=OYxkPkm+GR8letWg8lPD7WGRPs7p7grkzlS2kPR/V9xozQPjOROkrCnS2vC341GfOvOzaXLRHicLIyIcR84ABzeA35cSYC3cUtHTEdnu8P5ca7IzktyIA57fW5nqF57J54iPwO9Yw89KDcsvhZGEJJO1/m6ybpmXKvmLbskPIQFBRuVe5ep19N/oqaZazV76+HY/sdb7ul3p7DgpBebYirr7xI7m+E8e61h/5xokWsZGBDn/sTD/tSh6I6irMnTOdGo0ioX1JyI2M5bZJCEDyXuCqtfMKc0hdAMZV0zEBCc69RZSPlblK+yN1S8N3VlhUVNm3g2lNYpZIuTErlBong==
Received: from SI2PR04CA0003.apcprd04.prod.outlook.com (2603:1096:4:197::23)
 by PSAPR04MB4136.apcprd04.prod.outlook.com (2603:1096:301:32::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 01:36:57 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:4:197:cafe::4) by SI2PR04CA0003.outlook.office365.com
 (2603:1096:4:197::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21 via Frontend
 Transport; Fri, 12 Jan 2024 01:36:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 01:36:56
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v1 0/2] dts: nuvoton: Add initial yosemitev4 device
Date: Fri, 12 Jan 2024 09:36:50 +0800
Message-Id: <20240112013654.1424451-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|PSAPR04MB4136:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b13b6fe0-2cf4-4f9f-6620-08dc130ef671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	CLSfvQRELyZyBoFUhbJR/h6JQGG+PNBBtsQxQ4aHVGn7lgTIr0WrG/P7kyPGitMQE3FoVN1OQJtryDsCKiRFMcWGPGhPCcyfoRL1+sW8RUhNR6AVjRoF90OQIHJrU6LIrIsV/HsKclNah/KPQ9WRFRWu9QY5t5l5yta+lz0Q7Bz+HQGyLAEGGKfnat5ZFtrdGWuoudeAPliEenUyaVcML8SxVngwLQ9WHur4JD4KC0CHQ13AJVKLQFFvXve1crZHW5ur8sYbOPvbjo00tQNteP+Luw9tEBretwKVEUjWMva5ig+Cvz6GACQEZqPVIPFQsPhCuZ+ULkzHzHHYKOgGtI5PL1IXvBUstgjtsS6jISeWi0r/KiW9dOrI6aIISc0RZKkWSOW6Yol+3dk7PwSBTZDd5VWXlWcrzO8SxJv1q1ZASkVBSedaWSZpn7WCt9M0x4T/TE9eVQh/kDFDEzTfWUDNFz5jOvjf3wngJSYjhgbTvbGZ+mWMj+ZuM9rqnhI947LmiFBnRN5Yq1phsw3V7/9q0P4gVrY+vV9PuTp9Cee59jPAqJv3DrBE83JMKzxYA8rJKOwTP1YFy9TQP9ZPrNOtdoDN3He0l2TvFevagn6WBftKCmbJ2SA6RNr/7LDt/vvKE7urXqhwoOBOuch0iHALG+ywE6OM7FlI96ON7OREBTx+BJjKvxQJc3Tji3Ea7xsonKzzDcW+rjf/NSqiKw==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(82310400011)(451199024)(46966006)(36840700001)(9316004)(26005)(1076003)(6506007)(956004)(6512007)(7416002)(2616005)(336012)(41300700001)(86362001)(54906003)(4744005)(4326008)(36736006)(8936002)(8676002)(5660300002)(2906002)(316002)(36756003)(70206006)(70586007)(6916009)(6486002)(478600001)(6666004)(81166007)(40480700001)(356005)(82740400003)(36860700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 01:36:56.2208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b13b6fe0-2cf4-4f9f-6620-08dc130ef671
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR04MB4136
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Tomer Maimon <tmaimon77@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-kernel@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

v1 - Add initial yosemitev4 device for Nuvoton chip

Delphine CC Chiu (2):
  dt-bindings: arm: nuvoton: add Facebook Yosemite 4 board
  ARM64: dts: nuvoton: Add initial yosemitev4 device tree

 .../bindings/arm/nuvoton/nuvoton,npcm.yaml    |    1 +
 arch/arm64/boot/dts/nuvoton/Makefile          |    1 +
 .../dts/nuvoton/nuvoton-npcm845-yosemite4.dts | 1493 +++++++++++++++++
 3 files changed, 1495 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-yosemite4.dts

-- 
2.25.1

