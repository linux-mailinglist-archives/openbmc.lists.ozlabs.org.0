Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2927DEB85
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 04:40:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=bCk4L7Hf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLV5g1yxGz2xwH
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 14:40:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=bCk4L7Hf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLV403P87z3c48
	for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2023 14:39:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZGgy9B/vGYfafzww2/t6CZN1rxY5ZaeUejCfdzcAAaVxPPBFijuVRBGPipnQlgpkk2wLAyJybLPPtV+uRC/+PvDDiTGBmcTRoJKEtyAip77Aj9YjOCfjyYHXB8TXDH9tZj+XMi9Ark+Rvp9ulIjvipbk8S/eiJZg1DLvKDlnRhNHuWCe2AovvAyAMXWVs25NxgN4ZJcwN6twRqZQ6Y6Yi8cdFLabS3Lgal8UeNbXXeDu5HRrumU2dunX3GdPglOVpEYPf0Pi+8ZPOjfqJMKEZ78tA25HNaPeYgV1pFiFORCxqj3XuJzjqEoTL6UI/3N3G1Wv/sXXJVuXL5a5BWGHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2B/LaJXYfe0Z7H/8Zgl9w9YnK4JI/a1utXV39Qi1W9g=;
 b=HLq0rWGcIkeGgS2xbzgpLcBjOCMUIPThtmIuUYWTz6EjrfzQF4pgt0uQLK+qHh7MN3xtSl7xVrxLIel77Nup1650coLdj4VHdyI7YLIR7oq3NncqT+Xi1KfGToqgY/nMnqZn0icbGgmYQ3DNXXV7h0cg63KrXSB9VPQtHR+caL7I+hf2kVH5TIK3CNHpDj4Pism6t0bS6LS0FYIqXVz3fHy/Ml2GJ9ZBH488+bGdY8HdwLaGheMTL3GLV7Tphp/xTxny9XNm83+5KN6yvGRf9XFt1ByvcbGdvCRTb/Xab57ae5LO8u7zYHOXHpPsgXVywOd0Ys0ikZ9/dnnE3WZZmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2B/LaJXYfe0Z7H/8Zgl9w9YnK4JI/a1utXV39Qi1W9g=;
 b=bCk4L7HfVcBvFUdJkBkbCGUNhK07yvJxjRlsAFy9TexGFEwFwRSmn2grpBpzsap5Gtj/qoiQo2IJzJrY/AARdV4h8vpjNedMCHW+nVpWfr2l61yNOO0gKiMXapZN/EPvlpE1RfQq+MayFHvaa17kCwMFZlSTMrz0Xt68DN5GQgXVWhV5jBMnrkI7+ngJ6oJzjaeOwFuno/DEjhsPbX5AJFfDoP2ootMpGhZM40I5gNGOQCZAVwATxA4UDxTzTk6zv3daMA7f8pmzWfAJsZaaGGarY+rb/XieINCD4ezWXlBxlbWdVtUqm8Bq93EI5jSif2XIxwtDoppNbl3HYm8s+A==
