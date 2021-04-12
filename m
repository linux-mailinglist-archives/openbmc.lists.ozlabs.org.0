Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D24335B87C
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 04:21:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJXY63kz7z30JQ
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 12:21:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PPyysoNW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=PPyysoNW; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJXXr4d1jz301N;
 Mon, 12 Apr 2021 12:21:15 +1000 (AEST)
Received: by mail-qt1-x829.google.com with SMTP id z15so795770qtj.7;
 Sun, 11 Apr 2021 19:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JUa0+v7ZAmpSxoFCTfkyDehsOXQpvArXtqZL4rhnDLo=;
 b=PPyysoNW5WX9vhBEw5cG4Yo28z+2nzR60QmqN40agf6AO/FdWOGhnlcDFNslEOORCe
 hkMrPDMSiGmbVryxNnlfLJldTkhZ9uTQDJHxSqONQiaX7fMzmtYU8wHNOwRIqBeP9JOb
 36rWTawpZzthJkMUq2Gf4q6s2gs4evnoJRpSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JUa0+v7ZAmpSxoFCTfkyDehsOXQpvArXtqZL4rhnDLo=;
 b=B3KVEYqBOq04+4yKCwjduI4qNISzoh6UHts+gcfa3iyu4Jh19FslsQLKtR8Br6ynAb
 IXhwCugYdRw3O1PnR/w184IwSWp2rc9N/VkHOpofP1d3wcQRuL7h9cAxxBf9uohrLIit
 o0aa2+lYaUafVnAsHLTXx4uzCSKL80HchaozsdER69oPGzqInX0381xnKKUFxhi1BwRf
 3o5rgQ578s2dIBPJL2CKqAiO9FQ8wlcLznRDIkNjqbwFi9LAM3kHLCEyqfIFg6IcryYW
 cPBheiXxJ9wGDdKcyuapmKZ2TBpHuoarNrlpfOTmoUXWJjkF6VUrT1WEMKFJ3uZsuyXT
 xJjA==
X-Gm-Message-State: AOAM530ESfqWjjnQDuguBc5v+/QHO1bX1cz3dAOdso8iAhuQCYqa560/
 pLpvf+Rz68VHsYb9yTPlJVTksIWHX6uuL4D2O9c=
X-Google-Smtp-Source: ABdhPJwgShwjSPbZOaMDW2xVE5vVojGnL4E4qEoi1et+sCot/oBxZVRZg4cjukyg1q+Ub//cpLDgSH2uUEXf22RIBOU=
X-Received: by 2002:ac8:4d1b:: with SMTP id w27mr18336343qtv.363.1618194071540; 
 Sun, 11 Apr 2021 19:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210401044232.9637-1-zev@bewilderbeest.net>
 <84202973-1a94-4630-beeb-f33d044a0364@www.fastmail.com>
In-Reply-To: <84202973-1a94-4630-beeb-f33d044a0364@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Apr 2021 02:20:59 +0000
Message-ID: <CACPK8XcfuEyqGmO72taXFPARxwzLyct5__0C0CF-nyEf6Yubnw@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: dts: aspeed: add ASRock E3C246D4I BMC
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
Cc: devicetree <devicetree@vger.kernel.org>, Zev Weiss <zev@bewilderbeest.net>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 12 Apr 2021 at 02:16, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 1 Apr 2021, at 15:12, Zev Weiss wrote:

> > +&vuart {
> > +     status = "okay";
> > +     aspeed,sirq-active-high;
>
> This should probably go away, but otherwise,

Zev, this has already been merged (both to mainline for v5.13 and in
openbmc), so any fixups need to come as patches on top of the existing
code.

Cheers,

Joel
