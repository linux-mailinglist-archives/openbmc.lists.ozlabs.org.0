Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5778953DF0B
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 02:05:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGYfg22c5z3bkq
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 10:05:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KhlTeqCo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KhlTeqCo;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGYdb164gz2xRm
	for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2022 10:04:50 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id l7-20020a17090aaa8700b001dd1a5b9965so11268841pjq.2
        for <openbmc@lists.ozlabs.org>; Sun, 05 Jun 2022 17:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W48D9TGWcuibxUYJS3k55BikrxdX7N6O2sKcjyhSCro=;
        b=KhlTeqCoSg6f8P5FV002snkzbUW9Zfhg5OunC+yRncV0l48/jZOTmJwHR3vbLh7VtF
         ukT7+uC5udHZIaFKZ4gWt9yla4cuVQwkarKOTLfmcyEyluzbgpF0i3fbfyisS3ctfjhk
         Uaey3lT92N14eRh+IdfGcjuLdQHktdpXk8A5qsxC7+PtehL2zcP6sHE5/mjWz8FO5YMC
         eUJoWBvkPLBMo05HIice6AdBXVt4iw4aQb5m/riGl/PnbKNOlTr/r5xBOO/QI2HB6HwG
         bOhM8fxeIGuzUdALHNhSsjzBvcPct1hR73JFaogYjNPk35dARWC0AP+I8DqpkAsSARff
         S+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=W48D9TGWcuibxUYJS3k55BikrxdX7N6O2sKcjyhSCro=;
        b=ybI+9Nhkcc/nAwLSlPNzi+ORRLR2KHMMjsQ8V+zi9DPyc1hpdP/g3fTDbqbDg4sCfm
         2R4WgzN8kMV0cVSHWukpplCa9B1h7uHFKz+zk2JS8A0flPIc85w5hA16VdnK7qzW/E55
         EmKn/DSNDk5qWHoCSi9REaqmUOctxkTHS1Ioi8Y6hTOSOH07GKHGJcmwgw58o8mBGwR6
         iAhLVi9Um6/VQBxyF40CY35k3+pVJ2EEg2y1XPxCuOKhHTD9lcnHaVYOSLlpD/E7Dmwj
         Ol446P8O7WXQZ7qs8yqyEMm/7lL/cwQVFyKdmOm5X/N3f5go2T2FYei5Y430oIeRENSB
         JJRQ==
X-Gm-Message-State: AOAM532g8JB/cpG8SBjbbKlaXnPyDGaNLi2GWFJCDGNTOE9ecEr+XIxi
	o7ScsZA3Gacgou7LlUb5fS0=
X-Google-Smtp-Source: ABdhPJzTOmDT/8xu4mSiBKFn/5Kz1gahqLvnBsx7z3MHHQ+dMPErWIcxWHT5gokAGFx8YWuxk2lMRQ==
X-Received: by 2002:a17:903:2308:b0:167:6bfe:a800 with SMTP id d8-20020a170903230800b001676bfea800mr7284222plh.100.1654473888881;
        Sun, 05 Jun 2022 17:04:48 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id g19-20020a170902869300b00163b65c9de2sm9187402plo.170.2022.06.05.17.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 17:04:48 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: zweiss@equinix.com,
	eajames@linux.ibm.com,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 1/2] ARM: dts: Rename Rainier to P10 BMC
Date: Mon,  6 Jun 2022 09:34:33 +0930
Message-Id: <20220606000434.1399583-2-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220606000434.1399583-1-joel@jms.id.au>
References: <20220606000434.1399583-1-joel@jms.id.au>
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
--
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

