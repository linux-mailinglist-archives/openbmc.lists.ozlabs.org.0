Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C8A5F364A
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 21:29:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mh9rg1y3Wz3bjF
	for <lists+openbmc@lfdr.de>; Tue,  4 Oct 2022 06:29:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NUqITyaN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=aladyshev22@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NUqITyaN;
	dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mh9r55t9nz3bXG
	for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2022 06:29:09 +1100 (AEDT)
Received: by mail-lj1-x233.google.com with SMTP id a10so12991810ljq.0
        for <openbmc@lists.ozlabs.org>; Mon, 03 Oct 2022 12:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4M75LCnR7HEj9mQ8XBusERBnMSMu8fybz1DwQ5l1ydQ=;
        b=NUqITyaND1kSsQpRYi/A3gAqa0ZiZX4eanBrTzucnVIx1QAmsAjukK+PhNB+GuGehy
         lVTYAf0KLmbMxQqz0Jg9FLK6vq78IinN/Y50gGc73EAEgKkTsDeqnLvXBbkWIY/mLF/f
         HT5/itqzsKOZF4O80QK8+/UNS3L4A6T68dr5om3O6DQLIdabWYfoe0/NwwIYURNMvqP8
         QdSwDl5Y4z8uQm984ihuze58kg49TgZNL1ev6RSTtytYi68CCBwu7meJd3F8nK2+/jJp
         c/ND/Q+aj66mYgTBQeRLmfpVaQ/TVrNr5D9IHWuL7YzE/+TVym9J/qHUcTWrB3E6OMYg
         cMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4M75LCnR7HEj9mQ8XBusERBnMSMu8fybz1DwQ5l1ydQ=;
        b=asgHwIxNo6wxmD3pJ1JNB+AAnDmR+aodF4IS2hWcOyt8MTahcamtCGWqUvezWd7zIP
         YY3xLJZQU15gc1xx1ecZAWBVl30E+e8eLGo9yaUhQJaeMeMvO42B+PhHEIPzOeGjDXb2
         1+48nQALE3W0Rh6VTfQs8gXZA6ZGTUzWKpBinGDClR6+4cYB1CvsXGXBRJvfcRukQpHZ
         cfMi8O2ufBTkG+DBAISJfQ68aYV9D+Fssj9rEy9AGjnSihaYOiVXaQoc8RTSRXQ5MRLf
         Rrl9X823HRuKgNwvT/n3DaWf9mEMPcNnX1/9BmVzGGBpHkJmf+pCx2Nb5npP98/W+jiX
         0NtQ==
X-Gm-Message-State: ACrzQf1SOy/fndfZLwFz+2n9PbzXjXHbRs0uzheQC7ZdkUUzBUQs+Fzu
	hZ9q86qKp9bcM7bkG9+8cLo=
X-Google-Smtp-Source: AMsMyM7C4Qplhcbd6+wkTtj8HAyy/qZfc94OTg/fZjxdC0qCGJng7ItXOn0tKmeZFLZ2wVkNcuQ/5Q==
X-Received: by 2002:a2e:b61c:0:b0:26c:c17:feeb with SMTP id r28-20020a2eb61c000000b0026c0c17feebmr7313411ljn.199.1664825345341;
        Mon, 03 Oct 2022 12:29:05 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain (broadband-46-242-10-176.ip.moscow.rt.ru. [46.242.10.176])
        by smtp.gmail.com with ESMTPSA id j2-20020a056512398200b0048ad4c718f3sm1574195lfu.30.2022.10.03.12.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 12:29:05 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 1/2] dt-bindings: arm: aspeed: document AMD DaytonaX
Date: Mon,  3 Oct 2022 22:28:50 +0300
Message-Id: <20221003192851.3604-2-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221003192851.3604-1-aladyshev22@gmail.com>
References: <20221003192851.3604-1-aladyshev22@gmail.com>
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
Cc: Konstantin Aladyshev <aladyshev22@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document AMD DaytonaX board compatible.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 1895ce9de461..cb9bc65df82a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -29,6 +29,7 @@ properties:
       - description: AST2500 based boards
         items:
           - enum:
+              - amd,daytonax-bmc
               - amd,ethanolx-bmc
               - ampere,mtjade-bmc
               - aspeed,ast2500-evb
-- 
2.25.1

