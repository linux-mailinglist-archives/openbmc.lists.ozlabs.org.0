Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E092103AAD
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 14:05:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47J2x73hq0zDqPw
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 00:05:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::941;
 helo=mail-ua1-x941.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="dYP/0q1U"; 
 dkim-atps=neutral
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47J2pQ3T1KzDqrq
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 23:59:34 +1100 (AEDT)
Received: by mail-ua1-x941.google.com with SMTP id l38so7727195uad.4
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 04:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nuqJ0vbClL23gGoYcppi0FrFy7e9Hz/yNcjMSMNBxqE=;
 b=dYP/0q1UJs+hkupL0Ks33xZa/oPu9OOQ/1POhchabco+MYLW/OVqUGMujUfpI5uX/Z
 guc95gIHgm0ENwks6ezoHMtNBDv5NpD4kZOt3rckVtc2TNrFfHdbtpCHIzg2WdJrYaXH
 /xSfomvFi7E/T0tCpoUNe3K5d8eLKhwMpXTlLq8hD5ihVf1MmjEnX8Zrc+Q4dl9OF8vp
 voHqwV0OwDc47bzLAoCx81iHGZpBIJjGrkq9aPtBI615OOd+WVm9zHE2PC2D1k+vGxR4
 4PUF1/lLiew7UxLBcxzFkhUWuY57TX2Ka8I2YZ+NgeOlXACnlaJC6D7tFhA87pTU3x45
 HmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nuqJ0vbClL23gGoYcppi0FrFy7e9Hz/yNcjMSMNBxqE=;
 b=rk2qLqSu4hUS+99oP1Yhx7J+2u9in5L4DZ1IlzZCkriUZEFAbST2GExpDZWH3t2tYH
 DDENDwhjt0+Sx+/gN3mA6ELPzB+XtqME2FY6n2esx8W6aCNWIMbSzMqpwh5h0kwfB9wG
 XP179jJr/p8qYO7H2ePqTTaX5Ro7tjn24JHuDqHmYLBrMl8qN1Jn99axgSNxcXJJacVQ
 qBRb/AU9S9YclMrFr7UIxevKOo+SsOS506bjXeqbx9ejLi/mpw9JpM+a6PfgXfWTIjrm
 /FMpFfUG2hkm2ffuAX4LSj22dVwjDaXPM2n/CrzgfleD3gxW2DuzNqHrCa7Zrs36x+gZ
 Hhew==
X-Gm-Message-State: APjAAAW4X2BKf9T0wVm09WgGAtCU74rl5yowJtib1syvPxyH/MMRZmcs
 hsgDLZXuTJnm0z2dOVL7joWEapVdnLNXiVDSL1uZFw==
X-Google-Smtp-Source: APXvYqzczwcqmzJh3GjUqnWFQGP/+Gp7RUJwV58YrFcSe+bfPCganPSc0GYA3NZbmUkPuarP338JjoXHT98NVoW0E1U=
X-Received: by 2002:ab0:2042:: with SMTP id g2mr1511287ual.19.1574254771069;
 Wed, 20 Nov 2019 04:59:31 -0800 (PST)
MIME-Version: 1.0
References: <20191118104646.3838-1-i.mikhaylov@yadro.com>
 <20191118104646.3838-3-i.mikhaylov@yadro.com>
In-Reply-To: <20191118104646.3838-3-i.mikhaylov@yadro.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 20 Nov 2019 13:58:55 +0100
Message-ID: <CAPDyKFoz3ipYBGR-6ubfqhtQVG9h16axoHNdSoo+OyNgKRs2Tw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] mmc: sdhci-of-aspeed: enable
 CONFIG_MMC_SDHCI_IO_ACCESSORS
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 18 Nov 2019 at 11:47, Ivan Mikhaylov <i.mikhaylov@yadro.com> wrote:
>
> Enable CONFIG_MMC_SDHCI_IO_ACCESSORS on the aspeed board. The read_l
> callback is used for inverted card detection.
>
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>

Applied for next, updating the changelog according to Andrew's comments, thanks!

Kind regards
Uffe


>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 49ea02c467bf..c9c1bb722368 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -159,6 +159,7 @@ config MMC_SDHCI_OF_ASPEED
>         tristate "SDHCI OF support for the ASPEED SDHCI controller"
>         depends on MMC_SDHCI_PLTFM
>         depends on OF && OF_ADDRESS
> +       select MMC_SDHCI_IO_ACCESSORS
>         help
>           This selects the ASPEED Secure Digital Host Controller Interface.
>
> --
> 2.20.1
>
