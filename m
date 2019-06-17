Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF84479BF
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2019 07:43:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45S0Vf0dlJzDqRG
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2019 15:43:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="TRCdVx84"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45S0TB4tv1zDqZW
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 15:41:50 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id d23so9366721qto.2
 for <openbmc@lists.ozlabs.org>; Sun, 16 Jun 2019 22:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qxXch08d4fZ3Id5fmyA7W1u3b6+ZfF1CBfigkq8s2rA=;
 b=TRCdVx849aZAkqtLV02bMa4euX7m+BPENpqhvNw2fjUnqv503vwLcv+FZglI31fh1l
 v7Z3f5tFXdq40DgCRaEsk8lAGhJusVC8MHZ5Kdg7jZH4saZjScPwN4VT40GqRrDUZwRU
 CxtYX4u4qOOU6ah4mvfFwREASXybQZATZsdJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qxXch08d4fZ3Id5fmyA7W1u3b6+ZfF1CBfigkq8s2rA=;
 b=FXW1o8ELPbfxKnY4OJnPtoomp997T8YAcmSVjhbGiGTCuPtdpYOgrl1mbi7PRkXH3i
 FUVhsRSE9i9iklYWVb1Wnq9GJaWdgBqmSD/Qqcu7BR66Lsy8YfSQnGWakO7vtzPQ6a1c
 cZJdGn9q9nLQNjgTC6EoOwatuaEPJQUvyzbBDXZWeODJPxEGZ9iYUFgl5YLaeva5FuIm
 t8vB7JizQQPVdSBAncl5o5TZTeDRJfXcKqW0w2W0XvMf0MKDLI2BcELnUkZgDdPs4tae
 NQu/ky5OzDKpWDuU71IW1yv5RRMvtWzYYxcZPyDDwBK4JuFi1QYZimIyBciI4R1YP7hJ
 kFbw==
X-Gm-Message-State: APjAAAUtM1Pby6FT5oLOq81jC7H8WuJ68DjmoONlT1WdfmkJw42rWivq
 rt+rsm5aapALX7tKmAJeLZ5sNNUAotFdtWuMKII=
X-Google-Smtp-Source: APXvYqwtJ9yjwN8q8bNTEnUD+BU1xWmAf7Vp0BGjcSYK+UCjwQQ/9+zWWbU7bLlwTYKHgWELeJ9LXv2OptmtbXr91Vw=
X-Received: by 2002:ac8:2d69:: with SMTP id o38mr78635529qta.169.1560750105862; 
 Sun, 16 Jun 2019 22:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <1548090958-25908-1-git-send-email-eajames@linux.ibm.com>
 <1780173.icGFXHrAMq@townsend>
In-Reply-To: <1780173.icGFXHrAMq@townsend>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Jun 2019 05:41:34 +0000
Message-ID: <CACPK8XfqSyMB4pWLffzx+8qOj+m54h=aWUhYsKMV4TQR0fKVUg@mail.gmail.com>
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

On Mon, 17 Jun 2019 at 02:09, Alistair Popple <alistair@popple.id.au> wrote:
>
> On Monday, 21 January 2019 11:15:58 AM AEST Eddie James wrote:
> > SBE fifo operations should be allowed while the SBE is in any of the
> > "IPL" states. Operations should succeed in this state.
> >
> > Signed-off-by: Eddie James <eajames@linux.ibm.com>
>
> This fixed the problem I was having trying to issue istep operations to the
> SBE.
>
> Tested-by: Alistair Popple <alistair@popple.id.au>

This one slipped through the cracks.

Fixes: 9f4a8a2d7f9d fsi/sbefifo: Add driver for the SBE FIFO
Reviewed-by: Joel Stanley <joel@jsm.id.au>

Greg, can you please queue this one up for 5.3?

Cheers,

Joel

> > ---
> >  drivers/fsi/fsi-sbefifo.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> > index c7d13ac..f7665b3 100644
> > --- a/drivers/fsi/fsi-sbefifo.c
> > +++ b/drivers/fsi/fsi-sbefifo.c
> > @@ -290,11 +290,11 @@ static int sbefifo_check_sbe_state(struct sbefifo
> > *sbefifo) switch ((sbm & CFAM_SBM_SBE_STATE_MASK) >>
> > CFAM_SBM_SBE_STATE_SHIFT) { case SBE_STATE_UNKNOWN:
> >               return -ESHUTDOWN;
> > +     case SBE_STATE_DMT:
> > +             return -EBUSY;
> >       case SBE_STATE_IPLING:
> >       case SBE_STATE_ISTEP:
> >       case SBE_STATE_MPIPL:
> > -     case SBE_STATE_DMT:
> > -             return -EBUSY;
> >       case SBE_STATE_RUNTIME:
> >       case SBE_STATE_DUMP: /* Not sure about that one */
> >               break;
>
>
