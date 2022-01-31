Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAC34A3C6F
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 02:26:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jn9Q74gNtz2yQB
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 12:26:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=FXDUlIYr;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=G88sbKdb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=FXDUlIYr; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=G88sbKdb; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jn9Pk1CcWz2xtb
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 12:26:18 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2FB135C00F0;
 Sun, 30 Jan 2022 20:26:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 30 Jan 2022 20:26:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=kq0WcU0VzVAha0tWYcqFq+2wGvg1LM
 5GJY8U1GgiZZM=; b=FXDUlIYrFMl7HbLUjvkNLDKkgBL+rs8BZf4/RWwFRupNM+
 jL2OpVgQioHKE4r5KBZm/vQfQOHukCQEXuhjil0aGHZb5c1GDHqCsrPN+FZUK0oL
 gjaJipYuzWjlSSVVUb8Pvjuh/DLyAU5MS9P63mX7SpJNdtW0ngjL01zfPl1yCXMS
 WFiYkXzNoCg+2RU2VgOfG0hGjsXH793l9NxyKSNxZSoYE9iM+igSmEof5hf8dDD9
 fHOpR4pd+DvBknNK5BYIDLasZshjqgPEyAmNDOZxoSAiOF3ZrFl9znVVQqw4SGD0
 6237fC3bsiwaEmYG1pTFfn/GQ6cMtaxGxAu43DMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=kq0WcU
 0VzVAha0tWYcqFq+2wGvg1LM5GJY8U1GgiZZM=; b=G88sbKdbICmGhgZ7nSB4UQ
 9kSgiDNMl6tnflxJcj0jUhWzmBoJ3ZAibcyTg2D2YGRhUshuFCnIg6hIRz1ttCSy
 /5O7dxxd66qfyTydAkE803XV8rijtMvBT4XI+4GdeceLyAnCWuVUfm+JB/ex4HYg
 HkkotK0kpdh3dGyeIed+iHG4Z164jD0H4GALraNBVsc4hUesHFRPYyp5cEgaDRMg
 rSUAcjdlnRneyL+oD2wYTG8WK+Ti8HUP8IaiSu5xKMQNXNRCTQM+o/AOKTp6AtB7
 fKpDT1L2g41mlvWkh4Sob9bGSpjjaNizrUsX5lSzc6y/WT7IxGGkf3L4geqbIDag
 ==
X-ME-Sender: <xms:uDr3YROtAar7qC8PmUzjOZh0IEegX7vp_nUJAnrXZ48a84UwgGEQ6w>
 <xme:uDr3YT_frzMRd0d8zqrKv4685c5psGxjDhpF0el3wQdjuYXDuo6r2OWInQO58uStF
 OeKqBMLt5S6wcc7DQ>
X-ME-Received: <xmr:uDr3YQQA6WuO1mn_redGXaREfQnaFFnu_OodWpDWoKSrcybeedjvw0SI330RJlOUvDRVfGsyDZWZ7a5GjV2aPCwENzz_zMGiT3Yjp8mQDrWO42tSsZdLIMSW-azL7tRv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedtgdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:uDr3YdsFzAgcShrWsqZVn_NyVAcTtYiscXzYebbz5GGV5tECaRsUCQ>
 <xmx:uDr3YZcESZieXFiRZKWpXQQkjJt-OqECJos01_SQqrYZqhdm81z7Sw>
 <xmx:uDr3YZ06UR8VNF1WIZ7XPoWYjFfRlDTdacbr0ZCz2_M91COcOK-e_w>
 <xmx:uDr3YZHR7dLi9AtQqL-EPim_271S3OzzhHvUl8sgj-1nkZOj7U71-A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Jan 2022 20:26:14 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 2/6] image: Control FIT uImage
 signature verification at runtime
Date: Mon, 31 Jan 2022 11:55:34 +1030
Message-Id: <20220131012538.73021-3-andrew@aj.id.au>
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

