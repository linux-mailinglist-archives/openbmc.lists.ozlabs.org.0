Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1162B5EDC09
	for <lists+openbmc@lfdr.de>; Wed, 28 Sep 2022 13:52:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mcvxz64pnz3bqW
	for <lists+openbmc@lfdr.de>; Wed, 28 Sep 2022 21:52:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NhmuAFNF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NhmuAFNF;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mcr5k74cJz301Z
	for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2022 18:59:21 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id jm5so11219622plb.13
        for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2022 01:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=5FzK05U8rhKY3zF0cJV4Zw2qpBxX80pF51+0rIiqaCw=;
        b=NhmuAFNFrqAfJoAfum6AZwkmuVkGuWdH5z2YRTk3Jza8EtgWrq15ntnNStEGwNcPwx
         BoNLNUP6NznSeSWHIdjEByyDy/IbyIpblxV6apMqfChmIAO8iH4vvULO4iZy+MFSt2x0
         0AE9uhkIutHhlEI5ODBmhsTgV+HUs8DYQf59nxqaMSSBbOcFeEyG8HqxXbnP0XhW5d4e
         oBZIlvbtAl97StmupHPCoWAex+G2F17WX9t4gy5rFPExgSS90khlZncSvCpkY4DqN+Fj
         9F8jGwDdRFCEgshxDSRCw/f8qTaCG8UPNtkgykda6/Sbk85w9TkktzuTlCy0SUxaFi1R
         D0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=5FzK05U8rhKY3zF0cJV4Zw2qpBxX80pF51+0rIiqaCw=;
        b=cSNYUuAEkSynVFavMNzWK4r6X9IFW/u+iBxFl1dU04oBf3JW598+r2Yv/YuZ15fhHh
         C1gYFn80dqzYxmvNrVfDRaCpJUrVJTGTsOWPZyeGrd776Fqua/2Bt3GMZTIbtpRDaOhs
         Plbx+StYJzRyqDn6YO3HLS6TdyDcqM9duIl7ZkJaU0kZYobhzbeOAt8mvIYa4/cGoPsm
         4yOFrYqQ41mADR8aAPGDdhKjhDu98JeNZlbQ6L6M6hpCYf3i6sltdK2UWgAJaH7oWHcH
         4gCp+aKKS2iSJ3brkUpXDL2kY0VxvsqXpZ02FrPlz0enLCE/W+QW1Q4WFfZYOlqykvVv
         tVIQ==
X-Gm-Message-State: ACrzQf3E3f9F/aypXDxVSFX/RpZuErgK4WN1p3j9XDVX8Fm5AS2idhtB
	HUbf4VLsuXbE5B+hETyNoCE2gHDTz18=
X-Google-Smtp-Source: AMsMyM7c5f+cjOj3N9ihSd58BFyCKQyv0glawxGbyVb5sVylFSHT6SO7VJBGNOiG3CVvcigQG6qmvg==
X-Received: by 2002:a17:902:7598:b0:178:3f96:4ffc with SMTP id j24-20020a170902759800b001783f964ffcmr32182287pll.53.1664355558082;
        Wed, 28 Sep 2022 01:59:18 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id g4-20020a170902d1c400b00176ad86b213sm3035832plb.259.2022.09.28.01.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 01:59:17 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 1/1] leds: pca955x: fix return value checking of smbus block read
Date: Wed, 28 Sep 2022 16:57:01 +0800
Message-Id: <20220928085701.1822967-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 28 Sep 2022 21:52:36 +1000
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
Cc: Potin Lai <potin.lai.pt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In i2c_smbus_read_i2c_block_data(), it returns negtive value for error
code, otherwise returns data length of reading.
Change the if statement to "if (err < 0)" to indicate the real error
returned by i2c_smbus_read_i2c_block_data().

LORE Link: https://lore.kernel.org/all/20220928084709.1822312-1-potin.lai.pt@gmail.com/

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 drivers/leds/leds-pca955x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index cf0a9fe20086a..cba9876b11872 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -689,7 +689,7 @@ static int pca955x_probe(struct i2c_client *client)
 	err = i2c_smbus_read_i2c_block_data(client,
 					    0x10 | (pca955x_num_input_regs(chip->bits) + 4), nls,
 					    ls1);
-	if (err)
+	if (err < 0)
 		return err;
 
 	for (i = 0; i < nls; ++i)
-- 
2.31.1

