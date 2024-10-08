Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A02F993C5F
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2024 03:42:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMzKN0xdmz3c03
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2024 12:42:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728351733;
	cv=none; b=meL/IDlE1y+gvV6WqbAVmrfuZt7bKjhF1CI9A7Qu9+QUA8spw9CXH8h3COQiBSa226PBwtXPBbr++6KAEK6XSMjLpKX18pznTdlO9q5X6fqSXsXfkrICSIHUXjmNincn5/d2v0EIhZg53+R7u2DIUrZmi74nqeWs+1+EZInTvAcCbWS+mLWIxU6uhLJjiVgIS0sVbzGEt/wCoNsHdfVw4qdggtQEFxfJOLIpINIP+7yjXzMVBGJRLx78otqFUwx3JyunmtCSM+zD0vqS80bBr+Kkk72oCYAB5+kDHUkd4DNcGVzCUu9rUTneu7pdvZ3BLPF1sD2KlyMUFSx6GWDzHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728351733; c=relaxed/relaxed;
	bh=3H/OIpQ+NUwZNvJrAsNKijREzfomqrSjb5DeGZB3tnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UxLOqoyxKcq70hjFUXmoVaBDg0NrOeBqR1RV8oBTBD2lxMox0WnVzkyiJ7X7QZFCqoMiQ5sjPbOa9iII/IkZan72wQFVSfL9BBLUnW82gFobl+G5yjdXtIdEBuYIYHoZHn76jVHl8pPT+3qBdDzY8tOK1o3zOj/gVLy1ZMVRuBfkgl+56gYVYIU5nq13pZBgiYozh4lWjehrEyt6gAzgSxD9I7RiCqxgJZSWd8d2PCD8sfVN1s3MLJ22fQ3da6XI6CjYGXaXpO0qv0bGm+i60YyhhVkiPOMbV4wqEa39B1F6u087EZModu8hwNYVXfY81EVzB+1tbjG616FixDttMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xz84A2j4; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xz84A2j4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMzKJ35yFz2xtb
	for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2024 12:42:12 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5398f3be400so5712505e87.0
        for <openbmc@lists.ozlabs.org>; Mon, 07 Oct 2024 18:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728351728; x=1728956528; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3H/OIpQ+NUwZNvJrAsNKijREzfomqrSjb5DeGZB3tnY=;
        b=Xz84A2j4qoMPJLHPeyvQ/bryf4p6XK0dQdNV0h8PDTrPW6FhOdd/E/zDpIyN7uJJtP
         cmMvhW/jppVuxsmz94UHBItyCNQP3AVsUSKQwX32rVPIcYxuTD8xz4LOVMDY2L5SgqEQ
         QKpX/jwWq0zswFS1GkI4iIn9xwFKMveEEzfmqti0hZ62VvI5BrPq1mJyRRrFUmOi7sya
         oZLzzCwps1pym1WQZfzIJU3KV+XsrbhsNCTFK+d+A5ha1DHAsky1J8O5HZQxJKXa3RDI
         d/ihmNhvJAH8w7ymftBDy3dzuhw0iLX2y7YKYUmxFVHlxIkij++EX9YsQ5yt1lqsm4Zn
         w5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728351728; x=1728956528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3H/OIpQ+NUwZNvJrAsNKijREzfomqrSjb5DeGZB3tnY=;
        b=NKCt5EsiAFJYoHXirNuROwqy+EA72jIbaj/1qwKTSYETytJO8Pfh5m2i6EEsfCRGFP
         UOC9/yZbL2xpDhwUDB7T+BFv0dodoAIAlZnPjet3eXz+AOADQ2MS5V+LmeAyQWdxWLv9
         lEnKuQ4WYFF/eG5uKXhiSDxVhDTijKMR4GEXyz8D5CHucnYqmZcTgLekrU/IHRG+/G1b
         JDMGoX2jSC1Dr59S4jVc5YM1qoMOGI8bjvCwFFLG9GNiDFQ/wPthlbcTVLiVeNdfAUW8
         AloDN2/aGg5mroqNgJE9RXH8P4I+2TnKzH/pgvNaTpgGZLW04R7cgAI6CwVxbgkdREj4
         tZZA==
X-Forwarded-Encrypted: i=1; AJvYcCVY9jPUZDuhK4qY1ztPk9phCdE9QTUoVpPMnA8d8DkOFhVsbFsr7VJed4+OiaqmP0egqfj92j0X@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwddYzNavLdDGDNnnLvziXcwuawZOXKLncqJHMtYM6sgMRDjxcE
	SHE+2IuPWb54A/phFeCOQogneBN+EAL13QayndWMI7LhLOhcjx44qB6g5aLujLkvXSjQhg4enb3
	zWVmvPtVrBb/u3sCA9acNSxAJ0Q==
