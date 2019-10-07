Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA8DCEF7E
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 01:16:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nGZl448WzDqLC
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 10:16:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nGVp01X3zDqKT;
 Tue,  8 Oct 2019 10:13:21 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Oct 2019 16:13:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,269,1566889200"; d="scan'208";a="218109590"
Received: from maru.jf.intel.com ([10.54.51.77])
 by fmsmga004.fm.intel.com with ESMTP; 07 Oct 2019 16:13:20 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>
Subject: [PATCH 3/5] i2c: aspeed: fix master pending state handling
Date: Mon,  7 Oct 2019 16:13:11 -0700
Message-Id: <20191007231313.4700-4-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In case of master pending state, it should not trigger the master
command because this H/W is sharing the same data buffer for slave
and master operations, so this commit fixes the issue with making
the master command triggering happen when the state goes to active
state.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index fa66951b05d0..40f6cf98d32e 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -336,18 +336,19 @@ static void aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
 	struct i2c_msg *msg = &bus->msgs[bus->msgs_index];
 	u8 slave_addr = i2c_8bit_addr_from_msg(msg);
 
-	bus->master_state = ASPEED_I2C_MASTER_START;
-
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	/*
 	 * If it's requested in the middle of a slave session, set the master
 	 * state to 'pending' then H/W will continue handling this master
 	 * command when the bus comes back to the idle state.
 	 */
-	if (bus->slave_state != ASPEED_I2C_SLAVE_INACTIVE)
+	if (bus->slave_state != ASPEED_I2C_SLAVE_INACTIVE) {
 		bus->master_state = ASPEED_I2C_MASTER_PENDING;
+		return;
+	}
 #endif /* CONFIG_I2C_SLAVE */
 
+	bus->master_state = ASPEED_I2C_MASTER_START;
 	bus->buf_index = 0;
 
 	if (msg->flags & I2C_M_RD) {
@@ -432,7 +433,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		if (bus->slave_state != ASPEED_I2C_SLAVE_INACTIVE)
 			goto out_no_complete;
 
-		bus->master_state = ASPEED_I2C_MASTER_START;
+		aspeed_i2c_do_start(bus);
 	}
 #endif /* CONFIG_I2C_SLAVE */
 
-- 
2.23.0

