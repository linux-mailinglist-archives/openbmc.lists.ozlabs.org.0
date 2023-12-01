Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A16D801822
	for <lists+openbmc@lfdr.de>; Sat,  2 Dec 2023 00:52:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=2LoJaLJd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShqcD3ckHz3d8d
	for <lists+openbmc@lfdr.de>; Sat,  2 Dec 2023 10:52:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=2LoJaLJd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Shqbh0NNLz3c5Y
	for <openbmc@lists.ozlabs.org>; Sat,  2 Dec 2023 10:51:58 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a18f732dc83so408246866b.1
        for <openbmc@lists.ozlabs.org>; Fri, 01 Dec 2023 15:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1701474706; x=1702079506; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pf2tnTinXuxDyl3nKRHwSTUjqBMUY0SHJXZlyfM0i1U=;
        b=2LoJaLJd1e+Xtc9+MmEFZVZWw/TEroQ9W5Tf3igqNEteKJJkIRcWe83Jpl4zlsTr6g
         fLjSU5iDrf77AOrNVDYE1EMRxRjaLQ+A3ZmYErAwyWG7DcaoBmUh9wrakjT4hBck7cRs
         Ue3Pgi7Yfvan8zZoVxMf4XuvQLCjFjrZ0rUgH+yqkKhPdA8uzCRgTqL3skrCLQJGXbuX
         KMxeMejq/hRGNNUV+V99LJVwUbRJNEjNg20MkrQJbIxg9TSNbnfygcPdeC87lt6FY7Sq
         CabG/am083fdRa0zAXxNabpY6uV94B97QTYMfUGTE+bc3qrRNfpEqHvQitemoybP0E1j
         SDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701474706; x=1702079506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pf2tnTinXuxDyl3nKRHwSTUjqBMUY0SHJXZlyfM0i1U=;
        b=cdAz3GaYRGE0kzGR2HpqdAdjjm7CJrRiYdb6aPIwoip3VJepNYMwGQPhoPitrWNQ0r
         9VlFgFXMve+P1VHIHurHhsd1Oo29a+vx+Xz6skcR4nNyCSxuj2DZBCRd7Gz4LCG97noD
         1Lhg63LWZQfGHUIkuTTYActbRvRpaQkTbfcxsGp1x46k3LpCn7rG+Zbu/bEbH2O6evHI
         YF6rLrhA7Ce1RqADq4TeCttqq0kteR6i7xxOdXrXk28UHg/YkPbXH/cf6Q3rBOyY0cNs
         b/WYyTNbSa3PqjVFOhQcYj6U0hywUGp7SbT1z2g6airJejSu1wRukTig+uj1GoRk8JDC
         1wfw==
X-Gm-Message-State: AOJu0Yyx3FXamfJlmi2WLcRPGimSZ154usxA1U9uwshn7+vMbpxis58+
	bdJC1fGDVsdhusjirMmjJX9VlUpzygA6QZr/ZVXTpQ==
X-Google-Smtp-Source: AGHT+IEEt/ftI+tc+thqQKSQdbSez4jIsu22rycQSypQMieda1m4MfxMRf1pPNqMiLPMrES/RloO4iJVDQ+c9fzJqrM=
X-Received: by 2002:a17:906:5193:b0:a1a:5cbf:4b5c with SMTP id
 y19-20020a170906519300b00a1a5cbf4b5cmr289954ejk.15.1701474706293; Fri, 01 Dec
 2023 15:51:46 -0800 (PST)
MIME-Version: 1.0
References: <20231102002453.1299195-1-william@wkennington.com> <20231102101009.15104-1-william@wkennington.com>
In-Reply-To: <20231102101009.15104-1-william@wkennington.com>
From: William Kennington <william@wkennington.com>
Date: Fri, 1 Dec 2023 15:51:35 -0800
Message-ID: <CAD_4BXgmCdc_H-XfmGnW3fa6H=cbONma6QzUiofNVZWJtcBwOg@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: npcm: Add CPU hotplug callbacks for kexec support
To: tmaimon77@gmail.com, tali.perry1@gmail.com, avifishman70@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: openbmc@lists.ozlabs.org, Brian Ma <chma0@nuvoton.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Nov 2, 2023 at 3:10=E2=80=AFAM William A. Kennington III
<william@wkennington.com> wrote:
>
> From: Brian Ma <chma0@nuvoton.com>
>
> Add callbacks required for kexec to function. The NPCM7xx does
> not expose controls for powering down CPU cores, so just wait in idle
> loop.
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
> @@ -69,10 +69,27 @@ static void __init npcm7xx_smp_prepare_cpus(unsigned =
int max_cpus)
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
>  static struct smp_operations npcm7xx_smp_ops __initdata =3D {
>         .smp_prepare_cpus =3D npcm7xx_smp_prepare_cpus,
>         .smp_boot_secondary =3D npcm7xx_smp_boot_secondary,
> +#ifdef CONFIG_HOTPLUG_CPU
> +       .cpu_die                        =3D npcm7xx_cpu_die,
> +       .cpu_kill                       =3D npcm7xx_cpu_kill,
> +#endif
>  };
>
>  CPU_METHOD_OF_DECLARE(npcm7xx_smp, "nuvoton,npcm750-smp", &npcm7xx_smp_o=
ps);
> --
> 2.42.0.820.g83a721a137-goog
>'

Mind taking another look? This should be updated accordingly.
