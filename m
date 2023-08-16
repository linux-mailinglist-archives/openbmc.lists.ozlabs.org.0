Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F2177DA2B
	for <lists+openbmc@lfdr.de>; Wed, 16 Aug 2023 08:07:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=GuyratoS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQd3D4NTXz3cWD
	for <lists+openbmc@lfdr.de>; Wed, 16 Aug 2023 16:07:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=GuyratoS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::629; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQd1P1fCqz2ytN
	for <openbmc@lists.ozlabs.org>; Wed, 16 Aug 2023 16:06:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAXw+hqH/jv1SgqtGu0YSOaH7z8M3+89qdfNeZrBhC91CfvThcqZDzMknMY3qViljsIV5eh00ahFTt26C5RKy/MmzPwUIybaUuiC7q4ZINK3BaopUUFi2UYRuuHdslQtEx3t60DceIxpWZaBo8Fiki7d6S1I1xCWK3J3tUBhFGzfL3Grut6fUWFBgMQq4b8L/Akdq+6LSUuQOaYTCdo/Nkah12fFyILnBNO/8vP8GGKk/u8q5PjjJhc3WgCArVrNK4Na3nBCAdVLXKbgls6s7dUHQe0SON+Y7OTMmTg1YRUC8koIQDb+saDxlkrQzC9OO1u3uT8MIWK2kSuavdGqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQTlbBNapJjsaVQE5g6485V2Zm7C8On2PQFw44E56Dk=;
 b=A52elmUKGc/KysKsVJMtlpHQEThw4G45ECmIaEW99KrW7IXr7xbpiw4HxlgAgpG/Ac2yXn9EKDtbXDs7zSTlOe551I9vOyy6vz3pRCnCKLAmE4cI3LLBdZMcP0yZlIjE3MLJ8PWpUdyflp336CoJjazwpEDyZ1e65IRAjXq8ALCiLkAnB4czVmF8BvMzedYQ6Bvi7QP8ZTV+MWoqlj+m21jd2+mUTnuYvM4rAGuOTFl2+3XIqTRKtc1pJ4IFYZpvwQrwX5afQ2uQL5p5R4ge1E6BQCl/Yvq6Y/+ny7On7yPzmd7YWMOf/ECL+pIica+cciXH/QLUEIvimfUWnvrZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=wiwynn.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQTlbBNapJjsaVQE5g6485V2Zm7C8On2PQFw44E56Dk=;
 b=GuyratoSumiDHX8L1CN/HIFJ0Xe8bRKOTVNXfWrUmHoWN0rlD6ESsLPr9vCEJld8D59HQSe/mss3GqDo3+FV2sDuBzXanSQwyQ2MwzJr1QOQPCHRUYyRufRdVJ0o0n/NjTfZdmMALcfjIFgBJ4kYNDgFq/I0M4v2u+OECrPSXAWWBKcPNc31jnttiA4f+AH0IubD0LIBip50G613l5w1hJH4rhoSDfQEd0mG6+CZdAewYIGFUFS6oa5ImfkRNNYrjsRfbUYMgPhDI+/cdcROfOw9hM/ePmam4HWLZ/vCZOu3DhZm7KXrOJs9wo84CTYsixn5qQC/UHsy133ZESHLHQ==
Received: from KL1PR02CA0016.apcprd02.prod.outlook.com (2603:1096:820:c::21)
 by TYZPR04MB4350.apcprd04.prod.outlook.com (2603:1096:400:21::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 06:05:51 +0000
Received: from HK3PEPF0000021C.apcprd03.prod.outlook.com
 (2603:1096:820:c:cafe::a) by KL1PR02CA0016.outlook.office365.com
 (2603:1096:820:c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Wed, 16 Aug 2023 06:05:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021C.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server id 15.20.6699.15 via Frontend Transport; Wed, 16 Aug 2023 06:05:49
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: openbmc@lists.ozlabs.org,
	patrick@stwcx.xyz
Subject: [PATCH linux dev-6.1 v1 0/2] ARM: dts: Meta Yosemite 4 platform
Date: Wed, 16 Aug 2023 14:05:45 +0800
Message-Id: <20230816060547.40489-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021C:EE_|TYZPR04MB4350:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fc0345e9-253a-4513-d317-08db9e1ed6fa
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2Gvzo9MnIBPB7NU/W0OPg3PlmlQdD2LYTXcKeRx78OkqYl6jhnW8Y+ZkWdEATXg8RzSdzZYql1jEbTPJ+eoseEFVpTyR5v6QCaI6a1/t0pQHXk7NzCAZlRnDR4SA4EnRCePbHYUy+HiPeskrUnhZID5stUxJatQMNKzK9ZSftgGam/toO0w1yJg4ey24Nm4GYLO7BmwqxGrTbes1EvRarZSRVlC8xWqT9T+zDTJwcwWNGL/sxEFGvo8VbTvvBjNvDqItKoCS6hi99Su6zvDNSwXKNsmsLI1XYzN0ELUHdkyqX0PEeBl0EPTha6P57OFTl24hgEgOquDfP0xOkr2g2F+0rB+zOe/55V6fbiiU80VL1K4Iw8f/5a9dqLspsGzOoJ96HXxUPvFUaP0GDj1ccVaYqnT24xBSjtZHFdCVVYL/8Rs1jfSWMzarE/Y7+IF0/gL2ePUR8p5t80MOChLE3aUzJxSQWqcKBXS20VmHHGisghKletZ9vLobxwMwIdz8zlv8KTtawQny4e3wh4FrumUPC/5Feq6QmjpGh7E/3Gz7iozisEOPSG1Krfa0qc8TvkhZVtylmz4GqRQwZdgsYdt1D/jaVqJu5qxzSEC4MLW9JMO5hLAJl0MWq1w0M71+MgdBn7uAvgEktMEouMvR/bXYxV85UZHf9adsUi2HnQzFzaR59a+DJwTRHnqlViCcytgk6Cu8IKY6M6sHjEjfxw==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(396003)(39850400004)(346002)(136003)(1800799009)(82310400011)(451199024)(186009)(46966006)(36840700001)(6666004)(36736006)(70586007)(70206006)(6512007)(6486002)(6506007)(4744005)(2906002)(478600001)(1076003)(336012)(26005)(9316004)(107886003)(5660300002)(2616005)(956004)(41300700001)(316002)(47076005)(36860700001)(8936002)(4326008)(82740400003)(8676002)(81166007)(356005)(36756003)(86362001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 06:05:49.5089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0345e9-253a-4513-d317-08db9e1ed6fa
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021C.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB4350
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
Cc: joel@jms.id.au, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add linux device tree entry related to
Yosemite 4 specific devices connected to BMC SoC.

Delphine CC Chiu (2):
  dt-bindings: arm: aspeed: add Meta Yosemite 4 board
  ARM: dts: aspeed: yosemite4: add Meta Yosemite 4 BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/aspeed-bmc-facebook-yosemite4.dts     | 624 ++++++++++++++++++
 3 files changed, 626 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-yosemite4.dts

-- 
2.25.1

