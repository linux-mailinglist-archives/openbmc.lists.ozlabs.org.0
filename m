Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 169C180C10D
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 06:58:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=U0iAPtar;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpWJR3xYxz30hG
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 16:58:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=U0iAPtar;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::627; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpWHs6NKwz2xbC
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 16:58:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYIQb+ttKrOl8jxPgJGok7dyirZ4tN3njnFNLGprK4XfF+Z8DO/tqPpL11ztuynTq733WJQ/sVImvloEXCJATPbEEPpBcv48h2xqegVKXUR4i6Ww8ePvbkfznDqgI7SuGQSi3+nFg9KQxxnq2KOZ+CQ7RsVHOV7LFXf8R0oQT+S1KsXcbuMY8rBMLUGzQ4ygzXjCgDcr1YNIxZDVeK/Nxil5mOgr0kUJPEfx/m7QTDYBqXU13WIQNbn7hBA14uXprNpnM5MtW9lyQYaNohvnWFKGiLitK2FokA1h3TezZtSiR404ve2NE5Z+j9sjgTfBRcrBPSadI7ypqjb12ARMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SewUZ2Yzy/QTlVkXm6Uy4L2G2jsRbj0OtwLtuDOEuDE=;
 b=ec+MFqPdMlVwR6rUZUfEtuxq5yTRYrgcftMV7H0ugdEVG/90FWvWN2cqgiw/t7LS/d7AflyzYAgrpiMSYwZof39xNdYs1gTK0b77bTg9uOOuGLevh0/w+wKe7G8BCQW1FXbKo+V47V8vpYgI8qfbixfxNf6CMbxXCg+s0ewxW2exCbkQSi6e3ROUIGdm4b+vu8h1qyNrFLP+io9GnXgDDdKN8o/Vo/fEo16DveoQmjqV5yZ2Uu73ivCMvFXplAIClXbogShOQQuvW3Pz5bMGZ9zxVlAPYUv0OX0lul0/gCl5w1xev1ezC0fvw7YRydlMmzPSXVbHOwFc+LrBRe8qLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SewUZ2Yzy/QTlVkXm6Uy4L2G2jsRbj0OtwLtuDOEuDE=;
 b=U0iAPtarALBh71FAHbITgFbWzIyuVLESjH8Qug+uoDvp03GWWI2BKi+BMbxW5c1318bCuWYrAiA0lS5r2AL0RbyWE5Lppez7dlLVUS/wtJUJNJh/tvsx3NYmn1LIG+ITtxBLmCVtIfDdMb5SjNnrbys6aB+5aN04sjNYPh1BbE5b+3mGZQcrIeO7si6ufylMb6vIH/NIsjAtj34Dr/XULplONg+IieBKs3YCVZsoLUi5/8I2X3fpz6URn8c86dKVnmwZ5Tw+ke3PQC/ilJ8lHcfUrMWiNKHjttn+LCof/zJCA6QHeSdw/r2W6rrgDIapE41yjJ9pIPUAg2vds13VTQ==
Received: from SG2PR06CA0238.apcprd06.prod.outlook.com (2603:1096:4:ac::22) by
 TY0PR04MB5741.apcprd04.prod.outlook.com (2603:1096:400:21f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 05:57:42 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:ac:cafe::dd) by SG2PR06CA0238.outlook.office365.com
 (2603:1096:4:ac::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.29 via Frontend
 Transport; Mon, 11 Dec 2023 05:57:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 05:57:40 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v2 00/14] Add i2c-mux and eeprom devices for Meta Yosemite 4
Date: Mon, 11 Dec 2023 13:57:24 +0800
Message-Id: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|TY0PR04MB5741:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 59a5cdb5-40f5-4b10-4942-08dbfa0e1615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	cDJYLEluUWKvJXlMMcKOd4HzXUw08lUDRxbGF4IIJkVbEteo8vdPcch+lhuL/mfiSeZa2CMkX6Qf9BUaaRmsWXmaJExNspNobOhNCmwKByV/wbhdCH9VeiEvu6LCrmTRVG9CJTM1rIBvix7IQYewafrzeVs587JFYpxaC0HN2KJd34PXSeewASu8Ky9N8N/9Z3f5+T4oWVX6AhUv5vwWqG9Usz96L8ql2EcXGA60xO4r6qoljLegtsjaknslY7douprZCUAhQcqgCtyITll6aoSBj+RIWAhyAFVc8gfyIRzHpZn1ra+zjf+QrZp0OAiltXHPMrDCac6qkslYRkY3YNxTg0YZHInsRgUQ72TXFUTiaNHoEEbHiWLbFQJ9UHZvu77vju6URjTHfgBo7QghVU4OIn0/2a7IijRD99/3JpesCUTBziV1W2v0IQ+H+jAo1uMjR+D24tRzCqm9gV5EWPedzvoJdmueZJO/eC4xTZnUNE1Lx6ZtTEhbllaVqAtFBYRbmYTcTScKCQJWfkJI4xutH6IVEWAnT+WTpC1aB7zq0ubF6FF7hKaQkmlIdvqVpxepzqu1TBT0UwtzWt1tkZzGtf6Ln68xDrJJ4JRC6zAfg/VwBKHxjsMwS7BmrD0Ww806LqpgqXnEmLlFn+Lzd4SoOrlrho56RTWF/Q18sjm79Je+WdsWE0yxNtcmFGn6K3lKfQvYeHONkZC1qT/DhA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(136003)(346002)(39850400004)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82310400011)(46966006)(36840700001)(41300700001)(9316004)(36860700001)(107886003)(2616005)(1076003)(956004)(336012)(26005)(83380400001)(47076005)(82740400003)(36756003)(86362001)(81166007)(356005)(5660300002)(316002)(8936002)(8676002)(4326008)(2906002)(6666004)(6512007)(6506007)(36736006)(70206006)(70586007)(478600001)(6486002)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:57:40.6912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a5cdb5-40f5-4b10-4942-08dbfa0e1615
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB5741
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
  - v2
    - Correct patch for revising gpio name
  - v1
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
    - Revise mx31790 fan tach config
    - Add mctp config for NIC
    - Support mux to cpld
    - Revise gpio name

Delphine CC Chiu (14):
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
  ARM: dts: aspeed: yosemite4: Revise mx31790 fan tach config
  ARM: dts: aspeed: yosemite4: add mctp config for NIC
  ARM: dts: aspeed: yosemite4: support mux to cpld
  ARM: dts: aspeed: yosemite4: Revise gpio name

 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 1215 +++++++++++++++--
 1 file changed, 1091 insertions(+), 124 deletions(-)

-- 
2.25.1

