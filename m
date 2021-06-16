Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7A73A8F34
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 05:12:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4VbT3m6Fz3073
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 13:12:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=advq2Sui;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.122;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=advq2Sui; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2122.outbound.protection.outlook.com [40.107.237.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4VZY4MJdz2yWN;
 Wed, 16 Jun 2021 13:11:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MihNvVVeub61WIW22I9aRhDbajJ1ENqlVEPjxN8ErTMk15ERrmYjBQ7IJ5OrKE6mwY08oACaPjIsAiuS5c8C9huFvsg83WViPOSUbXxxM+6DyNrybMv2MUxJ345H6FRcofigyB+gljGO/UOOVI7OETk5+zUEn9g4tu15Ma7/z1OIH2M95anM8pvpKGlQBhn/b3TEMPy34JbQGwllviDuhx0PtQqWbWKy6ztnI7tS3yf9Vst2SChkHWxmWjRSGzXX88oY6g0Q3D2YND22/SAtzjNF170zyCVKiHfv15gI4+YDOswLn+zH4WiYDPL0SVUVLWFOFS10Wx+sTFHpQVmweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22s6r96HZ+kD1ry5av/wS/YRBfTfw09xA9MRtlwFDy0=;
 b=M2Ums2tPWQafrSByrxs7f/EuKIDqkc/95K/8B9KaxVd/rw+arMORbWcatL7ZvX43zkoJYVpEKy7TuBs4d6+yuYQdMNCytU3JZDSd6SLcwQf6MMdx+fvcZCSsh1IkJyNPnfUj78W46xe+o25MHkoyFR0GVDUmPJcfFxDp0idCRzR+JEVrDem45dzOSWTpoRMAxB9NeX2vTgigocNFEmYT8RBkOR7Hwd3+gXhi1WggQHCS6KmcxNH6nyw9oZS/cJl5nc/RBUntUPiHeN/jLTcnH3f8bn0qqhyLoNNqFohMirqG7oIRcCqQ6PefAGcbGrg+0+qTwYij/HzxPjKSV1pamQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22s6r96HZ+kD1ry5av/wS/YRBfTfw09xA9MRtlwFDy0=;
 b=advq2SuirlzqO49/cwMlXxmk0Re9r8/rkRuCGeF08QGvzRPlUJTqp8iSM61CG8XoXbsNwo4FkoQ1HYyujnkdQ1IXkXTZHKjwkKGvdNRNNxdsbSxwRk/5tCbNgN4P+AxOSxEr9XnoMlVAcP/brWYRffxIiSgjbklqLjIwIXpsEVI=
Authentication-Results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO2PR01MB2200.prod.exchangelabs.com (2603:10b6:102:7::26) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.24; Wed, 16 Jun 2021 03:11:07 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4219.026; Wed, 16 Jun 2021
 03:11:07 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Wolfram Sang <wsa@kernel.org>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] i2c: aspeed: Fix unhandled Tx done with NAK
