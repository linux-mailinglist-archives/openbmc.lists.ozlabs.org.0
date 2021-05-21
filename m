Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B26AD38BC9A
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 04:43:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmWBg4gg5z3077
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 12:43:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=c4jF2cNe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2f;
 helo=mail-qv1-xf2f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=c4jF2cNe; dkim-atps=neutral
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmWBM5YV3z2yXh;
 Fri, 21 May 2021 12:43:23 +1000 (AEST)
Received: by mail-qv1-xf2f.google.com with SMTP id ee9so9702724qvb.8;
 Thu, 20 May 2021 19:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ri3eYuWT7L+zZwKbNsPuCTbBOkIewFHwKjlwnXef214=;
 b=c4jF2cNeItNfmRR4lGIMPTE++qZBL7sJ9VGjGZeefXTpuFfGFos+6n3rSVKssWKLwg
 72EX/0gzLENCO6YtjZtB0AWQGcdMOQd/asoMACXIZQynZBsRXOqDJ77xJJe8kjM/CZx6
 pQl4J84XzIN1q+IjhnsnWuXWw2reM/pg+Pb3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ri3eYuWT7L+zZwKbNsPuCTbBOkIewFHwKjlwnXef214=;
 b=d2btCKolhSO5VQh8mIWQdj5FgkaAKqyhcLfX9/sULtJdRYmdSSpq0a2AUKKWniGEOo
 kbp+6HgsFrTA4lrzi7HH4iVe47n6gCSRbs0CSo115E62MGKxhaU+18f04ArrkvwzwOos
 rUGW18KoaqxC532UrBXspPFG9wkPI4bz0ntmTQPxRMeBiPun+Rq79KCUEZbqQRGrkVJD
 yvJykcQKB8QqA5xjkuZEGBgcpIA7SVUa0jGdcOo+3u2gCsgFtd8B1nJM/SDFibWX77kD
 Rexbga1AmaU+yjjwSgNx7HhN5YhYE5j31p9jcfgtmShdKrEKuk8dFh2L1CkXO2ojq/7x
 bcnQ==
X-Gm-Message-State: AOAM532juh2NbaAEUvbswgkGfeycQ7SgAIPTwkH48INoHb+r+SvcPxAV
 0an4XHzeKXaehHpx0wxsObzQwYu5y4VBTKlK1PA=
X-Google-Smtp-Source: ABdhPJx0PePfwy8UUauDOX3x2o9mQhIfTFfv1e0JuFf7mc8aXj6h1jcDNLXGmDnwW78ovwiscPFSmxWexbU1fQ5DNsM=
X-Received: by 2002:a0c:d80b:: with SMTP id h11mr9630257qvj.10.1621564997782; 
 Thu, 20 May 2021 19:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210506205419.26294-1-zev@bewilderbeest.net>
 <CAFd5g46TEFLWdBN80RxGwZfoyD-70C0pP59mhrynvD5ODd2wrg@mail.gmail.com>
In-Reply-To: <CAFd5g46TEFLWdBN80RxGwZfoyD-70C0pP59mhrynvD5ODd2wrg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 May 2021 02:43:05 +0000
Message-ID: <CACPK8XfYJjuBHSA=8gojb7YiPc9AeH5sMd08amx_=GgjEKe_eg@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: aspeed: disable additional device addresses on
 ast2[56]xx
To: Brendan Higgins <brendanhiggins@google.com>
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
 Zev Weiss <zev@bewilderbeest.net>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 7 May 2021 at 19:57, Brendan Higgins <brendanhiggins@google.com> wrote:
>
> On Thu, May 6, 2021 at 1:54 PM Zev Weiss <zev@bewilderbeest.net> wrote:
> >
> > The ast25xx and ast26xx have, respectively, two and three configurable
> > slave device addresses to the ast24xx's one.  We only support using
> > one at a time, but the others may come up in an indeterminate state
> > depending on hardware/bootloader behavior, so we need to make sure we
> > disable them so as to avoid ending up with phantom devices on the bus.
> >
> > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>
> Looks great! No concerns from me.
>
> Nevertheless, I am not in a position to test this at this time. Joel,
> or Andrew could one of you (or someone else on the mailing list) test
> this?

