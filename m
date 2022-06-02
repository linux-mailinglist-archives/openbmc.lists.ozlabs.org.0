Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A002B53DEAA
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 00:39:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGWlB3t0gz2ywM
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 08:39:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=irrelevant.dk header.i=@irrelevant.dk header.a=rsa-sha1 header.s=fm3 header.b=aa+qR82W;
	dkim=permerror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha1 header.s=fm1 header.b=op4rbspC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=irrelevant.dk (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=its@irrelevant.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=irrelevant.dk header.i=@irrelevant.dk header.a=rsa-sha256 header.s=fm3 header.b=aa+qR82W;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=op4rbspC;
	dkim-atps=neutral
X-Greylist: delayed 414 seconds by postgrey-1.36 at boromir; Thu, 02 Jun 2022 15:55:48 AEST
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDFcN0CYwz3bcW;
	Thu,  2 Jun 2022 15:55:47 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id A28D95C018C;
	Thu,  2 Jun 2022 01:48:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 02 Jun 2022 01:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1654148927; x=1654235327; bh=ZkWyiuMGaq
	hYzjNzOrV/RtlVeW8kwzCl9Ncn1BIGaC8=; b=aa+qR82WJa1/b7eBx0E27Gq0nQ
	mhW1I88Jx3jHQuA/NgaG3e0+It9i0mNXJnvIYdOBkH1jfsM1ZDGlh0HvYh4Lr/oY
	y9oFauoMrmB3wOcDKSZYnaMHHZX9hkLvQRRAG9BiqrCx/qwe5wH+CJYyVml6pHgg
	rqPGhZ7JwYLkh2lEHAsPGxqkVc2ekMqeKQLrR9IZfX3B4JXdRpoHZeaRbAd+Urxp
	y4dsenCXNg80jMulda4pu7d+MSRhdm1R19BlyZp8WleJoOa6lyb9Mb9ohGbUb6dw
	V2/zPW9c1DOaB/xrI4uHqiKQ35+4YRAr3T8YIyqxdym0tBOJPFFmlFb5bn8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1654148927; x=1654235327; bh=ZkWyiuMGaqhYzjNzOrV/RtlVeW8kwzCl9Nc
	n1BIGaC8=; b=op4rbspCGhxXAGklNZ+NAoUzZ8fJhc0zp7Y17aNbOTnHEuWHDwJ
	MgMsmR9Zf+biBtHOScoc7X2gvZ+wM1dUnSVZasNJLJZ0V/oYuRSA2uCur596VGnJ
	LwLXo5xFm/uxioGSi7wB5HW00Bq1H2tasrtWEiV7mSgFL3EgpDy8YaWKiPmnu+tP
	wfhvZ46FNNzHgwV6eXXg8xS+1vodDhrIZM8eD+jK56ZUe2fG9R75sxkBCDNJoKGe
	jCE95JGdKb9AVQdtOV67eN6srP0UZSHq1Tm3hwe+l4g9KSxiA4BdxE5ZNBLPY+iX
	a6PsWyEUHsAFQnSsQIrcYD8NT5SxHnMLtwQ==
X-ME-Sender: <xms:Pk-YYoEx-IwVmjlXsMOVtprieeO2TuziQUrP5zSiart8wSgeD442jQ>
    <xme:Pk-YYhUWCctqIECKG1yQBnncHD2RQt6qFug2AYUzfu02QvMLOT611bIyVW6c4796a
    wB5i10drcT-Bz2bRZU>
X-ME-Received: <xmr:Pk-YYiKdcSXF3_X14_BUQjy0Y1NYiniN66fUpGSCnYY6SuU9JnEH2g9SyhTespBISx2A91CaMggJoGhKJ-z3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrledugdelhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhsucfl
    vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
    hnpedtleduhfegleehleeltdejffefjedtleeuvdfgteevffegtedvveekheeiieekteen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhsse
    hirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Pk-YYqHfx6DImBe0zMCShFo1uLiaaGs2mE6j_V1FYwqOVUxIYPN1Rg>
    <xmx:Pk-YYuWhtAq3v55W-v3Nt-G_SL3v0x-E0hmSoAWuyesSG6VlKK2b6w>
    <xmx:Pk-YYtNIXy5nCtdYo-KPk2Js84B-eDYSYwjipv0ROkztQdKjGMJpWA>
    <xmx:P0-YYnN3S-3FgQyPeZPx06hAacFFbzy9naLt4BeLQJ_h2mK_A8bhUA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jun 2022 01:48:44 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: aspeed: do not mask SLAVE_MATCH
Date: Thu,  2 Jun 2022 07:48:42 +0200
Message-Id: <20220602054842.122271-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 06 Jun 2022 08:39:16 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Brendan Higgins <brendanhiggins@google.com>, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, Klaus Jensen <k.jensen@samsung.com>, Klaus Jensen <its@irrelevant.dk>, linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Klaus Jensen <k.jensen@samsung.com>

When commit f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed
I2C driver") added slave mode support, the SLAVE_MATCH interrupt bit
(bit 7) was not added to INTR_ALL and so will never be set by the Aspeed
I2C controller.

Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C driver")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
I am working on slave mode in QEMU and noticed that the device would not
generate the SLAVE_ADDR_RX_MATCH interrupt. This patch fixes it, but I
do not have a spec sheet on the Aspeed, so I am not sure if this is the
intended behavior?

 drivers/i2c/busses/i2c-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 771e53d3d197..7f432babcd72 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -86,6 +86,7 @@
 #define ASPEED_I2CD_INTR_ALL						       \
 		(ASPEED_I2CD_INTR_SDA_DL_TIMEOUT |			       \
 		 ASPEED_I2CD_INTR_BUS_RECOVER_DONE |			       \
+		 ASPEED_I2CD_INTR_SLAVE_MATCH |				       \
 		 ASPEED_I2CD_INTR_SCL_TIMEOUT |				       \
 		 ASPEED_I2CD_INTR_ABNORMAL |				       \
 		 ASPEED_I2CD_INTR_NORMAL_STOP |				       \
-- 
2.36.1

