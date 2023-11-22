Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D8A7F3C76
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 04:34:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ekZeU43c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZn0R70Sdz3cm7
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 14:33:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ekZeU43c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZmym1FBWz30gH
	for <openbmc@lists.ozlabs.org>; Wed, 22 Nov 2023 14:32:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dz1QoFItcL0fTyaueZf6ITsSIsEpyRrYR2pqE6nvNwetx9/spGVvuohKhHxxYpfnW5IbYVVhgTfIQZMGyA+7cPcyGyZIS/5Ctx/Ub4s/J5F/DTF7owOy6mU/oHTORUvmDmeFc8Im7BhLH7AWNizuaIZjqwmm+rWB18i0FAMMuY0P091oM9ZqG2pcOBcsE8yyX7ghW/yMPKy3Qfz9k+ADxyf6NsS+MbAdH/Y7aeNYXWFBNxw/VkAH++Cpdlzq02Q47KCtEjcTzUJ1Cw7/vb6lm+JYmlzhNx3KfdM3VRBs4tOqgiZz6Fl+KZRBTID8Nu/q22J6lsWoE5KUDy6I/sxLYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TAu505xZka5iEu4GuNbqK8LkJE7k/YWH1R52hNBm6A=;
 b=jBS8YsBiCwjT2ubQSCE9eEzVXP/Gi8u2ONPpsZPmCSEbnNzT7ogWL6bKKFHvHDUyGKgDjXtZBqvtv+SLzgISQ+XwL+p8nGp8KLqJY7PjH23LzWXfrolmJvLpFYeCzDRJv2J4XxMkXWkjjJ3rzZoOst9jK4BadmN9Kz0XZJIVkQEWCf8BZOmYwb43QgI1tF+1x0ZOG+p5750l9vi7Pz2Fapea8pcGGltd7GJs/uPquOwvuQuFeBv+Xw83gcTbi0ZJ4NjT2z8OoszD3CuqoQzvVHnlMggJ0GZBhMKKPzwsFK/ldxGtyQAwZkx2e6Q06ZxC4EpO3tKQjHSU12p5A6a4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TAu505xZka5iEu4GuNbqK8LkJE7k/YWH1R52hNBm6A=;
 b=ekZeU43c3E3BVyQtZYtfXHoA53YhDbg5b2ds/on3j5eVn0osL4Caf+JkE6MU3qKPNVOnk0inJrBkf5z3rQtZmUDVM4oH8gX2+XBDj3kDYzXhKED2+aMildlUSTw8otpjIwQn0JhZScN7XNKpRPblWdNaRia6mGkGNrIwl3g5SOopaEncI0icN1+0YvkEcKqoaGSSqw4QvaC/x4GzZelGWnyL+X9uvADMvICgnEO9p74Sj0Bw9iSyXKz/3MjR9LINeFvhdv0EriAdpYyLBl6b2r4uavyvWIvMq7IROrF5j/IHjsF2tZrCFKDxCHIRZEioQdGgzYwk1SRuMQPXOltOLg==
Received: from SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23) by
 TYZPR04MB7860.apcprd04.prod.outlook.com (2603:1096:405:b6::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.18; Wed, 22 Nov 2023 03:32:05 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::db) by SG2PR04CA0161.outlook.office365.com
 (2603:1096:4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18 via Frontend
 Transport; Wed, 22 Nov 2023 03:32:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server id 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 03:32:05
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.5 v1 1/2] hwmon: pmbus: Add adm1281 support
Date: Wed, 22 Nov 2023 11:31:59 +0800
Message-Id: <20231122033200.3068324-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231122033200.3068324-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231122033200.3068324-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|TYZPR04MB7860:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 83f907d6-1aeb-4d10-8a3d-08dbeb0b9982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	BkHlijiJboM/JbYSrdbgzmq/s9w31iARu/MTYREq4INv0MCaje/8d2UZgbQ1by/vDJejePmdHgqdxkLH8i9U7LeLihUXE/fq8WxMDMJQNFQPlwGpW1f0p10TVq56XZrsm4Yyk6jNV2+s8kMvP85wJjfv8FAxkg+62MENDa90WyNZdFvWgqDXdyHCEyJlOheyC5N7Ui+brsDi8/3xeodry0fZ2Nwd88mMz7uSI5i7HG+mG3/y3TFnY9Br+kZCICts4/4P5i4DzZB+Oz+404j4xhSERyBcFcRM0f5EtwPcuwBJ/ZbNgBn4r/BGbAQX/W05fdrI007DhTJgT6vZheVhUlbDrv4hH/sDE0K7l6k4LdaYEqsaeSdMb9IVziCSaES4yXKD4MC1oNs0MDD+VrHrvgh8Q+l2WAI6g9IDGHUm36ifyjdFDHp7Myryjj/XsLnIRCkHWJoUG2MMrwF/7c+xGnKCsUxgIYm1D5F19aaF2MK4BIUcLIMlT3YoSFVEo/yj9ajfT+XHFL63bs5rvdmxMnb1UDKCpphRA14XTClZ7iJcBkmM/7EvESGd3PJZpIapGteoLxLycn3TJokN8S1+z5jbgd9+Gl9whnevWRtflg61o4VZg7AZdAUe9EoM17ZCagR3vH3UHYY+Qemvc5S1FE0pDa3B/BPymL9a4M06vzDlkhK/JsDZasRnUw4tMnV+Uwubkuc4+9AAKP9WsVgquQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(82310400011)(186009)(46966006)(36840700001)(40480700001)(2906002)(8936002)(41300700001)(4326008)(8676002)(5660300002)(316002)(36736006)(70586007)(86362001)(47076005)(6486002)(107886003)(1076003)(26005)(6512007)(70206006)(36756003)(2616005)(956004)(336012)(6666004)(6506007)(15974865002)(356005)(9316004)(36860700001)(81166007)(478600001)(83380400001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 03:32:05.4131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f907d6-1aeb-4d10-8a3d-08dbeb0b9982
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7860
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
 Documentation/hwmon/adm1275.rst | 8 ++++++++
 drivers/hwmon/pmbus/adm1275.c   | 8 ++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/adm1275.rst b/Documentation/hwmon/adm1275.rst
index 804590eeabdc..47a13b56e086 100644
--- a/Documentation/hwmon/adm1275.rst
+++ b/Documentation/hwmon/adm1275.rst
@@ -43,6 +43,14 @@ Supported chips:
 
     Datasheet: www.analog.com/static/imported-files/data_sheets/ADM1278.pdf
 
+  * Analog Devices ADM1281
+
+    Prefix: 'adm1281'
+
+    Addresses scanned: -
+
+    Datasheet:
+
   * Analog Devices ADM1293/ADM1294
 
     Prefix: 'adm1293', 'adm1294'
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index e2c61d6fa521..979474ba6bd3 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -18,7 +18,7 @@
 #include <linux/log2.h>
 #include "pmbus.h"
 
-enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1293, adm1294 };
+enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1281, adm1293, adm1294 };
 
 #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
 #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
@@ -362,6 +362,7 @@ static int adm1275_read_word_data(struct i2c_client *client, int page,
 		ret = -ENODATA;
 		break;
 	}
+
 	return ret;
 }
 
@@ -482,6 +483,7 @@ static const struct i2c_device_id adm1275_id[] = {
 	{ "adm1275", adm1275 },
 	{ "adm1276", adm1276 },
 	{ "adm1278", adm1278 },
+	{ "adm1281", adm1281 },
 	{ "adm1293", adm1293 },
 	{ "adm1294", adm1294 },
 	{ }
@@ -555,7 +557,8 @@ static int adm1275_probe(struct i2c_client *client)
 			   client->name, mid->name);
 
 	if (mid->driver_data == adm1272 || mid->driver_data == adm1278 ||
-	    mid->driver_data == adm1293 || mid->driver_data == adm1294)
+	    mid->driver_data == adm1281 || mid->driver_data == adm1293 ||
+	    mid->driver_data == adm1294)
 		config_read_fn = i2c_smbus_read_word_data;
 	else
 		config_read_fn = i2c_smbus_read_byte_data;
@@ -703,6 +706,7 @@ static int adm1275_probe(struct i2c_client *client)
 			  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
 		break;
 	case adm1278:
+	case adm1281:
 		data->have_vout = true;
 		data->have_pin_max = true;
 		data->have_temp_max = true;
-- 
2.25.1

