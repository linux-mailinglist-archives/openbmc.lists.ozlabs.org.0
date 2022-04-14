Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B74500B33
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 12:33:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfG5D6Ttwz305j
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 20:33:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=WH6qlyOA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=WH6qlyOA; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfG4r5pgFz2xVn
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2022 20:32:59 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id c1so3490030qkf.13
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2022 03:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tz6JNLwRsuUV9e6Wb/jK5vZyFuS2XOWbOcUlOf+YiW4=;
 b=WH6qlyOAMs7+dFOJkHP/SnFHVWFEpE3voObP02vevVi6ml30Oirb2csqv5gU70/Mds
 cqRyTpfgtM7ndEVsulQWxaybNfEl337RXXkMaLSzLMnZGV4IcF6iiqAp8/hhfk4Iu1VY
 cAZHDGIY/nl8XA2rm4RmfKCsdnwRQpOn8CevM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tz6JNLwRsuUV9e6Wb/jK5vZyFuS2XOWbOcUlOf+YiW4=;
 b=BcaW5Jtz3mIUIA29c0mbwxQLdL7Hd0zq0+8dwNfqc3Atz0htMbZa2XnA9A0oClcEMg
 lE5WQhNZYX9CBskdtCFSkhTQ0u3dsSoH46/HExNSQVZu1UQ2cK1DlhnrgySsuu5H4huB
 qvpWOI2qGVnRY88YaNHMEUthr9QO0EBQmumVTosU5sxtIVK/38HhNv7lKv5TdJhM/o7O
 tdVEmfR3wDSY9+zm7gyueZokuB8PdSxUSpyIn7L85RyzXLhng9biqX9U38qY5mnhdo4B
 7h4F/M9ReAlL8hsjTq1cfJrR4aJzJB5W+9U2Lt08BfgwDtQhXQkX6Bm9/++D8I+fGrll
 0HTA==
X-Gm-Message-State: AOAM531vqpnt927cT1DjVmVJzy/Q3+y5f3tgGVdlfkqCBNMVyE8HZ4pe
 pF3+vZA2FboivGppZ02zLVyKL+oUH0Cwu/wCPVo=
X-Google-Smtp-Source: ABdhPJwE501Cs/3uWsypa05t/G9JuFL5oZkmuzp/rTBfXyqCzxJn37Okgqmj82gz/IPrlkaD1X5itxFhUzH0ynHXk54=
X-Received: by 2002:a05:620a:1422:b0:69c:4c45:18ec with SMTP id
 k2-20020a05620a142200b0069c4c4518ecmr1214157qkj.243.1649932374910; Thu, 14
 Apr 2022 03:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220414040448.27100-1-zev@bewilderbeest.net>
 <CACPK8XfKuNEvrZBxuD0Q891Wb23hkwRSRe6GcmZ_KR=3g4Q=mw@mail.gmail.com>
 <YlfePCrv0TBYtNHJ@hatter.bewilderbeest.net>
 <CACPK8Xd3HnX1angrhtb1UC5Zaa08n8emKp5Og9QEsm9yp-wpTA@mail.gmail.com>
 <YlfwlkBcyF4MZvYS@hatter.bewilderbeest.net>
