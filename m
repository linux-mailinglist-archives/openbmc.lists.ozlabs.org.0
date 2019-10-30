Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EECA3E9C1B
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 14:13:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47385q3805zF46Y
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 00:13:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SAPpUIRU"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="eZiwbCMQ"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4737Gj0xZKzF4Hn
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 23:35:56 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8679121C48;
 Wed, 30 Oct 2019 08:35:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 30 Oct 2019 08:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=GnP/xy+PJN1vi
 N5YXPUCzdz4B+9b9AL5rte+h1LMcrA=; b=SAPpUIRUDY51496vCJw+yMByeq7hE
 c54oRYNgaPVhnCINM7WjdT/MqRHY0F99w8MLbnt7KKh8ywXq7RjO5tzHLsNTvF8U
 DN1WizcehONBGYqa2J+b5WJgETuiWX9vLyR8u5ZCQrbS/yZoSJ8EPLzvkx46E+27
 wPec0RCkW9i5kXIR4oXW/SAg8YW5Q9Lm9dsXqCB5fvh2B9ZPdS0YK7h72mg5NMKU
 sNcHX2KTmYOhTgdeh+khQn9m8FSNSIq73Wc5DCDo6eDjsyVmxd6PdaWgMKPdDCEE
 IglnFgZ3+SB2ginTN4VYtz+f4rmES/z/Kcig0O+tLoFkDhCGTzVa4HoHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=GnP/xy+PJN1viN5YXPUCzdz4B+9b9AL5rte+h1LMcrA=; b=eZiwbCMQ
 jRq9hMmLJ0yrXELxffdNiyiPAzeA+RtUf+ywVyo1WGGMQ+bBKu+M+PwMYUt5XS+8
 jgxI3/1DTuHfmkOIwNd+eAD5buZngfvNYQ7GkkJDishOyTu++N5/CeFJXsf9G7ZU
 dcFuGsAUQAyan37mQ91ea7gg2q5qGH8t+ZU6l44IWApDzJUNYtM6NQMm2gf3B//g
 hYF/SV1mHDaq47cYxKwP5VAPfcxFv4AGo4nP5Geg8vswnV3WM/8E53jIAnGFBAI+
 2iXw/gz0oSeTiX46bvWznr+2OzN+TksB5+JjdMXgI/ayTELaMV/DUjPs326DUDXy
 Ovgfb9IuROTMWw==
X-ME-Sender: <xms:qYO5XSgwgdFyLbBRE-D8mxtNM4nozZ1wPNvlXwUGKdDgxKUmjJdRTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtfedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppeduudekrddvuddtrddugeejrdegheenucfrrghrrghmpe
 hmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhi
 iigvpedt
X-ME-Proxy: <xmx:qYO5XUgNBx3wF7CMXxCEMfnJFPjY5L9U8lH9XRcrcqlEgyA0TZ5K7Q>
 <xmx:qYO5XXsw9YKn3KUjdIObgSXmBQtxBfTHpR1neQy02LLmZkzTpcFLcw>
 <xmx:qYO5XSvZF3TO5qWMRdZkiq8jPz3zBAEYsUD5CCBSc0ytgw-629vlUA>
 <xmx:qYO5XaObLDnxUckQ5Ie0Zvi0SK58FrvQ0XtILlSaTFTrNV6djJdHUg>
Received: from localhost.localdomain
 (ppp118-210-147-45.adl-adc-lon-bras33.tpg.internode.on.net [118.210.147.45])
 by mail.messagingengine.com (Postfix) with ESMTPA id 45DB1306005F;
 Wed, 30 Oct 2019 08:35:51 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 2/3] fsi: aspeed: Fix buffer overrun for small
 writes
Date: Wed, 30 Oct 2019 23:07:06 +1030
Message-Id: <20191030123707.29110-3-andrew@aj.id.au>
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

One and two byte writes read data beyond the end of the provided
buffer.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index cb8064cc59c0..6767cd89de36 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -331,7 +331,23 @@ static int aspeed_master_write(struct fsi_master *master, int link,
 		return -EINVAL;
 
 	addr += link * FSI_HUB_LINK_SIZE;
-	ret = opb_write(aspeed, fsi_base + addr, *(uint32_t *)val, size);
+
+	switch (size) {
+	case 1:
+		ret = opb_write(aspeed, fsi_base + addr, *(uint8_t *)val,
+				size);
+		break;
+	case 2:
+		ret = opb_write(aspeed, fsi_base + addr, *(uint16_t *)val,
+				size);
+		break;
+	case 4:
+		ret = opb_write(aspeed, fsi_base + addr, *(uint32_t *)val,
+				size);
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	ret = check_errors(aspeed, ret);
 	if (ret)
-- 
2.20.1

