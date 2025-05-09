Return-Path: <openbmc+bounces-40-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 709D8AB2C73
	for <lists+openbmc@lfdr.de>; Mon, 12 May 2025 01:46:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZwfWm2RDXz2yft;
	Mon, 12 May 2025 09:46:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746789704;
	cv=none; b=Yw6fvP3prM2K+9C6+ECIL/l5+/Od/cYlMOxda8a6vEqH0rRA3EtTQEJ7Au0jhC+DBPsWq0OJmE6HsHjT13gaJrA6K4T6Vh1exzoh6rWXjWVxdvNkobi9N0DljiGWCPG1FpsTHL+f3naCkFlbGYB9ev7usltI/3CnXK6sZX67lmCnj8LF8hnQzvYZx+oQ4c9noXI0QniShsRa3VxCk7n8A1VlCKA/WVyz1Y7MCdwNNZr9WTLaiftuddx/XsqaP/zxjm6KFDltMQStq3jBL/r+BfPS7uSmHOOXQzExak3rsCD86CWpBSVCS9pSSsgzcz226gAU2mSh0QQZcKEKb5IPrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746789704; c=relaxed/relaxed;
	bh=oKYrxiUxy0npi+Mk4ryYuieCR3b8bkKwTBnIOJMWofc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cSb1zTndlKMW8xStbHQq99gRyQWmkm2bA/9ZD17u0Zp7LGFULCZtVEK4BodOKrjkqARO8nURZSrMgHf9n8LR848ub0TCAldAuyK+86J4EOrx+i10CQ0UCGP7vlGnavzOMXuXsbr8YGlE2K1Mf1Qz+jENO3dS41Mrm9XC6yGLvsg+SxeiMCyKYBu4ge4zc/XM+P/L5phnFO5opa76O6Wg47CS1HwgFz+TvKuNmN3YxUrUhvLnu0V6OCXrTtylo3RwpA/Iw0hQVwEkVgjJhZ9zW+XUT8VnAq57qEZlCb6s/WN0t3Bgk6tqpFitxOD1Ph2P1QVFqseAI+P7kNig0D34JQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sWB4i+9X; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sWB4i+9X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zv65g05rGz3bgn
	for <openbmc@lists.ozlabs.org>; Fri,  9 May 2025 21:21:41 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso691315e9.2
        for <openbmc@lists.ozlabs.org>; Fri, 09 May 2025 04:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746789698; x=1747394498; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKYrxiUxy0npi+Mk4ryYuieCR3b8bkKwTBnIOJMWofc=;
        b=sWB4i+9XU30lt/If12oqNmshvyyTZ0L71bjbGP+y7IC1eJmraIDG3Kb6u1gOPfPJR1
         beHPry64rQ/6SoS8LRKTGVG3F/XPrAsMlw9Vy9NGXvXA0xxMqwAaJiCUbDpPkwdxQeeK
         6Zl4XzabbuDkKPm+CjlFmBnutPJcG30t0QHgxLnQa8lekGlfE4Eu/7W8HUQ4gFzyFxTY
         ONrMUF1swPTUKOyPDh7BIzshaEaBWO3bfMZeFf3o5iXjsVu7Mkba65jjOjlzhvDLOWDg
         31VL5Vs5kewBKpRHGKWPjUqIhRfQh/5ldtxquPwF0NQE/T5DPBkt988v/+GF3ci8fQBP
         wzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746789698; x=1747394498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKYrxiUxy0npi+Mk4ryYuieCR3b8bkKwTBnIOJMWofc=;
        b=CgE4ADdpCp1S9Rd8EYZBLz0DIcaelwQGtQsMJ/7I55pwiJePJBlqtRQUr03v+tMBAz
         7ehcfrW/Ka4oHK4/Q9DSijviLst7yYAhwcZQP8TRW134Mj74l/QFej3L2kmQiknyOpO6
         H7+oeOfe4BYzeebouD7Bixlp9eCPRhOI9tgJj9o5qAjws0Z6xMtQOo1V5OWRNQXJlBT2
         rcofGwtyLkLd4oU8xhnYW8HpJIOJubel6xPNsobNIZeJh8GiWxJnxHeiceMAnG2EBFW1
         vuyF6wpGNJ97kVnlkL/TwVPEzk9MfT/Y7EvI3mbzSP0V19TNmxnEEAtfDMsOVXTbTamQ
         HD2A==
X-Forwarded-Encrypted: i=1; AJvYcCU2PLHCchHuBEL4DZnLfBVQQYrTWqrMf9lre49m0KeeAWwCKwi1ibsxDr6Sb0fUoUnsHJrxGkM2@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwHQdz8G14W3Gn4avr7p0l+deUEPsNbwIpPcJ6r9La65Z8O/BwL
	gsADZi+57c70Gkne8iyI2TCrdCetiKrOx4LCvITqws/+jsC7MTpC9FX8HHOo3QM=
