Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F28193324
	for <lists+openbmc@lfdr.de>; Wed, 25 Mar 2020 22:57:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nhmR6WQFzDqdm
	for <lists+openbmc@lfdr.de>; Thu, 26 Mar 2020 08:57:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=D9BosZr4; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nhlr5RHBzDqZj
 for <openbmc@lists.ozlabs.org>; Thu, 26 Mar 2020 08:56:40 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id j4so4349727qkc.11
 for <openbmc@lists.ozlabs.org>; Wed, 25 Mar 2020 14:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3DJBb30YTNEuoXV4EXMdX78mkPhNA4b2CMoNJwy6kJ0=;
 b=D9BosZr4X5JP+1jcxC45/rFqtBJCrYhALe+BfMWpQPz0jFZt5Fiv8B7w63UDrG3DZA
 DcdnRPL1teG6AbE4qXQYH8qiAlG5LZ7jVOX1wbz+wCZhuY17A+2vIx4nmrAfVaXl8N6E
 uhgnuvmdOVUIQ89UGWGyTw+AQSBm62tNvxOQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3DJBb30YTNEuoXV4EXMdX78mkPhNA4b2CMoNJwy6kJ0=;
 b=JsgzpwuKQaH9bMIXNCNc2esefJw2V0fRz9m6dnK6kDj6fvTAXo00ulg9zRqdHk0FM2
 oo//q4lQODVMHhVzh9ajyypxYIaS0pnvkXGsODldO4lVImessVRdqd7RJxVipBMoBmcP
 hQBOCaFBYo1rAgsfSUjEabA9ZZyhvxhAUU/tKS7++vyQ63B/ifiLCcKAJ4cfrs6vrY5E
 iLWLdWDVxRHEMktVtD8eQdemcwZJL/Onxgk4tBjQMnD094ftZvv26tw1+ub2NfcAokQg
 hrjTcKBUl++tu9BNXvfiIe3sU0ApBgcQTgCmqCMKUUZrUX8E4QE9W5wTY1E/w3II1uLY
 05xg==
X-Gm-Message-State: ANhLgQ3Ro+bnFIe/E2+2cjaETXXbGRHzcYdoj9Q/gSC8OnUEjNM4fgnP
 YlXRTgJvav5rVa7UhY7R2v0oIwDC9bJD5dZsm+Q=
X-Google-Smtp-Source: ADFU+vsxeuFyddH5gfPwI3jRspDWYf3rG9kFz2QmKx7nFIxoOiAy3LA0ouJ4PSmwY+d+WU7SM6T3fIwuLXHv/Rcks+E=
X-Received: by 2002:a37:61d0:: with SMTP id v199mr5074307qkb.292.1585173398036; 
 Wed, 25 Mar 2020 14:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <1585171587-14081-1-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1585171587-14081-1-git-send-email-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 25 Mar 2020 21:56:26 +0000
Message-ID: <CACPK8XeKR5qt8WvAtxhhajiXMxFd=SMPuzWUOeGh5EhVv1Kw_Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4 v2] ARM: aspeed: ast2600: Select timer
To: Eddie James <eajames@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 25 Mar 2020 at 21:26, Eddie James <eajames@linux.ibm.com> wrote:
>
> The AST2600 also uses the FTTMR010.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
> Changes since v1:
>  - Add back HAVE_ARM_ARCH_TIMER which is apparently necessary to boot...

We want to use the arch timer. Aspeed recommends not having the
fttmr010 driver loaded at all, and just using the arch timer. The
problem with that is the kernel decides that it can't enable hrtimers
with just the arch timer, so in the past I was working around that by
enabling the fttmr010.

Another possibility is to use the always-on property in the device tree:

Documentation/devicetree/bindings/timer/arm,arch_timer.yaml

  always-on:
    type: boolean
    description: If present, the timer is powered through an always-on power
      domain, therefore it never loses context.

Can you test adding this, but having fttmr010 disabled?

Cheers,

Joel

>
>  arch/arm/mach-aspeed/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
> index 693cbdd..129bc19 100644
> --- a/arch/arm/mach-aspeed/Kconfig
> +++ b/arch/arm/mach-aspeed/Kconfig
> @@ -39,6 +39,7 @@ config MACH_ASPEED_G6
>         select CPU_V7
>         select PINCTRL_ASPEED_G6
>         select ARM_GIC
> +       select FTTMR010_TIMER
>         select HAVE_ARM_ARCH_TIMER
>         select HAVE_SMP
>         help
> --
> 1.8.3.1
>
