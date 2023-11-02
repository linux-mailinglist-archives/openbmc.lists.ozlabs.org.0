Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C6D7DEB8A
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 04:42:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=fKkm4vfT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLV7j55nZz3cVk
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 14:42:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=fKkm4vfT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::62a; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLV436yhDz3c5k
	for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2023 14:39:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lPU7hRPxFYWHlyIT3tCNMWUBHwpNZD6PGSPZP+cJciMEuwxEJyhEEaah2M1AsuCAcW8i625qC0hJJoMkFUnQean1IEa9OvnV4W1JEgMlaXI+DQyS8GsyFuRE+L/fCRX87p+olyfaA/qp/pjUHL5nmwTW2falwGCaSDrKSIkJiYNlw9dBq3p3hxN6FAoYVpgcCnYm7ZcXztCjTY5+AvahkYtF77pxAMvw1BNGUqWUJD9yYei+3IAZSI+x1OOQY7oqTxd2L+p2Qaac5gI8SLcDnUexHk5+2/kAerA11VwojtHz6DVCOouFnil7u3+MojdDysXRwBtiq0CdAsM3DTUlXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5A+YGxARtmjO8LaEC8NMjLhxNaKIJpF8nCOyDvjQDU=;
 b=W2KrVgDgDI9Kayx2Llx4No2JiezKMRZCuRAI/ZxWMD7ffulrhRu2rrsuDto53kuJxCEBq67g8E6eMxu/rvkjtGX/HhIoziZeQpLZpjr5csdLxa+Asd1z2/xs8fCXSKPdlTsDXmUDWR5h0rEU+lg/n7ZRPf2MWqCqkO2+LaSm3HSFJGeGE8kPZA4kSbTOG3gSj2ph2HYcjkO7wE3SvumSODjnT4DSkmnxHv3pLrNEXdlh3MgMKwOAWh2UOzo63mhrq9PgecTvUWnXBwGCD3n1729pzYbIVrDr26EelPQZZeLayLMM0XQqoBnP4yXD3q6h+Zv+p/B/oFhBSHAuV4Gieg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5A+YGxARtmjO8LaEC8NMjLhxNaKIJpF8nCOyDvjQDU=;
 b=fKkm4vfTCdkiCJEFU4EJ5BBES4vWXEux2A4Z6FFup05XgZTZy5N7WNQC0cqjfBBrRDPJ03rpm7VMTGkN7R19zouzykVzjPvwTc5vkWNsth3DUC2vTfiUJ09W3ixOSOd23u5zW7Fcy2G6p9LG8l8sXzbnQ/0gffHj6bigPKUZZM4XTIhZxB87Tf2UX8/MATunWt3uWx55I+j/792saJCHDeUYBpg+g6Dha5RqFmTSLODqvXeImpg8THbTydmhs5AeZPEQCo4W0rOUOnqFdjh+JhfbVaV41kqH09bMD7YD9sDG+B6koWZt4P4Uj32qWg0WoJxrtUHrngSdR07SyQvB1w==
