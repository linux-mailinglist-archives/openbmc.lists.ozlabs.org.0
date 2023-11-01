Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CB47DDF65
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:29:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=SsRq6mJk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3Cq2YGxz3c76
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:29:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=SsRq6mJk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::607; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3B83FYjz2xZG
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0SRF8Gm8Gqs5vweTtpYcayKycnqagg+FrN8gfEslAzknx/4PMas8Or5DpkKDIJcONIffFyTNo0V2VCQMQ8QrcTd0iN+E0D0C+SjnylUIFgrJelyBsIDD+IKBDH+55I6O6NczNqS8mhVMkYwCWtWETMBA9X6Je6XBJFIGRwdGWM+UhwKSCmuLTTX9Km498TjjTnsuu2+WbXvcLC73JqZw7FHstfA1jxkvU/WoBOCOLqcKAbQM9RlH314R8VML1knxLXSOer7NoRalJTwgTQwlgbe//eZ71aniiMWvGC3bxPN8z2GQBHqzsrM0OQPYPfWKW/H7GhP88Up4d8llqKPoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CFu7J2vn4crZN2tW9EnxPTYlVgdEGLYuqMfQDA+HPY=;
 b=NDelfc0MINJ9Dya65XH+Tb7sVvDFx8pO8xgEGmXl7wHhV0QwwOp4+LG325RkKJscGiWra5LKW/S+JbHlElOQt50jPBA00Vy2ccvG+KnqVa/gyHzFinHMSMbwLJw+/dDa5FPd87GENYrj/PSkdrepN15G9KgzHuP8OIyOS09/cZOAeGT3A5sR+z8gnMwrnC+U3j4z46HRtzgHEzbM+hbgIjFzzGwMfpmecPJnjgg5RP0iPv59zIVyLoO3zx+VU+jX6Fmxl0/yYm32Pd14gE9+NCv+Y0JytiauYeQ/M4v9IBRZmA9AojyPGPsPM1orlqJ/v799pttLJZpRwMWORubl4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CFu7J2vn4crZN2tW9EnxPTYlVgdEGLYuqMfQDA+HPY=;
 b=SsRq6mJkEF+DHLn4iR0A3dqB7Gqx4mDHOHNFyha0Lt0IHHN/zB0MJyZmTms/wnbh6LkRU5goU0gi0frZfn7KrIYuapceeEn+FgfstsVIU+J7TNDpawqgB+VL6dMpRnVFUCraxo1tfxWKG5hvYiXZl8cM8/Tzzlb5bSatuVgFjKrD8cBHV7drHM1Ccv2/yAkQU4wlZFpYusvgMdHBNPbSa51R/C5M3iFgfB3CLQXkmJGU3mZyTv7Wv/RfHAo8zuxjQjy5PwJzecETx+j3EutkC3Z/Y4otcwkjU0PIL58LWdFd0KzEsMO7sO68osngSU5Xv5Gg1p5R1jrd6ozxFqLfew==
Received: from SG2PR04CA0177.apcprd04.prod.outlook.com (2603:1096:4:14::15) by
 SI2PR04MB5797.apcprd04.prod.outlook.com (2603:1096:4:1e4::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.22; Wed, 1 Nov 2023 10:27:55 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::4f) by SG2PR04CA0177.outlook.office365.com
 (2603:1096:4:14::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:27:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:27:53
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v1 00/10] Add i2c-mux and eeprom devices for Meta Yosemite 4
Date: Wed,  1 Nov 2023 18:27:26 +0800
Message-Id: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|SI2PR04MB5797:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e3f9b1ca-9bbf-43ce-2b62-08dbdac53544
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	dq9mXcO2hCOeaZLOnDWNb/tlRGzCRnKfQju7Ni5+Qy4CJYei5D8XjmZ5Rj8DHC2zRYU1CMjZ0RB0GbXtfPuKF3eEmXQQh01H3HW8x7aqParq1V/E60JV0T8lFiZql9B/Z0e8fHB2xQJ4KssxC6RDH2mFzjlT3Zjg4RfctvexhknGquHRYYTaYB3JMrM14sgGGejquxWU27vyBsHnUn/NMcNWoIOXfZIf/19bl2/vF6swwkE1sYW+jBuXcjyMvB/SD0ErTMDMmemdjyNDmAX2mQD9hdfp/DD7418serQ8grsnKblNGcFkoQXIAivaVDzXAryHhV1z2+BLMETqdzK/X5nuqjmZ+SSakIRKO9/+vQNp/PBIMDhTn7dpwe1igy6Wj2WiZLLJV0AZxmH4hArqcmExY4FQSoRN42WkfWKUSuZ8MxTdRZBmghKCkIEg64zPSAIfrTjay5R7iA6KXAbjFYMVAq17cNci2wldt8J4NZdzRBG5dJ0jO9qAHkN5HzGFXHI3mUObe+2vO9r1WMBGbgu0qwpFqDf3gTdvOJFF3dAqoILolNommQU1B8NxWzP1azJ8pStNnZAy7tH6n0W/jTPjPU367r2dca2Kx1WxqQVpIFZJJRt1yYeDl6EHBLGNo7W7t1t6TiJV1YP0PKhcB+k1pTT5vyz3hgisyhw0z9HKRqOBP1DBjROsgd5KeStq2On7n34w1Ry2F9kn5ZamFg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199024)(64100799003)(186009)(1800799009)(82310400011)(36840700001)(46966006)(86362001)(2616005)(6512007)(82740400003)(41300700001)(956004)(40480700001)(1076003)(81166007)(336012)(356005)(5660300002)(107886003)(6486002)(8936002)(26005)(8676002)(6506007)(4326008)(36756003)(70586007)(36736006)(478600001)(70206006)(316002)(9316004)(6666004)(2906002)(36860700001)(47076005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:27:53.7317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f9b1ca-9bbf-43ce-2b62-08dbdac53544
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB5797
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

