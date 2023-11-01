Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2B97DDF79
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:32:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=B5U4U93V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3Gy6zb5z3cWh
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:32:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=B5U4U93V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::62a; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3BF0mMQz3bTt
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPsbK4M/3YFucAxwVSQYTvMntoUGwRkQQ6kVJI38+WduBaStVzlcrk6Wmz8aAPlW7MVWiRAslZy8lAyXfJvUwyLV9R8/mxHOmiufnjDewFb4gVdAPD6KEWFBGAYAiDCRTLIAEb2H4cLR4oF0sQ2TDoP4NXHAzRLYIWAdzlkJ/ctsScxC8PQ0zZCkZIjtx/VjD9xC5ij8dwJvLUIUaQ2pR/78bEcn/KV92w9MxMbT7rBPf70GM8k/Kf9DUP3vOQEMgpblG8Llcg/QT5CRMBH/S55dg6oUL/8pbIaZ7P0941mX6yQX5wtG7JkWFg46hAg9sbSTVndtykU9x2n5jKW51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CFu7J2vn4crZN2tW9EnxPTYlVgdEGLYuqMfQDA+HPY=;
 b=IwLmOfTcfDPBlTJqZPkF5nfPFTgOro82ve368rFg1LJYlUyDWVHrwNrp0z+y8ErFy7eAogBgkH77izlUVnZGNgqVFElyWRThiB02GhrnAz8SkC13NJOYQIY+wrWY7NCEFXxPkPdHndNkIQyJ/UT253hNPwVuqVmPThDEqG3vC9+5W5Cjb3os6SpTGQvKMM+uAWb0EX9nYlZ6WzMZFi/6NKgxDhspN+vXjgf1kpR3QJlXM0CE18tfyckgbcVp9lF359jVakgix597BwyWugvXUMm+0xM+d0q6e5AKivmEQbhmLJrXZV8bt2sTlToBKpqYFQ+sX9LqJh0S1ZSvsFuXpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CFu7J2vn4crZN2tW9EnxPTYlVgdEGLYuqMfQDA+HPY=;
 b=B5U4U93VqD8Zae0TX6qCKEsMNCAT/oXBor/R6N1yTfeUAN7zWAB0kpDlGrkGhNZegcLzKxQKfJeRFGp3luoCu3s6W6dK06WaOCUxYDtoTiXyIgIHs2E/veCBughjUGe+bbaZJs2bkXUMQkFVTUxQ6lPNDFfHD5+t+LCoxIyvGmttWXbwAqx4S2RXx8NWDG8xCBOQgoJ6mo2GjAo8fODs+kG4DGxF/VY3K6J7vCUd1NGy0itGNPzT5qi8sngY6CtdiDSKI6YR4vL4XRGCJOoxsfS86KFqdA61SNvyXUR2HyMqqpN8QN5dmP5gJsIEc5QjL1F38SOLvOJ1hAy+eupkZA==
