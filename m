Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE1E91DD23
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2024 12:54:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QVFtEgLo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCNGJ1TyWz3fSl
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2024 20:54:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QVFtEgLo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com; envelope-from=liuxiwei1013@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCNDl0F5jz3fSH;
	Mon,  1 Jul 2024 20:53:10 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-1faad409ca7so24318035ad.1;
        Mon, 01 Jul 2024 03:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719831187; x=1720435987; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0qY0eq/bCYTLQqVWP+SkvvD807zfIcKNdRibSQIaU4=;
        b=QVFtEgLojWx0zl3TKGYPN2/rDAx6mAtZzUikyFCIle5j40yHlPvWFpvoiLOuHl4EJQ
         LNZe3vKToX4MG/EyUgxcpCwolNYKD7oDzUrnRmO8kfLKwlAYwA2sp3wrsEYOFolSHu0u
         Aa7aa655OR5CXfNkF7INpHeAnqsQVNyr5fwSd1tD5/uNKzlt5JErhOJ8hmeRVzb91jlo
         0GeMy3hErvaMxK3/rIGwzfssbpVZ6wGnQZPrlA0MZI+//SmCKrNsfBniwYlPj1Ps3Qzk
         7TopeEwLmmoBR4el96IoOWG2McbHTQCBJi+/WYCyifgval55gzRnoiJp8JNT6hGpdJbb
         Wvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831187; x=1720435987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0qY0eq/bCYTLQqVWP+SkvvD807zfIcKNdRibSQIaU4=;
        b=huawlJZf4tDXohWLAOMz6a346+8MmXxH7uaPBkUg/XDd8BLtXoOMa5Bwxi78yFOwtb
         UNpEsOn56lH4AwE9CkGYFgzPzztSE/p4U+6WLg1wljCcQYIcrZXOdOleVlOy+TiVdD7I
         Ko94zZDSL6t+mva3Td9K0QwDVMrT0cZK6XDOkHZ9pgKo/6oyrPkqJl2k4VwdWJVeNn8K
         ennWpT+GbIfoq2nD7TWmJ9d+z58YISTzST5U4IC3QeXOS8T17KjR1COUcrBmPWZHprHQ
         mlcge0DbTpKAxJrqXh5nu/5UK9QOuM07OywPWAnq11b3cDyEOWp0YS1l4roUTwf6dRZf
         Efwg==
X-Forwarded-Encrypted: i=1; AJvYcCUtOEVpFlqa6U/7NAJ7zFu4DB4lH4/VixPHJcSUEI+XDpc0SQTAD1pOIagYi+AeKQ+dV8d2+6iEc3p2ekjAySKONU8XH6YZzvY=
X-Gm-Message-State: AOJu0Ywb3Yi/yMA702VI7aCXxIVFrIXTUPlNXYfXFK2Av+n1ZzrkHf5s
	Pmbv3iXP20vqeAGMEnmVCHUvzKX3s9rfGnyT4/pX3f5mPHaL0GqXYAblfgD6PAk=
X-Google-Smtp-Source: AGHT+IHfEd7Z2W+mZKOkU2QAibQKJj0zxjBUZwryWSVYj+KSgDIHYf+8cNFUtLVRKtbV/mtanbCujA==
X-Received: by 2002:a17:902:f203:b0:1f9:e97d:9460 with SMTP id d9443c01a7336-1fac7e7fcf3mr84609585ad.16.1719831186806;
        Mon, 01 Jul 2024 03:53:06 -0700 (PDT)
Received: from localhost (66.112.216.249.16clouds.com. [66.112.216.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac15389a8sm62024795ad.176.2024.07.01.03.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 03:53:06 -0700 (PDT)
From: George Liu <liuxiwei1013@gmail.com>
X-Google-Original-From: George Liu <liuxiwei@ieisystem.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v1 2/3] dt-bindings: arm: aspeed: add IEIT x86 platform BMC boards
Date: Mon,  1 Jul 2024 18:52:58 +0800
Message-Id: <20240701105259.972135-2-liuxiwei@ieisystem.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240701105259.972135-1-liuxiwei@ieisystem.com>
References: <20240701105259.972135-1-liuxiwei@ieisystem.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on the ieisystems

Signed-off-by: George Liu <liuxiwei@ieisystem.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index e386d0ebfb14..818fbe9c45fc 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -92,6 +92,7 @@ properties:
               - ibm,rainier-bmc
               - ibm,system1-bmc
               - ibm,tacoma-bmc
+              - ieit,nf5280m7-bmc
               - inventec,starscream-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
-- 
2.34.1

