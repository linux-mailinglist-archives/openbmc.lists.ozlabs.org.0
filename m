Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 015B67F3C73
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 04:33:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=fhz6V4I7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZmzN6Qvrz3cYG
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 14:33:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=fhz6V4I7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZmym1bc7z3bsP
	for <openbmc@lists.ozlabs.org>; Wed, 22 Nov 2023 14:32:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrDVbhK9gcD3+JPw7IwxeWYwcctOMgyeLRBeUzkLo5c8OIWLgXURb9RZ6Ynvjv+YD3Azdi39l098TUumaIA62FwmSEbVjuMEYHnHraYX+Np6jd/LeQztBExhlsU35zbkFBPQPXYEBXtWMuaoFX3RgOF4Yi7XvhJVQ4Qs9IQA7zOJgUhSalqdAzD5/K0fmC+VyMLlhzMEt5cT25c1/cuInD3lXGiz6wqNNk6Jn9RFQNbAKZnq3vmk970FEda+fzJtBoI+z1e8zo70cCgj6vNb6oQvb9T4Fkm8EwCfmLkmAkl8jpp431VKR1Ksst6KvupP8Y0BfXfnmpGOR390bcfbYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ne8DHLwPA/jsT43c17x9qaPVf2vrRJXucJfidDLh7SY=;
 b=Ad0rtBLIPxtfo3kxyk5F3NmUW9fU04QaRLuLnsWM9WMkkRtkoMnhitowIhWfruml2yY3TV/sr2qssSkDr+N5b0nM0UUQG0rpZe0xCVGxeyn7tG1qrYSFj56T5MrKwLIDdqi0iLdAq/0VaI56EQdUWK8AQPSdZesX8V4Dg+th+3sd/GtCCQnEOq8jrtKPdAjsnVDDGh0BgpSo3PqOG5xvBzyJyTJ3xI70qolDTQzpfdxS6u1NJ5nkg5vxMWjl3aZTEC/buiMt9jyMHNzo8J6vwBNyyIDAel31SKLH9dygIe3QfgThycTHwY3qhW8bkFL0tqZJZz9AFTHKZLTSHdAN7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ne8DHLwPA/jsT43c17x9qaPVf2vrRJXucJfidDLh7SY=;
 b=fhz6V4I78jhXzjMRoBtk9rUn414TEYsYLEw4dOJDgjVskD0UY5aX/e/Tb2h+Z67vV6uF50UziQybGzr8GkdniVdsc981HHS4OMkWnKy/nvvIwJdo+aa5avAx9d9+gRDEPtFlB3k+f7HzMB9YvyTMr6zhDe4jAd3xjfBK+30THZnMz3Pnr4XAUo+S87VPgUIdgx1r3xwgsKYSfRUnTVzqCp4dnNRAt/FJpNYJwdHS295g3ZTBmNQe+qP4igCHlZfLk3yZYlhVgH49KBb9IVuuvCiarpu88uz3iaPzsrrPpxioe/nN/gk+rujKa9/74nYesml51gbrRLErztoSlxCSww==
Received: from SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22) by
 KL1PR04MB7712.apcprd04.prod.outlook.com (2603:1096:820:137::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Wed, 22 Nov
 2023 03:32:07 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::51) by SG2PR04CA0160.outlook.office365.com
 (2603:1096:4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18 via Frontend
 Transport; Wed, 22 Nov 2023 03:32:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server id 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 03:32:07
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.5 v1 2/2] dt-bindings: hwmon: pmbus: Add adm1281 support
Date: Wed, 22 Nov 2023 11:32:00 +0800
Message-Id: <20231122033200.3068324-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231122033200.3068324-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231122033200.3068324-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|KL1PR04MB7712:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5c08b092-734c-42e3-5d14-08dbeb0b9a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	IR5xg+e1xDSHE7livbAdG85PMf8xD1+Z8NzQ2cy9COIrZHTUQHlyH1pDSm04Am30cpnUQqQ5FQhKeW+rpuZgiGEkhRKXbecxQTlb+iOnCJOTpbNmFGouweeEVl/Jc3IvxE+05hij9TYRdFf5uUxa+NVTpC0HDRGgURsSK7K/jNnAj9wtQxVlUxzp13sWOTIxS1acIfQTZkDS3s6l3f0kHd7n1O0DTo30NKVHt7MIrF8kwkzUlNfjqV7ZLSGW968XkYfhFv2IZW0o4DDDKKnVnUOshkQOBkQs6kxJPJHcE4AxtvgUlzdAwyA8tRKNLULTo+3Zek1N4BSutbAM5I512potxSsx4sFdcBEZq7XqNIQ1C0svQCnRw2W4lcJgHKe8+xMQjdngq8VbyM1jCsL/t5W+ZXnv3jTd/MvqiIbRtIH1XKp3/b4CVIylHH1E8tz93lNnkPLPx10Chy25Dcj9r5wdG/I227/50NWcGpWyTLzOaJu47mDgPd69DyR6AuJOMChFuWp3ES+VtLPzC+UOwnVYXL3PHKE9ts01Rsace5vR+qgishtGz/QVqkokijagnU3wQ71WtfqLk4Nl+Cl8GSRoIMCzBWFXl4MHOkvZ0/zoNSayZGWIuwaynPNR0QhKfAIreCkrFnlqfMMsUcyUtcw7W2FdxrzbPdj6MxLwVd0Mmt/LaUp4hljd4P29do/P4vmzIFyuPeyWvq+ok3HZ1Q==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(186009)(1800799012)(82310400011)(64100799003)(451199024)(36840700001)(46966006)(26005)(1076003)(478600001)(6512007)(336012)(82740400003)(81166007)(356005)(6666004)(6486002)(47076005)(6506007)(70206006)(36860700001)(40480700001)(316002)(956004)(2616005)(107886003)(70586007)(36736006)(8936002)(5660300002)(4326008)(86362001)(4744005)(2906002)(8676002)(9316004)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 03:32:07.2100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c08b092-734c-42e3-5d14-08dbeb0b9a92
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7712
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

Add device type support for adm1281

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml b/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
index ab87f51c5aef..77a358f9104b 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
@@ -27,6 +27,7 @@ properties:
       - adi,adm1275
       - adi,adm1276
       - adi,adm1278
+      - adi,adm1281
       - adi,adm1293
       - adi,adm1294
 
@@ -94,6 +95,7 @@ allOf:
           contains:
             enum:
               - adi,adm1278
+              - adi,adm1281
               - adi,adm1293
               - adi,adm1294
     then:
-- 
2.25.1

