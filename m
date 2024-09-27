Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF43B987CC9
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2024 03:59:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFDDG3d4Jz3cH4
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2024 11:59:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727402361;
	cv=none; b=WkXH6jmY5uoHvmtMPT5ENbywtBMkBgd6PBvaGWiX+06E0Co9vvm5zVJewO0tShd70uZpV6DGnDgqKKUpuKED7i5KnoYL6vqDHe+vHD7j8CulC+Mr/3pveuPhfz2K6y1vinYTJHTtYZUtpVTGEGCH9EFDTX3P5erPlmnTbGePH/CfK/ucjFK4cuWcl/hsGgnN768syT9IYYTgiOhnr930JNw9ohcAJ06xckLyueWZTIYz+aMeXlrRT+gzD+vsdv15/MvYClm/UXUtulG6xq+EEcyWKjLtApvKqctE5tsDv7RRy04wMGrC1rxllRKZ4MQ8AtU7R+6VHNeA0P9X2Sk22g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727402361; c=relaxed/relaxed;
	bh=c5cR3Q8+qFlb50DTwf+gQ5cpJ9VTAnU8gdUxRmnDbYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jhA/s9SetQd9wqyIF5/PsQ2nRNw7v6+Pq0bWRSZgmoA+cDKjbrAd9WJInvtfP5X/jfnQJU90qC0kvk64JE51YhVY6+WwWmpmHCVq7qCaR5pYIZd0bZAOne4l6erm9VF/Zsgxh7ETdgr8yc1y/RgutTyj/tNVogeFpjLr3VKlJj1NfUmKT9cna+yWrQPRQ4B0CncoDhF+tPtVFq1VblriADGiwrR9gRZ0Gg7VQXiqyvZAePBKQVjPA4ZXFF5XQaCoOjYK2cGmTCJ8R17idr8oh/d4fc43A38WOzYIPNk8dqgQtM66JYbR6bnq5KkHBppsq6Dwd9nBL0myjtjNeFC1yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=joXilk0l; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=joXilk0l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFDD9036Kz2yHj
	for <openbmc@lists.ozlabs.org>; Fri, 27 Sep 2024 11:59:19 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a8d6d0fe021so256278466b.1
        for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2024 18:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727402355; x=1728007155; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5cR3Q8+qFlb50DTwf+gQ5cpJ9VTAnU8gdUxRmnDbYM=;
        b=joXilk0lYWWALv+hY711RY0nEA3dt/L3jYv4DnRWiZCWkD7eBDdHhR7wmu441GKEia
         W0Ci6d8RkW0ZhIcEaolDL8mbHbu9WwKEU3FAqjOIZ8GHQ8VAFY1D0iyTqXURbIUIDKpZ
         3HuTfNufyoVU8nFvbdUM2FGByvgiIP200VVkMvgHkFggOIde92cHo9X+m6NMBhkXR0D6
         iAEZsXnJ4jV2pADv6U4KPs783GBjHSG2FpexRogzhWyoA4pKSaPLoaJJtnkM3ViEdllD
         MH2oG6v1oG9NaXcSgPqQopXjRZCXuxYzxpiMKXweGE0lIhlWpjZe1Cn9maMcHYRauvLG
         bnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727402355; x=1728007155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5cR3Q8+qFlb50DTwf+gQ5cpJ9VTAnU8gdUxRmnDbYM=;
        b=f2XuRwTorXZUgKCu8axg0BQvAefiuKK30KxNdSdp90t3NU4jYnxg3rLdXj8IZCSn66
         /VVO6iu7JMOdYLjvjrus8CjHWTOZXqtbqfmp6nfMcZQUnwPLxz6X3eYp0NnSQjWK6xXA
         nfqjUigsJypAHTW4cdcygC+bPxpOFOyy9hr3sQgqR6Wn98cofVz8N9DCYd1vdVNlQEZi
         fhESNlKvGNVqdykfq/fE1aD8bo5A9ELFI/L3NXwCG7JJgKArZe6Nq+O07NKM6B1SZtCf
         nIKZA91d8zUi1gag2nobl63QUpzH2O7Kb6rKwRtsUCrMEOgnwyP2a0NOBGeWVwQ2b1oE
         CneA==
X-Forwarded-Encrypted: i=1; AJvYcCUf66he9SZz//it/wsB5fgO0qhGmlP8QxnJpz+Udi+VcMVpw/a7GW0R995HKCcER7PhnoeX1hGA@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw1YGkzmfnVgoAhvueUYRerhY9BxtoEvGWVoY4sOM2qsCqkgdrP
	mbN7imrmXnFx+5jKz+ZwNcJ7YuHe4qf1ioY7LCk5I9DVY5IcPh0aipEOWCHbP0PeQghckVOglO/
	9a04+gaYyZWTQD0P7aGMrgbR5Zg==
X-Google-Smtp-Source: AGHT+IE+eDDaLETVOmmDQjeaQ6dwtiRqSGMOBSedce60yrewHjSxeDZdw+OY3ofOqrceL+QgiofjsTCuQYgh0var87Q=
X-Received: by 2002:a17:906:dac4:b0:a8d:51a7:d5e8 with SMTP id
 a640c23a62f3a-a93c4918365mr114251366b.15.1727402355429; Thu, 26 Sep 2024
 18:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240920101820.44850-1-kfting@nuvoton.com> <20240920101820.44850-2-kfting@nuvoton.com>
 <rpu2o2vw6jqbuywabaxaqepathkqlzjzjvn7j6h5lq6zslitu4@icj5hpmwo6kr>
In-Reply-To: <rpu2o2vw6jqbuywabaxaqepathkqlzjzjvn7j6h5lq6zslitu4@icj5hpmwo6kr>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 27 Sep 2024 09:59:03 +0800
Message-ID: <CACD3sJYQeqo4+uvDYR7P14cC3R9_wHMDhzy6T4G9V018NmTMSg@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] i2c: npcm: correct the read/write operation procedure
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

Thank you for your help.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:19=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> On Fri, Sep 20, 2024 at 06:18:15PM GMT, warp5tw@gmail.com wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > From: Tyrone Ting <kfting@nuvoton.com>
>
> no worries, I can take care of this.
>
> > Originally the driver uses the XMIT bit in SMBnST register to decide
> > the upcoming i2c transaction. If XMIT bit is 1, then it will be an i2c
> > write operation. If it's 0, then a read operation will be executed.
> >
> > In slave mode the XMIT bit can simply be used directly to set the state=
.
> > XMIT bit can be used as an indication to the current state of the state
> > machine during slave operation. (meaning XMIT =3D 1 during writing and
> > XMIT =3D 0 during reading).
> >
> > In master operation XMIT is valid only if there are no bus errors.
> > For example: in a multi master where the same module is switching from
> > master to slave at runtime, and there are collisions, the XMIT bit
> > cannot be trusted.
> >
> > However the maser already "knows" what the bus state is, so this bit
> > is not needed and the driver can just track what it is currently doing.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Reviewed-by: Tali Perry <tali.perry1@gmail.com>
>
> This patch is independent from the rest of the series, can I
> start takin this in and unburden you from this?
>

Sure, thank you again.

> Andi

Regards,
Tyrone
