Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 693253A8F35
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 05:12:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4Vc00QY6z3btT
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 13:12:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=br96Kjgj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.122;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=br96Kjgj; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2122.outbound.protection.outlook.com [40.107.237.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4VZZ1X3vz2yWN;
 Wed, 16 Jun 2021 13:11:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmnLmGOVeFmSHgC2T66BrIqQXQwmo4i2+nbV1tKFLhHtdUuXzHSHTEId7YoFFBEqZnwJcojb4G5ZravcjNbvlfHVNmERrsdH4DNHsx269Vox93b843mU9u8bE/11QNdlx80VuH9KnOHi0MhEalUT8TNFS16d3i9fiquN/kACqY8OjEH8aLSKxD9uyxSEo0duU5rhPrwRMCrc7CIPZzGwsufEXIENA6Vnr0Ng2wej+LN6v24826+MlJA0DtsZXcPS2Bfl45bHf/65JI2RkrE2FqtAPjj+qvz+p0VPUtQhUzbRzWu6eCb8ov9ZwW8nAw0qSokRPuN3CWn/GylEBURitA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaAf3KD4+QzGmbP8YE4+XWgkw1HmY388wpKZqZVh/AY=;
 b=CwHPKm1vpt18fvMQVkdaGBZVHEx/EtmjY/JciZozKhqm/a+HOKKTl8AW/o6yowBjH9scz0CDzSy4u4byNuD1JS6/KuYW8aRc72vdh/dI5VgAMKuyPiRKbwXC1NvLQCskTXRcBxvUOSHNZ28sewgGT80cw360yWTBG4oYi01jLqH/rn2jYwpdiZcvxr3pQSCod8NtGkUKI1zSQaP8x1e2BimW9EhrlI7XTUNItPte2ae+puJucrAOQrJgAuj+pNC70tAXK4farW6QRSDoIDYNx0u0eCV1y0h6oQJmAILruFdeMCDsaYPXEuHvAiphDDVHF+pEgZRlEi3qILvxmGNpLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaAf3KD4+QzGmbP8YE4+XWgkw1HmY388wpKZqZVh/AY=;
 b=br96KjgjF0ZhLQYzVaB2t/WoZBjCXrwP3Xgsdn2O4FY8j/OpjsxWkLnEeGIKcGhjZYiMjNjelPr7mmiic3o/wcXvFXiWkA2MhVZcPqjG7W1n6aqVeW2Gbrjmd5y1Dmbb/IuLAFxoNqVcdEcAZr9KClS9NKryBOgC52T+2/2rBeE=
Authentication-Results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO2PR01MB2200.prod.exchangelabs.com (2603:10b6:102:7::26) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.24; Wed, 16 Jun 2021 03:11:11 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4219.026; Wed, 16 Jun 2021
 03:11:11 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Wolfram Sang <wsa@kernel.org>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] i2c: aspeed: Acknowledge Tx done with and without ACK
 irq late