Received: from PS2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::13) by SEZPR04MB7529.apcprd04.prod.outlook.com
 (2603:1096:101:1f1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 03:39:07 +0000
Received: from HK2PEPF00006FB1.apcprd02.prod.outlook.com
 (2603:1096:300:57:cafe::60) by PS2PR01CA0049.outlook.office365.com
 (2603:1096:300:57::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Thu, 2 Nov 2023 03:39:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB1.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server id 15.20.6838.22 via Frontend Transport; Thu, 2 Nov 2023 03:39:06
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v4 1/3] hwmon: max31790: support to config PWM as TACH
Date: Thu,  2 Nov 2023 11:39:00 +0800
Message-Id: <20231102033902.3884466-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231102033902.3884466-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231102033902.3884466-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB1:EE_|SEZPR04MB7529:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d131d3f8-6ec4-4791-8448-08dbdb554440
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+YtA6EHBwU+Z5v23v8MC7NxGqqkw/bnsUYAvKTBYAq1d7dhHDsgGN+NpSk6GzL3chXN7b1EdnKfPl7S4JorKWuT7wMNQf5njSVx1bo++UrGpf3yF3k3KzRwEc+Sy0rZykgmpFr+CMUPzTijLIwUVlfpx1pR/DmjQ0tNBL4dcqgWzdb1o8jWUBnsp+Epa0P0zWB1XLNZYuTltK33rD0wNRLr/gclaOgB5HHl8DjBnR2drH+m/rk/Jey+HwHCsIQpwi5HSNCuZZIT2hIlMusyCTefxEDezcsT3SwpTfJBC+96wmZWsN/tnxV6OoiybeD5WzPgtk7KUSqNxwiSf3CJ0xmLxClCDSb68wz+XGN+umJHHZLQYokL/8vAFVGbvpnBBLMsVx/67ESL+OS0Ks2PeoHhbNW7F2kLvGc5HdfneCvvDoYxDKmF0YZTKa6Ith4GXFnT8wTDBEwIt0KEKcXOSWynO260fCA/Zt2KlTkRiXR2QB/BcVRYKhJcjdlffwwIkFS0+wQcq1gmxPpFNcC5ZTTHdCyfHNEIQXbkyw1iWnb8xGAQ4VdMiUbmqSog4Ys7FdQLM5/SnB+0nt2oEP9XJXRrLLP/FDz9zS6e/1meo7JFpAa/v97uF4UJuM3PrDo/vwARqSMyBn8ZillDdS+QU9IaOBSw7aU1NaMAvcGfFBPyAzxl/MjiBaGhZHPe22laEx6IZwISHtnHAgmI+osb95g==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199024)(186009)(1800799009)(82310400011)(64100799003)(46966006)(36840700001)(70586007)(70206006)(316002)(36736006)(336012)(6506007)(478600001)(82740400003)(1076003)(6666004)(107886003)(2616005)(4326008)(26005)(956004)(40480700001)(8936002)(83380400001)(8676002)(6486002)(6512007)(5660300002)(36756003)(47076005)(2906002)(9316004)(81166007)(356005)(41300700001)(36860700001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 03:39:06.5901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d131d3f8-6ec4-4791-8448-08dbdb554440
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7529
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

The PWM outputs of max31790 could be used as tachometer inputs by
setting the fan configuration register, but the driver doesn't support
to config the PWM outputs as tachometer inputs currently.

Add a function to get properties of the setting of max31790 to config
PWM outputs as tachometer inputs before initializing max31790.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
Changelog:
v4 - No change.
v3 - Use 'sensor-type' in 'channel' node to config pwm as tach.
v2 - Remove unnecessary parentheses.
   - Add more error handling.
   - Change the type of "pwm-as-tach" from u8 to u32 to match binding
     document.
v1 - Support to config PWM as TACH
---
 drivers/hwmon/max31790.c | 83 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 0cd44c1e998a..378ff32c7c1e 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -480,6 +480,85 @@ static const struct hwmon_chip_info max31790_chip_info = {
 	.info = max31790_info,
 };
 
+static int max31790_config_pwm_as_tach(struct i2c_client *client,
+				       struct device *dev,
+				       struct device_node *node)
+{
+	int ret, channel;
+	u32 reg;
+	u8 fan_config;
+	const char *type_str;
+
+	if (!node->name || of_node_cmp(node->name, "channel"))
+		return 0;
+
+	if (of_property_read_u32(node, "reg", &reg)) {
+		dev_err(dev, "Could not read reg value for '%s'\n",
+			node->full_name);
+		return -EINVAL;
+	}
+
+	if (reg > NR_CHANNEL || reg == 0) {
+		dev_err(dev, "Invalid reg (%u) in '%s'\n", reg,
+			node->full_name);
+		return -EINVAL;
+	}
+
+	channel = (int)reg - 1;
+
+	if (of_property_read_string(node, "sensor-type", &type_str)) {
+		dev_info(
+			dev,
+			"No sensor-type for '%s', use default setting as PWM output.\n",
+			node->full_name);
+		return 0;
+	}
+
+	if (!strcmp(type_str, "TACH")) {
+		ret = i2c_smbus_read_byte_data(
+			client, MAX31790_REG_FAN_CONFIG(channel));
+		if (ret < 0) {
+			dev_err(dev, "Read fan config for channel %d failed.\n",
+				channel);
+			return ret;
+		}
+		fan_config = ret;
+		fan_config |= (MAX31790_FAN_CFG_CTRL_MON |
+			       MAX31790_FAN_CFG_TACH_INPUT);
+
+		ret = i2c_smbus_write_byte_data(
+			client, MAX31790_REG_FAN_CONFIG(channel), fan_config);
+		if (ret < 0) {
+			dev_err(dev,
+				"Write fan config for channel %d failed.\n",
+				channel);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int max31790_configure_channels(struct i2c_client *client,
+				       struct device *dev)
+{
+	struct device_node *node;
+	int err;
+
+	if (dev->of_node) {
+		for_each_child_of_node(dev->of_node, node) {
+			err = max31790_config_pwm_as_tach(client, dev, node);
+			if (err) {
+				dev_err(dev, "Configure for %s failed.\n",
+					node->full_name);
+				return err;
+			}
+		}
+	}
+
+	return 0;
+}
+
 static int max31790_init_client(struct i2c_client *client,
 				struct max31790_data *data)
 {
@@ -521,6 +600,10 @@ static int max31790_probe(struct i2c_client *client)
 	data->client = client;
 	mutex_init(&data->update_lock);
 
+	err = max31790_configure_channels(client, dev);
+	if (err)
+		dev_crit(dev, "Config PWM as TACH failed.\n");
+
 	/*
 	 * Initialize the max31790 chip
 	 */
-- 
2.25.1

