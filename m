Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCF5575A01
	for <lists+openbmc@lfdr.de>; Fri, 15 Jul 2022 05:34:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkcQy3vyKz3c7y
	for <lists+openbmc@lfdr.de>; Fri, 15 Jul 2022 13:34:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iNxWk+W/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iNxWk+W/;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkcQZ4HZ9z3brp
	for <openbmc@lists.ozlabs.org>; Fri, 15 Jul 2022 13:33:41 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id p9so4517116pjd.3
        for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2022 20:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B+knrllnOHHNw40Eb5Rd4HW290LvgmvKO1ZPWy67UfQ=;
        b=iNxWk+W/Q6C/l9vikSy8InAdD8N3A4Kn7NFMO87fLqkbWCQhci1nVU8TGXigEOLrV6
         Q2IR+Gs8JLBcbfpfP+rf9FPX0nTNU+kHT+Xd2jBLwEuEpXNGEyMh7SeK/kvx77bp9sr6
         zd4Luddrc/XknOdqnisJNbckdPFmU+ZJ2R2cIE1xIMOdNcL+TioZ69WzOszzNzJFniig
         kqaxKFd2/Cv1qW9Jjz8yCKIXedHYiuSdJwrWsdLdWGPOS6xbqmsX83LPFTtcDR8SE/3V
         lB0viNu/IFpCs059tmVwrliOJnNqhZ/DVFCbPfIRN3zj5y+jZNiT/bvNNds5tia/TTda
         femA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=B+knrllnOHHNw40Eb5Rd4HW290LvgmvKO1ZPWy67UfQ=;
        b=M77eTlIkbf1xUj9gx3BUZ+u3VmVW5q/3Gx5qHvrwydZvZvX8Tc0ujxbWpg2HP1avbh
         1UPJrXZ8hPzfS4ta20EA1SzTfloSG2i74zF5gyfwYp0aG8GQxtEDRltJiOmC6ChHw1P0
         O5wEuVyBFeP0rZbITzqza9O8KkLCJMER0cS3MhhxhxleJE76xWikmE7E5jWscoIh1X6R
         QDu/2IZTYoTxEilFWMfE1FWW8L19O3ohOx/ob0TzrKi+JecKpIcN/5xj7yCzOMVVhMjm
         1op33GR5/VooGLj/b5bzGeloY/rmybAjwgA1Raqc6Xfwf6dgPuxq5Hew5E5i0W1HD4ru
         Y6QQ==
X-Gm-Message-State: AJIora9WpfkCPog61nYBcwM3k2O/O1mTtZhFlL7aZKH+ZfyVt95D243w
	3P0H3Q1jEZmcczPf7UJpGA6kCb6sbwk=
X-Google-Smtp-Source: AGRyM1s7tbxds5sCmxSqLN0rgSZfMeFwt3fwHNdYdXMhtoLeedIDuRRw2CK2hPSrOT8R6aA45rBNMQ==
X-Received: by 2002:a17:90a:eb09:b0:1ef:7df7:cdf7 with SMTP id j9-20020a17090aeb0900b001ef7df7cdf7mr13251855pjz.185.1657856017609;
        Thu, 14 Jul 2022 20:33:37 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id c135-20020a621c8d000000b005290553d343sm2481788pfc.193.2022.07.14.20.33.35
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 20:33:36 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] tools: Disable OpenSSL deprecation warnings
Date: Fri, 15 Jul 2022 13:03:27 +0930
Message-Id: <20220715033327.1053462-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

mkimage is linked against the host version of OpenSSL. If the distro
happens to be using OpenSSL 3.0 then several warnings about using
depreciated functions will be emitted.

 warning: ‘RSA_get0_key’ is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]

These functions still work for now, so suppress the warning and delay
the need to move to the new API.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
The backport to move to the newer OpenSSL APIs are complicated. Instead
of focusing on fixing the old branch, work is being done to move to a
newer u-boot base.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tools/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/Makefile b/tools/Makefile
index 81aa374a32dd..9e7a8e85435d 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -159,10 +159,12 @@ HOSTLOADLIBES_mkimage += \
 ifeq ($(HOSTOS),darwin)
 HOSTCFLAGS_mxsimage.o += -Wno-deprecated-declarations
 HOSTCFLAGS_image-sig.o += -Wno-deprecated-declarations
-HOSTCFLAGS_rsa-sign.o += -Wno-deprecated-declarations
 endif
 endif
 
+# Disable warnings on systems with OpenSSL 3.0
+HOSTCFLAGS_rsa-sign.o += -Wno-deprecated-declarations
+
 HOSTCFLAGS_fit_image.o += -DMKIMAGE_DTC=\"$(CONFIG_MKIMAGE_DTC_PATH)\"
 
 HOSTLOADLIBES_dumpimage := $(HOSTLOADLIBES_mkimage)
-- 
2.35.1

