Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CEA78F943
	for <lists+openbmc@lfdr.de>; Fri,  1 Sep 2023 09:41:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=z2p9ZTvM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcVMv0t6nz3c24
	for <lists+openbmc@lfdr.de>; Fri,  1 Sep 2023 17:41:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=z2p9ZTvM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:704b::60c; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2060c.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::60c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcVLD54y3z30P0
	for <openbmc@lists.ozlabs.org>; Fri,  1 Sep 2023 17:40:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pu/7sShfv/XByy7wKxL+taMU+gWDDyahKlp4Nu2Qy2W0wme7H8QwA3EB6WhSqJ3dHfJME8X7VwRMJwkG+INOTyJpfQ80QP8KiHrNKg81a3NGI2raZ8X0NS7UqKDY4B/6NPO6UbZ+dur12dPUIuEGdT8JM5jsypQKZWF+P2EePAyXo9WoghJzl7aZAZc4HDY1KucWEl1cR8PEb5xwNxjDyacgJN23016whT+B9v3TRVHZDfT/E7Rd4K8tTrShhvxBHoNgPkCPhD+/Y8ey5gahXEfOKzNxXXT+pzm0x4yrGUVvFzptcpJKstRu0yn/9zLQJ9BXu/IcQnN04uVR3x4UIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSpUH/izCBhlLzEXlr2hon9wwfbU/1vrx1hbqVh4FiY=;
 b=DA9f/uVWqvgoSBVP/kPiFHdV2+8IEWkAVJ1j2nx8BU+A1XuNdldDQ6BISaVDkCRt9AXogwjh9KKFr+qd6AA8Hk/k/Ex+llYRCnjF0SbQQMnVM+WS0Is1LfDM6lxbZueW/8t3EZfTr9kfi+ifvcBSZ6nuUXmlH9bfQpyyGlPdFeB+FnLKTHA74Jh3nBx2iwbBTeUql21v4ki3Tai8joYer+VDRtJ+KsuUpcE5A4n8Yz7Fa+u0/GoIRJ6VtII6yHMYaWYBdY9c1BvPSPgBKx/S2GzgZX98VlOujg1VZIbxq6cYzyJNmtlKIotn8pKuWQs35L9rdr/RuXwrs+NyBdPJ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSpUH/izCBhlLzEXlr2hon9wwfbU/1vrx1hbqVh4FiY=;
 b=z2p9ZTvMBL0RvIHn7m14be4PUVkEFtARmBV3E0n4ddIrR7z2iSkZVFVjK9AWK4c5e4zcGcmNOXPagCB09WT6r7ZgX+HOET5iDPdjzSlTvtvxgS0G55166AM1KplxMOUOZNkbtbYGZHUSCoqP/ipO1iGrTIZRVWtZZM+LDFTnmy03TMNvzaTQVah9i6PIduJDzwqjYshw5FBQhpCfGjs8K1GENl06ARFDrfKr92DfwNLU7s0u8Fyy7BRv1e40sUNa5nmjup3VvSZZ0lFTsy/r30ntEpqRU2klc6pssE/6VF8BzbjGYe4mPbKMauxhK5RmoTMO83z2zNFsEqe2SPnoRg==
Received: from SG2PR01CA0120.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::24) by KL1PR0401MB6332.apcprd04.prod.outlook.com
 (2603:1096:820:be::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Fri, 1 Sep
 2023 07:39:43 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:40:cafe::f1) by SG2PR01CA0120.outlook.office365.com
 (2603:1096:4:40::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.25 via Frontend
 Transport; Fri, 1 Sep 2023 07:39:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server id 15.20.6745.17 via Frontend Transport; Fri, 1 Sep 2023 07:39:42
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.1 0/1] ARM: dts: aspeed: yosemite4: Add i2c-mux/eeprom config in devicetree
Date: Fri,  1 Sep 2023 15:39:38 +0800
Message-Id: <20230901073939.1532119-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|KL1PR0401MB6332:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9c4fac16-0e79-444e-7f37-08dbaabe9af5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Cxlj0nGcqsA67bxaZgTumfY0ZzzQ9ziPRpPsn7xzfh7Hq/ho4pavukUIs2IfQ6TlsiBH5d6KIq2d6PXE50LbrhtaLcYli4syCw+9CxwhuQjCYWsM57MSweautqgmx1aAxqWOvWzKpCp2dLKeaUQwjKBSaEgRYNs70v3NCWyqM/7qHOjmHueYcQ3jEsHMfpubgQqrC7dmDJKHKJGOUlNHHCXUTe0dMdK+TcgwYtfay/qkWN2JR0VIhWUZZAHT9pzhC3jPuvUc8G/3UAHjuwq4QxUhWh/lpa+Qs42Y6nssm0+TNmRcKz87Xjk7ynyAU59gJZ+jgC90YVSvX4GNy8+auQ0P5lhJ6Su+GKPUbErx1nDhVlYY/aX0vFVZXQXoYS4k+0xb8wRosUX+vR1+IN7p9ItIdKua5z+NbOx0XVUybF0w++3gyhMFEyKiFyeF45bXFX4Di5c1V8WC3PtPVoZduAUrNhlXf8macreW/LgC3+Q9VENQqbJh2eqf0MhX9y+/mT/J4SvWjS6i5IE/juYe15edyR2zDISX82AkitxWQYkoJigUC42Lqz/GmKyOfXxnZzmXuIAYYwI68TRbIh1WkqVpgREwPtAjQVABUmRpy6bwIaF6MZClashMu6lbPa4lzSOi0ZuaJc8Y4eksExlQ8veuQmFTkusuAnrzs/HLnvmBUvOEudhFFLm+j+VmU9Oxa9rlMq23OPI6gx62FXomag==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199024)(1800799009)(82310400011)(186009)(46966006)(36840700001)(4744005)(6666004)(2906002)(86362001)(316002)(36736006)(478600001)(5660300002)(107886003)(2616005)(956004)(47076005)(4326008)(8676002)(36860700001)(6486002)(6506007)(6512007)(8936002)(1076003)(26005)(82740400003)(40480700001)(41300700001)(336012)(36756003)(356005)(81166007)(70206006)(70586007)(83380400001)(9316004);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 07:39:42.0532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4fac16-0e79-444e-7f37-08dbaabe9af5
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB6332
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
 v1 - Add gpio and eeprom devices
	- Add spi-gpio config for tpmdev
	- Remove temperature-sensor 11-004a and 11-004b
	- Change power-sensor ina230 to ina233
	- Revise adc128d818 config for adc mode
	- Add vendor prefix for max31790 and remove redundant config

Delphine CC Chiu (1):
  ARM: dts: aspeed: yosemite4: Add i2c-mux/eeprom devices

 .../dts/aspeed-bmc-facebook-yosemite4.dts     | 546 ++++++++++++++++--
 1 file changed, 508 insertions(+), 38 deletions(-)

-- 
2.25.1

