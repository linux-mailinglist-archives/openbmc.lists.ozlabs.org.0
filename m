Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A73995F39
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2024 07:48:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNhkt29Qjz3byP
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2024 16:48:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::130"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728452899;
	cv=none; b=fhsSW2UPmOlgfTBZZoJ+3xdy/Kb2sBUjt6yFKYpaV2tRJW3PsHr+TqYm/HB03wevUZD8DK9kXNOpg4/1NM+0O+iq/dYN6GrsDUzMIyWkd6SGpbwSynEa3xdtclw7OwgCf2D2gJaGjFepiTp48BB90s6f3ShkRm0tr1hoqTQaoKI7/TLRCi7W/IWkYmYG5mnt3rM/AZ8boHTwA1CnO2eIAeKLAkxPxmv8DJVccSziE2bQNLNyzzcdO6d6SJdshG0GL9h99KYYf5DK5Dd3+7b4LqPurJFmAddXWBzrjeuUYy1JxWKEqpWAFUPXvMwTo8XEBOCG4PtxZAjjPQukD7LC7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728452899; c=relaxed/relaxed;
	bh=NObWxCBTZ7RUOz3dFok5wYOXIGuBPTZzt1EEJpRyYuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jxj3bqpgw+ksIbdU5AIaW/pbBilY6ruNm8nwTTwR7GnudVSSDfNMkvXHd8PzPhlsxh/AJXvhutrEn7KXA7yOIwA5mSj68sfvUKCxBZ7MQQTZlreEZ+b5WxSHs8xwxCCE3lw4YuEqb5VB9t12Ma4OdoJYkcltOGZUnR5+1BgKTlZJrMa07ZVMT1PrPVasUKQcT796uCsP3GLoI6HdFc9Su+oVJxMgx+dMt+Bd12BwHrmbuCbZSnnss+bA0QgPkwQYPLbgUi74DYwsu2tcmbQIrUc6tb14dUAPDSpqJv3LfbaYdrqs9wMg+lGonrTxvNVCN7rTglZCctAoA/VriWQZVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=c+vlUl6A; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=c+vlUl6A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNhkn3xzsz2xyG
	for <openbmc@lists.ozlabs.org>; Wed,  9 Oct 2024 16:48:16 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-53993564cb1so7124261e87.2
        for <openbmc@lists.ozlabs.org>; Tue, 08 Oct 2024 22:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728452892; x=1729057692; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NObWxCBTZ7RUOz3dFok5wYOXIGuBPTZzt1EEJpRyYuU=;
        b=c+vlUl6AK4a2Hj89phnJxIiTB9C4r5V25cBKqi/uC3M+p+lCnOlX7k4ujz0qZS6bcW
         xTdI5UrvIY+nVlBxNS8JlUiaxHW3MpOYdr46h/A3nb1rWanJA8ub3dXLMYm5rsbBwp5v
         tdx/KM5zDXc/xU/d51BDjvPQvihkWIZbq+RmijBXsWaYomNhVAyPZIPQ1rXRuhRmm0sp
         84SI1UyZAeLnVu1d7k5nV3PvuIQnFgNrCGxk0geXvAVrauZjsNyBCr4lvp5T6lTztTmP
         2RtjT2RbaDzMbDTFJzSP1GcD7IMPwrvtOHQFbuIFn5ch99ZRIjxKzgwfTGKmvIjE0JyP
         M8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728452892; x=1729057692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NObWxCBTZ7RUOz3dFok5wYOXIGuBPTZzt1EEJpRyYuU=;
        b=um80iYIB1Ai+T5vPp9I6uO9qkSQXxZ7CAthLjQaRRAEnKNL10p8xepCzmlyUfB+zPY
         9rbpz8UCVhRos9b72EFq8Q/ypXmBeK7QG9rxgZ6vYaL/zyiVvkcYCXGPm5lj7crZQDgS
         ESoYwXZYWbIn4Df75upbYTsySaYdU1DxLyCBZ5tOzwYEwf2vbIMZEr5V4tbrwxd+hY8A
         4j16lzZeze4ncK1wV5wz7V3aje7+Qv7p4Nrn1NJWg2SsQD1ZU8pKlrw08IeR0OjxyWpW
         a4EDYpLD9qOiLPY4IaVo/hi8I64wNuBUib+Relkjk5TwI753mq4IN4cfEThrmAskRxgk
         DOGw==
X-Forwarded-Encrypted: i=1; AJvYcCVYmJY4eGDRzavmOBGE9vk2algFVByblc0SYxvL/SVDB0WLUt4ZpumMMRLxt/0ZJRGqKU9L+J/G@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwDAdmUYeKWinSWZB/B2FzDK/zfvygxmRx6cL0smN17kV02VFMn
	+1rFqMlO+V4YqEbE9SD5tTAT9QIleWoENM9w2JTI3ZNPZyk8LeG6n2SAvqft6y3mHQ6tRerDRKd
	qoIQyyLCwW+achYjrjR3YJvrQ8w==
