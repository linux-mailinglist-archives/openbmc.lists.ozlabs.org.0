Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F5F4A3CBF
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 04:42:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnDQr5477z2yfc
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 14:42:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=maoY4+W/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DCHbSCqA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=maoY4+W/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=DCHbSCqA; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnDQR6VcXz2xsK
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 14:42:07 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E22175C00A1;
 Sun, 30 Jan 2022 22:42:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 30 Jan 2022 22:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; bh=2gno013I25+ySp7F0Sv5fGTEjuy3MQruYqxZAm1iKcc=; b=maoY4
 +W/8T81HwyMdM17DsaZe8m1N17JLkfqZGdZk00Xo+gSAN3Fuvcvk20KaxYQXbpM2
 TLjzQ5DirUWGhLeLjD3OuZL/urgVp+NKUGJ1cRheChbaQn/W+FeNv5nCGIRegnub
 xp7/HFlqZf7w76DGxbfGj5z9WNgrUVxVSqzhXIFgasuineZ2jdKkm++J7JQOq71y
 u5J+oIxlU5cCBhAsz4p8D4Myaj5JSOqXDIKCVby2KowG01bLnN7HPVlbK7Peb0oz
 AKeAeuUvKei21cYYMd8672UtyRvlVSHTZRvgzEgezVq9btQlQ5WIXdHa8dH4xe+D
 HGZQBRptLeFRXQohQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=2gno013I25+ySp7F0Sv5fGTEjuy3M
 QruYqxZAm1iKcc=; b=DCHbSCqA0d27aJ4798pzoDW/8iA+4RDjVOhbNZ3RsIF82
 wXM1oq3uyeiL1fuA6/td0aDl2ZyGk/5A84TkKlDhiaOHlD9dtSLKgw8CGBeRw16V
 ylPcOFJug/CRi4dQkOxTDoREQCADtT0K+wO6CFIzYGYq7Y55RByoPcU3VTaIWhtH
 Uf/MdFHQDxKlJs3kz6floP95V+w1+h2xZw1+bGKy0rQ5BMila6098ZqKNeJW6tdP
 vbBT9iLQQiLwF0209II4SuQdq9Oy/AVo71gUmUPdMj2vJdkMSA9zm/Wr3SaMm/Ii
 isDRt5ZCP3uLWhBDUJdwvQaHaZI6Myl+OJAOsj7FQ==
X-ME-Sender: <xms:jVr3YYarlVAR7qv0og_t5HK7aDY47pQyPFmWNDVAq0dx40ol51VJ_g>
 <xme:jVr3YTaIUmPNIojzbfk4_w_EnYmTmDOwp85c7K4D3fW5wyLqP_k6_-JvimcpjPzaz
 Bg6nxPUBDBmOEDxng>
X-ME-Received: <xmr:jVr3YS_brM3kbE8zyB-iZOH0NIKG9ubYrdSd1gxLuDl8YGQ79gPD5n4c925230fxq8dvVE1XbC5Ekqb6vJMnAwsSWkDHvkCyc-61GcURae_TjC6t1eW5RomHkaaH-ep->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedtgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucggtffrrghtthgvrhhnpeeiteehudevlefhvddvjeeluefhleetveehff
 fgiedtfeegkeejfeeivefgheehgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
 ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:jVr3YSr5vPX0K801R2qn_iZzH344x8fQfBRoqakisFK744tTQB9X7Q>
 <xmx:jVr3YTqXTcTzVTQ9w_26U8xK9eXWvwyQDLqAwiYlg5PJeAYo05cTsw>
 <xmx:jVr3YQQcRoFNbKjRLd1zbhS_cgmoZU0qxcAN91VSIhwhqsghTiWsQg>
 <xmx:jVr3YSV-rKMSlAj5q2xssKWhgvlqF1Afq4zxCTV82vSROuj0f2tkXQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Jan 2022 22:42:02 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: u-boot@lists.denx.de
Subject: [PATCH] image: Control FIT signature verification at runtime
Date: Mon, 31 Jan 2022 14:11:47 +1030
Message-Id: <20220131034147.106415-1-andrew@aj.id.au>
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
Cc: openbmc@lists.ozlabs.org, sjg@chromium.org, chiawei_wang@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Some platform designs include support for disabling secure-boot via a
jumper on the board. Sometimes this control can be separate from the
mechanism enabling the root-of-trust for the platform. Add support for
this latter scenario by allowing boards to implement
board_fit_image_require_verfied(), which is then invoked in the usual
FIT verification paths.

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

 boot/Kconfig     |  8 ++++++++
 boot/image-fit.c | 21 +++++++++++++++++----
 include/image.h  |  9 +++++++++
 3 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/boot/Kconfig b/boot/Kconfig
