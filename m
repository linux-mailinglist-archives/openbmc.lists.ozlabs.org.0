Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FAE98FC53
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2024 04:29:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKXYm0Nf2z3c2v
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2024 12:29:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728008968;
	cv=none; b=GtJOfO9ehNpHQ1CUaIbL/fXz12ZCTeAG57hRVOUasiaJaTMbHre8JD58hUDvmIpJmfdYbOw0dEeOe5N4WER/scX1Bki1G8/KGgCHxvWq4X0npcXpVlUcCWOkqxqL5tzxF7cVg6M5KB+7BDxcJOopdrxbKeGplZ8978rAJJiETYbJ1CuGkU4XOHF7jUqcUoqQvu/tZyvoGrYJXTpimec0NcamqSUjDW77ezPRE6/B6EiiN1Gh3oLKO1Rlz9yk4pPN0qbaEhMNaO7xiOwQ4FgQ5ATCZ7ASffuQ7vOF8B2ZJuGSjE2dfqgrLpvE0r8A902xR/Yh/0x+M0bzX+1jH9JIyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728008968; c=relaxed/relaxed;
	bh=/mhCMNngyFRcrq9Jaifi5sCxy3Lm9pQkHqN1LFTdRQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENfM27DToEF42MZrdksJfKmXiHvtifu4Fb749CQaSpbcU31cfPbcx9YX914DazaurIEF8MQe/ioYZ7r+oxdNKomWZkGg/c0zVJVedjuA9AyxqWeE7gnQOtPXz3sRyhDpmn7JIj639y7uQxPNH1BRef3Zs/8YRShaLlYWn/cQ1hi3nn2Sy5JybbCK+7GfV7SQIggGDEo8KVLSCD3aaT0Gt4lHQaqFGKNc+2hfjUX7KhIBNdSFj53Qv4BMc/xBsfUO/ZCmeg3thlUOr7uvz7CqaswfS3FofLYlD/umb2wfJJXo2gvKxiVqvTZkkK5BBgUxJpAPTJ5Ys0QT8aEOOrjw3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BDgi7a9j; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BDgi7a9j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKXYf6rCMz2yfm
	for <openbmc@lists.ozlabs.org>; Fri,  4 Oct 2024 12:29:25 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a8a6d1766a7so240032766b.3
        for <openbmc@lists.ozlabs.org>; Thu, 03 Oct 2024 19:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728008962; x=1728613762; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mhCMNngyFRcrq9Jaifi5sCxy3Lm9pQkHqN1LFTdRQ8=;
        b=BDgi7a9jC0dpTi0tUl30lLBM8TonAQyGHJG0xHcDzuex/k51f2nxd4bufATtjT184V
         CJkYul/RbeaJInePvs2/st8VZjUxFuoO0Ba7mwJAZ/d+uNZ43QN5kjtQuEgW+jYOZzbi
         uOrvCEkobcmWsrCBVnpyUAAHb/hsfuWxiCs6IDjlPhR11wE66ikDqAlF4k7uyyw1mYJV
         jM0LAkxJSlHaOx9lz72xnI+ggT1zAuGbDbcqenw7GVYvrwJb6UJSkAlDm4Wv1R9daBoU
         LILKy3bXybm2TawoSKkVMyiiWg+F/JWHdZ93dxurj/ePjm31RqlGwg9fHDGpa9H82l64
         yGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728008962; x=1728613762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mhCMNngyFRcrq9Jaifi5sCxy3Lm9pQkHqN1LFTdRQ8=;
        b=kqGH2s2jVe+E8GiQUUnd6L5dIsK8tlXcHJqtU1ISmXq55oOAHWeJzuufysThGWTpIO
         zboeUQFwgLg7Hgmb3mmhuHMlABCVbSgjlFga8fCjHpg92RdXEa1R+8lx/ThuH3KR2zM0
         Fxfss3l/ZBpyJUKjS3+k8FQ2GwGzzgZC8pkngZIp1Yt2gJwVPMpMIr97xHvGodynAQ8A
         iS2pBi6E+/5vN8FkCm49RVJHrxb7H49a5hL+s69d4Rhrdr2+wv0Ul8AoSszTYmSsSkKU
         dA24uDA+fDRruGyY5uqz4MeInbZWKXdMhpGyZTQvgOyBg8T7cW/CVsjAlUVb2oqhCNo8
         ACdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgDPzU7Y6jSwQ1epz24SlzFz0cUSruj5BN09HEVVLQ/chFojpf8UPw2muRi+bjfEY69QCxoO/v@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxMvZoY//t1kx1Olp9rQueJKn+2tVvAfXcHVROnfwSB7IOkmFUP
	DyGxoOzbKsWWGpcxMd3IvvcgUYtO4w1gxWnuZ8dHkp80y3kV9w54OtGesdBdj8/8Ttu9nuIY/dq
	NFHVoGoZE7VBaKr4b7svNvnttOA==
X-Google-Smtp-Source: AGHT+IHyv/4HLv4MIflnH3aGXq3LiQKW2demZrfTWF98TpbeJidf5/cs0qnOwP+AZ07FFnPWLqfwC03CIfC+wk0jGVg=
X-Received: by 2002:a17:907:9619:b0:a93:d088:8ac9 with SMTP id
 a640c23a62f3a-a991bd71e36mr98775266b.36.1728008962227; Thu, 03 Oct 2024
 19:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20241001062855.6928-1-kfting@nuvoton.com> <20241001062855.6928-5-kfting@nuvoton.com>
 <Zvv2Y10hJqGnUDvW@smile.fi.intel.com> <CACD3sJbJ0cNCRiBba73BOAkO=jn9KuJJXC1-Sy_iVf_8EJSjxA@mail.gmail.com>
In-Reply-To: <CACD3sJbJ0cNCRiBba73BOAkO=jn9KuJJXC1-Sy_iVf_8EJSjxA@mail.gmail.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 4 Oct 2024 10:29:10 +0800
Message-ID: <CACD3sJa23TEfBQ_b8PGM8ot2L0g4n=GcqvPk0HJGjRf-d+=-pg@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] i2c: npcm: Modify the client address assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, tali.perry1@gmail.com, wsa@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy:

Thank you for your comments.

After a second thought, I'll explain why slave_addr << 1 is given here.

Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=884=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Andy:
>
> Thank you for your comments and they'll be addressed.
>
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=
=B410=E6=9C=881=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:17=E5=AF=AB=
=E9=81=93=EF=BC=9A
> >
> > On Tue, Oct 01, 2024 at 02:28:53PM +0800, Tyrone Ting wrote:
> > > From: Tyrone Ting <kfting@nuvoton.com>
> > >
> > > Store the client address earlier since it might get called in
> > > the i2c_recover_bus() logic flow at the early stage of
> > > npcm_i2c_master_xfer().
> >
> > ...
> >
> > > +     /*
> > > +      * Previously, the address was stored w/o left-shift by one bit=
 and
> > > +      * with that shift in the following call to npcm_i2c_master_sta=
rt_xmit().
> > > +      *
> > > +      * Since there are cases that the i2c_recover_bus() gets called=
 at the
> > > +      * early stage of npcm_i2c_master_xfer(), the address is stored=
 with
> > > +      * the shift and used in the i2c_recover_bus().
> > > +      *
> > > +      * The address is stored from bit 1 to bit 7 in the register fo=
r
> > > +      * sending the i2c address later so it's left-shifted by 1 bit.
> > > +      */
> > > +     bus->dest_addr =3D slave_addr << 1;
> >
> > I'm wondering if it's better to use i2c_8bit_addr_from_msg() here?
> >

The current implementation of i2c_8bit_addr_from_msg() (ref link:
https://github.com/torvalds/linux/blob/master/include/linux/i2c.h#L947)
is
"return (msg->addr << 1) | (msg->flags & I2C_M_RD);" and it takes
extra consideration about the read flag when retrieving the i2c
address.
IOW, if there is a read event, the i2c address contains a read
indication (bit 0 of the i2c address is 1).

The patch code "bus->dest_addr =3D slave_addr << 1;" might get used in
i2c_recover_bus() later. (ref link:
https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7x=
x.c#L1691)

Suppose there is a read event and the i2c address is 0x60.

With i2c_8bit_addr_from_msg(), bus->dest_addr will be 0xc1.
With the original patch, bus->dest_addr will be 0xc0.

If some error condition occurs and it requires i2c_recover_bus() to
recover the bus, according to the description at
https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7x=
x.c#L1742,
the address "0xc1" is used
as a parameter to npcm_i2c_wr_byte() which is used to send the address
in the write direction.

If i2c_8bit_addr_from_msg() is applied, it might not fit the scenario
described at
https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7x=
x.c#L1742,
which is about to send
an address in a write direction since the address from
i2c_8bit_addr_from_msg() contains a read indication.

> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
>
> Have a nice day.
>
> Regards,
> Tyrone

Thank you.

Regards,
Tyrone