X-Google-Smtp-Source: AGHT+IHwS4bHyxTCyWm/s8+wB2Y9y9wEcYJX/jE/HI4PaVJ6axU0RoZ6LHW1stlMz1JQq3jJSDMqLAgurFddsOVwjIg=
X-Received: by 2002:a05:6512:2245:b0:536:548a:ff89 with SMTP id
 2adb3069b0e04-539c495ee90mr549023e87.39.1728452891961; Tue, 08 Oct 2024
 22:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241001062855.6928-1-kfting@nuvoton.com> <20241001062855.6928-5-kfting@nuvoton.com>
 <Zvv2Y10hJqGnUDvW@smile.fi.intel.com> <CACD3sJbJ0cNCRiBba73BOAkO=jn9KuJJXC1-Sy_iVf_8EJSjxA@mail.gmail.com>
 <CACD3sJa23TEfBQ_b8PGM8ot2L0g4n=GcqvPk0HJGjRf-d+=-pg@mail.gmail.com> <ZwVcGu3YeJ6pI0sM@black.fi.intel.com>
In-Reply-To: <ZwVcGu3YeJ6pI0sM@black.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Wed, 9 Oct 2024 13:48:00 +0800
Message-ID: <CACD3sJa0g=JR3utj=U8-zJm31W3gT_4Hb4wxGhAmdGhOSw=rSQ@mail.gmail.com>
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

Thank you for your comments and they'll be addressed.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
10=E6=9C=889=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:21=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Fri, Oct 04, 2024 at 10:29:10AM +0800, Tyrone Ting wrote:
> > Hi Andy:
> >
> > Thank you for your comments.
> >
> > After a second thought, I'll explain why slave_addr << 1 is given here.
> >
> > Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=884=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:49=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > Hi Andy:
> > >
> > > Thank you for your comments and they'll be addressed.
> > >
> > > Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=
=B9=B410=E6=9C=881=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:17=E5=AF=
=AB=E9=81=93=EF=BC=9A
> > > >
> > > > On Tue, Oct 01, 2024 at 02:28:53PM +0800, Tyrone Ting wrote:
> > > > > From: Tyrone Ting <kfting@nuvoton.com>
> > > > >
> > > > > Store the client address earlier since it might get called in
> > > > > the i2c_recover_bus() logic flow at the early stage of
> > > > > npcm_i2c_master_xfer().
> > > >
> > > > ...
> > > >
> > > > > +     /*
> > > > > +      * Previously, the address was stored w/o left-shift by one=
 bit and
> > > > > +      * with that shift in the following call to npcm_i2c_master=
_start_xmit().
> > > > > +      *
> > > > > +      * Since there are cases that the i2c_recover_bus() gets ca=
lled at the
> > > > > +      * early stage of npcm_i2c_master_xfer(), the address is st=
ored with
> > > > > +      * the shift and used in the i2c_recover_bus().
> > > > > +      *
> > > > > +      * The address is stored from bit 1 to bit 7 in the registe=
r for
> > > > > +      * sending the i2c address later so it's left-shifted by 1 =
bit.
> > > > > +      */
> > > > > +     bus->dest_addr =3D slave_addr << 1;
> > > >
> > > > I'm wondering if it's better to use i2c_8bit_addr_from_msg() here?
> > > >
> >
> > The current implementation of i2c_8bit_addr_from_msg() (ref link:
> > https://github.com/torvalds/linux/blob/master/include/linux/i2c.h#L947)
> > is
> > "return (msg->addr << 1) | (msg->flags & I2C_M_RD);" and it takes
> > extra consideration about the read flag when retrieving the i2c
> > address.
> > IOW, if there is a read event, the i2c address contains a read
> > indication (bit 0 of the i2c address is 1).
> >
> > The patch code "bus->dest_addr =3D slave_addr << 1;" might get used in
> > i2c_recover_bus() later. (ref link:
> > https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-np=
cm7xx.c#L1691)
> >
> > Suppose there is a read event and the i2c address is 0x60.
> >
> > With i2c_8bit_addr_from_msg(), bus->dest_addr will be 0xc1.
> > With the original patch, bus->dest_addr will be 0xc0.
> >
> > If some error condition occurs and it requires i2c_recover_bus() to
> > recover the bus, according to the description at
> > https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-np=
cm7xx.c#L1742,
> > the address "0xc1" is used
> > as a parameter to npcm_i2c_wr_byte() which is used to send the address
> > in the write direction.
> >
> > If i2c_8bit_addr_from_msg() is applied, it might not fit the scenario
> > described at
> > https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-np=
cm7xx.c#L1742,
> > which is about to send
> > an address in a write direction since the address from
> > i2c_8bit_addr_from_msg() contains a read indication.
>
> Okay, then I would do the i2c_8bit_addr_from_msg() call here as AFAICS
> this is the real event where you save the address *of the event*.
>
> And in the respective user update the comment to summarize above and do
> rather ->dest_addr & ~I2C_M_RD there.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone
