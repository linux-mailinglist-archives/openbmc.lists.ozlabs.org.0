Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7969509762
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 08:21:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkS974hVpz3bWt
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 16:21:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Vuq7mvpw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Vuq7mvpw; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkS8m3JgRz2xZB
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 16:20:55 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id y129so2920458qkb.2
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 23:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v7gKJw9VI5AV2XSzN6yefiiXIGvsku8Xth/UAE0+sZ4=;
 b=Vuq7mvpwa1yUH8NGkPZGLzNScWIPvyn9FPKqr9FhBZds1AELP2qQd7To0WAQPUK/Im
 Blz8RTBJROQlpE+ED1tcRl0lPleRjpfqb4xaXEM6xFkZTPcDGaEanpqjY4E3eUtau8vd
 B70aPRGyBHdyNALBgNLNyEPoICG7LpFwiUq/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v7gKJw9VI5AV2XSzN6yefiiXIGvsku8Xth/UAE0+sZ4=;
 b=5+WjL61TS8+dKV1egxePKSndMeuzrbjn3w82tMJg8LwYZuyGkzwWCrKv2zuJHACRTi
 xVz3evToArlrQbkGpFZ5IikzIHZ5zs4NpClZisfH2ORAujyKSqhcsjkDnH46ENVOSWBD
 Py7ivhcq6z/5H7TqiV8TRVOG9eNGGBguQBwtr4nC6ULagCDfftRP5tNXQP/knMbS+746
 mnLnrnis3zm0OnrAC063HBk5rGw6XqzRcUVkxtWWkOnm2EfISSYlJiQdJOQhbtihhii2
 TaMrN7BmbnK8ktFGbNnnK88yj06oGEB04yFX9sCOmn0XkYjVFPEgWY9dn2GqMUnEDFzm
 xrCg==
X-Gm-Message-State: AOAM530AhftSVK1j5MGIL3qXL7uF8sCiAhJlYiqqjD+3WFr0Fb6b3ALZ
 MdAg5cnq1UWWnJ1eGRh9LnX89azyzk+b5gp/ffBQN/6B
X-Google-Smtp-Source: ABdhPJzcFl60xLJ/67PeE144ygTgLrmnr0mttfkIk64ptTZTtcxLPbVIVIzZ7LR1oJqARfD+hMiHsfw1sbUFDv5M+rw=
X-Received: by 2002:a37:c445:0:b0:69e:9283:b262 with SMTP id
 h5-20020a37c445000000b0069e9283b262mr11399110qkm.296.1650522051753; Wed, 20
 Apr 2022 23:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220419234202.8895-1-zev@bewilderbeest.net>
 <HK0PR06MB3380C8FDEE1588E4BAE945B3F2F59@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <2df6747e-068d-4488-be65-4b76715ed5f4@www.fastmail.com>
In-Reply-To: <2df6747e-068d-4488-be65-4b76715ed5f4@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Apr 2022 06:20:39 +0000
Message-ID: <CACPK8XeWGBZK8NknubJO91gzc7ccQcPjPPkiOkwRgSXvTUmAEw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v3] aspeed: Disable
 backdoor interfaces
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Lei Yu <yulei.sh@bytedance.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Zev Weiss <zev@bewilderbeest.net>, Ian Woloschin <ian.woloschin@akamai.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 20 Apr 2022 at 03:35, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Wed, 20 Apr 2022, at 12:36, Ryan Chen wrote:
> >> -----Original Message-----
> >> From: Zev Weiss <zev@bewilderbeest.net>
> >> Sent: Wednesday, April 20, 2022 7:42 AM
> >> To: Joel Stanley <joel@jms.id.au>; openbmc@lists.ozlabs.org
> >> Cc: Zev Weiss <zev@bewilderbeest.net>; Andrew Jeffery <andrew@aj.id.au>;
> >> Ryan Chen <ryan_chen@aspeedtech.com>; Ian Woloschin
> >> <ian.woloschin@akamai.com>; Lei Yu <yulei.sh@bytedance.com>
> >> Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3] aspeed: Disable
> >> backdoor interfaces
> >>
> >> On ast2400 and ast2500 we now disable the various hardware backdoor
> >> interfaces as is done on ast2600.  Two Kconfig options can selectively
> >> re-enable some of these interfaces: CONFIG_ASPEED_ENABLE_SUPERIO leaves
> >> the ast2x00 built-in Super I/O device enabled, as it is required for some
> >> systems, and CONFIG_ASPEED_ENABLE_DEBUG_UART leaves the hardware
> >> debug UART enabled, since it provides a relatively high ratio of utility to
> >> security risk during development.
> >>
> >> This patch is based on a patch by Andrew Jeffery for an older u-boot branch in
> >> the OpenBMC tree for the df-isolate-bmc distro feature flag.
> >>
> >> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> >> ---
> >>
> >> Tested on ast2500 and (hostless, BMC-only) ast2400.
> >>
> >> Ryan, are you OK with having an option (off by default) to leave the debug
> >> UART enabled as in this version of the patch?
> >>
> > Thanks your submit.
> > Again, my opinion still keep the direct patch to disable it.
> > Not have config to enable it.
> >
>
> Ideally yes, but as Ian mentioned he has at least one system where the
> SuperIO AHB bridge must be enabled to allow their BIOS to configure the
> UARTs. So we need an option to cater to that.

Agreed.

Ideally these backdoors would be controlled by strapping, so
development systems and platforms that chose to open them can
configure the system appropriately. But the hardware does not have
this ability, so the next best thing we can do is provide an option in
the firmware.

Note that before Zev sent this patch, the backdoors were left enabled
with the current SDK. Having them disabled by default, behind an
option, is a welcome improvement.

I'm happy with this patch, but I'll give others time to respond before merging.

Cheers,

Joel


>
> I don't want people to have to patch the code to allow use of the
> backdoors, that will just lead to other problems (e.g. reverting this
> patch is the simplest thing, and opens up all the backdoors instead of
> a targeted one).
>
> Andrew
