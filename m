Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F9B241635
	for <lists+openbmc@lfdr.de>; Tue, 11 Aug 2020 08:13:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQjFT3NWkzDqFK
	for <lists+openbmc@lfdr.de>; Tue, 11 Aug 2020 16:13:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=IoXmXhnc; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQjDf3LFdzDqLF
 for <openbmc@lists.ozlabs.org>; Tue, 11 Aug 2020 16:12:48 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id l23so8144907edv.11
 for <openbmc@lists.ozlabs.org>; Mon, 10 Aug 2020 23:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l1fH3iKHfY3Tpfx9rmQTNN18VnOj5mn67jJ2Gsmm9gI=;
 b=IoXmXhncPS4+gmykZwJ0dvdkbPopm5V8iE6gFp1/Tzt865s7YW59IBTwvKjeZkE3Er
 xcRH0lkaJNhM4ADRM5QOXB6fTIoH0Q1D8A8uhTRGsQUVPY3kPNSvlH6zIzdn39M8pKbl
 ZjhVXyXxIM1PIbxmoSq2KAy8OCTFQPXm2NAu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l1fH3iKHfY3Tpfx9rmQTNN18VnOj5mn67jJ2Gsmm9gI=;
 b=tL3VlhhqeYe4z1comnf0FRmR5SKq5w+FYmPzWaBCWyOjeyhSkfHiLZBvktnlzwW5MD
 tdqyAiNeQxOaDZCYoKa8J9cPqhm2TcizwKcN15yIiUT7DeXhymbw8UOUpIjxCQquboWc
 ooK0P7z2iAxn4RFR9P1A8PsUhO9B4Bt6iREMf/uTeo1Psqxi4RN2epMliYlFME35CNnz
 Mvl9xUUyAETtJIyTdhTXXvsZluMOSh3nXJssCpX/vJOHBxWXnKjU3gDlNdVlr6p77J2d
 FZl9xGqOWPhfYauuMPELTk4z1M/8RWygYoLoqbMsTBy2OMza5X3lfYhnFLJgrauA3iRq
 jetA==
X-Gm-Message-State: AOAM530Or/wC1dGG5U5UgbWK9SfD5AJBF6BhM+3RvI8ki8QyROE16EA5
 Bc07ON3OUtuBgKX1bxmcyNLLk+oOVoa6KwHj4Qc=
X-Google-Smtp-Source: ABdhPJwhvFFFhOT45vhzeCWNVzsJa18owuqq3O8w4GYEbsMjhp1B34CKyfoGU+/6AGlbYECdOaGGNIqEmVjhs9YbO7k=
X-Received: by 2002:aa7:d304:: with SMTP id p4mr23550901edq.267.1597126363122; 
 Mon, 10 Aug 2020 23:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200810184446.GA14652@bbwork.lan>
In-Reply-To: <20200810184446.GA14652@bbwork.lan>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 11 Aug 2020 06:12:30 +0000
Message-ID: <CACPK8XdFNpsyzgY8n_3VTxS-Z88bT1pBEXPO+w=dWE6G1fj3jA@mail.gmail.com>
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

On Mon, 10 Aug 2020 at 18:48, Alexander A. Filippov
<a.filippov@yadro.com> wrote:
>
> Since the kernel in OpenBMC was updated to 5.7.x we have a problem with the P9
> hosts booting.
> On host with one Power9 CPU the failure happens during the Petitboot is trying
> to initialize the network and it leads to host restarts.
> On host with two Power9 CPU the same failure happens during OS booting. It
> increases boot time, but at the end the host OS is completely started.

Oh no. I have spent some time testing the 5.7 tree primarily on
Tacoma, our ast2600/p9 platform. We saw some strange systemd failures,
where services such as udevd and journald would be killed by systemd's
watchdog functionality. I did some preliminary debugging but didn't
find a root cause.

I have since published a 5.8 based tree that does not suffer from this
issue. Could you give that a spin on your hardware and see if it
recreates your issue?

 https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/35315

> So, I have two questions:
> - Could you please, check if Romulus is also affected by this issue?
> - Do you have any idea what is going wrong?

I'll fire up a romulus and see if it reproduces.

My guess is it's something to do with the timekeeping, irq or rcu
code. All areas of complexity!

Thanks for the report.

Cheers,

Joel

> I've attached the tarball with full logs.
> - poopsy is a system with two Power9 CPU
> - whoopsy is a system with one Power9 CPU
>
> --
> Regards,
> Alexander
