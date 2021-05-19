Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C53F3888BA
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 09:52:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlQ8G1dvQz2yxx
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 17:52:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=HubBXMIM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.100.122;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=HubBXMIM; 
 dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2122.outbound.protection.outlook.com [40.107.100.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlQ5n3tBNz2xvc;
 Wed, 19 May 2021 17:50:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQvmGutb/vHC8DS+xxGsvISJZ58En5zJX+GACGLfri9h9cZO9jwX7U89zc6eGJIP9ytAZjhOzFwuojIH3TY1WCqePMnoTSfK0a+4e3R//GSm4NQpDV582yvFyLZIvTtG9CQlcb259IBrMe7/h6/mek6ZWSdKCHZFwrYSj35kHCVL9xHM5CoqWGVyaqxtsauoeSf9Wa9ro6dB0bb01f2F4JSvoDBQoGhTf1jLoBaPmxd5Bj0/XthprpDaxaJN9Wcn9kV6hap/K2XtWUg0Lggw/s8+3WJIW3mhSlRHDtF+l5JI4XBscxwbdzFsjtvlswSvxsngj0q7X0XwvfIkkhFopA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vje+03qevVU6+32AS/CatzC60RQwdsWneb80iFwSmC4=;
 b=HHHrZfGHgRmx3JloaPkZRZlr+mn246qHZu9WgHoscFLPcyzvi0pHwmoZqmqEdNKEgGbRpE+1Ez8Dffbukvv165XN8Nr6NrJYwbpED8yzG0+kAS0fXrUsLrPXgQrAs2fz0K2oKEF3ngfDwO7+YdAW0z5TcRdRLTteaajV7Bft+Ine+XrpoP6DNREwYo9RNlhUAuJKpJZ5zPtE1t4Q9AqK5Nc3x0dzHpQ9fvXMs8s+OlTLayTCiYNhLtS/bZi9O8SoNS7XwCyZtncSlLLhPG1Zivr/9Ej9c1nsLn67Rf4gW8tN3XEZcYaRvDdtN9mL2KLvV2jNzPFNYuJGUJb889WjCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vje+03qevVU6+32AS/CatzC60RQwdsWneb80iFwSmC4=;
 b=HubBXMIMmRJo1Zqj0Nc1J4or3rOJp6wwVZoHb6p1zIY2z5/6aaLWZ03mtlnqZlZ1EFCGO8QGXiOgdeteUkaFV6VcbOYdYMw+hwCO7B4jtCLRRbdAljD+KYUX+9hu8PLICm73/wZ7BBijZuhdhAa3fbheGZJCs8p96e64zveGWzA=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO1PR01MB6743.prod.exchangelabs.com (2603:10b6:303:d5::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.26; Wed, 19 May 2021 07:50:33 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 07:50:32 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Wolfram Sang <wsa@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH v3 4/7] i2c: aspeed: Acknowledge Tx done w/wo ACK irq late
Date: Wed, 19 May 2021 14:49:31 +0700
Message-Id: <20210519074934.20712-5-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210519074934.20712-1-quan@os.amperecomputing.com>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR04CA0081.apcprd04.prod.outlook.com
 (2603:1096:202:15::25) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK2PR04CA0081.apcprd04.prod.outlook.com (2603:1096:202:15::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 07:50:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2418c50-8fee-4f63-f5ea-08d91a9ac77a
X-MS-TrafficTypeDiagnostic: CO1PR01MB6743:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR01MB67435816505D584640D67BA8F22B9@CO1PR01MB6743.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jLJkJWUfLVVr+Uhc5cxc8v0KDPPJUSi6Z1MCHljoB+nOCpV5cf1kJBubvqNInG/msDAgy2yveBCTGTnQFOpt0o1cgz4+emPNgTQHWDv7wbRAI5Pz4r19XvHT9VkxMaK8g4HEEZeCEmppNm3aAUa4iRftllqe+aGFLo8nEWzqXFwDbfNNwejFtGmCaU/upNchfj76575m4mx2RrSN6blyeQlkkbIJhUcc3G5c0o8MU7f+vVFu4R9inZL4s6SvgnGThyvTcLndl2P9vyMUQvSdDzRZicIrdvW5ERx1K6ieswVGO7qJWfZji7NWztdrOBhNSHgOZqHvMlMKcnY5wfXeche7dQCtV5Uf7MoUFlEorIDsQOfzz9iyl2xRkkvwAAUpdclxkkei+irFn5il6PW018VHbNGxAbzRuweYTJ//+lXK3WO8tqNqTDIvmiEs5X18aD38n1u7jOJdNnnz3FnCIG8fjmlVVAvfrw3dhE9BSPLGOcvb2Joh32xK0rr4Q+FQyTm2UVXf+3grw+5I8h2xmQizAgySLTjKLi5rd3BlS5Vngzqja9YoKnbeHqPhkYpemeQ73tshGmaCEZbzxEu1ESSIRzrZEhAaUQYpouG0JMHk91oaplcZNtPQ4zaJoQdxgHXkDA/cFhRszVndhVHXVDMnQU0m3E176ABBHrddGsU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(376002)(136003)(346002)(396003)(478600001)(66946007)(66476007)(8676002)(8936002)(956004)(921005)(66556008)(52116002)(6506007)(2616005)(6512007)(5660300002)(86362001)(4326008)(38100700002)(1076003)(38350700002)(7416002)(316002)(83380400001)(186003)(6666004)(2906002)(110136005)(54906003)(6486002)(16526019)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ToJVO/5iyna5eBVqkey+8GgyoobcAhBGvp8J9YzXSuTS0KJfn+qHqnNANG+7?=
 =?us-ascii?Q?YI/pO94rJAsRN+tUlLveluytVVsj0GAICtv8dYeJFBlL4OJkN1JkwLGLwZvA?=
 =?us-ascii?Q?7L2dQuXMUo1RtKSQHHSsGCL/k0d5A5CDIJmz1Cz7ldF4mkJgfHp5c6BMDFis?=
 =?us-ascii?Q?TJk2mq8BADHsjspdQwcMvpqJvRedJUURbO/5Ekf/MEybz9aw1qv5Z6hjdIgp?=
 =?us-ascii?Q?tm3gVCEm+aBH995E9xQ0QIJ7iG4vUX4zGwc8ylhfbr5m+pV+vmFQYmI7N6zP?=
 =?us-ascii?Q?LhFW/r9j1AOFFssiqfc7BBiR3w4ileBnI5BGGYdeACyOeqhZiMIM273YwQvt?=
 =?us-ascii?Q?HvfW4mHqVDEhMuJllMn+GwGHHo8J28rfB7m9X8ZufnzviELtwN5DUSXwALVH?=
 =?us-ascii?Q?tZD1obDko7USo20BbJaw5HEWMl8ZzJiX4OnK9vcwnMT1RmcS1OTGJVUkBh2o?=
 =?us-ascii?Q?SoduwiDlGjS5zZXk91ArPNZB5sSTfBY03fa17nvo7pwJdiFOA8/C1eKo29LH?=
 =?us-ascii?Q?LHaLwvKkXuQSFk4FXKuCgildKvefSymMxU7GDAsPbdAMcqLD5B0VlU5ejHYh?=
 =?us-ascii?Q?lIPU3nPUxH4tdI3TqbBU/K2TP/O/fXKnAu7ZKSxXPCHsnd2+kCXQSZaJ+sav?=
 =?us-ascii?Q?9Qwufh5JIS3HX4zCzNUXyQkMgsEQvuNxrJDWGadwwWwdIyOWA6Q244I0uww5?=
 =?us-ascii?Q?ehNcAwOYDdRVvuSG5KBvhMnADbo7e/ChgJIqtc5TcoX4P1iqJLcOIopmde7R?=
 =?us-ascii?Q?PlulP9wCZp0Cz+0e12mN34FnMSKvjbvixxpWFla0EzpMY9Z12KYZBX6IJ972?=
 =?us-ascii?Q?zdX8/h5oZCWhweCUpAl01NlhGVcVXqN76OCXei5aLAMrZILf7akMmGneKWUM?=
 =?us-ascii?Q?Z/0g04jjnQqZT6gMaautfc+Bty2uz77mG4HvugNBZEggT1ec9KHAj3FEl+mF?=
 =?us-ascii?Q?16wK0qNcMp6LCeAuImYGD+RJhC0wGd8uVnx0Qt+HIDRj0EoOyaw6b1/z0zw8?=
 =?us-ascii?Q?ZvVhYIFe3ajFtC03ZkiG8CcJj7dW7vI9Mw1TUz4b8UVbh9aMcPCN2POHEqRe?=
 =?us-ascii?Q?saGOyh6fthOFsDZc24er/cadB2LJfN6rykO8Jrp9LjSRNUegXjRm10cRqYas?=
 =?us-ascii?Q?FhKFypkQTHDom6nrvfnMppJH8wgS1k5gzvMpSn9JL4duV8jnDHKSqS4vhe57?=
 =?us-ascii?Q?mUm6gndR15tHRsRmrkGRPebKLUVooY+z7DIJcUaBj61a/p9w4jyh8d4Q6ctE?=
 =?us-ascii?Q?OJwwoFI84zZcVB5JaPxkDycOCPa3pJ4sfvwozkdvWbev07ynVPmjc/Dhc/5j?=
 =?us-ascii?Q?Qxqp1Ho+WRH7y99NlaVi0gSi?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2418c50-8fee-4f63-f5ea-08d91a9ac77a
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 07:50:32.8243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NluZkF8BB6Dj0Got2FxuiLIIpzRq7sW2PEK5Bu3qB+1SliDKYNXPGZJhNvqtmjQnICMw/5dMufmHte+h+4G+NRqzgEQjkdeDPHoPV5v0lg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6743
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
 Phong Vo <phong@os.amperecomputing.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

With Tx done w/wo ACK are ack'ed early at beginning of irq handler,
it is observed that, usually, the Tx done with Ack irq raises in the
READ REQUESTED state. This is unexpected and complaint as below appear:
"Unexpected Ack on read request"

Assumed that Tx done should only be ack'ed once it was truly processed,
switch to late ack'ed this two irqs and seen this issue go away through
test with AST2500..

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v3:
  + First introduce in v3 [Quan]

 drivers/i2c/busses/i2c-aspeed.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 3fb37c3f23d4..b2e9c8f0ddf7 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -606,8 +606,12 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 
 	spin_lock(&bus->lock);
 	irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
-	/* Ack all interrupts except for Rx done */
-	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
+	/*
+	 * Ack all interrupts except for Rx done and
+	 * Tx done with/without ACK
+	 */
+	writel(irq_received &
+	       ~(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK),
 	       bus->base + ASPEED_I2C_INTR_STS_REG);
 	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
 	irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
@@ -652,12 +656,18 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
 			irq_received, irq_handled);
 
-	/* Ack Rx done */
-	if (irq_received & ASPEED_I2CD_INTR_RX_DONE) {
-		writel(ASPEED_I2CD_INTR_RX_DONE,
-		       bus->base + ASPEED_I2C_INTR_STS_REG);
-		readl(bus->base + ASPEED_I2C_INTR_STS_REG);
-	}
+	/* Ack Rx done and Tx done with/without ACK */
+	/* Note: Re-use irq_handled variable */
+	irq_handled = 0;
+	if (irq_received & ASPEED_I2CD_INTR_RX_DONE)
+		irq_handled |= ASPEED_I2CD_INTR_RX_DONE;
+	if (irq_received & ASPEED_I2CD_INTR_TX_ACK)
+		irq_handled |= ASPEED_I2CD_INTR_TX_ACK;
+	if (irq_received & ASPEED_I2CD_INTR_TX_NAK)
+		irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
+	writel(irq_handled, bus->base + ASPEED_I2C_INTR_STS_REG);
+	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
+
 	spin_unlock(&bus->lock);
 	return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
 }
-- 
2.28.0

