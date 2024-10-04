Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4BB98FC0C
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2024 03:51:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKWk620lWz3cDg
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2024 11:51:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728006699;
	cv=none; b=d+lDcmWnJR0Vt7Ml2RvjK5bDVV1N1aPc1cIBm9nfcy1JQ0jkwx8JPvlPib4+foGnIGK4YA8vlI/3X9nt5FR+nYs8vQkpwCFfcxEvtpXDip0/DZ8dsjLA8yML70NbVM7m9NaFG2Ic9Yz77lVVLB0Dwt6OZ6qg0gyTLgV5o5FYBOu3PPZHsH9tb+AteoQT5VeNHLthseYtv7wPzie0hYxv9NN9lsFeGIt1IpLppKA0TJ8JXZvpAxmp/Dxe5gPB+rnYZW34wN4/4pB9bks+H+WF4ouvrIMwR3vO4KlfWbf+eq46vHBas8+TuC60zVzfvz/oQwsJkqJI2ecti96Yqp+5iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728006699; c=relaxed/relaxed;
	bh=2TbQ2jJT8Gnh+uAuA/LCV5JNC4aeAp65rY23ATPV/rY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n6AajpzTgGhh8eRINgJf89wCDSpRbSKfew7HvOsSmTwsEHEOpUy4waC1sRiPDkCGQE6I1knu03PyJV8F/OMH4E2/ub4Gzjvauy+e4OmP45/VX30fvatMlmwv9o/cwjC+sUk0Ib/BYhkOp3MaXtvUVYRJ1g2zwEYkf6FK5vvnezg9HeAQ1Poz/I9TcdFOYgdQ4407mCwKu4JKvGhuhmEFynwFAr+927604i4Vn7JDy9LioRts9vWGGg3pDKyIqEK045rHpQM89X1CMn1ibbd8eeXazj+8A2kjYIig8lXyoKE/SCSTn167rjsoiSRhZXXpsYn8Bzj2/LoT/ZbUdnvORg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h/rY0e8h; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h/rY0e8h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKWk225RQz3bbp
	for <openbmc@lists.ozlabs.org>; Fri,  4 Oct 2024 11:51:36 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a8d60e23b33so223592466b.0
        for <openbmc@lists.ozlabs.org>; Thu, 03 Oct 2024 18:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728006693; x=1728611493; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TbQ2jJT8Gnh+uAuA/LCV5JNC4aeAp65rY23ATPV/rY=;
        b=h/rY0e8hUWf6IKXR48S7PSra2BGThgRq2UBrIs+PIVT6IWGGKDPL9qzA0kQ0hBKNQ5
         qSIwG1wATrpvP7+3IZaQz6E8dXk2bXylCMNLt2mvxbX9ODCj6jLcwLEu/ZZ6vJqeCfPg
         BJqo2SOPFhAFd/NKmK9QiqpiNWevDzzoxOzgVCY2YFR7hcr3bBp2HZNVCSlbTrP51I9Y
         TrP1cUKs0J5FikZP7PVnjJeABjcIz8jDpMozjpW+wutBSx+nhxJxpZZuFcmSwnQ5y1Uk
         U5MNIfniKwQjd4zJ/xfhG7o85esfTp7AAKG+X18Gn7yLFCLClpBAYzxjuHo1wMCfYKui
         wq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728006693; x=1728611493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2TbQ2jJT8Gnh+uAuA/LCV5JNC4aeAp65rY23ATPV/rY=;
        b=Kvhc9zB5vgba0ghhrr4dT7lcE4TIgqYd5cC7KptcZhLYTyJLxwgonCmFDNYfCq3Yq+
         BYAXPqUu6WHbMiEs1QgGzOhTpK58iXkAmnphziZgMOrXftsvssPnEnksAr5ei1V9m1Iy
         XjzeTcOgG4dAKGmYXRUdpPmHsOirxhFRFS9DPuSvJjWo1urZsIbsijy8YZxIPsFtYSDX
         lZSdzMRNGLyHas900JSqUPnifK89WLioCryLZtTy+M4U/AYeXrIZGGTzejd8f0m3rQli
         A0eUheNDLqR2VU7dFtjNtDdvMYDchHxkIBdrYFwuUu2qk4Bbac8NwMyN8T6Gu/0fEiL5
         5D0A==
