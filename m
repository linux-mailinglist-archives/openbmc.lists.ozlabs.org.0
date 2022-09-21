Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A640D5BF81C
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 09:47:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXVqb2m4sz3blj
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 17:47:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qp/6cE9g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qp/6cE9g;
	dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXVnC37clz3c1S
	for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 17:45:02 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id y136so5127955pfb.3
        for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 00:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date;
        bh=1UaDpeRWXyJ3E6I93XQ4VviyBGFXYAio3KhsP79XAqk=;
        b=qp/6cE9ggwj461Rwbi+VlNdrZ47WZyrd5mSMXSLMsO7PKMTwurHyn6KXSCykU5Ac/W
         iamKbioseYvuPYPoxAT2HirB+/K9aysNUDo1Yy2n9/0yEy46DSwrHRoWJm4M+Gn2KnMI
         PRhxC6E9SrnXB1FzPUJstaqTrrXJOhe5MRatfBY20/fiq9uEf9s+f7t2jZu+6Z5dHcUf
         aOhdooJjn00P4CDEzmRQ0G70X6KnKII12dngzL9YAJwvPve42f9vZcHIuL3CcDcXEp+t
         fVH+G6xoMpjQOIAVxjt0G5v5D98ceoU6aHUSgopLuv3Y5dI8zBs0jIvEwc74Duq7eNAv
         hOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date;
        bh=1UaDpeRWXyJ3E6I93XQ4VviyBGFXYAio3KhsP79XAqk=;
        b=xWNw7c55EuVpheW3Eu9xcQbPYkLZ5EmbpF7WHiEfCVhbnRqjPZLHV4FA+QPTK99g58
         s3qKDPPEadk8cyIdYPDYQ8R2wryC2Payj2uyM9LAnnX70sp2o682RYYAjyS/fl6aOzVN
         Df6Y5i5JTxqdLy9wlU5Mw/lYuKnEfEytjdmrwn1iLbGCehZ82dOryEluDqZRzjULofVa
         Px+km3yM3JDID2iQbTJF19yL2XzHvlUopAghIMxlMOVlCKun5xpipqj8DVtBYa2LZkqa
         I9x0auF+KtEssE1GJFPpl5ibDJckMC8jZI1iAhINkp2vwMNXKO7RTllRp+zBb5HXes8e
         UfVg==
X-Gm-Message-State: ACrzQf132lCGJ/gPY1hWjLGdSLP+pGhbVcbcbQTy39FBwl8PpZTeo6LW
	ce6fr0y0PXdMqUYm5h3cwYZmipsz71Y=
X-Google-Smtp-Source: AMsMyM4vXZa8eX+PRupOHt15S+hEnR+SgBxyG3EggjJgFsl48Yccvv54GETSk8HdYzY4+H6YAKp7qg==
X-Received: by 2002:a63:3110:0:b0:438:e26c:167f with SMTP id x16-20020a633110000000b00438e26c167fmr24098488pgx.134.1663746299851;
        Wed, 21 Sep 2022 00:44:59 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090a121600b001f22647cb56sm1192339pja.27.2022.09.21.00.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 00:44:59 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3 3/4] ARM: dts: aspeed: p10bmc: Enable ECC
Date: Wed, 21 Sep 2022 17:14:38 +0930
Message-Id: <20220921074439.2265651-4-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921074439.2265651-1-joel@jms.id.au>
References: <20220921074439.2265651-1-joel@jms.id.au>
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

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
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

