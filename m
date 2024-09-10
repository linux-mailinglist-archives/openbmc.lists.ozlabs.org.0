Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D81F972688
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2024 03:13:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2m0T4d2nz3cGZ
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2024 11:12:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725930769;
	cv=none; b=IAaaUEEQ3UpdtN5iSP2s2BMcfe3CY7zetDqe2tTVPC9YGYucc0iJ+zGURkjTp6zpE4wD5ETyxgHixLnAlYuuu4J4qM+qEEbTDjFsZwoXbZ8hgxND2a7m6GlH16zWHHqiJd9LWXawwyjRwxZYKYriZ8ybpQGfIKh7wVUfbJOuSUDATOeOePdtqnwYCS11VXy8pQYRqc9J82tA+nGi7DX0PX98M9NlSwyVWlfBBxBaNqhyeXV4G2NarkJE6lbz4pKFbpq8aNQccMvj/uSoDgyaokQALqisHgTdB3CP2V+tcaaLnbNt4EjHVsBTPDMr+5DAgP/ZHA+BXTNuBarTGnslHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725930769; c=relaxed/relaxed;
	bh=j3cOEtOvexh0wx5WjRoJORvf1Auxy8+dLP9Bjy/bEyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CoidBPaL6CbRwj011CDjlWcx6oMmSfnljltyX5FInZpItGDut5IlbJJQu0wHMFeuc29+dxTyx0ouo9jHndO7+lGzUM1T15oIM+BnkVs97A4roMQa++0mIAow8vZVtyy20SSIjP02Elt76v3MiIGFHoKEQkuXtm1TTpX2ouXcI4Vups0spvhcpcFJk2iPyp6UAbLiyiFPpLmom5id27btLL7Q6Bcx1D61UMnLkktcZ2Y9rENT1s5RtN0JEFMj0gapmRVDqXAY3msYXQ90qqHUtvw/3zpM8VfEPqGn3z7++Xosaa0wpkFFgfBy6883vksE9nJWTg1R+DRDvXWpyHLq9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XTZt8fd0; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XTZt8fd0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2m0K1rKcz2yF7
	for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2024 11:12:49 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a8a7929fd64so626547566b.0
        for <openbmc@lists.ozlabs.org>; Mon, 09 Sep 2024 18:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725930765; x=1726535565; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3cOEtOvexh0wx5WjRoJORvf1Auxy8+dLP9Bjy/bEyU=;
        b=XTZt8fd0K5K8L4ADeXj7C0GAkLGA1YCOSylsDAtNlP8cEWkW8XOxLFffA2qDB4ceLc
         QrPezh7uQ/3VYYmv7U5fIULX1E6TCO0sVNopLXy69oXmp1XuOgVWoWzt0kAs2JNBYBta
         ijKA1yLo8q9VJDthWwyoxYg6JZZReNZBS/1IB7KAIXwWkxOsIqLwTIpZ6zS8n2HPY2nG
         UG/Dzfl11GnTHeo5jRFE2ZuPtTSa/ZQ/ZCzK1LUhvVo7zditaT4QlSW8KT32jkXLrUcv
         kDEjohBFE65NB4+iYZFKiv1BxFSM90UtPxAGSvGu8CGCpxFi2fA6iTUvZ7iuIMcLqlRF
         3sUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725930765; x=1726535565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3cOEtOvexh0wx5WjRoJORvf1Auxy8+dLP9Bjy/bEyU=;
        b=RYjkAwYkReoLXDWa4RjJ8sN4dJg33/q1wl/RJivuKkvUnMY5WbNxiYzpTwp+rSmq4X
         9aaw/KjgkcgFJ9rZEZb0pD/iMFg0CwaXWBKfi/ICImYOMe3HkCsYqAZb0w3/S1XpLQGh
         ZdYndhh3zcNgEolj1Z8HMzmcgmRTS4OHxtZ+YSUb7Sr7mBbV1w/Crb0s8ZKYlLqmtZrz
         Oiy9tL4v/jHum0XMJuWeDpTtc1zaFCLveY1oy7/bcR3bv+yG9PhlZ0IOhWb8NsVhHMe4
         nofTbAV/MLTh7acwy2VCFf8P147che29DMbvZPCdVCkzfWu1fqXchzdPq5r6a3rbVuCJ
         nlsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaDMQe3xBfm3hwDz3MzkaErodd7vII8F3f75FzcGATDj9280ERU1b4c24QFql2WFdZu3V2VM6N@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxw1bk9gO+qBbnr0WVMz1NpSCpf1elGtOEqlKJRS8pXcGc5XHQv
	Ux4GpygFHhkKvrUIdrxtP5EQSscBrVuTpHoPbD3KyTuLKXlebWZQ3BRAeSdZt1MakqKDsoplL0+
	MnbAKIQUb97WNCaAIIY0JIF5FVg==
