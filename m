Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD95A2B55C
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2025 23:43:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpsZ90WNWz3bcp
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2025 09:42:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200f::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738811291;
	cv=pass; b=VgUplxaekaiC2I/iP/fOHdekEDX9l0k6e1l/AzY5Fc9VoBDVqjNOI1EkDoCGYn8T3jgELLiNd5c4l3zCxZbmczsJI4P2iGAJKMo0woazKvYFyKxdITJaW2YYelonuVQLBxz4Q/VbQKoI0cEHlNAkRkMoIKQCNXjsAGk1vpqYwHGjRxU9zmFrvFyQo74vfRkGNWpxHHziAtbPGgq4b5rTXUhUMzc2LYHtic126otpqH/1EXYMq2/Mhp/JTQ23S+U2I8eiYR9JEiI5A5H8a3VVmChHmrewPof33gC+AwTvXtEAqiL/DoM+UkBRalM6xVu/BbHUzUZX6KE21PwCitXOBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738811291; c=relaxed/relaxed;
	bh=OLHobG6HemzZ2qiAhMIK5p0YMAVaquD/nGgs+deIgq8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=U75Dju81mzEEjx9m6ApoZCgAmxBS4l78yMNBjW8h8OszghPsjl1nTpw8uZEILtP9/iOruVPLHuHqKVq7Z1mWfpwb6bcLAcXGkWlHRnIaOcItmhrRHCh9d0xUENhEnrRcbBDkjZeXPpLbAw8N7ve42dPxgoQlXWWaVL8TZ3knGHDD+2KGqLlIDI4bzTUEFwVqkTHZO0pZ0klv2uCNkRNeyhAW39HgJprcgpuZWS6czyvsJASfgZ5KAbWfwruWejUk8OEIGYWTcmycvZ7oH3CYtD3Hmv3dhk+FU9rGU+xHJ+ZkEhm9d7RjVvAeE63IN9cCnTOYGFDBisdED2hcqiV1Aw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=QfOmzN5l; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200f::610; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=rush_chen@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=QfOmzN5l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:200f::610; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=rush_chen@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:200f::610])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpMVd3dpKz2yZ6
	for <openbmc@lists.ozlabs.org>; Thu,  6 Feb 2025 14:08:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZFBvgkbGdspUqGmMFv1VVsBilXobpu4Dy0iiLI/51VIdPqTBkOTBNcSR/40iN4fFKhENZ6zfWppMyla1QhYGi36xD3sXmDtCgp3r6BqT+padMk+AyF4ZNlAUrxHuEzhXRIwvD8AXbANQkyI21X7rqBQHiPH7HatL6XH9LFHc+MFZ/34RTdZIerYb6lwEl7y2K+sMrp8Uk9lp4466gDDeAWu8foX12LrG9UU9sZ2HkyseX6J/XULhxrCJKaUtas3MVPdHNrsE0qZpimnLQOr4ORxextAfI1EVKNT57RtnLlnxf8wIV7SyB1irXPRjxZdSuZQmQez6i9P+O/87TMhmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLHobG6HemzZ2qiAhMIK5p0YMAVaquD/nGgs+deIgq8=;
 b=igdzqpOKeHgQe5fHvB3/wshHwPqWqzZMFHKe+yq/qKXvWx1sk+Q2iqOvLcRPGUA84lCQGd2LdpmKaOcnkjm2tw37F/+wvnVh9T+xypIHjKkfZl1BfDrzhKRXzFs5VZpraJSvAunVDr07gdcep0+EpjJnPs91cc/i8qvTMKXz6C+McgN3kbNyEYn6xJ7oT6pmKfMKv3bgfg2n1H/NIcgxDMsfSDYVDIQEwDIcp5r0BbCF6XWtfrMNEccYo21SA1Qg0WTRqkHMQ/YMB+lnJoUFaIPyavrfAxWy0tCNyUMykmyB3k5qs9+wvcOIawdWqyfCtwKX72g25/IWEAplW32W0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=wiwynn.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLHobG6HemzZ2qiAhMIK5p0YMAVaquD/nGgs+deIgq8=;
 b=QfOmzN5l1UXc8hT/Mam6Ca6QfTt+qTTz1X3QS3SCsZuh0/afiFuqUE2pD8rtL5vIt2mGR3NnAGUDIEn3yvkxLKIxjn6+6E/gyeLSI8Xcf3gLQVF/q3/+cq22yalop3POqEPowMLB8BMcZXhEIYVqgxyUjzlYcIZoVMOhx9sFGitAutbLJv3QuwHP/s85K6ZXhz7kopc3FMYetFedMITMxuWKon7JFLyqzKzum1heuHOV8EjmB8vUrIOGDnGHdP5Z+Uo4cPDm3WCnds/Ubc9DHGm07dSTge23uS/vMuXoauMnPso0IllYlMRAE+MLPz5zhPoDp9ibnu4wEs9ge+BbEA==
