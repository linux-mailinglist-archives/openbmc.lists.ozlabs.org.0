Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACABD577DF4
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 10:50:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmbJm4WRfz2y8Q
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 18:50:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OS4dBJZd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OS4dBJZd;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmbFh45Sdz3c5h
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 18:47:52 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 23so9964465pgc.8
        for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 01:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gGTNzPjEZYpLT4vW76g3OPKhcCsIvw3YoUWlJme06UI=;
        b=OS4dBJZd6Su+QhDeXDmADUCzoS+jsVW2HA1v8BWUQwrAVPfLywK+UMrEmQ1dgPp2l+
         osSh+Xr6sXTDvPsNX/uN2cLVofOLDBhkmkL12QOm2OZ1FJ2yYegIzugBDZulV95su6in
         bb3UrQh+I9mio2pxjyey5H3fD7smV7KLqflXKED/p57w+AcWFelHqFaE/jKht/41j/KE
         ZbaBfCXQa+o7Zoto5GKHV9Qq/8P07KrDOO/4OVmBPg9KdlZMgp3y0voJmw8NciEf9a1w
         PNAOh70vFi1WyvIRIAWtKvmuClJx4QIz2qFv4JrcP2GqEF/l8lf945/YzU+imb3sgdJc
         MoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=gGTNzPjEZYpLT4vW76g3OPKhcCsIvw3YoUWlJme06UI=;
        b=7bQWrqEQ30WYzH11yKdhsOl882mIg3hn3HYGtdiTDCAMd4jK1AJ55imQ3LOWfmKZj6
         V3eip9mqc+B4qJoJq7RPKAGvoSSSzypps3TvUx5VdNpo7WXEtHuDp9/uekgpA73gfHYH
         3BcS9UTquOJQy1pcWbxNQrtYzKkxin/89sPGghdoJu+X06aNoRWvrTNmzL/ol337BfiG
         zUHaYkf+QD0twjVI/t7R5Chbe4oSaJZLa5t6zAExeIhdxhx1caLphDS5WnuN5xz9SR3M
         NK8cTHkP3GV176V0yVhUF3gBPJNMkboAgE2MUIk7brSnCCytSTyLEMwufRDeOVc0jfPh
         nYFQ==
X-Gm-Message-State: AJIora+Fcv8X8TBKtJ5KKWZEgrL3JadF5TRgISigxTkwtc6wLjb1s2VA
	dqCJL3086FY0SrLzem2i5weMzf4FW5M=
X-Google-Smtp-Source: AGRyM1twgx12QOOdRHdzxu16oPB836sd4SbrT8ro2XapNG/Oq3PrxCByAhNw5luBT+GmgvRYulywMg==
X-Received: by 2002:a05:6a00:1703:b0:52b:39a4:4632 with SMTP id h3-20020a056a00170300b0052b39a44632mr16845001pfc.29.1658134069399;
        Mon, 18 Jul 2022 01:47:49 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id i28-20020a056a00225c00b005289521b656sm8806095pfu.92.2022.07.18.01.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 01:47:48 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 4/5] cmd/otp: Use hashing API
Date: Mon, 18 Jul 2022 18:17:27 +0930
Message-Id: <20220718084728.1140108-5-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220718084728.1140108-1-joel@jms.id.au>
References: <20220718084728.1140108-1-joel@jms.id.au>
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
Cc: Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Instead of calling the hashing functions directly, which uses the
software implementation of the algorithms, use the hash API which
allows the use of the HACE driver.

Saves 12.5KB:

 Before=279327, After=266547, chg -4.58%

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 cmd/otp.c | 49 +++++++++++++++++--------------------------------
 1 file changed, 17 insertions(+), 32 deletions(-)

diff --git a/cmd/otp.c b/cmd/otp.c
index 049c217d6048..add70c841405 100644
--- a/cmd/otp.c
+++ b/cmd/otp.c
@@ -305,33 +305,6 @@ static int get_rid_num(u32 *rid)
 	return rid_num;
 }
 
-static void sb_sha256(u8 *src, u32 len, u8 *digest_ret)
-{
-	sha256_context ctx;
-
-	sha256_starts(&ctx);
-	sha256_update(&ctx, src, len);
-	sha256_finish(&ctx, digest_ret);
-}
-
-static void sb_sha384(u8 *src, u32 len, u8 *digest_ret)
-{
-	sha512_context ctx;
-
-	sha384_starts(&ctx);
-	sha384_update(&ctx, src, len);
-	sha384_finish(&ctx, digest_ret);
-}
-
-static void sb_sha512(u8 *src, u32 len, u8 *digest_ret)
-{
-	sha512_context ctx;
-
-	sha512_starts(&ctx);
-	sha512_update(&ctx, src, len);
-	sha512_finish(&ctx, digest_ret);
-}
-
 static u32 chip_version(void)
 {
 	u32 revid0, revid1;
@@ -1912,6 +1885,18 @@ static int otp_check_scu_image(struct otp_image_layout *image_layout, u32 *scu_p
 	return OTP_SUCCESS;
 }
 
+static void do_hash(const void *data, int data_len, const char *algo_name, uint8_t *value)
+{
+        struct hash_algo *algo;
+
+        if (hash_lookup_algo(algo_name, &algo)) {
+                debug("Unsupported hash alogrithm\n");
+                return;
+        }
+
+        algo->hash_func_ws(data, data_len, value, algo->chunk_size);
+}
+
 static int otp_verify_image(u8 *src_buf, u32 length, u8 *digest_buf, int version)
 {
 	u8 digest_ret[48];
@@ -1919,11 +1904,11 @@ static int otp_verify_image(u8 *src_buf, u32 length, u8 *digest_buf, int version
 
 	switch (version) {
 	case 1:
-		sb_sha256(src_buf, length, digest_ret);
+		do_hash(src_buf, length, "sha256", digest_ret);
 		digest_len = 32;
 		break;
 	case 2:
-		sb_sha384(src_buf, length, digest_ret);
+		do_hash(src_buf, length, "sha384", digest_ret);
 		digest_len = 48;
 		break;
 	default:
@@ -2549,13 +2534,13 @@ static int sb_sha(struct sb_info *si, u8 *sec_image, u32 sign_image_size, u8 *di
 		printf("otp verify does not support SHA224\n");
 		return OTP_FAILURE;
 	case 256:
-		sb_sha256(sec_image, sign_image_size, digest_ret);
+		do_hash(sec_image, sign_image_size, "sha256", digest_ret);
 		break;
 	case 384:
-		sb_sha384(sec_image, sign_image_size, digest_ret);
+		do_hash(sec_image, sign_image_size, "sha384", digest_ret);
 		break;
 	case 512:
-		sb_sha512(sec_image, sign_image_size, digest_ret);
+		do_hash(sec_image, sign_image_size, "sha512", digest_ret);
 		break;
 	default:
 		printf("SHA Algorithm is invalid\n");
-- 
2.35.1

