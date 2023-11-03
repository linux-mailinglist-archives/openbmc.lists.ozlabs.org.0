Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 250637DFE6B
	for <lists+openbmc@lfdr.de>; Fri,  3 Nov 2023 04:32:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=aFrQ3+wx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SM5sq0Lqbz3cZw
	for <lists+openbmc@lfdr.de>; Fri,  3 Nov 2023 14:32:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=aFrQ3+wx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::62b; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SM5s921hVz30MY
	for <openbmc@lists.ozlabs.org>; Fri,  3 Nov 2023 14:32:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idTIT43FOQZZy41LfDXv4/KbxFQkMJIhET51Hl6wyJuhxSio6AtupBimAL70NOeWCPYQGBovJ/9ELm5IcXDnEkLh+9SGsuKDtpFAzNuvnVSle40zTr0jRZS4TWV+QyPTe9l65TEGJHp7tnBmHGA55Nw0lSR5Or0D1/HMeOD3cBWIsCxS2u/r4frjgHDlY9zj+srMV/aemDyiJzCvA6rrNSLloNKBSa/N537FQeyif4Di67dusg0Y+OD8DX3bHuMrwKO6dzn0Hb0+u4Hl1x1sqVeM1B5qmBq+zEaBqSwa6MWr0jnOCKEkAl4YecKXjtE3GVHXroVDbp+kzuHgAjSh4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2QJ4Bk7dvdliEa6ZZUpkr0va/nntZeU/wCUBSEER8s=;
 b=cORzRQnjutMvlrvNSS/L6wHXkUpx8MCnhgoVOsL/rMBZDS2m0L3Bo6V6gyoYSHodEZLJKM2A1toHTnOb5u0gyoYCjArVwD7wrpxthif87BtRWzcEfzhXHwtzIjL1K4cfrf6XwflXthNO63/13q9vD5T4oeuzIofMMVBD4mz0edF2np42lg46BG0SuWQoHcRzzCFWa6xjR0BptJRd5RPlQz2D9TXCdTxq+ghmO4F7zQ3kadIb9vQWdCV0XSgO+DZ2jIVukYkLCyofjJCIul1O1eGIKHXdnx/uSkcStDIoOQpKF991E57EWe6Mp+eOG+Qi5J8Jc5NKwPw6hxWK8gg3vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2QJ4Bk7dvdliEa6ZZUpkr0va/nntZeU/wCUBSEER8s=;
 b=aFrQ3+wxDaOsWhgs44Ok+z8v05mQpamCWXJPeZ36GP17LreUgxJJDOo86pE5FO7w/+emcuALvFYTRKIBwRWwxr9Z5WlhFysXhXa+cR9Vf+pQY9b46IeXoWvgFw3V1eQzeGIGjVr5DpgE7ryMlZlFv5uTt/YTp1zJEKKkdPNdvM2tNv25v/VkX/hKjZ5u+oL33qU1bWqVv8/QMW9WhZ2u3y3v7ymuxYSx94Pg1Rny1IsSiPFIslEJFwjgYv3G6HQPVZMqwKQadpeO2kMFQIpMSRW8lrVbAvjM8Dlso3q1Eo0AztsnaP3cCMk5O2f639bkNEKTYVp5To8NGivfg5mf3A==
