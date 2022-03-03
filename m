Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2376E4CBDE3
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 13:36:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8Vps1VkSz3c1L
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 23:36:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cNSL1q3m;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=tali.perry1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cNSL1q3m; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8VpQ1gffz3bxR
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 23:36:12 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id j5so3928019qvs.13
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 04:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T4KGopGGDh3N9ZnQy5qnHV4FnEM8H/VnZKXOZ5Q7nKQ=;
 b=cNSL1q3mZ6E7CnNPKrfdcARsqZ4Eno+LMLePOVm6FFSgofxP5NSysdysfPK94l8F0a
 J5ZgOKyPc0pWmXy/WMaV2lzIKLniCFaUPcEVkxqjtORk0UlTIc9OnL8QTXuarTdghZbB
 ppmXgod4sNxsmiVWiDvTTt4HWgKB6BGIGTPnTfxqlYi7Mzw10Pl5YUJPKGE9yMfdLREx
 VNEBkQnSXuzoTHH98U4ATdoy3xf+musdGENdGSgRLkjQNgMglCUPkT71COzHUuZSVtMd
 dt15Xg0A7wEx5cFXvrWt/KgewjnboSl5SYUDDVsyLyj8CxuurObIc+xkolRhvCZh2OuE
 mPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T4KGopGGDh3N9ZnQy5qnHV4FnEM8H/VnZKXOZ5Q7nKQ=;
 b=No0UL7no4TnXpNCPuUOCP4JllB1XxJJS6ZD9Emdhdhf3fOAq2/SiV2a+goDxBmpr2L
 NH3secc4rsQcW9okkrhrsi9loaFaWbLJeJuqF+v18N6OW1TERpCs7BXvkeZ2Zh2El2/s
 RaNrgAyUF6//JGlYl1uZWVkU2xJI+3ej3cI/cOG8h5xPaw2dA35EVnYaBm1ONanLrFVk
 TNn4OuXXwLBu3i9mVXAdnZIGit+PZqdBdr290e2d5X+kSvUT3QoXylYO+RoXR68RH/hb
 aLlAZ/oTW1GzpHrtfTr6Yz89eG8maCOVkBwGjH/tH6cYZXcqcZKJ7mth5zQhfSM/Tw3w
 hkUw==
X-Gm-Message-State: AOAM530g4ZdWI43kuVkIZ7UAFYtG8MaEiZr4xZ4qPsiLmDjyjvbMeUOu
 NESlr0F0tjF+L+Mzuy17nqtul/C7+CcV+awkVXs=
X-Google-Smtp-Source: ABdhPJzQ0GX7pIFvv4QUE8a6vGgiHU4ubSw9lwS7j8KqUYZwl4V7qWLJ6nJgfgTZhogDE3QoxuJ/t4T9nQ7Hn/0o1Nw=
X-Received: by 2002:ad4:5be7:0:b0:435:1aad:6a84 with SMTP id
 k7-20020ad45be7000000b004351aad6a84mr5946245qvc.124.1646310969477; Thu, 03
 Mar 2022 04:36:09 -0800 (PST)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-12-warp5tw@gmail.com>
 <YiCb7LNY9tmMCZx7@smile.fi.intel.com>
In-Reply-To: <YiCb7LNY9tmMCZx7@smile.fi.intel.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Thu, 3 Mar 2022 14:35:58 +0200
Message-ID: <CAHb3i=tWhtXK+c5GGbp6m23AHoyy=4woT_+n3a_N-6CqKUYb=g@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] i2c: npcm: Support NPCM845
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 yangyicong@hisilicon.com, Linux I2C <linux-i2c@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 Rob Herring <robh+dt@kernel.org>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 Tyrone Ting <warp5tw@gmail.com>, semen.protsenko@linaro.org,
 jie.deng@intel.com, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
 Tali Perry <tali.perry@nuvoton.com>, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> On Thu, Mar 3, 2022 at 12:45 PM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Thu, Mar 03, 2022 at 04:31:41PM +0800, Tyrone Ting wrote:
> > > From: Tyrone Ting <kfting@nuvoton.com>
> > >
> > > Add NPCM8XX I2C support.
> > > The NPCM8XX uses a similar i2c module as NPCM7XX.
> > > The internal HW FIFO is larger in NPCM8XX.
> > >
> > > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> >
> > Wrong SoB chain.
> >
> > ...
> >
> > > +static const struct npcm_i2c_data npxm7xx_i2c_data = {
> > > +     .fifo_size = 16,
> > > +     .segctl_init_val = 0x0333F000,
> > > +     .txf_sts_tx_bytes = GENMASK(4, 0),
> > > +     .rxf_sts_rx_bytes = GENMASK(4, 0),
> > > +     .rxf_ctl_last_pec = BIT(5)
> >
> > + Comma.
> >
> > > +};
> > > +
> > > +static const struct npcm_i2c_data npxm8xx_i2c_data = {
> > > +     .fifo_size = 32,
> > > +     .segctl_init_val = 0x9333F000,
> > > +     .txf_sts_tx_bytes = GENMASK(5, 0),
> > > +     .rxf_sts_rx_bytes = GENMASK(5, 0),
> > > +     .rxf_ctl_last_pec = BIT(7)
> >
> > Ditto.
> >
> > > +};
> >
> > ...
> >
> > > -     left_in_fifo = FIELD_GET(NPCM_I2CTXF_STS_TX_BYTES,
> > > -                              ioread8(bus->reg + NPCM_I2CTXF_STS));
> > > +     left_in_fifo = (bus->data->txf_sts_tx_bytes &
> > > +                     ioread8(bus->reg + NPCM_I2CTXF_STS));
> >
> > Besides too many parentheses, this is an interesting change. So, in different
> > versions of IP the field is on different bits? Perhaps it means that you need
> > something like internal ops structure for all these, where you will have been
> > using the statically defined masks?
> >

Those are two very similar modules. The first generation had a 16 bytes HW FIFO
and the second generation has 32 bytes.
In V1 of this patchset the masks were defined under
CONFIG but we were asked to change the approach:

the entire discussion can be found here:

https://www.spinics.net/lists/linux-i2c/msg55566.html

Did we understand the request change right?


> > ...
> >
> > > +     match = of_match_device(npcm_i2c_bus_of_table, dev);
> > > +     if (!match) {
> > > +             dev_err(dev, "OF data missing\n");
> > > +             return -EINVAL;
> > > +     }
> > > +     bus->data = match->data;
> >
> > This is NIH of_device_get_match_data().
> >
> > ...
> >
> > > -static const struct of_device_id npcm_i2c_bus_of_table[] = {
> > > -     { .compatible = "nuvoton,npcm750-i2c", },
> > > -     {}
> > > -};
> > > -MODULE_DEVICE_TABLE(of, npcm_i2c_bus_of_table);
> > > -
> >
> > Redundant change, leave this as is.
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >

Thanks for the detailed review, Andy!

BR,
Tali Perry
Nuvoton Technologies
