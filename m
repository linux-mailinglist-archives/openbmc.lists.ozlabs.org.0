Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2E59799D1
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2024 03:38:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6SGr3VFQz3c9q
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2024 11:38:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726450688;
	cv=none; b=G7/W4DXETsuS+XePFjqoMYkfsu9S3h+Y000Ka4ApWKE0ezqNeOP8DzV0hoxgaN/j0saDqrhFivWy3Uwk5oGXtkgpMScBcyL6W0BFhNoCp037CylCOGsg+HUjCQXoojlQQW/Y7zronp0tHo8ZzcCrx25Gor6RvVVwxKAwXMzQ8lueGnr5yg9cCzUOxEbV9tmo61x4iJupDFv4YZTk5extB2Hd3SWnzwKm52Y+vpXj3agB5Ur1/hvBXCUkUJK5RdbKHYZnUrLG8zyZkIEvkOvm3hzSlhIaOtDQCjsdTmaBMCLLYxGh8VZJp0cYukF1gd6/n5i8+rtfuv15+n6dxKTd2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726450688; c=relaxed/relaxed;
	bh=YJ4zB8iR1KNJGsuoPyhcL4e+N/fRrboA2H80bwmTRig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjnV9GjYUzGmx8BJWt+3/SQde0ToHf6qsILN8MXtMlm01SUHg0eYft1Ne1AwGha+tULoAJ6TXDzmu7P6WIabcHu4ZryaVYZH9zMoPtBowamgAyGZDfP7euuvW+EwtwA5e+ZwzTJ60adAb6irTwEzT/4TK1Ox8Xxm0uO/uCm6/FfiqyQjzx7Jev/0mfO9RGgtc5eUOpiRDtuKR3NIoG0FG1lGEBuhuvKZVMTvBKnsDhwd+BCaQtnxUmQuh+z97Fq5ZeYTS8TNobPFIJ76qyCk/6rHWggXWvqa4cXDMitC7CpqE9TgwzhUy4/kuu+RLQ3k+qHInC6T9K8A9BW2vJz2AQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aFM46T/3; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aFM46T/3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6SGm0ZJpz2xb9
	for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2024 11:38:07 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a8d60e23b33so512572566b.0
        for <openbmc@lists.ozlabs.org>; Sun, 15 Sep 2024 18:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726450684; x=1727055484; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ4zB8iR1KNJGsuoPyhcL4e+N/fRrboA2H80bwmTRig=;
        b=aFM46T/3g61xVnHNTHlVso6uE1Z2vygzHAvV3J/7ZSZ2SXR9AFT1NlPRoF0+tGAU8u
         3YMxn1JKDjNgfka6ZxFSCiePfOaO8BK0wfkeTQXIdxdXVrYypnhUh/VvZV3jTcnXEqdS
         iFHzr06jEU2/IJ5N+L4sGGefGpjfQSc2hD/e8zXbzPvqxs1kUa8uXZeUJjjhh1Fz1UOi
         MPTgedCLQM4kn4CpGJzrFwMCQSFClKOrMpBCdmW6Z2udfIUEeKpgwnm/iHltTQYLAuZD
         Oekq4AiJLlZelkxfazRkeetS7xpARsb/LmX0OetAXxg+ERgd2iEikOnkjUSNzLcZmDaS
         miOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726450684; x=1727055484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJ4zB8iR1KNJGsuoPyhcL4e+N/fRrboA2H80bwmTRig=;
        b=rkcKnSJLYk3dvIvajUx4qQVOytNjtPn+KNqL7vexZOyrnVs1ibBeRE+GskYUJCuEly
         l6e6IByq2k8bwvw5oXpBhuaCoNMiXYjWYsBptn6Ku3H40dszZLVWYFia6m1iDAP7LWRV
         uWdvB+GNcLqtVORTMn0RSRdAaa1wR+f8kRmI/1ERgwUBy7nD4R51q0aq/A1ySRUFb14O
         96Q8wSadMe1teroAh3jV778lvylFnEgeLGmQknZbAAEG0Yft2hdP1vap/c9FgsPDJnXG
         sK4XxInvBio7SmGgW7zb7z+90cmWGUNzeNOT8UTeAeONQUw6T7g7YOlHXdFcfASCeNvO
         eE1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfrjO1+2yV1Ja4gccomcb+HrfmYSvP554Sv0Bo3NSAOf0kXSadOufOxccjOZgIx84X3dsh9z7e@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz3Rqs3olySLgUREgLn3PrKmRwCIZ+nVHx6J0JENHvhY2YSf2ki
	5A4bBEaECMtwv2rCdqQiqjTjbzHGFuDAwz4GrQ+wvtFFdwownZJQDE4fs7KI2nUzOYZgKE/vLCy
	SC+AGVhvm//q+eBEEokVUkxDZaA==
X-Google-Smtp-Source: AGHT+IHpIiRR5akklQIihavCSvcDCHn4aF+4W5ECxwJPVWeU7BihsxSe3ukzjhmGP6JhFf88Z8h4KovqUY1dUUD8GVM=
X-Received: by 2002:a17:907:72c6:b0:a86:bb90:93fa with SMTP id
 a640c23a62f3a-a902961ab6dmr1524114766b.44.1726450684244; Sun, 15 Sep 2024
 18:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240913101445.16513-1-kfting@nuvoton.com> <20240913101445.16513-5-kfting@nuvoton.com>
 <ZuQU2iIZwW4mAumo@smile.fi.intel.com>
In-Reply-To: <ZuQU2iIZwW4mAumo@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 16 Sep 2024 09:37:52 +0800
Message-ID: <CACD3sJbFyD1OeOX1Fwi97XpJXK6xO7=Ug1t+aMa=bQWwsaT+LA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] i2c: npcm: Modify the client address assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, tali.perry1@gmail.com, wsa@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy:

Your comments will be addressed.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
9=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:33=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Fri, Sep 13, 2024 at 06:14:44PM +0800, warp5tw@gmail.com wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Store the client address earlier since it might get called in
> > the i2c_recover_bus logic flow at the early stage of the function
> > npcm_i2c_master_xfer.
>
> We refer to the functions as func().
>
> ...
>
> > +     /*
> > +      * Previously, the address was stored w/o left-shift by one bit a=
nd
> > +      * with that shift in the following call to npcm_i2c_master_start=
_xmit.
> > +      *
> > +      * Since there are cases that the i2c_recover_bus gets called at =
the
> > +      * early stage of the function npcm_i2c_master_xfer, the address =
is
>
> Ditto.
>
> > +      * stored with the shift and used in the i2c_recover_bus call.
> > +      *
> > +      * The address is stored from bit 1 to bit 7 in the register for
> > +      * sending the i2c address later so it's left-shifted by 1 bit.
> > +      */
>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone
