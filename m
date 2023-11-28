Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBF67FB352
	for <lists+openbmc@lfdr.de>; Tue, 28 Nov 2023 08:55:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qN/z3KEP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfZWn1Bvlz3bZr
	for <lists+openbmc@lfdr.de>; Tue, 28 Nov 2023 18:55:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qN/z3KEP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe5a::71e; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2071e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::71e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfZSy5r64z3bPM;
	Tue, 28 Nov 2023 18:53:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBnw+PSOzkptiu5+dXANgvBFy9geNQLq77U0zCFw4h0ffBRfcZgwzKOlXK+ANEqFrsnh7gjoBpQ0kWDGuTUu39cJIBXErnM7SbvuO0qG1UYRIVxiC7/+ErKZGDvLOzjtNd8inGR4lNIbFNK3A/JQsesURXf+kEwi94DQqWkI12tweDpaD5kYYPxHR/zcL18/ai6ZeK70dnBytwDlrhtpkXtJhNT/74uQ7Jr5MfAnNeDg1PSVtKnuOy4RiLvnwwtHxtydf4D5o8PJeC0LfKxiEp3BL1dl8WUixskzaDzFUBYtNSurc0ZabKKNc2ov5Xo/+BKxeTilDXCxcB5jQJiwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtkZ2h9mXhBtLKfMjfYUHJA7XpLTI7D4PNWPTVAPXh4=;
 b=RytnGyCpw6ZZx+rss/89UyrQ52Lw97X/97b1y6DWiGRGUr3a1A0EK0XEcULryqshOghGG2uiqJlSBW0UAZMuq/rzYj82HIFIttoWHSHiiQgu+VSokz+CpfpYM+wXS56nXgjfVESiAogDnCR6samsKOUEUqurQsc6+aG0zkW2lkd/Ughjg5Fq6jeLvT0gzGitbuaJnVVPnOu0e4JGMnO639S3PLcHhgBgX8l7sU0khBWK28l3Wm1mzs0kPy5eLOswuU7th8ydibYpmuQMrPPSVNCfSPH4zsdJNiiLdJ35Jvc0SFy0sVd8Wk5ujpOoJ97dU/+SHB5a2Xpzgrd+nt0B7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtkZ2h9mXhBtLKfMjfYUHJA7XpLTI7D4PNWPTVAPXh4=;
 b=qN/z3KEPS9Tnf6gyatWB2S9fG64+OFo9+3mXEmdGjBGjo9NBv4vn7g/RTraO8Xti6t1JM32wWFUPC+pZMV0MYuuSdgCHa1ER98kpJzPi+A6jJ/bc9W4y9+WV6VuDj4CFPcb59KOox8cmjhlT3MZibHGcxgtp/g3/K45WSYlNLyo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 PH0PR01MB7895.prod.exchangelabs.com (2603:10b6:510:28a::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Tue, 28 Nov 2023 07:53:09 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 07:53:09 +0000
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
Subject: [PATCH v2 RESEND 2/2] i2c: aspeed: Acknowledge Tx done with and without ACK irq late
Date: Tue, 28 Nov 2023 14:52:36 +0700
Message-Id: <20231128075236.2724038-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20231128075236.2724038-1-quan@os.amperecomputing.com>
References: <20231128075236.2724038-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|PH0PR01MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: 9048d942-9b4a-42da-45ff-08dbefe70ff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	EbKx9Li1zjFHsJJOcnQcx6yC7ba1vB2Cnexy2jAn/a7ajwcbABPon9oRHQB5AF2IFIVdgtcYoYF5UZNmcyCIQlYR/jfr/+9sep4Wb/7OZAqLoNiErCxjvKTKq9p1dvfnT2/E610Vyiq0iblHsLEIygDFf/Q7PgXA1hT0WYMeY6fX8K7ALW7dMPuRSG04oo2RIr4fs/Apq627CQBHCmwKKwWd69HmBNLAO4I90vUAwLX6061Hjx6/3inhOkIoalHV7SITf01ar0X1zR0n9amPTgg+4ULeTsKNg1DDPlxtVpLVS655mqV2qyAidECwumfdCPoz9Vt/+cG1sIojMhUqKKvfbwyZOJjc41AKQ1FHGe3FO60I7BbokxlbWeU8lSEso7dMQIVZcmiaNEV3cNGPkR6alYyNCuElf3wF6iAd2hVd9/UHsPidUoZ6d1P5k7ficmEEMLv4csYLBcufuhwGXT0ljVk+W2Sb1I+2rVPdjc/L0gTwtTMeh3SHRGzNQQp7hIxYfTW8qF42cz7+oqft9Lapn+3ATvG9WvRlwxELO7ctgt7s2kKMmfJJ9pfB6znXbeDigiUNUdGs3piErYTb1QpAQv6uYUvSRvlwcm2FhjqQCsFAqMaE4Pt7x2MjqyTx
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39850400004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(4326008)(41300700001)(8936002)(2906002)(8676002)(6512007)(2616005)(6506007)(52116002)(86362001)(107886003)(316002)(66556008)(66476007)(921008)(66946007)(38350700005)(7416002)(54906003)(5660300002)(1076003)(478600001)(6666004)(26005)(6486002)(110136005)(966005)(83380400001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?P/6TwgBolVNVVBEIJfsfm7kmfNHVZzbaSPmgq7NWjaeTo19fJqjwpfjAONqN?=
 =?us-ascii?Q?orTJEL4psbyoD4cq87dDba+aQlM2gpd2gkOxZzBLjjJOEwMJmT4KsvwWZvAF?=
 =?us-ascii?Q?bnyswp3jIupQ4v/+PW76DPodTEN80sV/BmHo1YzxPj4yRiYLNJ3lQ8cCkElA?=
 =?us-ascii?Q?HXV+tbfS9Ue0neR73hWaIpYdJXKnPZF6rZLk7Ehm44sbtjnvyTLWNSavbOl5?=
 =?us-ascii?Q?fXfJnpOqjjANrXesnVrLRHDFrfCwtyO7q8arC1CB84Qy7TUJus+j3PLj57lW?=
 =?us-ascii?Q?bq3cJWJ+LWCNNnW9/x0NLgqFuNQYms8G2Xs3RLM05lAD7UITr5VJoX+yn5PB?=
 =?us-ascii?Q?27Jh/XN5mb/sZiNoXFmJQbAaCo3ZZf3Us4qnl3IcIW2xMPooRX0k5PfUsFu0?=
 =?us-ascii?Q?m6bpcY0IZuyuT2KwD41zMr+HKDVkhi+tqFqzuhx14k/IOikMaJe90aPGZHAS?=
 =?us-ascii?Q?8uAs71hI7WIYEQ9YblGkMFJoS0/RHqWGe6ujqfaoVLh+AtvPLB0d8w87FjGe?=
 =?us-ascii?Q?6VjiFqyTobb6LIE330Ut0NYQuN+yMXk0dqPvMl6l/vQzmIL0A/ZJTywvGTh/?=
 =?us-ascii?Q?866NvhqMu6eOVxapGUe9dJHUwEUOftQ93fxisUcsJX9vALsRCAAb9SlmBGuI?=
 =?us-ascii?Q?rsY1RJqI3IxfoQQNducO0XpCsCY5dSOdBzIK5eY/HRNRvGL6cirzTS9jMSuW?=
 =?us-ascii?Q?m6W1WGMlg4tTvDYyJFz9v2cgj+nlYhhnLACRGloQO8dr7AhwHySHA6d+3V9w?=
 =?us-ascii?Q?BNS4sbx+2awa9NGfAgBIKA1iSXu9tZaaZl2UFsNoeNq8dPlte+SYsLS1NmQA?=
 =?us-ascii?Q?LFu2Jinaed6PlDINh5CpZ2RnSQhSNc1DPPB7I+2O6HEzpWf4+C5Jmg+c7F4Z?=
 =?us-ascii?Q?jXDx4UcxtQ567erYMUXMgHqrmBUo2sfkbk1FFmOHsWt381pEvOGAGVajBPLp?=
 =?us-ascii?Q?BjBuNTHvHQwbJLg2bDchIuhtp4aS8g4pJuyMtUuShheoaghuwM7Z3iHeQPm9?=
 =?us-ascii?Q?I10q6ShDE1Ga9YP66QCSeplEvqv6YBBqaAq3SsNAh2Y0/dxIx2JFH6NyKAPi?=
 =?us-ascii?Q?FZc7I8xiD0TWfDLRb9Oiso5L/ExYFXIDPP8s8io3gdUXNBTa0D8JbDd2Mi7J?=
 =?us-ascii?Q?a0jiMtOj68dk8F3AxkXHYdWFGbvohgft9BH8fbZqCDM1ZyRQZoLteKUnTeMj?=
 =?us-ascii?Q?x3cNEOdMhJiRtZXfQ+xRQC5sl/RJKYWJOXDBT463pnJk6JW0hRR43JIMxIYt?=
 =?us-ascii?Q?yutuoMhoPEWCJi7DTn1EiwQFIN/1vxts40xKUjnsgENsT/HJb5c6qWhFg6Zf?=
 =?us-ascii?Q?fjSY9nxkMC+USd2Yj5VR3fslmIm289Mqtkt+txM7dwezVqG+QARJfPzdwTY0?=
 =?us-ascii?Q?weZgtvdZtGpMl1VY+cmDqLP0ZFt9D5wtGKKxiRbRxS9c9FKHF86jitl+eGUF?=
 =?us-ascii?Q?KlkeLk7S+53Hg7xXPWMH3+AIMc/f0H/w0PR549Cipg+j5TxVzSj0Y96N/f7A?=
 =?us-ascii?Q?0l05EFdy/HdcbpbP7rK9W1TiY4hT74DUIcive/+CMfMM9UO8DEf6gSBachVv?=
 =?us-ascii?Q?PGFXpgdqc4b+JV7GHgthah8/BUPF3fuvOn4W13TYqavZw3Qe0deXJbJ0meFF?=
 =?us-ascii?Q?hW+CKT3Kh94+zeiLmC4IEDc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9048d942-9b4a-42da-45ff-08dbefe70ff8
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 07:53:08.9241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gW+M3wKwjgOURJulrCb61DrhQGGIpIYaxkDpCMe8t2Jt18WmTqntA2bGMo/AZtymN0063TggJGYxQq6HFih7xo8rJY+gsIJsG7BMnwjsKzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB7895
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
Cc: Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
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

Fixes: 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in interrupt handler")
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
writel() to fix the race condition when clearing irq status from commit
c926c87b8e36 ("i2c: aspeed: Avoid i2c interrupt status clear race
condition"), I think it looks straight forward in this patch and decided
not to add that note. [Joel]

v1:
  + First introduced in
https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomputing.com/
---
 drivers/i2c/busses/i2c-aspeed.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 79476b46285b..3231f430e335 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -611,8 +611,9 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 
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
@@ -657,12 +658,12 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
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
2.35.1

