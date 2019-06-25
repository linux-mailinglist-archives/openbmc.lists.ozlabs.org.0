Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7295221C
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 06:36:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Xtf8739SzDqTd
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 14:36:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="d8JpBEyr"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Xtdg3p3jzDqQr
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jun 2019 14:36:07 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id r6so11582968qkc.0
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jun 2019 21:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A4VoluwjYn3Ks0ZIkGlg8Yc+4trodUbg3aXJYu6f9aA=;
 b=d8JpBEyr4bqLJ0bCZdULxxz6Wh0yxXPVAfduL/AaZ819HoTQMaSoA+uFWz8wU1O6Sw
 0sMt9b5su3qhSP95Dg44UzOPaJA8RzF9imxVwUeD+4aKMLVzHfUAOhR6GE1uKFKedMDX
 kgShTZ8oy5Po/Tk6nP/PmDmZWZalcc2M9gCOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A4VoluwjYn3Ks0ZIkGlg8Yc+4trodUbg3aXJYu6f9aA=;
 b=WJ50K1QSQAQtwr1Of6XFDFTU40MUwmhKOlJh9vK9CMip04oILSJYjyG0fc9g8SekaU
 ynIXwAtiImp7+2Bi6Af1FwhcYwvg+4aOpgK+q7UpTyyH/Pq2P19eA6Pzp387rFOCEm49
 wY7HIeDya4hpE3OptUJMWyFsst69KYaY6/K6sg2Kcj6DUMTYhiHCAYccwH22K9cwsZCU
 SrAOWa6Mh84FvajlMRVHTNW2VsliM0RUHg+i0d/VdJ5EjF8esYIGdNpFW+Dl7emQYQao
 5Ucqw4WkWfIaG/r3ycdl/nJLLi6YEUOxPdnm/TbWNZ+jCLYj+oA6qBjydaefHMvJJUGz
 CeUw==
X-Gm-Message-State: APjAAAV/bUcXW2Y52T79DDxARIhWjbzyOEFbb6zSRrSvDvHQDMAqWKOE
 X9nP1cEZThYpVEoHbArSoK+OjQYh8ipZvF7kJSE=
X-Google-Smtp-Source: APXvYqy0NjWIKEjqeTKAOAopWh+hj+cONUs6ND0MCiv0+3feFzpJJoC+Ah8VomnDUGVPq0bmEo7OH2v0Aka1lUAXGUg=
X-Received: by 2002:a05:620a:16d6:: with SMTP id
 a22mr20459205qkn.414.1561437363245; 
 Mon, 24 Jun 2019 21:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <1548090958-25908-1-git-send-email-eajames@linux.ibm.com>
 <1780173.icGFXHrAMq@townsend>
 <CACPK8XfqSyMB4pWLffzx+8qOj+m54h=aWUhYsKMV4TQR0fKVUg@mail.gmail.com>
In-Reply-To: <CACPK8XfqSyMB4pWLffzx+8qOj+m54h=aWUhYsKMV4TQR0fKVUg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 25 Jun 2019 04:35:50 +0000
Message-ID: <CACPK8Xfns=dSD5gaVJ--OkmVe7ggqF8acGsszdPqM1AqpPSAiA@mail.gmail.com>
Subject: Re: [PATCH] fsi: sbefifo: Don't fail operations when in SBE IPL state
To: Alistair Popple <alistair@popple.id.au>,
 Greg KH <gregkh@linuxfoundation.org>
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
 Eddie James <eajames@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Greg,

On Mon, 17 Jun 2019 at 05:41, Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 17 Jun 2019 at 02:09, Alistair Popple <alistair@popple.id.au> wrote:
> >
> > On Monday, 21 January 2019 11:15:58 AM AEST Eddie James wrote:
> > > SBE fifo operations should be allowed while the SBE is in any of the
> > > "IPL" states. Operations should succeed in this state.
> > >
> > > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> >
> > This fixed the problem I was having trying to issue istep operations to the
> > SBE.
> >
> > Tested-by: Alistair Popple <alistair@popple.id.au>
>
> This one slipped through the cracks.
>
> Fixes: 9f4a8a2d7f9d fsi/sbefifo: Add driver for the SBE FIFO
> Reviewed-by: Joel Stanley <joel@jsm.id.au>
>
> Greg, can you please queue this one up for 5.3?

Ping?

>
> Cheers,
>
> Joel
>
> > > ---
> > >  drivers/fsi/fsi-sbefifo.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> > > index c7d13ac..f7665b3 100644
> > > --- a/drivers/fsi/fsi-sbefifo.c
> > > +++ b/drivers/fsi/fsi-sbefifo.c
> > > @@ -290,11 +290,11 @@ static int sbefifo_check_sbe_state(struct sbefifo
> > > *sbefifo) switch ((sbm & CFAM_SBM_SBE_STATE_MASK) >>
> > > CFAM_SBM_SBE_STATE_SHIFT) { case SBE_STATE_UNKNOWN:
> > >               return -ESHUTDOWN;
> > > +     case SBE_STATE_DMT:
> > > +             return -EBUSY;
> > >       case SBE_STATE_IPLING:
> > >       case SBE_STATE_ISTEP:
> > >       case SBE_STATE_MPIPL:
> > > -     case SBE_STATE_DMT:
> > > -             return -EBUSY;
> > >       case SBE_STATE_RUNTIME:
> > >       case SBE_STATE_DUMP: /* Not sure about that one */
> > >               break;
> >
> >
