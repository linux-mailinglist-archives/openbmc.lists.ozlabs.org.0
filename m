Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC57D8BCC59
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2024 12:49:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ZUK1TjwC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXynq69r0z3bnL
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2024 20:49:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ZUK1TjwC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXynG1bjRz30TX
	for <openbmc@lists.ozlabs.org>; Mon,  6 May 2024 20:48:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnCoZRXlQwb6c1RbijyozioJ7Oak98kfNGPeGMgQzz0G1WeTxwKzcMJJaoDOoPU36PHDDOtinlFR8RnJTYvLOcbxsVKII5d03nItMna81hn5m4XQL9zahgYoI4to08m8OyQELUG8p89zDyayP+V2K66MUj+00QzJqvD3KYuE3ncCD445SWLxvNXB/XAzuIXJugNmL99ICYGYGryn4fF8zr842/JIH3g+Giqiz2XRVXnKn+K+d8EutbuU9lXXjgNpelUGyShEMAmyRn920epNVtIVwFwh9lGVPXogpwCriwu/qPQO/mIWe5s9NnlHi3QeW3A5/ao8cu09W92rhzPsnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzpFAjjXduWNcvxX+wTeG00ve1f+HU3NsIKcIT1APRc=;
 b=BFnyTIMD4rUyJVFoFqV/mShnB0wTAU4EHmAOv/McwFCyabK7NcPS7zMyhSJMLMsaxBHxZwlopMVX1rvvqQo6wmt0aO2R7uKy3c0Qr/bFRVwUnW+Ie8D9wje23w5HIlNBWTOqe/EXeOL5MSP5AATBGZSK375K2ezl4vlvhbXyfW+sjOnPKfBZ1dE1KMmqqUn/OEFk2/CxQ3I5kUz6x3pcjna+x+AUlf+SybMPweJfw55oUA37oZaKtNeYBaXHj0h/PfRljTe+EfQNjyDmGPQEjZFUibYR2WDhF7uedLDjXXigzeNsLWJ1GoA0IuhgQ7bZcNDF5jK/O0GU93xnAA+ytg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzpFAjjXduWNcvxX+wTeG00ve1f+HU3NsIKcIT1APRc=;
 b=ZUK1TjwCRp76jydJj0iydBc0hYr7nVRe0YvfMUJrKrI4ywOJeNEG75uZdpe6nTA6/dRXg+VLBkkAA6jppaTmImqX1U20aV1UiLwa89uLljXCClGD97Zb33D/rqqW7F+A3eCAGoHcIm9GBH5DGKxsGZDj1XPhsB2KxVLC34Y0ItGvFFM2s06bqnNdtp0g+/5rcsMqMlkTcAy+nzSFqG+cal+DGEXMgqKhc+nZXjJ1duuGTykz1G393LiYWTx395QuomS1xHMGSMjFeSxnvUgjuYTW3FTD/AZpRiRYqppFLAf7WcB/GOCh0G3eg1xL5AbIH8UOFf0iAewZeAoK5vvySQ==
Received: from SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9) by
 SI6PR04MB8251.apcprd04.prod.outlook.com (2603:1096:4:231::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.41; Mon, 6 May 2024 10:48:10 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:c7:cafe::fb) by SG2P153CA0022.outlook.office365.com
 (2603:1096:4:c7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.7 via Frontend
 Transport; Mon, 6 May 2024 10:48:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server id 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 10:48:09
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH dev 6.6 v1 1/2] i3c: Add support for bus enumeration & notification
Date: Mon,  6 May 2024 18:48:01 +0800
Message-Id: <20240506104802.1225466-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240506104802.1225466-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240506104802.1225466-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|SI6PR04MB8251:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e98ee55b-6668-45d8-5c0d-08dc6dba0530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?Eov11XtUJQDdzkf1rFIZPwkJi7Ws00St/Ut765Ty7qlUIiicXSPQ052ndQuz?=
 =?us-ascii?Q?epRy6c70WIyB+bSqRhRX2GziXCBzYXfoyG1sdlTY6gvshOwjfeGD4jhXmdzc?=
 =?us-ascii?Q?1RpZ8sv6yi86+Dk0oVVrQXeHsTXouLpGPdCqCNGqxsyIbZFpw6q+yaJmi/zh?=
 =?us-ascii?Q?pxVnR6w/yaw7W7sz915/yvzUe92NdUjbwZXLhssDjaa2N8NotMj4X9nt8EnO?=
 =?us-ascii?Q?q4Hk93TmX3DDfZPyC+rYNVFHZh+2K/XYBy4vw393l12dxhdGnV4BNx+r0YKT?=
 =?us-ascii?Q?qfTnHW2vShf0rbOCYlhpSw/2EKmJNpXg4SIW8AkX7kX7uy2uyE/JGMOm056l?=
 =?us-ascii?Q?0XkJ0XYgqY+XfbZLq9h+EqlJ74Cy6FJNBXWO1hisVnL3EkSI8Pi1HDj/skMN?=
 =?us-ascii?Q?bbhDkUAba+XNEg49OWldC1t7pcraIzKoppuDH74EMc6jsIwM4krG1wsS1GqH?=
 =?us-ascii?Q?hUB2QZP6GnIy8XHJ9FqSI80Vo2MIYcjOly/XmTo3cWWBDeYnmlLyJZWrZFUA?=
 =?us-ascii?Q?bZxgvgqILU2daHbD9dJMfSjz98lu5G7HHWKEjMw6GpE9LjIohvCxLZwDYmGB?=
 =?us-ascii?Q?CLHITjQTrZr2DGtZD3bfkz5AC5cErVTe/gp6BVpERDJHQTlB4bT3S83jNKUt?=
 =?us-ascii?Q?EK/r/iaF8+Gj7OPKBI/Q+hEIjWz7eoRQgChwLddBVERfXQOsdKRTKAhzcQts?=
 =?us-ascii?Q?T3u1E3s3gbHRaL+KZxXRJrpyLE/VsuK0TDPn5OLn07BCUq94dHkv3u8UwjE7?=
 =?us-ascii?Q?VQlFPWZRQ7mbsnwVQnmvuKOxWO+sU581uEL2H4B7JHYbF3Mo4AY2X7prkDIm?=
 =?us-ascii?Q?VD48XaLqvfEx4WIkmyWd92zybrD5KA8ykbPZFWuNRrjEkZ8wbcjVdfMhvIs+?=
 =?us-ascii?Q?/yCgEl8tiIrfBJeG7wzP0jcCjwKi1dMz0oAR3GQnKPj6ApBPyItnM+DkgI8V?=
 =?us-ascii?Q?PNIcbnnPrGD2WXycDk6as2uoNp9OgBfeWpq03FJF8vE4PsbbsR40TjyaI1MT?=
 =?us-ascii?Q?24Ss7mHw3YGS2SWK5K0qC9kuDT8sOLQc4lmPEwXkeg1oeMAvcLbY3zx5m5NJ?=
 =?us-ascii?Q?5SrbuPdQrxpq9xDXIRgDWVaHZ09ZDazv2HBpNU8NCC5CDxKOkbUmvYQ7NmHg?=
 =?us-ascii?Q?NFMEsLJFHpsZzK3VtmQcRrFPRUKYrL+TAOqWf8XtJpY91Amcr2cZGf6uq9cp?=
 =?us-ascii?Q?J3UgZnrG3boeLMZue/wI5SbEm70+ItTdHOsk3OuuHffUxxBmP2zOGoxdI9T7?=
 =?us-ascii?Q?K6maGUxYgYbuKTAAVCcNXLqCwzcyEEHlP2eVEbdaOhgvp4MsWeWuKToONNRF?=
 =?us-ascii?Q?W9Rtb87+JmY4xHPa5JiHBeMeagmrm7mBZbqlaBL2U2Ha7UrEis5EFQU1ZmEr?=
 =?us-ascii?Q?vStUTpa5PRp3lAV4NEmeke4OHVdG?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 10:48:09.3167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e98ee55b-6668-45d8-5c0d-08dc6dba0530
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR04MB8251
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
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>, Paolo Abeni <pabeni@redhat.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Jeremy Kerr <jk@codeconstruct.com.au>

