Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A27168CE16
	for <lists+openbmc@lfdr.de>; Tue,  7 Feb 2023 05:16:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9qZl31z0z30QD
	for <lists+openbmc@lfdr.de>; Tue,  7 Feb 2023 15:16:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=BKjGp38t;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=BKjGp38t;
	dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9qYP2jMpz3bP0
	for <openbmc@lists.ozlabs.org>; Tue,  7 Feb 2023 15:15:37 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id ud5so40080485ejc.4
        for <openbmc@lists.ozlabs.org>; Mon, 06 Feb 2023 20:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mVafa7A4mLTORCN1qBHD1Q8oFWjwUn90UMtxPuLT8/E=;
        b=BKjGp38tNOmqXRuGI0aykPE2iwIOOVomhktXrgc9nm+e/xiQNYekmJNT8CV1+JYG1G
         btuZkX54wX6+8hycbBDZUObWgC/w0tm+OMAJfD4E0uqDSFzDYcWWssu5t0pArXXraOgA
         lFLRv/2jguOIOyqoXT4qfkr2ZLQwOuZss19No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVafa7A4mLTORCN1qBHD1Q8oFWjwUn90UMtxPuLT8/E=;
        b=heh7HP0EhxmtwJ1SHPISAeK3KyW2hAsLpkLbCfd1VBXZ0U8TCvcpFFyGB1/Wt+Inyu
         jYqPf6AhkuBjwl99ZNEqj2DVKtk5GubWinHRiLLjIuhWdPn1XgbCaHQ60YjS5DixLi0H
         4yDii9S8nJgg8wSwBux87ZJvn775eGuuxpVcSGLitVid24k/1pmVTEOTBHxzHi2/1RqH
         QnlnAxH14IO4e6L+Xn4LhZvHmXHp51XXBu5OSGqxc2CNE8jtvPfUnOSFZamxQvlZN0x+
         vyvZDtTpzIld1VaV+guJHSZPx9WlJWH+kjg+YJ9diPZEeQfsgFaTUIyPrmOyIUEoi+bW
         gJYQ==
X-Gm-Message-State: AO0yUKVHJKY7gfvHf2DnYye9/RXdWUyvAE4HkjvSka3oy8IhyYJHiKMC
	qtPtFyXB17/LCSHpHd3+ehk3x01ZRBG6xj/qa+I7r8fs
X-Google-Smtp-Source: AK7set9wdvxFZX9NFSAOk4lpscqhDS1HgDBJcTMIKS+bcSq0EHsxoGLr+4IzyAGj8fEBjEKdwhMaHYD2DoLdQyF4kgw=
X-Received: by 2002:a17:906:3013:b0:885:2313:c8b5 with SMTP id
 19-20020a170906301300b008852313c8b5mr495365ejz.201.1675743336737; Mon, 06 Feb
 2023 20:15:36 -0800 (PST)
MIME-Version: 1.0
References: <20230202153203.67547-1-eajames@linux.ibm.com>
In-Reply-To: <20230202153203.67547-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Feb 2023 04:15:24 +0000
Message-ID: <CACPK8XeqOzW1mpMMgqTWiO4WjAHvvxc3Ky23AjZt5wBYHAVE0Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.0 v2] arm: dts: aspeed: p10bmc: Enable UART2
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2 Feb 2023 at 15:32, Eddie James <eajames@linux.ibm.com> wrote:
>
> The APSS can be accessed over the second uart on these systems.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  Changes since v1:
>   - Use quotes around "okay"...

Thanks. I fixed this when applying it for 6.3.

>
>  arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 4 ++++
>  3 files changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
> index e2a9a18bda57..b967665fbb91 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
> @@ -855,6 +855,10 @@ &i2c15 {
>         status = "okay";
>  };
>
> +&uart2 {
> +       status = "okay";
> +};
> +
>  &vuart1 {
>         status = "okay";
>  };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> index 1448ea895be4..456ca2830a31 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> @@ -3649,6 +3649,10 @@ &ibt {
>         status = "okay";
>  };
>
> +&uart2 {
> +       status = "okay";
> +};
> +
>  &vuart1 {
>         status = "okay";
>  };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 20ef958698ec..e1b5d44308fe 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -2352,6 +2352,10 @@ led@7 {
>         };
>  };
>
> +&uart2 {
> +       status = "okay";
> +};
> +
>  &vuart1 {
>         status = "okay";
>  };
> --
> 2.31.1
>
