Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA516E9C14
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 14:11:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47384558bPzDqRL
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 00:11:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="sA2uEydy"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ChouHSs7"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4737Gj0x98zF4Hm
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 23:35:55 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CB63A2089D;
 Wed, 30 Oct 2019 08:35:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 30 Oct 2019 08:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=IvTn8Tpx+17AZ
 wcyPoI9nsUNch2fNgW0y55fiAf27f4=; b=sA2uEydyiWMvXkZv3vkoyXIF24WyA
 14t02FYiJH3yH1bMRpJxvfoBM1l+byXzF97B92NqhRuSyWzF7P0zsLWRzA/mwvab
 Y8zPYwvLMyGw4dHhGkRvkyLwNTavif4th9Mp9BfrhRHVhADbFvX7E0Hw3xDFBYV9
 wTMPbFwGi/tAd0eJz8FRscr/h/f90ZW6jE46AnLr7/s67jHZojEjgDCG74vGUEho
 ZBkknSq/D7pCV+MviaL9NpCrToF0vxjrCM3R38rcDOXsy8fPsyCietJ5sxn3lvEu
 At5uqTP94tS3pCIAUUWKSr6mBAX1GaoDa0DNwuh9J05JgsID251FVCWlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=IvTn8Tpx+17AZwcyPoI9nsUNch2fNgW0y55fiAf27f4=; b=ChouHSs7
 gzWfF0saLYz6IQiQBxAsxG9vUuhYr5JK3GJPOYDOwTdI1D483vtkwewOnrRX3Kgn
 IlkuE3YZb86R0tQrZZBrYFJzBF9t/dlb5oI2hMlXb23/4A7Kw1zrxn+Y9Z7gQRR0
 lK8FW1nihnHktJo/L2/2dqC1bI/KIWsqwlh3Fi91H+Kvxmpo1U+JWmDq2nlqxZZw
 Z+b5q7Po4GNvysG7stZtB7uChu4bu+AsMR/f+2ia968fXA/5Py3KBDG79/r7iHDd
 DmrL9CggvGyJ+wvUl/S6uSoFJO3WnkX+n04PngdGnfAfHtVdBMGSCK7+rqLH1Gbm
 fnmucYjK2b9x9A==
X-ME-Sender: <xms:p4O5XYCIVhD-ZCksTXL8x3QA0m_l1Q_FvxoYvch1cSD1VWFxeJoAJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtfedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppeduudekrddvuddtrddugeejrdegheenucfrrghrrghmpe
 hmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhi
 iigvpedt
X-ME-Proxy: <xmx:p4O5XZQ8XRJ0ZBZhxDLkdrU4x8bybLcjcBe62Vqqi2EgttiX0XGtoA>
 <xmx:p4O5XbJL7cvmDrDQ_Wq9mw-20J9r2OawQQZd7LBBNKZaQcyw4NTCFw>
 <xmx:p4O5XZFsWsv20CMgYLtmYWItnlRHRyTPOsk3T-l-1JO3pdyx723b4g>
 <xmx:p4O5XdMhi9RMnmSW5Vf0h3vpA8KnLIbnJ5_nKz_DmLlDiPjDYtoMtQ>
Received: from localhost.localdomain
 (ppp118-210-147-45.adl-adc-lon-bras33.tpg.internode.on.net [118.210.147.45])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6E0BA3060063;
 Wed, 30 Oct 2019 08:35:50 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 1/3] fsi: aspeed: Implement byte and half world
 transfers
Date: Wed, 30 Oct 2019 23:07:05 +1030
Message-Id: <20191030123707.29110-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191030123707.29110-1-andrew@aj.id.au>
References: <20191030123707.29110-1-andrew@aj.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Joel Stanley <joel@jms.id.au>

The driver did not previously support non-word size transfers. The
fsi-i2c driver attempts accesses of this size, so we require it now.

Signed-off-by: Joel Stanley <joel@jms.id.au>
[AJ: rebase on dev-5.3, fix conflicts, fix warnings]
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 35 ++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 97d2cac94291..cb8064cc59c0 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -167,24 +167,39 @@ static const u32 fsi_base = 0xa0000000;
 #define CMD_WRITE	0
 
 /* OPBx_XFER_SIZE */
-#define XFER_WORD	(BIT(1) | BIT(0))
-#define XFER_NIBBLE	(BIT(0))
+#define XFER_FULLWORD	(BIT(1) | BIT(0))
+#define XFER_HALFWORD	(BIT(0))
 #define XFER_BYTE	(0)
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/fsi_master_aspeed.h>
 
+static int get_xfer_size(size_t size) {
+	switch (size) {
+	case 1:
+		return XFER_BYTE;
+	case 2:
+		return XFER_HALFWORD;
+	case 4:
+		return XFER_FULLWORD;
+	default:
+		return -EINVAL;
+	}
+}
+
 static u32 opb_write(struct fsi_master_aspeed *aspeed, uint32_t addr,
 		     uint32_t val, size_t size)
 {
 	void __iomem *base = aspeed->base;
 	u32 reg, ret, status;
+	int xfer_size;
 
-	/* TODO: implement other sizes, see 0x18 */
-	WARN_ON(size != 4);
+	xfer_size = get_xfer_size(size);
+	if (xfer_size < 0)
+		return xfer_size;
 
 	writel(CMD_WRITE, base + OPB0_RW);
-	writel(XFER_WORD, base + OPB0_XFER_SIZE);
+	writel(xfer_size, base + OPB0_XFER_SIZE);
 	writel(addr, base + OPB0_FSI_ADDR);
 	writel(val, base + OPB0_FSI_DATA_W);
 	writel(0x1, base + OPB_IRQ_CLEAR);
@@ -215,12 +230,14 @@ static int opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 	void __iomem *base = aspeed->base;
 	u32 result, reg;
 	int status, ret;
+	int xfer_size;
 
-	/* TODO: implement other sizes, see 0x18 */
-	WARN_ON(size != 4);
+	xfer_size = get_xfer_size(size);
+	if (xfer_size < 0)
+		return xfer_size;
 
 	writel(CMD_READ, base + OPB0_RW);
-	writel(XFER_WORD, base + OPB0_XFER_SIZE);
+	writel(xfer_size, base + OPB0_XFER_SIZE);
 	writel(addr, base + OPB0_FSI_ADDR);
 	writel(0x1, base + OPB_IRQ_CLEAR);
 	writel(0x1, base + OPB_TRIGGER);
@@ -246,7 +263,7 @@ static int opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 		return -EIO;
 
 	if (out)
-		*out = result;
+		memcpy(out, &result, size);
 
 	return 0;
 }
-- 
2.20.1

