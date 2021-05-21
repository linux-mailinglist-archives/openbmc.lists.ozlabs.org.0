Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A34238BB25
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 02:59:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmSty4nt8z302G
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 10:59:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=gEX1PhKj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::736;
 helo=mail-qk1-x736.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=gEX1PhKj; dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmStd6Y43z2yXy
 for <openbmc@lists.ozlabs.org>; Fri, 21 May 2021 10:59:36 +1000 (AEST)
Received: by mail-qk1-x736.google.com with SMTP id x8so18240325qkl.2
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 17:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w/0aFTfAprVVOTOCs/KR4CC/94aej7JpddKXuVpnZ6g=;
 b=gEX1PhKjxUNcZhruCsw9euBMfZTaMTfSw09jtMO0vu65Hc39DgRYS0mBz+THLpaHuq
 m2O3HM0FkvpWu3fxirPKwP8W7nlDVG4cby1czMlBnx223XJ2jPnX6uRCcJt+X/Pqyy0o
 QWVmm7/6JmyUE5O1hu6A9N6/tWL2ym3WiFaHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w/0aFTfAprVVOTOCs/KR4CC/94aej7JpddKXuVpnZ6g=;
 b=RCO3Lah0ws7yFRuaH5GeVVqMW2+/FoZQZk0FBBv451D4Wk7I4yNf84Wq430W5YNoFb
 cn7kXWEl5lMviOf4qRZjJrL7mojOVXjHJWnTCNiGNtXHk4iWNfrM1y6ecPEb3+gChtfu
 pN/e4tEd4diA3crFdSb4U3HFg4+HQhXOAZ60uOHq0xtaAt2zaf2QRn5XFNYdkePvaAUz
 Ru7pOzAl+kdUwtQltD+OoTnz+pwxy0Ci1VfkqgP5cVqdmGi1SZZIrNkK6jIewBp4LE5l
 dAKUyVTADtqHrZOmWsbWhY/ZoMl8JTuJmQYhpRGplarVYmeujEtGx8jr9dvoxy1ldAav
 Os0w==
X-Gm-Message-State: AOAM530PPC1xPV8XseSCCv5CYYOqHGIB1bu3dS1yKeFXfiijChWncY+A
 clODi+vXIbnAyZacNmd3jlFv+aSBXFXvtEBvgB0=
X-Google-Smtp-Source: ABdhPJyOg85pbVP5qfGdda8bH9eLGYzaTgxUlVuD+D9zPYeernDU9rP22PyLTRyI8fLkxDMPzeS683iOIZwwY1pD25s=
X-Received: by 2002:a05:620a:704:: with SMTP id 4mr7822674qkc.66.1621558773301; 
 Thu, 20 May 2021 17:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210520093949.511471-1-andrew@aj.id.au>
In-Reply-To: <20210520093949.511471-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 May 2021 00:59:20 +0000
Message-ID: <CACPK8XeBeQjYe8LeivFt69bf8-ipccwHnigpq9jZ8B5wTKJ7Vw@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: checkpatch: Tweak BIT() macro include
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Jonathan Corbet <corbet@lwn.net>, dwaipayanray1@gmail.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-doc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 20 May 2021 at 17:14, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> While include/linux/bitops.h brings in the BIT() macro, it was moved to
> include/linux/bits.h in commit 8bd9cb51daac ("locking/atomics, asm-generic:
> Move some macros from <linux/bitops.h> to a new <linux/bits.h> file").
>
> Since that commit BIT() has moved again into include/vdso/bits.h via
> commit 3945ff37d2f4 ("linux/bits.h: Extract common header for vDSO").
>
> I think the move to the vDSO header can be considered an implementation
> detail, so for now update the checkpatch documentation to recommend use
> of include/linux/bits.h.
>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Acked-by: Jiri Slaby <jirislaby@kernel.org>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

...just a little bit
