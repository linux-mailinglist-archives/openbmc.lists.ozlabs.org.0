Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EA14A3DBB
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 07:38:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnJKz6DR5z2ywd
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 17:38:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Xy2fms+A;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Xy2fms+A; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnJKY6jsxz2xX8
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 17:38:07 +1100 (AEDT)
Received: by mail-qv1-xf33.google.com with SMTP id h16so11935435qvk.10
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jan 2022 22:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZmJmzbYJdSz7NylPj17Q8RGKEXMSub9wumTNZ+fAg8U=;
 b=Xy2fms+AqaxyVKZTW4zyYJ+aN04U3xviqKmYn35+s3p2unWf9DXdGnXBcb4lxdu8DH
 AtaPGxa8K+opiTflXIZWKZvl3sqaMg6BcftR99n57Xyny3cmZneGpR/jh4q2pP5/+2BB
 9pFtmZbmfXUuWQAhXBfW48I5A4SYS5fIqTL80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZmJmzbYJdSz7NylPj17Q8RGKEXMSub9wumTNZ+fAg8U=;
 b=7U6b54DNFjbMWKWLycHGXPeC4Y5uU39Gj8WzwoLjn5s+eiaqSumB5g1kC1d98fO9dQ
 tmLO+g2dKyv86pCinAhyjKu3vvt/i7xiKrTE99lpbCxKQwsbkVa8IxGlDSdq8G4U5WVU
 o6PeDKvT1Is4C/J70S+ef3sO2hHskpEmvRruhy1Z5pDrcJgAgCUd1WMKqrPzCgeSv4/C
 FluER0K0uvotTDVFOc7qJYeVGLJyf1TM7nYClHirdWs5zHa7YvdJKz0elVxc1IpUg9nY
 S+xAghxdxNxiD98d+2ebV0AM/fudVQtPmJvkn2YB1V1ZVq0JaY9HQdGMqgf9yuE1C776
 OjIg==
X-Gm-Message-State: AOAM533Sm8xADnLiaAyVcdaAcwNaZ4nuN+Z5gAV8BaG7rj5wzIvnhTNr
 /UH5W7KHgIiYjDO7jsUCajPZ4l7aWb1BjphfJas=
X-Google-Smtp-Source: ABdhPJx1020Led5CofoA3z+V3gy1g+2fDQqlgS0Xv7rjVb+e3dfv58hq0e7zyqgRD60MdN/0J1KfxNEzSFCbgMZezwk=
X-Received: by 2002:ad4:5f89:: with SMTP id jp9mr16312804qvb.130.1643611082608; 
 Sun, 30 Jan 2022 22:38:02 -0800 (PST)
MIME-Version: 1.0
References: <20220128221054.2002911-1-j.neuschaefer@gmx.net>
In-Reply-To: <20220128221054.2002911-1-j.neuschaefer@gmx.net>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Jan 2022 06:37:51 +0000
Message-ID: <CACPK8XfMm7jJ9QYOBr1HiR_22xPEzx9MZXO_CX7MpQt2QAVSUg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: wpcm450: Enable watchdog by default
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 28 Jan 2022 at 22:11, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.n=
et> wrote:
>
> The watchdog timer is always usable, regardless of board design, so
> there is no point in marking the watchdog device as disabled-by-default
> in nuvoton-wpcm450.dtsi.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

I assume this makes it always available for rebooting the system too?

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts | 4 ----
>  arch/arm/boot/dts/nuvoton-wpcm450.dtsi                      | 1 -
>  2 files changed, 5 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts =
b/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
> index 3ee61251a16d0..1ae7ae4804275 100644
> --- a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
> +++ b/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
> @@ -77,7 +77,3 @@ &serial1 {
>         /* "Serial over LAN" port. Connected to ttyS2 of the host system.=
 */
>         status =3D "okay";
>  };
> -
> -&watchdog0 {
> -       status =3D "okay";
> -};
> diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/n=
uvoton-wpcm450.dtsi
> index 93595850a4c3c..b9b669cd632f1 100644
> --- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
> +++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
> @@ -81,7 +81,6 @@ watchdog0: watchdog@b800101c {
>                         interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH>;
>                         reg =3D <0xb800101c 0x4>;
>                         clocks =3D <&clk24m>;
> -                       status =3D "disabled";
>                 };
>
>                 aic: interrupt-controller@b8002000 {
> --
> 2.34.1
>
