Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBC75095D5
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 06:25:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkPb91VpFz3bYS
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 14:25:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=NaXI4NWG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::62c;
 helo=mail-ej1-x62c.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=NaXI4NWG; dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjxdN0D58z2xtQ
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 20:25:25 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id g13so2577655ejb.4
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 03:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f8y5RbOs8H7F2HjOM2zONT8m7MLIJsoqLnBg3QwYmzc=;
 b=NaXI4NWGrhiaSZPsX9L7I/L8mkq5k5RDkakZZBnFEniMzeO5L7LSh5KALay2VGC2FY
 feSzwQprwBI6EfT7uLc6UnzKqrro2Q2flfTrI1YtuZwOQdUmOkjQJu3ZkfaKwl1UfV8C
 PR0Q0pYlbpiWsfqpd7IwuBT3Fa5ULpVn2hp+DwyNrsJ5z1QIdf4sS1NQynoXueBLnZmD
 36NpNiQe5OINdp9GbTFHvO1/oa3NqWYXsR0zbfmvLVuYv/TEfuf8HjL6fqkGMrUeiCbt
 ue4qk6RVhNuNTzUpBw4ylREIGh44uGGwqAhdtm+C79DPj1OHF23+dzOZtpDBZZUks2pg
 WybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f8y5RbOs8H7F2HjOM2zONT8m7MLIJsoqLnBg3QwYmzc=;
 b=KCpAVf7G38bfSmjTHEN6A/VgXokVDQltQQCCcU+GxBM2P4IyQeyg5erB0xRlkgeDmB
 zeJMQnnspGiLD0kuR/qLncoxgUemxSKT5AcVNOCHGxaRJlgfkDrsT0IGw/Q510A0CuLz
 EJuQm8MtEMtSe7G73eYm3IAjPAIBlc+/t0cM01Yy9+L8U1+l4fHGrV3K+4U3pIbYnU5W
 j5H8fyytMR1nb6g/ZYVDyT71/vOrZ7l5ZCbBv0VP+VUhk6Bf65g5Xe5C4oxCydaBjWwX
 7Q5Hfom4+aQ8VrJsdAH3J8RzAnlh+aNTwJLPpg3o7cOoW3WgvZGy6LWU+jWzLjqJSlhh
 G2eA==
X-Gm-Message-State: AOAM530NvybEFpH64uIHnJ2SSefCQViM+uVrgwGTIktafKc7RxJQPYWA
 QFu9iv3G1KPICdJ4T64l9Upb6Q==
X-Google-Smtp-Source: ABdhPJw4HBiCv5jc9RZFEzhQSRu2/7fUwqI3yxDEv6TxqqElsdKJ+QawX3racoyPOOKEVq02C0K2GA==
X-Received: by 2002:a17:907:8a02:b0:6ef:ee27:f9e1 with SMTP id
 sc2-20020a1709078a0200b006efee27f9e1mr5406848ejc.97.1650450321788; 
 Wed, 20 Apr 2022 03:25:21 -0700 (PDT)
Received: from fedora.sec.9e.network
 (ip-005-146-070-114.um05.pools.vodafone-ip.de. [5.146.70.114])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a056402020c00b00422e7556951sm7431346edv.87.2022.04.20.03.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 03:25:21 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 2/4] arm/mach-aspeed: Add
 support for CONFIG_DRAM_UART_TO_UART1
Date: Wed, 20 Apr 2022 12:25:00 +0200
Message-Id: <20220420102502.1791566-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420102502.1791566-1-patrick.rudolph@9elements.com>
References: <20220420102502.1791566-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 21 Apr 2022 14:24:52 +1000
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
Cc: christian.walter@9elements.com, takken@us.ibm.com,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Update the Kconfig and allow a board to use CONFIG_DRAM_UART_TO_UART1.
This is required on IBM/Genesis3 as it uses RDX1/TDX1 as debug uart.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 arch/arm/mach-aspeed/ast2500/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/mach-aspeed/ast2500/Kconfig b/arch/arm/mach-aspeed/ast2500/Kconfig
index 81c4fd0c2f..232117b43c 100644
--- a/arch/arm/mach-aspeed/ast2500/Kconfig
+++ b/arch/arm/mach-aspeed/ast2500/Kconfig
@@ -27,6 +27,12 @@ config TARGET_IBM_GENESIS3
 
 endchoice
 
+config DRAM_UART_TO_UART1
+	bool
+	prompt "Route debug UART to UART1"
+	help
+	  Route debug UART to TXD1/RXD1 pins.
+
 source "board/aspeed/evb_ast2500/Kconfig"
 source "board/ibm/genesis3/Kconfig"
 
-- 
2.35.1