X-Google-Smtp-Source: AGHT+IHZ7U5FoeeNIb9dCX+fDO0hlFs6276LjKB177SRH9sND3Glorr7LJ/q7yHerwwbgU4TVi/BBZeZ/mGd2OPaHqQ=
X-Received: by 2002:a17:907:3687:b0:a86:b923:4a04 with SMTP id
 a640c23a62f3a-a8a887fcdbemr997704866b.50.1725930764537; Mon, 09 Sep 2024
 18:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <qr3q7stbuwl3ylcqnfftg43nvnzi5cz2wcrhinlek6kvzb7wyi@uqgq4z5b6ob5>
In-Reply-To: <qr3q7stbuwl3ylcqnfftg43nvnzi5cz2wcrhinlek6kvzb7wyi@uqgq4z5b6ob5>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Tue, 10 Sep 2024 09:12:33 +0800
Message-ID: <CACD3sJb1OvKqa1WsG-st=zmQsQ+-g=GNT-bRh+sQ8S59hi5kBA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] i2c: npcm: Bug fixes read/write operation, checkpatch
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

Thank you for your feedback.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=889=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=889:00=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Fri, Aug 30, 2024 at 11:46:33AM GMT, Tyrone Ting wrote:
> > This patchset includes the following fixes:
> >
> > - Restore the npcm_i2caddr array length to fix the smatch warning.
> > - Enable the target functionality in the interrupt handling routine
> >   when the i2c transfer is about to finish.
> > - Correct the read/write operation procedure.
> > - Introduce a software flag to handle the bus error (BER) condition
> >   which is not caused by the i2c transfer.
> > - Modify timeout calculation.
> > - Assign the client address earlier logically.
> > - Use an i2c frequency table for the frequency parameters assignment.
> > - Coding style fix.
> >
> > The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.
>
> first of all, Thanks Tali for your reviews.
>
> Second, Tyronne, can we please incorporate Tali's comments into
> commit messages and improve the code comments so that we don't
> leave room for more questions?
>
Understood. They'll be incorporated in next patch set.

> Consider that not everyone knows the device and we need good
> reasons for accepting the changes.
>
> Thanks,
> Andi
>
>
> > Addressed comments from:
> > - kernel test robot : https://lore.kernel.org/oe-kbuild-all/
> >   202408080319.de2B6PgU-lkp@intel.com/
> > - Dan Carpenter : https://lore.kernel.org/all/202408130818
> >   .FgDP5uNm-lkp@intel.com/
> > - Andrew Jeffery : https://lore.kernel.org/lkml/
> >   20240807100244.16872-7-kfting@nuvoton.com/T/
> >   #m3ed3351bf59675bfe0de89c75aae1fb26cad5567
> >
> > Changes since version 1:
> > - Restore the npcm_i2caddr array length to fix the smatch warning.
> > - Remove unused variables.
> > - Handle the condition where scl_table_cnt reaches to the maximum value=
.
> > - Fix the checkpatch warning.
> >
> > Charles Boyer (1):
> >   i2c: npcm: Enable slave in eob interrupt
> >
> > Tyrone Ting (6):
> >   i2c: npcm: restore slave addresses array length
> >   i2c: npcm: correct the read/write operation procedure
> >   i2c: npcm: use a software flag to indicate a BER condition
> >   i2c: npcm: Modify timeout evaluation mechanism
> >   i2c: npcm: Modify the client address assignment
> >   i2c: npcm: use i2c frequency table
> >
> >  drivers/i2c/busses/i2c-npcm7xx.c | 276 +++++++++++++++++++------------
> >  1 file changed, 172 insertions(+), 104 deletions(-)
> >
> >
> > base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
> > --
> > 2.34.1
> >

Thank you.

Regards,
Tyrone
