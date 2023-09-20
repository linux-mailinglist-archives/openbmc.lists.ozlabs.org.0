Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E210A7A7237
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 07:40:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=WYpw0buG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rr6nS57xdz3c1P
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 15:40:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=WYpw0buG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::62c; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2062c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rr6ms1T5wz2yVL
	for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 15:39:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSqoYR21pbt1lYjbPbWJHniOVw2fRLoMAz9YCByLu4Dve8aTiqdFnwGfaN8bxwS+o56Zc3f0qTIlW28bh0VDDsPeT+PtmhH5JWGctzG+6mokB+8LgQJrxYxsw9Y5hCJ7bmVhznpA+bhYl4eMhAJuABm7JKIb7WslhB0kqtkqgzPvin9dTGMNew74OLAmQuplWTzVdJL+uEIhiFIY0DiKGapH78IsGAUNZZlg0uoYgP5y8504wMReXRBjdrWanrY9zPczFdT6Fc5XWXHPWQ7Czrx4RBpuklgvb9x4H+cOA3rhzN48tXmoFqgaCeXglmumdgVvjr7ysCz8Udw4r48gTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39ueShc1A6R6ySrxVuXZRSFomyD+Vr2NgTFQeX5zeRc=;
 b=FQhsJVyhhJbWGfWGSLm6yutdloOqe7weWnTktS6vihZEwRNmg5+yifPWGvznzecgMXMoOrjFqRukBWMa83u8td4hKlufoyazb82/PcpABYgnS8jTf+T1snZll8VkEzUr60f6b+Pua8qnoms5I+p42B3GjjDzMfBWPXQsSVZ6YoH/j3tWNIufGxJvjnw7qsqRmblOD9bYhS2iElng4f0CGambRhcQZYd9tndo2nbNzTSnu5qxCr+GvMY94bxikIhee3BKCJMiVwV+jTrr/rOGtSKNiN96fki2o3irWvJz8Hs18K4P46QgR34ngTfAmUyHBUsn3Dl94JYXSntkE9PiKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=jms.id.au smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39ueShc1A6R6ySrxVuXZRSFomyD+Vr2NgTFQeX5zeRc=;
 b=WYpw0buGf/1rbsnhv0z9odkZhWDx+aAWjTfPAaKVqETzdlisE9bOQeBR+S3w3TKJ0Kh+RVo8Q+BcBrVUdFYdtESLRIqsiy00LsdSlKnntwuM38MXZOLKh/UohXkYEzq5UrZgc+bJAwgMQt/iorrr3o3Iu2U0QJbCKDe3J/Q3fygarixs9qxZWyXhvEjmcnmIfE3mxeB17RpfUJigdmhpBtNox6gktNUZ9LV1h1zxmAcP+XQQogwviPS+QLnXJFWIaoUuWIETQz+8ESyW+fhIVuuiA/eXT9328lkoftcAwbzOjR4ga4qXtFO9ORoYSsBUg5Jx6qMevq+hWu66Md4sZQ==
Received: from KL1PR0401CA0025.apcprd04.prod.outlook.com (2603:1096:820:e::12)
 by SI2PR04MB5920.apcprd04.prod.outlook.com (2603:1096:4:1ef::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 05:39:36 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:820:e:cafe::49) by KL1PR0401CA0025.outlook.office365.com
 (2603:1096:820:e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.29 via Frontend
 Transport; Wed, 20 Sep 2023 05:39:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.6792.20 via Frontend Transport; Wed, 20 Sep 2023 05:39:34
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	patrick@stwcx.xyz
Subject: [PATCH linux dev-6.1 v1 0/2] hwmon: ina233: add ina233 support
Date: Wed, 20 Sep 2023 13:39:30 +0800
Message-Id: <20230920053932.1556545-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|SI2PR04MB5920:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e14f8699-a5aa-48c4-325e-08dbb99bf8d5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nqZDhxP/bnNBhDyKBz/4cbpm9Qu577Qtd3sJ7taVMacdg6Rcd5Mk9qBzsrXVlwT6FXeENWbLYaro/j0e6OnCySue+HKyEii/MNxkShLDO2R6O1IE78V/0oPnIb5OoIzXbAzgdrIAM8jKveIyxoK+PCh91c8QqrSVcgQfeJQEHxobuAkaEor9gZCqh+k2NaO4LW70EOtvgA7Gr8/c0xRFESC6+BIFH4ER4lbLe6MNTwK5guxw3Fo/HoKdtMJn9dQv3+wikojHHXvm7AMJxzMQcinZ5nBfjvFqsRC2MBz6ud9yrY6akxVG/0I4AArMxYE+RCcdS/GMxNjcGRtkQR1UjM2LyPDeHDBuDFltEKm943FM2FfuzR3wMxusKmv0VVMOlC3WLqMwm+8+kGlD38w214MXDVlAJOfYJT3Jm+CT38FMSD5WObffyUy4wJlI5KWG9mDFQQwF/d06hcbmOmXec2O+uXf+EiyUHub20O1MmUlfDkETxDw0bPUn6pW0AgVjc6ptdRCLjxUo5GQm94M7xObpSFPhZZBUEI327Dph2aqcbBYwjYXInwxToYrAS1XyeBvFzK9Xp3UAiGpfgeRrrbOHVxLBp/qYv/RfnFycKerR7zBjAg8TEX6PA5ZFqX/W2R/ANexc20d8jcb1rYfcB27sexh2fjYcl7sThokT6JmxD/r5yvdbw0u4aUAN0s5kq7IJMixQJM8azpJ7hRN6vA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(136003)(396003)(346002)(39860400002)(376002)(82310400011)(186009)(1800799009)(451199024)(46966006)(36840700001)(36736006)(316002)(86362001)(70586007)(6666004)(4744005)(82740400003)(356005)(2906002)(9316004)(81166007)(41300700001)(36756003)(36860700001)(5660300002)(47076005)(478600001)(70206006)(6506007)(6486002)(6512007)(4326008)(8676002)(8936002)(107886003)(1076003)(26005)(956004)(40480700001)(2616005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 05:39:34.7754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e14f8699-a5aa-48c4-325e-08dbb99bf8d5
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB5920
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

Support ina233 driver with boinding documents for Meta Yosemite V4 using

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

