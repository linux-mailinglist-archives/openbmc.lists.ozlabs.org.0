Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6A21DB20B
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 13:44:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RrWd2S6FzDqR6
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 21:44:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d44;
 helo=mail-io1-xd44.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FDYEU8Kf; dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RrVd70vszDqLd
 for <openbmc@lists.ozlabs.org>; Wed, 20 May 2020 21:43:37 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id x5so2746966ioh.6
 for <openbmc@lists.ozlabs.org>; Wed, 20 May 2020 04:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c5gCsCCg2ZktsI6WZTvCyt/N51Rkad6rw/S1dWQ5wyk=;
 b=FDYEU8Kf25iQOG7H8v613iXDN7QVeKL+0wv2HcOeF3sRFNk3N1B5Cj24Fdas4AojmV
 83ap1eulAyUn1LZ5nsiDzO+e3qjZQ72rCeWIvmDI8e5NrJ3A2s04Hn0hMfPzG09/LjfE
 gczizyQkl0jM38snWj1UiWDG8IJXx9A2WNViJ/tBAAhg7tjx/0FpNTEctqnmSk6zURU6
 lwIcIdDyV7ZfwERvH29YUZeFXb+ypnDYTR/m27s3oA27eDWbIVi6ClpiQ5sCMDwDERnq
 QfoXC+QUT+qIwn70lhjesnxV5QsDVWCLDIFh2jw5OirunO2h65o6ZOLB53sqQKhDKGQJ
 reVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c5gCsCCg2ZktsI6WZTvCyt/N51Rkad6rw/S1dWQ5wyk=;
 b=VfcbCV4bn8mpZSW1tF5WpRjOVdx6AMKSJsYbzDPgsO1/8c4K8iF0s8ZpFOcQADlcHb
 SAjE0zQi+i28Pw03hdza1QrUtrtmwmjQ1gx8qYyl2vV64oWcRQW1ujg3zumhJmsKg/G8
 2MKWirBw4aA4bKUWgx0D7Hr+Ogw259Ynq/pz12L2Te3mKb08ytiCFsM3TmpgQowIEPrb
 sJDS0F/SyjZmo65bnjMdgNrmDk0KYjfMuH+3U2h4sdP5zJP/VhnVMeuTh2Uqejrbp/r3
 hq4XRsOc6fA8HK2wtGJHfvJCitbGa6Er6ydeT4+wbWNyA0a8gTyJKOOuUgpqzeGkDAUH
 KPmw==
X-Gm-Message-State: AOAM530b6V5yzBzpJT8aJl6pfugEpbRNQKbJTeB9pAl7jyeKwE/9vXD4
 6xlvPGuHJ40w1TaWvJhn2+bjEKamIB8CzfCJ/oWJUNk=
X-Google-Smtp-Source: ABdhPJzKJP/cGNNac1kUPgTwPlLIWOHe6TrixFNrwaMIGkK58srY1G5ZeYUEIcAgtqSbV0sC4psNaRowIFiZqCXO4ME=
X-Received: by 2002:a92:8c8a:: with SMTP id s10mr3283841ill.220.1589974696422; 
 Wed, 20 May 2020 04:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200520095113.185414-1-tali.perry1@gmail.com>
 <20200520095113.185414-3-tali.perry1@gmail.com>
 <20200520102452.GP1634618@smile.fi.intel.com>
In-Reply-To: <20200520102452.GP1634618@smile.fi.intel.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Wed, 20 May 2020 14:37:13 +0300
Message-ID: <CAKKbWA5L_n7iC6-d22Am62SOoDBwNWO87+sXtRbwxwuVdjmRYA@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, wsa@the-dreams.de,
 Brendan Higgins <brendanhiggins@google.com>, ofery@google.com,
 Tali Perry <tali.perry1@gmail.com>, kfting@nuvoton.com,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks Andy,
Question below:

On Wed, May 20, 2020 at 1:24 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, May 20, 2020 at 12:51:12PM +0300, Tali Perry wrote:
> > Add Nuvoton NPCM BMC I2C controller driver.
>
> ...
>
> > +#ifdef CONFIG_DEBUG_FS
>
> Why?!

It is made to save code size if CONFIG_DEBUG_FS is not defined?
We see a lot of kernel code that is doing it.
So could you elaborate what is the problem?

>
> > +#include <linux/debugfs.h>
> > +#endif
>