This allows other drivers to be notified when new i3c busses are
attached, referring to a whole i3c bus as opposed to individual
devices.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 drivers/i3c/master.c       | 35 +++++++++++++++++++++++++++++++++++
 include/linux/i3c/master.h | 11 +++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 0e9ff5500a77..3b75b63a127e 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -22,6 +22,7 @@
 static DEFINE_IDR(i3c_bus_idr);
 static DEFINE_MUTEX(i3c_core_lock);
 static int __i3c_first_dynamic_bus_num;
+static BLOCKING_NOTIFIER_HEAD(i3c_bus_notifier);
 
 /**
  * i3c_bus_maintenance_lock - Lock the bus for a maintenance operation
@@ -453,6 +454,36 @@ static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)
 	return 0;
 }
 
+void i3c_for_each_bus_locked(int (*fn)(struct i3c_bus *bus, void *data),
+			     void *data)
+{
+	struct i3c_bus *bus;
+	int id;
+
+	mutex_lock(&i3c_core_lock);
+	idr_for_each_entry(&i3c_bus_idr, bus, id)
+		fn(bus, data);
+	mutex_unlock(&i3c_core_lock);
+}
+EXPORT_SYMBOL_GPL(i3c_for_each_bus_locked);
+
+int i3c_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&i3c_bus_notifier, nb);
+}
+EXPORT_SYMBOL_GPL(i3c_register_notifier);
+
+int i3c_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&i3c_bus_notifier, nb);
+}
+EXPORT_SYMBOL_GPL(i3c_unregister_notifier);
+
+static void i3c_bus_notify(struct i3c_bus *bus, unsigned int action)
+{
+	blocking_notifier_call_chain(&i3c_bus_notifier, action, bus);
+}
+
 static const char * const i3c_bus_mode_strings[] = {
 	[I3C_BUS_MODE_PURE] = "pure",
 	[I3C_BUS_MODE_MIXED_FAST] = "mixed-fast",
@@ -2684,6 +2715,8 @@ int i3c_master_register(struct i3c_master_controller *master,
 	if (ret)
 		goto err_del_dev;
 
+	i3c_bus_notify(i3cbus, I3C_NOTIFY_BUS_ADD);
+
 	/*
 	 * We're done initializing the bus and the controller, we can now
 	 * register I3C devices discovered during the initial DAA.
@@ -2716,6 +2749,8 @@ EXPORT_SYMBOL_GPL(i3c_master_register);
  */
 void i3c_master_unregister(struct i3c_master_controller *master)
 {
+	i3c_bus_notify(&master->bus, I3C_NOTIFY_BUS_REMOVE);
+
 	i3c_master_i2c_adapter_cleanup(master);
 	i3c_master_unregister_i3c_devs(master);
 	i3c_master_bus_cleanup(master);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 0b52da4f2346..db909ef79be4 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -24,6 +24,12 @@
 
 struct i2c_client;
 
+/* notifier actions. notifier call data is the struct i3c_bus */
+enum {
+	I3C_NOTIFY_BUS_ADD,
+	I3C_NOTIFY_BUS_REMOVE,
+};
+
 struct i3c_master_controller;
 struct i3c_bus;
 struct i3c_device;
@@ -652,4 +658,9 @@ void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot);
 
 struct i3c_ibi_slot *i3c_master_get_free_ibi_slot(struct i3c_dev_desc *dev);
 
+void i3c_for_each_bus_locked(int (*fn)(struct i3c_bus *bus, void *data),
+			     void *data);
+int i3c_register_notifier(struct notifier_block *nb);
+int i3c_unregister_notifier(struct notifier_block *nb);
+
 #endif /* I3C_MASTER_H */
-- 
2.25.1

