Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 999827A7265
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 07:56:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=q60puz5D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rr77Y3hxrz3c27
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 15:56:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=q60puz5D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:704b::629; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20629.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rr76w3l89z2ydR
	for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 15:55:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/QjUxpJ+dK3NhAKSeY2JJPIzVo3Pt7g6O8rF442U97bcbzURDT2pBfnHgFltnr5YIjNVxLu28CALHYFcpUZoiK7XGX/8zByBL3tEsxZK85yq/SRfHx0+lFqvErvBOKIqa+TeFyXLetYblpHANmStfQYE/i05D5bPaGNsCqfhun4QEhanIZvsZmpdKXz1MeX02aXfm7g98tiL7jS38gq/5O0ZoXnXaq8Ol7YCaEGX/3+9+D8F95/Owc/uQtEcSRQhM+XkHNXxORP6D19VWUymawg6mSLRyD+cFO+2Os+m8+YxrDybnKKH/BxWvwBW3TgjNkLp62PFP1UYehE3WpqRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96+2GAEtkrymEe5Iu1eGLb1akEYOvtOsTPxo3FewQQs=;
 b=g3QpXgZh3i2Vbrxg99CuET/PVG+/f4ToHyTQCButj/Xf8fYfuAzg8WI4Swd1qJsA3rIroBX9YAKKFHrNaVkiAL5l2QGX5nY7G87/Y8yI9wjf7OuldljwksW1EqtAdy5lyx0+ws5zv8b5DE6mmBAoT1cFc+/fUH1zcra7iJ+85ujvpRAZce4cofcul4muVT4HpwuK09jB3+E0Iq2AY9CdwMpgfkYvLdBa2jZ3kmOshBltbSLghaPAzVHxq7h8hcYjGdBZwj0sLU/hUL0xNGqCy1ITG2r+NnMMPkPasBr+BP7Q5/CsO3RXTkYwiP2sCcwtx1Dp3iV+Z3xZPeJhjZku/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=jms.id.au smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96+2GAEtkrymEe5Iu1eGLb1akEYOvtOsTPxo3FewQQs=;
 b=q60puz5DKbmkmrfAKHD0ggtkBhmNOMK/fU9WUA1Y1JHzVXHmS3+yaywSgYG2nLtVQ4liRCj1BjGvWLd0qiGNZrd7qEyH6Og4M+f9hiRCZWc7iydf1r5SKE4Us/sV+96tF/6dB5sXDVLzq79sAJOfKM2mPB5hLpgTnqELvvyrrEdamkpxKqdK/xBuBF4BCNsYL9qnilEFK7Rs5sn12F7gaEEsdpYyH0Wkd91rHhle348X1FPgOpzwNarULxGpUYuy1bQSzDHF7t+dslqz2RvGyKsSvbO4fMS2iXfcnInaLOSm3TM6n6TR5XNHwvQR+uuySdsvcUi+bZCzs2MXoraCRA==
Received: from PS2PR06CA0010.apcprd06.prod.outlook.com (2603:1096:300:56::22)
 by TY0PR04MB6221.apcprd04.prod.outlook.com (2603:1096:400:32d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 05:55:17 +0000
Received: from HK2PEPF00006FB1.apcprd02.prod.outlook.com
 (2603:1096:300:56:cafe::7f) by PS2PR06CA0010.outlook.office365.com
 (2603:1096:300:56::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.29 via Frontend
 Transport; Wed, 20 Sep 2023 05:55:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB1.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server id 15.20.6792.20 via Frontend Transport; Wed, 20 Sep 2023 05:55:16
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	patrick@stwcx.xyz
Subject: [PATCH linux dev-6.1 v2 0/2] hwmon: ina233: add ina233 support
Date: Wed, 20 Sep 2023 13:55:12 +0800
Message-Id: <20230920055514.1668839-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB1:EE_|TY0PR04MB6221:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7fe7e80d-63b3-4220-0383-08dbb99e2a1b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Y060+78wlqoJVbqligw43NzMhfxKQzXKlmB4AKRre86GXoLbrmFUGpdGf3S5F9tA+0XSp1FmwWeUVAZWbZ1R1aewOasO2kZTSs9zcb1qslYbh7jvUJyGqXB1psqexPolSP591Hv4N7Pn8AmpBVZx9jFg04C/+rWAF61Baexnxnjp2eUivM8zkEeVP9w29D+b1DG5LeWq2FH2YtwSkZOpEHI7El5++rd5aTHgSttuqnHplEo9SY7Kw/m/qwvmbTi2FHqFJbWrylCh1aEU9S4fSkvUzH8ZKPpCME4YzUhAThB3ZMGZbsusqNqbaWH+eBVRLkqabtJhPxrruynr2j8EB5G+ZUXJOdCRzO6QvaPKYs6R6JfG9x+5/I7IlogT43vBIbnfIJ95YEYNqyjQi2MS8aywiYGegHg12fJ19xuOYjIJ6naEeI3qCY8GOR0dMomSmD2B26lTMZcuxyZ/DCr3VDOWIEPQHVcS6TySd0nhCyxiiRfzt9c4esQ2mgcOPCSieRUL3yD7bBoQ3Yh6qH8kgGc+nQBxyyMCODLyxonXFayOelb8AIYSgwO2itbcE1XARuZI8A5SkOyOwt/8SrS9APWAJXcg5bY5ehdQlcbf4NFfbS56YowHQB8WwoAMNgpLBDejQV6rtP9ktBfId6ZQJXx54le38PGh+/SP8tQqcmuazE3SfXq64zAXSdlKznrzglnZM5B/qO23PRXDU+CgdDU4JNemCd24EWIHqhQNs0NzCKjoOBzNCq1vNih9Akwu
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39860400002)(136003)(396003)(346002)(376002)(1800799009)(82310400011)(186009)(451199024)(36840700001)(46966006)(70586007)(70206006)(40480700001)(316002)(36736006)(478600001)(6666004)(81166007)(4744005)(2906002)(36756003)(86362001)(41300700001)(5660300002)(4326008)(8676002)(8936002)(9316004)(47076005)(2616005)(26005)(956004)(1076003)(336012)(107886003)(6512007)(6506007)(82740400003)(356005)(6486002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 05:55:16.4504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe7e80d-63b3-4220-0383-08dbb99e2a1b
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6221
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

Support ina233 driver with binding documents for Meta Yosemite V4 using

Changelog:
 v2 - Revise Makefile typo
 v1 - Add ina233 driver and binding document

Delphine CC Chiu (2):
  dt-bindings: hwmon: add INA233 binding documents
  hwmon: Add support for ina233

 .../devicetree/bindings/hwmon/ina233.txt      | 27 ++++++
 MAINTAINERS                                   |  6 ++
 drivers/hwmon/pmbus/Kconfig                   |  9 ++
 drivers/hwmon/pmbus/Makefile                  |  1 +
 drivers/hwmon/pmbus/ina233.c                  | 89 +++++++++++++++++++
 5 files changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ina233.txt
 create mode 100644 drivers/hwmon/pmbus/ina233.c

-- 
2.25.1

