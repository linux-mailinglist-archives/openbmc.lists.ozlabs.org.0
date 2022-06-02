Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C8F53B1D5
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 04:51:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LD9WK2B5lz3bm9
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 12:51:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KhiZJ3Bc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KhiZJ3Bc;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LD9Vw4BWMz2x9p
	for <openbmc@lists.ozlabs.org>; Thu,  2 Jun 2022 12:50:46 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id gc3-20020a17090b310300b001e33092c737so3695646pjb.3
        for <openbmc@lists.ozlabs.org>; Wed, 01 Jun 2022 19:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=svpEp9OJ9fzAKGwvxYUywKOxZ7ajEwoHxddGOf+QtKc=;
        b=KhiZJ3Bcu5AYKJ6EayL+6m1IkAzYcRBAQ7b2i62RW7GYBdTYeYVuwFHQ8W8OVlKi8k
         FDaWnuVlQS3W3QPhre19utTa+7kWNc8EyS1kiszgKNFLvzNmsIaHHr0TKTpDd/aIogNO
         lcNzvg3vEwND++/OjLfYqdis9zNnMwDc7xyb3Gp/8/ZhRL0wjOTgx/C7F7sgGuyRhNRR
         A1XKzgngyv+emGpZ8r8BvrL7RfFT7iiLMcFtoiStUIhCcHTe3UBiSY9DmWR9M+e5UuMW
         Zy33HYgUVkJK9i5YKtVV9zUaEpqZ2VCQAS2RVrRAL5lrffMJ826TV0Y9clnch91LQohT
         o95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=svpEp9OJ9fzAKGwvxYUywKOxZ7ajEwoHxddGOf+QtKc=;
        b=6jrpYe3+r/q5+EqmuKW0b9nXi1dTVeTFKU52UGuGaL7Lw99lKL96tNoFk3RdTatfrY
         giCtHIcSAxSb0LKmvAcffjh/RSd9fhorX6b1ciW10pL9Aj/aEF81q80EH1EtpMdxkQZ9
         2DIQvQFnwiSif8Ph9vo/srZ3uOkr42g8GkiSiWrUnUTtFDrr5XCazz5VpjXW7w00qpgY
         5IYPiSrLKLrxd0jWoiDQUTgBmDXeXsbUtQPhyaLY3PnP0soGDiOYZbkMuZ4p97yjD0Ny
         xQoOyI4eS7058GdjwMZ9aqcDTZYiJbobdzShjNvZUlT+HmYN5mtE68Is4CQ7qZsET7xn
         bS6A==
X-Gm-Message-State: AOAM531K+gPlpd7yCp88WJ48+a3pzXL7g/ab2Hghwa7MG3WMfMzmsMSi
	arlDUUIjgx2Z5AZC4/lF2iDoC1YOsYc=
X-Google-Smtp-Source: ABdhPJzuNmbj0N8SpH6iDOAc4DrmLxhB77gtNF0VdD2jgphiTDvwnTb4dAbmU10QPjPWlyvzubdMew==
X-Received: by 2002:a17:90a:1544:b0:1e0:66c5:4080 with SMTP id y4-20020a17090a154400b001e066c54080mr37719708pja.141.1654138241224;
        Wed, 01 Jun 2022 19:50:41 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090a740c00b001e2b19e6cfesm4656850pjg.12.2022.06.01.19.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 19:50:40 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	eajames@linux.ibm.com
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: Rename Rainier to P10 BMC
Date: Thu,  2 Jun 2022 12:20:29 +0930
Message-Id: <20220602025030.90710-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Rainier device tree is used for all IBM P10 BMCs, which includes
both Rainier and Everest.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/dts/Makefile                                    | 2 +-
 arch/arm/dts/{ast2600-rainier.dts => ast2600-p10bmc.dts} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename arch/arm/dts/{ast2600-rainier.dts => ast2600-p10bmc.dts} (93%)

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 3515100c65ce..8d05d1e70310 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -686,7 +686,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-intel.dtb \
 	ast2600-ncsi.dtb \
 	ast2600-pfr.dtb \
-	ast2600-rainier.dtb \
+	ast2600-p10bmc.dtb \
 	ast2600-s6q.dtb \
 	ast2600-slt.dtb \
 	ast2600-tacoma.dtb
diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-p10bmc.dts
similarity index 93%
rename from arch/arm/dts/ast2600-rainier.dts
rename to arch/arm/dts/ast2600-p10bmc.dts
index aa91b12ed399..d1d78d5c3545 100755
--- a/arch/arm/dts/ast2600-rainier.dts
+++ b/arch/arm/dts/ast2600-p10bmc.dts
@@ -5,8 +5,8 @@
 #include "ast2600-u-boot.dtsi"
 
 / {
-        model = "Rainier";
-        compatible = "ibm,rainier-bmc", "aspeed,ast2600";
+        model = "IBM P10 BMC";
+        compatible = "ibm,everest-bmc", "ibm,rainier-bmc", "ibm,p10bmc", "aspeed,ast2600";
 
 	memory {
 		device_type = "memory";
-- 
2.35.1

