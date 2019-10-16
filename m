Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6317CD9053
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 14:04:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tWDz6scDzDqjc
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 23:04:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dAbf0jrR"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tW7F2rqtzDqkx
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 22:59:37 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id b128so14607937pfa.1
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 04:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fz65Ne1eFaQ+YuX+GptH7hyzITn/NoEeYZJ9OM5qHVk=;
 b=dAbf0jrReLnSM+U4xc0XiBs5ZapSnJrc67Ea2TmluQuAAus+o7nw5k9L8f64CizcFq
 h951+3zH2rtg0fn3VgUNJFyoHbjSh87sC76mdpdWmJNsM/g7SeVLP0CUGlcmhDs6VWxo
 9RhNjVjdDxB9MGZ6Gs3qwhNaKEcvh3bnHRYsOhDvG7CY8bHrQYVmP9cNW2yxEzes7GFM
 L9n9VzPH19kLYgvDvvc+1AmgIq43Be0RZigLaNq5eOAoq7Okxe/oz1ZlgNnh0OFVfEaf
 Ehs7cfRy4wavLrSEsLr9/Z5e9nbtW9LRlPl+fk1a/hCob4Kr1c5DUg7yIq+bAP2cblxt
 Ef6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Fz65Ne1eFaQ+YuX+GptH7hyzITn/NoEeYZJ9OM5qHVk=;
 b=KxaxDwSJI+TS3oXHSRA5H5+pIRR0+2qyzixqnB512uHWBvOuzDHqAFtJ0hBO3bwrnh
 bWsmlzVRidmV2zsoHTzp1EiKAqitc8zqstwt2nvYVf6OPo1vdvtpCMJRsktONoBAEw1p
 Zccj/KTv/nb5525uFLaMZo2GWPBf7PkT2fp1IbV7CaMF4UOnWZQpp+xvZYhwBX8xSzpP
 1VRu0UzAX6lgV6CuCJCgwUIYCTvxgK+fsRxheZZBD13vTkUSeZiDNuywotGszlwbTowx
 ldw5tdOUOj9k5RJUudQi12OU2KMqUbxtKXZ2pHDOs0EWUO/BeoXba6nWF2BUG0TS29iu
 QKoQ==
X-Gm-Message-State: APjAAAX29Vv6UBhs0fp4yJTPfUlVuZ72SCufNnLjfywFAsmm4CP0rXGK
 ssFaSLcxVJU/yvw7KrjhOjjYdIr35mA=
X-Google-Smtp-Source: APXvYqzxtyKPd+MNKR84mX/GQSNoSbhqp68ke/tHZc/9wY+qXoYDems4Rmlx5gKhN0i1gf0r81KwJA==
X-Received: by 2002:a63:5406:: with SMTP id i6mr21934599pgb.1.1571227174009;
 Wed, 16 Oct 2019 04:59:34 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id d19sm2561396pjz.5.2019.10.16.04.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 04:59:33 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 3/3] ARM: dts: ast2600evb: Enable UART workaround
Date: Wed, 16 Oct 2019 22:29:03 +1030
Message-Id: <20191016115903.24663-4-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016115903.24663-1-joel@jms.id.au>
References: <20191016115903.24663-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The UART has an issue on A0 that can be worked around by using the
Synopsis driver.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-ast2600-evb.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
index 0392e9162f11..94fe2611fe76 100644
--- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
@@ -151,3 +151,8 @@
 		spi-max-frequency = <100000000>;
 	};
 };
+
+&uart5 {
+	// Workaround for A0
+	compatible = "snps,dw-apb-uart";
+};
-- 
2.23.0

