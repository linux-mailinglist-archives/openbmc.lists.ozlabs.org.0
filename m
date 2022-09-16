Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DA45BC39D
	for <lists+openbmc@lfdr.de>; Mon, 19 Sep 2022 09:47:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWGwJ16Xhz2yP8
	for <lists+openbmc@lfdr.de>; Mon, 19 Sep 2022 17:46:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WqJhRC6J;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=pbrobinson@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WqJhRC6J;
	dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTXbG1bNrz2yxG;
	Fri, 16 Sep 2022 21:56:09 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id u9so48964808ejy.5;
        Fri, 16 Sep 2022 04:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=x14L5nWN4Vy/JiW326iHsOtIjJf1QJbgmD95EAtZRbE=;
        b=WqJhRC6Jhe9fMZsv5wEIKkEdPLGutrQ7JDTdPexz21O9E3nlaIMpQp6Fp4z2ZVD4pf
         3s7AQByd87b9QM7mkv9RuGz1mwYFXtPe3FBW0/GqyQ9Zh/526EJzoperb/IZV8m4tCTJ
         P+wNPKWgPno/0UhunQqWXGMe97HUhNm5bIey+RCKlNIPmij4Gihfg6GUYAJMhO0LWZOy
         lnzyfrIoWiVfeAzKkvtnaFUvvKx2eVcMHtaLDr3CbAUIhiOUZJvyoeDe7eU/bCF1kXnJ
         uVb/CBJyp0yyzvuisZ/nqwQA6a6FQDHF2U/taSpIByq1MfTL0bPQhDm1tVKjjujjG86u
         z2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=x14L5nWN4Vy/JiW326iHsOtIjJf1QJbgmD95EAtZRbE=;
        b=p7B+kXUcXIYTIRIO1/38ZmduL0X0uzG3set1HDOr5A8SAedvfPv2hzakIkQStD99qy
         85kNgDuf3r7uVNr/E9HHC7ewUkK5DFBJvn1xa9rYj1J3dhRZphqRBsNleV5T07XQGjWo
         g+/+JAfNA+QJvLXmlCZd+kg/VdM6tw44Av93QHRukiZYdODrQAR8nERFGyeO62KrG4Pp
         398B6rW/mX/MX6ASNVlQjY/LE6bvg/2AusSmQ6ZfU6rEZtxYPbb8pE7tq7md8bGAoIS5
         DSi5tYFZhL2aGDCw0kDtNA877mRRxHDvne7bs3S7kONSWPfFsnrpGI03UVzaNNR14ofV
         AcWg==
X-Gm-Message-State: ACrzQf12W/BuLhZzJzs2EoB7i39x0LySpAWaVTSLIlZGSBTZW9FOezPe
	iqw3UQz6byCG+63/0VlAtEw=
X-Google-Smtp-Source: AMsMyM6kx6YpswciT5Yyc8j/z70Y0Qnb361JxWuJQ94VG8037dOBAvvfWi8mN91Wd6Bgw8hIV6sT+Q==
X-Received: by 2002:a17:907:2e02:b0:77c:405e:e740 with SMTP id ig2-20020a1709072e0200b0077c405ee740mr3228298ejc.139.1663329365113;
        Fri, 16 Sep 2022 04:56:05 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id w21-20020a1709064a1500b0077a1dd3e7b7sm10233407eju.102.2022.09.16.04.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 04:56:04 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH] mmc: sdhci-of-aspeed: Add dependency on ARCH_ASPEED
Date: Fri, 16 Sep 2022 12:56:02 +0100
Message-Id: <20220916115602.370003-1-pbrobinson@gmail.com>
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

The MMC_SDHCI_OF_ASPEED is part of the Aspeed silicon so it makes
sense to depend on ARCH_ASPEED and for compile testing.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/mmc/host/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index e63608834411..f324daadaf70 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -157,6 +157,7 @@ config MMC_SDHCI_OF_ARASAN
 
 config MMC_SDHCI_OF_ASPEED
 	tristate "SDHCI OF support for the ASPEED SDHCI controller"
+	depends on ARCH_ASPEED || COMPILE_TEST
 	depends on MMC_SDHCI_PLTFM
 	depends on OF && OF_ADDRESS
 	select MMC_SDHCI_IO_ACCESSORS
-- 
2.37.3

