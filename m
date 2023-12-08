Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B93809A83
	for <lists+openbmc@lfdr.de>; Fri,  8 Dec 2023 04:35:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=g8fz7HTK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmcGL1z1zz3dCV
	for <lists+openbmc@lfdr.de>; Fri,  8 Dec 2023 14:35:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=g8fz7HTK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8d::710; helo=nam04-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on20710.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8d::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmcCM2nCQz2ytN;
	Fri,  8 Dec 2023 14:32:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lbt3JChCNqavGZdEg0/bbTeXhCFjQmg4IygDkZdLCKwI78BzCwaKw523mc9bf3xVodAkWxi2r0+sePZC0VFOObefUezraMEg6WBIYwkWSSf41V7As9ITBW2HLZX9bsoZFzITbtPXk+vx79S01SFjIFQC2hlBJqC0rvDBEfDK91YCyAGSftbRFm/pUOoEWTEJkfyrmhGFsA/Uv8UmT9pcsqG/CAMYb2JQJ7v5Is9auTk6c1fSD3aBcXfx1eSW8gUJPLBZqZgaW72G3GUqV9fbLzRw8QomWv0M1J+nzJDhjvPk/UTz39XkoCg4ceZNUai/2cZzI9XCqiOtK7sqmWq90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlMP3M3fABHaRpRNGuvf9NO+rSFvhyPtOwBNy1e3lk4=;
 b=UrK9W3+7BS0mn3Me70j67aW7uL5bk901c6npHQuUevoy3I3xGjYLaY1YwPmWhseh8zwi2KrjHez5p14gz6MsFTZxA/14TvszrqSJ5mZXb9X+2w/fSOldrgBkLXmkaxi/eRrQhCdFqoPzxK2i6oJMMQ98ExAhHxd/2ejxUu8FKaMLjQe4c8dGMm2BR1nygFn4E0Ery9B5EHgpU/jIOpUdjHbkV7dzTyoMneYA6eNy9Y7M82V8VczZlJOgy1eJhbvhB8a1RncMpFO0i8ba5DIAadN+D9OTljR6xM3gNySUhOXGHtn4Ok0O8IqpBN0AYX+w+OucOa+nOUhQQ4PPykXCLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlMP3M3fABHaRpRNGuvf9NO+rSFvhyPtOwBNy1e3lk4=;
 b=g8fz7HTKarJoVFqPCz6+S6iYs6VwOXHQ1vI0wJ37tDXCdto187vLgthfHpuWfFZo3CnZpy9QpnPHDJbUh1j2+Db9VVs+Agordubk//kq0soZrkIUk9nGWQwpIPmb1ARRj2Vb5+t4IJHH1BAEZG8sVbGHDg0XNQPb9w6QX6Vmtpg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 DS7PR01MB7784.prod.exchangelabs.com (2603:10b6:8:7f::22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.27; Fri, 8 Dec 2023 03:32:15 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 03:32:15 +0000
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
Subject: [PATCH v3 2/2] i2c: aspeed: Acknowledge Tx done with and without ACK irq late
Date: Fri,  8 Dec 2023 10:31:42 +0700
Message-Id: <20231208033142.1673232-3-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: a89b4120-66dc-4f5f-b8e2-08dbf79e45b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7VwckWnszuPjfJ1FGKoQ5sg+NEvgZhZeL5J2L3U39EwA8VtUI211Idd9wPpZyWsjM5zRCvXzVhXl9kOm8cNkl2AVBSq/9yqM2PRcfaJ8RcVFLLXbHPbN8QrSsPASdXNbFqgO2rbB9wStkZnkw56gEPJgIFwgIP5hquhiqM97olRp2x4Hc4ccnNM1JuqCPz/dowxj47sprQlJON/4R9fJk7QkQgakwEzJlmTZsAEXeIdXJd1hLMN9J6g0q0freZwl1dO8CVlshbeLQvVw0dfWJH4r47OFGeL1c5QhO0tZZ0gIQCYhu7QQZ37WqYd1ZA4ohLK1HYiNP6dNJ/UDSOia53j0FBpOYjy0FydPkDAm+BxyNChjqgoLH6pLbtlKEbAZilqvtiEjI9meocp2htbQVQjc9NwdrU/kEPf327Uwg17lLrAnRZjekDtjTzbDQpBuprJwLeUI8ccWb6FteoIfX3o6ZR0Fu3GgxxpKe8aTU3Nyp1IsW+vUPyNp6CUnJsZWaHCPaichJFvXGHWSJwbxP0ixsLP/G5kNg5tV2WZ+WSlEoyuc1xyKqORTrpcA+urtX+tJjOCK47gkdSOqHqWambgYScDPAAgTNloQYk6Dv/1dG3GzRKJ3AZ+NtcxCoYn1
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(39850400004)(136003)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(38100700002)(41300700001)(7416002)(5660300002)(2906002)(8676002)(38350700005)(316002)(4326008)(921008)(1076003)(110136005)(478600001)(6512007)(6666004)(6506007)(52116002)(2616005)(66476007)(86362001)(66556008)(54906003)(26005)(66946007)(107886003)(8936002)(83380400001)(966005)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?yJP4exEKch3CkzPFSPfMms+t1cRdqzQsozSyuSBYjKGMlyiwOKdr7N9HOE9O?=
 =?us-ascii?Q?BqHIZXrqGyEy6UGsvPE11Sb8O8WkZURJzpNU0HDID6ll7R3n0gFbL+RkjpN6?=
 =?us-ascii?Q?FR58fapIFQu0oMrmxUwG5Hgh+V83x2uILmsNTRofiCPrQoCfs/zuyZY2v/pP?=
 =?us-ascii?Q?6rmLaqFrKj99LLVP95NbmcgXceT6DD34uMheNLGPjNVq6GyhpE/3QnyriZz0?=
 =?us-ascii?Q?zX9OVqBURkmilSPZ1tXb7AzYUncpJzujd4AYcUso27Bj5l9Gc87JGYSGcSa5?=
 =?us-ascii?Q?SdO+7N9hoUCLFjSsOl/nrlb75tUHe7wuqTsdG0+6m30QVQeliJcYb2XH955Q?=
 =?us-ascii?Q?z/xjRbr097IVAkH0guelYKCJMvYa82jJAsiFqVgBG4E0ifzkyrdqHQ+izzjN?=
 =?us-ascii?Q?9iNutMydRk7HMApBa9XHCzY6wDiEbn+SM84xMB18fxyHY0PElBtiNdlAu8Dm?=
 =?us-ascii?Q?PB9e3vSp7ipI/ysJZvmfSI3MB1MpBlMd+mE+5gnG1TzSAx5BaHO/A9db2C2p?=
 =?us-ascii?Q?Hi1biIOXDs8/f5ZF3xHA7EgG2IXy1QbbX5r8xzcbo3YEu5JR6sUlucfi6o0P?=
 =?us-ascii?Q?ErYOHgc/oOfqfq49MRQ0ruIGJM5kIoKiyhSPL2ZM3XcSzll8RG1MHFQ9Rkh1?=
 =?us-ascii?Q?xfh9u2S8Mc3kAIcW7FrbP73idb9TtTuAu4mYRE1yjmwHwr7u8pBnzTopWVY3?=
 =?us-ascii?Q?EgMTsAoVnQ3Y8Xq7VibrWV1glrnRshlih+/0TtnN0HDCdi5coMX97kGqyLCQ?=
 =?us-ascii?Q?axDl39oQpyEnQjV/aQSdv32YMDiGbdd0477HNr662XZX9WdiH06TYzJi35dL?=
 =?us-ascii?Q?+EQTTyN8YcM6aBq/qwOhUVOUNOokdbwVm31Hyhdjhw/Nn28PQWl5eE0msqe3?=
 =?us-ascii?Q?rF7zFptcNgqjnJ7F+1/+9rsugMM2xPtE1yCQiMRuQJSCKrJxzlxUGsmaiqhK?=
 =?us-ascii?Q?I3/hORiReqcbi3gdKlrVUeuUscYOMMk/icW6ySV1fKxGYYunixz52gDcNCec?=
 =?us-ascii?Q?uKL3on9+Xntsc1BkSHnc9Jb6T2InHoeaF7nklCgHuPAfs4QfZi6NPEWx99+u?=
 =?us-ascii?Q?J2BG6vtE1GF3CXPYbVFC4kXMFS7YgyLHpfMC782aMXK5OG3S3DmmeBwdqQLO?=
 =?us-ascii?Q?vL+GMJj//aX+m16dPzGDWB2RlK3y4yEHYLB9c/BrxaJPZCwpb0Pf0YOZhavL?=
 =?us-ascii?Q?WlLDHzBKK+ehPoMNnnO6DBz1SydVPw0Yi19WyKN8fSPLG/ztTaxwgS727jM+?=
 =?us-ascii?Q?dstsyqaa1J5vorWH9xvIaexx0775dbATNpbc8Zs55i6gGrOyJPWZwtyJhQAq?=
 =?us-ascii?Q?wie6XutnoqmeXUEcRjhjOgeZ9MoFGfLBRrdaFnjB8UiPQcjOjr2xU7Lhu+Ks?=
 =?us-ascii?Q?GuL0cItVtL0GLToCEDdAevmUGsX7pnJJh1a2TcVP12Lq9uUJd4LdUctO5J/r?=
 =?us-ascii?Q?Yyr1Be62iAyH1gGxVEBBg7mDTB/FLBVL+qwHM07QqwHNZQsHh4DFLUNekj7B?=
 =?us-ascii?Q?DURZzybma3jOxb08jlCHF9dd9ljGrpr8d4CZSfqu2wG6nKH7jn5FER1YyJvK?=
 =?us-ascii?Q?GD8pEaHaFzctMbU5Gx/qaYC8NUks8uFeqB1qLE5Gq7GQKEG3EtGunKS/loWQ?=
 =?us-ascii?Q?qY58MzlnFW9nnGepG79sOQU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a89b4120-66dc-4f5f-b8e2-08dbf79e45b0
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 03:32:15.3008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uz7HCNU0kVg1jpTNGtYD8qORLzFZwnOWOWoo/LIoYqY6xFPqeQBwVLQS0ch0Ht73ZgvIJgNsolVPnv5SeTiW8m27jG+A0h7DAFeHQfLcH3o=
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

Commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in
interrupt handler") acknowledges most interrupts early before the slave
irq handler is executed, except for the "Receive Done Interrupt status"
which is acknowledged late in the interrupt.
However, it has been observed that the early acknowledgment of "Transmit
Done Interrupt Status" (with ACK or NACK) often causes the interrupt to
be raised in READ REQUEST state, that shows the
"Unexpected ACK on read request." complaint messages.

Assuming that the "Transmit Done" interrupt should only be acknowledged
once it is truly processed, this commit fixes that issue by acknowledging
interrupts for both ACK and NACK cases late in the interrupt handler.

Fixes: 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in interrupt handler")
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v3:
  + Fix the unconditinal write when ack the irqs               [Andrew]
  + Refactor the code to enhance code readability                [Quan]
  + Fix grammar in commit message                                [Quan]

v2:
  + Split to separate series                                     [Joel]
  + Added the Fixes line                                         [Joel]
  + Fixed multiline comment                                      [Joel]
  + Refactor irq clearing code                          [Joel, Guenter]
  + Revised commit message                                       [Joel]
  + Revised commit message                                       [Quan]
  + About a note to remind why the readl() should immediately follow the
writel() to fix the race condition when clearing irq status from commit
c926c87b8e36 ("i2c: aspeed: Avoid i2c interrupt status clear race
condition"), I think it looks straight forward in this patch and decided
not to add that note.                                            [Joel]

v1:
  + First introduced in
https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomputing.com/
---
 drivers/i2c/busses/i2c-aspeed.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 1c2a4f4c4e1b..967a26dd4ffa 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -617,13 +617,19 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 {
 	struct aspeed_i2c_bus *bus = dev_id;
-	u32 irq_received, irq_remaining, irq_handled;
+	u32 irq_received, irq_remaining, irq_handled, irq_ack_last;
 
 	spin_lock(&bus->lock);
 	irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
-	/* Ack all interrupts except for Rx done */
-	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
-	       bus->base + ASPEED_I2C_INTR_STS_REG);
+
+	/*
+	 * Early acking of INTR_RX_DONE and INTR_TX_[ACK|NAK] would indicate HW to
+	 * start receiving or sending new data, and this may cause a race condition
+	 * as the irq handler has not yet handled these irqs but is being acked.
+	 * Let's ack them late at the end of the irq handler when those are truly processed.
+	 */
+	irq_ack_last = ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK;
+	writel(irq_received & ~irq_ack_last, bus->base + ASPEED_I2C_INTR_STS_REG);
 	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
 	irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
 	irq_remaining = irq_received;
@@ -667,12 +673,11 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
 			irq_received, irq_handled);
 
-	/* Ack Rx done */
-	if (irq_received & ASPEED_I2CD_INTR_RX_DONE) {
-		writel(ASPEED_I2CD_INTR_RX_DONE,
-		       bus->base + ASPEED_I2C_INTR_STS_REG);
+	if (irq_received & irq_ack_last) {
+		writel(irq_received & irq_ack_last, bus->base + ASPEED_I2C_INTR_STS_REG);
 		readl(bus->base + ASPEED_I2C_INTR_STS_REG);
 	}
+
 	spin_unlock(&bus->lock);
 	return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
 }
-- 
2.35.1

