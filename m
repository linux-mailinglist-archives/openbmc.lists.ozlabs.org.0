Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F878BCC69
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2024 12:52:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=UQfzB2I2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXysf26xMz3cPK
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2024 20:52:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=UQfzB2I2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXys740SQz30Tr
	for <openbmc@lists.ozlabs.org>; Mon,  6 May 2024 20:51:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWZtVL/hiARuLWB6H2g2DXFBoOS5AzreuwVIejC+BNVNWxvXTugyWMMNH5z7x0tAIPTukSQU3POU/RIP5wKbsY2ER9ApHyXzdQpFQz0d/qCL6sOvU3zJ9C8RnK/Kke1QvtW22/m1vKFPmiqu1fuVm05Wa/IgZ9JS1R8JFfsvvA4SAT21y3yysmWEmpzzBQzYozkRPZZA20l1ZnNVV1g7yG6CxcLiP1YDq3LqDbrwLWMRFYP5/x6vQiZIVJiWSQRTuXcj8S3sjvVwkqmdRIp9LX1LnAdwgne//E/SXNDROCLIrUAVKRhXDZ5ij5U/qttNIya1ulsUG/gfMsAegnelfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7HRukdAfpvnUSBeK5Lly3a6ZtML5oD1cVdFGmTjP9M=;
 b=bJEUlUveCkynmX+Y4CEgRq5rdV1/KhTStF/fhoAFrQlL8IDDmLLuSbEWP3xQ2COZ0gO6yTgZK9Zrfgg0OVwEQkpg/U6xDJYfhkVkwOuGfehr/Z6XQehRz0Zsvq4nEN9iyS88Nw03Nwf+UlfUkhwXyhsEjo1faRut7e3wdc6MCnrq/FMHIn2cLVzeZQUWz2xcBaYqs5sgfiB21uy4a2fUmPTpoTPBADL3IN9EslOZ/OE43d+KyZ/kuANlM6zbKZznAuhk1vlYdZq6ofpuLjyXRmUcFaVyG0gcVRosJwoIwx5sQGvYEcQGSP+B2M0b3VaBL3SuoFqSLy3NWCr3kAECjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7HRukdAfpvnUSBeK5Lly3a6ZtML5oD1cVdFGmTjP9M=;
 b=UQfzB2I2Xrk84LV+kpNd+lLZYK2r/kZibnucFPiV4Kz9CQ3NDtUfJaeYoyWx/2PTnHYJ4gvmUqqB7x/B2Ayn86FCorIryyucCl2ecz492EjjTXYy3MQj8MmslOe8O0M+pOHm0HRQJaZHnxIS+fepoKGNgM8lh+4W7lOrZvkjcbVkCsM9bAfT+miuMDps69q9qcNvNccfXkF+EulkwCfIFjt9bxKYF/d0DdXMu3j6fpcMQgCLFixO/WPH2FEeA5jijkrjcjM5BTEnBYZc1npuCofB399j3cjOWg8I7JmN5WaA5X7U/umcsLXd1LVtxRUPPTPET2gsYXw8p7WCC+dFBA==
Received: from PS2PR04CA0002.apcprd04.prod.outlook.com (2603:1096:300:55::14)
 by TYZPR04MB8146.apcprd04.prod.outlook.com (2603:1096:405:a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Mon, 6 May
 2024 10:51:30 +0000
Received: from HK2PEPF00006FB2.apcprd02.prod.outlook.com
 (2603:1096:300:55:cafe::c) by PS2PR04CA0002.outlook.office365.com
 (2603:1096:300:55::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41 via Frontend
 Transport; Mon, 6 May 2024 10:51:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB2.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server id 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 10:51:29
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH dev 6.6 v1] i3c: master: add enable(disable) hot join in sys entry
Date: Mon,  6 May 2024 18:51:27 +0800
Message-Id: <20240506105127.1227193-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB2:EE_|TYZPR04MB8146:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e4c26dfe-f3e7-40b1-52ec-08dc6dba7c57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?qdpdiqYLzQSJAMR2Z1Vdq/EQuLS5TIblHRbFosOU2kJijQrMs3D5DQ40MX1d?=
 =?us-ascii?Q?VF9UWjIZPIxVRANTAIW9X5GGHbdWp49dqWQicDX413SPdRt0XrZ7hin6d4pA?=
 =?us-ascii?Q?5uS0rFgw8BWi0DgLEkpgGFCMimttTEQZJnmbH7TACjGA5sKFXWQS54pDExgt?=
 =?us-ascii?Q?1idSHctK7G2aS5RDwusg3r7xpwHBXn75LlgV7fk+uhcqkkQxVEv2ce8rdeQq?=
 =?us-ascii?Q?OXq5azXITBwhri9p5zyhFUnB1wmoKiY08qwAyl/ov+UQI7MMNJC4HNbh7Z4L?=
 =?us-ascii?Q?qChcRriDscOC9ehFuEviFdlGiLlwO+daH/1Dnuda8DLr7bii/m8Z9e9HfjJD?=
 =?us-ascii?Q?wKL/iql/SwxUpfrO4JSdOSIsIPVd/cf9CDzcIsIkq2U8FLJ96kc8kDCKNZTm?=
 =?us-ascii?Q?tyRvnX+n2nA+nqZkCZFj2E6MlTZSUsr1u7pQqVVALp8Sx+TIUxZQILEiMPPZ?=
 =?us-ascii?Q?cj7Azb16IFWBwEOdcFKp8Jb2wPvhV0yvkw0xBMs2f5XmFu3mw48OIbLDHmZ9?=
 =?us-ascii?Q?osnMjytkjXzc/P7KufXCQW90HSvxv81yIwl/C898AT/YrEodnVvnYLnHyEnJ?=
 =?us-ascii?Q?WFrj1YeFEVeWuy4jdCRQ3hkeR2xaryaDSIJZrkPvTiJJx3A0Wd/QxZz5ohM+?=
 =?us-ascii?Q?D6Vu40yKQaiB1p9y4PRyL+NmFneQLohKT8YBoMjZleZslGhbQssnUoEfYLJv?=
 =?us-ascii?Q?PCUxyysZ/a5bIaGUKZjytBUBuvzJJ59anwCe8jx4dmuADE+qjeOyicdw0/51?=
 =?us-ascii?Q?1jixB/GWUI4/+lw/nMJ3CWSSK2c/Ihg1IrXKa3i6xwiYQdOSZQc377oU3+7c?=
 =?us-ascii?Q?aGCF43IsfNTtANz66P35X8UVXEIbK2nQCFNwdfVW/19+NT1IjtJpI6H0y2xr?=
 =?us-ascii?Q?epsdznPEke09r7wfTswaDw5w0C7p5Pubu+vCR6BktjRjkkD/D7SXJMEHvmP7?=
 =?us-ascii?Q?HkQYjl9h4r9WncDSbOcIKANUn1KzvU8QveCw5a342lz5asfa2djUJ8+nPJv0?=
 =?us-ascii?Q?03NtKdEfSIcLvCzFBZNZvpn6gP32u09aQfACt+MXrl1S2BSPeFuS3KnqrYlf?=
 =?us-ascii?Q?HMPGfAgTpsALdenuLrh9ZxUaC37tbvUfXBH9wUjLPTwJtVYkaWxnDtNyQ3Aa?=
 =?us-ascii?Q?2dIbRNsNHp5QVW95Xhn8XTxJG/kgOv3K8Ovq8tecYrw5XiyDzXW2SoSUnPu2?=
 =?us-ascii?Q?ybpRnSbyE5gsja75wx0eayPgUMo1AvP+A13PmCBqBGMOIkrruc1tL/k+tYP5?=
 =?us-ascii?Q?xTiunoVZkw/YP8bS5bWyANGLKslYX2ezQQUAqYQxp/Mt6l+WSsY6vu9NxSek?=
 =?us-ascii?Q?+gMsMh7RzBJP8KupCUrHBRIB?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 10:51:29.5960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c26dfe-f3e7-40b1-52ec-08dc6dba7c57
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB8146
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Frank Li <Frank.Li@nxp.com>

Add hotjoin entry in sys file system allow user enable/disable hotjoin
feature.

Add (*enable(disable)_hotjoin)() to i3c_master_controller_ops.
Add api i3c_master_enable(disable)_hotjoin();

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Link: https://lore.kernel.org/r/20231201222532.2431484-2-Frank.Li@nxp.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 drivers/i3c/master.c       | 83 ++++++++++++++++++++++++++++++++++++++
 include/linux/i3c/master.h |  5 +++
 2 files changed, 88 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 0e9ff5500a77..dbf968e2a9dd 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -526,6 +526,88 @@ static ssize_t i2c_scl_frequency_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(i2c_scl_frequency);
 
+static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
+{
+	int ret;
+
+	if (!master || !master->ops)
+		return -EINVAL;
+
+	if (!master->ops->enable_hotjoin || !master->ops->disable_hotjoin)
+		return -EINVAL;
+
+	i3c_bus_normaluse_lock(&master->bus);
+
+	if (enable)
+		ret = master->ops->enable_hotjoin(master);
+	else
+		ret = master->ops->disable_hotjoin(master);
+
+	master->hotjoin = enable;
+
+	i3c_bus_normaluse_unlock(&master->bus);
+
+	return ret;
+}
+
+static ssize_t hotjoin_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
+	int ret;
+	bool res;
+
+	if (!i3cbus->cur_master)
+		return -EINVAL;
+
+	if (kstrtobool(buf, &res))
+		return -EINVAL;
+
+	ret = i3c_set_hotjoin(i3cbus->cur_master->common.master, res);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/*
+ * i3c_master_enable_hotjoin - Enable hotjoin
+ * @master: I3C master object
+ *
+ * Return: a 0 in case of success, an negative error code otherwise.
+ */
+int i3c_master_enable_hotjoin(struct i3c_master_controller *master)
+{
+	return i3c_set_hotjoin(master, true);
+}
+EXPORT_SYMBOL_GPL(i3c_master_enable_hotjoin);
+
+/*
+ * i3c_master_disable_hotjoin - Disable hotjoin
+ * @master: I3C master object
+ *
+ * Return: a 0 in case of success, an negative error code otherwise.
+ */
+int i3c_master_disable_hotjoin(struct i3c_master_controller *master)
+{
+	return i3c_set_hotjoin(master, false);
+}
+EXPORT_SYMBOL_GPL(i3c_master_disable_hotjoin);
+
+static ssize_t hotjoin_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
+	ssize_t ret;
+
+	i3c_bus_normaluse_lock(i3cbus);
+	ret = sysfs_emit(buf, "%d\n", i3cbus->cur_master->common.master->hotjoin);
+	i3c_bus_normaluse_unlock(i3cbus);
+
+	return ret;
+}
+
+static DEVICE_ATTR_RW(hotjoin);
+
 static struct attribute *i3c_masterdev_attrs[] = {
 	&dev_attr_mode.attr,
 	&dev_attr_current_master.attr,
@@ -536,6 +618,7 @@ static struct attribute *i3c_masterdev_attrs[] = {
 	&dev_attr_pid.attr,
 	&dev_attr_dynamic_address.attr,
 	&dev_attr_hdrcap.attr,
+	&dev_attr_hotjoin.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(i3c_masterdev);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 0b52da4f2346..65b8965968af 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -452,6 +452,8 @@ struct i3c_master_controller_ops {
 	int (*disable_ibi)(struct i3c_dev_desc *dev);
 	void (*recycle_ibi_slot)(struct i3c_dev_desc *dev,
 				 struct i3c_ibi_slot *slot);
+	int (*enable_hotjoin)(struct i3c_master_controller *master);
+	int (*disable_hotjoin)(struct i3c_master_controller *master);
 };
 
 /**
@@ -487,6 +489,7 @@ struct i3c_master_controller {
 	const struct i3c_master_controller_ops *ops;
 	unsigned int secondary : 1;
 	unsigned int init_done : 1;
+	unsigned int hotjoin: 1;
 	struct {
 		struct list_head i3c;
 		struct list_head i2c;
@@ -543,6 +546,8 @@ int i3c_master_register(struct i3c_master_controller *master,
 			const struct i3c_master_controller_ops *ops,
 			bool secondary);
 void i3c_master_unregister(struct i3c_master_controller *master);
+int i3c_master_enable_hotjoin(struct i3c_master_controller *master);
+int i3c_master_disable_hotjoin(struct i3c_master_controller *master);
 
 /**
  * i3c_dev_get_master_data() - get master private data attached to an I3C
-- 
2.25.1

