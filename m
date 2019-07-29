Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1014979B3E
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 23:37:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yChJ3gXszDqPP
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 07:37:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="XiIC1pel"; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yCgS6LKXzDqPP
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 07:36:34 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id r9so60022528ljg.5
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 14:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m+uKl3DmiY8dW8TGLrxGk/fNxMPrGaMpCCMkd3OfZgg=;
 b=XiIC1pelgzO+M5iJgoHNGaFTyBt4JyMKlOsZ+f6+nAfV9oBGWKwb7dU3vhdcbctnq4
 VCEcyn7DrLpIeckFKbi/1dLpgiJtSsuxe2S9dKXC/RJ85kB5lYrKh0T7ZZ2A+Lsc96lj
 RZiZhzpeU87NdQRdREAH+PhFluvzgtMhf4R85gbIovSIzVN07VdPFBUZ2DymoY4rkNq4
 t6ipq/cHvX4AzeY+CiEFb87Q6Dkc26eS4keDhi13IS/16+QXJpHdfi7+Nw7ttGvzKd41
 Jghzth8iqGKCq40V9ct1stdODtFsAPaRDLUJcHC+kuGT94mQMJ25XhbNwswKtuNkNFaR
 f6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m+uKl3DmiY8dW8TGLrxGk/fNxMPrGaMpCCMkd3OfZgg=;
 b=Nqq7zgvTy5AFR8qFoo3EB/PR2Lqvg8g0S3U6t5yuGRGaOtQB+Gt/7uSzz9X07AUt9M
 VSfy1kpekuPWrj8aBuBV+Vec0En1bTTHiekxz6cuxnX1wyiFJyLeu5ktJmv2N056i273
 3poibkbOUVsXWhPU/MuH0p9EUipYhYKmxsSJYHbMEfr+6yPODOFvKIzcE1edmqMMQhAX
 9Kxl9F075tyVZGUqx3Lkd290P4eUKYLmd0X7RjF88oUXtaY5IDWJEd5rVYD5VFexLZi7
 DFbTdhvRI1Krnstlcb5TmDUX+sYhu3Wo4gUuUZY49Uequjw1iiTBPiuBJnb2eRATksl3
 cM1g==
X-Gm-Message-State: APjAAAXz2Q+evtnpaYcj+Nn0qQE11CnHktXtre5XWFspnHBT8hsb08ca
 p4lz7cJsdW22NOXSY+j+DilppQ/46afQfzYZepI3Qg==
X-Google-Smtp-Source: APXvYqzpGev1ZgT7UDoBmrvnEtfYU3dY7RXU+9rHQOkrcjsAH41AmeGJd40sfREgQBCjTHKjCZUWI87ScfuEsB+15wM=
X-Received: by 2002:a2e:9593:: with SMTP id w19mr12040674ljh.69.1564436189593; 
 Mon, 29 Jul 2019 14:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190711142457.37028-1-yuehaibing@huawei.com>
In-Reply-To: <20190711142457.37028-1-yuehaibing@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 29 Jul 2019 23:36:18 +0200
Message-ID: <CACRpkdbBWPN8px=5gxeXWifDz5gCdbqWvgk6ZPdXS6Pa_hKO0g@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: aspeed: Make aspeed_pinmux_ips static
To: YueHaibing <yuehaibing@huawei.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 11, 2019 at 4:25 PM YueHaibing <yuehaibing@huawei.com> wrote:

> Fix sparse warning:
>
> drivers/pinctrl/aspeed/pinmux-aspeed.c:8:12: warning:
>  symbol 'aspeed_pinmux_ips' was not declared. Should it be static?
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied with Andrew's ACK.

Yours,
Linus Walleij