Received: from SG2PR01CA0143.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::23) by TYZPR04MB6304.apcprd04.prod.outlook.com
 (2603:1096:400:28a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 03:07:50 +0000
Received: from SG1PEPF000082E1.apcprd02.prod.outlook.com
 (2603:1096:4:8f:cafe::ab) by SG2PR01CA0143.outlook.office365.com
 (2603:1096:4:8f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Thu,
 6 Feb 2025 03:07:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E1.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server id 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 03:07:48
 +0000
From: Rush Chen <rush_chen@wiwynn.com>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH linux dev-6.6] A backport request for SY24655 driver in INA2XX driver for Linux kernel 6.6.
Date: Thu,  6 Feb 2025 11:07:45 +0800
Message-Id: <20250206030747.268165-1-rush_chen@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E1:EE_|TYZPR04MB6304:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 098f5013-ae24-437c-75c9-08dd465b7001
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?EYL0Eku7PBaPZL87sNuFk2cmMuiaWHa0QnSM+VMGl4SH3dzN8kMMCH86v5j1?=
 =?us-ascii?Q?Q8dn2AkVghH0RUkfCtRMPUXwA6oDmz8cralughT67OfX3AXx58tyhmWU3vCe?=
 =?us-ascii?Q?nQ1FVvqH+sdiu59/XpR9qEFffHfdGTJBkuVLzR/yGesO+wUE1xKHHe5n6wKK?=
 =?us-ascii?Q?ejeRuPITPPL+CyRg3M7BZGX9PNUX/axdd7cB8w5nJs0qIjd5p3whMiG4Vafz?=
 =?us-ascii?Q?/Nm4MfazMMMg2nrU+MkQy8YpDAqN4eGFpO4vsV+jSpDhi8bcJD5ykQs28wEV?=
 =?us-ascii?Q?HvHqJEI2Gh8N3n8nWeWBvCn11cdvRayd/R3Mo+xSzh75XBjPlivc7QqVY8pZ?=
 =?us-ascii?Q?7g355Cv5d2H5QOD0CsJhB+V6S4gUOuJk7X2gGODvx3M+eZqKX6ziquX+HkNW?=
 =?us-ascii?Q?aJVk6RIBTjC4CcLIiGaSSoMtle0vuNXXVmSArts8r7BMEGgg7YZssQs9eFuE?=
 =?us-ascii?Q?EYpWjb80bolBEUHmn2lO+ELo8oqMcv+Ifw0B3HkemVoCSgJigydfP3fkydX8?=
 =?us-ascii?Q?u1/p8FC3Sbk0NSgLqmwFNMiOfgr4onw3VT3Dpk3UM/GTk2DIqCJ7RpGrTImw?=
 =?us-ascii?Q?ywpYVfhNgdq7SpSmRfnTb31JY6t4SF6HT6GCHz1G3QAMEmyTC9nxQrB43Vkx?=
 =?us-ascii?Q?qXoMzjD3NwU5r+CiUBzyi26VJMNBQN9uTkD2usz4Yu2B46hVG90xaNOaLYXw?=
 =?us-ascii?Q?LbTt/lE1e1TcqSxqGTRm8KuMM2Kpiv5NQaMingq+6xANuK3o/28bMxKYIPN0?=
 =?us-ascii?Q?SNkoWev+KUS1f2hLMGSPQiVbPitqLj/5sJPSGBTr8OFNSVNnYPojNPQn0fLJ?=
 =?us-ascii?Q?IxN6q6/d6rxZW50P1D/BPfgfmti7ROEyBeJgcQ0Jg+IOjRqvaNiX6h7C/9pI?=
 =?us-ascii?Q?knF2C8ZCin/ss5tmJHHsegcBvnXPe+b13p2+1uVQ9y7E7/21ozte6EN2MvaS?=
 =?us-ascii?Q?usvv7e9FX/tQCbEXP92TOb/Nfp+YzzgfUojBODoExng3eY0PMQfO/6rW0ZWr?=
 =?us-ascii?Q?KDqeZ+T2PsMsqmRruTJXb2UkvqUhxktMrqWU4l8384xvt89SmZoAVNMuoPpz?=
 =?us-ascii?Q?S4tpt1E9fXPddFzH4DxonWb8EDVLFk4nDMyNcNLRWS23pQheZjEYHM5H+t3e?=
 =?us-ascii?Q?BFncHh8hsu4BhOJ3mC4n8rECArn1SiihpUIx6iDLGTrbPCNzlLwTCI8mDCei?=
 =?us-ascii?Q?X1M8A0QUn64+3lBFu5/glSLFhYJ5pk/AwB19w5voTqT+Pju/QEW5nxAxejjw?=
 =?us-ascii?Q?fC4O68kUdYJiUpnIOEdPYoaJkFKLiYnrwtSv2QqSuSinok6LcXua5rvOmdDy?=
 =?us-ascii?Q?2rZjqMs6EN3Mg/1nqnGV8hZrDjVLBZ1Dd1ML47UxynVGB1I98UI0X/LVS006?=
 =?us-ascii?Q?z+ZW0/JjVxeiN2C4+EOmdRTmkgLfP/GXjcyt0Z9XEd1Kgxn3MPSuotJlXdHO?=
 =?us-ascii?Q?BXXfUgmmJbc=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 03:07:48.5965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 098f5013-ae24-437c-75c9-08dd465b7001
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB6304
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Fri, 07 Feb 2025 09:42:53 +1100
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
Cc: linux-hwmon@vger.kernel.org, Rush Chen <Rush_Chen@wiwynn.com>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Rush Chen <Rush_Chen@wiwynn.com>

Summary:
The driver SY24655 has been supported by INA2XX driver,
since Linux kernel version 6.13.

Issue a backport request to Linux kernel 6.6.

Signed-off-by: Rush Chen <Rush_Chen@wiwynn.com>
---
 Documentation/hwmon/ina2xx.rst |  50 +-
 drivers/hwmon/Kconfig          |   2 +-
 drivers/hwmon/ina2xx.c         | 988 ++++++++++++++++++++++-----------
 3 files changed, 695 insertions(+), 345 deletions(-)

diff --git a/Documentation/hwmon/ina2xx.rst b/Documentation/hwmon/ina2xx.rs=
t
index 27d2e39bc8ac..a3860aae444c 100644
--- a/Documentation/hwmon/ina2xx.rst
+++ b/Documentation/hwmon/ina2xx.rst
@@ -53,6 +53,27 @@ Supported chips:

               https://www.ti.com/

+  * Texas Instruments INA260
+
+    Prefix: 'ina260'
+
+    Addresses: I2C 0x40 - 0x4f
+
+    Datasheet: Publicly available at the Texas Instruments website
+
+              https://www.ti.com/
+
+  * Silergy SY24655
+
+    Prefix: 'sy24655'
+
+    Addresses: I2C 0x40 - 0x4f
+
+    Datasheet: Publicly available at the Silergy website
+
+              https://us1.silergy.com/
+
+
 Author: Lothar Felten <lothar.felten@gmail.com>

 Description
@@ -72,6 +93,14 @@ INA230 and INA231 are high or low side current shunt and=
 power monitors
 with an I2C interface. The chips monitor both a shunt voltage drop and
 bus supply voltage.

+INA260 is a high or low side current and power monitor with integrated shu=
nt
+resistor.
+
+The SY24655 is a high- and low-side current shunt and power monitor with a=
n I2C
+interface. The SY24655 supports both shunt drop and supply voltage, with
+programmable calibration value and conversion times. The SY24655 can also
+calculate average power for use in energy conversion.
+
 The shunt value in micro-ohms can be set via platform data or device tree =
at
 compile-time or via the shunt_resistor attribute in sysfs at run-time. Ple=
ase
 refer to the Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml for bi=
ndings
@@ -87,18 +116,22 @@ The actual programmed interval may vary from the desir=
ed value.
 General sysfs entries
 ---------------------

-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 in0_input              Shunt voltage(mV) channel
 in1_input              Bus voltage(mV) channel
 curr1_input            Current(mA) measurement channel
 power1_input           Power(uW) measurement channel
-shunt_resistor         Shunt resistance(uOhm) channel
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+shunt_resistor         Shunt resistance(uOhm) channel (not for ina260)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

-Sysfs entries for ina226, ina230 and ina231 only
-------------------------------------------------
+Additional sysfs entries for ina226, ina230, ina231, ina260, and sy24655
+------------------------------------------------------------------------

 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+curr1_lcrit            Critical low current
+curr1_crit             Critical high current
+curr1_lcrit_alarm      Current critical low alarm
+curr1_crit_alarm       Current critical high alarm
 in0_lcrit              Critical low shunt voltage
 in0_crit               Critical high shunt voltage
 in0_lcrit_alarm                Shunt voltage critical low alarm
@@ -113,6 +146,13 @@ update_interval            data conversion time; affec=
ts number of samples used
                        to average results for shunt and bus voltages.
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

+Sysfs entries for sy24655 only
+------------------------------
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+power1_average         average power from last reading to the present.
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
 .. note::

    - Configure `shunt_resistor` before configure `power1_crit`, because po=
wer
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 97318b9237af..abb437e5f8a0 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2042,7 +2042,7 @@ config SENSORS_INA2XX
        select REGMAP_I2C
        help
          If you say yes here you get support for INA219, INA220, INA226,
-         INA230, and INA231 power monitor chips.
+         INA230, INA231, INA260, and SY24655 power monitor chips.

          The INA2xx driver is configured for the default configuration of
          the part as described in the datasheet.
diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index d8415d1f21fc..345fe7db9de9 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -22,21 +22,21 @@
  * Thanks to Jan Volkering
  */

+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/init.h>
-#include <linux/err.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
-#include <linux/i2c.h>
-#include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
-#include <linux/jiffies.h>
-#include <linux/of.h>
-#include <linux/delay.h>
+#include <linux/sysfs.h>
 #include <linux/util_macros.h>
-#include <linux/regmap.h>
-
-#include <linux/platform_data/ina2xx.h>

 /* common register definitions */
 #define INA2XX_CONFIG                  0x00
@@ -51,59 +51,98 @@
 #define INA226_ALERT_LIMIT             0x07
 #define INA226_DIE_ID                  0xFF

-/* register count */
-#define INA219_REGISTERS               6
-#define INA226_REGISTERS               8
-
-#define INA2XX_MAX_REGISTERS           8
+/* SY24655 register definitions */
+#define SY24655_EIN                            0x0A
+#define SY24655_ACCUM_CONFIG   0x0D
+#define INA2XX_MAX_REGISTERS           0x0D

 /* settings - depend on use case */
 #define INA219_CONFIG_DEFAULT          0x399F  /* PGA=3D8 */
 #define INA226_CONFIG_DEFAULT          0x4527  /* averages=3D16 */
+#define INA260_CONFIG_DEFAULT          0x6527  /* averages=3D16 */
+#define SY24655_CONFIG_DEFAULT         0x4527  /* averages=3D16 */
+
+/* (only for sy24655) */
+#define SY24655_ACCUM_CONFIG_DEFAULT   0x044C  /* continuous mode, clear a=
fter read*/

 /* worst case is 68.10 ms (~14.6Hz, ina219) */
 #define INA2XX_CONVERSION_RATE         15
 #define INA2XX_MAX_DELAY               69 /* worst case delay in ms */

 #define INA2XX_RSHUNT_DEFAULT          10000
+#define INA260_RSHUNT                  2000

 /* bit mask for reading the averaging setting in the configuration registe=
r */
-#define INA226_AVG_RD_MASK             0x0E00
+#define INA226_AVG_RD_MASK             GENMASK(11, 9)

-#define INA226_READ_AVG(reg)           (((reg) & INA226_AVG_RD_MASK) >> 9)
-#define INA226_SHIFT_AVG(val)          ((val) << 9)
+#define INA226_READ_AVG(reg)           FIELD_GET(INA226_AVG_RD_MASK, reg)
+
+#define INA226_ALERT_LATCH_ENABLE      BIT(0)
+#define INA226_ALERT_POLARITY          BIT(1)

 /* bit number of alert functions in Mask/Enable Register */
-#define INA226_SHUNT_OVER_VOLTAGE_BIT  15
-#define INA226_SHUNT_UNDER_VOLTAGE_BIT 14
-#define INA226_BUS_OVER_VOLTAGE_BIT    13
-#define INA226_BUS_UNDER_VOLTAGE_BIT   12
-#define INA226_POWER_OVER_LIMIT_BIT    11
+#define INA226_SHUNT_OVER_VOLTAGE_MASK BIT(15)
+#define INA226_SHUNT_UNDER_VOLTAGE_MASK        BIT(14)
+#define INA226_BUS_OVER_VOLTAGE_MASK   BIT(13)
+#define INA226_BUS_UNDER_VOLTAGE_MASK  BIT(12)
+#define INA226_POWER_OVER_LIMIT_MASK   BIT(11)

 /* bit mask for alert config bits of Mask/Enable Register */
-#define INA226_ALERT_CONFIG_MASK       0xFC00
+#define INA226_ALERT_CONFIG_MASK       GENMASK(15, 10)
 #define INA226_ALERT_FUNCTION_FLAG     BIT(4)

-/* common attrs, ina226 attrs and NULL */
-#define INA2XX_MAX_ATTRIBUTE_GROUPS    3
-
 /*
  * Both bus voltage and shunt voltage conversion times for ina226 are set
  * to 0b0100 on POR, which translates to 2200 microseconds in total.
  */
 #define INA226_TOTAL_CONV_TIME_DEFAULT 2200

-static struct regmap_config ina2xx_regmap_config =3D {
+static bool ina2xx_writeable_reg(struct device *dev, unsigned int reg)
+{
+       switch (reg) {
+       case INA2XX_CONFIG:
+       case INA2XX_CALIBRATION:
+       case INA226_MASK_ENABLE:
+       case INA226_ALERT_LIMIT:
+       case SY24655_ACCUM_CONFIG:
+               return true;
+       default:
+               return false;
+       }
+}
+
+static bool ina2xx_volatile_reg(struct device *dev, unsigned int reg)
+{
+       switch (reg) {
+       case INA2XX_SHUNT_VOLTAGE:
+       case INA2XX_BUS_VOLTAGE:
+       case INA2XX_POWER:
+       case INA2XX_CURRENT:
+               return true;
+       default:
+               return false;
+       }
+}
+
+static const struct regmap_config ina2xx_regmap_config =3D {
        .reg_bits =3D 8,
        .val_bits =3D 16,
+       .use_single_write =3D true,
+       .use_single_read =3D true,
+       .max_register =3D INA2XX_MAX_REGISTERS,
+       .cache_type =3D REGCACHE_MAPLE,
+       .volatile_reg =3D ina2xx_volatile_reg,
+       .writeable_reg =3D ina2xx_writeable_reg,
 };

-enum ina2xx_ids { ina219, ina226 };
+enum ina2xx_ids { ina219, ina226, ina260, sy24655 };

 struct ina2xx_config {
        u16 config_default;
+       bool has_alerts;        /* chip supports alerts and limits */
+       bool has_ishunt;        /* chip has internal shunt resistor */
+       bool has_power_average; /* chip has internal shunt resistor */
        int calibration_value;
-       int registers;
        int shunt_div;
        int bus_voltage_shift;
        int bus_voltage_lsb;    /* uV */
@@ -112,34 +151,59 @@ struct ina2xx_config {

 struct ina2xx_data {
        const struct ina2xx_config *config;
+       enum ina2xx_ids chip;

        long rshunt;
        long current_lsb_uA;
        long power_lsb_uW;
        struct mutex config_lock;
        struct regmap *regmap;
-
-       const struct attribute_group *groups[INA2XX_MAX_ATTRIBUTE_GROUPS];
+       struct i2c_client *client;
 };

 static const struct ina2xx_config ina2xx_config[] =3D {
        [ina219] =3D {
                .config_default =3D INA219_CONFIG_DEFAULT,
                .calibration_value =3D 4096,
-               .registers =3D INA219_REGISTERS,
                .shunt_div =3D 100,
                .bus_voltage_shift =3D 3,
                .bus_voltage_lsb =3D 4000,
                .power_lsb_factor =3D 20,
+               .has_alerts =3D false,
+               .has_ishunt =3D false,
+               .has_power_average =3D false,
        },
        [ina226] =3D {
                .config_default =3D INA226_CONFIG_DEFAULT,
                .calibration_value =3D 2048,
-               .registers =3D INA226_REGISTERS,
                .shunt_div =3D 400,
                .bus_voltage_shift =3D 0,
                .bus_voltage_lsb =3D 1250,
                .power_lsb_factor =3D 25,
+               .has_alerts =3D true,
+               .has_ishunt =3D false,
+               .has_power_average =3D false,
+       },
+       [ina260] =3D {
+               .config_default =3D INA260_CONFIG_DEFAULT,
+               .shunt_div =3D 400,
+               .bus_voltage_shift =3D 0,
+               .bus_voltage_lsb =3D 1250,
+               .power_lsb_factor =3D 8,
+               .has_alerts =3D true,
+               .has_ishunt =3D true,
+               .has_power_average =3D false,
+       },
+       [sy24655] =3D {
+               .config_default =3D SY24655_CONFIG_DEFAULT,
+               .calibration_value =3D 4096,
+               .shunt_div =3D 400,
+               .bus_voltage_shift =3D 0,
+               .bus_voltage_lsb =3D 1250,
+               .power_lsb_factor =3D 25,
+               .has_alerts =3D true,
+               .has_ishunt =3D false,
+               .has_power_average =3D true,
        },
 };

@@ -166,58 +230,85 @@ static int ina226_reg_to_interval(u16 config)
  * Return the new, shifted AVG field value of CONFIG register,
  * to use with regmap_update_bits
  */
-static u16 ina226_interval_to_reg(int interval)
+static u16 ina226_interval_to_reg(long interval)
 {
        int avg, avg_bits;

+       /*
+        * The maximum supported interval is 1,024 * (2 * 8.244ms) ~=3D 16.=
8s.
+        * Clamp to 32 seconds before calculations to avoid overflows.
+        */
+       interval =3D clamp_val(interval, 0, 32000);
+
        avg =3D DIV_ROUND_CLOSEST(interval * 1000,
                                INA226_TOTAL_CONV_TIME_DEFAULT);
        avg_bits =3D find_closest(avg, ina226_avg_tab,
                                ARRAY_SIZE(ina226_avg_tab));

-       return INA226_SHIFT_AVG(avg_bits);
+       return FIELD_PREP(INA226_AVG_RD_MASK, avg_bits);
 }

-/*
- * Calibration register is set to the best value, which eliminates
- * truncation errors on calculating current register in hardware.
- * According to datasheet (eq. 3) the best values are 2048 for
- * ina226 and 4096 for ina219. They are hardcoded as calibration_value.
- */
-static int ina2xx_calibrate(struct ina2xx_data *data)
+static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
+                           unsigned int regval)
 {
-       return regmap_write(data->regmap, INA2XX_CALIBRATION,
-                           data->config->calibration_value);
-}
+       int val;

-/*
- * Initialize the configuration and calibration registers.
- */
-static int ina2xx_init(struct ina2xx_data *data)
-{
-       int ret =3D regmap_write(data->regmap, INA2XX_CONFIG,
-                              data->config->config_default);
-       if (ret < 0)
-               return ret;
+       switch (reg) {
+       case INA2XX_SHUNT_VOLTAGE:
+               /* signed register */
+               val =3D DIV_ROUND_CLOSEST((s16)regval, data->config->shunt_=
div);
+               break;
+       case INA2XX_BUS_VOLTAGE:
+               val =3D (regval >> data->config->bus_voltage_shift) *
+                 data->config->bus_voltage_lsb;
+               val =3D DIV_ROUND_CLOSEST(val, 1000);
+               break;
+       case INA2XX_POWER:
+               val =3D regval * data->power_lsb_uW;
+               break;
+       case INA2XX_CURRENT:
+               /* signed register, result in mA */
+               val =3D (s16)regval * data->current_lsb_uA;
+               val =3D DIV_ROUND_CLOSEST(val, 1000);
+               break;
+       case INA2XX_CALIBRATION:
+               val =3D regval;
+               break;
+       default:
+               /* programmer goofed */
+               WARN_ON_ONCE(1);
+               val =3D 0;
+               break;
+       }

-       return ina2xx_calibrate(data);
+       return val;
 }

-static int ina2xx_read_reg(struct device *dev, int reg, unsigned int *regv=
al)
+/*
+ * Read and convert register value from chip. If the register value is 0,
+ * check if the chip has been power cycled or reset. If so, re-initialize =
it.
+ */
+static int ina2xx_read_init(struct device *dev, int reg, long *val)
 {
        struct ina2xx_data *data =3D dev_get_drvdata(dev);
+       struct regmap *regmap =3D data->regmap;
+       unsigned int regval;
        int ret, retry;

-       dev_dbg(dev, "Starting register %d read\n", reg);
+       if (data->config->has_ishunt) {
+               /* No calibration needed */
+               ret =3D regmap_read(regmap, reg, &regval);
+               if (ret < 0)
+                       return ret;
+               *val =3D ina2xx_get_value(data, reg, regval);
+               return 0;
+       }

        for (retry =3D 5; retry; retry--) {
-
-               ret =3D regmap_read(data->regmap, reg, regval);
+               ret =3D regmap_read(regmap, reg, &regval);
                if (ret < 0)
                        return ret;

-               dev_dbg(dev, "read %d, val =3D 0x%04x\n", reg, *regval);
-
                /*
                 * If the current value in the calibration register is 0, t=
he
                 * power and current registers will also remain at 0. In ca=
se
@@ -226,20 +317,19 @@ static int ina2xx_read_reg(struct device *dev, int re=
g, unsigned int *regval)
                 * We do that extra read of the calibration register if the=
re
                 * is some hint of a chip reset.
                 */
-               if (*regval =3D=3D 0) {
+               if (regval =3D=3D 0) {
                        unsigned int cal;

-                       ret =3D regmap_read(data->regmap, INA2XX_CALIBRATIO=
N,
-                                         &cal);
+                       ret =3D regmap_read_bypassed(regmap, INA2XX_CALIBRA=
TION, &cal);
                        if (ret < 0)
                                return ret;

                        if (cal =3D=3D 0) {
                                dev_warn(dev, "chip not calibrated, reiniti=
alizing\n");

-                               ret =3D ina2xx_init(data);
-                               if (ret < 0)
-                                       return ret;
+                               regcache_mark_dirty(regmap);
+                               regcache_sync(regmap);
+
                                /*
                                 * Let's make sure the power and current
                                 * registers have been updated before tryin=
g
@@ -249,6 +339,7 @@ static int ina2xx_read_reg(struct device *dev, int reg,=
 unsigned int *regval)
                                continue;
                        }
                }
+               *val =3D ina2xx_get_value(data, reg, regval);
                return 0;
        }

@@ -261,101 +352,31 @@ static int ina2xx_read_reg(struct device *dev, int r=
eg, unsigned int *regval)
        return -ENODEV;
 }

-static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
-                           unsigned int regval)
-{
-       int val;
-
-       switch (reg) {
-       case INA2XX_SHUNT_VOLTAGE:
-               /* signed register */
-               val =3D DIV_ROUND_CLOSEST((s16)regval, data->config->shunt_=
div);
-               break;
-       case INA2XX_BUS_VOLTAGE:
-               val =3D (regval >> data->config->bus_voltage_shift)
-                 * data->config->bus_voltage_lsb;
-               val =3D DIV_ROUND_CLOSEST(val, 1000);
-               break;
-       case INA2XX_POWER:
-               val =3D regval * data->power_lsb_uW;
-               break;
-       case INA2XX_CURRENT:
-               /* signed register, result in mA */
-               val =3D (s16)regval * data->current_lsb_uA;
-               val =3D DIV_ROUND_CLOSEST(val, 1000);
-               break;
-       case INA2XX_CALIBRATION:
-               val =3D regval;
-               break;
-       default:
-               /* programmer goofed */
-               WARN_ON_ONCE(1);
-               val =3D 0;
-               break;
-       }
-
-       return val;
-}
-
-static ssize_t ina2xx_value_show(struct device *dev,
-                                struct device_attribute *da, char *buf)
-{
-       struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
-       struct ina2xx_data *data =3D dev_get_drvdata(dev);
-       unsigned int regval;
-
-       int err =3D ina2xx_read_reg(dev, attr->index, &regval);
-
-       if (err < 0)
-               return err;
-
-       return sysfs_emit(buf, "%d\n", ina2xx_get_value(data, attr->index, =
regval));
-}
-
-static int ina226_reg_to_alert(struct ina2xx_data *data, u8 bit, u16 regva=
l)
-{
-       int reg;
-
-       switch (bit) {
-       case INA226_SHUNT_OVER_VOLTAGE_BIT:
-       case INA226_SHUNT_UNDER_VOLTAGE_BIT:
-               reg =3D INA2XX_SHUNT_VOLTAGE;
-               break;
-       case INA226_BUS_OVER_VOLTAGE_BIT:
-       case INA226_BUS_UNDER_VOLTAGE_BIT:
-               reg =3D INA2XX_BUS_VOLTAGE;
-               break;
-       case INA226_POWER_OVER_LIMIT_BIT:
-               reg =3D INA2XX_POWER;
-               break;
-       default:
-               /* programmer goofed */
-               WARN_ON_ONCE(1);
-               return 0;
-       }
-
-       return ina2xx_get_value(data, reg, regval);
-}
-
 /*
  * Turns alert limit values into register values.
  * Opposite of the formula in ina2xx_get_value().
  */
-static s16 ina226_alert_to_reg(struct ina2xx_data *data, u8 bit, int val)
+static u16 ina226_alert_to_reg(struct ina2xx_data *data, int reg, long val=
)
 {
-       switch (bit) {
-       case INA226_SHUNT_OVER_VOLTAGE_BIT:
-       case INA226_SHUNT_UNDER_VOLTAGE_BIT:
+       switch (reg) {
+       case INA2XX_SHUNT_VOLTAGE:
+               val =3D clamp_val(val, 0, SHRT_MAX * data->config->shunt_di=
v);
                val *=3D data->config->shunt_div;
-               return clamp_val(val, SHRT_MIN, SHRT_MAX);
-       case INA226_BUS_OVER_VOLTAGE_BIT:
-       case INA226_BUS_UNDER_VOLTAGE_BIT:
+               return clamp_val(val, 0, SHRT_MAX);
+       case INA2XX_BUS_VOLTAGE:
+               val =3D clamp_val(val, 0, 200000);
                val =3D (val * 1000) << data->config->bus_voltage_shift;
                val =3D DIV_ROUND_CLOSEST(val, data->config->bus_voltage_ls=
b);
-               return clamp_val(val, 0, SHRT_MAX);
-       case INA226_POWER_OVER_LIMIT_BIT:
+               return clamp_val(val, 0, USHRT_MAX);
+       case INA2XX_POWER:
+               val =3D clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);
                val =3D DIV_ROUND_CLOSEST(val, data->power_lsb_uW);
                return clamp_val(val, 0, USHRT_MAX);
+       case INA2XX_CURRENT:
+               val =3D clamp_val(val, INT_MIN / 1000, INT_MAX / 1000);
+               /* signed register, result in mA */
+               val =3D DIV_ROUND_CLOSEST(val * 1000, data->current_lsb_uA)=
;
+               return clamp_val(val, SHRT_MIN, SHRT_MAX);
        default:
                /* programmer goofed */
                WARN_ON_ONCE(1);
@@ -363,45 +384,37 @@ static s16 ina226_alert_to_reg(struct ina2xx_data *da=
ta, u8 bit, int val)
        }
 }

-static ssize_t ina226_alert_show(struct device *dev,
-                                struct device_attribute *da, char *buf)
+static int ina226_alert_limit_read(struct ina2xx_data *data, u32 mask, int=
 reg, long *val)
 {
-       struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
-       struct ina2xx_data *data =3D dev_get_drvdata(dev);
+       struct regmap *regmap =3D data->regmap;
        int regval;
-       int val =3D 0;
        int ret;

        mutex_lock(&data->config_lock);
-       ret =3D regmap_read(data->regmap, INA226_MASK_ENABLE, &regval);
+       ret =3D regmap_read(regmap, INA226_MASK_ENABLE, &regval);
        if (ret)
                goto abort;

-       if (regval & BIT(attr->index)) {
-               ret =3D regmap_read(data->regmap, INA226_ALERT_LIMIT, &regv=
al);
+       if (regval & mask) {
+               ret =3D regmap_read(regmap, INA226_ALERT_LIMIT, &regval);
                if (ret)
                        goto abort;
-               val =3D ina226_reg_to_alert(data, attr->index, regval);
+               *val =3D ina2xx_get_value(data, reg, regval);
+       } else {
+               *val =3D 0;
        }
-
-       ret =3D sysfs_emit(buf, "%d\n", val);
 abort:
        mutex_unlock(&data->config_lock);
        return ret;
 }

-static ssize_t ina226_alert_store(struct device *dev,
-                                 struct device_attribute *da,
-                                 const char *buf, size_t count)
+static int ina226_alert_limit_write(struct ina2xx_data *data, u32 mask, in=
t reg, long val)
 {
-       struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
-       struct ina2xx_data *data =3D dev_get_drvdata(dev);
-       unsigned long val;
+       struct regmap *regmap =3D data->regmap;
        int ret;

-       ret =3D kstrtoul(buf, 10, &val);
-       if (ret < 0)
-               return ret;
+       if (val < 0)
+               return -EINVAL;

        /*
         * Clear all alerts first to avoid accidentally triggering ALERT pi=
n
@@ -409,246 +422,537 @@ static ssize_t ina226_alert_store(struct device *de=
v,
         * if the value is non-zero.
         */
        mutex_lock(&data->config_lock);
-       ret =3D regmap_update_bits(data->regmap, INA226_MASK_ENABLE,
+       ret =3D regmap_update_bits(regmap, INA226_MASK_ENABLE,
                                 INA226_ALERT_CONFIG_MASK, 0);
        if (ret < 0)
                goto abort;

-       ret =3D regmap_write(data->regmap, INA226_ALERT_LIMIT,
-                          ina226_alert_to_reg(data, attr->index, val));
+       ret =3D regmap_write(regmap, INA226_ALERT_LIMIT,
+                          ina226_alert_to_reg(data, reg, val));
        if (ret < 0)
                goto abort;

-       if (val !=3D 0) {
-               ret =3D regmap_update_bits(data->regmap, INA226_MASK_ENABLE=
,
-                                        INA226_ALERT_CONFIG_MASK,
-                                        BIT(attr->index));
-               if (ret < 0)
-                       goto abort;
-       }
-
-       ret =3D count;
+       if (val)
+               ret =3D regmap_update_bits(regmap, INA226_MASK_ENABLE,
+                                        INA226_ALERT_CONFIG_MASK, mask);
 abort:
        mutex_unlock(&data->config_lock);
        return ret;
 }

-static ssize_t ina226_alarm_show(struct device *dev,
-                                struct device_attribute *da, char *buf)
+static int ina2xx_chip_read(struct device *dev, u32 attr, long *val)
 {
-       struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
        struct ina2xx_data *data =3D dev_get_drvdata(dev);
-       int regval;
-       int alarm =3D 0;
+       u32 regval;
        int ret;

-       ret =3D regmap_read(data->regmap, INA226_MASK_ENABLE, &regval);
+       switch (attr) {
+       case hwmon_chip_update_interval:
+               ret =3D regmap_read(data->regmap, INA2XX_CONFIG, &regval);
+               if (ret)
+                       return ret;
+
+               *val =3D ina226_reg_to_interval(regval);
+               break;
+       default:
+               return -EOPNOTSUPP;
+       }
+       return 0;
+}
+
+static int ina226_alert_read(struct regmap *regmap, u32 mask, long *val)
+{
+       unsigned int regval;
+       int ret;
+
+       ret =3D regmap_read_bypassed(regmap, INA226_MASK_ENABLE, &regval);
        if (ret)
                return ret;

-       alarm =3D (regval & BIT(attr->index)) &&
-               (regval & INA226_ALERT_FUNCTION_FLAG);
-       return sysfs_emit(buf, "%d\n", alarm);
+       *val =3D (regval & mask) && (regval & INA226_ALERT_FUNCTION_FLAG);
+
+       return 0;
+}
+
+static int ina2xx_in_read(struct device *dev, u32 attr, int channel, long =
*val)
+{
+       int voltage_reg =3D channel ? INA2XX_BUS_VOLTAGE : INA2XX_SHUNT_VOL=
TAGE;
+       u32 under_voltage_mask =3D channel ? INA226_BUS_UNDER_VOLTAGE_MASK
+                                        : INA226_SHUNT_UNDER_VOLTAGE_MASK;
+       u32 over_voltage_mask =3D channel ? INA226_BUS_OVER_VOLTAGE_MASK
+                                       : INA226_SHUNT_OVER_VOLTAGE_MASK;
+       struct ina2xx_data *data =3D dev_get_drvdata(dev);
+       struct regmap *regmap =3D data->regmap;
+       unsigned int regval;
+       int ret;
+
+       switch (attr) {
+       case hwmon_in_input:
+               ret =3D regmap_read(regmap, voltage_reg, &regval);
+               if (ret)
+                       return ret;
+               *val =3D ina2xx_get_value(data, voltage_reg, regval);
+               break;
+       case hwmon_in_lcrit:
+               return ina226_alert_limit_read(data, under_voltage_mask,
+                                              voltage_reg, val);
+       case hwmon_in_crit:
+               return ina226_alert_limit_read(data, over_voltage_mask,
+                                              voltage_reg, val);
+       case hwmon_in_lcrit_alarm:
+               return ina226_alert_read(regmap, under_voltage_mask, val);
+       case hwmon_in_crit_alarm:
+               return ina226_alert_read(regmap, over_voltage_mask, val);
+       default:
+               return -EOPNOTSUPP;
+       }
+       return 0;
+}
+
+/*
+ * Configuring the READ_EIN (bit 10) of the ACCUM_CONFIG register to 1
+ * can clear accumulator and sample_count after reading the EIN register.
+ * This way, the average power between the last read and the current
+ * read can be obtained. By combining with accurate time data from
+ * outside, the energy consumption during that period can be calculated.
+ */
+static int sy24655_average_power_read(struct ina2xx_data *data, u8 reg, lo=
ng *val)
+{
+       u8 template[6];
+       int ret;
+       long accumulator_24, sample_count;
+
+       /* 48-bit register read */
+       ret =3D i2c_smbus_read_i2c_block_data(data->client, reg, 6, templat=
e);
+       if (ret < 0)
+               return ret;
+       if (ret !=3D 6)
+               return -EIO;
+       accumulator_24 =3D ((template[3] << 16) |
+                               (template[4] << 8) |
+                               template[5]);
+       sample_count =3D ((template[0] << 16) |
+                               (template[1] << 8) |
+                               template[2]);
+       if (sample_count <=3D 0) {
+               *val =3D 0;
+               return 0;
+       }
+
+       *val =3D DIV_ROUND_CLOSEST(accumulator_24, sample_count) * data->po=
wer_lsb_uW;
+
+       return 0;
+}
+
+static int ina2xx_power_read(struct device *dev, u32 attr, long *val)
+{
+       struct ina2xx_data *data =3D dev_get_drvdata(dev);
+
+       switch (attr) {
+       case hwmon_power_input:
+               return ina2xx_read_init(dev, INA2XX_POWER, val);
+       case hwmon_power_average:
+               return sy24655_average_power_read(data, SY24655_EIN, val);
+       case hwmon_power_crit:
+               return ina226_alert_limit_read(data, INA226_POWER_OVER_LIMI=
T_MASK,
+                                              INA2XX_POWER, val);
+       case hwmon_power_crit_alarm:
+               return ina226_alert_read(data->regmap, INA226_POWER_OVER_LI=
MIT_MASK, val);
+       default:
+               return -EOPNOTSUPP;
+       }
+}
+
+static int ina2xx_curr_read(struct device *dev, u32 attr, long *val)
+{
+       struct ina2xx_data *data =3D dev_get_drvdata(dev);
+       struct regmap *regmap =3D data->regmap;
+       unsigned int regval;
+       int ret;
+
+       /*
+        * While the chips supported by this driver do not directly support
+        * current limits, they do support setting shunt voltage limits.
+        * The shunt voltage divided by the shunt resistor value is the cur=
rent.
+        * On top of that, calibration values are set such that in the shun=
t
+        * voltage register and the current register report the same values=
.
+        * That means we can report and configure current limits based on s=
hunt
+        * voltage limits.
+        */
+       switch (attr) {
+       case hwmon_curr_input:
+               /*
+                * Since the shunt voltage and the current register report =
the
+                * same values when the chip is calibrated, we can calculat=
e
+                * the current directly from the shunt voltage without rely=
ing
+                * on chip calibration.
+                */
+               ret =3D regmap_read(regmap, INA2XX_SHUNT_VOLTAGE, &regval);
+               if (ret)
+                       return ret;
+               *val =3D ina2xx_get_value(data, INA2XX_CURRENT, regval);
+               return 0;
+       case hwmon_curr_lcrit:
+               return ina226_alert_limit_read(data, INA226_SHUNT_UNDER_VOL=
TAGE_MASK,
+                                              INA2XX_CURRENT, val);
+       case hwmon_curr_crit:
+               return ina226_alert_limit_read(data, INA226_SHUNT_OVER_VOLT=
AGE_MASK,
+                                              INA2XX_CURRENT, val);
+       case hwmon_curr_lcrit_alarm:
+               return ina226_alert_read(regmap, INA226_SHUNT_UNDER_VOLTAGE=
_MASK, val);
+       case hwmon_curr_crit_alarm:
+               return ina226_alert_read(regmap, INA226_SHUNT_OVER_VOLTAGE_=
MASK, val);
+       default:
+               return -EOPNOTSUPP;
+       }
+}
+
+static int ina2xx_read(struct device *dev, enum hwmon_sensor_types type,
+                      u32 attr, int channel, long *val)
+{
+       switch (type) {
+       case hwmon_chip:
+               return ina2xx_chip_read(dev, attr, val);
+       case hwmon_in:
+               return ina2xx_in_read(dev, attr, channel, val);
+       case hwmon_power:
+               return ina2xx_power_read(dev, attr, val);
+       case hwmon_curr:
+               return ina2xx_curr_read(dev, attr, val);
+       default:
+               return -EOPNOTSUPP;
+       }
+}
+
+static int ina2xx_chip_write(struct device *dev, u32 attr, long val)
+{
+       struct ina2xx_data *data =3D dev_get_drvdata(dev);
+
+       switch (attr) {
+       case hwmon_chip_update_interval:
+               return regmap_update_bits(data->regmap, INA2XX_CONFIG,
+                                         INA226_AVG_RD_MASK,
+                                         ina226_interval_to_reg(val));
+       default:
+               return -EOPNOTSUPP;
+       }
+}
+
+static int ina2xx_in_write(struct device *dev, u32 attr, int channel, long=
 val)
+{
+       struct ina2xx_data *data =3D dev_get_drvdata(dev);
+
+       switch (attr) {
+       case hwmon_in_lcrit:
+               return ina226_alert_limit_write(data,
+                       channel ? INA226_BUS_UNDER_VOLTAGE_MASK : INA226_SH=
UNT_UNDER_VOLTAGE_MASK,
+                       channel ? INA2XX_BUS_VOLTAGE : INA2XX_SHUNT_VOLTAGE=
,
+                       val);
+       case hwmon_in_crit:
+               return ina226_alert_limit_write(data,
+                       channel ? INA226_BUS_OVER_VOLTAGE_MASK : INA226_SHU=
NT_OVER_VOLTAGE_MASK,
+                       channel ? INA2XX_BUS_VOLTAGE : INA2XX_SHUNT_VOLTAGE=
,
+                       val);
+       default:
+               return -EOPNOTSUPP;
+       }
+       return 0;
+}
+
+static int ina2xx_power_write(struct device *dev, u32 attr, long val)
+{
+       struct ina2xx_data *data =3D dev_get_drvdata(dev);
+
+       switch (attr) {
+       case hwmon_power_crit:
+               return ina226_alert_limit_write(data, INA226_POWER_OVER_LIM=
IT_MASK,
+                                               INA2XX_POWER, val);
+       default:
+               return -EOPNOTSUPP;
+       }
+       return 0;
+}
+
+static int ina2xx_curr_write(struct device *dev, u32 attr, long val)
+{
+       struct ina2xx_data *data =3D dev_get_drvdata(dev);
+
+       switch (attr) {
+       case hwmon_curr_lcrit:
+               return ina226_alert_limit_write(data, INA226_SHUNT_UNDER_VO=
LTAGE_MASK,
+                                               INA2XX_CURRENT, val);
+       case hwmon_curr_crit:
+               return ina226_alert_limit_write(data, INA226_SHUNT_OVER_VOL=
TAGE_MASK,
+                                               INA2XX_CURRENT, val);
+       default:
+               return -EOPNOTSUPP;
+       }
+       return 0;
+}
+
+static int ina2xx_write(struct device *dev, enum hwmon_sensor_types type,
+                       u32 attr, int channel, long val)
+{
+       switch (type) {
+       case hwmon_chip:
+               return ina2xx_chip_write(dev, attr, val);
+       case hwmon_in:
+               return ina2xx_in_write(dev, attr, channel, val);
+       case hwmon_power:
+               return ina2xx_power_write(dev, attr, val);
+       case hwmon_curr:
+               return ina2xx_curr_write(dev, attr, val);
+       default:
+               return -EOPNOTSUPP;
+       }
+}
+
+static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_type=
s type,
+                                u32 attr, int channel)
+{
+       const struct ina2xx_data *data =3D _data;
+       bool has_alerts =3D data->config->has_alerts;
+       bool has_power_average =3D data->config->has_power_average;
+       enum ina2xx_ids chip =3D data->chip;
+
+       switch (type) {
+       case hwmon_in:
+               switch (attr) {
+               case hwmon_in_input:
+                       return 0444;
+               case hwmon_in_lcrit:
+               case hwmon_in_crit:
+                       if (has_alerts)
+                               return 0644;
+                       break;
+               case hwmon_in_lcrit_alarm:
+               case hwmon_in_crit_alarm:
+                       if (has_alerts)
+                               return 0444;
+                       break;
+               default:
+                       break;
+               }
+               break;
+       case hwmon_curr:
+               switch (attr) {
+               case hwmon_curr_input:
+                       return 0444;
+               case hwmon_curr_lcrit:
+               case hwmon_curr_crit:
+                       if (has_alerts)
+                               return 0644;
+                       break;
+               case hwmon_curr_lcrit_alarm:
+               case hwmon_curr_crit_alarm:
+                       if (has_alerts)
+                               return 0444;
+                       break;
+               default:
+                       break;
+               }
+               break;
+       case hwmon_power:
+               switch (attr) {
+               case hwmon_power_input:
+                       return 0444;
+               case hwmon_power_crit:
+                       if (has_alerts)
+                               return 0644;
+                       break;
+               case hwmon_power_crit_alarm:
+                       if (has_alerts)
+                               return 0444;
+                       break;
+               case hwmon_power_average:
+                       if (has_power_average)
+                               return 0444;
+                       break;
+               default:
+                       break;
+               }
+               break;
+       case hwmon_chip:
+               switch (attr) {
+               case hwmon_chip_update_interval:
+                       if (chip =3D=3D ina226 || chip =3D=3D ina260)
+                               return 0644;
+                       break;
+               default:
+                       break;
+               }
+               break;
+       default:
+               break;
+       }
+       return 0;
 }

+static const struct hwmon_channel_info * const ina2xx_info[] =3D {
+       HWMON_CHANNEL_INFO(chip,
+                          HWMON_C_UPDATE_INTERVAL),
+       HWMON_CHANNEL_INFO(in,
+                          HWMON_I_INPUT | HWMON_I_CRIT | HWMON_I_CRIT_ALAR=
M |
+                          HWMON_I_LCRIT | HWMON_I_LCRIT_ALARM,
+                          HWMON_I_INPUT | HWMON_I_CRIT | HWMON_I_CRIT_ALAR=
M |
+                          HWMON_I_LCRIT | HWMON_I_LCRIT_ALARM
+                          ),
+       HWMON_CHANNEL_INFO(curr, HWMON_C_INPUT | HWMON_C_CRIT | HWMON_C_CRI=
T_ALARM |
+                          HWMON_C_LCRIT | HWMON_C_LCRIT_ALARM),
+       HWMON_CHANNEL_INFO(power,
+                          HWMON_P_INPUT | HWMON_P_CRIT | HWMON_P_CRIT_ALAR=
M |
+                          HWMON_P_AVERAGE),
+       NULL
+};
+
+static const struct hwmon_ops ina2xx_hwmon_ops =3D {
+       .is_visible =3D ina2xx_is_visible,
+       .read =3D ina2xx_read,
+       .write =3D ina2xx_write,
+};
+
+static const struct hwmon_chip_info ina2xx_chip_info =3D {
+       .ops =3D &ina2xx_hwmon_ops,
+       .info =3D ina2xx_info,
+};
+
+/* shunt resistance */
+
 /*
  * In order to keep calibration register value fixed, the product
  * of current_lsb and shunt_resistor should also be fixed and equal
  * to shunt_voltage_lsb =3D 1 / shunt_div multiplied by 10^9 in order
  * to keep the scale.
  */
-static int ina2xx_set_shunt(struct ina2xx_data *data, long val)
+static int ina2xx_set_shunt(struct ina2xx_data *data, unsigned long val)
 {
        unsigned int dividend =3D DIV_ROUND_CLOSEST(1000000000,
                                                  data->config->shunt_div);
-       if (val <=3D 0 || val > dividend)
+       if (!val || val > dividend)
                return -EINVAL;

-       mutex_lock(&data->config_lock);
        data->rshunt =3D val;
        data->current_lsb_uA =3D DIV_ROUND_CLOSEST(dividend, val);
        data->power_lsb_uW =3D data->config->power_lsb_factor *
                             data->current_lsb_uA;
-       mutex_unlock(&data->config_lock);

        return 0;
 }

-static ssize_t ina2xx_shunt_show(struct device *dev,
-                                struct device_attribute *da, char *buf)
+static ssize_t shunt_resistor_show(struct device *dev,
+                                  struct device_attribute *da, char *buf)
 {
        struct ina2xx_data *data =3D dev_get_drvdata(dev);

        return sysfs_emit(buf, "%li\n", data->rshunt);
 }

-static ssize_t ina2xx_shunt_store(struct device *dev,
-                                 struct device_attribute *da,
-                                 const char *buf, size_t count)
+static ssize_t shunt_resistor_store(struct device *dev,
+                                   struct device_attribute *da,
+                                   const char *buf, size_t count)
 {
+       struct ina2xx_data *data =3D dev_get_drvdata(dev);
        unsigned long val;
        int status;
-       struct ina2xx_data *data =3D dev_get_drvdata(dev);

        status =3D kstrtoul(buf, 10, &val);
        if (status < 0)
                return status;

+       mutex_lock(&data->config_lock);
        status =3D ina2xx_set_shunt(data, val);
+       mutex_unlock(&data->config_lock);
        if (status < 0)
                return status;
        return count;
 }

-static ssize_t ina226_interval_store(struct device *dev,
-                                    struct device_attribute *da,
-                                    const char *buf, size_t count)
-{
-       struct ina2xx_data *data =3D dev_get_drvdata(dev);
-       unsigned long val;
-       int status;
-
-       status =3D kstrtoul(buf, 10, &val);
-       if (status < 0)
-               return status;
+static DEVICE_ATTR_RW(shunt_resistor);

-       if (val > INT_MAX || val =3D=3D 0)
-               return -EINVAL;
-
-       status =3D regmap_update_bits(data->regmap, INA2XX_CONFIG,
-                                   INA226_AVG_RD_MASK,
-                                   ina226_interval_to_reg(val));
-       if (status < 0)
-               return status;
-
-       return count;
-}
+/* pointers to created device attributes */
+static struct attribute *ina2xx_attrs[] =3D {
+       &dev_attr_shunt_resistor.attr,
+       NULL,
+};
+ATTRIBUTE_GROUPS(ina2xx);

-static ssize_t ina226_interval_show(struct device *dev,
-                                   struct device_attribute *da, char *buf)
+/*
+ * Initialize chip
+ */
+static int ina2xx_init(struct device *dev, struct ina2xx_data *data)
 {
-       struct ina2xx_data *data =3D dev_get_drvdata(dev);
-       int status;
-       unsigned int regval;
-
-       status =3D regmap_read(data->regmap, INA2XX_CONFIG, &regval);
-       if (status)
-               return status;
-
-       return sysfs_emit(buf, "%d\n", ina226_reg_to_interval(regval));
-}
-
-/* shunt voltage */
-static SENSOR_DEVICE_ATTR_RO(in0_input, ina2xx_value, INA2XX_SHUNT_VOLTAGE=
);
-/* shunt voltage over/under voltage alert setting and alarm */
-static SENSOR_DEVICE_ATTR_RW(in0_crit, ina226_alert,
-                            INA226_SHUNT_OVER_VOLTAGE_BIT);
-static SENSOR_DEVICE_ATTR_RW(in0_lcrit, ina226_alert,
-                            INA226_SHUNT_UNDER_VOLTAGE_BIT);
-static SENSOR_DEVICE_ATTR_RO(in0_crit_alarm, ina226_alarm,
-                            INA226_SHUNT_OVER_VOLTAGE_BIT);
-static SENSOR_DEVICE_ATTR_RO(in0_lcrit_alarm, ina226_alarm,
-                            INA226_SHUNT_UNDER_VOLTAGE_BIT);
-
-/* bus voltage */
-static SENSOR_DEVICE_ATTR_RO(in1_input, ina2xx_value, INA2XX_BUS_VOLTAGE);
-/* bus voltage over/under voltage alert setting and alarm */
-static SENSOR_DEVICE_ATTR_RW(in1_crit, ina226_alert,
-                            INA226_BUS_OVER_VOLTAGE_BIT);
-static SENSOR_DEVICE_ATTR_RW(in1_lcrit, ina226_alert,
-                            INA226_BUS_UNDER_VOLTAGE_BIT);
-static SENSOR_DEVICE_ATTR_RO(in1_crit_alarm, ina226_alarm,
-                            INA226_BUS_OVER_VOLTAGE_BIT);
-static SENSOR_DEVICE_ATTR_RO(in1_lcrit_alarm, ina226_alarm,
-                            INA226_BUS_UNDER_VOLTAGE_BIT);
-
-/* calculated current */
-static SENSOR_DEVICE_ATTR_RO(curr1_input, ina2xx_value, INA2XX_CURRENT);
-
-/* calculated power */
-static SENSOR_DEVICE_ATTR_RO(power1_input, ina2xx_value, INA2XX_POWER);
-/* over-limit power alert setting and alarm */
-static SENSOR_DEVICE_ATTR_RW(power1_crit, ina226_alert,
-                            INA226_POWER_OVER_LIMIT_BIT);
-static SENSOR_DEVICE_ATTR_RO(power1_crit_alarm, ina226_alarm,
-                            INA226_POWER_OVER_LIMIT_BIT);
+       struct regmap *regmap =3D data->regmap;
+       u32 shunt;
+       int ret;

-/* shunt resistance */
-static SENSOR_DEVICE_ATTR_RW(shunt_resistor, ina2xx_shunt, INA2XX_CALIBRAT=
ION);
+       if (data->config->has_ishunt)
+               shunt =3D INA260_RSHUNT;
+       else if (device_property_read_u32(dev, "shunt-resistor", &shunt) < =
0)
+               shunt =3D INA2XX_RSHUNT_DEFAULT;

-/* update interval (ina226 only) */
-static SENSOR_DEVICE_ATTR_RW(update_interval, ina226_interval, 0);
+       ret =3D ina2xx_set_shunt(data, shunt);
+       if (ret < 0)
+               return ret;

-/* pointers to created device attributes */
-static struct attribute *ina2xx_attrs[] =3D {
-       &sensor_dev_attr_in0_input.dev_attr.attr,
-       &sensor_dev_attr_in1_input.dev_attr.attr,
-       &sensor_dev_attr_curr1_input.dev_attr.attr,
-       &sensor_dev_attr_power1_input.dev_attr.attr,
-       &sensor_dev_attr_shunt_resistor.dev_attr.attr,
-       NULL,
-};
+       ret =3D regmap_write(regmap, INA2XX_CONFIG, data->config->config_de=
fault);
+       if (ret < 0)
+               return ret;

-static const struct attribute_group ina2xx_group =3D {
-       .attrs =3D ina2xx_attrs,
-};
+       if (data->config->has_alerts) {
+               bool active_high =3D device_property_read_bool(dev, "ti,ale=
rt-polarity-active-high");

-static struct attribute *ina226_attrs[] =3D {
-       &sensor_dev_attr_in0_crit.dev_attr.attr,
-       &sensor_dev_attr_in0_lcrit.dev_attr.attr,
-       &sensor_dev_attr_in0_crit_alarm.dev_attr.attr,
-       &sensor_dev_attr_in0_lcrit_alarm.dev_attr.attr,
-       &sensor_dev_attr_in1_crit.dev_attr.attr,
-       &sensor_dev_attr_in1_lcrit.dev_attr.attr,
-       &sensor_dev_attr_in1_crit_alarm.dev_attr.attr,
-       &sensor_dev_attr_in1_lcrit_alarm.dev_attr.attr,
-       &sensor_dev_attr_power1_crit.dev_attr.attr,
-       &sensor_dev_attr_power1_crit_alarm.dev_attr.attr,
-       &sensor_dev_attr_update_interval.dev_attr.attr,
-       NULL,
-};
+               regmap_update_bits(regmap, INA226_MASK_ENABLE,
+                                  INA226_ALERT_LATCH_ENABLE | INA226_ALERT=
_POLARITY,
+                                  INA226_ALERT_LATCH_ENABLE |
+                                               FIELD_PREP(INA226_ALERT_POL=
ARITY, active_high));
+       }
+       if (data->config->has_power_average) {
+               if (data->chip =3D=3D sy24655) {
+                       /*
+                        * Initialize the power accumulation method to cont=
inuous
+                        * mode and clear the EIN register after each read =
of the
+                        * EIN register
+                        */
+                       ret =3D regmap_write(regmap, SY24655_ACCUM_CONFIG,
+                                          SY24655_ACCUM_CONFIG_DEFAULT);
+                       if (ret < 0)
+                               return ret;
+               }
+       }

-static const struct attribute_group ina226_group =3D {
-       .attrs =3D ina226_attrs,
-};
+       if (data->config->has_ishunt)
+               return 0;

-static const struct i2c_device_id ina2xx_id[];
+       /*
+        * Calibration register is set to the best value, which eliminates
+        * truncation errors on calculating current register in hardware.
+        * According to datasheet (eq. 3) the best values are 2048 for
+        * ina226 and 4096 for ina219. They are hardcoded as calibration_va=
lue.
+        */
+       return regmap_write(regmap, INA2XX_CALIBRATION,
+                           data->config->calibration_value);
+}

 static int ina2xx_probe(struct i2c_client *client)
 {
        struct device *dev =3D &client->dev;
        struct ina2xx_data *data;
        struct device *hwmon_dev;
-       u32 val;
-       int ret, group =3D 0;
        enum ina2xx_ids chip;
+       int ret;

-       if (client->dev.of_node)
-               chip =3D (uintptr_t)of_device_get_match_data(&client->dev);
-       else
-               chip =3D i2c_match_id(ina2xx_id, client)->driver_data;
+       chip =3D (uintptr_t)i2c_get_match_data(client);

        data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
        if (!data)
                return -ENOMEM;

        /* set the device type */
+       data->client =3D client;
        data->config =3D &ina2xx_config[chip];
+       data->chip =3D chip;
        mutex_init(&data->config_lock);

-       if (of_property_read_u32(dev->of_node, "shunt-resistor", &val) < 0)=
 {
-               struct ina2xx_platform_data *pdata =3D dev_get_platdata(dev=
);
-
-               if (pdata)
-                       val =3D pdata->shunt_uohms;
-               else
-                       val =3D INA2XX_RSHUNT_DEFAULT;
-       }
-
-       ina2xx_set_shunt(data, val);
-
-       ina2xx_regmap_config.max_register =3D data->config->registers;
-
        data->regmap =3D devm_regmap_init_i2c(client, &ina2xx_regmap_config=
);
        if (IS_ERR(data->regmap)) {
                dev_err(dev, "failed to allocate register map\n");
@@ -659,18 +963,14 @@ static int ina2xx_probe(struct i2c_client *client)
        if (ret)
                return dev_err_probe(dev, ret, "failed to enable vs regulat=
or\n");

-       ret =3D ina2xx_init(data);
-       if (ret < 0) {
-               dev_err(dev, "error configuring the device: %d\n", ret);
-               return -ENODEV;
-       }
-
-       data->groups[group++] =3D &ina2xx_group;
-       if (chip =3D=3D ina226)
-               data->groups[group++] =3D &ina226_group;
+       ret =3D ina2xx_init(dev, data);
+       if (ret < 0)
+               return dev_err_probe(dev, ret, "failed to configure device\=
n");

-       hwmon_dev =3D devm_hwmon_device_register_with_groups(dev, client->n=
ame,
-                                                          data, data->grou=
ps);
+       hwmon_dev =3D devm_hwmon_device_register_with_info(dev, client->nam=
e,
+                                                        data, &ina2xx_chip=
_info,
+                                                        data->config->has_=
ishunt ?
+                                                               NULL : ina2=
xx_groups);
        if (IS_ERR(hwmon_dev))
                return PTR_ERR(hwmon_dev);

@@ -686,11 +986,17 @@ static const struct i2c_device_id ina2xx_id[] =3D {
        { "ina226", ina226 },
        { "ina230", ina226 },
        { "ina231", ina226 },
+       { "ina260", ina260 },
+       { "sy24655", sy24655 },
        { }
 };
 MODULE_DEVICE_TABLE(i2c, ina2xx_id);

 static const struct of_device_id __maybe_unused ina2xx_of_match[] =3D {
+       {
+               .compatible =3D "silergy,sy24655",
+               .data =3D (void *)sy24655
+       },
        {
                .compatible =3D "ti,ina219",
                .data =3D (void *)ina219
@@ -711,7 +1017,11 @@ static const struct of_device_id __maybe_unused ina2x=
x_of_match[] =3D {
                .compatible =3D "ti,ina231",
                .data =3D (void *)ina226
        },
-       { },
+       {
+               .compatible =3D "ti,ina260",
+               .data =3D (void *)ina260
+       },
+       { }
 };
 MODULE_DEVICE_TABLE(of, ina2xx_of_match);

--
2.34.1

WIWYNN PROPRIETARY
This email (and any attachments) contains proprietary or confidential infor=
mation and is for the sole use of its intended recipient. Any unauthorized =
review, use, copying or distribution of this email or the content of this e=
mail is strictly prohibited. If you are not the intended recipient, please =
notify the sender and delete this email immediately.