Received: from SG2PR04CA0181.apcprd04.prod.outlook.com (2603:1096:4:14::19) by
 KL1PR0401MB4274.apcprd04.prod.outlook.com (2603:1096:820:26::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.31; Wed, 1 Nov
 2023 10:28:18 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::ef) by SG2PR04CA0181.outlook.office365.com
 (2603:1096:4:14::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:28:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:28:17
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v1 00/10] Add i2c-mux and eeprom devices for Meta Yosemite 4
Date: Wed,  1 Nov 2023 18:27:39 +0800
Message-Id: <20231101102751.2538864-14-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|KL1PR0401MB4274:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e89f375b-124f-41f8-c245-08dbdac543a7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	x6i/GPvv0fP6sSjbUA76CCJ2bQ/5WsbbYfUgmkOu0UCJdRdv8zPiqarn3yM0wk62L/Qofz8jTKKM/sU3J/K9U3Dql8Xr1SJkL2JKUSkJsFx2Ar+uSwqHgpvREnyA976eDBGuUkOBViw+/V2fwRa3CVMhk0HWDdFeegK4PsEtH712mzLBvvBsmqT1Xa+EI7cpDZXC9KgPG9h7XtgYXJdcN6C+GDWVLFfsKn1v++IHdiWL2bsz3iRWEHIONyoHJBrVIfpCKAPM4IxYoOp35HpAhiRFxWu2tYKHsA4UTf1zPFEicznT0LlUK+tTxz6zAuDwMo85KRtIrM/ZECOi1a6PdNXYUnNsHR9YHgmjdiPRsT4QBjkg7j1IiSykHh3tdF7E8gEItJel/4hjPzM7HJfw96Bw/wfI/Rn0ociyHNsWHszcrSPNJiFFssTRqMydM1YqLnNc3qU0EDKcoujcOeXsryVUIQEVO6LKfvGkMn60Dn+CRFsawCesDOYUSb3UInG9OwPP1NL9tDmcIEYS6qWEGZbFhTrGGMKyBqmkiBxCBEZPUTyYLCIO12PL4L+Czwr0gNUfxCRmqrP4knPsuWlvNI1gfgWH5GYatutsYpCXOk5i9NaZNRrIZlS5JHVCAtvOETL9AU1eVY9kjd3w3unUlvDpQloxlmip8aaVohYckTehqh9nw6f9vFkKt/eW10FWoke7f+xMCzJzQaXK9gM7Dw==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(346002)(376002)(136003)(396003)(39860400002)(64100799003)(186009)(451199024)(1800799009)(82310400011)(46966006)(36840700001)(5660300002)(316002)(41300700001)(36736006)(70586007)(70206006)(2906002)(8936002)(4326008)(8676002)(6486002)(478600001)(40480700001)(6666004)(36860700001)(6512007)(47076005)(81166007)(36756003)(83380400001)(356005)(6506007)(26005)(336012)(9316004)(1076003)(107886003)(956004)(2616005)(86362001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:28:17.8724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e89f375b-124f-41f8-c245-08dbdac543a7
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB4274
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
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Changelog:
    - Add gpio and eeprom behind i2c-mux
    - Remove redundant idle-state setting for i2c-mux
    - Enable adc 15, wdt2,spi gpio for yosemite4 use
    - Revise quad mode to dual mode to avoid WP pin influnece the SPI
    - Revise power sensor adm1281 for yosemite4 schematic change
    - Add gpio pca9506 I/O expander for yosemite4 use
    - remove space for adm1272 compatible
    - enable interrupt setting for pca9555
    - add eeprom for yosemite4 medusa board/BSM use
    - remove temperature sensor for yosemite4 schematic change
    - add power sensor for power module reading
    - Revise adc128d818 adc mode for yosemite4 schematic change
    - Revise ina233 for yosemite4 schematic change
    - Remove idle state setting for yosemite4 NIC connection
    - Initialize bmc gpio state

Delphine CC Chiu (11):
  ARM: dts: aspeed: yosemite4: Sync to torvalds kernel
  ARM: dts: aspeed: yosemite4: Revise i2c-mux devices
  ARM: dts: aspeed: yosemite4: Enable adc15
  ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
  ARM: dts: aspeed: yosemite4: Enable watchdog2
  ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
  ARM: dts: aspeed: yosemite4: Revise power sensor adm1281 for schematic
    change
  ARM: dts: aspeed: yosemite4: Add gpio pca9506
  ARM: dts: aspeed: yosemite4: Revise i2c11 and i2c12 schematic change
  ARM: dts: aspeed: yosemite4: Revise i2c14 and i2c15 schematic change
  ARM: dts: aspeed: yosemite4: Initialize bmc gpio state

 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 1042 +++++++++++++++--
 1 file changed, 949 insertions(+), 93 deletions(-)

-- 
2.25.1