I tried testing this by connecting I2C1 and I2C2 (schematic numbering)
on the AST2600A2 EVB. I got it working, but only when I read a single
byte. There's more about that below, but it's a different issue
unrelated to this patch.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Tested-by: Joel Stanley <joel@jms.id.au>

--
On to the bug I saw:

When reading one byte, it works:

root@ast2600a2:~# dd status=none
if=/sys/bus/i2c/devices/i2c-2/2-0064/eeprom  count=1 bs=1| hexdump -C
00000000  48                                                |H|

If I try to read more than one byte:

root@ast2600a2:~# dd status=none
if=/sys/bus/i2c/devices/i2c-2/2-0064/eeprom  count=1 bs=2 | hexdump -C
[ 1568.320096] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1568.328385] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1568.339106] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1568.347423] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1568.358112] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1568.366430] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
dd: error reading '/sys/bus/i2c/devices/i2c-2/2-0064/eeprom':
Connection timed out


If I then go back to reading one byte, I get the error the first time
but the data does come out:

root@ast2600a2:~# dd status=none
if=/sys/bus/i2c/devices/i2c-2/2-0064/eeprom  count=1 bs=1 | hexdump -C
[ 1593.306360] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1593.315191] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
00000000  48                                                |H|
00000001

Subsequent reads work as expected.

With further debugging turned on, this is the log of doing a two byte read:

[ 1781.027360] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1781.027552] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000004, cmd 0xec0b0000
[ 1781.027751] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1781.027906] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000001, cmd 0xea250000
[ 1781.028069] aspeed-i2c-bus 1e78a180.i2c-bus: received error
interrupt: 0x00000008
[ 1781.029683] aspeed-i2c-bus 1e78a180.i2c-bus: SDA hung (state
a050000), attempting recovery
[ 1781.029760] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000004, cmd 0xd2b10004
[ 1781.029773] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1781.038729] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000020, cmd 0x0a050000
[ 1781.038761] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1781.046932] aspeed-i2c-bus 1e78a100.i2c-bus: received error
interrupt: 0x00000020
[ 1781.047022] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1781.047195] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000004, cmd 0xec0b0000
[ 1781.047404] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1781.047556] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000001, cmd 0xea250000
[ 1781.047756] aspeed-i2c-bus 1e78a180.i2c-bus: received error
interrupt: 0x00000008
[ 1781.049367] aspeed-i2c-bus 1e78a180.i2c-bus: SDA hung (state
a050000), attempting recovery
[ 1781.049421] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000004, cmd 0xd2b10004
[ 1781.049435] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1781.058322] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000020, cmd 0x0a050000
[ 1781.058351] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1781.066522] aspeed-i2c-bus 1e78a100.i2c-bus: received error
interrupt: 0x00000020
[ 1781.066609] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1781.066789] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000004, cmd 0xec0b0000
[ 1781.066998] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1781.067148] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000001, cmd 0xea250000
[ 1781.067313] aspeed-i2c-bus 1e78a180.i2c-bus: received error
interrupt: 0x00000008
[ 1781.068968] aspeed-i2c-bus 1e78a180.i2c-bus: SDA hung (state
a050000), attempting recovery
[ 1781.069083] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000004, cmd 0xd2b10004
[ 1781.069100] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1781.077903] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000020, cmd 0x0a050000
[ 1781.077934] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1781.086106] aspeed-i2c-bus 1e78a100.i2c-bus: received error
interrupt: 0x00000020
[ 1781.086186] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1781.086371] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000004, cmd 0xec0b0000
[ 1781.086579] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1781.086730] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000001, cmd 0xea250000
[ 1781.086897] aspeed-i2c-bus 1e78a180.i2c-bus: received error
interrupt: 0x00000008

This is the result of the first single byte read after the error state:

[ 1710.150555] aspeed-i2c-bus 1e78a180.i2c-bus: SDA hung (state
a050000), attempting recovery
[ 1710.150627] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000004, cmd 0xd2350004
[ 1710.150646] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1710.159468] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000020, cmd 0x0a050000
[ 1710.159500] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1710.167681] aspeed-i2c-bus 1e78a100.i2c-bus: received error
interrupt: 0x00000020
[ 1710.167793] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1710.167971] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000004, cmd 0xec0b0000
[ 1710.168178] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1710.168335] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000002, cmd 0x0a070000

This is unrelated to your change, but should be investigated by anyone
looking at slave support on the ast2600.

Lets go ahead with merging this change.


>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
