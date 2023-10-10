Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6607BFF4C
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 16:28:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MDHls2LQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4dYx1jsvz3cgk
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 01:28:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MDHls2LQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4dYL4jF3z2xm3
	for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2023 01:28:20 +1100 (AEDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d9a3d737d66so1561878276.2
        for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2023 07:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696948097; x=1697552897; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VieWLMAOeMVC3rl3XsXfYG0X2k/MOxV7sD3CF+kS9Yc=;
        b=MDHls2LQr5dscQeq/Hi43rzESk6DkJh9Ci8fhRYO7TAqA9l186KV8VAIwIiu7QOcO7
         oahJ+iv/ayW9w/3nh2ty61YzmXfWJjgwfSzaMConDWZc9/l8gRjtehfHnlLYwAvyhGoF
         tPIf/zBoPnknXlL/tILXM3sHrKbmlG8HCmBoBMutGNd5OZ3wZ4CmfPmX1QgPSoPYcayc
         NIJHMhhR9gFO2sbI51nAYhBV0gxyCwTs2D6lSgdruOPUMvire0/Kl6oml+GRM6A441QU
         GhCwJANVe9uqz3c5wgIO/8HwiaPthg0BjAKso9J5AshdMbjooP3EDOI4JO+pxiAP7tEk
         2zsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696948097; x=1697552897;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VieWLMAOeMVC3rl3XsXfYG0X2k/MOxV7sD3CF+kS9Yc=;
        b=oujt+gqFRK6JDoLI3AF1aTNJUVOK+AwvK0uRvGq9OyhR+N5UAnicdPD7+hGHOJQrMf
         BFhrnV1166lU6vF7weDIo6og+1LkB27V77grZTFq/cgN8uDhNqEkwvpFqwFZKllMbP73
         PnxYXFiOwFbGuJMo5dCVorcKJuF7mXDr+ItkTblXGhJ55qepnE8ob1p6INVG8h2jA2UA
         N9lzEey5Q/r399yOxDFBairji+lmYbjjcXWu3fkf6dmGY3qJ4DIDavrB5eJY0nl8qz8c
         Dv3DwIRvW+81Abz3oh6tzSCPhV/XTM97/8O6E60RmHpV7z/R30dTKY5UC6BAQHlqFYOU
         XskQ==
X-Gm-Message-State: AOJu0YwjOGVi5RwKBMgH2jEH3GcmM9amIxW32cB4mqwqZjOPLgr097FN
	cgaKkDS8BLAZgAWF9bPqRP9Brza5ilybDwlih34HHw==
X-Google-Smtp-Source: AGHT+IEyR5gyWtdqFzf5k1RG5nTB/n8+9hlLKGCgokeEptzxamgxwENVYWcMtkuqr9JZfmwIzZbHqicq0j/xu0oox4Y=
X-Received: by 2002:a5b:a50:0:b0:d97:213b:4775 with SMTP id
 z16-20020a5b0a50000000b00d97213b4775mr10319439ybq.34.1696948097328; Tue, 10
 Oct 2023 07:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231002200610.129799-1-tmaimon77@gmail.com>
In-Reply-To: <20231002200610.129799-1-tmaimon77@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Oct 2023 16:27:41 +0200
Message-ID: <CAPDyKForPWPHoAuRuyXBHRpNVA9MvYa-eTXDrHx8Z94nSWpXBg@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] add NPCM SDHCI driver support
To: Tomer Maimon <tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, arnd@arndb.de, krakoczy@antmicro.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, briannorris@chromium.org, linux-mmc@vger.kernel.org, adrian.hunter@intel.com, tali.perry1@gmail.com, gsomlo@gmail.com, joel@jms.id.au, davidgow@google.com, skhan@linuxfoundation.org, devicetree@vger.kernel.org, pbrobinson@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2 Oct 2023 at 22:06, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> This patch set adds SDHCI support for the Nuvoton NPCM Baseboard
> Management Controller (BMC).
>
> Deeply sorry it took that long until sending version three, promise to try
> to do better on the next versions (if needed) :-),
>
> The NPCM SDHCI driver tested on NPCM750 and NPCM845 EVB.
>
> Addressed comments from:
>  - Andy Shevchenko : https://www.spinics.net/lists/devicetree/msg638000.html
>
> Changes since version 4:
>  - Remove unnecessary clk_disable_unprepare function.
>
> Changes since version 3:
>  - Use devm_clk_get_optional_enabled function.
>  - Add mod_devicetable.h.
>  - Modify copyright year.
>
> Changes since version 2:
>  - Add data to handle architecture-specific SDHCI parameters.
>  - Change config place in make and kconfig files.
>  - Calling sdhci_pltfm_free to to avoid a memory leak on error.
>
> Changes since version 1:
>  - Use correct spaces in the dt-bindings.
>  - Drop unused labels from dt-bindings.
>  - Order by module name in the make a configuration.
>  - Remove unnecessary blank lines.
>  - Using devm_clk_get_optional instead of devm_clk_get.
>
> Tomer Maimon (2):
>   dt-bindings: mmc: npcm,sdhci: Document NPCM SDHCI controller
>   mmc: sdhci-npcm: Add NPCM SDHCI driver
>
>  .../devicetree/bindings/mmc/npcm,sdhci.yaml   | 45 +++++++++
>  drivers/mmc/host/Kconfig                      |  8 ++
>  drivers/mmc/host/Makefile                     |  1 +
>  drivers/mmc/host/sdhci-npcm.c                 | 94 +++++++++++++++++++
>  4 files changed, 148 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/npcm,sdhci.yaml
>  create mode 100644 drivers/mmc/host/sdhci-npcm.c
>

Applied for next (and by amending patch2 to remove some commas), thanks!

Kind regards
Uffe
