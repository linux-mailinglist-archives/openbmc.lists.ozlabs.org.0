Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EF03E5BA5
	for <lists+openbmc@lfdr.de>; Tue, 10 Aug 2021 15:30:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkYk91RkLz30Kl
	for <lists+openbmc@lfdr.de>; Tue, 10 Aug 2021 23:30:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=i5U4cbLj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::236;
 helo=mail-lj1-x236.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=i5U4cbLj; dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkYjk0t8Yz2yLS
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 23:30:32 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id h2so16899538lji.6
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 06:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e3k641rwlK4MjDsfjkE7+BTpqeUM8sPvABevxA/pIVM=;
 b=i5U4cbLjrYhQspm4zofa6nrbEwE0/197GBiQ6/qBUZCcNpjHttwNIVdfDw2yGu6SKb
 bUNC0n+XD7MXNIcuUMKiNA54afRKgRX6j2CUSuVx37b05Glig/CrWA4A3K16uozbX6iM
 VpWWBJgTyJMwuL4oQLzXAo3DJykGzLWwM4DyG8oDqJ/oi40S9ieTYDqd1LhKawuHYX97
 MrRad2Upe+VZyel12NVI6iypzQ7Ll25dmRvd0phOLHwA4Uv3/yFYnVxaUVHmTBVOCekr
 l+DVQlzPS6tEyY/XlcONbOPQopwaz5/JL6XD6YWy1cn0xzHjtxcRXZZznLnO+P7SNDuX
 7nGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e3k641rwlK4MjDsfjkE7+BTpqeUM8sPvABevxA/pIVM=;
 b=CZMca0UYPX8XOgd5xdxGBC+2eXNt1ybMePpRahS+kez0TajbZdRcGz7U3sFmQQPox0
 DgZB0gM0y9LGkmZ5zf+uzGl98yvSza2pKjI5OUHVpoTFIFLLuoGHjhwfFNMg/sCckbHG
 LR7I2zNedeX4ak+zxHRxcslnoQblYC4E/vdnGLAjv8eZIcClHQKTlQdWelOZ2VKq6Du6
 n8OV1lfSyrEBswn5HWUusb02elwOUmoY/0U1vzXv2zNWXUDDVoMolw61YQKkH32s24+K
 CMBKDVJBd2pPw3mi9krJiiKzCnJkPGChkVXpu/sq9d2KNUDU9cwgiq3xIgyQ5r4oqrO4
 bh6w==
X-Gm-Message-State: AOAM5309DMWSq2ga+0uM14xCMkmgAn/JO+5ZSzAmf+tOdlQ1aRAMy5mL
 4vdy6wAzv0VWjk85cyIx1MhDvURG8AUE6Xg8nPMxPQ==
X-Google-Smtp-Source: ABdhPJwQMqlYA/iD2LkwYjMyrISm/5VpD00G3ZreRxQPNQedZ6skQPLl6AsFHnOZAHKoQ0C63+sliSuUdCJf7E7plto=
X-Received: by 2002:a2e:888f:: with SMTP id k15mr19654778lji.326.1628602224614; 
 Tue, 10 Aug 2021 06:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210723034840.8752-1-rdunlap@infradead.org>
In-Reply-To: <20210723034840.8752-1-rdunlap@infradead.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Aug 2021 15:30:13 +0200
Message-ID: <CACRpkdaXWhKNdmWSsoYZnZi_umfvSv7mZvg1JgkG=-k0JGoUTw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: placate kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: kernel test robot <lkp@intel.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Aditya Srivastava <yashsri421@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jul 23, 2021 at 5:49 AM Randy Dunlap <rdunlap@infradead.org> wrote:

> Eliminate kernel-doc warnings in drivers/pinctrl/aspeed by using
> proper kernel-doc notation.
>
> Fixes these kernel-doc warnings:
>
> drivers/pinctrl/aspeed/pinmux-aspeed.c:61: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>     * Query the enabled or disabled state for a mux function's signal on a pin
> drivers/pinctrl/aspeed/pinctrl-aspeed.c:135: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>     * Search for the signal expression needed to enable the pin's signal for the
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Aditya Srivastava <yashsri421@gmail.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: openbmc@lists.ozlabs.org
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org

Patch applied.

Yours,
Linus Walleij
