Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3684680C656
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 11:24:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=HBmVpxTP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpdCR6CPqz3c13
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 21:24:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=HBmVpxTP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eae::700; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20700.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Spd9j6ynYz30NY;
	Mon, 11 Dec 2023 21:23:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCizyxQlmrXKHOYuAcItLqutYwGCfh87WnaOI9mg0EQBOMZQh0yGJTqfQ9YzPEhe+3CNgtXeMFJFrgffggENuOe4je7lDccuiZB8ovbGi/P0RrakvdG7QYGdZguQCs0BMLpHJTR35Tg1soLWquZBaAn8/E+YMXCADJkCEJymWgTeuTUz9CYNq/et9ew8LWoiNcd37h3Udzapy7hxruyL58ae8ToVg5LhtPyEyEDw849Ofc8NTCGWwf3TIulhbOH1yTHezaEmPcQEzx/f0Ym1O2WDcE5ysJhFKPIUTRZ5Er7QbUPIeTSLihunP+tkgYS009qZNyts477+Xl46NzpT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BY5s2186L/aTXEB/fsA3P5IQbtXqCy/Ek7NttGxmiA=;
 b=AedBbMjJvczE3DqR4bFDLGco6BmWa0kMQVa80jRhZkXj+jTll0cbW3FkOnb6JsiiwtA3HRSMaYg/OSW+9RZPUGwe/9AkBzZA++rZCnlzUJ56DGG+96PDvE8JHgy8u8p9jsrz1eRoM7/U3kaPkxYEu3KVcRNMwfbmqFmAUIOUCHchjPS2Bn+41xgBidC+5NzrPg4qZgLMochneyTtcz3o5PTnpSN9BLonOgbt5cOrel5aKCRzcfGJm404aBbfefspXOZs/gmh7n6XmAUmuyjVk2uQQK61i39UcPBlSiJcmf30wo4g0UnGl0vFMwwTKQwRfWQUXgS6HWOcjZC3h7x5IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BY5s2186L/aTXEB/fsA3P5IQbtXqCy/Ek7NttGxmiA=;
 b=HBmVpxTPg/dgDZyG5iFMtfp3nJjgQmVxsntp2a8+cHCPRy8PnivKwqrQJhYka05jRouR2diA8qPTHBaAjHGwem1JpbnFki/EFz6cmh2YOD7Wsor5LOFXZZ48rOzRwPWM5rDsGCcNkJS5Tc7i8gwgC0ApD7dpynNwpuNbrMAUdrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 CO1PR01MB6568.prod.exchangelabs.com (2603:10b6:303:f9::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.33; Mon, 11 Dec 2023 10:22:44 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 10:22:44 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Wolfram Sang <wsa@kernel.org>,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] i2c: aspeed: Handle the coalesced stop conditions with the start conditions.
