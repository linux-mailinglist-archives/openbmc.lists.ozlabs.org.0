Return-Path: <openbmc+bounces-762-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1449BEA705
	for <lists+openbmc@lfdr.de>; Fri, 17 Oct 2025 18:04:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp8lx4V6Jz3cYV;
	Sat, 18 Oct 2025 03:04:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760717085;
	cv=none; b=h0ol68lqfi1UYYxYuKbKLY6AIh8P0d2rECM0ZKng8EpXHepkehnLgsah0lihsE44FNbh6mZ7CYPweLLp8M6iCO5CnG8NR1C/W65fpNkG7/WGUrraaWoGCOG1Yo/vWrYiT/LPXNTk1x45edLPGKmAX1Hz2SPO2fc1ZODjN0fFlzgCK6Xhou4+aWJ6YeeayBxbWrMF8yXEOdU2ItZ2PEWU2QNZVOD2HjogKS8CE5WIMsmcURCdvRv2fjkS3798UswSNhUcsu70FDsiBzF8vKgBEWU1x0El5HL8GlP53dnCDQocdTivzPPvkDYC6jGdeY4rlKsRj5vWW6AXQW/Uqlvf/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760717085; c=relaxed/relaxed;
	bh=950Q3osvXfNrhNZDR0R7N+wo2IA1yL5cHorDQTcIxKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gNR64szxKK3lwD8QIhdF9Fc2jffwCGtQtJjT2ccS2tWArW0eMXI37cKHFiLaJvwilinijZvjjvw4XDqVvbLwCNm1DWRPwAPscVuqnmjHWMwo6szc5xE/H3YlhngXk8JlVMtKK5oxwLJJB+Iavx6HBnHYdDxJv9KNhRUxuRasaxoi8roBmoZEWUjveRFtbC1XmuXbl2V8/8CnShsvtZdREMpFcx3tOQHGFuqr+VNXvZGIsv7ujHUgiDFeoeHgtnJM4/GmNp9t91dJ5pHfDtzQ5gJtpdS4N/xBt3mwumWMgdHH0NZWaRMd2eV0BRXFciJsi9bEccVmesCfqdi8O93RUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bJjB5iZg; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bJjB5iZg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp8lw27zyz3cYP
	for <openbmc@lists.ozlabs.org>; Sat, 18 Oct 2025 03:04:43 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so12358545e9.0
        for <openbmc@lists.ozlabs.org>; Fri, 17 Oct 2025 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760717079; x=1761321879; darn=lists.ozlabs.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=950Q3osvXfNrhNZDR0R7N+wo2IA1yL5cHorDQTcIxKM=;
        b=bJjB5iZgOJweep/aSjXru1beh3bMdFhoc3YadB7OHWFc2ZUDURrkgJijGEsI9/zaG7
         7vsk8L9rcDvvDcl1zbkDsngW8irzHuS7/GqxXPwZlMxyBU8cyeGp1a3c2B2bGFdjPdvQ
         Y32koRqzQLY77kqxU+zKsvNsUoU0xJY0eDpzBYC4G4ScqxkAd1q85lTCJaYU6UhJiBr2
         tI1s8Bi0QHNhjkvm7mH8V0mniU7HwEYW6+q2rTH7a+ZduRTA8PVW5Jv+va+cB1c6TR1V
         +2GvXHXpGHPH1yeGv/xc0afc7UGKsTQQFUV4q406wCurkwORKrX12nXjlFqV9+UQUK/j
         FoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717079; x=1761321879;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=950Q3osvXfNrhNZDR0R7N+wo2IA1yL5cHorDQTcIxKM=;
        b=tNEoult3cVrP2IyfmtrFVF0oAHITZCDmp43K8FSN4kg6EUmXlet5p7N2RYL7sK+V5O
         pmhSlYYL0HGCpbKr5GjR+r4JWWJ3m0cVLLpdgIPqOxFFqugVIfAAnN3WeGp0hc/i9fV3
         b4F3NijzVuKugM7TYjNphkKAw3CIqIOLy6M+YGCw7kNzvVxCK+M6ZFhlAn75EdKa9kVN
         qyHs6F9wBYCM2+FJUlvkzkv8a9A/53liIyDQat9OgZJDvggFC0gFoPWpTIAHvF1W//9K
         xHiub03xesgFvaYpGFXVP3Y5IEc77tMZiSYyWsghLWMU+Wb2ouMCJdQnlrGtP5N0e6L7
         RMLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXcSmsI1jZMYix+y37MHDvnHpBwZsuLNFXDDu8/075w3aDaD8pS94bzXR++3nwzXEcNubOMTZw@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyLxBDagjJu4Xx86oTd+DNHk7t5TolqFMpxZLrW0FxboYm8INmY
	fvEZOSeyoDyRZL8/HfyubFm9xje81Ragq7Vofa6tdaRW8NWi3iBHBFBC6Zv+XWhlVTc=
X-Gm-Gg: ASbGncstXcVWDNdHS8OYQ69FuLvl3fKtehuoX8pG/tttqUbnLH3i1+HyBKEH8j6ZBLe
	Pz3KQU0lHY91XCsmna3LDaftwq8cNi7ZS6ndRDGVa0QvfRnjPTiSvptfMz1SdTiPFRv5mM2sMSo
	fZcfcsJhbWhZoX0ESAQV3A7rb9VKradvJZkTrJh8iu1WX8lHYKUn289wRS23zPE+/iAasJu9gAw
	Nbco3Dk10nyMGhBsDXt6sCwnxKZtX+q8A2Nmv6YIhweEgVOpLErONL1zyqiyOuEbmbZHX2CWQh3
	d814VFCptBScLPhBk2TGmxQ0KWBHv1LVuK8DuRThmvfEuxNiFRobKhTmLoOmFIWboJrOIPU6h5g
	sOt8GDjONXACRXt6w5h0C5Q/GyafAqKaTg/7czDgsVTb5mFru0I4MKbn9pC1znenWAAZp78BV2H
	G09Iwh8A==
X-Google-Smtp-Source: AGHT+IEqaf8aEdQodsl+JMqmg15To8fNumQ1pcFMtGOlWgs5DrBRbhx4c+4oaiAKATvKgQ4yjwGtCA==
X-Received: by 2002:a05:6000:26c5:b0:426:d72e:9924 with SMTP id ffacd0b85a97d-42704dd6cf9mr3110630f8f.51.1760717078511;
        Fri, 17 Oct 2025 09:04:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427ea5a1056sm544f8f.2.2025.10.17.09.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:04:38 -0700 (PDT)
Date: Fri, 17 Oct 2025 19:04:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Mark Brown <broonie@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] spi: aspeed: Fix an IS_ERR() vs NULL bug in probe()
Message-ID: <aPJpEnfK31pHz8_w@stanley.mountain>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The platform_get_resource() function doesn't return error pointers, it
returns NULL on error.  Update the error checking to match.

Fixes: 64d87ccfae33 ("spi: aspeed: Only map necessary address window region")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-aspeed-smc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 0c3de371fd39..822df89cb787 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -865,9 +865,9 @@ static int aspeed_spi_probe(struct platform_device *pdev)
 		return PTR_ERR(aspi->regs);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (IS_ERR(res)) {
+	if (!res) {
 		dev_err(dev, "missing AHB memory\n");
-		return PTR_ERR(res);
+		return -EINVAL;
 	}
 
 	aspi->ahb_window_size = resource_size(res);
-- 
2.51.0