index c8d5906cd304..ec413151fd5a 100644
--- a/boot/Kconfig
+++ b/boot/Kconfig
@@ -78,6 +78,14 @@ config FIT_SIGNATURE
 	  format support in this case, enable it using
 	  CONFIG_LEGACY_IMAGE_FORMAT.
 
+if FIT_SIGNATURE
+config FIT_RUNTIME_SIGNATURE
+	bool "Control verification of FIT uImages at runtime"
+	help
+	  This option allows board support to disable verification of
+	  signatures at runtime, for example through the state of a GPIO.
+endif # FIT_SIGNATURE
+
 config FIT_SIGNATURE_MAX_SIZE
 	hex "Max size of signed FIT structures"
 	depends on FIT_SIGNATURE
diff --git a/boot/image-fit.c b/boot/image-fit.c
index f01cafe4e277..919dbfa4ee1d 100644
--- a/boot/image-fit.c
+++ b/boot/image-fit.c
@@ -1308,6 +1308,14 @@ static int fit_image_check_hash(const void *fit, int noffset, const void *data,
 	return 0;
 }
 
+#ifndef __weak
+#define __weak
+#endif
+__weak int board_fit_image_require_verified(void)
+{
+	return 1;
+}
+
 int fit_image_verify_with_data(const void *fit, int image_noffset,
 			       const void *key_blob, const void *data,
 			       size_t size)
@@ -1319,6 +1327,7 @@ int fit_image_verify_with_data(const void *fit, int image_noffset,
 
 	/* Verify all required signatures */
 	if (FIT_IMAGE_ENABLE_VERIFY &&
+	    fit_image_require_verified() &&
 	    fit_image_verify_required_sigs(fit, image_noffset, data, size,
 					   key_blob, &verify_all)) {
 		err_msg = "Unable to verify required signature";
@@ -1340,9 +1349,11 @@ int fit_image_verify_with_data(const void *fit, int image_noffset,
 						 &err_msg))
 				goto error;
 			puts("+ ");
-		} else if (FIT_IMAGE_ENABLE_VERIFY && verify_all &&
-				!strncmp(name, FIT_SIG_NODENAME,
-					strlen(FIT_SIG_NODENAME))) {
+		} else if (FIT_IMAGE_ENABLE_VERIFY &&
+			   fit_image_require_verified() &&
+			   verify_all &&
+			   !strncmp(name, FIT_SIG_NODENAME,
+				    strlen(FIT_SIG_NODENAME))) {
 			ret = fit_image_check_sig(fit, noffset, data, size,
 						  gd_fdt_blob(), -1, &err_msg);
 
@@ -2061,7 +2072,9 @@ int fit_image_load(bootm_headers_t *images, ulong addr,
 		if (image_type == IH_TYPE_KERNEL)
 			images->fit_uname_cfg = fit_base_uname_config;
 
-		if (FIT_IMAGE_ENABLE_VERIFY && images->verify) {
+		if (FIT_IMAGE_ENABLE_VERIFY &&
+		    fit_image_require_verified() &&
+		    images->verify) {
 			puts("   Verifying Hash Integrity ... ");
 			if (fit_config_verify(fit, cfg_noffset)) {
 				puts("Bad Data Hash\n");
diff --git a/include/image.h b/include/image.h
index 97e5f2eb24d6..98900c2e839b 100644
--- a/include/image.h
+++ b/include/image.h
@@ -1173,6 +1173,15 @@ int calculate_hash(const void *data, int data_len, const char *algo,
 # define FIT_IMAGE_ENABLE_VERIFY	CONFIG_IS_ENABLED(FIT_SIGNATURE)
 #endif
 
+/*
+ * Further, allow run-time control of verification, e.g. via a jumper
+ */
+#if defined(CONFIG_FIT_RUNTIME_SIGNATURE)
+# define fit_image_require_verified()	board_fit_image_require_verified()
+#else
+# define fit_image_require_verified()	FIT_IMAGE_ENABLE_VERIFY
+#endif
+
 #ifdef USE_HOSTCC
 void *image_get_host_blob(void);
 void image_set_host_blob(void *host_blob);
-- 
2.32.0

