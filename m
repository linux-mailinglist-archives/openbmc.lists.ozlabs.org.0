Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E29A96C3
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 00:55:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Nzgn2vbmzDqwB
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 08:55:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="S1tWJV/q"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nzfx72TPzDqlV
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 08:55:05 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id g13so38882qtj.4
 for <openbmc@lists.ozlabs.org>; Wed, 04 Sep 2019 15:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oYBKlrJ4VGx5YSv//m6I/3jCuCWM6lncqtd/Xe63sxc=;
 b=S1tWJV/qFiLaLvlrKIPn5Mxf1bqC70H0MHh72j09iPuao3Ykiyi3rziUbchtyOa7zi
 7ftDjM1SkbgjVb3rTqYfuqkOvwTpOIR+QSjK3ajLKbHt99rs4GM9jTl5Vti1C577Wkub
 /zmOW4pRa8JgIXdhaA/nWNWkrmhdquiwvlhWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oYBKlrJ4VGx5YSv//m6I/3jCuCWM6lncqtd/Xe63sxc=;
 b=a6IhNDAP4S5dwb0fDazSEKabb27vuEGUyQj4p8frtqCZG9Q9zWhVmidx9HX//sdn2O
 J2fY3n6WOoxBb1PwczUlatmtoLWCC0cv9Of+7ZT433pnMykVove2KQ9UWcdO6pNGIFFc
 5HxyYqILf5+VvYTP8K7z6SMroaQTVvPTtRkyQoz8xSvfqlklI3IW2hgAuv2iMD4Mtjn6
 YfoWI/rbuv+RVLVP4vhsWEl9zTIQbkCkX4Jt5Ys+MJTuS0zJnc5unYhPiEucFT8R9PMn
 smkNYaJsNPauj8jUPFNuXD3nksrvPTjkj2F0CfJCBLW/KyssutLyKXjPKZvzNj7N6xMy
 FUlg==
X-Gm-Message-State: APjAAAVTZPfHyK4a/TxvwnH7WM6PQsnq9Y2RbNHaShsca36EnkGXKX1G
 n7iexX0QhHx/NXfBvmS2r+rTTXaAFx0yFsbs4OE=
X-Google-Smtp-Source: APXvYqx/vwpm59BLNFv1B2WZuCIs0NumOxvzU178gsKMy4C3b5MVTsO0eQDb/+vPUuf1IJpQ/YcvhvVU9DOUCeRnR54=
X-Received: by 2002:ac8:4a01:: with SMTP id x1mr539647qtq.169.1567637701713;
 Wed, 04 Sep 2019 15:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190904200758.5420-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190904200758.5420-1-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 4 Sep 2019 22:54:50 +0000
Message-ID: <CACPK8Xfzn3A7nCFqCbSm=6qsB-5dgJOcz1rgSGhRH=xojb4m_w@mail.gmail.com>
Subject: Re: [PATCH dev-5.2 0/2] i2c: aspeed: Add H/W timeout support
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>, Tao Ren <taoren@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jae,

On Wed, 4 Sep 2019 at 20:08, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> In case of multi-master environment, if a peer master incorrectly handles
> a bus in the middle of a transaction, I2C hardware hangs in slave state
> and it can't escape from the slave state, so this commit adds slave
> inactive timeout support to recover the bus in the case.
>
> By applying this change, SDA data-low and SCL clock-low timeout feature
> also could be enabled which was disabled previously.

Please consider sending your RFC patches to the upstream list. You
have a big backlog of patches now.

Cheers,

Joel

>
> Jae Hyun Yoo (2):
>   dt-bindings: i2c: aspeed: add hardware timeout support
>   i2c: aspeed: add slave inactive timeout support
>
>  .../devicetree/bindings/i2c/i2c-aspeed.txt    |  2 +
>  drivers/i2c/busses/i2c-aspeed.c               | 79 +++++++++++++++++--
>  2 files changed, 75 insertions(+), 6 deletions(-)
>
> --
> 2.23.0
>
