Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89161EA85F
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 01:50:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473RZX3kFkzF5Hw
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 11:50:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="iSsXAz2h"; 
 dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473RYh3F9kzF5Gm
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 11:50:00 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id v24so4769857ljj.3
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 17:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ANRS5wbwl/qhMyqDjpLwYIen+6o/RnmGm7reuX+RDc=;
 b=iSsXAz2h6lI4/+bDAgo3ame/BZgVRj1aE4CRhVp1rkjDm5vlU5S7NBZHxBEgHg/wEo
 LHjrlUjzfObyMjWplPS4iUm9RjAgF5qeticJqVKdiQIoBq9hkhZrryXIwlO/lC3rF9zI
 RUGDn7MhN1RZ4aziEd7tokbiKmLKGtqN1oh1/Bkjo66ARSTwDEhXLfli2ZXzr+qUE27g
 ego3mqJPqzkvZTa4lU2SYZa52RhXEJMi+KQRYiuHajDJTdUR2yAdoa+b3h4qMUN8tIfP
 QZ6T99SeDihkZKnIxQBn1vOcNEJvsNSn6so+SKVs83W44KBmKnvrJIpsFergM970YDYy
 jX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ANRS5wbwl/qhMyqDjpLwYIen+6o/RnmGm7reuX+RDc=;
 b=k2PyidPbHM2pgyzsR5NDnwjBeWBiVxvCJ+gtGUbO3G3UHtFyLmHCu6Yg+Y5rZ3wq8U
 z5DGU4Lzd2T7OrfysFFy+wiLPW7M1piqJn7R9CK+pGK8KxG5WbQCYDh6bwfQ3E8fDVel
 tyyG5v+6zIe6G+91j7ki/HQekQE1CIjULRIStlY4wMihT9j3aXTnwQcb2EiqIEnem7ZW
 oLRE1u6hW2kECfINJYkb+qKFCx0P2PPQ3UF+LdM0nPyfUP21OwagWQV5YY+3G6+7nlBK
 OumP6Cx0GTW2HC6OibFrgexGst4i5YCcEq875VkfIBp6uHLmkM9fA2BumqtIi0hCu2Cb
 NhYw==
X-Gm-Message-State: APjAAAX/++OhtGzbYDKVezphPDFYKc36vpQ7f5Xq6JBpD2JQgaq2ZZFJ
 Qyy93pFHDOESLpVQMTGGWEFOmxY1wOD4NOqsWTxZ1g==
X-Google-Smtp-Source: APXvYqwM7PCCU+3fgkz+ysEB76Izdi4UnxQslU0hMR9roPFMeD2kCgFi2OfvADVGoZLpFkAT3ZECdzLcVTd/EaP9GRk=
X-Received: by 2002:a2e:90b:: with SMTP id 11mr1671387ljj.233.1572482995258;
 Wed, 30 Oct 2019 17:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20191028224909.1069-1-rentao.bupt@gmail.com>
In-Reply-To: <20191028224909.1069-1-rentao.bupt@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 31 Oct 2019 01:49:43 +0100
Message-ID: <CACRpkdbOPq4AYt9CLoganV_Ck9bYS9+_U3bggGKAukaQ=FHXkA@mail.gmail.com>
Subject: Re: [PATCH] ARM: ASPEED: update default ARCH_NR_GPIO for ARCH_ASPEED
To: rentao.bupt@gmail.com
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
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Burton <paulburton@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, Tao Ren <taoren@fb.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Doug Anderson <armlinux@m.disordat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 28, 2019 at 11:49 PM <rentao.bupt@gmail.com> wrote:

> From: Tao Ren <rentao.bupt@gmail.com>
>
> Increase the max number of GPIOs from default 512 to 1024 for ASPEED
> platforms, because Facebook Yamp (AST2500) BMC platform has total 594
> GPIO pins (232 provided by ASPEED SoC, and 362 by I/O Expanders).
>
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please send this patch to the ARM SoC and SoC maintainers:
arm@kernel.org
soc@kernel.org

Yours,
Linus Walleij
