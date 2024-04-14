Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBD78A404F
	for <lists+openbmc@lfdr.de>; Sun, 14 Apr 2024 06:25:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=uTsHLvvQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VHHKp4gGqz3dXN
	for <lists+openbmc@lfdr.de>; Sun, 14 Apr 2024 14:25:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=uTsHLvvQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:240a::701; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:240a::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VHHHM6406z2ydQ
	for <openbmc@lists.ozlabs.org>; Sun, 14 Apr 2024 14:23:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPv33cmLkf6q2QM6GmExvL/ChMMHtkSqTMRUNc22ccZHQrfYw3tTJnFszs9W6o9Ili0e279GUadXZ9jcUvuI2bl9pyhSmtqI9mF+k7S+AB3kuODEFSNDltkxR6+Q9H+R0iQnaphpfj838bYhd0SE+0O+JrgYId+ImwCDqyAAaWF2lAq1VbIrg44yFp4ZtWFephVECOit+IKvYfe+rU8PZKZPBrBuJE3f+e/gA1zZ75hPOfva/4nBBmwzaOpe168eZwrbKXeoPaSP7WBAjNZTz9jWciYN1HqYV8B7DqwzoPRC+RUAI5wyQN6ZWBRe6XU1MIosgeOCn81KHKwQFcK0Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0A3PMx2vCjWaPeHst/bpAAfcashDP8/cgpPZ752WYY=;
 b=X2vxxIh0Z8c7U2o+w/DWnbRHlxQf8jk1fFGwiIwiw7gSgahb67VzWwUaTijBii2BInpzWPTQNwCNZw6hnXN3AI5l+ngoO/hbW+tblbugIRoW9G5gFqQcDX/02ppyIaRRF4+a967rs4X7vmv6HjNgLZ8rjqWCmwovey7SmecKbAO9axtw1oCSDJhMmOOyt/9az+toKzyLtCgMuDb8ekkXkgfqpzfbFMaN5Mx7plC9u+dY0O4h19R2bpUzgR//obCr6HddsHZNRpwx/uULnIGDR0+gYoplF4fCGpGMxvbb20X7dg0Sfw39PfrMUarOscljhguonBOFydNsw1PSZALqXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0A3PMx2vCjWaPeHst/bpAAfcashDP8/cgpPZ752WYY=;
 b=uTsHLvvQ7t+GhhjrdFOey68/3hlxQlTTgrBPCrHliOYOolJsPFX2tRewZp7C9benPC57/lCsLr5rjLuV7j3ikMpiHMlOiUqikyFOZ8TsK5TG3d2DB+N1dwsorF7ngJ/et9Zku3QQ7ozaITu4DzbleJq0XXnvFUHoAv2vbR7RMYE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DM6PR01MB5947.prod.exchangelabs.com (2603:10b6:5:1dd::12) by
 PH0PR01MB6715.prod.exchangelabs.com (2603:10b6:510:97::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Sun, 14 Apr 2024 04:23:29 +0000
Received: from DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08]) by DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08%4]) with mapi id 15.20.7452.046; Sun, 14 Apr 2024
 04:23:29 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Justin Ledford <justinledford@google.com>,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v2 2/3] hwmon: (max31790): Support config PWM output becomes TACH
