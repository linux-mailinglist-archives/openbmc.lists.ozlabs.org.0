Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E23F5BF5B9
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 06:57:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXR3S0fl3z3bsS
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 14:57:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MzxYBmDq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MzxYBmDq;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXR0g3dwLz3bn4
	for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 14:54:43 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id j6-20020a17090a694600b00200bba67dadso4561265pjm.5
        for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 21:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date;
        bh=AY0RzY10y1OGt5m5StyWLXc9yD/FOK9WyioxL1jPrcA=;
        b=MzxYBmDq0I7vgf3IRIE/tfIUNR/CYoEgZpLeGHYUpNqOtYlMpvGIqy9zO9kF+9V28F
         GoEiDOqfufSwCJlZJxcGudznss4kP98tN3Y5Jr8r0scqiXfEK/m8OuHgxbmWweGmH58C
         ZYDYGiB90mcDdzrBjnSEX61hT41FHdEhyH+gNIxBSF8lTx6PC1JUhgew+u/XzjkHGKkx
         d6WnAKigW9JsB2AvGQvraOkr7is7WHgnxa3I70xqnlMqLZNcdF/+ZBMnASsoznZ7uRa3
         asoW+W6ZbF+hJyP/96DzLhNRrE5uiXzqeSXbro8J+vvs6srFEbK+utdNPIlI13NAsPyX
         DiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date;
        bh=AY0RzY10y1OGt5m5StyWLXc9yD/FOK9WyioxL1jPrcA=;
        b=gKpnnsSIjd6EKWchU9WSP0GTQUtsl0qwnTOeIkCIuuzsO/fuDuHLvUWbMnmz8ARsJv
         DAC2PzfSKm2oZIFpVuMcsATPXCY42lUu9AkuIPwQx8w2aW0WcY562nBp37BATNwEVmbk
         xt/9plv2R8sYTol1oWXjtLe9sTUjoucAVlHMgaNqrAiS0JbtMv8dvWQjKF9RSJ2CrmMt
         67+jruDMWHesIIhaTKbLnh89D16+h/BwNMMtF1TGrxH8ZxPrTsISvl6jS/3MzrGOokIx
         kpE1gaz7X3qfZf6keuiNhx8J56MgPINU1jr/dIsuhmMli8uF3dakI4yC3hKY/uyZB03l
         LBSQ==
X-Gm-Message-State: ACrzQf3BHqsBofZCwNG6bz8ZIXy79dtuMuUeKoMFHLLvvqMkyhv4mILx
	PEoeTomYJGdMje2A4Vdw9JJu3NVqjFY=
X-Google-Smtp-Source: AMsMyM68l1s3CvmMDzz9OYIywT/Ea1ud3ycnqTIwofmnRpf/bhIbCE7pHMEg3dOnadSfJTwcr2t6Mg==
X-Received: by 2002:a17:902:da82:b0:178:38ee:70b with SMTP id j2-20020a170902da8200b0017838ee070bmr2964142plx.85.1663736080579;
        Tue, 20 Sep 2022 21:54:40 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902d2c800b00174d9bbeda4sm819918plc.197.2022.09.20.21.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 21:54:39 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 3/3] ARM: dts: aspeed: p10bmc: Enable ECC
Date: Wed, 21 Sep 2022 14:24:20 +0930
Message-Id: <20220921045420.2116037-4-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921045420.2116037-1-joel@jms.id.au>
References: <20220921045420.2116037-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Enable ECC to cover the entire DRAM by not setting the size property.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/dts/ast2600-p10bmc.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/dts/ast2600-p10bmc.dts b/arch/arm/dts/ast2600-p10bmc.dts
index 23e3bd8ecfbd..1d0f88bf9628 100755
--- a/arch/arm/dts/ast2600-p10bmc.dts
+++ b/arch/arm/dts/ast2600-p10bmc.dts
@@ -41,6 +41,7 @@
 
 &sdrammc {
 	clock-frequency = <400000000>;
+	aspeed,ecc-enabled;
 };
 
 &wdt2 {
-- 
2.35.1

