Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BEE7E51DC
	for <lists+openbmc@lfdr.de>; Wed,  8 Nov 2023 09:22:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=rT5C9BHA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQJ3Z6wnkz3c4M
	for <lists+openbmc@lfdr.de>; Wed,  8 Nov 2023 19:22:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=rT5C9BHA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::608; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20608.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQJ1t4nztz2xQG
	for <openbmc@lists.ozlabs.org>; Wed,  8 Nov 2023 19:20:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSJm7Me97VMqS+THNFlC4upq3le3S53o4WaFt1b+MJbxVv2D25y0EpofoCLoJAbz2tHGHlspus8W+D8TnbyFXdsrG7SuzULdESoUmgHFdnUy4nl7HTh9NP0ZpgoLRwpeqCGE6tQACjtZkjXDcnEiAaIbnybIqopVV41rMg92y0Y+b/nMX7hxsQIdZhrTAEHHK5niKRBohUyZC2BX/rGnpv4fFXE6sNlhVZpkHAFw/QpEnZsysDUQQkVPHLkq75HdV/zXkhsqcxotyBPnVVzmHRg3Kb5hAHoGsMkdTCqYqL5V0EpTotevsmRZtIIgFYs1IqNDfYZGgOKS8bjCvO41AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2pRIdWBF5flFg4ac2FXqX+9BfXpv1nBuypFYcAi2iQ=;
 b=lFuP9EBm4qlSps8dDc3MfZ368G4/11TAsYE4R3OSpQuczAB4ZhS3m/i9r0UK/OkEVRHrPpw/KiZFAi2IIzGNfRCijWOErDft1gOLgNOt53Qg4wx5cmabbbRRFW/dxn1StqNzw5EIgWb/v4qdOaAI4ztsrTSwYBfLAcXakceQjjOynCjVi9Yh8IiRJmrHIN24hC6Qv/FtZODWCJiNROEWv9+aBpg5qYnPf1IaNfJpMNkYs0TICsY/k2d2piTnmZg/ahKE9MDreNCInWTbjzmG6gDuXcdRfK1ZXL1SZiaTQzOqL/7EqaD1f7wILV8vMZ7HApPn79ROkVy+a2BtzG3dHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2pRIdWBF5flFg4ac2FXqX+9BfXpv1nBuypFYcAi2iQ=;
 b=rT5C9BHAhafFG232kuynr9koCKxO6pAiI2QPMedXbr56pTxb3D6Krca/+7dTzwo/8fI4yEXOgPGdLqYSjiiupnyvHpJeXzBdJ0iK4MuZrMPnFO3GxaTCMZCzINoaZIfsD9Dx03uQoygxHOyV+wXyuX+CpxotQSq6YsuzBg+6vS/ZsXVZAPkzSbWlnwjWlO2dpXuiz9fGKfggl9CUshWbedqHLyCMKu5CaAoSHFlmhn4vFI9T1XhQcBdIAG6aDkJidW1mMSej8QYt48DXOYyf5d0V7VN9Gbq3XvglEgEv8T2uPWNKqBGw/wF/mqGGCZNC/iXoTOrNybK8QbEBVrfLZA==
Received: from SGAP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::33) by
 TYZPR04MB6908.apcprd04.prod.outlook.com (2603:1096:400:341::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 08:20:23 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:b6:cafe::e3) by SGAP274CA0021.outlook.office365.com
 (2603:1096:4:b6::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 08:20:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 08:20:22
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v4 0/2] LTC4286 and LTC4287 driver support
Date: Wed,  8 Nov 2023 16:20:17 +0800
Message-Id: <20231108082019.1601366-1-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|TYZPR04MB6908:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bbc6ef70-8ce3-4e92-7f8d-08dbe0338d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nOdg1w0mS2UOlrAfFi3+R+9fYdD2LWD0Q9t7z9yXvuLXWCNbJ+ilIodwz39Tzz7oDZEScusYemHqnsGlusWLzgNjAg9QiqHrXItd78Wc+3/GLyEaI7QSd/9RS5h+rJx3YGwI89SZVuraxl5nlEi7gzkjZUgUIKahNRuCpYMvbPi7p/Ubd/8mNUydCspLcBSmTiSYoAByufH6Kzh8FlHdpSC7HqGN5xzuQ63lIPAXuiwkJSXxDzMxad5pSpdMvxmoHQfG3sxPi4TtiZ7u8tuTa4HZbcngdj4gbKPduAsQ2F4rJ7w1dzQDjHG9AwNKFj+hgLUIpsREpk6dc3zrpso9jEoiM3k0jaUBNJ4e5NPQwV7PPLdOWgW49p+i5qJW7cE5hpCEoh3GlRuaW/Axl/7bbRKRySYEkCxUewVPm/RBy1fFsRvN4DGjS+60isWT0TWmXxiliqAjSakS+ysazORFERHI0yEpyry+YOpmdgQFTdkY5313hRRNxHfcnGUIcm3velbAGzNtDBAeKcBMOlAh5fWApn+lQgweeyfHD9nyMtxhQwDCh4El5kpLEMTMr3BJ6v3sBwXFPbZFH6fAGMFiRN5x1QzTh6APTukqZ8zsH6VUjLHDp/aR0mdg5uKRclV0ufXz12e6cRnfofcRMxDOzxG1uWLiv8Tik3Os65yOPgJwu+9b/8w0RJQ8GEDMxYhxfg7PYHbnIpKDbd7Hwl0jJA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39850400004)(396003)(136003)(346002)(376002)(230922051799003)(186009)(64100799003)(451199024)(82310400011)(1800799009)(36840700001)(46966006)(2906002)(40480700001)(6506007)(336012)(41300700001)(956004)(6666004)(2616005)(6512007)(47076005)(26005)(107886003)(1076003)(6486002)(81166007)(356005)(36756003)(86362001)(478600001)(4744005)(5660300002)(82740400003)(8936002)(36860700001)(4326008)(8676002)(70586007)(316002)(9316004)(70206006)(36736006);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 08:20:22.1788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc6ef70-8ce3-4e92-7f8d-08dbe0338d7c
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB6908
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
Cc: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

v4 - Add LTC4286 and LTC4287 binding document
   - Add LTC4286 and LTC4287 driver

Delphine CC Chiu (2):
  dt-bindings: hwmon: Add lltc ltc4286 driver bindings
  hwmon: pmbus: Add ltc4286 driver

 .../bindings/hwmon/lltc,ltc4286.yaml          |  51 +++++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/ltc4286.rst               |  95 ++++++++++
 MAINTAINERS                                   |  10 +
 drivers/hwmon/pmbus/Kconfig                   |  10 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/ltc4286.c                 | 177 ++++++++++++++++++
 7 files changed, 345 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
 create mode 100644 Documentation/hwmon/ltc4286.rst
 create mode 100644 drivers/hwmon/pmbus/ltc4286.c

-- 
2.25.1