X-Google-Smtp-Source: AGHT+IESXKOjm7teMlCbIj1M/25GcmW+2f4Q9YHEecanjXzZqTD6GJYoaZIGvpw7qjrnyDsUtZR46qTpUxIRdJwfPL4=
X-Received: by 2002:a05:6512:2203:b0:539:92c7:e68c with SMTP id
 2adb3069b0e04-539ab9eb2c0mr5364182e87.58.1728351727316; Mon, 07 Oct 2024
 18:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20241001062855.6928-1-kfting@nuvoton.com> <20241001062855.6928-5-kfting@nuvoton.com>
 <Zvv2Y10hJqGnUDvW@smile.fi.intel.com> <CACD3sJbJ0cNCRiBba73BOAkO=jn9KuJJXC1-Sy_iVf_8EJSjxA@mail.gmail.com>
 <CACD3sJa23TEfBQ_b8PGM8ot2L0g4n=GcqvPk0HJGjRf-d+=-pg@mail.gmail.com>
In-Reply-To: <CACD3sJa23TEfBQ_b8PGM8ot2L0g4n=GcqvPk0HJGjRf-d+=-pg@mail.gmail.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Tue, 8 Oct 2024 09:41:55 +0800
Message-ID: <CACD3sJZxswUmNoSoGAAhfWUeVLDW=6xdpwVd3mQzwdjBommm5g@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] i2c: npcm: Modify the client address assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, tali.perry1@gmail.com, wsa@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy:

May I have your feedback on my reply about keeping the original patch
"bus->dest_addr =3D slave_addr << 1;"?

Thank you for your time.

Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=884=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8810:29=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Andy:
>
> Thank you for your comments.
>
> After a second thought, I'll explain why slave_addr << 1 is given here.
>
> Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=884=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:49=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Hi Andy:
> >
> > Thank you for your comments and they'll be addressed.
> >
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=
=B9=B410=E6=9C=881=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:17=E5=AF=
=AB=E9=81=93=EF=BC=9A
> > >
> > > On Tue, Oct 01, 2024 at 02:28:53PM +0800, Tyrone Ting wrote:
> > > > From: Tyrone Ting <kfting@nuvoton.com>
> > > >
> > > > Store the client address earlier since it might get called in
> > > > the i2c_recover_bus() logic flow at the early stage of
> > > > npcm_i2c_master_xfer().
> > >
> > > ...
> > >
> > > > +     /*
> > > > +      * Previously, the address was stored w/o left-shift by one b=
it and
> > > > +      * with that shift in the following call to npcm_i2c_master_s=
tart_xmit().
> > > > +      *
> > > > +      * Since there are cases that the i2c_recover_bus() gets call=
ed at the
> > > > +      * early stage of npcm_i2c_master_xfer(), the address is stor=
ed with
> > > > +      * the shift and used in the i2c_recover_bus().
> > > > +      *
> > > > +      * The address is stored from bit 1 to bit 7 in the register =
for
> > > > +      * sending the i2c address later so it's left-shifted by 1 bi=
t.
> > > > +      */
> > > > +     bus->dest_addr =3D slave_addr << 1;
> > >
> > > I'm wondering if it's better to use i2c_8bit_addr_from_msg() here?
> > >
>
> The current implementation of i2c_8bit_addr_from_msg() (ref link:
> https://github.com/torvalds/linux/blob/master/include/linux/i2c.h#L947)
> is
> "return (msg->addr << 1) | (msg->flags & I2C_M_RD);" and it takes
> extra consideration about the read flag when retrieving the i2c
> address.
> IOW, if there is a read event, the i2c address contains a read
> indication (bit 0 of the i2c address is 1).
>
> The patch code "bus->dest_addr =3D slave_addr << 1;" might get used in
> i2c_recover_bus() later. (ref link:
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm=
7xx.c#L1691)
>
> Suppose there is a read event and the i2c address is 0x60.
>
> With i2c_8bit_addr_from_msg(), bus->dest_addr will be 0xc1.
> With the original patch, bus->dest_addr will be 0xc0.
>
> If some error condition occurs and it requires i2c_recover_bus() to
> recover the bus, according to the description at
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm=
7xx.c#L1742,
> the address "0xc1" is used
> as a parameter to npcm_i2c_wr_byte() which is used to send the address
> in the write direction.
>
> If i2c_8bit_addr_from_msg() is applied, it might not fit the scenario
> described at
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm=
7xx.c#L1742,
> which is about to send
> an address in a write direction since the address from
> i2c_8bit_addr_from_msg() contains a read indication.
>
> > > --
> > > With Best Regards,
> > > Andy Shevchenko
> > >
> > >
> >
> > Have a nice day.
> >
> > Regards,
> > Tyrone
>
> Thank you.
>
> Regards,
> Tyrone

Thank you.

Regards,
Tyrone