Date: Mon, 11 Dec 2023 17:22:16 +0700
Message-Id: <20231211102217.2436294-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20231211102217.2436294-1-quan@os.amperecomputing.com>
References: <20231211102217.2436294-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096::17) To
 SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|CO1PR01MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: 191937b4-53ef-4954-1d5f-08dbfa331cd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	SjGZSCBgonBI/yfZgZ/xPX12P+U2kYsAZBqqP7PhGduVgCzfjzJmI7xkgZkCoaa0SexcniPXjBogX0doAmvMCW1+tfw/zR3mXj+PhNITq/fbYpvT8GhS37YG8VZZBXKlnhgJKzXgOmp31OIzSJo6u0mQEGCKeqyfyPe9eADbObN9yUlRYXvG6shyYnW5NBJAQm9EbjxRXsO24H9Bkv7jl4SsPkpDTyeEBEjxps2O7znGnZnyVqOpU9Qt9DNXyNoGlUNclv6HeTFCB/uASOEeLaFr+wAjheIcnYO2V4OWcEoXgHNPYF379ImiAiKIAWM7dRTMl3xRLRJqC7fBAv7w0Fs9HLk9hwNjDR4ghQ0GQLK+eIyGQZ++OPQZ0qPCdVYotYFHFnlqVqUcmIduREGWldY99JXtuAKFRPMGoX/o2CD0Jw9HnK6NX148Sf7VRJDJzYGUoQdshruQA2ky+oZWQx5M6ovIlSOii4QjoJAhqlZVIzrmOpnjz6VWUfpaqPrTKTKseG6UmGuAvWrru6onEZmVFY5lwQ0VD7wDnXMj+R4f2qNJUJEaJaghIfsCsNISP38LGP7mGZT3TuTMiKvsM5DDd5xwPw3HXEhRAtiyvURJGrbU1RfCGoVVr/xJuo6V
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(136003)(396003)(346002)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(1076003)(26005)(107886003)(2616005)(6506007)(6512007)(6666004)(52116002)(83380400001)(5660300002)(7416002)(41300700001)(2906002)(4326008)(478600001)(966005)(6486002)(8676002)(8936002)(66946007)(110136005)(66556008)(316002)(66476007)(54906003)(86362001)(38100700002)(38350700005)(921008)(66899024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?x1oTkao/5yE5qMO2xfF8BCazMJJBkD0JYbdd1Jvoc5Nv9PHAWFMJB6r4Vszf?=
 =?us-ascii?Q?F7/kdXIlKmP4HUmN5guoDlkB6734m5MRg3SAsbRLeylpKKNNv0Y3iKLsD1oh?=
 =?us-ascii?Q?HpDeZZ7nM0XuS7Ndsk3Qi1Tvu8m9+NgzaDed2K8QEt7u2vE45xdaEa6T5KTW?=
 =?us-ascii?Q?YWtk45zLK9YqnLq6rLnHZoiHFF8qQI4hTOY4Lu9chmRmuCN17m1mjeTqIILd?=
 =?us-ascii?Q?u+c4JJeDOjlRPS16cuRVVJD5v/5y6bmBwuBcXgcAT9C2ciaTFfjPzp8vbsIb?=
 =?us-ascii?Q?op9boNcDGNsJ0hqgRir0htgxy0H7h/BClp+P8LG0Urt5u3Hn/dqBvDEn19Nq?=
 =?us-ascii?Q?qpCArfQO5bQY2468bZ9O/0j9mbDw3u23lP/ybjqbemsfE6q9z9rj7JpejjeH?=
 =?us-ascii?Q?8RmJaZ20K/EfgksmSIQ0qPREbAnwDRFgqYH6SgaYZbggumXO68CgqQJTnhKh?=
 =?us-ascii?Q?D0MdmwYr3I5NS9CXyYOKkVseuGXcXq8ZEeZamXHKM8KIOLDjRZL0rlh5fhSc?=
 =?us-ascii?Q?Z9weHmAy0TLJXx4SEJdDBgf+iCL2rv2yHJ1MOloh3FRHu7pmd95/e1lcyQXQ?=
 =?us-ascii?Q?Jb/hJ3uq7hM+++rs2PO9KhAvXQZbLwetS3L/LEE2ogfrk98xk35UT+PxVPNs?=
 =?us-ascii?Q?Fw4bWTRGxNqhUDtlTU+AUj6mBxzOc56JYIJ+HD0pEDkzoLn/6k66kHXPE3cf?=
 =?us-ascii?Q?ZnbtNwQ/eHK5iTjqxZn1yYL27kh09EKJqg27gLk8ZULEQrJP5WCPrOf4KJNi?=
 =?us-ascii?Q?Z9lFMumI6euA/Isuy62gYjNsrJ87o0Tsi7h8u/+9/4ory1K7/7uzGIFU17dA?=
 =?us-ascii?Q?mSB5hlgMdd+S217BAlUVb5oaN3mTw1bwq6mK86+zSWRvrCFMjGx6ycQnQt9C?=
 =?us-ascii?Q?CixrxTKe4hioJfT72gB/l+gtgJAxwb7cepz/sbrT0zaca5SnDnSF3MpDAIS6?=
 =?us-ascii?Q?f7imolJEH15fVyqq9Hn9TXNhu8cZPLkgd1EJy5FrJJ3tOd5Id/RR6nKJhKeA?=
 =?us-ascii?Q?RmHsAA7MSU7mFkCwLPkjPUa2zf20T8h0scJXlr+BHDVPkyJ/h9Pqnw1oTUFl?=
 =?us-ascii?Q?2X0RmAT28xBOC3ljxIooGq+e479eTXIpsEJhUis2xG4MHdEw+3yilWQDujUs?=
 =?us-ascii?Q?WI8Ks0Fi1J5pR2I1mBRKLteHkA4G7VDrbEpZIrAM+cqNX/cX6DCHVDDQChyv?=
 =?us-ascii?Q?79ZigOz5ZULgWmwZt6wyC/bVw+nJET/atF3xcFs9DDVay0Iupq74A8KhIvzn?=
 =?us-ascii?Q?AGVuY6R68jj+NuDxZr0TCcLfrHHdtMKXb310SaORife7LbBkbhNVcqCEmbFK?=
 =?us-ascii?Q?+Z1SavyofZmMTGsm7DxP/4evfLht0xSY6t/OBpBKRmQc5kBrZJyHvV1jrDyI?=
 =?us-ascii?Q?624IpchxDeBFVHWyjmcsGISWV+9mYkbRyyMoTevGc2aG7xHlrgWhRJTzA51l?=
 =?us-ascii?Q?CNIDKLlVz0NzjJgjIcTwGGrEapSNEYb8J3elHdK/TNOguRarA+cKVMhVR8uX?=
 =?us-ascii?Q?n/6kdMPPBONsXjM+s+2NzYhHxyibSd93xDXJgRWe3wkYb53uNcG+NP4GrlCH?=
 =?us-ascii?Q?M++kYwalRfNonX75Kh6zXQ/6TCrLDWTTMR4+540x5JEmYzUfCcnVEnFt+G4I?=
 =?us-ascii?Q?YDIfvErzao+zuC5fik2w6G8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 191937b4-53ef-4954-1d5f-08dbfa331cd8
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 10:22:43.9396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IX2yGEacm58I0fwfDHy35K31N15yTecyJC47tebN7DsFXONPkrsc7w2UK7dK+WQP/qntc6g069VVNPAgjSuzsxEg5flu7gMK5Wdipkn8sYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6568
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
Cc: Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Some masters may drive the transfers with low enough latency between
the nak/stop phase of the current command and the start/address phase
of the following command that the interrupts are coalesced by the
time we process them.
Handle the stop conditions before processing SLAVE_MATCH to fix the
complaints that sometimes occur below.

"aspeed-i2c-bus 1e78a040.i2c-bus: irq handled != irq. Expected
0x00000086, but was 0x00000084"

Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C driver")
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
v4:
  + Add an extra empty line before the comment                        [Andrew]

Note: I'd like to keep adding Reviewed-by Andrew and Andi for this patch
eventhough there is an extra empty line added before the comment as mentioned
above. Thanks for the review.

v3:
  + Change to handle the coalesced stop condition with the start
conditions                                                            [Andrew]
  + Revised commit message                                              [Quan]

v2:
  + Split to separate series                                            [Joel]
  + Added the Fixes line                                                [Joel]
  + Revised commit message                                              [Quan]

v1:
  + First introduced in
https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomputing.com/
---
 drivers/i2c/busses/i2c-aspeed.c | 48 ++++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 28e2a5fc4528..5511fd46a65e 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -249,18 +249,46 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 	if (!slave)
 		return 0;
 
-	command = readl(bus->base + ASPEED_I2C_CMD_REG);
+	/*
+	 * Handle stop conditions early, prior to SLAVE_MATCH. Some masters may drive
+	 * transfers with low enough latency between the nak/stop phase of the current
+	 * command and the start/address phase of the following command that the
+	 * interrupts are coalesced by the time we process them.
+	 */
+	if (irq_status & ASPEED_I2CD_INTR_NORMAL_STOP) {
+		irq_handled |= ASPEED_I2CD_INTR_NORMAL_STOP;
+		bus->slave_state = ASPEED_I2C_SLAVE_STOP;
+	}
+
+	if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
+	    bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {
+		irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
+		bus->slave_state = ASPEED_I2C_SLAVE_STOP;
+	}
+
+	/* Propagate any stop conditions to the slave implementation. */
+	if (bus->slave_state == ASPEED_I2C_SLAVE_STOP) {
+		i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
+		bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
+	}
 
-	/* Slave was requested, restart state machine. */
+	/*
+	 * Now that we've dealt with any potentially coalesced stop conditions,
+	 * address any start conditions.
+	 */
 	if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
 		irq_handled |= ASPEED_I2CD_INTR_SLAVE_MATCH;
 		bus->slave_state = ASPEED_I2C_SLAVE_START;
 	}
 
