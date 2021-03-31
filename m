Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B0534FA82
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 09:41:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9JDD3zZlz3bv7
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 18:41:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ItuOamKA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2f;
 helo=mail-qv1-xf2f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ItuOamKA; dkim-atps=neutral
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9JCy4NVkz2ysk;
 Wed, 31 Mar 2021 18:41:33 +1100 (AEDT)
Received: by mail-qv1-xf2f.google.com with SMTP id 30so9468781qva.9;
 Wed, 31 Mar 2021 00:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QR9n7jMBXuR7AUyYsxvNVDLdp7MMQ0XLcqNzq6Oedts=;
 b=ItuOamKAmyL1iqPklk3GBvrSvM/SNq/FVZC+5ryPmXu7jROc6lUwTxNrOOD/xcWp2+
 ymD4C6KALI+zjZuiS6LHcbLErQINHJmoTrnJ0Et+89desnpQaTEXUXoHYd8wMF75LlUu
 C2weFnwQ8w1CEc06TsKIZ5QAORrxw7Ox6zFWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QR9n7jMBXuR7AUyYsxvNVDLdp7MMQ0XLcqNzq6Oedts=;
 b=MunkL3xeudWa0vbFFhZ/lVCctSHzjj5q1JH56DBa4FH/YXMWGIjA/723jHVISyohE1
 Iom58lLslnvbSHqw2pgOQDhVdZP5mWXt4txNm3i5hck/haICS6v0FZlYmEWSeaBurXEE
 D0P9z35D8XNbp1IDEBYzsFQ6V4pp9tytnj6JM0NEgre788CQUF9pJP14UQ8tZ0JFkdQZ
 2lk0v8JMDAonOSI3xfaehpO4x3qT0GxnrJcmRWq78hyIchloVf0f75aEl4NEVe6AvACG
 lel1ynSNoQMjmmuoZxPr1XHZIm3yy6jIb6/GYrRpr3PskCe8SM3MzIU3CZDdmlm6ktHf
 zgfA==
X-Gm-Message-State: AOAM530EyxwXP1FEAykgz3qamyJ58Pczv7l0+bUaqZ6ag6ZiAShxqtl/
 7Qzg69LCsxid9hfM28KxOghGkkN2K1R0wi7d3r4=
X-Google-Smtp-Source: ABdhPJyRzi3fzNlKv54UZ4uRGyUMLMYtEitqX6uumolAz+qxX3eAEqUXtMwhLc+MEgT21jRm5FxrI/X79kntIIb+PhI=
X-Received: by 2002:ad4:58e3:: with SMTP id di3mr1756404qvb.43.1617176490132; 
 Wed, 31 Mar 2021 00:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210330002338.335-1-zev@bewilderbeest.net>
 <20210330002338.335-4-zev@bewilderbeest.net>
In-Reply-To: <20210330002338.335-4-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 Mar 2021 07:41:18 +0000
Message-ID: <CACPK8XcwMYgc9R24KuGa0hqKQAxawDScHp1+y62aeEvcpvPiSw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: aspeed: add ASRock E3C246D4I BMC
To: Zev Weiss <zev@bewilderbeest.net>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 30 Mar 2021 at 00:25, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> This is a relatively low-cost AST2500-based Xeon E-2100/E-2200 series
> mini-ITX board that we hope can provide a decent platform for OpenBMC
> development.
>
> This initial device-tree provides the necessary configuration for
> basic BMC functionality such as host power control, serial console and
> KVM support, and POST code snooping.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../boot/dts/aspeed-bmc-asrock-e3c246d4i.dts  | 188 ++++++++++++++++++
>  1 file changed, 188 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> new file mode 100644
> index 000000000000..27b34c3cf67a
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> @@ -0,0 +1,188 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/{
> +       model = "ASRock E3C246D4I BMC";
> +       compatible = "aspeed,ast2500";

Convention is to add a compatible for the board. I'll add
asrock,e3c246d4Ii-bmc when I apply the patch.

> +&vuart {
> +       status = "okay";
> +       aspeed,sirq-active-high;

We don't have support for this yet, but I'll leave it in and you will
need to send a follow up if the property changes.

Cheers,

Joel
