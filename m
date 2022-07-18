Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86011577DF9
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 10:51:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmbKT4KQZz3c3L
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 18:51:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bck3INmc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bck3INmc;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmbFl16cQz3bkd
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 18:47:54 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id c139so3712406pfc.2
        for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 01:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tTsaJi/aBfMLOUcGWJTKcmgimxno0ovagRBeaRXx9y4=;
        b=Bck3INmcAU6tBIJ1BFvx4k9lHO7OP+tek5Gy44OIvfRWUrX0zMT3MEMmhMEnvL3H3Z
         Ob+TUJ0txgxj7zc8G+ZZk4pYgBEs6OdkDk89pfvP6C49Nc63embxrttFzGTuZX1yeD/w
         nj9GBmGk+xD13IMKqaRug94VXG4MABe5wMazabB7PT02jJQL8TfMjLpU36YQAPuPmD4I
         LExo/lE0iNAgE6v/sCnr0uGGtJgbKxsmMFx0CWMlZnZ4x22r5Gi+aALcD5Ho43w392em
         yuAtDrxM3gp4USTSemCDZvdovzrVe5H/SZwjAFOjfgVX60/tu4NzqNOuywZhNFBlekeb
         1Mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=tTsaJi/aBfMLOUcGWJTKcmgimxno0ovagRBeaRXx9y4=;
        b=a9l+4XlG86IWFCirj+5JwZSSmUdRa6lQ/yCIz44yKEB9+atczW+1B6kR1r4LRjVPSY
         nlgHmEGGGpd2xTE7Y+H84s5troy1kth2qwJQP2QAnQM22riFBiEmmziAOogKnaBiJfEP
         oVD1BeTUJfZz4i1GHjyTei/s/qIgDe2x3GJxZTjkw0DF/kjjClsJhmnUv4pDpsGAQC+g
         OsQlOM9looNPSnbbrA9+HnY0wprXLpelRlenfMb7CGQOe00RiIyzoKq0so3UDYe9r2qZ
         ol82k71tToyeN+a752XgqiWOALSJWbEYMeCv7SX7KjvYybWypWf8y/LrTt0e7iWOAh6D
         DP4A==
X-Gm-Message-State: AJIora+YbniqMLoCV1mxTITe0VPceA0ykSBPTx8LKQydVaId421v1oZh
	RiVtJmeVNBG2t1Oh8xol+3QO3Y9dLso=
X-Google-Smtp-Source: AGRyM1tqQoKDSqhX3qpnBVurJz2HVXfNJbMVJxYn45QV5Vx6hQ/pPKIK4gnbfeu+3q/kPpMExMCZFg==
X-Received: by 2002:a05:6a00:1a92:b0:52b:ac3:7964 with SMTP id e18-20020a056a001a9200b0052b0ac37964mr26755785pfv.31.1658134071935;
        Mon, 18 Jul 2022 01:47:51 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id i28-20020a056a00225c00b005289521b656sm8806095pfu.92.2022.07.18.01.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 01:47:51 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 5/5] cmd/otp: Reduce size of otpkey
Date: Mon, 18 Jul 2022 18:17:28 +0930
Message-Id: <20220718084728.1140108-6-joel@jms.id.au>
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

Don't store more information than is used. Saves 3KB.

  Function                                     old     new   delta
  _otp_print_key                               540     580     +40
  otp_verify_boot_image                       1276    1268      -8
  a2_key_type                                  640      40    -600
  a1_key_type                                  640      40    -600
  a3_key_type                                 1024      64    -960
  a0_key_type                                 1024      64    -960
  Total: Before=266547, After=263459, chg -1.16%

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
This patch includes Zev's suggestion to make the bitfields unsigned:

 https://lore.kernel.org/openbmc/20220716090847.GC9659@packtop/

 cmd/otp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/cmd/otp.c b/cmd/otp.c
index add70c841405..2df410dfd024 100644
--- a/cmd/otp.c
+++ b/cmd/otp.c
@@ -133,11 +133,11 @@ struct otpstrap_status {
 };
 
 struct otpkey_type {
-	int value;
-	int key_type;
-	int order;
-	int need_id;
-	char information[110];
+	unsigned int value: 4;
+	unsigned int key_type: 4;
+	unsigned int order: 1;
+	unsigned int need_id: 1;
+	char *information;
 };
 
 struct otp_pro_sts {
-- 
2.35.1