X-Gm-Gg: ASbGnctH89VCLk7onZmOsTy16/X6UNGy2EIxlqYgAdOX6bSy7tV/VJ9sTeIj9TwPt6S
	zdmY1XUh6X6VXrsGh5P56RYxWMWMDutNe2Sq1aPM5YWbX3BKbyzHT09/Mp/ctV24xkJxYJvA8q3
	laD1N1CN1jv4/Ow9GqPRpX0aGWB3xsseIJU86ibhMGGgFmNIaQYPkt/Ir9p1kprIoX+PHCabd2W
	p8qROwvIyRYUNJSvImejqdZEsoGNV5EoNGkuSk+GH4S3/jzqfIxkhH2FWYn6PkmwV/m+IfXzS3a
	py8hakxzClKnySlLm90GDEmvmdDQvNKQaA3alWKqxbkjhDZwB8HWBSHjOUWg
X-Google-Smtp-Source: AGHT+IFlbI/ktfksQQOpGjeIwbwt/o9L6Xz+ipgRzNOoWeXM2S9UxEpNqGKoq6dMD0VJeqXmsLSN+g==
X-Received: by 2002:a05:600c:4451:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-442d6dc7d2dmr9532715e9.4.1746789698392;
        Fri, 09 May 2025 04:21:38 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd328455sm69946945e9.2.2025.05.09.04.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:21:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Frank Li <Frank.Li@nxp.com>,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] spi: dt-bindings: fsl,dspi: Fix example indentation
Date: Fri,  9 May 2025 13:21:31 +0200
Message-ID: <20250509112130.123462-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1380; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=s66Afxw8a3xMB/SBhQiPMSJcaB2YeSJGVtDWMjyFv0E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHeU66+RBLo+l0lSwvGSnhzCY2cPM9tZGuIQ2p
 wsaUNeN9bOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaB3lOgAKCRDBN2bmhouD
 17OnD/wKNyvGnBHJUSNZxdQlvkRO2cr4Gton4WSAWbZ2wKtlwLfNMdH+g91UdqFkXbytN2611vW
 RcWUGYGRpoCMqelb2OjY+fLEfn5HIJi2Wpxaxyx8h8fzjCUKngY7dfgLJDqbaFa/hLkmkCcimnG
 g3sFRdTXd+scm6fQHI++SP+ovsyGOHo/zHC60TCcusbm8CL8lweGzKuzVt+jdkbd3KYoSWsBH7X
 paH2jYlUqunABAf3g0XH6ay4Ib2CnW2dO9fdfN18DuiOl972ClrhYBKBcYYnEyaW1xSOl0fhaDD
 dVgvsd2JoQd0OC9ccfzCTSX9kQFZbR0zE0lTP5IBahHEut7bhUbr5tvGdnxYQK0XQvSMUHIXhNZ
 X8wfIDUGWRuygCbj0BdrLv6+m0OKJBOJjhjJo38KGkOW3LpqwmAd+47ottvB9ofZQoHfmg7DBvA
 HtyZ7r8C2siQqDa+N0Z2XYWKyB/ugPh4pw22tAOfJG+kZ72V8RksiGAFEIwuqzGt8ddNm6DE9SI
 BeSDarp7Jaqomm5eoDAYnxgff9GlYokHuol19yq9RDrFM37tvykY1ArwU2VTFPXs6vyf6MXUO1l
 xaSpQNs56nhvSp/MYbpZ7JfQo5ml5GGRp7mktfDKpWKJazgMpdteFiS5DRQwZpXgnPhC3L+e5oX iiM4xKX/3xOH2bg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

DTS example in the bindings should be indented with 2- or 4-spaces, so
correct a mixture of different styles to keep consistent 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

No functional changes here, but saves some comments during reviews of
new patches built on existing code.
---
 .../devicetree/bindings/spi/fsl,dspi.yaml          | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/fsl,dspi.yaml b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
index 7ca8fceda717..bf9cce53c48d 100644
--- a/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
@@ -105,12 +105,12 @@ examples:
         big-endian;
 
         flash@0 {
-                compatible = "jedec,spi-nor";
-                reg = <0>;
-                spi-max-frequency = <16000000>;
-                spi-cpol;
-                spi-cpha;
-                spi-cs-setup-delay-ns = <100>;
-                spi-cs-hold-delay-ns = <50>;
+            compatible = "jedec,spi-nor";
+            reg = <0>;
+            spi-max-frequency = <16000000>;
+            spi-cpol;
+            spi-cpha;
+            spi-cs-setup-delay-ns = <100>;
+            spi-cs-hold-delay-ns = <50>;
         };
     };
-- 
2.45.2


