Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9094A3C70
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 02:27:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jn9Qt46NMz3bPM
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 12:27:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=ka/+QV1d;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Wk3tvqd/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=ka/+QV1d; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Wk3tvqd/; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jn9Ph6YDRz2xRn
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 12:26:16 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id EAA2D5C00EE;
 Sun, 30 Jan 2022 20:26:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 30 Jan 2022 20:26:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=Yg4GNeI1qx5hT2zO4ipWOfEO/y90KB
 NO6BTaUuU/Jeo=; b=ka/+QV1dun55GlGnH6ncFEDR9bc9Dl8I6akYacdPt6+kAr
 9FXXlkc/9a0c2gKNaBeKC94bIfk1/4rxZIdY+9ktsRgUHS2cIyUYQZzWj5YkiJ5C
 xD1Gwp2zxjYEMSAoEnm3PdzYaUe3SmMmF444KsCN7rSMz0A5LZUm53NkoyOMOokC
 OKRbfcrLpKGDyR4wznaq11MNbaMCvw8SJ7mCsBhIcWab2pwcQQ2SKxDO85lyuDJ/
 95CmRsmJCVo18LIBiS8tas4ybtms462HfcdcuiUlJY2C+t/XZwlFnTkjaG99D1PV
 RU3CbxMfXMa1ztPp0LZJXRjuozUtwQmxLbd9+ajw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Yg4GNe
 I1qx5hT2zO4ipWOfEO/y90KBNO6BTaUuU/Jeo=; b=Wk3tvqd/8YS7QQw3Z1yigI
 Ve2M8pTEK0Czbsju9ksmeWQ+Nya70YEmtQVtoJVjn0TRcpQhEBmPCIFtlb6jUFJd
 qbkr2UsMclo+g4o7lZtdiZZWftIWvvViCHGUa/y5YPJQ1KKacE6GvhLzlCd9LHXQ
 PjD47zkiG7SPJphYvFxNv92TpCckZEdelcGU1dqfG+9fiE70CNOzWdVqy5SI8gyy
 P9BeGS+GMisIpifhnbDr+AhZ98+uerUzj8hlTrn+wMqCjeCuovlvIiwqZh1nMGF+
 5xRccdt/lVqJSVjwulehMBuU2sts0dRHKa5eCc4LQHvBR3kX2PRNKq2S3gu3d9DA
 ==
X-ME-Sender: <xms:tTr3YefTVq-5TQJ6Our_5HpVDvRggvNndv8Bt548yie2u2ymX-rnSw>
 <xme:tTr3YYPfQ53OC2Yx2XkJdKovl-yuPnui1RndsQbHAzQDzKU5hS1iELOplptmgFkit
 USGdOTiE70S-0ndhw>
X-ME-Received: <xmr:tTr3Yfg02o6GYRh8D8XGtUExYgngQbXErA5D7c0p5FSWLrPwr640iQLR2k3dmEDec6NmNYR-NsxI2omamBmLXskdzACOzL7AxufxMWFNA46PSTjeZcMB22MotzYrhKbW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedtgdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeeuhfethfduueefhefffeefteeiueefud
 elvefgkeetfeetkeelteffheejueekheenucffohhmrghinhepghhithhhuhgsrdgtohhm
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnug
 hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:tTr3Yb_JAgjnlQF3uDDeYqyRl4IeiO6bv5EnoOD0C7nzbkHwqEYZ2g>
 <xmx:tTr3YatEycQ4A7nQS69NOMgYjC_-06JtrdwJPZ74Chrin_F4TKprjQ>
 <xmx:tTr3YSF77rVX0lv20AG_bmoIdCpDnBRkY88dVzKRgJ8eKGGtApYy_A>
 <xmx:tTr3YfWtm6j4kXLm3cROM3aejC54wVZr48vnzCrZlF37HWyyUrDW_g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Jan 2022 20:26:11 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 1/6] gpio: Add
 gpio_request_by_line_name()
Date: Mon, 31 Jan 2022 11:55:33 +1030
Message-Id: <20220131012538.73021-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220131012538.73021-1-andrew@aj.id.au>
References: <20220131012538.73021-1-andrew@aj.id.au>
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
Cc: eajames@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add support for the upstream gpio-line-names property already described
in the common GPIO binding document[1]. The ability to search for a line
name allows boards to lift the implementation of common GPIO behaviours
away from specific line indexes on a GPIO controller.

[1] https://github.com/devicetree-org/dt-schema/blob/3c35bfee83c2e38e2ae7af5f83eb89ca94a521e8/dtschema/schemas/gpio/gpio.yaml#L17

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpio-uclass.c | 26 ++++++++++++++++++++++++++
 include/asm-generic/gpio.h | 19 +++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index 219caa651bb2..425bbc5cb880 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -878,6 +878,32 @@ int gpio_request_by_name(struct udevice *dev, const char *list_name, int index,
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
index d6cf18744fda..6ed0ba11b6c1 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -451,6 +451,25 @@ int gpio_claim_vector(const int *gpio_num_array, const char *fmt);
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

