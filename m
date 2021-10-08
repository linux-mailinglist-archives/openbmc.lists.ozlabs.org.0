Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E232E4263A2
	for <lists+openbmc@lfdr.de>; Fri,  8 Oct 2021 06:23:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQZmk5PDSz2ypj
	for <lists+openbmc@lfdr.de>; Fri,  8 Oct 2021 15:23:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VzzPzDQV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32;
 helo=mail-qv1-xf32.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=VzzPzDQV; dkim-atps=neutral
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQZmG28qkz2ynk;
 Fri,  8 Oct 2021 15:22:37 +1100 (AEDT)
Received: by mail-qv1-xf32.google.com with SMTP id cv2so5626989qvb.5;
 Thu, 07 Oct 2021 21:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hzFQ+A2U60uu6SvNGVBqAvYNQ5Q6B46iZBnqQlLHj1M=;
 b=VzzPzDQV+Rnew/7Wal3mIc7Cbs/MJZaFsvG+EA/fmz8X1DnTu47KPTloiCw9NuE6Gy
 1DktJGo4aniRIVQxyyVlDS8t0dGFDvNXpgs7sQ7ZxkMHIKFCNo8QMXXHqv4fYi+jZBc+
 7rbBms8EVfe7ED0JUGB/W7nhsqqw4+zPrEhio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hzFQ+A2U60uu6SvNGVBqAvYNQ5Q6B46iZBnqQlLHj1M=;
 b=O/Euw98wn9olXdOLlfVHkbVOfvU2Z9+TYpsuzM3zJ4XeVByEhQosMI+6HZPS/EzO9p
 H1b76idVoUukqMGqAnb3OAhV1qVzx/1Dg3fQSKFHJqmc/+9c3+wj2N38W6tejDfQmhxd
 TAO/E67V28z2opPrKRORSs3tmKLeBvo39YWPeHeN0xFU3UoHFGpZFOKTVgONI7MzKqa1
 KghRw7fHwp7y7hM4hXZQV03z8ucBKQ8eL0HObChUZYdqji+Y8xU8zMpFGy2kE/3uJmzq
 GJVbmRGXMd/Dz3RRQTMrw44qfEA64JNzKaopElSXjEIjDaQdg6XZdjcc5/RrfemhEEJA
 ztWQ==
X-Gm-Message-State: AOAM532DMR5FbeJmlI0sfSmPbnM06lLbEJfgTDLObhzcmtKU1o0tKHh6
 YL7g5yMngOoCd7q1ktSdPPPbVxj/M+NeiDoPI+0=
X-Google-Smtp-Source: ABdhPJyn7kxRjcwMEZhm6yPesmo9KHZuxqioSEsVuMTVQFDf85q7ttZJWPAo9Qq9ejrNShFgysFVRFukeJu/CuenlDU=
X-Received: by 2002:a05:6214:98d:: with SMTP id
 dt13mr7861750qvb.13.1633666953691; 
 Thu, 07 Oct 2021 21:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211005192226.213539-1-anoo@linux.ibm.com>
In-Reply-To: <20211005192226.213539-1-anoo@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Oct 2021 04:22:21 +0000
Message-ID: <CACPK8XdnMfDD6FHOuwyxz5S-wzaY1uSBEso6ov6OKQ0r2H7cTg@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: dts: aspeed: rainier: Add power-config-full-load
 gpio
To: Adriana Kobylak <anoo@linux.ibm.com>
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
Cc: Matt Spinler <spinler@us.ibm.com>, Derek Howard <derekh@us.ibm.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Adriana Kobylak <anoo@us.ibm.com>,
 Eddie James <eajames@linux.ibm.com>, Brandon Wyman <bjwyman@gmail.com>,
 shawnmm@us.ibm.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Adriana,

On Tue, 5 Oct 2021 at 19:22, Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> Add the power-config-full-load described in:
> https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md#power-config-full-load
>
> The power-config-full-load gpio is designed to be used to specify how
> many power supplies the system should have, in rainier it is 2 or 4.  If
> enough power supplies fail so that the system no longer has redundancy
> (no longer n+1), the hardware will signal to the Onboard Chip Controller
> that the system may be oversubscribed, and performance may need to be
> reduced so the system can maintain it's powered on state.
>
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>

This looks good. I think the name is much easier to understand now.

I notice you've dropped all of the other names. Do you not need them?

It would be great if one of the people you cc'd could provide a
reviewed-by before I merge this.

Cheers,

Joel

> ---
>
> v2: Update commit message.
> v3: Updated gpio name to power-config-full-load to match design doc.
>
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 33fae8ad1305..10bde77fb847 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -1998,6 +1998,19 @@ eeprom@51 {
>                 reg = <0x51>;
>         };
>
> +       pca_pres3: pca9552@60 {
> +               compatible = "nxp,pca9552";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio-line-names =
> +                       "", "", "", "", "", "", "", "",
> +                       "", "", "", "", "", "", "power-config-full-load", "";
> +       };
> +
>         pca_pres2: pca9552@61 {
>                 compatible = "nxp,pca9552";
>                 reg = <0x61>;
> --
> 2.25.1
>