Date: Sun, 14 Apr 2024 11:22:45 +0700
Message-Id: <20240414042246.8681-3-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240414042246.8681-1-chanh@os.amperecomputing.com>
References: <20240414042246.8681-1-chanh@os.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0216.apcprd06.prod.outlook.com
 (2603:1096:4:68::24) To DM6PR01MB5947.prod.exchangelabs.com
 (2603:10b6:5:1dd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5947:EE_|PH0PR01MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6fd5e7-01fd-465e-fd05-08dc5c3aa2d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?vyzG0OOFMUywiFxMZzDhb5c3o4e/bs7PESlVXtMM8crLyk4gSlxKa7NXPt0Q?=
 =?us-ascii?Q?0QdLEoK1jFQVoMaNhK8pUAbb+IAC3pmGfptcTKC04Ar10b0C52mkri5xPXe1?=
 =?us-ascii?Q?9L0Tfttr1tgLoyzYjq+FHJ5jpON3xRjKNrGWb9lMOLFdHTLULBoUQ3Bc0DW5?=
 =?us-ascii?Q?sy8kEijCdGoKsj+jY1KpMf41YGHgrVTG4AvPzQexDLDdaN++lr6bXhsnJUPv?=
 =?us-ascii?Q?A8qpLySYL4KsAaGRlHlgPCcV4CeL0MBNS3gZ8k9bzHzvq+LYyoX+k7UDDIuc?=
 =?us-ascii?Q?ciCceCIWw/CdcCshIT//AmbiBsuSH8KiRW2umiI32st1YHMkYfRnGSVykugl?=
 =?us-ascii?Q?gDBO2rAA9BgDcuVloeCm0FCfB5KmmKd66zsRpk5bzFOZ24h9dGGW6n381ux1?=
 =?us-ascii?Q?nhSJOHvBGo75d271Qn0MZM+Eev8GyPd/PzwNDpkmDIT/0BcIcukzBJXmtYRQ?=
 =?us-ascii?Q?oH9hgTAlDYJyfA9DAueEuoXkh3IYw3opBYjHVkHGbGeGF+eK2weC9/52Sag7?=
 =?us-ascii?Q?E0juRch6QH9jQzpDLgaO1U6Hu0rv5BVdq6XayKzVGg/so+l1B9q8tZtA0ZS4?=
 =?us-ascii?Q?WUCpcUmxB/TEIJt2bnoTyuxekr/2LhOnVzYzOiNkAO/H2AwHyfljdeJkwwv8?=
 =?us-ascii?Q?Axvv1E71slEpCu2K/95Y1VTrkDCeFhjiWNDkm9Z0FIDs5yDtXZodBn35NwxM?=
 =?us-ascii?Q?J3Y6JvCly4SBcd+VSTI8hYhFCyBtAh2sJK19ZI35mszI16bXwrOALCG0B8rH?=
 =?us-ascii?Q?KYPuEEhINLHJauaJJBg/1HwX4y77SkyLgp4INUJAnSOyOQ89Upe+0HDP6WRd?=
 =?us-ascii?Q?lrz8WuJuXhefszpwiPqKYkqj6qwpDUxPVw90m9Ac3lMWqFBC/Dt7B+ZTD0LY?=
 =?us-ascii?Q?LCnUd2rXg3MGiQA6q6KUJ2AsjT4fGZQiFTEB3RQrBhojo+T897H5UOHzpwpR?=
 =?us-ascii?Q?3OBfABklU7GqZvO2PxqkkxbSDPmFAb+p7UR9Bs/WXZWujYg/LEMu3TunpgZa?=
 =?us-ascii?Q?TXq6CAXp+U1IXZILCZlAGF7uyWFLFCMML60+838UXCBsrMOmlpZ6tsi9Mgao?=
 =?us-ascii?Q?a4j5pw7FJtII/j2CBD+HLLFzyUm+tf1wnLc5ofI9X5qJDk+55hdkh3u0hz4+?=
 =?us-ascii?Q?m/Imuqj8bwruo9zTCkfSuzER3jAZLUmh4YIRUDFTSE5kFUo6XEawxIUxppMb?=
 =?us-ascii?Q?ABlj/vbhJTTwXr3eLubA1UN2qJDhLGR/wqEn2zcj4ZEbJQHDdAx43l2j/KBN?=
 =?us-ascii?Q?2+d6gmPm9QD7pZZopeJESqU4eB9gsEuK3RSPfumoXoTxWSCIih8yDdjVLJH+?=
 =?us-ascii?Q?upzVOqYEAebA0cyr4/0K5RbgzCM+6UAioUMorZIQlnwtulRR5XwKOvYf1wNe?=
 =?us-ascii?Q?uckbApA=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5947.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(7416005)(376005)(366007)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?m/eEWkSNbj5vSGMvdItkIXI7diJHoNCMVDLAbkZ1Iv4ik4PxM4O4Pp7rUlP6?=
 =?us-ascii?Q?WPOJiorXugHCW7ewibfjuosRyCq4LVY0Lqt93hhMsGMTmIAGic5+dbLn73PG?=
 =?us-ascii?Q?bSCwOyHESZSJYVoU6U7P0hrXNOGKtIuOmMznANehHxrSgBzy47j5Q4Hluzti?=
 =?us-ascii?Q?OKATxXtKzu4zImJFjzYtpj9vGsLEMMfqQjdp2VPUztUBL97scE6INiNxFeoz?=
 =?us-ascii?Q?T2ZY+TuLaz/PnL5kj+dJ7wm2Q0QE6Ua0zT5LYgE1s/sp73uk2RWUHL+zRYTc?=
 =?us-ascii?Q?eLs3ag52PLDRCLGQTdNPUnLeDHT2Kl6muZgT07yh+WNyUkJElOzK87vfsauO?=
 =?us-ascii?Q?o6xvs4LWYwJewXtyvHc/xtg4bW1e9kv3b3ITlULCJYj2omeBkj36+bBmXqhB?=
 =?us-ascii?Q?PAHNEeHtDZvyWK2tIthkSTGnzx7nqTkI7KZGJswBFOWiC3HL/mlqPFXI70tT?=
 =?us-ascii?Q?fmyOJjGo4bvDlUzH0O5IXpQhfHnH5Czsx1RphzvZEiORPU7dG1PzvuB/V1G4?=
 =?us-ascii?Q?XCg8k7fZxNmr9gwFQ42RfftEI7EP0K6ImSLQC3PMl+W4OpN4uQNqxPFaQi+O?=
 =?us-ascii?Q?W5AkxYVXglPfdYMh/nP8WMTgbfkidbc2z5B7nFrj/05tb0vJCDbUAJed/wkW?=
 =?us-ascii?Q?6IVUqopXXYQpaOwBCcRlx1gBKYV3BlsQ2C48R3F3qyYhEoHc3zcUNcqn0jN1?=
 =?us-ascii?Q?OFav9rceACF8SNbu1l9ENetJBpuSuwh27IQyxATFEjJFLkRvqXolkeNigvFY?=
 =?us-ascii?Q?FhurLg1y3sqRjG1LHjQDi2yBqOoCP3IG9ZahcrKfG71FR42tJmQxOjrG1Yrv?=
 =?us-ascii?Q?0cGnlBze4kcHJDX1lgJCY9GchA7dmR85KZMc5A6vwgf8Ptc7S1/nnlyGnZO1?=
 =?us-ascii?Q?yKF6AjTO1/dRmNYWOfJObJltUZHNjQAX+MaCklnNMKc6T6mg8PoNuCtLp7cb?=
 =?us-ascii?Q?U8iKyBcoK3FuZCJ52P1gmFx4e/kCqaEOJ6CbZZmnzNiYAHx2pEHglZwBZU8W?=
 =?us-ascii?Q?etr6wU68GhE7upb3M//TBtKVINWCKhDZtD40YWcdgz7qqTVK/I/fOetFiZfO?=
 =?us-ascii?Q?xtOTpwFekKrlg8FJ/VE9GEjBDetCIMgDYyCa1iDvsfpGWaoZyczMGcbt+Nan?=
 =?us-ascii?Q?RoO1yBOxbHtRw3n8q3e8TZR0jzy8INVZSE8SNoxMrBzXC7KH5wQHD4cuxVBS?=
 =?us-ascii?Q?SYtlRddvvXFKukbaaidkb7YqmovcVM77WKe/kv1WVGN5tSLP3tYm6tE8pJbV?=
 =?us-ascii?Q?A3z0SNp/NZXz8RMUVotDv88Zt4SGim8AkiEqz7iWQxQuYMe+7tDyZ0ANBAOs?=
 =?us-ascii?Q?V/ZpkQzj7At9zGQoEdLRgChD9tRlWHoLgZsaJCf6wt0FO9ip9QBseGtvMzBh?=
 =?us-ascii?Q?gOIgIjG2IeBeSUCngRI6wkRvPH0V2ukOqDyBXca7rUofVwePHZH43pMMANHm?=
 =?us-ascii?Q?c/hhCC5D+cL+9YCP0goxB95BVVXFjvISa99BkE5khq9UYk/b3w8ISJZHdj2s?=
 =?us-ascii?Q?JCBG/zjeyP0PqclmNDB6BdY6rwVN7nKmrliG40M/GBZssowl8troU8ljIEeC?=
 =?us-ascii?Q?TyIDjcnFi6+wAEcC8AfVEnhEWftjyLMaDXix09CCtfusOidNXIaR1PZMY1fa?=
 =?us-ascii?Q?2sHXXSoEeQl1F4AA6O5CYi0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6fd5e7-01fd-465e-fd05-08dc5c3aa2d0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5947.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2024 04:23:29.2660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yzgazkQh7wScBrLsoNpg7FZl+tE74KBfOIPvd1feegXceDkabZ/65Etzx/cQ+yCKbvo3hnId6dwL1MA7zdytVaWCmEZSkjzFKdV8n0gKsqMlT/EKVjrKfk4xQxtEAxVR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6715
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PWMOUT pins on MAX31790 can be configured as a tachometer input pin by
setting bit[0] in the Configuration Register. When the bit[0] of a channel
is set, the PWMOUT pin becomes the tach input pin for the channel plus six.

This commit allows the kernel to set those pins when necessary if the
maxim,pwmout-pin-as-tach-input DT property exists.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
Changes in v2:
 - Update the vendor property name to "maxim,pwmout-pin-as-tach-input"   [Rob]
---
 drivers/hwmon/max31790.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 3dc95196b229..ac0a8099acf6 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/jiffies.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 /* MAX31790 registers */
@@ -506,9 +507,12 @@ static int max31790_probe(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
 	struct device *dev = &client->dev;
+	u8 pwmout_to_tach[NR_CHANNEL];
 	struct max31790_data *data;
 	struct device *hwmon_dev;
 	int err;
+	u8 tmp;
+	int i;
 
 	if (!i2c_check_functionality(adapter,
 			I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
@@ -528,6 +532,33 @@ static int max31790_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
+	if (device_property_present(dev, "maxim,pwmout-pin-as-tach-input")) {
+		err = device_property_read_u8_array(dev, "maxim,pwmout-pin-as-tach-input",
+						    pwmout_to_tach, NR_CHANNEL);
+		if (err) {
+			/* The maxim,pwmout-pin-as-tach-input is an array of six values */
+			dev_warn(dev, "The maxim,pwmout-pin-as-tach-input property exist but malform");
+		} else {
+			for (i = 0; i < NR_CHANNEL; i++) {
+				tmp = data->fan_config[i];
+				if (pwmout_to_tach[i])
+					data->fan_config[i] |= MAX31790_FAN_CFG_TACH_INPUT;
+				else
+					data->fan_config[i] &= ~(MAX31790_FAN_CFG_TACH_INPUT);
+
+				if (tmp != data->fan_config[i]) {
+					err = i2c_smbus_write_byte_data(client,
+									MAX31790_REG_FAN_CONFIG(i),
+									data->fan_config[i]);
+					if (err < 0)
+						dev_warn(dev,
+							 "Fail to apply fan configuration at channel %d",
+							 i);
+				}
+			}
+		}
+	}
+
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
 							 data,
 							 &max31790_chip_info,
-- 
2.17.1

