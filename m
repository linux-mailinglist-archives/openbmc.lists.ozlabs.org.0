Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB24D2F72DB
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 07:27:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHB7X6B1BzDqLv
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 17:27:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=eeFvV3wu; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHB6r5S81zDq6B
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 17:27:16 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id e15so5361879qte.9
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 22:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zuk+aACvgDhHkyiYnk+rXr/ofxdk9eIIRwDep4lEDwo=;
 b=eeFvV3wucp9oBOYmfAA9kcSCj/nqIACn+jaXEdcuND4/cI+zkFTn7u1kiCT4VNkdWa
 Q6JVo78k5aBb5adNUUV/RGNtvwbrh9Xo0dq5gsM+6zueDupu615E/Mez5cm3gL1kWaSG
 CQmrhGhNGg513ThGpFF76jNQPagXyYfE1VSQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zuk+aACvgDhHkyiYnk+rXr/ofxdk9eIIRwDep4lEDwo=;
 b=fT+3PJFb2Y6UkbVzGEJAcetvyXncEInJNqQ9AthOfSZpjSWB0qrGC6BuPwl2aPZsDj
 IfGOwzbxt+898XGFQNzETWb2wquOIregFz8L2rUuSim6UmzU6Pa8o4148rbY6DV9dV5Y
 0sHn/Z8qq627nNFXcBNYQMqzvDNYEf2xRttq0duQMS3UxrGDtJUWY3nv8u2ryH0Tha/F
 28vmZLFSj4592qwtYy32dIXuaEM8egDfyI0m9a9Fk4owkEEntk59G6QI2mafeepRVyDX
 AbobzDgdtJjaXiEs5X2takB2wa/ppm3w8vJ1U+x90zPgVMerpxi4wMo8evMqGTbkxH7S
 J8GQ==
X-Gm-Message-State: AOAM530V98M3X8x0bjenNcd0ugCL6+hUlqskGkUuEr4NNHR9wlMLkf4+
 5T6W+PxISLhaLw00CAMAGTsTQ5uKrm0Ztpn1tT4=
X-Google-Smtp-Source: ABdhPJxfD1NNCbhI3qM/2lorrxIT1RS3+XxUriJcvoIhb+4n1KxY0Fny2DLyCLIfwyMGKvKH+pK1Lu2Ey/cFuiKa9bA=
X-Received: by 2002:ac8:4d4d:: with SMTP id x13mr10335740qtv.385.1610692034211; 
 Thu, 14 Jan 2021 22:27:14 -0800 (PST)
MIME-Version: 1.0
References: <20210113200010.71845-1-tmaimon77@gmail.com>
 <20210113200010.71845-5-tmaimon77@gmail.com>
In-Reply-To: <20210113200010.71845-5-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 15 Jan 2021 06:27:02 +0000
Message-ID: <CACPK8XdbzdCD01tgPnwE8=LnhBpPJPJ24X_HvMK2dRtqymk9qA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v3 04/12] dts: npcm750: add fuse regmap
 support node
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 13 Jan 2021 at 20:00, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> index 7eee4145127f..455a96b23b85 100644
> --- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> +++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> @@ -82,6 +82,12 @@
>                         "simple-mfd";
>                         reg = <0x801000 0x6C>;
>                 };
> +
> +               fuse:fuse@18a000 {

Convention is to put a space after the colon. No need to re-post,
but remember this for future patches.


> +                       compatible = "nuvoton,npcm750-fuse", "syscon",
> +                               "simple-mfd";
> +                       reg = <0x18a000 0x1000>;
> +               };
>
>                 scu: scu@3fe000 {
>                         compatible = "arm,cortex-a9-scu";
> --
> 2.22.0
>
