Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F093338224
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:17:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxRGg0xrcz3cKS
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:17:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=d7FbfNAM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=d7FbfNAM; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxRGS0zfvz2xZv
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:17:35 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id c6so2577112qtc.1
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 16:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uh5yw6HwW/I905m2FRYwOAOzXFvrquoBLmw1eWMsAdI=;
 b=d7FbfNAMpyEOVUHQBe298TnN3ZpxcOPUbtx1dfCe8NRwhB3j3fUbKumvvWYmVCX3J7
 wh8E2+Ne4+BjLF0021cvYTwev3OhAKseZKrBkwR2zGlLbaCB1KupqyisqUWI9F6xI/+w
 U81/CvWOK1B+llCwSUqi4pGJZK5e/LNFzBS54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uh5yw6HwW/I905m2FRYwOAOzXFvrquoBLmw1eWMsAdI=;
 b=YSBFuFrHrecOJAMV6VjVnX9WxnuWK7adBQ0VlaZbJ3RmIlDCILNTP0KI8WGJbjo4pF
 Bp2gD4KrO5UU4mQ3IdUWy9809igeQoC7ysJ/xINgCAtSHHTH7GlubWJ238nWDJMio4Rl
 LBql7Mo816gDE/xTjO8AB81MgtDcetht7wPXRc3FbLUHRWs+Ikr9eGhTP+RBIhC+4Cil
 4V06G9LEDlVjQD+n4+GsKm8Wgp8KKz+rx6UbtyyXVkH8w1iX5sAxJ14qiDsB398vLWCz
 ZrqECS5TdTDI5/LtYF9BqLv6h5xR+r9awbLxLVsJLAQ2LAYd35E1Hwtybi66JhDu/VX+
 YP6Q==
X-Gm-Message-State: AOAM5311waK90+5zERunjnjUMVyEUvGhM2Kg8BByHEIPigAFTQ+n2fnU
 P8658WxxiyYzSEbA2QPCfxFvj3yJya6JDtCoybjN5B9NYCk=
X-Google-Smtp-Source: ABdhPJwyJRyx9eaZI3MQkstODrr6uqGU2wb/gtljikOa/GeCMHUTJky8JqVJcEeW/EiynolfOyl6hNHdRNvd1U1aIH8=
X-Received: by 2002:aed:2ee7:: with SMTP id k94mr9464667qtd.135.1615508252794; 
 Thu, 11 Mar 2021 16:17:32 -0800 (PST)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-13-eajames@linux.ibm.com>
In-Reply-To: <20210308225419.46530-13-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:17:20 +0000
Message-ID: <CACPK8XcVT2q8KUb-mWtV0qA99A85Qxy1fNsS-nsAGpw=0jryWQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 12/35] ARM: dts: aspeed: rainier 4U: Fix
 fan configuration
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

On Mon, 8 Mar 2021 at 22:56, Eddie James <eajames@linux.ibm.com> wrote:
>
> The 4U fans didn't have the correct properties since the fan nodes
> were redefined. Fix this by referencing each fan individually and
> adding the differences to the 4U fans.

Was this commit message for a different version of the patch? It
doesn't quite make sense to me.

If you go ahead with the common device tree approach, you could
consider only adding the dual-fan-tach property to machines that
support it (or not, depending on the common case).

>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
> index 291f7d6c9979..f7fd3b3c90d0 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
> @@ -22,16 +22,30 @@ power-supply@6b {
>
>  &fan0 {
>         tach-pulses = <4>;
> +       /delete-property/ maxim,fan-dual-tach;
>  };
>
>  &fan1 {
>         tach-pulses = <4>;
> +       /delete-property/ maxim,fan-dual-tach;
>  };
>
>  &fan2 {
>         tach-pulses = <4>;
> +       /delete-property/ maxim,fan-dual-tach;
>  };
>
>  &fan3 {
>         tach-pulses = <4>;
> +       /delete-property/ maxim,fan-dual-tach;
> +};
> +
> +&fan4 {
> +       tach-pulses = <4>;
> +       /delete-property/ maxim,fan-dual-tach;
> +};
> +
> +&fan5 {
> +       tach-pulses = <4>;
> +       /delete-property/ maxim,fan-dual-tach;
>  };
> --
> 2.27.0
>
