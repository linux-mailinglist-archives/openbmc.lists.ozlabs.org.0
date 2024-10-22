Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4070C9A9C10
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2024 10:09:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXlFL2yQNz3c57
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2024 19:09:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729584548;
	cv=none; b=bNbPXOlzO58swyBFGCMJMPXWL2yMB5pzK61yX2p6uZi3dAt+lkXRMyLVlO0ziEBtgKEKuazHAQew+BNsYSQsP2KnItw0+lkF6rRlhTbgqHRTDVzIPiPEesG28LUKvVELnUSiCl2x3mhoq9DxDTCNUnvvzBr8lNqAuTWIHDT8z75DaqM51XCJsX0fS0RmKpyBrh1J50xAsNY7Vy4FnaMmOr5fCf8B9+z0i4KJ0vkAYj6TRuRE4IPTYKbLJDebhU/MMfVDftw7JzijevPQKZPVE3Cr29QySQSzS61ZwDAcoTbRfYXH/DL94eAdirBRRC4r4fhgMQXwqrQRD8yPd0PV2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729584548; c=relaxed/relaxed;
	bh=0RAxTUOgyeH/1NC7uW/0971TmzKMGlKwhAldeokcnpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L8S5qIfV7F/MeuZUdIS4qzuKf4wo0UL3U9avik6Y2/6vjCLmfpBwJtH/Rg25kZUNIdXkjOk0kYm4h0IQuOBjRvSGHDU0E6wxwbGO1Hyjo9L1GI1itsZ+I1IHCus0f/6RZsxDYz/gi8MrwC2k/6QbPFWFKVbTfkdPK8Ib194bnpUlqoBn6rNGeyuOomiP/fWVV6u/JLiZJRXn7QfvdUroMbBBdIejZKvVn6kaT+2xH/vvJdEPlhptBSL3ByIwA9Lzgju1NS8cCKk8sgpNEHs3rZfcP67jMuysPAt6fD4+BeyOnOvgLAWXHucGxkkm22NdQ8jvYQSVGMrOwL78dQaIhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aRdZWKfD; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aRdZWKfD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXlFG0zQWz2xQC
	for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2024 19:09:05 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a99c0beaaa2so880213866b.1
        for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2024 01:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729584538; x=1730189338; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RAxTUOgyeH/1NC7uW/0971TmzKMGlKwhAldeokcnpw=;
        b=aRdZWKfDjcPjlDAFDom9oT22u6AqGILhMdbx/B80LjQexXu5llitKcBeFKPzjfWgL5
         9WOChqWPExq4vvFnX6ZOZx2lChwdPZ1EMtbNRH1TBUANwwtbJq2sX6h7Lj9q0bvUvTqX
         vdUokzCX8AwHkxbCWkHEFp6WyM04jj69u+KP0aWR3mXfw2dpuXqqQCmOsMS59hW775rv
         AMau+1uilXNi1WLfuxXLzorKQOEasySY1VGveEVz7cgLT9q7vJMCAqAnKqLHNPwYMpkK
         xdcslevMs++e+DiG6gw+x+GRIYPQ7pYbqI/8jNJwEnEwHu8Lftz0Xr30Dygl0T9rcaRW
         3g/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729584538; x=1730189338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RAxTUOgyeH/1NC7uW/0971TmzKMGlKwhAldeokcnpw=;
        b=PhOfzBlVBGrTore9pwaJMw9RPkiw/8+UmUNdmwjzExmsjst6ahz4v4a4F9fBo0L7Dk
         FhKv7vQSfX/qxhDf/VIQXZDW27QCFCVzyd3EdOKOVpGqb4gd1srIDkl1UVb0N8jmsT+M
         Qh/Bc77omzr9XKE/I73/0mySkbcEtpGm1SwtdqKzSGljs/Im/wUiGg8Ehd6wCSU584pH
         BobxAb+vdqgJH46NDIgqZunlF5qaYH+goMMGJtSZLSlkHsE+oO2WNx10daJ7KjXPRBLm
         DCLSFMQvunMLDnx7PTqnRALv2yKsOjraw46fP6SyFRx2VWOHrWs0hCZg5t+NeBpT2b/z
         Wkjg==
X-Forwarded-Encrypted: i=1; AJvYcCVT0/AG3SvP65zRncvvBwDgputekkrYPlYeVyPFHaviRUqh/yLywecr/h4yvy8zvTa34sb8P58R@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyg7rVhpKq9Zkp1vKY/8e/sWfXNoFv3nPeULXARGi9yenf/p2Tc
	dDwzpdH2PqnUjjU0aGpDktWRYVBxxH0LGx4v6ZAOl+d2Q+Io58EEHAwoDG/h5uKxyNuWuunNdkp
	5nYGxnPttnlBvoph7QqhEZeOi7Q==
