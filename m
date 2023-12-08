Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A8C809A77
	for <lists+openbmc@lfdr.de>; Fri,  8 Dec 2023 04:34:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=HtVU/xeQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmcFD0nshz2xFl
	for <lists+openbmc@lfdr.de>; Fri,  8 Dec 2023 14:34:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=HtVU/xeQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8d::710; helo=nam04-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on20710.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8d::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmcCL5lh6z2ytN;
	Fri,  8 Dec 2023 14:32:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mz+abDYuDut4REYi/I0ZHaabkE4LOY48DilKsT/NGM+ZroVCszEwQj7Yvyuj4ZB4RButAkV+x31Zq194ax7A1pTAWMiMLLIYJK4mweW3DGkMWm1K1262ReVGkvZ8yixpi2Y0N+N+YjGcPLhsz8l2BuWWnZBkhm9iqGKfuXtz+kCMTI6pNBn69Oc1o36ulfLE8r6sDnlvSnLHe0uG+1MbsQO5CWBhF4TNNhMwieea5YQpy5K2CkJ1xhnuM427tY48YIbgz+sup71h/QqjqYUsoEb3rTZYUFi847rCRZzdFl8dwxG22ErA/IrzjP20QeutvS3f4pcQj6vDER0m3M/C3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEQEln+Pxrd+g7XX0Erli+WSVR/HUZwZxj47st23ww4=;
 b=C6hKiO4C4/GbtwPNu3BHdaSGxlDxMpGpc3foMwQURPOgECAB+UXUzb9qfeTUHwtlG/ElAPOY5G4WU8UT7o5YX70TAXLZXQ3p+jruc0W6IGJacWXX2XFHpxG9YbpAXF3oUI6WAerOZDDO8j1JLKjh6ApiyRLbj6EQ4ihxypzrZ1kxxfitj1ewtEfAcB3tAKf5tLUrMV3kTk+wPXoPPALmfNlLujsF1crMi18rt9UzyGVDP7yq/GNA2AtegDESbJ9W7cwL96tWFdV71dsBalvK9SsnGnIkeiHKdNYgA6V2femouzC2WzcnqJfgnOnTG8Ss2XzLNzYpru/X8XO0qpbzmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEQEln+Pxrd+g7XX0Erli+WSVR/HUZwZxj47st23ww4=;
 b=HtVU/xeQ1YtTH/424Dr6exUPOAVgEx4hZJp5NYwgNjbPr2FMdtLxuT0iv5dKL5/XAF7mY+I+ttLBoJH/btYs6Mz66f3BYcrnLz6KHmL4Q//IM6bAYw5U+nv9pJLEZw74UJcIDzbSnG7WmKM4ZqD+aQSzX3Zz6VbX1j9dA4BhZr0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 DS7PR01MB7784.prod.exchangelabs.com (2603:10b6:8:7f::22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.27; Fri, 8 Dec 2023 03:32:09 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 03:32:09 +0000
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
Subject: [PATCH v3 1/2] i2c: aspeed: Handle the coalesced stop conditions with the start conditions.
Date: Fri,  8 Dec 2023 10:31:41 +0700
Message-Id: <20231208033142.1673232-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20231208033142.1673232-1-quan@os.amperecomputing.com>
References: <20231208033142.1673232-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::26)
 To SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|DS7PR01MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 89633b98-bcc3-45f3-f07b-08dbf79e4240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MzIuvqeKDZG5XaJcallXThTZ6V3wImeTXqCT/J4p/5gfECvMm4UH9QpZrH8TsU1lY87wZjXI8wpKTFxOUJNpj2+Gp/FpP2ppITJrCV/hPOjPsG8iWeDyh2e0scB0555NsMP/to0q07r0va1/XKBp/wKdyhipytZ8KWFtTIESdQwc2zTWZWsuirpYFSOXXIOj6goPRJQscIDpebp1ba33MnoYEqacGXt/KCBvrM5ouJ3TqUDkAWrMC1Nr8CCVOu29xoXWtjmlrP+SlO8+eRljjfO892Y3AYONVv6Qe/5Hr5nwvWt+e0+papRrSv8E2R25OV0efgv99iRGplnq2MW9uzSLH6IFs3TiL9N3GhPeOwQ15z1xPOeP7nU/GEv+1v8WxqTG/NGz+lT4yqqypoE1vXuSLcdmm+mHhj5RVOkVBcJP586lkxtW/2XV2YfCKmP59tO5ih0cEWA0T/SwOAvtOXvbkv5HSJbzxpMOYQ22d2H1LwpXlFbP7wtqwU0mpUWPuTJUj1eICVcqw4YSwtBQaYuJGBg8PURqX13b22dhwGNtiTw4FaZnfnTTWnIWhoJNLKRsomJZHnP6eeKCxRrw+lCjUXNNJW7BRBT8p7MbL4Iw6+9/dNek0tNAL02WyuIt
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(39850400004)(136003)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(66899024)(38100700002)(41300700001)(7416002)(5660300002)(2906002)(8676002)(38350700005)(316002)(4326008)(921008)(1076003)(110136005)(478600001)(6512007)(6666004)(6506007)(52116002)(2616005)(66476007)(86362001)(66556008)(54906003)(26005)(66946007)(107886003)(8936002)(83380400001)(966005)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?E7OhJtKiDhISKT4bOFMLrFCD63yiAd4gZlbsfaDMvQMHv4LbnPXjg3TqrYdR?=
 =?us-ascii?Q?rXyh56HCZc1VKwVqJIJpDmZ67OqGl4H89zV9xNImMmlCf5WSzQ6hSvVbIBUp?=
 =?us-ascii?Q?v8u5BlyoHr+1EDBjfn6Wqv/B5vbhlbmgEhyIbyKkpUvffMuftHtMj61jauuI?=
 =?us-ascii?Q?GvOe1Dx0C2UQGAuAKmtodvryoPlmnFi5+oeR65d9qUDeEeQOFtrOtiYT7UxO?=
 =?us-ascii?Q?393nE7ebQzqCFM0iFIxPkkpGJMMPSHIwj2EQi6dLwdiJOkths+VI1tMJmipp?=
 =?us-ascii?Q?723iq9HTXUbc2ksNnn8jQ9Xl8mWHvl17zIs7t6FQl6yk9yn3QxQKw6GvtaiU?=
 =?us-ascii?Q?S5AN1s5C1FPF8oLYzwXrkdyAccIJscRlNUMZGXAPCUWzIjni68gbReyHkQYo?=
 =?us-ascii?Q?9j76Z1rAU6fFWO5/Z9MFBxre2PZSJ3z59JDg7x7nPQsQqZtnZ3k0Nw0tVrDs?=
 =?us-ascii?Q?Vd6r1j4GNB2G10tYQ3FojMlkgg0Ta2D8A+I8bBQLOW0abb3hyAAuq+xBIMj/?=
 =?us-ascii?Q?H1CPzmV8aqHby2EfTZZp2BpyTSrpFGWw5p1oHuCANqR91Q4gIxYz0cxqt64p?=
 =?us-ascii?Q?x4rn3LaF+FaSZReQ1+MDppKgP2eH2j9pFcC/hikJ1C+jjMD42rhH3Kkbbeza?=
 =?us-ascii?Q?s0Tr12MlOh40pqaVRExKp9mUO5GMfEbelT7DDPsNMaw74nVcH21yU5cCNBxU?=
 =?us-ascii?Q?IHeAFN9c7/TOjWwUcDaB0f2mJtU+IBuWodne68It1BDqzSyFf9tpJN9TtmQ4?=
 =?us-ascii?Q?CE1W20HQDH/xnPVMC9iA32ZwBipKYFDcPrkKvEMdy58k8zqirF/9AX8G/ar3?=
 =?us-ascii?Q?KHTg6BrL491FcZOxqFdNXy6PHqBj3u0VhVC6JZ3EE5evqBJ1+QQXizHvEem3?=
 =?us-ascii?Q?xOocrPYlm7APLHp6LuTkA22xa77DtiIgwEqbZkEqpOAFsbTDHywR4VKWObRe?=
 =?us-ascii?Q?zqMWSdvwWCQXCd+E161p5oQHEFInzs2Vtql7BoNNo7w8G5ymWhvAL1GbtLGJ?=
 =?us-ascii?Q?xlM4X9Ik0ix0nf4mkT2U9BvWmzab/Q0sySKLlgynPGp7mtDbn09Dj/V4WAQr?=
 =?us-ascii?Q?HFN+QliROH0Bh25VwFT6m/B560f6e94+DFW3j9S2MLfrn+g0W9NgXYaAUNO6?=
 =?us-ascii?Q?V2UyNgKI9ZkscDa6ooQ9huR61tuxwn29lKsM8s4uz5sMwXQMqJMM9ytXyqAO?=
 =?us-ascii?Q?hJAoTrkzbRj48+J4teYPvqLj2BnB4oScCGyFmI+UucEOIwbUA+MGbTaYlQNQ?=
 =?us-ascii?Q?1Jypfap0kZrzW3WhylykMKNrOwk71LkDbHJBAv1y/nvmyjE6vOZpFroZrwA1?=
 =?us-ascii?Q?0HrWkCKzLElb80P++OMJFKpZQ0ciwxNauyr7/3/5rDO9H9i/eHWnkm/BFWpk?=
 =?us-ascii?Q?TXbhOoBwuxtL+1gfUMOUn8cD/76R3L0ofaTZAo2ov8p4YULHYzRK1UUtq+0y?=
 =?us-ascii?Q?r+xV/eoRMXBV5RwGpbAXqIzexzjdZem99TsUyS65meFmUAmjfrBd+NKDHL9W?=
 =?us-ascii?Q?6glLHU0QQQx/WNqZ8ynoyMcIxEccvltCpXcY1rV1rv47TmjT5HauCmvtSNw/?=
 =?us-ascii?Q?d8TgKpQoMGMIBRjlGdphjaReEkjp/JxqFX66486G3OtWqAiOz0NuKYbOAGuH?=
 =?us-ascii?Q?J/sEq3a6Q/mDECKOzza4pTU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89633b98-bcc3-45f3-f07b-08dbf79e4240
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 03:32:09.5231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6G5GZfauDSwV1pkNdn6C7ZyKp0fstj/PFCss0K9VIKwXpQ73DIk/NDj5D9nLFM5/Qlv9Xh1nPUZvNNumCLD0f7Iu0r+SMdo+Fw8AkxcvIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR01MB7784
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
---
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
 drivers/i2c/busses/i2c-aspeed.c | 47 ++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 28e2a5fc4528..1c2a4f4c4e1b 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -249,18 +249,45 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
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
 
-	/* Slave was requested, restart state machine. */
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
 
@@ -279,17 +306,6 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
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
@@ -324,8 +340,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
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

