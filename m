Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F3180BFBD
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 04:14:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=punkPVo5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpRgG4VdPz2yyT
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 14:14:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=punkPVo5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::609; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpRff1M7Gz2xl6
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 14:14:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MnToh2k0tvC761jdVzgHXCa5koa3AqfjJppZL0x3NjzIPowj6lFBqQgdJ+kgxvMI/exY+QNQ35rZvZPYOoU5W1eAucviayyTh4Z23bTFauqL11OiAXUg5znCm+sNo6nIbToijdtb6bbAgr23Th0mYGPWiHYJbfIDWFBy3vbWBl5NnY1XwJkJBNEFvA+UuGyEq9/zVCP6rS8jP/e7kk9A8jUfVsry59sqhcPcxhKAX5ZIiG8NxYaSGQD/8lZkaduMsArCxvoNGaNg26pxAnebTy3/Y/kU1I6KIzM1Z46za4/pvcm6uZQfDdgzo7wr2sdAgMttxRHWqNdqFWsXA1UsaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOhy/s7TtsCGlGNa0m/rgZYN0a+iODf9eTK8XxJU+O0=;
 b=fyy7IaCShZUKBMPHmdCxd0UhffsfE7ppfF8aA2phxMcG7PtBOAIQ85SkjELzAM3MzHYvIG5adHfN9yiqX85sWULGYgNLi/G5f0wmLFzIMBhzgYyO9K7DSrahw5LHP1H7O/gGe3BSWa7X2X7A2E43OK26nsAA9XlD7gyCrts3uWcb3HHOUR13Ki8s312m5EQo9pRQKaf8aHne1U7ZxU06Q+kmeaWKb4esq9he8QHKxAfZHeQPB6HhJ/fayLQdf8mGTqVWXxKNNsFFH2lQHn+ZI5FfkO353fk69SB+8aa8rJ3Bpgum0HQsQgljaYLu6/ouFpRVYaLAMH6I71xHFdIfsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOhy/s7TtsCGlGNa0m/rgZYN0a+iODf9eTK8XxJU+O0=;
 b=punkPVo5+++JKVm6aD67TtuSHtQoqhJHt3c6zwOQivW60TdDZhTRuHup6j31DinatKewDxTsXymUx+wBYA0m/9+LSHkbkgzvRubeamN31OW/9vX49GP1hj2Nj2OHykiaVlK16iqrh8NrwAuMHrU5otn4HTx5vEYSupWX3CH12TuGHkBCdtG5oWZxnZ48RcgMDsLP2HpTh6rxTfLGwyWXjeyREVUPwrsjOzPSSVvYtjzPZ98vgBtY5Gf9UuqQGRhnsJWKPiSi4pPs0NRPz7n5VkYXZd2fMG0jwWCmbVT2V1k0X+rukV09k9sqXsSA8HEo0neoAX6uLVP2p6P4cZhMqQ==
Received: from SG2P153CA0035.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::22) by
 SEYPR04MB5955.apcprd04.prod.outlook.com (2603:1096:101:8e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 03:13:41 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::3a) by SG2P153CA0035.outlook.office365.com
 (2603:1096:4:c7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.3 via Frontend
 Transport; Mon, 11 Dec 2023 03:13:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 03:13:39 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v1 00/14] Add i2c-mux and eeprom devices for Meta Yosemite 4
Date: Mon, 11 Dec 2023 11:13:23 +0800
Message-Id: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|SEYPR04MB5955:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8c602ba5-4225-435a-6030-08dbf9f72c2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xb/cZ2F1EOJvwcB3SaNzWD3jskvm1kKU1vp04bFpJfk1ne3Cf1R5VNu58RKm/MbXTbZBaHlix4JspC1SCqDMOA+wITTRMmvMW42nFhXJ00JalUHwmJMqBeCFeDJF8X4dLSexNGW64uX/z9VZxLNQnrT7wPHB9yvT8f7j/UlVVxmHfnyUetEjlsgsUb2lhX1o71yBX1cRLPcXIP+/oboK4IUoxmFmCJJqxh3hDUyvLCrOq9YGZy/Hr+7KFe3utk6aAH7mspnoRlEDX8uf90wmN7WlXcjE4rycUI4JDzQKoutDIqvbowgkiKq+XbJNx9g/s+17+bURBfLhTYtfiE3q8vY7SVXvbimCFbxBVTHIRxr2I4fcBIzkkVwk8QtpDKFOPRsPzUUzVEKukPsbTAPt9YacoLh+wF4lhkattaTdIpGdaMw/UiklMVxLVkuGifhgwMDO80LPHF4vCDAeh1mt9w3NDjrUKq0qVNTZnKmNfjXq7rSt9Q0CPd0D5EvqDVRATy5nWwkNZt+cwc+FI2Yn6Xg3gO/id1g9K7oOZ7UUZy0TxiSLiJTwOJmAuvGJu+zcNKB4VbejUMqMSfRcC3qUOm4DbhRC2kest1gd8cNUynF4T7cLCyIm65pJmU6jyvNQIv/b6GS8H7ZqfkdDK2ncbuYgZiVTYRTOQWNWIrYA2PVkKiKvFvGd6cHKSd8iE/7xM03loU9cLX9QQ7O5SmCNgw==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(376002)(39850400004)(346002)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(82310400011)(46966006)(36840700001)(40480700001)(36756003)(9316004)(2616005)(956004)(1076003)(107886003)(26005)(6506007)(6666004)(6486002)(478600001)(36736006)(2906002)(8936002)(4326008)(8676002)(6512007)(70206006)(70586007)(316002)(36860700001)(47076005)(336012)(41300700001)(5660300002)(356005)(81166007)(83380400001)(82740400003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 03:13:39.3497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c602ba5-4225-435a-6030-08dbf9f72c2d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB5955
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

