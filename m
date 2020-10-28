Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BD329CDED
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 06:14:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLcF04qbrzDqQq
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 16:14:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f44;
 helo=mail-qv1-xf44.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=d7uJKM2k; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLcCr5ThczDqPQ;
 Wed, 28 Oct 2020 16:13:10 +1100 (AEDT)
Received: by mail-qv1-xf44.google.com with SMTP id w9so1864706qvj.0;
 Tue, 27 Oct 2020 22:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RQ2kvUyYd4YE/aOcmy2TWcR3YaKz9JiRyVflCfdu5Ag=;
 b=d7uJKM2kvc8QuY02CcO5eBrxbPT8YUiaUU1yfWyy96kwPlqHgSJbuzyw5TzPhu6q1i
 Mx3BMKt0rJCXGELn+j98YQOuRL9N/PNF1OAh+5sMfmimXwb1nO1iOOgc1D9Z9NrdDut5
 12Cjvu4k6cSwBpskqjLRgkmjbm/U3Vf2VSKf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RQ2kvUyYd4YE/aOcmy2TWcR3YaKz9JiRyVflCfdu5Ag=;
 b=PGOcu7ouTgeTKzs4s82ob8qTSh0FUOeKjXsAwWvr+6q14w7s+ensZhR0tBckUfDoVK
 vRRA/iiVdbhBQHrdoo0cMtC7cqQ74hAbfEC+88VNdppanqd8D3mRL74y3wkWk7Aawla4
 4i8UqyR0MZYjLyjWWdEdVo+s1e1DilAgxVLHrhExu9dPKSRGPJZG93vfq/z6r7rfJLaz
 LjvNbKmv6Qeu1c0K5kcNjLnn9sWU9Kk1/uYdBnAiS6VINk7DRWcLz+iAiyD+40w16Kds
 ssbbQgL9uEzXKRvYjer11dCEVTsQpX7Zp/xhoj2MgwjWbjZlEcPJ6+PwuFK9rRjEOFhL
 4eHw==
X-Gm-Message-State: AOAM532NdE+Io52x3QyQNsFG7LiXdhEbIk3nNa1/0cDRREM8sHoXII2H
 5LabA3xtCAFcVyflp3UA0rz7DuFVJwu7S+b1u+Y=
X-Google-Smtp-Source: ABdhPJxQgUH7wxrvz7ZLyzad/HO2Oih626XOaAtn0H/+hBkJgVlw0Lkex5XUeHspPJHS77UwlY99ZTN9QT3BiEhy5OQ=
X-Received: by 2002:ad4:5387:: with SMTP id i7mr5777139qvv.43.1603861987985;
 Tue, 27 Oct 2020 22:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201012033150.21056-1-billy_tsai@aspeedtech.com>
 <20201012033150.21056-2-billy_tsai@aspeedtech.com>
 <49ef1445-ddb5-41fb-b9f5-f885a1784e77@www.fastmail.com>
In-Reply-To: <49ef1445-ddb5-41fb-b9f5-f885a1784e77@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Oct 2020 05:12:56 +0000
Message-ID: <CACPK8Xc-rFMkv6_VVizF0F8uqQQC=rko=P_LhC0CphJH+_VFYA@mail.gmail.com>
Subject: Re: [PATCH 1/3] Arm: dts: aspeed-g6: Fix the register range of gpio
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 26 Oct 2020 at 01:05, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Mon, 12 Oct 2020, at 14:01, Billy Tsai wrote:
> > This patch is used to fix the memory range of gpio0
> >
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

I've applied this with:

Fixes: 8dbcb5b709b9 ("ARM: dts: aspeed-g6: Add gpio devices")

Cheers,

Joel
