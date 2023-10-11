Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFBA7C4778
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 03:50:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VRYoQMYn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4whr4W12z3vXH
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 12:50:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VRYoQMYn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4wgr0tQcz3dhk;
	Wed, 11 Oct 2023 12:50:00 +1100 (AEDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9b29186e20aso1072006366b.2;
        Tue, 10 Oct 2023 18:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1696988996; x=1697593796; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LO/vJrNP2TpMz42rqukb2IJJCeqp32FfF1/7XGzp3yw=;
        b=VRYoQMYnQ43kvZq0I5lpCAeqfboT1qLrLvWoVgiHypIpxCWPFNF9/ROH7VeaySR3Br
         QEBw2caqYa5st37GF8Fr36yPVRC7vxiNt4izkuq5vOME66LcP+QGZkexB5oYbCkKZ5am
         Z/LRnw/pakWd9R2UESBIY7w17t8+NSlECgyrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696988996; x=1697593796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO/vJrNP2TpMz42rqukb2IJJCeqp32FfF1/7XGzp3yw=;
        b=c0yiuQUZuV/IZfptE6IVTCCFDzkJm9NTovgtlH82+wFsAXSOvancs1puFrTNXEm8Bd
         89y3WJLwNrQBXKB5q3FIRSEMLQ8TUqX4NQ/SJrGpGyQ5DVg3+B/NS8+dBZ8D28cPogYw
         SaXqxOYM4YknNyHKB/gvja9K6/WT5Yg43/mXeP8o8gFdSWtlzE0indG21R2+A8YIglTd
         EJQUN7vRHp04oOyQ6dZ8DpqrZHdZc11WuKu7I4o6ySsQCGFF7WuC8kAHQYw29KfAnitI
         +k5PLRPziW+oZOR7qpKTg3ruVMZ/qC0CAcxurSUkTc2J/xBh7nTfQzTWvE4W4Ujdzm4k
         KMfQ==
X-Gm-Message-State: AOJu0YxA8ta8RM3Tu+E6Bkc4SCB/SkHzOKDm83TVXUk+xY/njbMwDkDj
	257KS8m8yC4pvTsx96TV3styzDbsRjN2ctT9U1Y=
X-Google-Smtp-Source: AGHT+IENtIO4uRrRVxLj+GzOepLQkLMK0qxFFO24siVqSmqpcrcJ7ieHXx0nNMhyFPDGj+jIXrGioxzcX3zlg33/eMo=
X-Received: by 2002:a17:906:3f04:b0:9ae:5568:b6a8 with SMTP id
 c4-20020a1709063f0400b009ae5568b6a8mr19965720ejj.10.1696988995731; Tue, 10
 Oct 2023 18:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231005035525.19036-1-chanh@os.amperecomputing.com> <20231005035525.19036-4-chanh@os.amperecomputing.com>
In-Reply-To: <20231005035525.19036-4-chanh@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Oct 2023 12:19:44 +1030
Message-ID: <CACPK8Xcby1Oy0ksP9GQjUi8TNg77bw+HJMqgVujM6dABvT_ViA@mail.gmail.com>
Subject: Re: [PATCH 3/7] ARM: dts: aspeed: mtjade: Add the gpio-hog
To: Chanh Nguyen <chanh@os.amperecomputing.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 5 Oct 2023 at 14:26, Chanh Nguyen <chanh@os.amperecomputing.com> wrote:
>
> Add the GPIOR5 as a gpio-hog with output high so that can
> power the OCP card once the BMC booting.
>
> Add the GPIOAC5 as a gpio-hog with output high to notice
> the BMC state.
>
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>

Could be two patches as it does two different things, but not worth
re-spinning just for that.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts   | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
> index c87be433bdd0..8ab5f301f926 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
> @@ -805,4 +805,18 @@
>                 output-high;
>                 line-name = "i2c4-o-en";
>         };
> +
> +       ocp-aux-pwren-hog {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(R, 3) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "ocp-aux-pwren";
> +       };
> +
> +       bmc-ready {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(AC, 5) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "bmc-ready";
> +       };
>  };
> --
> 2.17.1
>
