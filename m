Return-Path: <openbmc+bounces-41-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF39AB2C74
	for <lists+openbmc@lfdr.de>; Mon, 12 May 2025 01:46:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZwfWp3xpFz2xKh;
	Mon, 12 May 2025 09:46:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746789704;
	cv=none; b=iLMytSIE7Bb0vhJg7QNLJAYgdMrO0/0PfHHnkEfG0d6Y64NmxnLr1uBe1PvdeqjABeki4A9x8vpM+A9Foe66Ks8EIeE0VUHwuTVl02RwGjp+p6ho5VYoXmI3dvBrkqU8QncvDZr0U3a4SMlO78tAcSArgOAWTVeKx0+QJvZKkC187FV67Kxbjwd3W1ddasCps269voBYy2akuvzHHxh+m03sh0rUdiJMkRgDaCCr2fYCRzcl9T7YnkociEVcc34OSdlVe2MlFJ6QiaplLZX6pIebnEl+sB/e3v5LjJecS1TjouvS4LVoOVXocArw+2q6sICtOOAgUXS2tWkA1MvfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746789704; c=relaxed/relaxed;
	bh=0zvaxLdQ0qhtC7Jg6xocbXcJy/vEo+u7LRWPS1JM5/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4xCOZvJJaAnXil4oAHS590uojzecJMxH/xMMLfNGwF5KNkOyCTz18WKlHHxaM9AOueYxaNhe+PtXbVPbLDHXOAiAw2q8Qo99uaGCYKcom26tCGzW9+OHphvfo5f84t1z5abeUM4kygbkotVJgaQ/JNi5nXqRz9yzjbKKn7SKUylWBN+4zg7HfR2qo/JWvHTSb3islpEh/OjfCCaK07bJZseZ40PzXegybNwPRP+sgbNaqL75EsTEp3QqPvoPeWIT3hbhMrbOZhU6rSqqqyDLPq/V/rG5QDzw5xaaXsc0aRgX+BcCoHtjyubtDEyBIAJEnQZmBZsh36JFFX9qT9eAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SGVscOtz; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SGVscOtz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zv65g2C5tz3bkb
	for <openbmc@lists.ozlabs.org>; Fri,  9 May 2025 21:21:43 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so1960785e9.2
        for <openbmc@lists.ozlabs.org>; Fri, 09 May 2025 04:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746789700; x=1747394500; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zvaxLdQ0qhtC7Jg6xocbXcJy/vEo+u7LRWPS1JM5/o=;
        b=SGVscOtz5iZsHoZQk8mu3Pupfbgg49JsnhtZLbMBHFBn8DgVW4xTJo+1KIxQQsLkRc
         ziXG+7ZDRI0cjSwzae6cRwLfMNNZAN+6lFUGN2uZ9nopn/zED8NotN1GoyCrxDBKNYnu
         iZl4SLuShjE764ijn/GLe1CFAIYq1zCzMU0RcOuyBDFhMBE/yRpmIv7+km8agEPqBThK
         Iw4QSNaf90bVdStZsiv0mu7IAQhtWNB2GngEFFo7Q89+G7G1rC/4h0puMiVx0Es+ejV3
         ab4Os3KrEyaskpOSCKoTlo0aYo2fe6aAzr4jvctZgR47cYmyFN1ZMvOK9fkLQf/KMpMP
         FFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746789700; x=1747394500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zvaxLdQ0qhtC7Jg6xocbXcJy/vEo+u7LRWPS1JM5/o=;
        b=ZUhCEC2loyS5LBlYC8SODFah9oPEX+TuKiaLw1SfUCnV0MnjYVNz10CjiGrJXAIkRV
         hEfCoHYsV4Y2i6X07OoOFvpl7CR5OB1jSKs1qYYNDPZeg61EEZnS09qhzG795jsUIyhE
         zzwdF1UQG8AccKaYo4IR5Rt1qTCf/gAPIcrjz7aMYJGs21ouCIWzr8LYZBaQ8pd+J6lW
         0MZFu2SLqgnPBijx3U8a1Jz722a3ON5xfi2gEAu00tGrYx87oM8/U+MiQbZQLV+Mea9k
         +vw4r1+wVLf1XWycPOc77B7OoxfbikR/5QFM2YKeaI+g8O9mwNv/ORzwu9siP59JBroz
         Oj+w==