X-Google-Smtp-Source: AGHT+IEMyzU8oyfnzRI+pT4T4yIREUGwYqA6I7VpHwZ8v8JLgOy4CIxmXoXC9birxtulDqF1tvfCjzvR+SG6CwoK3RQ=
X-Received: by 2002:a17:907:3f9d:b0:a99:fc3d:7c76 with SMTP id
 a640c23a62f3a-a9a69bb56admr1684531166b.37.1729584537520; Tue, 22 Oct 2024
 01:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241021062732.5592-1-kfting@nuvoton.com> <20241021062732.5592-3-kfting@nuvoton.com>
 <67d34216-e98b-43d9-afd1-2e73ffb71968@molgen.mpg.de>
In-Reply-To: <67d34216-e98b-43d9-afd1-2e73ffb71968@molgen.mpg.de>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Tue, 22 Oct 2024 16:08:46 +0800
Message-ID: <CACD3sJb_xF_wYuLEMV3yF0HdtrOX3vnPUdZ6_x5yof7yj4yUNg@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] i2c: npcm: Modify the client address assignment
To: Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, tali.perry1@gmail.com, wsa@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Paul:

Thank you for your comment.

It'll be addressed in the next patch set.

Paul Menzel <pmenzel@molgen.mpg.de> =E6=96=BC 2024=E5=B9=B410=E6=9C=8821=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:01=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Dear Tyrone,
>
>
> Thank you for your patch.
>
> Am 21.10.24 um 08:27 schrieb Tyrone Ting:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Store the client address earlier since it might get called in
> > the i2c_recover_bus() logic flow at the early stage of
> > npcm_i2c_master_xfer().
>
> Thank you for the description. For the summary/title it=E2=80=99d be grea=
t, if
> you were more specific. For example:
>
> i2c: npcm: Assign client address earlier for `i2c_recover_bus()`
>
> It=E2=80=99d be great if you noted the commit, your patch fixes, so it=E2=
=80=99s clear
> since when the problem has been present.
>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Reviewed-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >   drivers/i2c/busses/i2c-npcm7xx.c | 20 +++++++++++++++++++-
> >   1 file changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index c96a25d37c14..a9a9b21f1f0b 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -2155,6 +2155,16 @@ static int npcm_i2c_master_xfer(struct i2c_adapt=
er *adap, struct i2c_msg *msgs,
> >
> >       } while (time_is_after_jiffies(time_left) && bus_busy);
> >
> > +     /*
> > +      * Previously, the 7-bit address was stored and being converted t=
o
> > +      * the address of event in the following call to npcm_i2c_master_=
start_xmit().
> > +      *
> > +      * Since there are cases that the i2c_recover_bus() gets called a=
t the
> > +      * early stage of npcm_i2c_master_xfer(), the address of event is=
 stored
> > +      * and then used in the i2c_recover_bus().
> > +      */
> > +     bus->dest_addr =3D i2c_8bit_addr_from_msg(msg0);
> > +
> >       /*
> >        * Check the BER (bus error) state, when ber_state is true, it me=
ans that the module
> >        * detects the bus error which is caused by some factor like that=
 the electricity
> > @@ -2165,6 +2175,15 @@ static int npcm_i2c_master_xfer(struct i2c_adapt=
er *adap, struct i2c_msg *msgs,
> >        * bus is busy.
> >        */
> >       if (bus_busy || bus->ber_state) {
> > +             /*
> > +              * Since the transfer might be a read operation, remove t=
he I2C_M_RD flag
> > +              * from the bus->dest_addr for the i2c_recover_bus() call=
 later.
> > +              *
> > +              * The i2c_recover_bus() uses the address in a write dire=
ction to recover
> > +              * the i2c bus if some error condition occurs.
> > +              */
> > +             bus->dest_addr &=3D ~I2C_M_RD;
> > +
> >               iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
> >               npcm_i2c_reset(bus);
> >               i2c_recover_bus(adap);
> > @@ -2172,7 +2191,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapte=
r *adap, struct i2c_msg *msgs,
> >       }
> >
> >       npcm_i2c_init_params(bus);
> > -     bus->dest_addr =3D slave_addr;
> >       bus->msgs =3D msgs;
> >       bus->msgs_num =3D num;
> >       bus->cmd_err =3D 0;
>
>
> Kind regards,
>
> Paul

Have a nice day.

Regards,
Tyrone
