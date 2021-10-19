Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BC7432E95
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 08:48:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYPTZ1Nb3z2yhl
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 17:48:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=gUB404x1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29;
 helo=mail-qv1-xf29.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=gUB404x1; dkim-atps=neutral
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYPRw6Lgjz3c61;
 Tue, 19 Oct 2021 17:47:08 +1100 (AEDT)
Received: by mail-qv1-xf29.google.com with SMTP id k19so11663092qvm.13;
 Mon, 18 Oct 2021 23:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VwIYfW0Zf+mAEKNLwqvojyl/bgvNRKJ4LTxr8Eay+V8=;
 b=gUB404x1RJbgSLd2YiaVb360stI1E0MKIQ2XbtSHStIxqT6CgbZgLuMMBYkSJXU1Nh
 n0USHhTy2FDU/9kbIDBMUvjyQz7zliTZfgCNlsQ7+U5G6Y7dbWvChZXou0qUyA6JKV7f
 PU8l6fK8eiS6RbQlKfze7kNYSBhiYdq9o4L4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VwIYfW0Zf+mAEKNLwqvojyl/bgvNRKJ4LTxr8Eay+V8=;
 b=uWIwA4qomWIX6/8N7te45BQzxRb9sLnzDP4cnF32V74iE7kgpQKTSdYtWAArcAImO2
 u2ZIYpf2J8KaGJjpKALeYD9mkx1xlVgKHpTkqSJXSDGY00+7xDlvj46gJiOKyGHB5EA3
 F7GOaVrNA+Db/JOGlC5WppEl3Zd3ga8kICbED0L+Br/Kgpd8S2bbXt3j3Yy+OgEoxqES
 7pAjcXRZ3slW/14g2PsVHFyFUhaR0HyJeD8AvTkWP0t40SpGqO1yY2/v6WtGSOPGJ+Zm
 tqIl9q9J4xi5lAo8HNEMPtlWfXBtKmijpJEu83F124Tg1oDUAoSCwCuDD+B5uRx6w7ai
 /Bwg==
X-Gm-Message-State: AOAM531jDV41jP73AYlxwPwJ83B22STPVq+3vGiY+xRzFiKk8VXVyeU7
 ulODDspQ8g6WfcB+YAN8cF+oVkJIi+8RaLojmivgzSkj
X-Google-Smtp-Source: ABdhPJwfxf183iO7OxBAtX1Zjk+UiHTT4DnVJqYwnqDIC90ALBhdq8pg720sirxT55vW2dHwHUbK1bCBrs264CwpSFA=
X-Received: by 2002:a05:6214:4eb:: with SMTP id
 cl11mr29935905qvb.43.1634626026343; 
 Mon, 18 Oct 2021 23:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211019060155.945-1-quan@os.amperecomputing.com>
 <20211019060155.945-4-quan@os.amperecomputing.com>
In-Reply-To: <20211019060155.945-4-quan@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 19 Oct 2021 06:46:54 +0000
Message-ID: <CACPK8Xc_+HU3=rZtORUw+hu2SFbOm3ZYHkUnrrKpBcTUAfHeQw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: aspeed: mtjade: Add uefi partition
To: Quan Nguyen <quan@os.amperecomputing.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 19 Oct 2021 at 06:02, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>
> Add SPI NOR partition for uefi.
>
> Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
> v2:
>   + Introdued in v2
>
>  arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> index 723c7063c223..4c3c3f1a12ea 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> @@ -374,6 +374,15 @@ flash@0 {
>                 m25p,fast-read;
>                 label = "pnor";
>                 /* spi-max-frequency = <100000000>; */
> +               partitions {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       uefi@400000 {
> +                               reg = <0x400000 0x1C00000>;
> +                               label = "pnor-uefi";
> +                       };
> +               };
>         };
>  };
>
> --
> 2.28.0
>
