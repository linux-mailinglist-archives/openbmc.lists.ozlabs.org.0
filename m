Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC32F53F263
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 01:09:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LH8MQ416Xz3bm0
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 09:09:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KfDgSe8D;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KfDgSe8D;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LH8M03wnpz305C
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2022 09:09:16 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id cx11so14076481pjb.1
        for <openbmc@lists.ozlabs.org>; Mon, 06 Jun 2022 16:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NPzrkZ5h0iNTAugxZdPztH5rN6hVIN9xKk0iZJn9D98=;
        b=KfDgSe8DS7BZccWrZlU3P7lpB2v7p+yvPY5vk4OhCkY/pigY1H7kjCliTlhxzwgOE5
         dbHH26mF0ccmHBPy8FJNcWoA4KkfNHIsZyUMNdpE99+zRYGTvMD19zH3u3VqWRDRGN8h
         oq2CIUb/w33LdXHr8xTvDurAgTtbVaGPXA4ABh2jylgDIUi4ITgD0UFIb9hjoPrwZ24/
         KtwsrdkQ28S1asNwJeO8CLmb6KfZi/LAf/faWx38ySvpb9GWEVc9Dop+bt/kLk9W+KY0
         0cJQi9ZJP59ZAT0J/dsHzijUbZYaG9gaVfpUP93BPjA21gq/+Ya9qOp5Xg0kvuKKcy5S
         E/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=NPzrkZ5h0iNTAugxZdPztH5rN6hVIN9xKk0iZJn9D98=;
        b=TSxN3nQoueaQW611VW0j82qSgaYlpBJIh4Nil2q225CO3r1GnA4wV/SNLP03lL2719
         3ZdEHtVuUoWikvAK/UXFZ69C5sIrKopboob4ya0AEDaSBeFGKKfCiNIyIH5L1HNAmZ7p
         ER7ZvdwibLyu+aDeAl5w1fiu53ApZi54NTvTZht+RbZa8RX0t4IxsEEa/I4m5khrgjPt
         MuYesg7WPgldTrzJm1CWsiuCctezHHOhxBlhkiwObm3k5+HNRTw3q+u9pgMrRRnrHF7E
         7t4vedWqiiG8uS4AWeY7dUQ9q1EBGdRKSyhWRMJETXW5hfEfSoMM3u02orAir15CCU1f
         PkXA==
X-Gm-Message-State: AOAM533SNnxI88gscukLQHQlWVi1qE0xNssefFxQX+0WT3+Qc2ncLfpH
	zyJzUxfZAMm7kTKJOgJO+UuSYt1c6CE=
X-Google-Smtp-Source: ABdhPJz+OOa8dUlmzq2O0de2SG8oPYs8bSMVSNCU4B1kgA+rmj00GlM4wuuZjGfqx7iFkWLvekvcng==
X-Received: by 2002:a17:902:a413:b0:156:15b:524a with SMTP id p19-20020a170902a41300b00156015b524amr26266165plq.106.1654556954090;
        Mon, 06 Jun 2022 16:09:14 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id jc20-20020a17090325d400b0015e8d4eb20dsm10926972plb.87.2022.06.06.16.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 16:09:13 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	eajames@linux.ibm.com,
	Zev Weiss <zweiss@equinix.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3 1/2] ARM: dts: Rename Rainier to P10 BMC
Date: Tue,  7 Jun 2022 08:39:00 +0930
Message-Id: <20220606230901.1641522-2-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220606230901.1641522-1-joel@jms.id.au>
References: <20220606230901.1641522-1-joel@jms.id.au>
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

Reviewed-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Zev Weiss <zweiss@equinix.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
--
v3: Add r-b
v2: Preserve sort order in makefile

 arch/arm/dts/Makefile                                    | 2 +-
 arch/arm/dts/{ast2600-rainier.dts => ast2600-p10bmc.dts} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename arch/arm/dts/{ast2600-rainier.dts => ast2600-p10bmc.dts} (93%)

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 3515100c65ce..8f876a0aa0d7 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -685,8 +685,8 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-fpga.dtb \
 	ast2600-intel.dtb \
 	ast2600-ncsi.dtb \
+	ast2600-p10bmc.dtb \
 	ast2600-pfr.dtb \
-	ast2600-rainier.dtb \
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

