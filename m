Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DD14ED34F
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 07:36:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTX993KNXz2ybB
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 16:36:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Qc99wNlw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Qc99wNlw; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTX8d6vw7z2yfZ;
 Thu, 31 Mar 2022 16:36:01 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id k125so18967327qkf.0;
 Wed, 30 Mar 2022 22:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sPPWluoolsefjRE29kw2XfxgYnR3VFZ9BqTChiHjaDc=;
 b=Qc99wNlwZdznBfvr+RyTN2xb5K7b+EfmJdYLLz4irFlDLYx3JNy655578XeIj02JZs
 +nZKu+V+fyE+W0EnRMzgQ1lOA/Yyk0B6J0K6+pk8DR3rPp085P5vH1Vxa9WSVcQHlRBb
 jBiVpBoTqfaxqx8l94qrav7PSh6xOf873uvPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sPPWluoolsefjRE29kw2XfxgYnR3VFZ9BqTChiHjaDc=;
 b=r5xzqdiluv6SUwji0Ig4Tf343fnaujNFdLbDuj153AVd4HyhyIGnmKSTEePd0gw1CQ
 /r9UbaxZ828TVMiCtC8whqjfIAm693MkyuOljVF2usBglk3/aVsyg80Splqn8rBSnPkn
 RwO4f9/yA50zZLlT1BSfEpI/dWZTHchixAnFxES6zgCOFrP97xtc9bD2jNmLgPxUJtYV
 sqC1wihlDjplrkKFjczW2eVpH7qJ8ybXkmHw6yfJ8wJTJz0anhSkoAQr0MSC1rk+tPOF
 YQ1H+YTeOnuo8bAXBCT+lrFR0RZY14EGLnsJ5ZPyZ5w9cLcyA2mvMgGExxCem54Kv0Zl
 KAWw==
X-Gm-Message-State: AOAM533P9Xb/IV0YPLQN82Jm2xEit4Wcl7Op7HYhcIbtqV5+Sehq9j/c
 WASU93UcwEni0ocXRGYIGCBUHe7ev88VGJ5a4oo=
X-Google-Smtp-Source: ABdhPJxdcuy7je91kJPvXlfP/N4hkpDESw7DhNQT7hK81qPH5jv0fXFjDzghjKL72FXJlvL9etWOZlS3TWif8D3+TXQ=
X-Received: by 2002:a05:620a:2ed:b0:680:a80e:c813 with SMTP id
 a13-20020a05620a02ed00b00680a80ec813mr2213059qko.243.1648704959078; Wed, 30
 Mar 2022 22:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220331022425.28606-1-zev@bewilderbeest.net>
 <20220331022425.28606-2-zev@bewilderbeest.net>
In-Reply-To: <20220331022425.28606-2-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 31 Mar 2022 05:35:47 +0000
Message-ID: <CACPK8XeeFDSN8L89BPkV+UfGTYNiULyUPBTYso7Z7e+VEdgc4A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: romed8hm3: Fix GPIOB0 name
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 31 Mar 2022 at 02:24, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> This GPIO was mislabeled as DDR_MEM_TEMP in the schematic; after a
> correction from ASRock Rack its name now reflects its actual
> functionality (POST_COMPLETE_N).

Those are quite different functions :)

>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Fixes: a9a3d60b937a ("ARM: dts: aspeed: Add ASRock ROMED8HM3 BMC")
Reviewed-by: Joel Stanley <joel@jms.id.au>

I'll send some fixes in after -rc1.

> ---
>  arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
> index 572a43e57cac..ff4c07c69af1 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
> @@ -198,7 +198,7 @@ &gpio {
>         gpio-line-names =
>                 /*  A */ "LOCATORLED_STATUS_N", "BMC_MAC2_INTB", "NMI_BTN_N", "BMC_NMI",
>                         "", "", "", "",
> -               /*  B */ "DDR_MEM_TEMP", "", "", "", "", "", "", "",
> +               /*  B */ "POST_COMPLETE_N", "", "", "", "", "", "", "",
>                 /*  C */ "", "", "", "", "PCIE_HP_SEL_N", "PCIE_SATA_SEL_N", "LOCATORBTN", "",
>                 /*  D */ "BMC_PSIN", "BMC_PSOUT", "BMC_RESETCON", "RESETCON",
>                         "", "", "", "PSU_FAN_FAIL_N",
> --
> 2.35.1
>
