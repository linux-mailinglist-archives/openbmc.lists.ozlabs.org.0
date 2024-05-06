Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1628BCC61
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2024 12:49:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Ihz4mDDV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXypm4bXZz30Np
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2024 20:49:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Ihz4mDDV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::61c; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXynG1Ybvz30TW
	for <openbmc@lists.ozlabs.org>; Mon,  6 May 2024 20:48:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcWjGY4Tz7LUE0YSPbbVrQzA3GYesjAMU/AW1TP4fNFyRPKbHc7a1RLalaaB5oPJfFHgHv+eIKlkY8jlYeImRj1pDcDiYPIJDt+VcROmWc0IzUnv8yv3tpSEoptz2EuYose0q7ySKxqoO4ozM0wkDEkFrLiQMDCfeJ5u4KQwEdvGiYLArqnbLJ3WJg8ijff4uzex1XlOnrAchpKO8yBUS+lyTOX5ZBpEd6mTb1HjXUzOCpFXj2bT4hly5oQYqrPtWZY7VUVOYjFFDTrzzlqo0ZakfNRgVGIamLJaIoUHk8AmI0bSd6ojv1ouAaV1+PZx+xQ+FQ9aAzYFp8MU02fF5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZrcEUAJfVaAPRVGTYxMpZ4pBbb23MwPzoTbOu9zKqs=;
 b=W0aNP7OjhWHciMZxQruNFyGiS8VnVkMLCKgT+HEcxZMZcs/P/CDpAlycgA/AEJwLreWVBCpmryaviya908OKLR0qCGIIXC1KCSCheo3sMtj2w2QIKw9oX4hJ7wTl72mDGYc+AWM7PGBnhLP+tFpFQovM2NtuUV4PSkONzYBy/omPggtv/CYiWs7zEliYjjnlM7XMrM0lDfz78uF3FihCWhv+vR0Flof7fqbBvE1I0RbnpXLlIBrOHrVbnyu54/1Ig0LiAmT0AYGBcrAHGuxD/aoOFV+quTwd2lvPaXwf2+glLIs8V8tgAC1swJOtdVyHw30AiPjFVBvSWPBmbZl4ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZrcEUAJfVaAPRVGTYxMpZ4pBbb23MwPzoTbOu9zKqs=;
 b=Ihz4mDDVn5dObjRGKWxbPrLSMQ/CohGKBeqQf8XvmMe/X4VmR3pQ1we//kAYVW6fDFxzJQHuGsMmSDJjcRJ9Pwj5AdSqtG+e76GgoKOR9mEJGuoTmet5Gr1wQcMivP818f4cnDp3KRH2JFJdMh7z2hrW1OV+qZN73IuQFXvJ5cVe1uXl5e9d2SWwpgL90hqEsNMW1TyVgUTR4W3VMUgfeq8hLn9GiWcG0UG/1BELHhU69i1F106/ulFEX4COmh4zMb5c988BKZ0id8SYicGMzUpyfYCAmR9FODguWgJPoTMkSBYg8weTotnq2GUv1LQQrpTQlGZXNraCH7GXt6wbQw==
