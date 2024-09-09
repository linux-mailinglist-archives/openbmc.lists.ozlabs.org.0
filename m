Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C03970B85
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2024 03:49:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X28s354GLz3cFw
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2024 11:49:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725846564;
	cv=none; b=Lhmk3Bi4zkC81h976Meo5cmS7XIpKHGJ5btY4psUPdy1i0ixQ1R85fWnZOQVC1hEelgWO8+ipwczW1zVHi2lKsZiF1cUVEpXEGC1/O+52KPIZUEOVj5Xl39VEsIskvA5ZO1yMIdMKztkCHNo3/EPwcLWV+5k1LsN8xgvGmV6lr92LRN5n9Q02L9U+n5IVSkdb4oBX9IzgY3wIROw0uI4ehGe4bAwh1WuGql0KR29uzdjBzX/Svn5zbqYn7hQfw2R/AfeIruuOw9b0OShDwQ7ZTGin7Aseddn2feZDpo8lPt0NYEl8sqzvjjgTIsLgWJqh664+mLOvWG4BA7jtDWY5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725846564; c=relaxed/relaxed;
	bh=1DBLxzOHYDxcsNwOMRYkWi8QMRo95NS/vm6yH32jIt0=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=BSP/QW3zKBnODifzhZkbi36yI1fwlExMUMxtjzxX5SQ+aenmQeZ6o5TJdGvTBIMDHaI4xQy6WQiBFSJyBvUmI1gWVLTJa0liu8C8h2hC/+BXZVzljNoRv3erBmZRjQ3vVxLvI9QEaEgUPQkCBEFjhJqKnP/jeEp+PXiNmFcxp0UCrzHtCTT4c6AuFd9MO6Y8ju4T9XVKKUK75AyAx6WP3P51h9HcGA/lgQjVQdgLGCH+E1aU2OKtRj9E0w+n+c2TUMPBXGWq1tEBILteWw1SxVdJ3TkpzOAKz0+bTU6ER0aAvu0lh8iqRxaqrNKccs6M+VwdSuzJVx/KoVp7O1k7lw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JLlkSFVF; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JLlkSFVF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X28rz3lf5z2xf2
	for <openbmc@lists.ozlabs.org>; Mon,  9 Sep 2024 11:49:23 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5356aa9a0afso6670202e87.2
        for <openbmc@lists.ozlabs.org>; Sun, 08 Sep 2024 18:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725846560; x=1726451360; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DBLxzOHYDxcsNwOMRYkWi8QMRo95NS/vm6yH32jIt0=;
        b=JLlkSFVF9Nv3fTFnixMQwydzUiLSrp8dYWbA/GJEV7WBt5xfimx8vlwakuN1LN173f
         PpbgKqXz+TRH6+7SZZgqmg3MgkoWtqiDgUxlvHkVC2FJBR2uwygNn1LqmPTIZF6Q1aML
         chzBvmazXOjPtJ3HpB1AG/TCBU9lJumEXz/OD9W0DZBCw/KaPHfoMNg279czhGam4ix5
         vWRuwl91lmFcng3Mx9RX2a7XruCl9iuMmzNtlTx3NQcW6CsYH4B45zv23j4KSCXKEH4O
         ie2oTD1fWfUopzPSwe1LkAH6ACpzSRfBn5eBsOeL+0goL31fZjlr5ir7Ve4Kg2NtUMoK
         RIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725846560; x=1726451360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DBLxzOHYDxcsNwOMRYkWi8QMRo95NS/vm6yH32jIt0=;
        b=sTgRXTupdIIxgNZ6EhzbfFXjnZqqmSCsYAMAZrGwbN/xbXqgtOncYqwCZJmQuwHMOa
         P53ikqlh3hPrF5JT8x2mifu4zR8U/uVQUhEAcpIzZao5h6zaacCcF7hO6NFFTPYSyPBH
         2+vYWoMpp6rCn+yV2GVe4/WGaavCc9EoZd0ockvIgwc27R+n43PAdJqkfse91QOr/8C3
         9sSaDatYH3Iae5Ip98ZDcbN/KkvVuqfNaclfIed5R74O35gC67s3m2fZxj/PhFv+X0Dp
         I29r+WuD09EopRKYV5m/EPApEKVb9QlUTMfB5wvk4HGLTPekknmYJzdRtmvAXRYipg+o
         VQxA==
