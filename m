Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B200768AC1
	for <lists+openbmc@lfdr.de>; Mon, 31 Jul 2023 06:19:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=JMwOLltw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RDlPg5Xtjz2ytc
	for <lists+openbmc@lfdr.de>; Mon, 31 Jul 2023 14:19:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=JMwOLltw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.12.26; helo=m126.mail.126.com; envelope-from=lianglixuehao@126.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 940 seconds by postgrey-1.37 at boromir; Fri, 28 Jul 2023 22:40:45 AEST
Received: from m126.mail.126.com (m126.mail.126.com [220.181.12.26])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RC6gK6kKnz3Wts;
	Fri, 28 Jul 2023 22:40:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=FoxBD
	YqOKyiWiTrz1BH4q8oi7fSeNd2Y5rKiieL1SJQ=; b=JMwOLltwUM6nZC31hnjsI
	rFEPejxCuR+xeacnr2pk0Dqfjdc/sHXY+XFIx65nEsXGuzdhG/fyAHHV3FX1IRv3
	WLAGSaPWpJWU933HIP7xdjU+4XrZOo3zbBo3DUdxlljDGGTtX/VRO4pgnc+KCiA9
	mDiyjzPUUx+nqYsvCoWHZY=
Received: from localhost.localdomain (unknown [117.136.33.150])
	by zwqz-smtp-mta-g2-0 (Coremail) with SMTP id _____wD3_q5ys8NkgYAxBA--.37325S2;
	Fri, 28 Jul 2023 20:24:21 +0800 (CST)
From: Lixue Liang <lianglixuehao@126.com>
To: brendan.higgins@linux.dev, benh@kernel.crashing.org,
	joel@jms.id.au, "andi.shyti@kernel.organdrew"@aj.id.au
Subject: [PATCH] i2c: aspeed: Avoid accessing freed buffers during i2c transfers.
Date: Fri, 28 Jul 2023 12:24:16 +0000
Message-Id: <20230728122416.17782-1-lianglixuehao@126.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_q5ys8NkgYAxBA--.37325S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr1DurW8WryxCr15tw13Arb_yoWDGFc_Ka
	1kua4xJr1DJF95Cw1Fywn8ZFyF9345ur4kWw1vya4fC3WYv3s5JFyq9FZ3ArsrWFZ7GFy5
	J3Wj9F4fAr1DGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8H89tUUUUU==
X-Originating-IP: [117.136.33.150]
X-CM-SenderInfo: xold0w5ol03vxkdrqiyswou0bp/1tbi5Ry6FlpD+gIe0QABs6
X-Mailman-Approved-At: Mon, 31 Jul 2023 14:19:07 +1000
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
Cc: Lixue Liang <lianglixue@greatwall.com.cn>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, lianglixuehao@126.com, linux-i2c@vger.kernel.org, p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Lixue Liang <lianglixue@greatwall.com.cn>

After waiting for the transmission timeout, the I2C controller will
continue to transmit data when the bus is idle. Clearing bus->msg will
avoid kernel panic when accessing the freed msg->buf in
aspeed_i2c_master_irq.

Signed-off-by: Lixue Liang <lianglixue@greatwall.com.cn>
---
 drivers/i2c/busses/i2c-aspeed.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 2e5acfeb76c8..c83057497e26 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -713,6 +713,8 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
 		spin_lock_irqsave(&bus->lock, flags);
 		if (bus->master_state == ASPEED_I2C_MASTER_PENDING)
 			bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
+
+		bus->msgs = NULL;
 		spin_unlock_irqrestore(&bus->lock, flags);
 
 		return -ETIMEDOUT;
-- 
2.27.0

