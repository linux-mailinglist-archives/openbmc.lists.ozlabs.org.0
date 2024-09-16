Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E37FC9799CB
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2024 03:36:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6SDM4V0Wz3c9k
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2024 11:36:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726450560;
	cv=none; b=mNuJdSw2c61fTQ6TjU25yu0X/mgSO1FASgRWVOTIPmm5cRaCFd01Vbh4DHQU8RwfrIy5FN9hzJZXwK2wBNQ8Rh1HUiF7EnNaycMtuxXyTdebKjvgH3+nMEMUNL5rOVwCKTdATZHpnTmi/uDY/XkwwAOEjSeplLkYqc7k4J5l76bUBVB8gamKHvHTLAXDE/ktgVveVfDZh8okOV6pZUlyfBBUxlgRxvaDehughMvgrM6CoNiWqRaFZb0ivDElQynFY/7V+fnM3+gVUl6NlmYAUlRyC5l+3hSQ1540deze5mCRpsOdaRcsreiKJ3d9v3HfdW4ItUSt7FNnaQFMz20Sbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726450560; c=relaxed/relaxed;
	bh=A3Opgofkq69zE6QCehvO/0WQhRq7E+ZOUJLxNG6PQyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KfK+qnZuubFUfvIYZrFd5naPDvWsSzCXqSH/Dhi5i6OqTNUi6Xz0aMOheSLRP5v3QJmr74PEZlMeY0nkMWnHu+Vn4iZICAgcQYyrIgpTuBwQWgWFKJDHxPJWu88c5IhspaR5rXyFRN5ocJflHC77L59NzBH6B/1nmY0S+YcI1NYpEZXOly9gMorvv6quA0buBc99dqFzONwDngu+lmVk3jp2EdujmURtcBEyaWArwzx7OW3oMyG5zRmc3Sr6SfxcJMDx+27AfyZ+iGXkW7/j/4bUhd+84EHgYkvV0SyEmZ9sMzVTAzIvEHBlJziWO5PUlryCF1hAIbdKmU3KTJ769A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dUup9r3N; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dUup9r3N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6SDH2k7Pz2xYr
	for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2024 11:35:58 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a86e9db75b9so621424566b.1
        for <openbmc@lists.ozlabs.org>; Sun, 15 Sep 2024 18:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726450554; x=1727055354; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3Opgofkq69zE6QCehvO/0WQhRq7E+ZOUJLxNG6PQyU=;
        b=dUup9r3NoB5v524jzPj4csTN7+cZkp5W3MpLNTa/qW3b+PKY6Wx4OGGuDESZptnvvY
         tKkAZUMvyFaPdxFTd6DmaNas4Etl3cWvgX7qgCpqY18+bxFQy9HmTQNi8qzeGgVTOpaa
         My6+sKuKiYPs1ewCH7aabIoVZEsFJY1jnbtspst9voiOvXRNqq8u179XvnemWzbNIID2
         ekhDzUElbe1IftzcFhuqhmkB5yFhW7IgFzWHk7pecuPIxL+vHq1AMr4F8gm3lzIO6ylA
         6ENavJKGbIykxbuX/S63kiY49UcTE1+mQrBlU67g22dwLmtzfydTn+KbkurJfR2ZIG/t
         VanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726450554; x=1727055354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3Opgofkq69zE6QCehvO/0WQhRq7E+ZOUJLxNG6PQyU=;
        b=vdJS+z+pRXn22S5hglTxZrf5HgKxBFvFvKq56Ram7xMXn0OiHdMiFRdZ4pAbxIA5K6
         dXZ65VIC/OFKwozG8TP0MpxzQzyEy6Y7qSv1YNR/R2AoKd5mURR1n3enRw9jJeH8+aQY
         UyoZpwdjyzsZdSgTYId36YEGYJZ3j/FpoLmk275OFrlE63816nuPzWCydrbnQy1hgrSw
         pNL+88+nT9aHw+xcNjhaz4BMv83G/piabfLCV4wBTe+xkEHvXyMPug9t5niyaz/myn0w
         MGQJOLFZp2XpFriw4GCeJhAW5eKpW9GvXK2dA4ngTF/KwsvlWUApbpqu9QyUAGV7n5m+
         KSdA==
X-Forwarded-Encrypted: i=1; AJvYcCXOCw+JU3+jZKHvmBXOAC4qKW5+8XJxLdm35yGxjhD0z9e7XzE2x7QFMd09+cBTr0e4vhrFhqYA@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx2cQe94ASYMlZWHwhgkk9HaFZJxHEVqfnvPJjMVi/xFDArUZR+
	5RAPZAOhNYSZftqTG2jXF0Zx2hAE2WsX8aaaX/fuIALwU8muJ8/1phSRZbT8Vtk/Bx3imX5xZES
	jqbX4fplFNOYE9UkwO3spuI7GlA==
X-Google-Smtp-Source: AGHT+IEO62RmfPKA1taE0s+BQuDJGAh3xFptX8NIrEJDh8tUggxJEVWWR+hy0jIiUhytHDQqg3LV3XdeZU5inzye0J0=
X-Received: by 2002:a17:907:efcb:b0:a77:f2c5:84a9 with SMTP id
 a640c23a62f3a-a9029504f45mr1448444966b.18.1726450553787; Sun, 15 Sep 2024
 18:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240913101445.16513-1-kfting@nuvoton.com> <ZuQUfCK7d7DuR9eH@smile.fi.intel.com>
In-Reply-To: <ZuQUfCK7d7DuR9eH@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 16 Sep 2024 09:35:42 +0800
Message-ID: <CACD3sJbv60bYc_CRSa+YEAJuthqDxCu6pR=pgSsKX892LKNHww@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] i2c: npcm: Bug fixes read/write operation, checkpatch
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

Thank you for your feedback.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
9=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:31=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Fri, Sep 13, 2024 at 06:14:40PM +0800, warp5tw@gmail.com wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > This patchset includes the following fixes:
> >
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
> The series titled as "Bug fixes...", however I haven't noticed many
> Fixes tags in it.
Understood. I'll remove the "Bug fixes" in the title in the next patch set.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone
