Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B329BC2C9
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2024 02:53:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjBF44C8Gz3bxp
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2024 12:53:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730771590;
	cv=none; b=dcDZ1Fnr6zTaq9qg+yJtD1iiOEsWyYpfFbm8iPVoFf9sWQLq6hH9+8gWnnIQRVOKnFVHrF5AqBbHMKaIuh94yLijoHkRKr3AmFA16NsUm1niECmY/1G3ooO354GblTunP4EhRTGlclDOoqgg68WqWn1BcxSg36TgS4HhoXhOO9j7K4Jb80elp77goeawtJ3LUmd0NEXXiRkBsK5hsHR/9X+uSMbqX+w3qHYvf8vYfeuH0nY3PfW04AUSkx29F2obA/7ondWtZYzhS3WwNnDqUxTyD2upqMoVKm3h63/wHeUJppXV7LbBHOfDeL3QKokBFyXbjfNUYogwCcO/vo8g4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730771590; c=relaxed/relaxed;
	bh=VIdb5nyjPQMMLtSpo3yTfiFAYqNS0d+cY2Xi5pY2LfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K91MzTUaR1e1UyaNd4okCaUR1JjvNej+1ntYpvTGnTur7etHTGVTSyl69SxSZA3R1UCJrers+p6gT0NRhlknCQ5WTVMlzJ/C8Q7rRziZ4rdW3po0cz4v9oeNqtTBbaLERj4kvn8OfFJRPRxav3U8TUBAc8j8CFGKbUenwc0z4XLU551rSCxHSwZxEhcwC8tZTalCKNeSzVDxnLT4sJs7nY8jRVY9L2yhQ8Mkah1cFcEsqYVEj4X1TWBaIPuM12B+j6hfihZynLjU3+yaDOIbGb0WqVIKvfUcad0Y7h/8sPavD+I4xRFekBkcXsLBmDa0aQKkWuAlueHExAYy3lMsNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aT8NgtJR; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aT8NgtJR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjBF03RB8z2xgQ
	for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2024 12:53:06 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a9a1b71d7ffso859258066b.1
        for <openbmc@lists.ozlabs.org>; Mon, 04 Nov 2024 17:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730771584; x=1731376384; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIdb5nyjPQMMLtSpo3yTfiFAYqNS0d+cY2Xi5pY2LfY=;
        b=aT8NgtJRZqqgxBFMhe6KlZ1z7hRNnVgc44JPgDcPqq+EJqhzFsBobNzaz5H4L0uG3R
         KS5aKImjd6/2pwlY0l9iZKrV6uLEBExtZCTKjC5A0DCj8tPwmAeOMNNQ//NW+ITppmHs
         +SiiGrSJkpDa1RK+Fk7nAhrfha2/Tpkc1NmWd4pHRuxf2R2/p/xwVdd63D3nNZs4iDAd
         dT8TXlbwBSfmBjyvmlMmOCcr6TbzMdCEeipDjnX2QFjHHXATwvqhw48iMQbAkjWg8NN9
         KQbkW4iaVoqWWwfr6wLyBNzMk3vkn1l4f7/JGERpwV2vxtLyryyTxPDJJnHQWW+Os0BH
         2ckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730771584; x=1731376384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIdb5nyjPQMMLtSpo3yTfiFAYqNS0d+cY2Xi5pY2LfY=;
        b=qpx+mQepmZqNHYi99bv+hM3gTSHSg7lS5qvi3NDTwsrw4dkp+krizeQ8DnMHqY8vKJ
         QT7M8b4jD8zhAm8k+DwZt3wbl71yqsU+IUmA3g2zze1mtiJC9dw9/6bco/veU7JGVGos
         oqQNQfP4Sn1SM6eQOLcf8UlqklK8/mqKLEwoUesYP7sWl03YVHgDNMJYcJP7vZK/9XvU
         99B9CF9N4ljc4zhqMpqTkmtUug8nw/r45oE1Ud/qBwSTRsF5vEygqW8ODZiK1E6WYRhe
         1HxPzLCPON0MTNkLROt0phlQX7gR0fQ+hPbYZQnWECaOQpPMZLk5cR3q82eQlEBXl8cy
         ttDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVztwGzfskQcNvRM/dY0MtjNZvAMCUqWaT73IdhxiWRP7Eeyls1uzQQ4q6ZVUxTi2RwRzwKJ2K1@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxp9+m5aNGh03VJseYzJou/v8NH3/6UyXZpDdQnf/I0bVBvaQwN
	GHqnxbSXl6JR5fHFO90KEJg4ohxddh5K5URQV3Wgx+hLsPGKIAX7wHoiwG+kNn1L96kDuz7NC4G
	/v2sGqR1VbxwrdvoKZZF9rhB9Ug==
X-Google-Smtp-Source: AGHT+IHspJhT15caW/7rLneaz/8IbmEzTw+V8hoTRG1f9gwXEhSDWDC2CZBeah+K02DugV/yuKzB3d/9cAl1QjPyDTY=
X-Received: by 2002:a17:906:dc91:b0:a9a:4f78:c3 with SMTP id
 a640c23a62f3a-a9e3a5a0da3mr2162429366b.21.1730771583301; Mon, 04 Nov 2024
 17:53:03 -0800 (PST)
MIME-Version: 1.0
References: <20241021062732.5592-1-kfting@nuvoton.com> <20241021062732.5592-3-kfting@nuvoton.com>
 <kzsvr3jepoqjahn7n2jch5vrqim5eknylrasvsbjugfhzny46o@bemfk6knfmxi>
 <CACD3sJbWKkBtyq-gnicASJvRnz_nGjVAyVgnreNV7RS+MLOWJw@mail.gmail.com> <CACD3sJbyrzfE0UfoeMhjTg-c1huZmykXLeQKDj-FO8er=awwDQ@mail.gmail.com>
In-Reply-To: <CACD3sJbyrzfE0UfoeMhjTg-c1huZmykXLeQKDj-FO8er=awwDQ@mail.gmail.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Tue, 5 Nov 2024 09:52:51 +0800
Message-ID: <CACD3sJbC77doxo_mBmEVVMJfm2rX9bWAvT1cgeZ77aC60zG7WA@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] i2c: npcm: Modify the client address assignment
To: Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andi:

May I have your comments about my feedback on these patches?

Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=8829=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:50=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Andi:
>
> Sorry to bother you.
>
> May I have your comments about my feedback on these patches?
>
> It'll be great to know if I need to prepare the next patch set for review=
ing.
>
> Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=8825=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:43=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Hi Andi:
> >
> > Thank you for your comments.
> >
> > Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:04=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > >
> > > Hi Tyrone,
> > >
> > > ...
> > >
> > > > +     /*
> > > > +      * Previously, the 7-bit address was stored and being convert=
ed to
> > > > +      * the address of event in the following call to npcm_i2c_mas=
ter_start_xmit().
> > >
> > > Do we care how it was done previously? I think this is not a
> > > useful information as the code readers will se the code the way
> > > it is now, not the way it was done "previously".
> > >
> >
> > Yes, it's not a useful information anymore.
> >
> > > (there is a related comment at the end)
> > >
> > > > +      * Since there are cases that the i2c_recover_bus() gets call=
ed at the
> > > > +      * early stage of npcm_i2c_master_xfer(), the address of even=
t is stored
> > > > +      * and then used in the i2c_recover_bus().
> > >
> > > I could rephrase this sentence to something like:
> > >
> > > /*
> > >  * Store the address early in a global position to ensure it is
> > >  * accessible for a potential call to i2c_recover_bus().
> > >  */
> >
> > Understood. Thank you for your help on this.
> >
> > >
> > > > +      */
> > > > +     bus->dest_addr =3D i2c_8bit_addr_from_msg(msg0);
> > > > +
> > > >       /*
> > > >        * Check the BER (bus error) state, when ber_state is true, i=
t means that the module
> > > >        * detects the bus error which is caused by some factor like =
that the electricity
> > > > @@ -2165,6 +2175,15 @@ static int npcm_i2c_master_xfer(struct i2c_a=
dapter *adap, struct i2c_msg *msgs,
> > > >        * bus is busy.
> > > >        */
> > > >       if (bus_busy || bus->ber_state) {
> > > > +             /*
> > > > +              * Since the transfer might be a read operation, remo=
ve the I2C_M_RD flag
> > > > +              * from the bus->dest_addr for the i2c_recover_bus() =
call later.
> > > > +              *
> > > > +              * The i2c_recover_bus() uses the address in a write =
direction to recover
> > > > +              * the i2c bus if some error condition occurs.
> > > > +              */
> > > > +             bus->dest_addr &=3D ~I2C_M_RD;
> > > > +
> > > >               iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
> > > >               npcm_i2c_reset(bus);
> > > >               i2c_recover_bus(adap);
> > > > @@ -2172,7 +2191,6 @@ static int npcm_i2c_master_xfer(struct i2c_ad=
apter *adap, struct i2c_msg *msgs,
> > > >       }
> > > >
> > > >       npcm_i2c_init_params(bus);
> > > > -     bus->dest_addr =3D slave_addr;
> > >
> > > We can now get rid of slave_addr. It's just used in
> > > npcm_i2c_master_start_xmit(). Right?
> >
> > Yes, slave_addr is just used as the link
> > https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-np=
cm7xx.c#L2182
> > suggests with this patch.
> >
> > >
> > > Andi
> > >
> > > >       bus->msgs =3D msgs;
> > > >       bus->msgs_num =3D num;
> > > >       bus->cmd_err =3D 0;
> > > > --
> > > > 2.34.1
> > > >
> >
> > Thank you.
> >
> > Regards,
> > Tyrone
>
> Have a nice day.
>
> Thank you.
>
> Regards,
> Tyrone

Thank you.

Regards,
Tyrone
