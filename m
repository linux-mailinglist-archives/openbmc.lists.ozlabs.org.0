Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 084F75BC399
	for <lists+openbmc@lfdr.de>; Mon, 19 Sep 2022 09:45:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWGtv51G1z3bWM
	for <lists+openbmc@lfdr.de>; Mon, 19 Sep 2022 17:45:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ejrsy+9l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=pbrobinson@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ejrsy+9l;
	dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTXH91kBfz30Qc;
	Fri, 16 Sep 2022 21:42:11 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id b5so35568137wrr.5;
        Fri, 16 Sep 2022 04:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=fbzru9oHx+TSiEWcFp9fwWwozXKgV6W0npBCadl+J1g=;
        b=Ejrsy+9lIaUA+qm8DjWAbq3S2+Q9a1WDr96qLnv8boxXDLxt7EIyP+16PJJVOZhxQW
         X6/90B8plL4Eb5W5tn64iJHBmeVlAALlXZvSPI4r+2QuaUh8BhU5pNc1ro07vM2kcMZq
         2I9BfRj4B+Kbum1PrfjkQCi1FxOXkOOKlV0tcOlpOGAnu9084a2D4IoIzKPeYWAiARx4
         Gf2PPLZ1eVG7IuCqKxy4hXLI2WUbH5K6r70lSa5jO9MGjRwtqwOqvN1jxOLAIP/6b80+
         41x9sOiaO++6DbfDl3obVOIN/ZjaQOixbahSQTLy2AiKfKcLFyCqqo6DopKBRzGp06ES
         zkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=fbzru9oHx+TSiEWcFp9fwWwozXKgV6W0npBCadl+J1g=;
        b=5hK9/3ZthY/niFq0WxU3Jtr1z7u72tW5Uxq4KBCYcosf8HXbuDpnN2j27uZ6eTBPf2
         rALjGubiMMHz0dzap5nyQmSv+ytBebchopVbA0/C6Lf4l6tHchsiXFUzJY4qMV6Nemet
         BsaDoCy2RJn5BGnzz53lndN3QMxKWHABpHoGO7JO+1tzeYUvW2L4jsCQp13HlTu7xucb
         YA5JIScHMg8OUPAJL8G+gMtpAf5MVSKeIR7lDX07Pp5BK7K9p2QwkDjzZo6KG4k8l0HU
         u64PaXPcwHK2ZAtXdOX8eE87QtydLeUTYKAXJq0C8u3ebSnwu4GIQiNLqubPV1zFsJu/
         4/dg==
X-Gm-Message-State: ACrzQf1WV+PWSuO/B4sjqd/BHyWICSO0N0XZ/3+PYpv42VlcJ3VIRO6c
	ms+15c7blHUo8dgJvqN8gHw=
X-Google-Smtp-Source: AMsMyM6UknjgktM0D2TTi3h6bBytobpcf5izrZirHXjgyjHzRW07O+0m+lmv7ERYSUYwIFmxFi5XiA==
X-Received: by 2002:a5d:6808:0:b0:22a:c437:5b36 with SMTP id w8-20020a5d6808000000b0022ac4375b36mr2581813wru.459.1663328522170;
        Fri, 16 Sep 2022 04:42:02 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id a2-20020a05600c348200b003b492b30822sm1987864wmq.2.2022.09.16.04.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 04:42:00 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH] Add dependency on ARCH_ASPEED
Date: Fri, 16 Sep 2022 12:41:57 +0100
Message-Id: <20220916114157.367094-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 19 Sep 2022 17:45:24 +1000
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
Cc: Peter Robinson <pbrobinson@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The VIDEO_ASPEED is part of the Aspeed silicon so it makes
sense to depend on ARCH_ASPEED and for compile testing.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/media/platform/aspeed/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/aspeed/Kconfig b/drivers/media/platform/aspeed/Kconfig
index c871eda33570..16c5d8913488 100644
--- a/drivers/media/platform/aspeed/Kconfig
+++ b/drivers/media/platform/aspeed/Kconfig
@@ -4,6 +4,7 @@ comment "Aspeed media platform drivers"
 
 config VIDEO_ASPEED
 	tristate "Aspeed AST2400 and AST2500 Video Engine driver"
+	depends on ARCH_ASPEED || COMPILE_TEST
 	depends on V4L_PLATFORM_DRIVERS
 	depends on VIDEO_DEV
 	select VIDEOBUF2_DMA_CONTIG
-- 
2.37.3

