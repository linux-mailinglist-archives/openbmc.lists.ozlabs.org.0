Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E39480C664
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 11:25:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=n9JsUr30;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpdDd0P23z3c5y
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 21:25:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=n9JsUr30;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eae::700; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20700.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Spd9k4QFXz30NY;
	Mon, 11 Dec 2023 21:23:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDidnJPACR/yJ0Xsc1RdAqqO7RjX8fZwHDwQMxjo7CC1xfL81Ti/61MeplPhpra0YxcA4sw/1HDzx5Y2k3Cc+X4I1F0fAlsbCMMm0IjT7mkBgeJZgS+KUQm4L8T9aVUvnZADViXIQ9/szQfAxAZReRPCezCHLe2tGP11U6srcp0/V4t5216SIP9RGJNlh/Yp9DAFXn3lODGpCAC0d4AozrWUFS9DRLiqwCnpVoVt0uJ+AsLT4VUVka21igSg5zerqgCq38BRNBomVWDtAyp3iIHbgykOOMhvSdA4EnheGGqlfWl1bgnFIXviGahR2CAXIi/U4pGRvUQ/fH0Q9kLmkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AL8ucwBp7iSZS1mOKdfvDd6/FN0LMGhmG9Mje9C0kSA=;
 b=S/Jgydl1F99LJwmnMpoPMMfZ23emQgjLWhYhzYfu2TqV4kADXQLRXcZVpYCIQLqiw4yNHEeEyLm23avYoST5RoqVS3US/nrEWMsHGj6xlTdhYRRLVmKEcBW/vOO6fOeisaBNMPb06t+pnD/ybh8z04Q/i5hcbeVRC+vG1spfb0GuP7SJ6i7SZxt0HPdWfAqDBZ8wStmG3Bn2qjOZnpuM9m1H6HvyQVD6pRVHlMgu8uXVOQE6TxXWF+9piejVpR3FFq6b2GWzAUf2N7CHzt+ZbdYLd5iJYCzwauSkLHuMmgPARWgwkFWBk/7IzXH/QiYw0S4rPY135fTikA/GvTtyuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AL8ucwBp7iSZS1mOKdfvDd6/FN0LMGhmG9Mje9C0kSA=;
 b=n9JsUr30Xzb3j/SbO45wKRo/uEs21FVacYgyyaYA/3nGcZSFTbG3txYtveVH7BneyZRjzbsbblGzFXKGfGG8Hh8z455aPYX/uhkR08XyiDlBG+pVsfdrEtyRJxBkghpEBVWmMtc/Ap0rUrFdK2bmV68XS7qP1kEyMy6Rfbk+24E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 CO1PR01MB6568.prod.exchangelabs.com (2603:10b6:303:f9::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.33; Mon, 11 Dec 2023 10:22:49 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 10:22:49 +0000
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
Subject: [PATCH v4 2/2] i2c: aspeed: Acknowledge Tx done with and without ACK irq late
Date: Mon, 11 Dec 2023 17:22:17 +0700
Message-Id: <20231211102217.2436294-3-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: a303e0ec-eb89-417a-744d-08dbfa331fd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	U9mw8C6ILK3csf8axLoZ2t6tMXF7AO5KSaNrw6FKIUmMZSFIXwD+EtS+t2s1sLNHq21eDoFTc0xpvRdh150sWIiED5njgrQOoKCIAijWOhYS3tG1VIvT5B95goL4d1Uj1rXqBj3byYDVaySjSl2ItTjKpkwFMJDNFJFLvScISpKyEEB6FJnu+zceahim+nu/z/DBwFIaD9GfU10LzeK6VxkVPyjzcrnoYxKIBa52cu+YqhEklgoMvPSjtD/hyle3YYofk5v+AmYuPqk0aEYpugl2vzICAbJFqsoTKk662BriWxFpOiKA0A5h28fLiXsQjLPPeJ8lHdGaBMdX4NcQlP0+xSJp2Eog6PeWH+tZu2Q874jvDf2c6nBGz/Fg4oYab10yxdZBgnOO9g6EI2f1zBrSQMUQSqEzGZCfU/qflYyW3EHzQTI1bbQ9bB7KQIJU2ILwaq93RT4eiFywlTOFUJFBtZlUHiBsQL7GM0aU/1rebaS3vn6r9m7WgC890PoHPkeMm7x7VNcuiyFzPL73xJREuCM6HQd+6mnof0VRkIOJ5pOseN9Gy+Ehj7wYTwu1HOS3FZiFRec4fAdsioRLDogyLJMdO7p2oHRbbqd7LPL4PA+3MBsqWOxfnOJUMMC7
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(136003)(396003)(346002)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(1076003)(26005)(107886003)(2616005)(6506007)(6512007)(6666004)(52116002)(83380400001)(5660300002)(7416002)(41300700001)(2906002)(4326008)(478600001)(966005)(6486002)(8676002)(8936002)(66946007)(110136005)(66556008)(316002)(66476007)(54906003)(86362001)(38100700002)(38350700005)(921008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?lHduaNS8DVTh9rEkMjoGrFTJdjb3/AG2NOLmhLfENOAT/NMI4E0Be5DpsA3O?=
 =?us-ascii?Q?KoLVzlQyMs9IQGzEvOrZ3qz3ukLTcOnaxvmVYzTJte9aO5Std4Fga4UIDmET?=
 =?us-ascii?Q?RYypn+7lvkLTRZIE6d8BNvyA+UBuLNvcQ0JP+D5ntL7mcFwTfnMmdRjvmy4V?=
 =?us-ascii?Q?9x7qQ3bvV8qyPkCMD9GTHbZpJDvuskAMzeB1l06260QX9SOkso6AyxfTFa0D?=
 =?us-ascii?Q?amAajX/+vVDNZNZdb1euUHay8q6Ckx49grcfgTkq57oD0Z0wQLwYkab6aZwZ?=
 =?us-ascii?Q?jgZ/+/ZjGfbUXthXYqiD6GtcReOLpH1TjOxzFxsP2ZdSeks12E6ib/bpiI3E?=
 =?us-ascii?Q?qIWgAdZ75AcVhpwI4nsbu4X2Ojh3HFAxIGHMB6xyKj3gh9Y5QjtWaTDQZsZM?=
 =?us-ascii?Q?dKAANbL5fOlS6ZKTEQFrjYvHCoJta7vh5JQ2U9OzZJlQPiMP079LOVTlxNl4?=
 =?us-ascii?Q?xj6BqBnpLc1t7FNHZEkqN4DQIFUjyQ9/NQ29UylTTVd/FeO8FIHP1DMkWnIe?=
 =?us-ascii?Q?Z2XoB/cBG6uRF4J4Jq2rqImwaURLo0QPPsdyqXMhYflv3+GqcmRNJR8n459f?=
 =?us-ascii?Q?W5e7VUM/cWugCQTHVt3SHYgBtPUw8mTemXd5kNP3/z5oLAAhSnAK3esCXk0w?=
 =?us-ascii?Q?eu9tuikIatKFlCOYl0LkMsUm2KKMqJZTIt/d9ukzOf1shW7U7H9pqpbGa1rH?=
 =?us-ascii?Q?q2Jq2uz16qRicuqOd20sA+VrIeXrdAgAZqQE5Q0k8kptmJ/lM10PDWcRK86s?=
 =?us-ascii?Q?AJfZxvWiWrnaHhDSNaCROWWK3OaNScD1I11DuRG9lzaiolnU2LTpuOZTGHo9?=
 =?us-ascii?Q?U+5pwg/bPFZiYhuG6Z70M2K8mQYNBmb+xs9Rdv3irRBJh2+hzqRhDCyjFlYF?=
 =?us-ascii?Q?pmITgi+fJt5siORHX6v4iEno/XINZENB55S3WFt48t129DHzlkH46o0BlrAk?=
 =?us-ascii?Q?1k+1Gjirq1NSgvCqi8BUjepP/pQbfpxS+DKV35bCW4v43XBp/hB7t5Ox+Hkt?=
 =?us-ascii?Q?wrp3+MuUouVs0NRFn/GcARXGTN6xSTG5a4MHND5cORLoHnA2Pmn2IzLA8ugD?=
 =?us-ascii?Q?v/7vWGbWHpa7dFjkTsHTDELFliOYAbnGdpuh3rLvvoJG06bGd+7EofLpk91u?=
 =?us-ascii?Q?EBgIdBVsphStGbsJputrMdvjWSUgwiePRvDGfWvKNIpr9sOFLjSs7ecIaKq8?=
 =?us-ascii?Q?6H7pfBahPyaSckhXoBLa+kgp44hScV91kNjpX9kd4264wRFjdZghArsqvCwu?=
 =?us-ascii?Q?LR70OXRIwU+EIZHasM/AgveGeUztzI1x1EffXAIqaGoHgT5nMsXkbkGkqaQD?=
 =?us-ascii?Q?z/xyeRNVM5WzQ57RKRV/OON/ovPqQKVKWN0pUvPkLUquJecmjOsaEqIfeAhc?=
 =?us-ascii?Q?oRHIj5tdfzf6hvezt/NwisMCWAmoe+bFBv806f4i/9s1kirhlxfY3iuRz4vv?=
 =?us-ascii?Q?KZ3PUptRBuoHRunZPxD2sdtCdo8TSMGDTPrY+K4XhOL/MByV30bGnKAhowol?=
 =?us-ascii?Q?zJBiFrCBVeotRLkKkUkItn+7eO/bEXg5BHYNZXsRr/lEKh69X9CQLfLXkow8?=
 =?us-ascii?Q?N/G4TPd7Jt6x7UA2M6NVGEs7/hTvr+jbWsUBXG2cfJTtC2OttmH2tiBLO8+i?=
 =?us-ascii?Q?+fE5kvhlyyDJ8dwk2sQmUDE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a303e0ec-eb89-417a-744d-08dbfa331fd5
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 10:22:49.1549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PItBE7hQJPUk1izhwECgYdVAJft+7UDK0p7N2wmh4omF1x975WbDKas1MPK9DhOef3sW9bJsTMWYQG6MVpLVByfIORcLa6ukgJqjVLG2GmE=
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
v4:
  + Switch to use define macro instead of variable             [Andrew]
  + Make the early ack conditionally to avoid unnecessary
writel()/readl()                                                 [Quan]

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
 drivers/i2c/busses/i2c-aspeed.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 5511fd46a65e..0f67218cf04a 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -93,6 +93,10 @@
 		 ASPEED_I2CD_INTR_RX_DONE |				       \
 		 ASPEED_I2CD_INTR_TX_NAK |				       \
 		 ASPEED_I2CD_INTR_TX_ACK)
+#define ASPEED_I2CD_INTR_ACK_RX_TX					       \
+		(ASPEED_I2CD_INTR_RX_DONE |				       \
+		 ASPEED_I2CD_INTR_TX_ACK |				       \
+		 ASPEED_I2CD_INTR_TX_NAK)
 
 /* 0x14 : I2CD Command/Status Register   */
 #define ASPEED_I2CD_SCL_LINE_STS			BIT(18)
@@ -622,10 +626,19 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 
 	spin_lock(&bus->lock);
 	irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
-	/* Ack all interrupts except for Rx done */
-	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
-	       bus->base + ASPEED_I2C_INTR_STS_REG);
-	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
+
+	/*
+	 * Early acking of INTR_RX_DONE and INTR_TX_[ACK|NAK] would indicate HW to
+	 * start receiving or sending new data, and this may cause a race condition
+	 * as the irq handler has not yet handled these irqs but is being acked.
+	 * Let's ack them late at the end of the irq handler when those are truly processed.
+	 */
+	if (irq_received & ~ASPEED_I2CD_INTR_ACK_RX_TX) {
+		writel(irq_received & ~ASPEED_I2CD_INTR_ACK_RX_TX,
+		       bus->base + ASPEED_I2C_INTR_STS_REG);
+		readl(bus->base + ASPEED_I2C_INTR_STS_REG);
+	}
+
 	irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
 	irq_remaining = irq_received;
 
@@ -668,12 +681,12 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
 			irq_received, irq_handled);
 
-	/* Ack Rx done */
-	if (irq_received & ASPEED_I2CD_INTR_RX_DONE) {
-		writel(ASPEED_I2CD_INTR_RX_DONE,
+	if (irq_received & ASPEED_I2CD_INTR_ACK_RX_TX) {
+		writel(irq_received & ASPEED_I2CD_INTR_ACK_RX_TX,
 		       bus->base + ASPEED_I2C_INTR_STS_REG);
 		readl(bus->base + ASPEED_I2C_INTR_STS_REG);
 	}
+
 	spin_unlock(&bus->lock);
 	return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
 }
-- 
2.35.1