Received: from PS2PR01CA0061.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::25) by TYZPR04MB6713.apcprd04.prod.outlook.com
 (2603:1096:400:335::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 03:39:11 +0000
Received: from HK2PEPF00006FB1.apcprd02.prod.outlook.com
 (2603:1096:300:57:cafe::fe) by PS2PR01CA0061.outlook.office365.com
 (2603:1096:300:57::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Thu, 2 Nov 2023 03:39:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB1.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server id 15.20.6838.22 via Frontend Transport; Thu, 2 Nov 2023 03:39:10
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v4 3/3] hwmon: max31790: add fanN_enable for all fans
Date: Thu,  2 Nov 2023 11:39:02 +0800
Message-Id: <20231102033902.3884466-4-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231102033902.3884466-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231102033902.3884466-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB1:EE_|TYZPR04MB6713:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 229b84e9-7811-47c9-5339-08dbdb5546d7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	o78S5e2O9xf3VEv+OoGQ9ndY0GB5KiDZeMy/a2yaZCzdcB8AJy+FuzgER1t3PnV75UiixzKGxn9bVeyWasl7+Wd7SnYexQitKIcZq54PISJr52oe6DQNxmx2DHX6/Smd7EIzJ1p78vny8Xd6U0MsoYU7yya/lmWvIHlbJcf7oiDo/AZ38BzyVwLcWJtM/drrgbHK1+M3juq4Azuy7rg5HljWw3MTvCiN1+sYRjcAwvJfLXka/IrVTIz4wasIcGaMla3IkVU+4ina/2PDcnjNfiTnj6nriIMEKl4u/vPLO+5AwB0BFRzvO+MqeAm0rjsA2EKLW39+HBdyYd3WEaFhB1uwAL6+zGFyQbW2DGhzTUui0Un0FSLZKr6ycSmxPnXEhjTDqWoKIjv7pSi0Q3cILTq0Ez7A9Ts82bULewvaUY+hxkc1hbltxXug3LNJaOmH9KxjQryiYo7h3tb6yDFlVrRD1JeoNcadw9HMbKUBe/V+SoU+sMIavv3r5gsEHkQ6Jk7F+qszyU2AKF96omLQKPvUyAIK9eaCR8zGmAVnSRXfyKHhCNJjPLvOcCcVWZ4dmY87Sdx911JAtCuVYNw7uPMVBvhM1ywz26NmdmooCjRKnLaiy2ilF1hi5JXTLMiB4ZbuHIlDMXjNY1O8gqHHV4hMbDoK14NVhuyMe3oOEtzS4xgk5i6u+lU9aQByywVXPB5FjscyuPcng9QBAhkkSQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(136003)(39850400004)(396003)(376002)(346002)(186009)(82310400011)(64100799003)(1800799009)(451199024)(36840700001)(46966006)(956004)(4326008)(47076005)(2616005)(83380400001)(70586007)(316002)(336012)(356005)(26005)(81166007)(5660300002)(70206006)(36860700001)(36736006)(8676002)(6506007)(6486002)(8936002)(107886003)(2906002)(6512007)(6666004)(478600001)(41300700001)(82740400003)(9316004)(36756003)(86362001)(1076003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 03:39:10.9339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 229b84e9-7811-47c9-5339-08dbdb5546d7
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB6713
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

The fanN_enable will be set in dbus-sensors service according to the
index of TACH that filled in the configuration of entity-manager.
Add fanN_enable for all fans to prevent dbus-sensors service
couldn't find the corresponding fanN_enable for fanN_input.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
Changelog:
v4 - Add fanN_enable for all fans.
---
 Documentation/hwmon/max31790.rst |  2 +-
 drivers/hwmon/max31790.c         | 57 +++++++++++++++++---------------
 2 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/Documentation/hwmon/max31790.rst b/Documentation/hwmon/max31790.rst
index 33c5c7330efc..510d5691b18b 100644
--- a/Documentation/hwmon/max31790.rst
+++ b/Documentation/hwmon/max31790.rst
@@ -38,7 +38,7 @@ Sysfs entries
 fan[1-12]_input    RO  fan tachometer speed in RPM
 fan[1-12]_fault    RO  fan experienced fault
 fan[1-6]_target    RW  desired fan speed in RPM
-fan[1-6]_enable    RW  enable or disable the tachometer input
+fan[1-12]_enable   RW  enable or disable the tachometer input
 pwm[1-6]_enable    RW  regulator mode, 0=disabled (duty cycle=0%), 1=manual mode, 2=rpm mode
 pwm[1-6]           RW  read: current pwm duty cycle,
                        write: target pwm duty cycle (0-255)
diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 378ff32c7c1e..fa31e108c7ce 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -203,7 +203,8 @@ static int max31790_read_fan(struct device *dev, u32 attr, int channel,
 		mutex_unlock(&data->update_lock);
 		return 0;
 	case hwmon_fan_enable:
-		*val = !!(data->fan_config[channel] & MAX31790_FAN_CFG_TACH_INPUT_EN);
+		*val = !!(data->fan_config[channel % NR_CHANNEL] &
+			  MAX31790_FAN_CFG_TACH_INPUT_EN);
 		return 0;
 	default:
 		return -EOPNOTSUPP;
@@ -242,12 +243,12 @@ static int max31790_write_fan(struct device *dev, u32 attr, int channel,
 
 		data->target_count[channel] = target_count << 5;
 
-		err = i2c_smbus_write_word_swapped(client,
-					MAX31790_REG_TARGET_COUNT(channel),
-					data->target_count[channel]);
+		err = i2c_smbus_write_word_swapped(
+			client, MAX31790_REG_TARGET_COUNT(channel),
+			data->target_count[channel]);
 		break;
 	case hwmon_fan_enable:
-		fan_config = data->fan_config[channel];
+		fan_config = data->fan_config[channel % NR_CHANNEL];
 		if (val == 0) {
 			fan_config &= ~MAX31790_FAN_CFG_TACH_INPUT_EN;
 		} else if (val == 1) {
@@ -256,11 +257,14 @@ static int max31790_write_fan(struct device *dev, u32 attr, int channel,
 			err = -EINVAL;
 			break;
 		}
-		if (fan_config != data->fan_config[channel]) {
-			err = i2c_smbus_write_byte_data(client, MAX31790_REG_FAN_CONFIG(channel),
-							fan_config);
+		if (fan_config != data->fan_config[channel % NR_CHANNEL]) {
+			err = i2c_smbus_write_byte_data(
+				client,
+				MAX31790_REG_FAN_CONFIG(channel % NR_CHANNEL),
+				fan_config);
 			if (!err)
-				data->fan_config[channel] = fan_config;
+				data->fan_config[channel % NR_CHANNEL] =
+					fan_config;
 		}
 		break;
 	default:
@@ -291,7 +295,8 @@ static umode_t max31790_fan_is_visible(const void *_data, u32 attr, int channel)
 			return 0644;
 		return 0;
 	case hwmon_fan_enable:
-		if (channel < NR_CHANNEL)
+		if (channel < NR_CHANNEL ||
+		    (fan_config & MAX31790_FAN_CFG_TACH_INPUT))
 			return 0644;
 		return 0;
 	default:
@@ -445,22 +450,22 @@ static umode_t max31790_is_visible(const void *data,
 	}
 }
 
-static const struct hwmon_channel_info * const max31790_info[] = {
-	HWMON_CHANNEL_INFO(fan,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT),
-	HWMON_CHANNEL_INFO(pwm,
-			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+static const struct hwmon_channel_info *const max31790_info[] = {
+	HWMON_CHANNEL_INFO(
+		fan,
+		HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
+		HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
+		HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
+		HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
+		HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
+		HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
+		HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_ENABLE,
+		HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_ENABLE,
+		HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_ENABLE,
+		HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_ENABLE,
+		HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_ENABLE,
+		HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_ENABLE),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
-- 
2.25.1

