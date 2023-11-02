Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 568A67DEE42
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 09:39:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ca96q/W+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLck31fRQz3cW9
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 19:39:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ca96q/W+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLcjT67R0z2xQB
	for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2023 19:38:51 +1100 (AEDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d9ac31cb051so680169276.3
        for <openbmc@lists.ozlabs.org>; Thu, 02 Nov 2023 01:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698914328; x=1699519128; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MX2gk/Cxl4wXLQKYI24ffJCkT4RlP9TmZdj1aNtUnYE=;
        b=Ca96q/W+N6oTSOcWi5i0n826yy9/TOmOk1degywxASNOLGPE3f+GAqv2icB7rL8P1C
         WxVqR4sDe8x2eepqIq6sfPJeBr5yckfKVQcjsh4HqDKc01Mu59Hb3s//h1GreZBrAh/0
         dLQKGIZq2ti7VkjrnEcPENUiM7EbKp0pKZY98OeUZn3nhh0lpQbcs088oFxAhMkOVLYd
         3bTF1g2SnEbFOHA/a1Ioh95ICZDBKF9bOawgKKd28+LnSUyvFe5rj5PFgsBg+NcxmowH
         UgT2cBMV5FonAXVKAIr904ICZt0KKFDV1AuxNgZOM8uhaFNThVi5s8w3K3hvmn/YRlj4
         5Yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698914328; x=1699519128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MX2gk/Cxl4wXLQKYI24ffJCkT4RlP9TmZdj1aNtUnYE=;
        b=ig3VhsQ65xiR2q0stUOclbAMyg70ruSe/xqeWz6Ovu2QfXR9yTKM9TUTEiHIkrkvsE
         z3fa58uqAtH+TY1Nbpxe+B2rs5KLE0tHq6m0f/yZLT8FGolk4PpK5k0hHqmyXWV+is9H
         6/fbXHtg4qVuPXk+gXajVl4WPkwiMpHeM7Ofq0obuJm1RgbGf9AzJfZbGuVyrjcT9ULB
         Dje+lwJUgFAiRWbiMnSxh4Ny/vI997hGo96NbfE3LiDBloDT1yowYz/SSxPlBrA918hF
         A1iiD2EINfSrVcv+zgljewiB8uCvuvW3nh9Dhu3ngMM81kOvVOhR+VBFpATXtZESHoW6
         JGtQ==
X-Gm-Message-State: AOJu0YwAw1S45CwNcUhP2yWhI10NBmoGRaStUHMT+GpivI7Gt2dA2iIu
	qkb7hTlMtnBFvcMgwvS1XypA1WmoguV2CWYyATs=
X-Google-Smtp-Source: AGHT+IFYJvDIrZEGLlekYy5y70QXRpdy1PHWPIXOwlqF+XaGVqQHg0xMqJX9WCqjGrTRphgeM4+PuY81okxrDdAmlqM=
X-Received: by 2002:a25:e753:0:b0:d89:aa7e:aed9 with SMTP id
 e80-20020a25e753000000b00d89aa7eaed9mr16130762ybh.23.1698914327935; Thu, 02
 Nov 2023 01:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231102002453.1299195-1-william@wkennington.com> <20231102005321.1303809-1-william@wkennington.com>
In-Reply-To: <20231102005321.1303809-1-william@wkennington.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 2 Nov 2023 10:38:36 +0200
Message-ID: <CAP6Zq1ig9hadeWATYVgzZkhmsU3qe6Se+hwU6rSjvnGr0OmvMA@mail.gmail.com>
Subject: Re: [PATCH RESEND] ARM: npcm: Add CPU hotplug callbacks for kexec support
To: william@wkennington.com
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
Cc: Brian Ma <chma0@nuvoton.com>, avifishman70@gmail.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi William,


On Thu, 2 Nov 2023 at 02:53, <william@wkennington.com> wrote:
>
> From: Brian Ma <chma0@nuvoton.com>
>
> Add callbacks required for kexec to function. The NPCM7xx/NPCN8xx does
> not expose controls for powering down CPU cores, so just wait in idle
> loop.
This patch is related only to NPCM7xx please modify NPCM7xx/NPCN8xx to NPCM7xx.
>
> Signed-off-by: Brian Ma <chma0@nuvoton.com>
> Signed-off-by: William A. Kennington III <william@wkennington.com>
> ---
>  arch/arm/mach-npcm/platsmp.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
> index 41891d3aa124..6cc7b5894f08 100644
> --- a/arch/arm/mach-npcm/platsmp.c
> +++ b/arch/arm/mach-npcm/platsmp.c
> @@ -69,10 +69,27 @@ static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
>
>         iounmap(scu_base);
>  }
> +#ifdef CONFIG_HOTPLUG_CPU
> +static void npcm7xx_cpu_die(unsigned int cpu)
> +{
> +       while (1)
> +               cpu_do_idle();
> +}
> +
> +static int npcm7xx_cpu_kill(unsigned int l_cpu)
> +{
> +       return 1;
> +}
> +#endif
> +
>
>  static struct smp_operations npcm7xx_smp_ops __initdata = {
>         .smp_prepare_cpus = npcm7xx_smp_prepare_cpus,
>         .smp_boot_secondary = npcm7xx_smp_boot_secondary,
> +#ifdef CONFIG_HOTPLUG_CPU
> +       .cpu_die                        = npcm7xx_cpu_die,
> +       .cpu_kill                       = npcm7xx_cpu_kill,
> +#endif
>  };
>
>  CPU_METHOD_OF_DECLARE(npcm7xx_smp, "nuvoton,npcm750-smp", &npcm7xx_smp_ops);
> --
> 2.42.0.820.g83a721a137-goog
>

Best regards,

Tomer
