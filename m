Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB21BEC0E
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 08:36:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46f4vV40zxzDqng
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 16:36:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="bj30pD+/"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46f4py6s63zDqnK
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 16:32:26 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id c3so1461252qtv.10
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 23:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=phIbuYJ4lNko0nLxvR0dmd+35JgIR+leek2J73wqD+0=;
 b=bj30pD+/msQCaVBFPgE2Jwwd8kjIBzcBicbO1SB2jnTlrXYK8LAkV2f1uizHjyJtIF
 y0xourk32RjM/f8Z6CsNCIJrEOOOYvf80mm5zKcSg3vPyrNSUFk1Mjv04+AkkayDo72L
 UegifsDdk0xEdT61OjC4IUqrkfBOaqpjdN/QY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=phIbuYJ4lNko0nLxvR0dmd+35JgIR+leek2J73wqD+0=;
 b=Q5Wsx4IIV203Gn1jTqhppj0Wv2eBgNCkIrtXRDpkDoCMd3/5ZnvrfBCAwOEhsf3McG
 DIB6Jy5OsNvOIe1jeBkqevCMN+Oh+7W+dH3cDJ/ofBfTji7dTokNuNd9YR4lsLXse31s
 c1AacKhP+Wp7NbFrIQMDcnFQz29A5qIrJ/afsthjjL3Nz5nI0CvEvECpsa/R002j5QY+
 rfZXPBK6xdZEywomPC3XiuiGdI+gQMrOvp8mNo/SwpcExIups63rGzndMICb2opJ1G7G
 ZWRCQ5UkYdSYB3DURgKiVKwGznC6EVlZH0II5w/EG2zj3rVrBujlz58bHdfJ43vuXGkO
 Ze2w==
X-Gm-Message-State: APjAAAVO7dfgnyE7aJ7zeayLsGxdro8x7bF18VOBqgucHK9yxUstedEH
 MS/7YxK/QMJs5c+8z55Sbk/bQtAaUWM4ilQQG74=
X-Google-Smtp-Source: APXvYqwHJu4j8aAu4yk9OlipSDMC6jR33IT/xU+EYZzmy+cJCdM8ihh1cniVMQuUOpodUti8NqFikypTU3ncKcccgYw=
X-Received: by 2002:ac8:2e94:: with SMTP id h20mr2406605qta.234.1569479542749; 
 Wed, 25 Sep 2019 23:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190926023230.29810-1-bradleyb@fuzziesquirrel.com>
 <20190926023230.29810-2-bradleyb@fuzziesquirrel.com>
In-Reply-To: <20190926023230.29810-2-bradleyb@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Sep 2019 06:32:10 +0000
Message-ID: <CACPK8XfrpyShBfpKaZ+_yLadJJHWpXYzD3F1WYApL2zFUL8yDg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 1/2] ARM: dts: Add 128MiB OpenBMC flash
 layout
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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

On Thu, 26 Sep 2019 at 02:31, Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> This is an alternate layout used by OpenBMC systems.  It describes the
> fixed flash layout for 128MiB devices.
>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
>  .../boot/dts/openbmc-flash-layout-128.dtsi    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 arch/arm/boot/dts/openbmc-flash-layout-128.dtsi
>
> diff --git a/arch/arm/boot/dts/openbmc-flash-layout-128.dtsi b/arch/arm/boot/dts/openbmc-flash-layout-128.dtsi
> new file mode 100644
> index 000000000000..4e2819a8dac6
> --- /dev/null
> +++ b/arch/arm/boot/dts/openbmc-flash-layout-128.dtsi
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +partitions {
> +       compatible = "fixed-partitions";
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +
> +       u-boot@0 {
> +               reg = <0x0 0x60000>;

This is 384KB, which is too small for the ast2600 u-boot.

 I suggest we make it 896KB. This is 1MB - 128KB for the environment.

> +               label = "u-boot";
> +       };
> +
> +       u-boot-env@60000 {
> +               reg = <0x60000 0x20000>;
> +               label = "u-boot-env";
> +       };
> +
> +       kernel@80000 {
> +               reg = <0x80000 0x780000>;

I suggest we make this bigger. 9MB seems like a nice round number;
that means we end up with 10MB for u-boot + env + FIT.

I will send a patch for review with my proposal.

Cheers,

Joel

> +               label = "kernel";
> +       };
> +
> +       rofs@800000 {
> +               reg = <0x800000 0x5800000>;
> +               label = "rofs";
> +       };
> +
> +       rwfs@6000000 {
> +               reg = <0x6000000 0x2000000>;
> +               label = "rwfs";
> +       };
> +};
> --
> 2.21.0