Some platform designs include support for disabling secure-boot via a
jumper on the board. Sometimes this control can be separate from the
mechanism enabling the root-of-trust for the platform. Add support for
this latter scenario by allowing boards to implement
board_fit_image_require_verfied(), which is then invoked in the usual
FIT verification paths.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Kconfig            |  9 +++++++++
 common/image-fit.c | 17 +++++++++++++++--
 include/image.h    |  9 +++++++++
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/Kconfig b/Kconfig
index c3dfa8de47c8..11f796035ae4 100644
--- a/Kconfig
+++ b/Kconfig
@@ -322,6 +322,15 @@ config FIT_SIGNATURE
 	  format support in this case, enable it using
 	  CONFIG_IMAGE_FORMAT_LEGACY.
 
+if FIT_SIGNATURE
+config FIT_RUNTIME_SIGNATURE
+	bool "Control verification of FIT uImages at runtime"
+	help
+	  This option allows board support to disable verification of
+	  signatures at runtime, for example through the state of a GPIO.
+endif # FIT_SIGNATURE
+
+
 config FIT_SIGNATURE_MAX_SIZE
 	hex "Max size of signed FIT structures"
 	depends on FIT_SIGNATURE
diff --git a/common/image-fit.c b/common/image-fit.c
index 3c8667f93de2..eb1e66b02b68 100644
--- a/common/image-fit.c
+++ b/common/image-fit.c
@@ -1199,6 +1199,14 @@ static int fit_image_check_hash(const void *fit, int noffset, const void *data,
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
 			       const void *data, size_t size)
 {
@@ -1209,6 +1217,7 @@ int fit_image_verify_with_data(const void *fit, int image_noffset,
 
 	/* Verify all required signatures */
 	if (IMAGE_ENABLE_VERIFY &&
+	    fit_image_require_verified() &&
 	    fit_image_verify_required_sigs(fit, image_noffset, data, size,
 					   gd_fdt_blob(), &verify_all)) {
 		err_msg = "Unable to verify required signature";
@@ -1230,7 +1239,9 @@ int fit_image_verify_with_data(const void *fit, int image_noffset,
 						 &err_msg))
 				goto error;
 			puts("+ ");
-		} else if (IMAGE_ENABLE_VERIFY && verify_all &&
+		} else if (IMAGE_ENABLE_VERIFY &&
+				fit_image_require_verified() &&
+				verify_all &&
 				!strncmp(name, FIT_SIG_NODENAME,
 					strlen(FIT_SIG_NODENAME))) {
 			ret = fit_image_check_sig(fit, noffset, data,
@@ -1849,7 +1860,9 @@ int fit_image_load(bootm_headers_t *images, ulong addr,
 		if (image_type == IH_TYPE_KERNEL)
 			images->fit_uname_cfg = fit_base_uname_config;
 
-		if (IMAGE_ENABLE_VERIFY && images->verify) {
+		if (IMAGE_ENABLE_VERIFY &&
+				fit_image_require_verified() &&
+				images->verify) {
 			puts("   Verifying Hash Integrity ... ");
 			if (fit_config_verify(fit, cfg_noffset)) {
 				puts("Bad Data Hash\n");
diff --git a/include/image.h b/include/image.h
index 937c7eee8ffb..19ea743af08f 100644
--- a/include/image.h
+++ b/include/image.h
@@ -1103,6 +1103,15 @@ int calculate_hash(const void *data, int data_len, const char *algo,
 # define IMAGE_ENABLE_VERIFY	0
 #endif
 
+/*
+ * Further, allow run-time control of verification, e.g. via a jumper
+ */
+#if defined(CONFIG_FIT_RUNTIME_SIGNATURE)
+# define fit_image_require_verified()	board_fit_image_require_verified()
+#else
+# define fit_image_require_verified()	IMAGE_ENABLE_VERIFY
+#endif
+
 #ifdef USE_HOSTCC
 void *image_get_host_blob(void);
 void image_set_host_blob(void *host_blob);
-- 
2.32.0

