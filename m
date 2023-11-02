Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D31A7DF2C4
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 13:50:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hFuAoFee;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLkHH0lY8z3cX4
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 23:50:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hFuAoFee;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLkGf09Dsz3cQg
	for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2023 23:49:27 +1100 (AEDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-579de633419so10623357b3.3
        for <openbmc@lists.ozlabs.org>; Thu, 02 Nov 2023 05:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698929362; x=1699534162; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=widlyZwBYPlMRjGOv/8GxlBrQ6R1o+G/iEjecWXMJTc=;
        b=hFuAoFeeVkSsC+KjqX1dsleP9f++gCzADu321xpRYo3BySRbtbcfdu32fiQyqn6IHO
         CH35MVuhWYf1cTEbVdaEaWT355GjGkHYdA2OfGZ737d/zzd+FDzTXpAIXyyOPayCBnq7
         MUNqnEOxrtvnfxDzIeQCyfjiwSNm8F1SyUfzVnFY6EYTRj6Ope2fgN03ksQrQFiToYje
         Mbnj3ur+q73/XTBmrhLHNOlRhyHCFeNJRFvLj+r7Lr/FB1TFVxL8zde1zPl1Sj2D9t0s
         MgG9V8nvf564bDra02yYTk8jGpR6W7lUh8sN1GXLgf7LPN4gZQmNaMoZwcHGRpZfFV7W
         c06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698929362; x=1699534162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=widlyZwBYPlMRjGOv/8GxlBrQ6R1o+G/iEjecWXMJTc=;
        b=s71Q9Ckkl2Kg2nLAP0SKszbsC4c2xVY+HqIf2aWVpd9x5Mc6jD/C6NGBkW5oQ1hQvq
         gZvzG2zUVxF1sTpzYrTkeRuZ/jGtQmyCsb+OD1Jq04ZHnyDolYTCLy4/oGFSSmexJPy5
         DmBLfli16FdcqaYGilszYJFf+KdIRzsI6RjaPopoFWAHEpl6oN0elPMrDVTH62YFt/8H
         refu/f2JcsVdanFBzdFreTNloCVYNux9dGzXbVyoEZ9K0Fyu+Zby0q/eWC3lkuCGcqty
         9lDUsIjc0Hl6cW/4TQiXhlLgiIBfQgKWiYZrwjYAAbVx4VhH49PlgngSPyfdjtkymGV8
         HbBA==
X-Gm-Message-State: AOJu0Yy3PgnLrDPdGu+TXg/+iJ8WcFIyOickGMPQGitKGpWIDrg2Js76
	1o6935+M/po+Tz4epQo+AOjvLB4b5/LVmyPN81hd9w==
X-Google-Smtp-Source: AGHT+IHt90STRVe8je/Z5zX/p4SgI7q02TIIO9EFzScpg845KJIIMk9ZkoVKpvO0vaU75EWje+slqqI/wuSSqst9a5E=
X-Received: by 2002:a81:7e06:0:b0:5b4:2a52:d18a with SMTP id
 o6-20020a817e06000000b005b42a52d18amr4113501ywn.36.1698929362230; Thu, 02 Nov
 2023 05:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231101025110.1704543-1-jim.t90615@gmail.com> <20231101025110.1704543-4-jim.t90615@gmail.com>
In-Reply-To: <20231101025110.1704543-4-jim.t90615@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Nov 2023 13:49:09 +0100
Message-ID: <CACRpkdZgqfzti8KW25m++VG2GhU7LZCgzxeWW+uaNO7rh1kmjg@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] gpio: nuvoton: Add Nuvoton NPCM sgpio driver
To: Jim Liu <jim.t90615@gmail.com>
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
Cc: andy@kernel.org, robh@kernel.org, benjaminfair@google.com, devicetree@vger.kernel.org, brgl@bgdev.pl, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, kernel test robot <lkp@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jim,

thanks for your patch!

I saw that Andy already provided some good feedback but couldn't help
but to notice this:

On Wed, Nov 1, 2023 at 3:52=E2=80=AFAM Jim Liu <jim.t90615@gmail.com> wrote=
:

> Changes for v6:
>    - Remove bus-frequency property set
>    - Use GPIO_GENERIC
(...)
> +config GPIO_NPCM_SGPIO
> +       bool "Nuvoton SGPIO support"
> +       depends on (ARCH_NPCM || COMPILE_TEST) && OF_GPIO
> +       select GPIO_GENERIC

You select GPIO_GENERIC but you don't actually use it.
If you were using it, your code would be calling bgpio_init()
and it does not.

Yours,
Linus Walleij
