Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E3257F476
	for <lists+openbmc@lfdr.de>; Sun, 24 Jul 2022 11:36:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrJ2k0gNzz3brF
	for <lists+openbmc@lfdr.de>; Sun, 24 Jul 2022 19:36:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ANtyF2mK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ANtyF2mK;
	dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrJ2L0psPz30Ly
	for <openbmc@lists.ozlabs.org>; Sun, 24 Jul 2022 19:35:53 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id t22so7525626lfg.1
        for <openbmc@lists.ozlabs.org>; Sun, 24 Jul 2022 02:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kY/2lDsjH8rvyR9vI13gtj+VtHAX6pqqtYSZIT34gMQ=;
        b=ANtyF2mKb++gC6/Y0D4BWpKx7diw7+EEqMUgh3n2P/HJ6uj8iZMx80qEQv5EMBVQOe
         8LiZubbCg+DNm8jTrkbkv3ySYcxjjVH2DwZOdLZv1VDnYbSk6eg7BSmJF0hBg4ARvKec
         l2cC7rPy8IhAbQStVEDF4iUsJLYL/tOcxyrL2j0u3WrMHj6P+8NlnDSjnz7vK6nNRlIA
         wk8tRQ/ezcoNCcl3YdNwTV86qIPIPcP2MzQcIOa0nHa+Qqije50JNR2Hw39vLJUZr6rO
         LdnlgPn94kxJrvqpIfCUGnwNtjHKyH0wgph1/du6/kjONK1CtPra9Zd1eQppoNy4ps5c
         +HVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kY/2lDsjH8rvyR9vI13gtj+VtHAX6pqqtYSZIT34gMQ=;
        b=bxg+O+PRSThbltPmw1sZ5uwvUpS+DRs5nTzXRSMRQvN6x5I3DCAln8ysswIFxfwIE3
         nrD3MY7RZ1GoXbLAt5bDWEuhnHBGoPlBirrGW2RMv6vbCagFFEu23eUxSkICnjyNsLRY
         6UvZZcKs3KBc6lCJo5rb542JLdMehnt2DTY3q1FS3y5mISg9Oel1HQHTkkeK2/YV+XmA
         yWhw4IrNvGkvhv7mtV8ODLFuk+bCx4nDFoGyKQZVjD1Wb1VP0WnKOqgo7CEPCs6XgALD
         t0fBdGaZ174Sx+NEL3RMr33PGdcq/RR9Ur+XFziqaznTtEaF6exasr1bW0c2LO7rv0/J
         0ocg==
X-Gm-Message-State: AJIora+kg9JRt+iNNVIfGh0ctZNxmljPngY/8FDNAzXfyy3KrdpzSuDT
	VdWafwB+yU8t5qDrnXC1xSY6+4dmFWHZnoETkVo=
X-Google-Smtp-Source: AGRyM1ttd4MQTqOMMfzH0Y37+KPEPMu8Aswiq+gjP4iO8JKTk6mNJSA0L8DCpp4Ma/G/aSrXXw+S1m4GvlnoYIE2Jy0=
X-Received: by 2002:a05:6512:1190:b0:48a:19d5:ef23 with SMTP id
 g16-20020a056512119000b0048a19d5ef23mr2732227lfr.401.1658655348919; Sun, 24
 Jul 2022 02:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220721101556.118568-1-tmaimon77@gmail.com> <20220721101556.118568-2-tmaimon77@gmail.com>
 <YtlYt/5VKIblUHBP@sirena.org.uk>
In-Reply-To: <YtlYt/5VKIblUHBP@sirena.org.uk>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 24 Jul 2022 12:35:37 +0300
Message-ID: <CAP6Zq1hu4GtFrLa5O_7gyszXwpfijJF=XU0hdw8FBbvj3Bk8Hg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] spi: npcm-pspi: add full duplex support
To: Mark Brown <broonie@kernel.org>
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
Cc: devicetree <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Mark,

Thanks for your detailed explanation!

On Thu, 21 Jul 2022 at 16:46, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jul 21, 2022 at 01:15:55PM +0300, Tomer Maimon wrote:
>
> > The NPCM PSPI handler, on TX-buffer not null, would perform a dummy read
> > but did not save the rx-data, this was valid only for half duplex.
>
> > This patch adds full duplex support for NPCM PSPI driver by storing all
> > rx-data when the Rx-buffer is defined also for TX-buffer handling.
>
> This doesn't seem to entirely correspond to what the patch does, nor to
> what the driver currently does?  I can't see any dummy read code in the
> current driver.
>
In the current handler file, in the handler function.
static irqreturn_t npcm_pspi_handler(int irq, void *dev_id)
....
-       if (priv->tx_buf) {
-               if (stat & NPCM_PSPI_STAT_RBF) {
-                       ioread8(NPCM_PSPI_DATA + priv->base);
the read above doing a dummy read
-                       if (priv->tx_bytes == 0) {
-                               npcm_pspi_disable(priv);
-                               complete(&priv->xfer_done);
-                               return IRQ_HANDLED;
-                       }
-               }


> >  static void npcm_pspi_send(struct npcm_pspi *priv)
> >  {
> >       int wsize;
> > -     u16 val;
> > +     u16 val = 0;
> >
> >       wsize = min(bytes_per_word(priv->bits_per_word), priv->tx_bytes);
> >       priv->tx_bytes -= wsize;
> >
> > -     if (!priv->tx_buf)
> > -             return;
> > -
> >       switch (wsize) {
> >       case 1:
> > -             val = *priv->tx_buf++;
> > +             if (priv->tx_buf)
> > +                     val = *priv->tx_buf++;
> >               iowrite8(val, NPCM_PSPI_DATA + priv->base);
> >               break;
>
> These changes appaear to be trying to ensure that when _send() is called
> we now always write something out, even if there was no transmit buffer.
> Since the device has been supporting half duplex transfers it is not
> clear why we'd want to do that, it's adding overhead to the PIO which
> isn't great.  This also isn't what the changelog said, the changelog
> said we were adding reading of data when there's a transmit buffer.
> Similar issues apply on the read side.
>
> AFAICT the bulk of what the change is doing is trying make the driver
> unconditionally do both read and writes to the hardware when it would
> previously have only read or written data if there was a buffer
> provided.  That's basically open coding SPI_CONTROLLER_MUST_TX and
> SPI_CONTROLLER_MUST_RX, if that's what the hardware needs then you
> should just set those flags and let the core fix things up.
We will try to use SPI_CONTROLLER_MUST_TX and SPI_CONTROLLER_MUST_RX
>
> > +       /*
> > +        * first we do the read since if we do the write we previous read might
> > +        * be lost (indeed low chances)
> > +        */
>
> This reordering sounds like it might be needed but should have been
> mentioned in the changelog and is a separate patch.

Best regards,

Tomer