X-Forwarded-Encrypted: i=1; AJvYcCXvKVE5iygAlgnqY7hG6aOtsUwR5QdQ+FKjNaQIXvvlkZ3Nw+3AvWj3pAuW4QMBABBvXq+Y22M6@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwHgxSJ8RSHjHPpUmt5Np9d7yCABqavUR3h++NpeDpr3MfbWI6P
	Zhr+GlP95B7xIEyyljGRdifwi1Vyyk5S1UftEyVKL806eFpxKi6A3RfOAezqcOiBhIMwr4VKGSs
	Oip0rsyzXq8vf4o90kKVBP2TWPFBiFqw=
X-Google-Smtp-Source: AGHT+IGUTBnBdo2MDFMCXRuCZfg+3U+TmHQMD8jAWdwAxp47hlreehyNTYkpqoeZqRiHMOumze1d0UCgGCpscB41k/4=
X-Received: by 2002:a05:6512:3983:b0:533:71f:3a3d with SMTP id
 2adb3069b0e04-536587ae7a3mr8414317e87.24.1725846558780; Sun, 08 Sep 2024
 18:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-3-kfting@nuvoton.com>
 <cfdfldh5tuhb4r5pdpgolcr2roeewsobedet2uvmpbnqlw5yh4@c4a2szsbs2r2>
In-Reply-To: <cfdfldh5tuhb4r5pdpgolcr2roeewsobedet2uvmpbnqlw5yh4@c4a2szsbs2r2>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 9 Sep 2024 09:49:06 +0800
Message-ID: <CACD3sJYfpo+kTFCYdEnwk=GuHUa7y8SHFUFg_Knx5bnrkdKvUw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] i2c: npcm: correct the read/write operation procedure
To: Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Thank you for your review.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=886=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=885:29=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyronne,
>
> On Fri, Aug 30, 2024 at 11:46:35AM GMT, Tyrone Ting wrote:
> > Originally the driver uses the XMIT bit in SMBnST register to decide
> > the upcoming i2c transaction. If XMIT bit is 1, then it will be an i2c
> > write operation. If it's 0, then a read operation will be executed.
> >
> > After checking the datasheet, the XMIT bit is valid when the i2c module
> > is acting in a slave role. Use the software status to control the i2c
> > transaction flow instead when the i2c module is acting in a master role=
.
> >
> > Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_=
slave")
>
> Fixes needs to be used if you are fixing a bug (crash,
> device malfunction, etc.). If you want to use it, please describe
> the bug you are fixing. Otherwise, please, remove it.
>
Understood. I'll remove the Fixes tag in the next patch set.

> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index bbcb4d6668ce..2b76dbfba438 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -1628,13 +1628,10 @@ static void npcm_i2c_irq_handle_sda(struct npcm=
_i2c *bus, u8 i2cst)
> >                       npcm_i2c_wr_byte(bus, bus->dest_addr | BIT(0));
> >       /* SDA interrupt, after start\restart */
> >       } else {
> > -             if (NPCM_I2CST_XMIT & i2cst) {
> > -                     bus->operation =3D I2C_WRITE_OPER;
> > +             if (bus->operation =3D=3D I2C_WRITE_OPER)
> >                       npcm_i2c_irq_master_handler_write(bus);
> > -             } else {
> > -                     bus->operation =3D I2C_READ_OPER;
> > +             else if (bus->operation =3D=3D I2C_READ_OPER)
> >                       npcm_i2c_irq_master_handler_read(bus);
>
> mmmhhh... you are changing the logic here and you are not
> describing the logic change in the commit log.
>
> Without looking at the details, if this is a state machine you
> are breaking it.
>
> Can anyone from the ARM/NUVOTON NPCM supporters and reviewers
> take a look at this patch?
>
> Thanks,
> Andi
>
> > -             }
> >       }
> >  }
> >
> > --
> > 2.34.1
> >

Thank you.

Regards,
Tyrone
