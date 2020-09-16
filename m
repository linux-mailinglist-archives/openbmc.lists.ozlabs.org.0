Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5027C26C338
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 15:23:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs14M4SkyzDqJh
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 23:22:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=fZtnO40n; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bs13P1pnCzDqJc
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 23:22:08 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id r7so10290142ejs.11
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 06:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xD3NKK/9WqZQ8mSJmyDJLCFuzUla2/xMf/QmLlzIVUs=;
 b=fZtnO40nJ7jwoTUeAyUnrS8AOzePCAofkKgqmagwGlXgFefEkzw9npwQbgrMuXyj/D
 /rbW8aVb5WqEHT+Vr87oDvhx6nWq9bCNdnSytMLR1imfoKyBX8e6cYa2EkwrrIU3kh7K
 SHeRSbcisYb6NKJhumvxWNMbj0sULoa3gurGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xD3NKK/9WqZQ8mSJmyDJLCFuzUla2/xMf/QmLlzIVUs=;
 b=pSlwzBPEZtW58pssjyNrIUGzQMc6lLEZ83ftjy93QqMT5s5OerZvdzMuiTuxdQ8FHU
 0b4p4itmaLE8G3XO4MQUGEGyRtgGZRkBwm9Zy84Ia0sqoGewlNPQtbnQydPwNazDPRnb
 Sd6n4UyIaQge3rW5Vq7TRxF+w0L/B/k10IY09gg9tdtAPXYAnbIE9Z4tWciToCCkftf3
 K/sn8JNDaVbXOccvxcq987fE5i+8nb0SA4pdutHEL1nuJTtNafMfNxyNMKgQ+KAMmkKx
 hlhZQmHq8ZYHwJp31tzrrSWc93skKZ53Ra07M1WpIYhXTgia+hDkscMHdEVlQW38EpTE
 rPUA==
X-Gm-Message-State: AOAM533opDIi1lbywbw4CGxkfqeQqHgUBWQWfKs+3vO6w8DHnfWcywi4
 zsH2upFIYn4UDh07/RxEpez0vM7zx8up67ERHK4=
X-Google-Smtp-Source: ABdhPJzKZTpLLTK2F8ONzEfxczWJQjIJLJR9lH6/TQiDENHFpqKCpJVo/NuRQ6aP1FZYNuNqxWIiuoG92iWykc7fdN4=
X-Received: by 2002:a17:906:8695:: with SMTP id
 g21mr24573662ejx.504.1600262526112; 
 Wed, 16 Sep 2020 06:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200916125554.195749-1-tmaimon77@gmail.com>
 <20200916125554.195749-3-tmaimon77@gmail.com>
In-Reply-To: <20200916125554.195749-3-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Sep 2020 13:21:54 +0000
Message-ID: <CACPK8Xc49DRhO-3bJN5f6g+qYYm=7OYxc_k18+cUJLnKURNUGw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] arm: dts: modify NPCM7xx device tree timer
 register size
To: Tomer Maimon <tmaimon77@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 16 Sep 2020 at 12:56, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Modify NPCM7xx device tree timer register size
> from 0x50 to 0x1C.

We can see that you've done that from the patch. You should instead
use the commit message to describe why you're making that change.

Is it incorrect, or is there some other reason?

>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> index 16a28c5c4131..72e364054e72 100644
> --- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> +++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> @@ -120,7 +120,7 @@
>                         timer0: timer@8000 {
>                                 compatible = "nuvoton,npcm750-timer";
>                                 interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> -                               reg = <0x8000 0x50>;
> +                               reg = <0x8000 0x1C>;
>                                 clocks = <&clk NPCM7XX_CLK_TIMER>;
>                         };
>
> --
> 2.22.0
>
