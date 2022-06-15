Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C6354C446
	for <lists+openbmc@lfdr.de>; Wed, 15 Jun 2022 11:07:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNKF01qQjz3bsB
	for <lists+openbmc@lfdr.de>; Wed, 15 Jun 2022 19:07:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=rEZh3U14;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe5b::728; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=rEZh3U14;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20728.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::728])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNK9f3Lwgz3c7S;
	Wed, 15 Jun 2022 19:04:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeaAFKx8KsTxyAtT/rlemxx0LuzSjrNpGj8VzPBSiX0rPVtE0L2LHcFrFxz+WhtRMk1MrOQiHQPRzOf5sGTRP2qQsQhVCgrYGnAFVl4Nsp+zQuuKBdUaFqVunceDzMFtTrNSMCnerjB+AEwBbRjwS3c5sX8i8fZ3KL1E/0zB540/y19fs2/DKb3YRFCFDdASOqvSz8TL/7lsvQ4uV2OoRe1jvCTzT/bwooBqPWaHKLgJ1rZISgqzJoIZRJWTP6vgqeLwWNXwfmohchuFtDMT94lP0pIPkaK6/bt0IYww+2AeHIl+Vuq2rzevXUk5rUU8DuEnyaKXqOWhVDxHy4quOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yY+JGXPT07FYHFt/DZ+nLA+W08wbKn7f4XO1Mu0iF0E=;
 b=N731RStz6bgBX0RdQY5MdQDDhUy0x01AtsCm3NDuIarkn5Tk9IqRZn2RD4OmHXC16Vqexu3mSiXJVLGcT+pp0t4jLrg6HD+5Y6KzcccG7I9ka3u/mTiMMcHQMT7UOF8KoRcyr0s9qrSb/rtXs1uMZRQ/SCoMBZhcxZfRsPARvYoYrONR/K0xZUH4UwybtwTcYOpj7N6tw73jZEbhNmKcwNoptVeCHrqOe6bwMvLXFIz8rrioPK6lG3oJg5NyKQBhpZ8dau5clCrKMuoyhXA1KZq0YUHNwv9rvcwpE4+VHALTeWNKBNy72Y1HjZH8YqPGE2uXVrdXdleqXWYRcYQC4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yY+JGXPT07FYHFt/DZ+nLA+W08wbKn7f4XO1Mu0iF0E=;
 b=rEZh3U14eaaorob5C55RA/ERxesr4ki4roZo6pnG1Cs/s4igKpkG1ASXmCaaKz4tlc1IAZosRGvseW9b5AbhhTBDpI7hxaicX3oKHdhJgOoGY2y//qgsV6p9txN+69KjEdvslXaRwjAbFdaXbRshZlQyvJ/lQGWgkKrP6YoMvNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BY5PR01MB6049.prod.exchangelabs.com (2603:10b6:a03:1bd::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12; Wed, 15 Jun 2022 09:03:42 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 09:03:42 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Quan Nguyen <quan@os.amperecomputing.com>,
	Corey Minyard <minyard@acm.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Brendan Higgins <brendanhiggins@google.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Wolfram Sang <wsa@kernel.org>,
	openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH v8 3/3] i2c: aspeed: Assert NAK when slave is busy