X-Forwarded-Encrypted: i=1; AJvYcCX4RP52Fp+1smyMFm7fVsfRcWvbRBzDs8VuFpzkbuEpN7dmDlSQGNrccw0use/wgcpkWZ85pGpB@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwjHCbaR69KPobthCpUuBMsBP5fwFOyV29UXrmckQ+qMcxaM2b0
	6QZnQiQoTToo3CrlWsi5TqoBtm1z3e5ajnProAM07eYn2VNegWxkHGu5z91WRLk=
X-Gm-Gg: ASbGncvmFAfZapPhSH0OQCxpUjIGwfVXHMaa+MJS68oiyK2T8RddRs4b4OZcW5ZRICE
	c0E0MlV7FTqcWif9+ikS4aBxuZU2CWLNEoaTZcIE0moaZiGwjD6wNb0TePdX6uFZWhhFOQlcgfi
	vevCzhBR0/uhUZ9jrPC5B8YPJO2IVZxijr8dwfG9i7ftKe1VuTlQ2qVQsVYJOECKeTdbcu8noFx
	o0tiezdZcv8qaymFdOLLq8MYD78DFKbnYWyLze0JhYFCg51zszrJBpaO+Pye+TUovMQlh4ycIg0
	gxujcJ+3s99nU8pfn3mn9Nph7KhLR+U+U3n2n7ly5SxCVq2syw==
X-Google-Smtp-Source: AGHT+IEuDuBg93OxIQQoW+nylcXuRFPBeBathaUSkxBNEQ4jD3mR42Jzx1DI1Z0ON8bFZOIloNRtJQ==
X-Received: by 2002:a05:600c:1382:b0:439:a30f:2e49 with SMTP id 5b1f17b1804b1-442d6dd5413mr8885805e9.5.1746789699803;
        Fri, 09 May 2025 04:21:39 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd328455sm69946945e9.2.2025.05.09.04.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:21:39 -0700 (PDT)
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
Subject: [PATCH 2/2] spi: dt-bindings: nuvoton,wpcm450-fiu: Drop unrelated nodes from DTS example
Date: Fri,  9 May 2025 13:21:32 +0200
Message-ID: <20250509112130.123462-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250509112130.123462-3-krzysztof.kozlowski@linaro.org>
References: <20250509112130.123462-3-krzysztof.kozlowski@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=869; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=0BuO/miu0FNdGeIwKI4Igcv8UGoaQFfIol3GnMmPqqQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHeU9Raekbf2tG03zWC6ko3skitxMRci9RwRJu
 8slhDM2iNaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaB3lPQAKCRDBN2bmhouD
 14v3D/9iuwKe4zn277rUfVsmgt/II8fADdf1u/LFF8b+e1VT3f1aiSpH7QsV6sp6QMDJZT/Sjan
 EA5EpUVZRySb6x1OoQPqh9geb8YTnuzu+1mWMxtmBwBzSqNa/ip2dEhYZIkq+zUlobn5dkMP6/N
 z0P5+VQc/vFc6uFcTHXE4h3Ngj/l7NEMSlEJzaV5zdlAJh6LqF1L7x04TAc9S7KqAEwToyaJENd
 LX0+FVaiwpPNKbElXgizKP16egYtBw+RTrZjsUxgOfIccAbaCPDSWQbw5Dd2tsfLhlD56fuQ//U
 bkTV252AgvsA0CBs5BFD1CN7zHWsKzQF6SYkq+LlHWC8dTO8IViLSn09zJnknFgQCsUiYh8y5jE
 xav332eHokzZ/JmqqM1BjdCrVPnlsxrvgaHLhJLu8h3bW4bucGZCs3LNUC+U2deDOeYbrAXE6D6
 5jqPWdMYxx5FLKVIJkMSJyDtTPV0YiXrqDmFsPJKYUNJAnIZFKGpN0Wpk6VYWZ9rDtepU0781rB
 oO3zGPlWD4Snadvawz9PIqeEAueNplqWUjDezYjF3SvujhiPpmZpXkQ+Q1jV4stqNtnVPNXh3HW
 nSGGYwfk/aaVVWfKANaOQqz0C69xQIXbDORTrC1Ts5aDxeQa4LgzFEkrxuJ4aZyTW7vw1Crk4AP WWtlsOiCaLqiCxg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Binding example should not contain other nodes, including other
providers like syscon, because this is redundant and only adds
unnecessary bloat.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml         | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml b/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml
index 4e0d391e1d69..c97bf48b56b4 100644
--- a/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml
+++ b/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml
@@ -59,8 +59,3 @@ examples:
         reg = <0>;
       };
     };
-
-    shm: syscon@c8001000 {
-      compatible = "nuvoton,wpcm450-shm", "syscon";
-      reg = <0xc8001000 0x1000>;
-    };
-- 
2.45.2


