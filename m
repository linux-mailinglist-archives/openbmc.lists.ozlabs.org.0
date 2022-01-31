Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5804A3CB7
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 04:25:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnD2m4JLNz30Q6
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 14:25:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=W2cIysd/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=adb1ETMf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=W2cIysd/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=adb1ETMf; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnD2K2LxRz2y0B
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 14:24:40 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B34A5C00D9;
 Sun, 30 Jan 2022 22:24:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 30 Jan 2022 22:24:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; bh=EqZrgkt2lPFA8HbkQG/DBjQ2lHNSVk9idFq9c8UTz6Y=; b=W2cIy
 sd/iQ8CuSUEei1aiYOxZAUt+1DI2YFJXB/3ucVIm5wc8OGd3UnXC9DGHfroh4xg6
 XaKODFpFrg7rqehj91NCyFi9ZJPZCQ/M0nbOkJRTuBnEd1TfrqGC312ckt1IW0Rj
 Gtfg+XHs903VD++ir7KZi813jn/hUdOBRh2qnMxiDZIFZKSsethYf1gyyL87YQU+
 269Az9C1wulUEa+CXjklHQ2kV/zJtHI/r7lkvhYBwwZ+74btUNRDjrCfKlyKlheK
 2fBzbZn92+eVPO0swg/jWycuwyugHV6m4AdGZU30w1+a/ggJeza+XHO5Fs9mgOjA
 z0OZh1hodl/F05D3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=EqZrgkt2lPFA8HbkQG/DBjQ2lHNSV
 k9idFq9c8UTz6Y=; b=adb1ETMf+fC29/UAF5Ffi+kxgTW0nxIXPlQGXhuRi/06y
 rpeO8GzoqXgntpEHjdvyHVXyUy1zsGAsQrw3afCspVk1O0TTtF7XPFQ/lmrI7mMf
 UxuL1hAYWSiKVfE4VBjAchgVnvf5RdA5lBypBr5zrkqYoXMPYEQZme4pzCLvlOBr
 8Jug1McJa0nOHplJV7S4kzAErmooLq3bW0UyLM2OpFIf04/HWt7sw9D/GrQZb23Y
 sgXp5jzjWSeoTmgF9HkawFfLhw/6Cchn4efn0ZI0MhRTsdbLNkxBS7vBvOEQVao+
 ou+4QzjQTqFs1jigfgo/GyyvwF/KjYIAksMcC9YmQ==
X-ME-Sender: <xms:dFb3YQcMgWJvS5kn8OJoKeHKQqbkuhgT8rKmFcy3EQ5alTA41mSs9g>
 <xme:dFb3YSOFKlJIsDU4zmYlSfrfEsvooOBmAKANV9pPC3orBVTFi2xGvwlCQJ-43nBbB
 uGd3bG_WeS5Z0ordw>
X-ME-Received: <xmr:dFb3YRh6XD3xCbCyfQ1ggTFk67KTLFET4GFrDUV6NMO6NmnOr5EiPMLfvktvyCoauUQtahlVOsd4nz6lzP3v6-PiJsnd342OMtAB9Jm4mPrc1ZjY3qkIUZWLERuRVBJf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedtgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucggtffrrghtthgvrhhnpeekieehgedulefhteeuhffhveekuefhffevle
 eugfefvdeukedtudegieegfefhjeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhk
 vghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:dFb3YV_4FNm_wzxi3Q0W326T-jgE2KHVFecJPFX_dCjXPunRP5mCxA>
 <xmx:dFb3Ycve6toksw7TzpvPvYzJD7flc2sjcrzpcEVzOVCh5niQ7ZE3xg>
 <xmx:dFb3YcHaNSgF_HDzRDQF78LhGBHC1zMjm_E_nMwleTTvLpQp5DJb8A>
 <xmx:dVb3YV7ayB2kR52ZTW0VD7Xgk39_UhYtBEhptLIekx95bGiByujlSQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Jan 2022 22:24:34 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: u-boot@lists.denx.de
Subject: [PATCH] gpio: Add gpio_request_by_line_name()
Date: Mon, 31 Jan 2022 13:54:05 +1030
Message-Id: <20220131032405.105204-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
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
Cc: sjg@chromium.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add support for the upstream gpio-line-names property already described
in the common GPIO binding document[1]. The ability to search for a line
name allows boards to lift the implementation of common GPIO behaviours
away from specific line indexes on a GPIO controller.

[1] https://github.com/devicetree-org/dt-schema/blob/3c35bfee83c2e38e2ae7af5f83eb89ca94a521e8/dtschema/schemas/gpio/gpio.yaml#L17

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
Hi,

This patch is extracted from and motivated by a series adding run-time
control of FIT signature verification to u-boot in OpenBMC:

https://lore.kernel.org/openbmc/20220131012538.73021-1-andrew@aj.id.au/

Unfortunately the OpenBMC u-boot tree is quite a way behind on tracking
upstream and contains a bunch of out-of-tree work as well. As such I'm
looking to upstream the couple of changes that make sense against
master.

Please take a look!

Andrew

 drivers/gpio/gpio-uclass.c | 26 ++++++++++++++++++++++++++
 include/asm-generic/gpio.h | 19 +++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index 125ae53d612f..be00a1f7d871 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -1187,6 +1187,32 @@ int gpio_request_by_name(struct udevice *dev, const char *list_name, int index,
 				 index, desc, flags, index > 0, NULL);
 }
 
+int gpio_request_by_line_name(struct udevice *dev, const char *line_name,
+			      struct gpio_desc *desc, int flags)
+{
+	int ret;
+
+	ret = dev_read_stringlist_search(dev, "gpio-line-names", line_name);
+	if (ret < 0)
+		return ret;
+
+	desc->dev = dev;
+	desc->offset = ret;
+	desc->flags = 0;
+
+	ret = dm_gpio_request(desc, line_name);
+	if (ret) {
+		debug("%s: dm_gpio_requestf failed\n", __func__);
+		return ret;
+	}
+
+	ret = dm_gpio_set_dir_flags(desc, flags | desc->flags);
+	if (ret)
+		debug("%s: dm_gpio_set_dir failed\n", __func__);
+
+	return ret;
+}
+
 int gpio_request_list_by_name_nodev(ofnode node, const char *list_name,
 				    struct gpio_desc *desc, int max_count,
 				    int flags)
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index adc19e9765d7..81f63f06f15e 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -579,6 +579,25 @@ int gpio_claim_vector(const int *gpio_num_array, const char *fmt);
 int gpio_request_by_name(struct udevice *dev, const char *list_name,
 			 int index, struct gpio_desc *desc, int flags);
 
+/* gpio_request_by_line_name - Locate and request a GPIO by line name
+ *
+ * Request a GPIO using the offset of the provided line name in the
+ * gpio-line-names property found in the OF node of the GPIO udevice.
+ *
+ * This allows boards to implement common behaviours using GPIOs while not
+ * requiring specific GPIO offsets be used.
+ *
+ * @dev:	An instance of a GPIO controller udevice
+ * @line_name:	The name of the GPIO (e.g. "bmc-secure-boot")
+ * @desc:	A GPIO descriptor that is populated with the requested GPIO
+ *              upon return
+ * @flags:	The GPIO settings apply to the request
+ * @return 0 if the named line was found and requested successfully, or a
+ * negative error code if the GPIO cannot be found or the request failed.
+ */
+int gpio_request_by_line_name(struct udevice *dev, const char *line_name,
+			      struct gpio_desc *desc, int flags);
+
 /**
  * gpio_request_list_by_name() - Request a list of GPIOs
  *
-- 
2.32.0