In-Reply-To: <YlfwlkBcyF4MZvYS@hatter.bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 14 Apr 2022 10:32:42 +0000
Message-ID: <CACPK8XdJya+_KhCQd1uoC7=2auUg00SYz2pmCkDvsqHCPCMQ-g@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] aspeed: add
 CONFIG_ASPEED_ISOLATE_BMC
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 14 Apr 2022 at 09:59, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> On Thu, Apr 14, 2022 at 01:56:49AM PDT, Joel Stanley wrote:
> >On Thu, 14 Apr 2022 at 08:41, Zev Weiss <zev@bewilderbeest.net> wrote:
> >>
> >> On Thu, Apr 14, 2022 at 01:13:37AM PDT, Joel Stanley wrote:
> >> >On Thu, 14 Apr 2022 at 04:05, Zev Weiss <zev@bewilderbeest.net> wrote:
> >> >>
> >> >> This provides the functionality of the OpenBMC df-isolate-bmc distro
> >> >> feature flag, and is very directly derived from Andrew Jeffery's patch
> >> >> in the OpenBMC tree for the v2016.07 u-boot branch.  The
> >> >> implementation currently only supports ast2500, though ast2400 and
> >> >> ast2600 support should be fairly simple extensions.
> >> >>
> >> >> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> >> >> ---
> >> >>
> >> >> This is meant more as something of an RFC to see if this seems like
> >> >> approximately the right way of going about this (since as far as I can
> >> >> see the existing df-isolate-bmc implementation only supports the old
> >> >> 2016 u-boot branch), but if it looks OK I suppose it could potentially
> >> >> go in as-is.
> >> >
> >> >Thanks for doing this. The only potential change I can suggest is we
> >> >make each bit of hardware a different option (or we allow it to be
> >> >configured in the device tree). That assumes someone has a use case
> >> >for leaving one of the backdoorts open but closing the others.
> >> >
> >>
> >> This possibility came up on Discord with Andrew earlier -- I agree it'd
> >> be nice to have somewhat more fine-grained control over it, though I'm
> >> not aware of any platforms that really need it at the moment.  I'm
> >> certainly not as well-versed as Andrew in the precise details of exactly
> >> how all the various busses interact in different circumstances (this was
> >> just a fairly mechanical translation of his patch), so I'm not 100%
> >> confident I wouldn't unwittingly introduce screwy combinations with a
> >> more fine-grained set of config options (mostly w.r.t. to the LPC & iLPC
> >> stuff).
> >
> >Okay. Let this thread be a guide for the person who wants to follow up
> >with that work.
> >
> >> >I suggest we invert the meaning of the option. The default should be
> >> >turn off the backdoors, and someone can optionally re-enable them by
> >> >selecting the option.
> >> >
> >>
> >> I was tempted to make it 'default y' (i.e. secure-by-default), but the
> >> possibility of compatibility breaks with existing systems that might
> >> depend on the current insecure-by-default arrangement gave me pause.  If
> >> we don't think that's a big concern though I'm happy to flip the sense
> >> of it and have the more aggressive default.
> >
> >Given the impact of having these left accidentally open, I think we're
> >doing the industry a favour by closing them off.
> >
> >This aligns the 2500 with the 2600 which defaults to the backdoors
> >closed from A3 in silicon, and for all systems running their u-boot
> >SDK (which the openbmc tree is based on):
> >
> >https://github.com/AspeedTech-BMC/u-boot/blob/v00.04.10/arch/arm/mach-aspeed/ast2600/platform.S#L307
> >
> >>
> >> >config ASPEED_ALLOW_BACKDOORS?
> >>
> >> Sounds reasonable to me, though maybe s/ALLOW/ENABLE/?
> >
> >Yep, go for it.
>
> Hmm, though now that I've drafted up a version of the patch with that
> change incorporated, one other thing that's occurred to me is the
> potential for confusion on ast2[46]00 systems -- since the patch as it
> stands doesn't cover them, those will still have the backdoors enabled
> regardless, but it seems like the Kconfig text could easily leave people
> with the incorrect impression that they'll have the secure configuration
> unless they explicitly opt out of it.

The 2600 is covered, see the link above. It unconditionally sets the
"disable backdoor" bits on the 2600A1/A2, and those bits default to
"disable backdoor" on the A3.

> I don't have any g6 hardware to test on, but I think I'll expand it to
> cover the ast2400 at least, and add a note to the Kconfig help text
> clarifying that pre-A3 ast2600s will still be insecure.  Though I guess
> people doing a 'make menuconfig' for an ast2600 probably won't see it
> anyway given the dependencies...not sure if there's a better way of
> handling that.

It would be good to cover the 2400 for completeness.

You could add an ifdef to remove the "disable backdoor" code on the
2600. I think it would be better to leave it as-is, and clarify that
the 2600 doesn't support the option as it disables backdoorts by
default.

It would be good to document the existence of these settings and the
defaults we have in place.

Cheers,

Joel