X-Forwarded-Encrypted: i=1; AJvYcCW4Ygv+k2I6itznZqcNke65mVijqjzxSOeKneQWX5Vm9LcCi27rIus0Dg3b6xUWV0FOndpt14rH@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxRkJElBp/5DV4EGGUNERg2UiTtqYvrDo/OUnU6+leZZBkS8g7+
	yMV9RzLvndVsiUFr9AK0k41HDTJX+DtaelJdoP5IBk60kA+FLSbsIYDu84YtvdTFnA3SPz3niYB
	KO3BLhVUz50lF6gkGA1zQ9g64aQ==
X-Google-Smtp-Source: AGHT+IHve9h3BM2sNzAq+GFrnYEqz82siIj/A5I9jY8K2jvgSEN8bFP+z0TNPEV8wdGZSf6DKw38vl6lLG3ULmyIVKY=
X-Received: by 2002:a17:907:f788:b0:a7a:8da1:eb00 with SMTP id
 a640c23a62f3a-a991bcfdb73mr96396066b.7.1728006692826; Thu, 03 Oct 2024
 18:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20241001062855.6928-1-kfting@nuvoton.com> <20241001062855.6928-6-kfting@nuvoton.com>
 <Zvv3ws1_jUMVnAAJ@smile.fi.intel.com>
In-Reply-To: <Zvv3ws1_jUMVnAAJ@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 4 Oct 2024 09:51:21 +0800
Message-ID: <CACD3sJZEUp3PQ=POGtHsN5su6LbXyOfUiXv5EsptiY3GxNrR7w@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] i2c: npcm: use i2c frequency table
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

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
10=E6=9C=881=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:23=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Tue, Oct 01, 2024 at 02:28:54PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Modify i2c frequency from table parameters
> > for NPCM i2c modules.
>
> This two lines have a too small wrapping limit.
>

I'll make the statement in one line.

> > Supported frequencies are:
> >
> > 1. 100KHz
> > 2. 400KHz
> > 3. 1MHz
> >
> > The original equations were tested on a variety of chips and base clock=
s.
> > Since we added devices that use higher frequencies of the module we
> > saw that there is a mismatch between the equation and the actual
> > results on the bus itself, measured on scope.
> >
> > Meanwhile, the equations were not accurate to begin with.
> > They are an approximation of the ideal value. The ideal value is
> > calculated per frequency of the core module.
> >
> > So instead of using the equations we did an optimization per module
> > frequency, verified on a device.
> >
> > Most of the work was focused on the rise time of the SCL and SDA,
> > which depends on external load of the bus and PU.
> >
> > Different PCB designs, or specifically to this case: the number
> > and type of targets on the bus, impact the required values for
> > the timing registers.
> >
> > Users can recalculate the numbers for each bus and get an even better
> > optimization, but our users chose not to.
> >
> > We manually picked values per frequency that match the entire valid
> > range of targets (from 1 to max number). Then we check against the
> > AMR described in SMB spec and make sure that none of the values
> > is exceeding.
> >
> > This process was led by the chip architect and included a lot of testin=
g.
>
> Personally I consider table approach is not so flexible and it is definit=
ely
> does not scale (in the result =E2=80=94 hard to maintain for all customer=
s), but if
> it's hard to calculate all necessary data and there are other pros of it,
> I'm fine.
>
> TL;DR: I don't like this patch, but I don't want to stop you, hence no ta=
gs
> from me.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you again.

Regards,
Tyrone
