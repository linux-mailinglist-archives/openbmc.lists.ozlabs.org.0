Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DF97A933B
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 11:44:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=rdx9JRdd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrr8x4Y22z3cD0
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 19:44:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=rdx9JRdd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::60c; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2060c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::60c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrr7F26qHz3c50
	for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 19:43:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDegHLDXcowgIYnQholEdYgwpfyKeANjQp1Tudz9nnMHcXoYCg2n/Y8tAOw48e/LYxtyI2QSnCxwA/WG/lCyV6bMoJ8brfBLfB6RUB8cBv1Ar99pjj1h0Pyuk/ibOJaY3i4h6IEZIiPtRGej9uQM9omcWcab6ojR0gCh1JKlhI8/4V95CdqY+pp5aFFw/BLcllCJSspW5+ddBEHUv7gnW9K4uKtq2W5jXJrvuBtEuv5flsOmwFyvIL946cMiyna/O3EtAs65P6yFbBorR9VGxqgBzjzWPNCAHqnb7vnSlHBgc5bjdjGVQ6KJH+pA0Py5nkaa99/jPp5mGNUuK0WuqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTvLMjUsuYTN+XYpv/oeXgQOQezsmCKw5bTkx3B6Tsc=;
 b=ia7gI9eJnC0bIQAgjXigft6rAoeCj9gGdq3ugDTmtBboMBl1KdVbL+H51B4qkaY0GcC/RZSZZzGEO41Vg1e8Kv371OwV6W1KWIHcs21h1jqwAburNaAh9LGAW/mdHZYg3fF+ZI2LvZmp72mTS9hNEQaxvBy18WU0+geGU45GahF+i0cK3oRl2KsmgaLL5JGIz67AG+WPwBx/jRXGTJAh9UDh/TIaQ2Yw51vrRUOBAPydwZ0/WEwpoiTeuSY365LJCjII+YUY13kk7rNzbuAJz0yJJdL7tDvAMY9cHpYCc/KrK07pbZToycLVrJKx9Aq4CvE5sI0U7vaU8DHHfQCTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTvLMjUsuYTN+XYpv/oeXgQOQezsmCKw5bTkx3B6Tsc=;
 b=rdx9JRdds89qxsnbBDfvrU6q9+Dic0zNtJWGN40oXasEkoDdybiSKNktmRkR/En/42+0z9fWsd8fJEic9bU15z/Z3UCCdBzbELzIUt4H8uUVsIhyLTqvXocMQOBLqWqmHHPRKQZM8qzBPE8uGFwwHvv1st/4Lb6FUHrX1JtF22Fy4y1gAGCtfF40KERqyuU5rn8gSYEQfa0dtFTMecmqgYDfyfO3X2nF5T6I4A1EaZgldUN44JHuTwhiSc7rI3oci0a/gMpGq+7ap9loPhLM+Rd7LL/3m6fU23kIVKlB2sIucDzRAhPJeRe5DVleLW0JrUxbxebCjq4WJGO9swDobA==
Received: from SI2P153CA0004.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::23) by
 SI2PR04MB4457.apcprd04.prod.outlook.com (2603:1096:4:eb::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20; Thu, 21 Sep 2023 09:42:58 +0000
Received: from HK3PEPF0000021C.apcprd03.prod.outlook.com
 (2603:1096:4:140:cafe::42) by SI2P153CA0004.outlook.office365.com
 (2603:1096:4:140::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.3 via Frontend
 Transport; Thu, 21 Sep 2023 09:42:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021C.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server id 15.20.6792.19 via Frontend Transport; Thu, 21 Sep 2023 09:42:56
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.1 v1 0/2] hwmon: max31790: support to config PWM as TACH
Date: Thu, 21 Sep 2023 17:42:51 +0800
Message-Id: <20230921094253.1309670-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021C:EE_|SI2PR04MB4457:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6e3cb149-6a09-4129-c589-08dbba872253
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	IbDLKvChpPprif1ZnaMZjwvlhZ28SsTFaWA2EdLXU2eAqxtnBXj1wsCQddcAjwP/vocF4dSERVnfcMZiEXMzYEWy914TAXxAVfDkmWVbhx4E46mZ768JY7ci5FbO9c0K/+CC4c9nZW/eb38XsZBdezV0SGNFRGPmy5yIL6ZcUjWDVHQRbGbnBa6f20Ilk50eP80cqyncB0mNlFcTLqzv8otAgQ5orfPbYiLqsb5fV1mCGELZsY65lw3ObQZhKKRhAeHOofXrZV4CS0KJSepiMDzFV57AVE23tReX5ViTZfwkSabz5R+oDj7vKCd/i7f/hZD2/FS047NTB9Iu2jdRgbI0mH9/0rr8hF/A8j9lULL+787/jjeTCiNE/fB9xFdx2b2bRjaPFeHmEvqgI+kAiurZwqJ4XgRdg5OWJIaQqQfqsVyFLScSfCXdrdTx4pqr7orSieq2Hj84JPEqZ4clQQzo6JEO0L1kXXGxRjkkmOKEWReruhxv/KELRzeRF1ay8i3JyW8lnCoicIV9bAqXW6o/6s+/wsAR5AZ82eu+wQpaIlsrYpivPSLnfhlWJ/NA7TJcasl2QqLxG/ZZaIQfTGSdF2a16caMFF1+7GHr9BodHNR8UBjMq86TnBCNROxF08PCup1rntTm6gM66nIQGBqg7Mvc6Gbv+zibiYsTsPB7qkE5oP4a/Y4MlHoxMcNOF5M/zFaVKsYNkmgwDL+0bQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199024)(1800799009)(82310400011)(186009)(46966006)(36840700001)(6506007)(6512007)(5660300002)(4326008)(316002)(4744005)(36756003)(2906002)(82740400003)(41300700001)(8936002)(9316004)(8676002)(36736006)(47076005)(478600001)(6666004)(336012)(36860700001)(6486002)(40480700001)(70206006)(956004)(356005)(81166007)(2616005)(70586007)(86362001)(26005)(107886003)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 09:42:56.1386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3cb149-6a09-4129-c589-08dbba872253
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021C.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB4457
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

Support to config PWM as TACH in MAX31790 driver.
Add binding document for MAX31790 driver.

Delphine CC Chiu (2):
  hwmon: max31790: support to config PWM as TACH
  dt-bindings: hwmon: add MAX31790

 .../bindings/hwmon/maxim,max31790.yaml        | 59 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 drivers/hwmon/max31790.c                      | 58 ++++++++++++++++++
 3 files changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml

-- 
2.25.1