Received: from SG2P153CA0029.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::16) by
 KL1PR04MB6925.apcprd04.prod.outlook.com (2603:1096:820:ca::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.39; Mon, 6 May 2024 10:48:06 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:c7:cafe::27) by SG2P153CA0029.outlook.office365.com
 (2603:1096:4:c7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.7 via Frontend
 Transport; Mon, 6 May 2024 10:48:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server id 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 10:48:05
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH dev 6.6 v1 0/2] i3c: backport mctp-i3c driver
Date: Mon,  6 May 2024 18:48:00 +0800
Message-Id: <20240506104802.1225466-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|KL1PR04MB6925:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d36ed271-5376-43fc-c86c-08dc6dba0294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|1800799015|36860700004|82310400017|376005;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?vFm0Bn2DZcdx2t9SkZ2MekJDPokvHbDA1hHGUtBB2BoexPycsmoGUDHfO+Rh?=
 =?us-ascii?Q?1niIlo1aLulOazAom8Gv3oAqB+lCTeFwVq4WCt1vMUcQme6332ws8XrW7uUH?=
 =?us-ascii?Q?lS5UFChoSU+QNd63XywkGffNR3ZdFxVADOZ5gi6v0c05pa2Q0VEJg2vwFeaQ?=
 =?us-ascii?Q?Sy10beAnAg8oxc1ZGlqHy/tR4K1SNXtopa2SvWwdS0FrXRuL7XgVdiyMQGUF?=
 =?us-ascii?Q?dLYm34LWGzyhxvTYF1XR+LBzPOZCGPa9Nl6lj9Eo9dY/f+Cn5lI9QlIf2TEN?=
 =?us-ascii?Q?n7f6S3NbDXxb8W5dhSy0CZWtm+sh+4mH4ZipB03CWWPYz0S0XyiphC9iAbfx?=
 =?us-ascii?Q?PDafqHwFXSTymAXbhICCAQaHUqBm5PIBSfSgS8wxrVHFw4OoxcWyYVp+mv5G?=
 =?us-ascii?Q?rJDYZ3oLu3XY3MK4hXWIdrMgAC74Kj81je+5L8OYIYW+zkCL4YP+FopoGoAs?=
 =?us-ascii?Q?90b3QjYHFQNPB6fxK0+liNJqQwEQN/u/4X5IvBOvsOmR7zy9pbOB4wavEvgL?=
 =?us-ascii?Q?pzIo3G+G+pidWVImz75NHGUy7uy22fQ+KalKy/gPC5cDNusZGxIiQlIy8/Nf?=
 =?us-ascii?Q?gdDuBY7BJfT53LynEPFXqN2389zyNUl+8Ods7x7B4dQeaEObRDL+KRUPXD/X?=
 =?us-ascii?Q?/RbkBgW2OqxSYOhxX7XWI8ZyB0u8KYESRS8Ydz7d6/epWf8xEyMudiZNPY6d?=
 =?us-ascii?Q?vUoGL7S9ucy844165INGqgTs8f1BA9Hr/8UD1JirUrXdXS1V0Q2dXTfOBm2x?=
 =?us-ascii?Q?uzhtFsPeYpudYUuSw731WcsnbXn1GUfh6cnc9VDG2tRjeTB8A/Bxipt3Fetv?=
 =?us-ascii?Q?HEmawsznAX5aSfs5Z2bmsQj7+zEUY6TXRy7OALh6ONBf1+CKBh+fw5u3efs8?=
 =?us-ascii?Q?WUI3O1XAroSZ/dKDXPcyrjxUE80aP+fwz0dC9MZtx92OOmjc54UEgk1rVy9p?=
 =?us-ascii?Q?KGP7L85Ajjwsqb/4e+z72nTEKV/gx+Q1i7UORZwtqHPShdMJn3H1B4fSXbco?=
 =?us-ascii?Q?mkipaZQflJ7Mw+mDWsjnrXnPppVmp4I6gWB9yEH4Ra381CCTtnfo3zXsDQ+v?=
 =?us-ascii?Q?cSXRTMjpVLOr9uIvIbT/0Z1Kc0tX8jAbSJh8ez5+4c62wj8ALKKhnIvSsrwG?=
 =?us-ascii?Q?nG+hJVcUSUxtfTk5Btiw/XSt861eKGZ73xqGdg12jLxu6pjemBn4r7yA0BS/?=
 =?us-ascii?Q?Yxt8moWdZIl0eQNbhRKQzwDXLm20p0SfYe7MCVmFUL3RwnjnzbJXbrifXND9?=
 =?us-ascii?Q?r0/dFg+80FEydJFboa83AZW9M+X7Bmzl8TrnVQBXRBOi44NHvDQCiK/wnbew?=
 =?us-ascii?Q?6oueb+VyX5a0AmyoyR6YpKzuxBhM5C/st9ny3ZEzk9J8TLD1nRR3wD5O1Ws1?=
 =?us-ascii?Q?L9skMVSNMaUA1wuVfEWpbk+XBFCi?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400017)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 10:48:05.1448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d36ed271-5376-43fc-c86c-08dc6dba0294
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB6925
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

Backport mctp-i3c driver from torvalds/linux.
Also need to backport the commit to support for bus enumeration 
& notification for mctp-i3c driver.

Jeremy Kerr (1):
  i3c: Add support for bus enumeration & notification

Matt Johnston (1):
  mctp i3c: MCTP I3C driver

 drivers/i3c/master.c        |  35 ++
 drivers/net/mctp/Kconfig    |   9 +
 drivers/net/mctp/Makefile   |   1 +
 drivers/net/mctp/mctp-i3c.c | 755 ++++++++++++++++++++++++++++++++++++
 include/linux/i3c/master.h  |  11 +
 5 files changed, 811 insertions(+)
 create mode 100644 drivers/net/mctp/mctp-i3c.c

-- 
2.25.1