Date: Wed, 15 Jun 2022 16:02:59 +0700
Message-Id: <20220615090259.1121405-4-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615090259.1121405-1-quan@os.amperecomputing.com>
References: <20220615090259.1121405-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0189.apcprd06.prod.outlook.com (2603:1096:4:1::21)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba968699-d8d6-4ff9-4d5c-08da4eadf120
X-MS-TrafficTypeDiagnostic: BY5PR01MB6049:EE_
X-Microsoft-Antispam-PRVS: 	<BY5PR01MB60497F459A3FB6D89BBF1C0EF2AD9@BY5PR01MB6049.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	zGKtg09K2Ga+07FilLNmiWGZi5Fue4wQ277TV9JyI11B5ePC9gLhFMULVnKkrUlJSs0cnI5ScBeewqAylQuuq+jr+M4VrHjIjI3NocYRWKPVFqYTF4GHW6yvf1bVpPO4zk5iMG0h2enqgTxX780czV5Jgr5hSZHidlA31Y3aY6cTt3yTQlA2QNBj6oGCK747Lm1vF8b0v16EoT/I16yyp2gRE44PLP9pjynoeGxUn1UeDDgIoaqdP7n1qfglbeGIozBgpcilroh+lJVFGE5a1+IGr2J1QaSJhpJRAeTXnYRQmmj2ubzU/8jvZCg5uKjRQvEICyjyuu1A0JKaVQVfvn2FePNho46cWVBgX+9EtakC/CEiEZuggF4kG91zt5rBEmPR17cVQWQVM0fIOeJibsPmq1PMyEdZxLIjHY7vF7M8vqxOpyCocR+8BFwsCn6lIGGUWLh3MmBeBjx1hUiRU4LjDbWZJS1myoX/iAQ4qlEAhVOXYKLbY5yyvKGyAawTYruZ70HWOOlIktRyFjB6YDhbDWpPkdbatITIrAuh0osFxHIRoMMZzP/amDl0wZ68Lb5yjSzwY5dZCOE9Nf+xrg+JcQZe1J1XtGt5p8YJr1XxffNMfCNbwXikVgQpAV/zKlRuSjR0w8MDmp0nYFgEBLhpNpHKpblqVCPk3qOELEjtcJzT8IuBwIICBjOsD291GWTZZmIeVKNftLatthx3b0UkBM3RLi6306i9OSBEVRQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66556008)(66476007)(6666004)(508600001)(4326008)(83380400001)(38350700002)(8676002)(1076003)(2616005)(6486002)(316002)(107886003)(52116002)(8936002)(186003)(66946007)(6506007)(5660300002)(2906002)(6512007)(110136005)(26005)(54906003)(38100700002)(86362001)(921005)(7416002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Zcci+qM+7J2sVgi3h54Oih7Oq+rN5lVdzvUOr/kyWCarCse62Di1djmOM1iC?=
 =?us-ascii?Q?ifaNrX9uPR6iMIF9/MAMEC57BOEK6towWofbJ5cBDRmnis9etiUxyyiVumET?=
 =?us-ascii?Q?LzbB6wbSY0mexH7fS9dMd9wHR8rXCXBE0z1TtzJdVulus7v/upEshzJrqTCO?=
 =?us-ascii?Q?4cy7NlcqZI6CUnLNJ8yn6I59Ul9NHr8Z/d6MOhNph/g6T4G4UZfRYTcwFYep?=
 =?us-ascii?Q?0QaXhU8oafmlE4V3EUx0b2chSEbDmZUSVyGHURyZCfE9Alne+tv6E+cx42z2?=
 =?us-ascii?Q?qImWqlopt1XNcvM1zPOzKkRQslf8+AQnMmX0RbjR6Y5MFxqY/cnbPaL9DpcC?=
 =?us-ascii?Q?L6QYWuzbr9BvDtlQvp13P//tZ6dE9/UjVJnteHI6Kh5Ud8z73vhQXFqDxyBg?=
 =?us-ascii?Q?Ssu2b6PxvTji083cVrklqcQFUWDFQSBA5EeGMt2CA4BmaiyZ7QgqR7gBca8R?=
 =?us-ascii?Q?qHRliE0qh5ItkI4PPkydcfp6r5IBj26wJwW57qQ2ZKsUY5qfqEpDCsZIBaJu?=
 =?us-ascii?Q?0lI5rM+jKs/oWri81S3eKwva7qQBh0LxIq3ROoWHOGqSv+nvaUgkxg/Ti+fO?=
 =?us-ascii?Q?yGdixSR2653HoC2GGd58vZdnL2xxY+5xBjlRDPmgfOqigw0idwsGp6JqIgdZ?=
 =?us-ascii?Q?K75ftgxnookqTCPsOIvH2EwAQBOPlqvMYoME+R5+3zeEnEJO8/zV7r/CSvVp?=
 =?us-ascii?Q?/kZk6Kml5vNOhYoczOuJ1osv3iAc4RF7vpaejUzlt4DZ9ON07jQbjF+KXlPe?=
 =?us-ascii?Q?HIBHIFaPFiM9F4v+od6EtbfRsJIs5YS0k3+dERVz46MtdOZjV4VsUfkXREnN?=
 =?us-ascii?Q?RLtWv+LZZOFckf9atTNEhTD3Oy9iLcWgWnJx+qq6I/fciGEd3Ko1tbKoQo6S?=
 =?us-ascii?Q?YwKPyZlUXQf/2AW+Fhr/MXnIzA+wBuO+XqwWwSAyTWEwsUqcZHqlKdivTxMU?=
 =?us-ascii?Q?HVWqs3CumbUMyTF6+i54k2BssqeRcasUMI2PcnkqhxCUyxWHNSxm+SUEQIsC?=
 =?us-ascii?Q?PjubgL7PsjhjA39SIv5ClFa0qVHkiKvbCz7ihmDNi7vWjqtmAAe97CUIie5w?=
 =?us-ascii?Q?hMj92KrL2/UlsT93aGjtY3WQRdpyJ/LpJFSnI1T4Asay1Gly1jqbNuMPwxEU?=
 =?us-ascii?Q?JikipQqtcdCunm3QhSxJbJo6b/hVPXQ/G63jRDjgppYDEKqH8GUcPPiWkeSR?=
 =?us-ascii?Q?AmP+NOtyV4lfDZYaoTEeC2fbAqdIkmWHMqYnPAM3S9OirZSrbivmiHpOanbT?=
 =?us-ascii?Q?3OGNbF1F1uEg72coxRuGl98yN6N+1t1VVAtEM7YG+W+d2TMgIOLzAoWnw5C6?=
 =?us-ascii?Q?NlcOrbU94khQSKnw7pUXdcZjGFZWvhb7ENbeex99C0YIurZmtf41IeREC4gA?=
 =?us-ascii?Q?eyIfLXpH1Eu7FV/UM3LJssWxa9a2yXKI4BtSVJsCiXJuf9WztcL/ZNGcm7PI?=
 =?us-ascii?Q?FhczAa6PnC50blJ6EgMfqqa0I20PxnnbgkY6zik6lLFqe+euwz+ZSySO3+oY?=
 =?us-ascii?Q?YnrwSGoKPoDwPGMg8vbKbXze5dBtdXCIRfwxz0/W2XM+aTjqfsGwLadFZHTu?=
 =?us-ascii?Q?osz7zCmn8Mja2nDii5RZap/1aiR/DndGAeJpn5StyI+n477BLiXJvCwS0LGN?=
 =?us-ascii?Q?GoN9hJbDF8wtqF3VetwObQUZJTEdBwbC2MRwDlslfQjWy21dgR+1eqTaQGY7?=
 =?us-ascii?Q?Ztky2l0HDe3JkNfPABaZqBNoXG7pQ6yd/mvgy0Mf0G0B8LUPwEi97J5ep4W0?=
 =?us-ascii?Q?OI7hGAqYKzoC+ceN5lDRrCfVmMLwrgJjJCSZcwvlsJleN7HW7ZEa?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba968699-d8d6-4ff9-4d5c-08da4eadf120
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 09:03:42.0110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4LE9NuCeXTGzIR8NWYgChCT08uhXibQpey3CXP7Rdo/+Ra1PGN8vhNraZZiRstATqkvM4WfrjRnbnvxERQfTuwpw692UfJdazTaetsv2MU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR01MB6049
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
Cc: Open Source Submission <patches@amperecomputing.com>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When processing I2C_SLAVE_WRITE_REQUESTED event, if slave returns
-EBUSY, i2c controller should issue RxCmdLast command to assert NAK
on the bus.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v7 -> v8:
  + None

v6:
  + New introduced in v6                      [Quan]

 drivers/i2c/busses/i2c-aspeed.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 771e53d3d197..ebc2b92656c8 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -244,6 +244,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 	u32 command, irq_handled = 0;
 	struct i2c_client *slave = bus->slave;
 	u8 value;
+	int ret;
 
 	if (!slave)
 		return 0;
@@ -311,7 +312,9 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		break;
 	case ASPEED_I2C_SLAVE_WRITE_REQUESTED:
 		bus->slave_state = ASPEED_I2C_SLAVE_WRITE_RECEIVED;
-		i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+		ret = i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+		if (ret == -EBUSY)
+			writel(ASPEED_I2CD_M_S_RX_CMD_LAST, bus->base + ASPEED_I2C_CMD_REG);
 		break;
 	case ASPEED_I2C_SLAVE_WRITE_RECEIVED:
 		i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED, &value);
-- 
2.35.1

