Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 888E454D7CB
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:06:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNlsg2nzZz3dxg
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:06:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zYVkK+/V;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zYVkK+/V;
	dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJhvc0yv9z3bTR
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 21:39:23 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id kq6so33860293ejb.11
        for <openbmc@lists.ozlabs.org>; Thu, 09 Jun 2022 04:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PsY51Y9LbGxALCP41QTkZafNtgUGmXvRyYQiy6lI9FU=;
        b=zYVkK+/V8ZGti1yZD5tr+qJSCek+CBHl2Nd1S/T3io//rE3MLRz4Uc6JvOZh//3oZf
         NI0ICECMerr05hjz/YzwcnYcowv9p8XnqaiK9gT1FKO+jvGLlLxJTRc5K8Tyl+cw0tli
         GCrWHIkFLBzMLB4NdF9ll+WcNamrxTIkPgLQggG/rhOflxUtLzoFk4K8mZ5BvLElGwt6
         lwfkDaDKEHIUH6k6qBWnaXgka8n9HzeMOXg0ZwINqRaQg3VDZdNZ47Es/FeEi/YCSAuQ
         lCjAvCwH3a90XTLrXe2L173Z0Tt4dh7LQW3aGReoQTnq25LDPafCnA2RrIgWA9aIlpEG
         gJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PsY51Y9LbGxALCP41QTkZafNtgUGmXvRyYQiy6lI9FU=;
        b=h+iHmzA2i0X2LUcFv46T2w0gZDEUvYIRURQmD6xOav4CNZSyO5hIiisHJLHltRupzm
         XFaW9Vc3cnMKGFfnBnlkCbiqw839NzaZZTBUV9nsMquboW2WJXx9dU4vKmEt5YnzBWyt
         4JfCIu7TowUqRiNpVl8yyY64y2qnUw/pJ9Pn3fRiLnJoPfg+4D7zWfBPwCMfNhdajKas
         DIFynr6NC/6iLrmix2g1lNYmuRQI+rGonEkArOe+EXhsw0mfvT5pLvEbZrVE6h3WUKdP
         4pq66aTOQimU3h3onUuQCsYABL3HRapowJ6dJpkpCH0V3ar2woZSiHQ6RpxanC68640m
         QTfA==
X-Gm-Message-State: AOAM53196HN0AHUNKjMIPUQ4Qk5DO7FCepjEoFH/qBndwYK/HCGxsPEC
	mlSjmbTfrh9JOlnORQtFT7/Zrw==
X-Google-Smtp-Source: ABdhPJxghBIkt/oPlnkhYfc+sNVuqIIRec7ri31pQri4hdc3zeWjKeem2e8hWbd5rY1utC5lGBYtqQ==
X-Received: by 2002:a17:906:9b86:b0:6f8:24e7:af7d with SMTP id dd6-20020a1709069b8600b006f824e7af7dmr36649187ejc.295.1654774759852;
        Thu, 09 Jun 2022 04:39:19 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u14-20020aa7d54e000000b0042e21f8c412sm11898495edr.42.2022.06.09.04.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:39:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/48] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl: align key node name
Date: Thu,  9 Jun 2022 13:39:06 +0200
Message-Id: <20220609113911.380368-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Jun 2022 12:05:36 +1000
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

gpio-keys schema requires keys to have more generic name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
index 47a56b83a610..4c7691c38b10 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
@@ -152,7 +152,7 @@ examples:
       pinctrl-names = "default";
       pinctrl-0 = <&pinctrl_uid>, <&pinmux_uid>;
 
-      uid {
+      switch-uid {
         label = "UID";
         linux,code = <102>;
         gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
-- 
2.34.1

