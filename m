Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5114A228C9D
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 01:17:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBDz05N1kzDqkR
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 09:17:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gustavoars@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Fp5SizZk; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBDy22ssGzDqDD;
 Wed, 22 Jul 2020 09:16:58 +1000 (AEST)
Received: from embeddedor (unknown [201.162.241.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 233EF20709;
 Tue, 21 Jul 2020 23:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595373416;
 bh=hVoIbwbVywgC7jhgVpXyOg5Fgl2JP3Aj80jHW2Xpo1E=;
 h=Date:From:To:Cc:Subject:From;
 b=Fp5SizZkI1S27qPov0v2tJKWGpC3fv96PEL+YzE1RTMcEPyS1KVX0IxgIauuOWg6u
 aBY9uro+SVXllKXsL9kwXMTQg2YKPia5OMCB7mPYqQPODVOqq7Iljo9o4VB/CHSjcf
 dAknsI1IwzhwPhlpRO5PcNHrZ5I/fNAianXFsRwo=
Date: Tue, 21 Jul 2020 18:22:32 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2][next] i2c: aspeed: Use fallthrough pseudo-keyword
Message-ID: <20200721232231.GA1888@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
fall-through markings when it is the case.

[1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v2:
 - Update URL. Use proper URL to Linux v5.7 documentation.
 - Add Brendan's Reviewed-by tag.

 drivers/i2c/busses/i2c-aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index f51702d86a90..31268074c422 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -504,7 +504,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 			goto error_and_stop;
 		}
 		irq_handled |= ASPEED_I2CD_INTR_TX_ACK;
-		/* fall through */
+		fallthrough;
 	case ASPEED_I2C_MASTER_TX_FIRST:
 		if (bus->buf_index < msg->len) {
 			bus->master_state = ASPEED_I2C_MASTER_TX;
@@ -520,7 +520,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		/* RX may not have completed yet (only address cycle) */
 		if (!(irq_status & ASPEED_I2CD_INTR_RX_DONE))
 			goto out_no_complete;
-		/* fall through */
+		fallthrough;
 	case ASPEED_I2C_MASTER_RX:
 		if (unlikely(!(irq_status & ASPEED_I2CD_INTR_RX_DONE))) {
 			dev_err(bus->dev, "master failed to RX\n");
-- 
2.27.0