Date: Wed, 16 Jun 2021 10:10:46 +0700
Message-Id: <20210616031046.2317-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210616031046.2317-1-quan@os.amperecomputing.com>
References: <20210616031046.2317-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR03CA0001.apcprd03.prod.outlook.com
 (2603:1096:203:c8::6) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HKAPR03CA0001.apcprd03.prod.outlook.com (2603:1096:203:c8::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Wed, 16 Jun 2021 03:11:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b9b62b8-f427-4ff0-db3a-08d930746447
X-MS-TrafficTypeDiagnostic: CO2PR01MB2200:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO2PR01MB2200E8C7A6359A09EFED6045F20F9@CO2PR01MB2200.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PqwNLb1VQHWBGzZJz9OfKgF5Ew0LNYdzRa3LSMQXUeoVmeFOfx+NAPh0CgVyj08s6/NnfBOxVRHf949jzhGyEC1PxYiHGEB6t4oi68oFcZ3F5cJzhRs81yFleZrZ1eB3cpaZqF4svAWcmrOAN4cIX4jEcookWjCoFUy2JpqZjbWAmqw4WBdABaJSbqawVzgGYLkZQL77/2DrzlWYyWhZvTc8r/O2BEofA3iC793X0tTY6ddr3VhDY2P4uqcEFK3nDxmVGfDyxXFdyZWFg3CZ8SOiA4rY0a2Zcd92y9K7GydM5vq10c37mmwGAO2e/ErHDkKJxKA2ajj/qN8+zkk1TaQa+4qKzcbfC+oW/mvZDWS33nndhYCMEvlCcGGUaMOkXF7R9lvE4HLXKB6DPoR9GaVLisuNbn4mbWjRpKwkIw95XgKoD63P3vabx80WzD7G6/LrwyMIk4QecWNtWig3pG8DcTFcOIUbOpirdyfH7cCwDjgk7BugyYxvxu5GBIHtrCuf2dVGkKHHGM1jO0NaWwVKr+8hE1Wukj0w+aP1CLdFB2PN0+SyLGeagYNz0hXggWv1g/6MUZmZtMEzKmWaoXhLx8HKvn1cxMFd9YbfaFNjHjXsctkHF/6XdSe+GUORfHtuLZdDL+MSM3ceStXojvxtERjzcMfu3yy27y+g7cND+KmmqDsJ1sQCTXAsUjoHyeWVnKDYUHN1OKvUSFND7nqPrGTfTEz/eW6YzLxl5XVKsffQm57OIpqnOn/87xw3J3aACUsxvXy3leGK78YvwiGjIkNdN/Jg5F/oSEN7Nzw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(366004)(346002)(376002)(136003)(66946007)(956004)(1076003)(186003)(16526019)(921005)(2616005)(38100700002)(38350700002)(6512007)(5660300002)(7416002)(83380400001)(8676002)(2906002)(6506007)(107886003)(4326008)(110136005)(54906003)(26005)(6666004)(6486002)(478600001)(52116002)(966005)(8936002)(86362001)(316002)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PZtlynXgUlcbgq+bxkQECUP0m4/3l6s0ukGkkFzTug9NdKMlu5Ed81+wUa0i?=
 =?us-ascii?Q?GEuFMWOyu134xa/ghSL+qkDVvOOjXPCSAVL7by7Md3Y+AE1BK5jAd1B7EkfK?=
 =?us-ascii?Q?s0Id5xK1z+MYui1gzef2cEjB6llmdHArD8qrsyJoUxkWqZdSu7RNH0FZNei+?=
 =?us-ascii?Q?rfBTuTNB+ZdWsWiB21VB3IGOUGj01Hm/oQa5GeeSVJiVEpFippGyygHSMphV?=
 =?us-ascii?Q?cm9qEsQEVZFR7nMe/IZEW7PlysAhuwtKQ1prulROiZkuFFkfxJP4spf9S2hP?=
 =?us-ascii?Q?9NJfGFn/byalE7l0VOJIeCsBQ5ko7PZlU/gHweuyPxGvurN6O7YMXxdml6y6?=
 =?us-ascii?Q?2k3rA8325FTnWrVByB1AH3U/6jeNpne1oYUEwaPiAmqSPqg+BrZrbqcTMt5y?=
 =?us-ascii?Q?/RqeULTyv4JTl/L7Y+Zd/rNKFOuHbAyJCPDXuy2IdtA2Xv93K2KFbdLhJhIC?=
 =?us-ascii?Q?eJeoiE/gUoxl1N0mAzwd6rJJqUDI073dV5dnRm8XUiWBkn6tjXOzanpyDMBD?=
 =?us-ascii?Q?p4125BCqmDTxaSrOhMHC3OT7cAtUw9C+riDIszFkdy3Ecm5DLrgrz9YHr4zq?=
 =?us-ascii?Q?en570uHwuK15VXTKFc40zknruw9S72wJ4OzEwh8PIfrc7RvSgjb/20loTS/6?=
 =?us-ascii?Q?udAI3wkC7QVaZfLJzF5GVr/1NEIKBe/spOdACRnQtlvCZAk8cf7e0DoI3APH?=
 =?us-ascii?Q?vaPQmOsO3f52YGUyqkcd0HMKqGama5SF67hnqb3Gi3xSNLdEYl0pWmuoPBjO?=
 =?us-ascii?Q?Vb5xFMsX7F2LEavtjSCT+GEXDL/8vHbVhTTaQggKPiNvrV3j7g8y3zVZ5Cp1?=
 =?us-ascii?Q?yHzjsj+6vFdieYnJSjWbkMRAsesdAhi7pZ4HyTifa1idrB+BgSkdRl1N3/mi?=
 =?us-ascii?Q?D4qceokqCyZZ3Cn19eWKEK0iNAvMwDqABRhmKp05ysHlm2IdkZNVXn0Hc/xA?=
 =?us-ascii?Q?aI2GAsBX7PZiM9WMWjs7RtG52sjvAxnuSV2chYckzweh2pz2DleOmXbASDtF?=
 =?us-ascii?Q?tf0v26vHATc+hS9rkxnkGUbHd9OEUwKeNOkknMhyPg/WTbaccxjOLAF+/IZk?=
 =?us-ascii?Q?oYUrYiHeI2Fi0213Y2OPQL1cb1abDADlkbxs7hFq+aEOCBBGpNmtynokfx12?=
 =?us-ascii?Q?XzwQrXTGWpW5BBZN6OwQJ0yK1YUc3I4Tze4L8ZNW8fAQyyGSSlCpV1UidjxA?=
 =?us-ascii?Q?SZXRvXglOEbGRCYckVqXypAU+JC8f/GbjVkt0aA3HIs0WBDmkPfl6uHIbNbN?=
 =?us-ascii?Q?jTS5E8HUlxcJm0Xloy8p3j9XLkZ/ll9qDtahbSJ90eWE+9SsoYVO7bdlQ3p2?=
 =?us-ascii?Q?eqFzVyb/r8CF4o8Wa6gc+xzq?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9b62b8-f427-4ff0-db3a-08d930746447
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 03:11:11.2192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9q9KKdJTR42CsC0jJZgDNVpXm7jWoLbRxsrcS6bB3cOCFCBt9bgPJmVcbAvNPfFNckrqgqZYE4FWkmWqH1oeiYlMUTu/vhssoLA5f/Unno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR01MB2200
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in
interrupt handler") acknowledges most interrupts early before the slave
irq handler is executed, except for the "Receive Done Interrupt status"
which is acknowledged late in the interrupt.
However, it is observed that the early acknowledgment of "Transmit Done
Interrupt Status" (with ACK or NACK) often causes the interrupt to be
raised in READ REQUEST state, resulting in "Unexpected ACK on read
request." complaint messages.

Assuming that the "Transmit Done" interrupt should only be acknowledged
once it is truly processed, this commit fixes this issue by acknowledging
this interrupt for both ACK and NACK cases late in the interrupt handler
also.

Fixes: 2be6b47211e1 (i2c: aspeed: Acknowledge most interrupts early in interrupt handler)
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v2:
  + Split to separate series [Joel]
  + Added the Fixes line [Joel]
  + Fixed multiline comment [Joel]
  + Refactor irq clearing code [Joel, Guenter]
  + Revised commit message [Joel]
  + Revised commit message [Quan]
  + About a note to remind why the readl() should immediately follow the
  writel() to fix the race condition when clearing irq status from
  commit c926c87b8e36 ("i2c: aspeed: Avoid i2c interrupt status clear race
  condition"), I think it looks straight forward in this patch and decided
  not to add that note. [Joel]

v1:
  + First introduced in https://lkml.org/lkml/2021/5/19/205

 drivers/i2c/busses/i2c-aspeed.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 3fb37c3f23d4..0f82b46866a8 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -606,8 +606,9 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 
 	spin_lock(&bus->lock);
 	irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
-	/* Ack all interrupts except for Rx done */
-	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
+	/* Ack all interrupts except for Rx done and Tx done with/without ACK */
+	writel(irq_received &
+	       ~(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK),
 	       bus->base + ASPEED_I2C_INTR_STS_REG);
 	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
 	irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
@@ -652,12 +653,12 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
 			irq_received, irq_handled);
 
-	/* Ack Rx done */
-	if (irq_received & ASPEED_I2CD_INTR_RX_DONE) {
-		writel(ASPEED_I2CD_INTR_RX_DONE,
-		       bus->base + ASPEED_I2C_INTR_STS_REG);
-		readl(bus->base + ASPEED_I2C_INTR_STS_REG);
-	}
+	/* Ack Rx done and Tx done with/without ACK */
+	writel(irq_received &
+	       (ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK),
+	       bus->base + ASPEED_I2C_INTR_STS_REG);
+	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
+
 	spin_unlock(&bus->lock);
 	return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
 }
-- 
2.28.0

