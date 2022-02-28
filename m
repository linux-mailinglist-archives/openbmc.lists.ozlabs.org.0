Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F36F4C6225
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 05:22:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6RzW3NDRz2yKQ
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 15:21:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=bV7ogvkP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=bV7ogvkP; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6Rz05myKz2xt0;
 Mon, 28 Feb 2022 15:21:30 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id f21so9438308qke.13;
 Sun, 27 Feb 2022 20:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xu7L991BbclWOd1sSCiHVHwv23FKEvTPahHlqfmOUAI=;
 b=bV7ogvkPtbvPpHCldXcuINpGbSUEnOvppBm9rqxRGEL0gSVsOIN7FP+EWjQxNeiEsc
 JgwZi3P4vducm62191kOMrTwIUyg04bMbbQsGZkYXbl4R47UxWcXjDyhD8IlXv1F0vVG
 hwPyiZ9kiuRnyw2IZmvef12q6Zfo6Y5tmFEAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xu7L991BbclWOd1sSCiHVHwv23FKEvTPahHlqfmOUAI=;
 b=xog5kmjEiOm7r+B3JHr9KB6qn1csc/ByC2FGvDHPmwN5ScdEysS/sDyWHO4nIryuBJ
 ecZjx0uNXaDDq98tvyZUjOMW4AW5iDKnMy1jxpLTLNkzS0z9cHiKDl9XL32WtsvYqPHo
 3rNyiJP/fgvX4Lf0EOsdgnYBy82LukjepkiaIuwPbzq0yEvU0rBmd8APaiQuYRdyrvpt
 tFdDKY2595+JiLreJqLanJltQOBmfb5hyIAoJLnwPD108Zt+tWFiq9xR3stG36ikJDON
 OqxZyfKxjLGM9+iYS0rRm7u0M+jMYNk308oyK2euIY1GWvy5uiS6tsVEsEmuMv71FNw7
 /p9Q==
X-Gm-Message-State: AOAM5325zPNZbBtAfimEjzONxGXynAUVQG0UztbxOxlbEYPOe3Gk2RJd
 h6UeEBDapI/tPO73JNnBMKdRSF6ZCOI1luRhAwA=
X-Google-Smtp-Source: ABdhPJzjZJ2sb6YqyKtiQJ8UdreFdmA+9mR4ZseA6RQbUE7DGqgL+UfI5GuUZ5+PkfNbadU7W9b6EdllKdHYwz/lzsY=
X-Received: by 2002:a37:f903:0:b0:648:ca74:b7dc with SMTP id
 l3-20020a37f903000000b00648ca74b7dcmr10116556qkj.666.1646022083557; Sun, 27
 Feb 2022 20:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20220228000242.1884-1-quan@os.amperecomputing.com>
In-Reply-To: <20220228000242.1884-1-quan@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Feb 2022 04:21:11 +0000
Message-ID: <CACPK8XfCskh7KPhXJqOR9ZLnoBdd64SL9D1z5HoDC+_VVs4LCg@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Enable second flash, update gpios pin and merge
 adc channels
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 28 Feb 2022 at 00:03, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>
> This patchset adds the second flash support, merge all ADC channels to
> single iio-hwmon node and update various gpios pin name.
>
> Link:https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
>
> Quan Nguyen (5):
>   ARM: dts: aspeed: mtjade: Enable secondary flash
>   ARM: dts: aspeed: mtjade: Update rtc-battery-voltage-read-enable pin
>   ARM: dts: aspeed: mtjade: Update host0-ready pin
>   ARM: dts: aspeed: mtjade: Rename GPIO hog nodes to match schema.
>   ARM: dts: aspeed: mtjade: Move all adc sensors into iio-hwmon node

These look good.

Reviewed-by: Joel Stanley <joel@jms.id.au>

I'll apply them for v5.18.

>
>  .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 26 +++++++++----------
>  1 file changed, 12 insertions(+), 14 deletions(-)
>
> --
> 2.28.0
>
