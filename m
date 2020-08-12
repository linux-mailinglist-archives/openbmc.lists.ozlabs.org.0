Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE6E242716
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 10:57:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRNrF4KGYzDqc1
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 18:57:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=UJCb2V99; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRNq65DqyzDqYP
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 18:56:33 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id c16so1367954ejx.12
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 01:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7EZLOHSRKfpqA5ITAyjQSbqDfbOz8jCejDN8Wc/FifA=;
 b=UJCb2V99nMv1FheYD8Bx6wYCfxKzEhcDGQ9LkowBXfum0vr6fE9+pvYgaHr/E1XAqo
 EIRq7FwYfPPV7EMsIQsjeFJ7V1guujBNHBlO6UOl6kJmFBNoODVYiAnJ7JokGP0do0+p
 tOO78QlD9BCPOCxS/GNoGv7w9b8apxl0XEdSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7EZLOHSRKfpqA5ITAyjQSbqDfbOz8jCejDN8Wc/FifA=;
 b=QyqpLZ6Rh59NJkB5h7uu5KJNes+wdrtxlSkFrNLcRxgndbIvhYvPQKO035WYG9yhrW
 X5p5qAkyFfvaoMRQb2b/ftUZFjydgvbfuv5CdK4/I2oygRuU2kGzxxbo0iVlr8W3sGCf
 o8+w+/+9Bhctw/uL3KzMFqKE+DsDyy+IGgFmgNGIzKxLLo0xXOW24KCZ2E2pH8icbWFw
 E2n2aor5MwHo9lFSEblmyG8EQarzNpj7jn6YXzcKJLm3mbOuCApTmSFlXfV+otnS12IQ
 JqG0FKHenPrD3Q9LvjhtPuyIhy82MEUsGTV2TeWI9dI7CWdjRqaGrbZOMjB7ZLGKAQhV
 GNoQ==
X-Gm-Message-State: AOAM530VcXIUdxAiZv5V2vKHBnm0jn66n0RF3TmMTe90hRYoIpsliKvV
 d+uTzjFMA0YDWbixLyLv2rcVLqsyBJC4GQt6SZA=
X-Google-Smtp-Source: ABdhPJxJV0coJQzzidvzo22SpiSAul6HFkU6wFdlswpnyNhWxCi9m5rPFiaM+8EgvYOTaCXZClD7BrP1OW/+RI+VmTU=
X-Received: by 2002:a17:906:7790:: with SMTP id
 s16mr32172567ejm.254.1597222588696; 
 Wed, 12 Aug 2020 01:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200810184446.GA14652@bbwork.lan>
 <CACPK8XdFNpsyzgY8n_3VTxS-Z88bT1pBEXPO+w=dWE6G1fj3jA@mail.gmail.com>
 <20200811183314.GA26661@bbwork.lan>
In-Reply-To: <20200811183314.GA26661@bbwork.lan>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Aug 2020 08:56:16 +0000
Message-ID: <CACPK8XeLsJ+xKc7yD43sbkVCGohNoPx_d+JVNbv0unqS2XLM1Q@mail.gmail.com>
Subject: Re: The Power9 host booting problem with OpenBMC kernel 5.7.x
To: "Alexander A. Filippov" <a.filippov@yadro.com>
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
Cc: Artem Senichev <artemsen@gmail.com>, openbmc <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks for the response. I've merged the two threads, and I have a
candidate for a fix.

On Tue, 11 Aug 2020 at 18:33, Alexander A. Filippov
<a.filippov@yadro.com> wrote:
> With the kerenl 5.8 the host is still not booting.
> I've checked on both machines and they have very different results:
>  - On the machine with two CPUs the issue is still reproduced.
>    I see no difference, neither in the behavior, nor in the logs.
>  - On the machine with one CPU the failure happens due the PNOR flash.
>    It looks like this:

>
> I've noticed that the kernel 5.8 detect the flash driver incorrectly:
> mx25l51245g instead of mx66l51235f.
> It happens on both machines and I don't understand why it leads to the problems
> on only one of them.

I found upstream v5.8 has a regression in the spi-nor driver on
aspeed. I've put a revert of the patch that caused the regression on
the list, but it requires some more investigation to find a proper
fix:

 https://patchwork.ozlabs.org/project/openbmc/patch/20200812035847.2352277-1-joel@jms.id.au/

On Tue, 11 Aug 2020 at 11:54, Artem Senichev <artemsen@gmail.com> wrote:
> > My guess is it's something to do with the timekeeping, irq or rcu
> > code. All areas of complexity!
> >
>
> We had similar behaviour in P8 when tried to use ColdFire FSI:
> https://github.com/openbmc/openbmc/issues/3433
>
> In this issue, htop shows 100% load of one CPU on the host and it is not an OS
> task. Looks like FSI doesn't stop working and fully loads one core.

I think we have an issue with the irq polarity of the vuart device.
Did you notice an excessive number of lpc_serirq interrupts on the
host (check /proc/interrupts)?

Try doing this on your BMC before booting your host:

root@bmc:~# echo 0 >
/sys/devices/platform/ahb/ahb:apb/1e787000.serial/sirq_polarity

If that fixes it we can make a change to the device tree to make the
setting permanent.

Cheers,

Joel