Received: from SG2PR06CA0236.apcprd06.prod.outlook.com (2603:1096:4:ac::20) by
 SEYPR04MB6821.apcprd04.prod.outlook.com (2603:1096:101:db::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19; Fri, 3 Nov 2023 03:31:48 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:ac:cafe::b6) by SG2PR06CA0236.outlook.office365.com
 (2603:1096:4:ac::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21 via Frontend
 Transport; Fri, 3 Nov 2023 03:31:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Fri, 3 Nov 2023 03:31:47
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 linux dev-6.5] hwmon: emc1403: Add support for EMC1442
Date: Fri,  3 Nov 2023 11:31:45 +0800
Message-Id: <20231103033145.1545459-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|SEYPR04MB6821:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f6272076-f44a-44c6-f3d7-08dbdc1d68e7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	uqPYkN8z4+DnZKJkElHHn1UQzkDUJK5sgMzixYVNfy1rUaXn8aUyy7fDGT3+3dzkouCYmmYUROvu0mclAyZAZBB9tDfKrREBfTw8GpHjStd09QIc5QSbr18O4kSOwdRSgQtTUP4dESp9CZq29iF0J0p9ln3Wg22bgMolr9xlgbrHBI6xF9yPzPjhnbohPG42UtE882VKy2JP6P2mT9jsLlTgPZpN/tNfcHXfXOICFAUIZkwU+V4VlpBVDRHQFGIl+k+wjojPiPBVLLk3VeyBmEfgL4FX4UMoTFaytGVxng7jvRzUZf5LBleWwhIY1AKrpeMkfj3kxtgk6K6HV0WkW3VZCWqW3xGUDqIvl+pzT5d3LhGbibHH2ghuiWyS70ut5gXoaEffeVFxxmEZ6Wbm6fUSyMVyW0Z14ON6ORIZIoJIztXM8iR6K2J/iFO1NxQbYQftepsuAquJcalA1hmIQzuzZFKgEihXAwpuxPjSEpYaRV0kcbC6iT8kkbmyf4AIIyxPbjQfdVSjSQ8ankhB9dsz9sCXtxd9Kmj3eytMQ0v/AGU5IhCSo+RzjJ0cQjsYVG1ubsq6tfsobz27yku1FeZvX5v1/PEry+0/vJQD2HrfqYcqNK94xhSbGOnJJ3JZqtdPZ13ynGCFDFuqjgqtzncEwN4fhgblb48dl5K8XG4voRYqyqONAsXa9c8YhcH2LEHx2s4OODrkczJPmgxCMA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(376002)(136003)(346002)(39860400002)(82310400011)(1800799009)(64100799003)(186009)(451199024)(36840700001)(46966006)(47076005)(956004)(70206006)(4326008)(5660300002)(70586007)(83380400001)(2616005)(356005)(26005)(81166007)(336012)(36860700001)(316002)(36736006)(8676002)(41300700001)(6506007)(6486002)(107886003)(6512007)(8936002)(2906002)(478600001)(82740400003)(36756003)(86362001)(9316004)(1076003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 03:31:47.2282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6272076-f44a-44c6-f3d7-08dbdc1d68e7
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6821
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

Add support for EMC1442 which is compatible with EMC1402.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
change in v2:
Revised emc1403 to emc1402
---
 drivers/hwmon/emc1403.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index bb7c859e799d..1332e4ac078c 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -346,6 +346,9 @@ static int emc1403_detect(struct i2c_client *client,
 	case 0x27:
 		strscpy(info->type, "emc1424", I2C_NAME_SIZE);
 		break;
+	case 0x60:
+		strscpy(info->type, "emc1442", I2C_NAME_SIZE);
+		break;
 	default:
 		return -ENODEV;
 	}
@@ -430,7 +433,7 @@ static int emc1403_probe(struct i2c_client *client)
 }
 
 static const unsigned short emc1403_address_list[] = {
-	0x18, 0x1c, 0x29, 0x4c, 0x4d, 0x5c, I2C_CLIENT_END
+	0x18, 0x1c, 0x29, 0x3c, 0x4c, 0x4d, 0x5c, I2C_CLIENT_END
 };
 
 /* Last digit of chip name indicates number of channels */
@@ -444,6 +447,7 @@ static const struct i2c_device_id emc1403_idtable[] = {
 	{ "emc1422", emc1402 },
 	{ "emc1423", emc1403 },
 	{ "emc1424", emc1404 },
+	{ "emc1442", emc1402 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, emc1403_idtable);
-- 
2.25.1

