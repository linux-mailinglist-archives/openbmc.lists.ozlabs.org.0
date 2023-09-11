Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E31579A105
	for <lists+openbmc@lfdr.de>; Mon, 11 Sep 2023 03:46:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Bbdrmopu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RkV1h06sdz3bvW
	for <lists+openbmc@lfdr.de>; Mon, 11 Sep 2023 11:46:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Bbdrmopu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:704b::624; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20624.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::624])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RkV012LbVz2yPq
	for <openbmc@lists.ozlabs.org>; Mon, 11 Sep 2023 11:45:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPSuwUyywRQUumdvfFwg3fvzJB4o/wntwlbjcLZUHO0ERfrE6M7p2DBrBwlW/ZA6pY0zbxxhTs7CHt5+Zi+R6gkVEQy8Q/f867+I0+vCuYbOz9aggGaYH7KsX1IQaXtBMCuGF5SqHkCydm8B7SAkFUhcNSaNDnrgk2vrvyPM+2Iqw2P4lmsrHSO09c4OycOSE65wJxRjyBidiZs4EA7Xd1DjV9Lt0F0bII12v4Bu5nBgrbbWSrKDsbaenaIPL5wFxIig58BZ3cKbejld/HArfN8IvgBt1pWpJD2oEEq6lyA9lqPZj7JnQECoVHwh3+M8fICFn45ui2ij9OAQArZTyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0GcJjoQISZa1qIYsxGDxbXl5uds88JGT/kxhBOVXf4=;
 b=GP9dc0aGUObkqjl3F81PnX86VH5e+oII/l9OTcWAlf2ob7PrIK3L4UTKSmmho4tOncuwLSGCuVo1FLrgpHLMecbPFo4XHvFUGLYiZ/WeaHeSwFJJ2oosRVCF7HRPW/cKQGoRvBJcCrMhX/Xreo4ADuZuPIe9TpjFpxBiT/kkC8NITdNsPxdzBWgLPDrB7K+zaVMIxgKSNUzz97ctdUP/3y5zpxRfSQqb+uC9fqOwZbhbVYbA8NGVrzJl/iNBj1d51NJFTgCF/yt0J9zP1+6On88+UWYG1hVAVc9jXi7eqb0pBwptJ3BHTHdx4iE9fK1l0bqxZ7twJvVgnr0/mG8oZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0GcJjoQISZa1qIYsxGDxbXl5uds88JGT/kxhBOVXf4=;
 b=BbdrmopuvnR4U4VPl63cmfTx0dDQzsRMw1spTGu1H7E91tbYmSrEbXA247D4G8Lguts1CRZ0g7OyVnL+8Iz/7GhQnk4xxgzal9nTNEXxgS2B+cg4j66/YSDJXiN2s2iYHbgMRwjufpbGcpp5v1WPyb4ov7nuVXdRV8aiJZutt4c+2BcUq3ev+pMUjGwyRf0M5jkvKPjIQ6QWg4B3trtpcz/ktNkenqByfU79SJevzlMkWX35VfF9vxFvrMYakIQYfveXkh9BF8RYZTkS5IOtEhrQDXwl8g0WGVbXZ6QPT7TmrjnbCEL/mGScm9zPSuNxUTnBr9o+aykXNy0UKxH8dg==
Received: from SG2PR03CA0122.apcprd03.prod.outlook.com (2603:1096:4:91::26) by
 TY2PR04MB3918.apcprd04.prod.outlook.com (2603:1096:404:8001::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 01:44:39 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096:4:91:cafe::17) by SG2PR03CA0122.outlook.office365.com
 (2603:1096:4:91::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.14 via Frontend
 Transport; Mon, 11 Sep 2023 01:44:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server id 15.20.6792.16 via Frontend Transport; Mon, 11 Sep 2023
 01:44:38 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.1 v2 0/2] ARM: dts: aspeed: yosemite4: Add i2c-mux/eeprom config in devicetree
Date: Mon, 11 Sep 2023 09:44:34 +0800
Message-Id: <20230911014436.2036176-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|TY2PR04MB3918:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ad8a4692-25e7-4887-2e59-08dbb268a8fe
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+IHQkOfTYUD61L4mAqhVLYNHeIIMsFv6AgdEKEwKqBexZrdOPN6B0bRQlFOFGQ8BJ6A2A24eR50V/a6/nRizJAri5qk4M5DT1U3n34tZDh/GEBAR7Aauke5fJZZDEzUikdfEdyp/+mYvJDgpSZl4gOmHPlL/LC0HGNQC/G0K1JFac9ub24JCzCOr1he2ygiQ7nOT70YOgBGy8XIFBqNf1xZ6oLSYGvs3TS9Kh497Igh+MGxrHINYoZdpQysgEguM8gL577dXmdoCeus4inEVAEEkuN9l+AxcPPDY6SWyNFxAe3Oc7iwgbkoQRpt+V+FPDrT1dR98X5ej3gO2FSKIqKNNdG3BJo9LxDk1uasnXmfCfe2C6vKCtnV47/cxeng3zhIYDH+3uGli3X3QkJ1wc45rDVPShMTaIRw2ZpNOWKe8ZnuPQ0J6KtgDuHRyhBc+o2YeuIMI6FZtn27iS/r18HUXSc0qInzaVZyojylFIWKlLeO/C1YFmoLQs339mj+DUebhUwKYSkOI3c4fB+x2kW4kyAfsol5CwZ+DdD75l7ABiZxZspc4BgfBnYS4bF2i6CldUehWOE6brEAfuZaUFChVVx0+y9hGm3AbHmpA9qY7XUw6mQCOjhTu7dWdHu557IZ+7AlQ4yqJ/5Ly6YXqfqR194lgMVYJ5grLuSZ+3oFLLrCCYQoQSBkZVRyZrc5XS2LBxzfXyXhdIGqtNc0qsA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(346002)(376002)(136003)(39850400004)(396003)(82310400011)(1800799009)(186009)(451199024)(46966006)(36840700001)(6506007)(6486002)(6666004)(6512007)(478600001)(83380400001)(1076003)(26005)(107886003)(956004)(2616005)(336012)(4744005)(2906002)(36736006)(70206006)(70586007)(316002)(41300700001)(5660300002)(4326008)(8676002)(9316004)(8936002)(81166007)(40480700001)(47076005)(36860700001)(86362001)(36756003)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 01:44:38.1661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8a4692-25e7-4887-2e59-08dbb268a8fe
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3918
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

Add i2c-mux and eeprom devices for Meta Yosemite 4

Changelog:
 v2 - Add devicetree config for ina233 and max31790
    - Add binding documents for ina233 and max31790
 v1 - Add gpio and eeprom devices
	  - Add spi-gpio config for tpmdev
	  - Remove temperature-sensor 11-004a and 11-004b
	  - Change power-sensor ina230 to ina233
	  - Revise adc128d818 config for adc mode
	  - Add vendor prefix for max31790 and remove redundant config

Delphine CC Chiu (2):
  ARM: dts: aspeed: yosemite4: Add i2c-mux/eeprom devices
  dt-bindings: hwmon: add MAX31790 and INA233 binding documents

 .../devicetree/bindings/hwmon/ina233.txt      |  27 +
 .../devicetree/bindings/hwmon/max31790.txt    |  25 +
 MAINTAINERS                                   |  12 +
 .../dts/aspeed-bmc-facebook-yosemite4.dts     | 560 ++++++++++++++++--
 4 files changed, 586 insertions(+), 38 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ina233.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/max31790.txt

-- 
2.25.1