-	/* Slave is not currently active, irq was for someone else. */
+	/*
+	 * If the slave has been stopped and not started then slave interrupt
+	 * handling is complete.
+	 */
 	if (bus->slave_state == ASPEED_I2C_SLAVE_INACTIVE)
 		return irq_handled;
 
+	command = readl(bus->base + ASPEED_I2C_CMD_REG);
 	dev_dbg(bus->dev, "slave irq status 0x%08x, cmd 0x%08x\n",
 		irq_status, command);
 
@@ -279,17 +307,6 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		irq_handled |= ASPEED_I2CD_INTR_RX_DONE;
 	}
 
-	/* Slave was asked to stop. */
-	if (irq_status & ASPEED_I2CD_INTR_NORMAL_STOP) {
-		irq_handled |= ASPEED_I2CD_INTR_NORMAL_STOP;
-		bus->slave_state = ASPEED_I2C_SLAVE_STOP;
-	}
-	if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
-	    bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {
-		irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
-		bus->slave_state = ASPEED_I2C_SLAVE_STOP;
-	}
-
 	switch (bus->slave_state) {
 	case ASPEED_I2C_SLAVE_READ_REQUESTED:
 		if (unlikely(irq_status & ASPEED_I2CD_INTR_TX_ACK))
@@ -324,8 +341,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED, &value);
 		break;
 	case ASPEED_I2C_SLAVE_STOP:
-		i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
-		bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
+		/* Stop event handling is done early. Unreachable. */
 		break;
 	case ASPEED_I2C_SLAVE_START:
 		/* Slave was just started. Waiting for the next event. */;
-- 
2.35.1

