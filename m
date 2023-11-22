Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 534317F3C77
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 04:34:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=RXVfRMwr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZn1V1S9hz3clw
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 14:34:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=RXVfRMwr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::630; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZmym1GLvz2yN8
	for <openbmc@lists.ozlabs.org>; Wed, 22 Nov 2023 14:32:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZeThqZmUsxH6tucIAgWoLY7JpsyZpWyYCCZe4K+6WjyppW5SdVFdhi9gwHU/G7LSf2FBZfkGUsUM/AhtcdZX5IHRcu/9/5W0bphxz0s835uciB/4KRBbh8nstbX8xYJT1rUcb4pGaAuymlixbUpvCMg/8TwsABVDIkcXvTNN/iM3j1jXxTge3YzSZYWz6ciqqTh24PJm9tt1u1/DQsWg6ck9IGnWqck3psimJueIJoLa1w0K1h0FIzK5nLdSjOVFCup138zhy0VtmeaMFTP7KOz9U72a1dkZ0H0ZR7+RjDGB1RAbV8Gs/bGzVddTAnk6gFSg0KZJtI7TVjoNNLcYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0bfjlkLcVtGhd5ZdIo4umXCT6eBvvTWh32AAZ5aLO0=;
 b=FRCGgEqQq6hWrAot7i0nxRXnFaKjKMaQqM53cnNnMrj/Ss2asQ9RhQ2uCpDkIHJQeMqFutBOkIRq3SBx2ynhCpvnqVUSdI3TFAPIKr4l4QxvZU3L5Y04YjSnBJDjgQQeQ24woReCvqAKpa97cRbHRO0XHDqZQ4TkgPftkWVf2PnGqr/c2kIPQbboUUwkxQF4WgDftkqpyBE3xfYs2ICu5cCdfbLn+kmnLm7n9X8Lx4iW9zXta85F6ixI5YxtqoOo3BdvaOeyhyTw2c5UGrhJvGLiXMoczNs8mTtDkDAn+zpSVRK9jk5HVCfLxkCnb6IGGrlmWGfmXt4apMnyAzH6Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0bfjlkLcVtGhd5ZdIo4umXCT6eBvvTWh32AAZ5aLO0=;
 b=RXVfRMwr82zBJpBCjl/qqwSbhvldkt6PJ4Nw+mad+YfkDSdQ/4+sdNZ117K0vrFIgdeAD80DZCPtJb3lcocLyrfOAU9FQAxM3LrlKKScVr9eF0cWcQVx+pZIXbYRAbZe5K5EWwgopjOO9IzjfYzKm3qXu2rWbMj5o9f4RjTzQiXZoq7mUHP/Pi0cUs3yrcxh/oickyzEC0QI7hqTYi4xhPC1JMNDngBoIqJoliqZDvOyetkHiBESgpzFSpLrcs+VjSxflriRg8gOkFqpY+xzM5OWlXPdAnq2Qdx6vT03xEQkQE4e2Qq+CDVxIBTwIpcJsOk6aEet8HDqrmJp0n55Tw==
Received: from SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30) by
 KL1PR04MB7515.apcprd04.prod.outlook.com (2603:1096:820:11f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.28; Wed, 22 Nov 2023 03:32:04 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::f7) by SG2PR04CA0168.outlook.office365.com
 (2603:1096:4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18 via Frontend
 Transport; Wed, 22 Nov 2023 03:32:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server id 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 03:32:03
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.5 v1 0/2] Add adm1281 support
Date: Wed, 22 Nov 2023 11:31:58 +0800
Message-Id: <20231122033200.3068324-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|KL1PR04MB7515:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: de8eabb3-6a34-429c-84b0-08dbeb0b9839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ZHhbfQBTLp2CS5yRlPiWlHMyI/l8JnUQFHJraao8oGASv+YqAdXAXwQmqey22tCO7m1t7+nX3CRnLrNDdxNeOsr4qC/MhOl1dWsT6yaaGEc7z4RCLbQgkXjj5j/AC2orlex7rkHmiGf9UIzDrJ85cYYKZ89wUEZYGSF7RaX1Oqec+TfV2jI8W8AsyBVhBEJP1/E1ssg6f4nyE596Wk0f2d9ZTiDMIdWZWR0pEF1k0VtQpm+18eyqoK/uTPbV/gz5/MBInuhSDp9SvoF1Hj1Uw37svUzIqj6uoOTH07c4gmjStDZ9LNL/Y3hMQNf0V3uxws1nIuLcgR8G0T04wzf48RWL30LXs9751UwVqfE0V9I4Mf6rE/lPtgUTzywhZ0hfRpU4/5uYBxpIJCZ6Xbd37xyWqLioXllf6SVg3PvvY9BOKFf7uRBEjVdVw0CF2ZZs7m6B+TjbgSpdV5H/Tp7bmru6C+6BDdFcbuNIIHTu/M9m8H4JUN25ERPrM1cZzfzCGJazXgVstYbfCbfUsn+GDBacUIy03k3oJR+tS6UTvuaYPMp6WFV/pwwuxwfywbnzM2nuMCP6Wu160dc8V9fbgWQ1juI8MpeDLDumBt9ZCFMWPPYp/iwtf5aWMfn7rcnwLHx6M0F6xt0sgYAH2/G4f+8dQYrQfUwc0YsXYAyN2T3YgbPAx1tvsBfcRgRsxHNZtRBlFKGdNjlzJpbeTP26ZQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(82310400011)(46966006)(36840700001)(40480700001)(356005)(47076005)(6512007)(6486002)(83380400001)(956004)(2616005)(107886003)(478600001)(1076003)(26005)(81166007)(82740400003)(70586007)(70206006)(36736006)(316002)(6666004)(6506007)(36860700001)(336012)(8936002)(4326008)(8676002)(2906002)(4744005)(86362001)(5660300002)(36756003)(41300700001)(9316004);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 03:32:03.2724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de8eabb3-6a34-429c-84b0-08dbeb0b9839
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7515
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

Add adm1281 binding document and driver support

Delphine CC Chiu (2):
  hwmon: pmbus: Add adm1281 support
  dt-bindings: hwmon: pmbus: Add adm1281 support

 Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml | 2 ++
 Documentation/hwmon/adm1275.rst                          | 8 ++++++++
 drivers/hwmon/pmbus/adm1275.c                            | 8 ++++++--
 3 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.25.1

