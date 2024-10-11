Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF1799A5E6
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 16:11:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ7p83VdHz3cVs
	for <lists+openbmc@lfdr.de>; Sat, 12 Oct 2024 01:11:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728655870;
	cv=none; b=ApEQhODkPkf0YJ0RcWNVc60cvG8CTTcQUYDS8g9+I4DWuNUuoJNMSUvohO17zz3RwhhKtlNhKmqo0WgURSnG4ODG0ShEBBsCZRPifRxjq12pNWDIgQLIIhIRZHCrjVv6HW90VqeU+6XEdTTgI/dRHNUS6ngZfCfC51k/ywlLsajiBDcIRJTo01MozYrUrVJAMkGcqCMOQCCWPoOQCoEfTI1Oxfo9ezOABNx5WvNKNDJQ13wSXPO7+FOojF0bujcmCpBJ8v+Ih+4jm3xM59mvqkBJoRhTN2SyBGJMFryI0yrTbEY2kbNRZmxhVOw5SHoQVPQvI/AAKbM7r2Ch0P7etA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728655870; c=relaxed/relaxed;
	bh=lXo0pIJugni3PGreyejzU+9DDRAp+EZRDdgwqzItr5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBLQ2KoHRmbf050NvXtqvM4hM6Ti6uZk9COhKgAYOm26rkjJbKzzfTv/U0xF+Dw4F0Q6HvOWJQ2+4+GGxNJ5j7iLDEIeXD4LpMDIwRr6aUiVdunLV3QV897TDIswY0ciSDGBLCB6WGt0ule4l9/732eOftn1DI2TjbT4PS+I5rLxEkq9pfO98bZQguOENw02ty3/EuPeO4vSs+XDpx0cYKQUW1reeqJ6QhVlv2DJ2DH5BBRQsRixnvcAcW2b/qI0ZwIo7X8h+Ji9bc3cEs7DElnFKzZD8aODsN/lj4G7UevDpkj38d8lnpZfoDFt0lGhTyGGS3Ti+yE62R1I+E8vuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aIjLh5Bh; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aIjLh5Bh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ7p05dh1z2yRP
	for <openbmc@lists.ozlabs.org>; Sat, 12 Oct 2024 01:11:04 +1100 (AEDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a9943897c07so288556366b.3
        for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2024 07:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728655856; x=1729260656; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXo0pIJugni3PGreyejzU+9DDRAp+EZRDdgwqzItr5Y=;
        b=aIjLh5BhS4e/aR8Gp5ZBrqjlyjz45ou4H6X/fzpAD0Jb1J/xUr33iE+7sIE7WCwwd8
         ZILGW2pEt/rOYDNJcKb9nf3x1hVg8ehB1eYHEllY325Sp4khGINC6NH7aB9azpGh7vxB
         vU/7lrZfOyl5idDeVxXAqMpCxYMt0y+4OJr6AmCV2jXcEcXt/Y25ommNp7m+i3xB16Ll
         R8lG3VyaADi0Hca5KrdGUTeXB3a2+ed508oQQyQyA8Bx3sp/MLMY79Leax8RNRBkHnlV
         YkD8VULRHydLDZINP3DvBRvTR5ivhgyTvtoaXUO3bkCKqM7/ZPDh+pNeqZ0n4Rz+GRoB
         MRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728655856; x=1729260656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXo0pIJugni3PGreyejzU+9DDRAp+EZRDdgwqzItr5Y=;
        b=NTOcgAndY5fK73jCA7qK02iNAsGRbtWtBHoLxkqPsmnqOlFIk1I+PMYVTc05ZqXkWa
         P29pAVvpI5+3nh/We14QodSl2naK7kAkCwb0rrK+bbNQ6y+JA8WHgXbmNW/TDKDB9fq2
         07bdrmydBGbrvldjVo9N9uvpJIsxcnxfa527Aw8mVgaz4QuBWMuKarN33xjJOUV56y2m
         UJ3L7/o3sphayTE2Pw0R3523IyYo7LB9FIjGVW7wdDkaAq9Md/7WelfwWKzuEraOh+cP
         7wAmM5EFA7GWWC0GA80/u64Wt9xRhiEYd2c2LpLp9XtPK7L46s5W8aOy5bkIgpMXmJiT
         L8EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrOQD7JcT6PF+3h1nEh57Z+MonittT69odv2e0z7Afbb1HoHbw58OWyS3T5O0uUyGe7tuvJLKd@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxcB2U7V5nwnQ6aUNOZqQItV/M19zL52WVPoSY51TGOjkeTZzG4
	0DgINtwYPr/yOWa1fWc7W8raznJKIkMvG4tTRqnjvAiS8SbVuuAQKOFgmMTLQmhmUP8ng/z/nu4
	zcO/Ep1HBtXlhMchSUs/Rn7AD0A==
X-Google-Smtp-Source: AGHT+IEGhgxhknhFM8Bp/09aaqR8LI8wYEzwSlOZYTef32VMBfIrkXYcXxlYMuSyrISu+q7c2LNU502hPZSgM7rAVh0=
X-Received: by 2002:a17:907:d3e7:b0:a88:b90a:ff30 with SMTP id
 a640c23a62f3a-a99b9583146mr234695166b.50.1728655855881; Fri, 11 Oct 2024
 07:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241011055231.9826-1-kfting@nuvoton.com> <20241011055231.9826-3-kfting@nuvoton.com>
 <ZwkFWVC3_5xr6OQW@smile.fi.intel.com> <CACD3sJY_79_VTe1EHPdh-1+FCBwb2KCW_N19==TMHAsrFL-rzg@mail.gmail.com>
 <ZwkvBFHS1m3N2yoW@smile.fi.intel.com>
In-Reply-To: <ZwkvBFHS1m3N2yoW@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 11 Oct 2024 22:10:45 +0800
Message-ID: <CACD3sJaNe71Jr9isRdBp1Svgg6ULfgVfUFGkw2i=mELmNQTr+w@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] i2c: npcm: Modify the client address assignment
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

Thank you for your feedback.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
10=E6=9C=8811=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:58=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Fri, Oct 11, 2024 at 09:44:42PM +0800, Tyrone Ting wrote:
> > > On Fri, Oct 11, 2024 at 01:52:29PM +0800, Tyrone Ting wrote:
>
> ...
>
> > > > +             if (bus->dest_addr & I2C_M_RD)
> > >
> > > Redundant.
> >
> > Just to double check. Is the code "if (bus->dest_addr & I2C_M_RD)" redu=
ndant?
>
> Yes.
>
> > > > +                     bus->dest_addr &=3D ~I2C_M_RD;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Have a nice day.

Regards,
Tyrone
