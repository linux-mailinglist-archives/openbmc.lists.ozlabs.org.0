Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 864227AA87D
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 07:45:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Xi2SpvZ0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsLpT39Hxz3cRv
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 15:45:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Xi2SpvZ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::624; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20624.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::624])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsLnr4Fjrz3cDR
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 15:45:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVwjTPaa4Neslk+/DitgfUsolENUW6pr+b+B9KnQbniw4VtBsuZBB9KnCe7Ey7jlN7ICpWrUZxreF/AHhuy0MOK5hK8c9QkYLpbm4gv859V7YzPnb6UhVzFAsRp5YvEwVPvrH/7CzRp4L/aHAk8R5DSg3ormHRIGuC1xxtxc16v009ORTIDMyMN4yY+ynv+XhwWyGFVH8RUx0AibBktW8WNozs3ZQlJrLvoIfA0ybi5786mU2wCDy/5VrPUQGVMrFOqB8RD18U7lFOebg7HlGX5YxfooXPeGx2VKN8P07PIQkLUvqdXuTeNW7KBPjayyAYwEZwQNWFwBH1qrnx6ITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXiZ42LXubHPgzNlrXpxzbcdI94CTc5V2YOWbWZQNtQ=;
 b=iQ/FnNY2DX/bqT8pMddkBeDvF4jR+060yAHjuC32Fb5atlCoOuKNIh0vSOqPETB4IUr8aE4Tby7siC3sKyc/qpHJ6/rpmpt5Zq2w95K70dpVhK4p2cjhGYbMgiZ1NvLiFM1Us43Ahp84RLSEiqzCitIA22dOVZzxjSAjgQ/a7bnBHcg+2tGQx+RQx1iSnvnulReromgNvAGxoKd5lbdAK4EUFXcHIVqbYJhxZcYq0ria8q1aZsKo8FTtAA8UmC0DPhXG5p3OXfHsAr25A9VQPX0r6+woEzcnYzDLAcDFvSHVaKDEXOtSC8DfI0JX/C3y0m4igar0wAbFAIbn1wqI5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=jms.id.au smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXiZ42LXubHPgzNlrXpxzbcdI94CTc5V2YOWbWZQNtQ=;
 b=Xi2SpvZ0GQOtVtP/GyrXT8BLhDJYizrcn49pRJNB04NmoyNRUaCU1DNP7+wkLmkSy1BeCGzbWGWxOIaTzzVpSfQuy3UzdmV1L3NsJTNU1WH7mkmIR0n2DSo1F+M+cg+yOeM+jt1symE3g6XqwWwSEF7gor8POshKIH6cjprcCDR6gL5p30GLE3AKkuiSG4hIfslRdpilnW4kna4+pcPvzH/93pM60c7D6XmRP026QSK37zH33Lt/2/jYNwrYJwSsdPT/cMPlY5wcdyqDuO1BDaVoqINxwMaInELZQniimiYryZV8bcXTwXfGlUAF64aOFAHG2BSTTzr2Ee8N5tYugw==
Received: from PS2PR02CA0071.apcprd02.prod.outlook.com (2603:1096:300:5a::35)
 by SEZPR04MB7101.apcprd04.prod.outlook.com (2603:1096:101:17e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Fri, 22 Sep
 2023 05:44:38 +0000
Received: from HK2PEPF00006FB5.apcprd02.prod.outlook.com
 (2603:1096:300:5a:cafe::4d) by PS2PR02CA0071.outlook.office365.com
 (2603:1096:300:5a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.32 via Frontend
 Transport; Fri, 22 Sep 2023 05:44:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB5.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server id 15.20.6792.20 via Frontend Transport; Fri, 22 Sep 2023 05:44:37
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	patrick@stwcx.xyz
Subject: [PATCH linux dev-6.1 v3 0/1] Add i2c-mux and eeprom devices for Meta Yosemite 4
Date: Fri, 22 Sep 2023 13:44:34 +0800
Message-Id: <20230922054435.4143122-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB5:EE_|SEZPR04MB7101:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f3e48568-f276-4b7d-8993-08dbbb2f020d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	l9kG3OpL/UWKC8qFlf78FWlcgsarnD/8ew/LZNWYCHx+wZsoTRQxrviPpTmHJVufjRZTxlTXD8J+rmO1BbwLA0cHihTBfbLljrQ8oxgoyWsf2MWmgw/aFEP1O6KHmXcXjBrAby01h73f2pPwT9MFtrKcbSNbrytArBl6ftqNl7k2thNlTkh915KsxP5qZzsbZDrvXKY4EGgYT5PR8RigE6bY6PamUWPKF/8RYDMM8hiUYbIrSszE1wuaVox2MtnvoY3kDxZygsYw+S6hQoFuUFrwiVYnWuI73emFv6HEfmwfVurlN6Mn7I+sbV2Qacx3iogQL/afReu+YvIblmFE25CCSKCoK5A2OpbN8odmqTONVj/mZSNNOqxNoquAJeK8AZ6EoqljlphKfZ7K6I7q1HNCLCmHerW6/SRJZcB/VQD36VeF0I8Zu5czP0Zj94woiO3wEii682iq93Ho4QlrvWKYROR6wpfbc/w/uoEnWoYo6Fw1P8lxri5Fnwf4cD/unVt6srMkD0nXzBeVGnkPCX91EwK6FKl7SEfYVrz3KPobhmvIyWNY6tVqDm/S7N7mRxUOdJE0WtMUY6XldDTXgTBG5bnvriqaaLgu8zl05Wfe6UtShBFWKr56IKm6uCyhwD/3+7l7hMHcxfTVHPyadjvuxQetT4xO4UaUUjNWDrHGVm5XTW1WleR1QlIPvsAVc2FohEcjdbpUT5zgGigccSh2ml4qCMlhCWrBm3oN3CgG7v0AU8ri1mKa59EOsYqT
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(396003)(136003)(346002)(39860400002)(186009)(451199024)(230921699003)(1800799009)(82310400011)(46966006)(36840700001)(26005)(8936002)(1076003)(107886003)(4326008)(8676002)(956004)(2616005)(83380400001)(2906002)(4744005)(5660300002)(9316004)(47076005)(40480700001)(336012)(36860700001)(36756003)(6666004)(86362001)(82740400003)(6486002)(6506007)(81166007)(356005)(6512007)(41300700001)(70206006)(70586007)(478600001)(316002)(36736006);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 05:44:37.4262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e48568-f276-4b7d-8993-08dbbb2f020d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7101
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
 v3 - Enable adc 15, tpm, wdt2
    - Change spi-tx/rx-bus-width to duo mode
    - Add device mp5023, pmbus for Flex power module
    - Change ina230 to ina233, pca9846 to pca9546
    - Set adc128d818 and max31790 config
    - Add jtag1 and gpio0 config
    - Separate binding dosument to corresponding driver patches
 v2 - Add devicetree config for ina233 and max31790
    - Add binding documents for ina233 and max31790
 v1 - Add gpio and eeprom devices
	  - Add spi-gpio config for tpmdev
	  - Remove temperature-sensor 11-004a and 11-004b
	  - Change power-sensor ina230 to ina233
	  - Revise adc128d818 config for adc mode
	  - Add vendor prefix for max31790 and remove redundant config

Delphine CC Chiu (1):
  ARM: dts: aspeed: yosemite4: Add i2c-mux/eeprom devices

 .../dts/aspeed-bmc-facebook-yosemite4.dts     | 895 ++++++++++++++++--
 1 file changed, 842 insertions(+), 53 deletions(-)

-- 
2.25.1

