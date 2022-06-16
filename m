Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A28A954D89E
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:47:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmmb3gSMz3f3t
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:47:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ov/ul4jx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ov/ul4jx;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNkFl4Xcgz3073
	for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 10:54:03 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id k12-20020a17090a404c00b001eaabc1fe5dso374004pjg.1
        for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2022 17:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iTmMhkqlfpVDlkUHNU9nY9SnHGZsapXurBzSo9cHSyY=;
        b=ov/ul4jxhKist2TEfrakrnj2dmKcx7DUNTcwBDLkBudr6r+QfyRL7lSmO1KFBCD5Ul
         QDtD5oAEzoFLAzsk2j+eT1TugvWzSfQeZmcF+mz5gpgaq0/39jBdAZ2D9YWIkCohE74q
         T+FwtwSVTj/FHvtue80lh1EZwpoJhlEE1tPrZhMLl6+zwel4NfaohhiXG3gZy8i/CFH8
         sMoqsGOAOEUroc/WUK4GF0xlNka2ER1S+upnS17j7m+P5guo5CuzWV6pFnlG1Y+DWgbV
         Qgu7yG5mjOA+3oemzHIl+TelmICNTvp6ttQOCYkSy02IlHtAPpm8lrNV0rtEmoN5GkFB
         KFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iTmMhkqlfpVDlkUHNU9nY9SnHGZsapXurBzSo9cHSyY=;
        b=B3zrdONh2s+kc0ZLfVKKLWVJqssUeAJv/fqxo6AZYYKPefdvw0npE8tTMZz2GUlv/y
         xI6t27VYC2yEsyIlSRBQXCXeUGt4pgh8hjbxaD8+8CBKfNdCRO2qTHpdPEcczEeirFI7
         aC8YoC9teFTwS5MQZwtgdKrArMXhpl7AIznDN0APV6aSslX7JO+AFSQ+y0+51P7+A3Sw
         zeopddkvxgPLBC5wdGcqSzWtaZ9QEZxb76/MIHuhkOb5jIR+pCF6K4TOFvxKTB34pucI
         BPg63yCvfWdPZcO3fzcDaI1RN3anzDDuUh91h+7MICvdik2Ll5IE+UbpmNhTNQOJ7ncL
         Z/Lw==
X-Gm-Message-State: AJIora9v4cAw2EmIaMvm5k3hWwmkNznoLThIeY+0Q2cQenXT/z5osyl6
	2DlzsFmoB03TaEQ0nXS9XOgO3g==
X-Google-Smtp-Source: AGRyM1uUgtMpbSHwdQrftxmeWaXmKReJq4JcYQ6GGsSyFi4zWRGp6KG9VseBtvRIrdjjHmpi5fMEXg==
X-Received: by 2002:a17:90b:17d0:b0:1e3:5324:c465 with SMTP id me16-20020a17090b17d000b001e35324c465mr2309564pjb.34.1655340840506;
        Wed, 15 Jun 2022 17:54:00 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/40] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl: align key node name
Date: Wed, 15 Jun 2022 17:52:57 -0700
Message-Id: <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
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

Changes since v2:
1. Name it "button-uid"
---
 .../devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
index 47a56b83a610..7a11beb8f222 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
@@ -152,7 +152,7 @@ examples:
       pinctrl-names = "default";
       pinctrl-0 = <&pinctrl_uid>, <&pinmux_uid>;
 
-      uid {
+      button-uid {
         label = "UID";
         linux,code = <102>;
         gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
-- 
2.34.1