Date: Wed, 16 Jun 2021 10:10:45 +0700
Message-Id: <20210616031046.2317-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210616031046.2317-1-quan@os.amperecomputing.com>
References: <20210616031046.2317-1-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR03CA0001.apcprd03.prod.outlook.com
 (2603:1096:203:c8::6) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HKAPR03CA0001.apcprd03.prod.outlook.com (2603:1096:203:c8::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Wed, 16 Jun 2021 03:11:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a113aca-59e9-4603-6c0e-08d930746217
X-MS-TrafficTypeDiagnostic: CO2PR01MB2200:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO2PR01MB2200B3C7C4740A0F936F5988F20F9@CO2PR01MB2200.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gd8ls5NziJn+z2h/B1vNDSkEBbbFmeywTUr5qJ0NdVsENyk8JSjKGuqPISwOopkyfOtwbE/5SZTRzc5pWQbFTZTUzU9j6gDJHwELms3Qf81LdJcNDdXv4luyF6hvqArjXt4LuY31Ir8ALvyqT/ieB49azGndQ2tNWo/bFUZTuNGkoc3DP3im9DX2A7fVRQ7Zfk/RSLJ9WJIQSj3NX2PSjiRE/LKEOpDqQTZiT2D7kb+kVYGbr/ct92gd+4XQzKm+QUlkkiO8h8E88OVHUyNDrYw9QJIl2pX/XVxUlIg8/Ti0hcdzK/d7OkUuqpDLan9VaeRSoOszoRIJyTWBG36XMZZ3o5YGUuUEQ88lw3W8rGjRMewBs/wBgSQK1Tm3MZN78LUtwuPEjbX2yCi+sfiYECqRwyY2cNAEqulMuDrHgdip61BzDVtgXpbKUY+/qIRFhFPEH5tKjBk6TMV7Y+F67DXFOMZ56LJfhwjIRRwnWMl1J2P7E6Sb/f7Z1otm/HZ7/xgTGbhRKBw4zE3+5wbmTTQpoqVUxBGwY3q4J6EcXWzyP5udDBTftnXbC8hMFTFjg29/qk12ps4mc7F1eAGiOe1YmRoqnYpjk9rG8n9NHhwAu/RMPiPpWJryYMTno0/RyZdW0BrI5IzMdSiR3rBGxSKZPi5v6pFnreB5+g1vTV+otWBRP6F7djzRZgz+/jw4JejNLPw0ZbDoJ1VObYGCLbEURZIs2980nOpNIJ54i2eslVvmpp4Cn2/Wqj2T5Nft+4+K9usC4H5UIYBww9mVDmBt0L4MkbxuOE7Eb3pU6Ok=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(366004)(346002)(376002)(136003)(66946007)(956004)(1076003)(186003)(16526019)(921005)(2616005)(38100700002)(38350700002)(6512007)(5660300002)(7416002)(83380400001)(8676002)(2906002)(6506007)(107886003)(4326008)(110136005)(54906003)(26005)(6666004)(6486002)(478600001)(52116002)(966005)(8936002)(86362001)(316002)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGp1TmNMdjhpaG1rMGJwQjRiU2hCOG5FZzBLYjFhRU1pY3JLeGo2cEI3UkM0?=
 =?utf-8?B?STg1RWR0RHNlM1hxMlRVK2c2amxhVEtZV3FYMmRmTlVmUnNJR3VYYXFVOU1h?=
 =?utf-8?B?WDFYVTJGQVU1OUhQVEVSY3ZRZWNCaS9mRjVSbTJjbGVvN3BsV1lXY21xSTdq?=
 =?utf-8?B?bitHVytid3FZTnNva0tOc0ovdXZzNTVNT1hNMzJOYy9xWXBGZDBncTBTelQ4?=
 =?utf-8?B?cW96TmM3emVDV2QvcXZFU1p6UHJOaU9PTlFiSEt5cGM1TEppbVpndXo0UXds?=
 =?utf-8?B?emRBUVhYUVJSZVRZTzU2ZkxJd29ZOG9mbWxmbnIwN2k3VHMvcWNzU3ZZTzBt?=
 =?utf-8?B?US9uOTJ3Vi9EaDgzTndCZ214aDBQelVxMGozRjVwK0MxV3g5MzE4eUtLZzZB?=
 =?utf-8?B?SmZIT0M4L1lKVWJHRWJmbDg4VUNVU3poWGNCYlFZbklXd01IMTk3ZkduVWM4?=
 =?utf-8?B?cENwRGFyK045TGVIc3FJNXh3ZDV1UHZReXBDMno2YTR1bWUzYXltVkszMzV3?=
 =?utf-8?B?cnlESVUrODBYWmE0bmlHemptUTlsdE5wQXJqTnlsS1JyL0pRNmZZeURQbUFZ?=
 =?utf-8?B?bzRPQkdNbDBhaDBvYit2Q1AwVCtVWnVCc2VUN0xpU3luT3pUdkQ2WFUxeHlj?=
 =?utf-8?B?eUFpNzljeEZKUU9aNG56TDM4bkJ0V1orTWRreDkvSHpkSkZnWUMrUDRCMWVI?=
 =?utf-8?B?R3poOUZYd2V3VzF6Y2QzbkxCU2hDS2k5RzhKZWtnL3VUa1FUSTJwdW1MMy9s?=
 =?utf-8?B?eHVueTUycldIZFNJWWlJYjRJbnR1Z3FDRks0NmMvVXZlUWNTOXduV3RVR3N0?=
 =?utf-8?B?bUtQZDloVWhESGdGYWpSU0JZWUF3TXFkMzBtNlRUY0VqRkQwRlpuK2VDQlM2?=
 =?utf-8?B?K3pZL09zQ01VSVVxd0wvM20wck1XL1laM2NkeFVoTXA0NVhrT2M2ZEU2Z2Iv?=
 =?utf-8?B?NUV1ODRFUnNSN3o0ZWMwdHVybnNscFEzRHdXMW1JZmUzcEVjSzFNQlpDRThi?=
 =?utf-8?B?QTJ1UkhHZnU5Tk5yekRHeEV2cFhzVFFhdm9mUjd2SEJkb3MxL2RnNW9LNmtO?=
 =?utf-8?B?Y2RvWGc5b1lXT2ZTMEpoR2hzc25MUDg0V3BnVmlvV2hwVUx5RzVqTGVWbi94?=
 =?utf-8?B?NFVtdFBpQU81Nzh0UDBEQmhrRVRlTUxBdFYvV2R6N1dOaERHamlJdTBZd05W?=
 =?utf-8?B?VnFoTFJtcjZTRE4yQmVoRld3ZUc2eGc4T0VOUTJsdWM5WVkwWTd5ZWthWUxD?=
 =?utf-8?B?YnA5aFk4WHNoemlqaTZUSEgwM2IzalRTNmM3T1A5Tyt1NW9TaU52YnMyL0Fp?=
 =?utf-8?B?N0VpSFVrV2RMcDFmOWt4cEwwaVA2SlZlVkxLN0dWUEtkZDJQQ0pWMGY4MVpr?=
 =?utf-8?B?Um9OenpwVXV1U2IyTnpKVDI5SWp4YTBXY21ER1hRN3BoaFJmSXpaMU1Sb0l6?=
 =?utf-8?B?dCtzY1JoVmtpTy9KOElSQk4xd2w3U21FdXBrS2d4RFo2SHlnMmpqQmVVaHRF?=
 =?utf-8?B?VHo2NXQ3Y3ZHU0RKeEJodXJtME94NTB0T3NlOFpaNFUwZVprUzVIRkdNOGpC?=
 =?utf-8?B?aXJVNDZkTmJMWjQyUVI1QTQyNFFHUDlVNnlPVFhmOHpZOWswbDlhUG9YSFJz?=
 =?utf-8?B?ZjJiT0l6UDBpeFNFYVhJcGpLaXFmby9YR1hySFVjZk9NSU9TTHFYZWNqL1ZE?=
 =?utf-8?B?Z21lVkp4Umd4TjhsUVFqMFd5V3lLalZaUHZ3Y040RStmYkJ1MlAzSTVKWlFJ?=
 =?utf-8?Q?dhju8ifLu1zdVwNbGUmYvJleSQ+v32X0DNnG2pD?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a113aca-59e9-4603-6c0e-08d930746217
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 03:11:07.3405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xg+1UqL/LM+BDWg2ldJyeITws611Mkj4be2MUmkni9n5Be6i5P7oos2hV5pYciERmA0ZCweUmhxr6xi9fynW+8jfj/lBc2OOwqvbUoRAEYs=
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

Under normal conditions, after the last byte is sent by the Slave, the
TX_NAK interrupt is raised.  However, it is also observed that
sometimes the Master issues the next transaction too quickly while the
Slave IRQ handler is not yet invoked and the TX_NAK interrupt for the
last byte of the previous READ_PROCESSED state has not been ack’ed.
This TX_NAK interrupt is then raised together with SLAVE_MATCH interrupt
and RX_DONE interrupt of the next coming transaction from Master. The
Slave IRQ handler currently handles the SLAVE_MATCH and RX_DONE, but
ignores the TX_NAK, causing complaints such as
"aspeed-i2c-bus 1e78a040.i2c-bus: irq handled != irq. Expected
0x00000086, but was 0x00000084"

This commit adds code to handle this case by emitting a SLAVE_STOP event
for the TX_NAK before processing the RX_DONE for the coming transaction
from the Master.

Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C driver")
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v2:
  + Split to separate series [Joel]
  + Added the Fixes line [Joel]
  + Revised commit message [Quan]

v1:
  + First introduced in https://lkml.org/lkml/2021/5/19/205

 drivers/i2c/busses/i2c-aspeed.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 724bf30600d6..3fb37c3f23d4 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -254,6 +254,11 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 
 	/* Slave was requested, restart state machine. */
 	if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
+		if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
+		    bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {
+			irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
+			i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
+		}
 		irq_handled |= ASPEED_I2CD_INTR_SLAVE_MATCH;
 		bus->slave_state = ASPEED_I2C_SLAVE_START;
 	}
-- 
2.28.0

