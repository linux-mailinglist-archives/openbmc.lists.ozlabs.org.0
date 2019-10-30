Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6621DE9C07
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 14:07:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4737zD1QK4zF4Mk
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 00:07:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="GdRwx0Bf"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qmd6I+Wi"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4737Gj4QkkzF4Hq
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 23:35:57 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B01021FBF;
 Wed, 30 Oct 2019 08:35:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 30 Oct 2019 08:35:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ruzsgzxV1I7l8
 xGxSKeMBR1bj0RxS9+LYSK3ZuKepAc=; b=GdRwx0BfiQh9JFk3LfyjmfhCuFBg6
 mvtnkRtWAhXOkZVP8sltcOfQb4mzXm9sWcMJ1Ba3fbnoJJUxFN5LlZVcdv+7Rxao
 7LY9TvKy+uVRQ1YWhBqtF3uXF1/oSppErcR4t1tP5e7B14J5Au3QYfnv3bmQ/baO
 8LpB3FAePSLtUu+bpXXbB+D778yJGQnrs8BjwVlLiJBMuAI0C4Fpw0J2+8SE147m
 ysqQdnLds1+Wooak/4DZnTS9w91apLB3ZXKZugbhkUmCauPFjpqM/BR1PGXoUSwo
 wfN6IbSJgxZoHfcI2cP6rQ2nVw5yF+napAd7s7fyo9jcXDptrjMGkOFsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ruzsgzxV1I7l8xGxSKeMBR1bj0RxS9+LYSK3ZuKepAc=; b=qmd6I+Wi
 74LMuGoCSAV5j0lexd3r+7A3yHIKDOMS2QGzJpdSGCnwDnEEbbFlFYJ+Fh8RnILs
 rBH+iHJprny6uGftJOF4aESquGxteg4mgtIQLFKaeWMdkssj+OiOFxlnWOZ2AIlv
 iJ/RCEPtz3q60vt/rFb73Y7hrygFwl9G9867abQVpdhQYq3IJHERnRUB2wMv8bWA
 wisZ3L+ZLVrcvMvxVlwex7w+i79fD9MJFIWHd1R3jmJfVdjFQbCSIXbVIRqcBdzZ
 NtNoFbZfNRGagaHW5d4ulqQkodyQW+NqitQymqoTG1udDOgoYgt5zainFFvGcBAP
 g5s4xOFHb3Xnpw==
X-ME-Sender: <xms:q4O5XYo5I7Ronc3XldpgloKtb58j1yxtnTbWlRjhaGKdSiDTdXscCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtfedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppeduudekrddvuddtrddugeejrdegheenucfrrghrrghmpe
 hmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhi
 iigvpedv
X-ME-Proxy: <xmx:q4O5Xfsymvc4jQ1MiFIHSDmoSwt_m8jr2p89iNo9F2bk7sU6PryqHw>
 <xmx:q4O5XQIMYdbnZWGTUiA5YXl9JzxqBfr7uX9uanrUFaa1peGDsAh8-A>
 <xmx:q4O5XdkuzphOagwaYmBFljMA95BI8cfnezVhM1lMCCexe9mnJBg64A>
 <xmx:q4O5XR8b9DFcygY6om_Yqb4cLHIpD0B94egFvLJ4RXQmLfBJbobTpw>
Received: from localhost.localdomain
 (ppp118-210-147-45.adl-adc-lon-bras33.tpg.internode.on.net [118.210.147.45])
 by mail.messagingengine.com (Postfix) with ESMTPA id D4516306005F;
 Wed, 30 Oct 2019 08:35:53 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 3/3] fsi: aspeed: Enable single byte FSI accesses
Date: Wed, 30 Oct 2019 23:07:07 +1030
Message-Id: <20191030123707.29110-4-andrew@aj.id.au>
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

The OPB0 read order selection register caused a data read register value
of 0xffffffff to be read for single byte accesses over FSI. A value of
0x03 for the read order byte-access slot correctly "swaps" the BE MSB
value to the LE LSB for extraction by the APB2OPB bridge:

    # devmem 0x1e79b05c
    0x00030B1B
    # dd if=raw bs=1 count=1 | hexdump -C
                  dd-588   [000] .... 15201.144814: fsi_master_read: fsi0:00:00 00000000[1]
                  dd-588   [000] .n.. 15201.144872: fsi_master_aspeed_opb_read: fsi: opb read: addr a0000000 size 1: result ffffffc0 status: 00000000 irq_status: 00010000
                  dd-588   [000] .n.. 15201.144877: fsi_master_aspeed_opb_read: fsi: opb read: addr 800000d0 size 4: result 00000000 status: 00000002 irq_status: 00010000
                  dd-588   [000] .n.. 15201.144880: fsi_master_aspeed_opb_read: fsi: opb read: addr 800000d0 size 4: result 00000000 status: 00000002 irq_status: 00010000
                  dd-588   [000] .n.. 15201.144883: fsi_master_aspeed_opb_read: fsi: opb read: addr 800001d0 size 4: result 00000000 status: 00000002 irq_status: 00010000
                  dd-588   [000] .n.. 15201.144885: fsi_master_aspeed_opb_error: mresp0 00000000 mstap0 00000000 mesrb0 00000000
                  dd-588   [000] .n.. 15201.144887: fsi_master_rw_result: fsi0:00:00 00000000[1] => {c0} ret 0
    1+0 records in
    1+0 records out
    00000000  c0                                                |.|
    00000001

While we're at it, clean up the half-word access read order selection in
the same manner.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 6767cd89de36..ffbfb34e82f6 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -605,7 +605,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	writel(fsi_base, aspeed->base + OPB_FSI_BASE);
 
 	/* Set read data order */
-	writel(0x0011bb1b, aspeed->base + OPB0_R_ENDIAN);
+	writel(0x00030b1b, aspeed->base + OPB0_R_ENDIAN);
 
 	/* Set write data order */
 	writel(0x0011bb1b, aspeed->base + OPB0_W_ENDIAN);
-- 
2.20.1

