Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E75F031ECED
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 18:11:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhLpL02ghz30RW
	for <lists+openbmc@lfdr.de>; Fri, 19 Feb 2021 04:11:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=BSxAOJZz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::131;
 helo=mail-il1-x131.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=BSxAOJZz; dkim-atps=neutral
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhLp65qlmz30L4
 for <openbmc@lists.ozlabs.org>; Fri, 19 Feb 2021 04:11:08 +1100 (AEDT)
Received: by mail-il1-x131.google.com with SMTP id o15so2098594ilt.6
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 09:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8yQ/zWxObiX2rUkRsp1l9aOlKO2P0V1q6ExJ8fYc9VI=;
 b=BSxAOJZzCE6YdIymgI/nnZwgXE5GvvgbV1mpoo8Z8diaoejwUpfHDrusjQuth1K+/l
 xRaf7RSj1RTJYAv3X5Tec78RSlZbNCeWyYc+oqPZteOj9pA1Ee2UmqkXZVpBECnkRrfs
 OOT5NunbqV/ZGuvrg8DHAI7J1s1v2ZzTUK02edp0NQMNI6ZwcCiw/GvlX2C0LOTeABTA
 nPxbI5bP9NBR1LVYCCBLYiNYWVKz0AernT4fBwnlw24ZHwWc33Y69waKVaB1rXpqv9Qb
 NzbwF5CMrHEQBsiNbVh28khFJpRzGwl8z5HjRJ5HnmLlGtjMDupfpjiNSLJcz8LD7M7k
 QnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8yQ/zWxObiX2rUkRsp1l9aOlKO2P0V1q6ExJ8fYc9VI=;
 b=eo0Gnc4VKGMFmNdjPuqT6XRT0R5KrSS1wok5bGAdcgGnVZhvmQ03NjgFrRzXr2q9rD
 6/oTfclpqlR7WldEhm8ctbl7Bp0MEPYhG0kdNxk1zbpjiwtlT1gEe1TXhlEvLOIJi7hg
 4NqAbE9ez2vwYrJ7F2lzN2NBCjg91HTHg1gQhwIZ0qup6EzxK69/xoPxN30uGoMyRTzi
 L12nZGsYK4KB6nWjFoeYwnyjhz841zGjiN57Yjxg/DXY9ycuOU1M/a/CT6TKVLUr0N4U
 Y1Dg0a1jhbj2xW2BJj4TNA1iLmrEV0eH9VZqpR1C2p1lsZfBf3ebwz7Ll5P3WYP30vqO
 hBsQ==
X-Gm-Message-State: AOAM532pW4QIU4mZEdpANTE6l+yXGOVF1YuB52vHR6KWNMdN79S8Dqgr
 1w9fi2wMa7/F+6g+uTpSR2E3JpxiXz409sMFR3sg8A==
X-Google-Smtp-Source: ABdhPJxEtfoENyAGsiLWovEpocXc51k4nYXe4wiW3+m+FLWcg9jEl5tgQgHwo97gzNCS0b9N3HVzK+E5z+mKUQGvut8=
X-Received: by 2002:a92:ad0a:: with SMTP id w10mr72733ilh.235.1613668263832;
 Thu, 18 Feb 2021 09:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20210218122546.3546582-1-gmouse@google.com>
In-Reply-To: <20210218122546.3546582-1-gmouse@google.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Thu, 18 Feb 2021 09:10:26 -0800
Message-ID: <CADKL2t6P4gaSUZEFgk7y+TNBRw0Lhf8mXTxzLdbe3FhGs0WH+w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout
To: Anton Kachalov <gmouse@google.com>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 18 Feb 2021 at 04:42, <gmouse@google.com> wrote:
>
> From: "Anton D. Kachalov" <gmouse@google.com>
>
> This change satisfy OpenBMC requirements for flash layout.
>
> Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> ---
>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28 +++++++----------------
>  1 file changed, 8 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> index bd1eb6ee380f..741c1fee8552 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> @@ -182,8 +182,8 @@ bbuboot2@80000 {
>                                 reg = <0x0080000 0x80000>;
>                                 read-only;
>                                 };
> -                       envparam@100000 {
> -                               label = "env-param";
> +                       ubootenv@100000 {
> +                               label = "u-boot-env";
>                                 reg = <0x0100000 0x40000>;
>                                 read-only;
>                                 };
> @@ -195,25 +195,13 @@ kernel@200000 {
>                                 label = "kernel";
>                                 reg = <0x0200000 0x400000>;
>                                 };
> -                       rootfs@600000 {
> -                               label = "rootfs";
> -                               reg = <0x0600000 0x700000>;
> +                       rofs@780000 {
> +                               label = "rofs";
> +                               reg = <0x0780000 0x1680000>;
>                                 };
> -                       spare1@D00000 {
> -                               label = "spare1";
> -                               reg = <0x0D00000 0x200000>;
> -                               };
> -                       spare2@0F00000 {
> -                               label = "spare2";
> -                               reg = <0x0F00000 0x200000>;
> -                               };
> -                       spare3@1100000 {
> -                               label = "spare3";
> -                               reg = <0x1100000 0x200000>;
> -                               };
> -                       spare4@1300000 {
> -                               label = "spare4";
> -                               reg = <0x1300000 0x0>;
> +                       rwfs@1e00000 {
> +                               label = "rwfs";
> +                               reg = <0x1e00000 0x200000>;
>                         };

I recommend just including the openbmc-flash-layout.dtsi file here
instead since that contains the common flash layout for most OpenBMC
systems.

>                 };
>         };
> --
> 2.30.0.478.g8a0d178c01-goog
>
