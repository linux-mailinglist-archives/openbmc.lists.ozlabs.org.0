Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC8D3888B7
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 09:52:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlQ7l4KQTz3071
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 17:52:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qAkSPCAz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.100.122;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=qAkSPCAz; 
 dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2122.outbound.protection.outlook.com [40.107.100.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlQ5m5wBsz2xvc;
 Wed, 19 May 2021 17:50:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THLW2dX9kCkAUH/EI6VUh1mwNXOmmFqHCNJDQOyf98ntT2f25WuMhqoC34emVyD9pxCXb540HMeTm3aXXiDQbaZYvVdoOZklaFyNspwiY1ZM/aw4/rujWmbU/rnkCAWhBg/iqEv56NpMYTXDQBOVDs9S7RZGjgPn85Ky0FKQRlqo3CW04XhhVuYVO1sVhZkHDfbDFG/h+wgKTO4qwXDXor+fQQgj2DtokL5467R5qkolPc/SClHMv7CS0x2slDxp353gDbt+ySe0HhM6Z0bHNre3wiRYfXgZ6eH7sNJFNXt/jE8q6PACRMjsC8eCHdKmYoqqtDqLiUTyStlBsMG9ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KHjQAaGdHpGdNvvbzuJGuZ8UawLP9ToZSEP3o/2wTQ=;
 b=TaUSWqmF/pQNC2DZTxbUdkn/w5L026D9QpOc+qsN5WNj+6R+Ug/5276KX1HHbDg9oU6exphwYSVvO6lpSOslQestLgBVMTkATfVL14QEuq2qbuXDeFe6elX3mJebcW1NoWRRbPX2LWDrEPwH8K1D7v6QU2z6gfHBQFMs18ySpuLizbH5xmaoHBD5uQKohyyYxnP2DxYMH4+Dz5uJeLtKZRxmX6E7RiGSBVuAActcQEytfLSoKa+VXqID6bJkNMxpp/CGkjTX9czkJqHzvoGF3ajdWQ3x7C9i6XEu3L7d/opdmOkU4aVryT2GEXKFEeqBrDFUb8nqNxvpSgKAAqqJaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KHjQAaGdHpGdNvvbzuJGuZ8UawLP9ToZSEP3o/2wTQ=;
 b=qAkSPCAzIcYjupKtTG3ro4HuprK77ttOMWz7IQpYU7KUoAxiBQ5EveeNpiIg94nyG+BWy1ypamIjzTQ04deOay0M9KY9mntCC76Q3DpMasZvciyoWL5VHO7RveI6v0/LIROV3s55GCUOaNe8JpvzQB5DHJ5UBPnrXVhHXpCFvSQ=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO1PR01MB6743.prod.exchangelabs.com (2603:10b6:303:d5::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.26; Wed, 19 May 2021 07:50:28 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 07:50:28 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Wolfram Sang <wsa@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH v3 3/7] i2c: aspeed: Fix unhandled Tx done with NAK
Date: Wed, 19 May 2021 14:49:30 +0700
Message-Id: <20210519074934.20712-4-quan@os.amperecomputing.com>
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
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 07:50:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb7697dd-ba48-44c1-1fcb-08d91a9ac4fe
X-MS-TrafficTypeDiagnostic: CO1PR01MB6743:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR01MB67430EBAC4D5E13FC501BD4EF22B9@CO1PR01MB6743.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FSJV3uBMPQ7RmLE32JVMGuIfXCeIY1j673onb3zpu4/pbhjR6wIPm08eYn7L9rMpGwt5ga5Aoaj7rEgPc7o+CaF82m43DBq6+BHixTXM4ioj/ARDqbmR/ZVWA77F2NMnHwgkRlSFv6cmTBDS/hVS2v+Gvok/4oF3+qCalBHh4IpsO8UAMOrm1m/vcRCPxM6RfAWGUw6A9BqSeDTcC1VEmnVEBhGBPGStsF+AN/qJ2my1/1ZKEwYV1efgJSz/OGwee9PGHvZAF0ElFNNrqWyp/Dh01pQgXjNYjHwuyA8TAPkenZ7AUHaxVitjzYFFjpc7WNqaTG81lWN9vo+QfaIEulwJH92V/zgCz+uGxDbPgMBeqwL9wQ6KSGcr0HSKe0fG/PTzPc5RCpdutFlX+2g6SyqQg9xXET3yDxjq2Uh5MhGgkrSz3k/xQWQa8oVLeTz0+OsoSLMv85CoE/gATpbrSIUXrY1322CVi9GGdWUbYDDFUf4wvymwJR+IUu/U5tdR5VEj8ZzsVIgJ4QmNIjFPw3pWaeG26FyJVS+7WJnztpA3mMvnbfZsUNIIKmH1Q3xq7liALcl4lzT8Wu7vqpYVU0jQuW/4iL9PF4DbO+Fn8eA8CuR1bAx4Veg1aZvZ+5OV1p6RJ03oDodb9yhHKymu4cCKINI9uWXihYNkDkzFUVY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(376002)(136003)(346002)(396003)(478600001)(66946007)(66476007)(8676002)(8936002)(956004)(921005)(66556008)(52116002)(6506007)(2616005)(6512007)(5660300002)(86362001)(4326008)(38100700002)(1076003)(38350700002)(7416002)(316002)(83380400001)(186003)(6666004)(2906002)(110136005)(54906003)(6486002)(16526019)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wOYRpQOmJcfHfJaUkClI1GlyQlYdeDohKEQzEQ7aFIkfSl5SWxOPKUMzd/AG?=
 =?us-ascii?Q?HB0Pptg5hfVSVQV+fcZcvBXPDtCGJYUwNkP1WHfMnSfzITr/sndTIBsy2iv0?=
 =?us-ascii?Q?Nux2kQVndqtABM8rsB4FQVietBP0uncyo7i2Rn3HjWa3h6Gxys/TqHzMW+zI?=
 =?us-ascii?Q?SZpeYG3CyCzud7tdk59g2iE0WAVc9sX/505uYti2oBvktDu8bVQ1EVhjE8S3?=
 =?us-ascii?Q?R8kLuXQn13hSsBMwRIY/kB7P/h/YIpiRIXdCSTnOwbRH9ZNAFwpGci1qzNEk?=
 =?us-ascii?Q?pjmef8n9ZSD2TCZ57HIpMxmUNP4eRdVP4aPFTA6zB1zhUKwvKXX0CEdr9gUY?=
 =?us-ascii?Q?Dm/ltVMUN4MOHw9JdcwQMyIrA1HK7alhyJDAO8c1rrF+bOGmnchr4pzFcnJW?=
 =?us-ascii?Q?eR4iBmPWN3vUNxJ4m3e7j/zn4kXkH1kXcDTmxk5TanwkTzlWthUrQTBedS0T?=
 =?us-ascii?Q?xeKgx6Yl93xntmaMWSgGV+VaP02u+e7aq3U4HOkDEhEumE82+tnBCyFgEx8G?=
 =?us-ascii?Q?KoOkTyZuXyeukEAup+Ug26gfoiTrocQw7lyfKyTVRF23pr1zyhuZD6IgcAAZ?=
 =?us-ascii?Q?vTzsbVqRmni5qS5Ww4ytd+hmOMPKOHQKau22cFpm450C0fgIG8XUWdRyeNSg?=
 =?us-ascii?Q?nMhqUbJrlVQlw771teEJUNYk+K6CFUkcJbrKb/7E7cWkQjks/1aZ8qFvV5I6?=
 =?us-ascii?Q?n4sTOGRdGu42YniO9S+KDjnVzYsSsUuqbb2TI5Bc6wcJ+c0FmNfiy6PAbumD?=
 =?us-ascii?Q?AH0u0SAX1Bc9a0ayzJPnrdh/Z9lPYHVxJqdquLRwiUGmiKpu9E5GJ1zSFdsC?=
 =?us-ascii?Q?3GZgY1IS7WAbyl9CbtpOch7tI9n8kHMeymZqfMcfWUOG8QVJIWcq6lHhz2Wk?=
 =?us-ascii?Q?BvFkvCVAEQ3GdKjR0sZNS3FQ+Iuod75hKH97D2CDxgc2srsb6cdzWrwP7Nr3?=
 =?us-ascii?Q?gOauvNk/phoLroLvMTO5O/VCIoYliUWlSxMp9nXPVLTwSNIkgrpvwsVvbIqG?=
 =?us-ascii?Q?qFCwJTONJCh3GoRyh6qKrMacA1a+seAe5b+LCMppeuV9zDqBBRhk72rsv62X?=
 =?us-ascii?Q?kWSxvPtFlzD+phUh44WZ127c/PkqCPjE3eDA45JRBYtO0rZXd2chbJVjbQRp?=
 =?us-ascii?Q?FwkXheibMdZfUxsE5gPBo7cSdWoMik62Yp1lsN0Zm2ewUYFrO8X9uOWhuXp9?=
 =?us-ascii?Q?To6psHMZ8ObWmTKcSivVb8fwENpgY+6n45qgRYTKhJiDvqv5yKf25H6Fmfu+?=
 =?us-ascii?Q?cYLOxmHy98miq8BJSX+L+JXk4UtHern1Bvm3GzAbGse47lB8tRLcoyhbcQxE?=
 =?us-ascii?Q?35U44rtcf3CHBzVY2IAK+1LI?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7697dd-ba48-44c1-1fcb-08d91a9ac4fe
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 07:50:28.5608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1IczHUF6dArYxwUftFSiMa7jrxXmwOqXqFFmjXriZy/h6eo/ChC0WLveLhjZLaIL+7AulsekDd054toQunh75Fuc++ei5oCYeaRM4+CQoi0=
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

It is observed that in normal condition, when the last byte sent by
slave, the Tx Done with NAK irq will raise.
But it is also observed that sometimes master issues next transaction
too quick while the slave irq handler is not yet invoked and Tx Done
with NAK irq of last byte of previous READ PROCESSED was not ack'ed.
This Tx Done with NAK irq is raised together with the Slave Match and
Rx Done irq of the next coming transaction from master.
Unfortunately, the current slave irq handler handles the Slave Match and
Rx Done only in higher priority and ignore the Tx Done with NAK, causing
the complain as below:
"aspeed-i2c-bus 1e78a040.i2c-bus: irq handled != irq. expected
0x00000086, but was 0x00000084"

This commit handles this case by emitting a Slave Stop event for the
Tx Done with NAK before processing Slave Match and Rx Done for the
coming transaction from master.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v3:
  + First introduce in v3 [Quan]

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

