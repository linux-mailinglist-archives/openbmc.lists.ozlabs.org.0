Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 275E499C22E
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2024 09:55:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRqKZ6YC9z3cTj
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2024 18:55:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728892543;
	cv=none; b=Ff4ub880QtsTFizwq1JGF2iYnlkBL/GpjXtTscsXJt3bZlRbzoD3u31p0cY4Nl/CCq6vjSkbxP1ZKjxdP/0XClHHhSvPJHdbXPkTCt+xhTrMDZoOtOdpqe1+Tei/Kq5tPb6TI7h1zB+x4sq1xwPAn2/msBmV4rTqOHsiE8xR39RAehB5i1yqHwAglFFriT+Dv2aSmCy5BLHbeYqebogk/we4kA6A8j4n3xInGNg11bGu3sJe/iGCMV2F9s5XUadQcIHeAvr4WNCK7wulUqRkyThfSzIANm5RMjPgRQcLeZtTIuYzVR0MbF06BDKq2s8eoD0QkXeAPgyhwsp4tZqwwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728892543; c=relaxed/relaxed;
	bh=6WpR+CN6uEEu6EeTwqUSFj9u8VTqS2qMOuFsh7BuOiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TmxM+G4XuywMIq07BU9CEoi319MbHsjSYM3SFbFPawUvno94fL53DH8bcQhlEd7Q+mbLQ/AsRf0dWNCNBM0LR2mcQaSex0rpgYOhvlBbZq8vm69Dknc6gdGHnNxZdft5UteY3vKpJ60pzn4RiDUTjnuaW50nL/ELCIZJPdu4jIGt1tOWgXDW98BfMetQHLYgy3l4OxhKI/s0GMiiKAFqpRQ7ysoECPsI5uuAZDuefpOMh79q37TFoJabyVXHAFZX7aFctOQrS6s8RGgEJ3FBDQT4Ge/uK8mbXnCLRjjfqr+YnGj9yZR8FHSYEN//ORIXywo2aArv93av4Gr0m4j0Dg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bf6un+ai; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bf6un+ai;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRqKT5SvSz2xwc
	for <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2024 18:55:41 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a9a1b71d7ffso16620866b.1
        for <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2024 00:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728892537; x=1729497337; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WpR+CN6uEEu6EeTwqUSFj9u8VTqS2qMOuFsh7BuOiM=;
        b=bf6un+aiJIb4CrCPKDEKBVubGgMwoayFnUdZ6L9uIb9chSnWv6ZNNxHHoI+N9pC0z8
         Sl3guy6wuF7FCjuNgVKF/Yl4cVgVxjNIuhYgG/k/KcP4QKD9WF5VA9jzw6m5gnkrYIkr
         d2AeHQPDGf1y+uN0Y1536tHgN+SwfNBsV+ocveaRvZSaGNJ1UJTTbHO2J4CrTUZFxJju
         nSWlanafGyBO1L/JGY/JlP5cvGsYOYcY9FoLrCyACF781Fo389KKWAk76UHaBj0hW169
         zn0QK+1VREgkopbXcBhOT6uzZDw/O3JAgkVz4gKgjmR99nfbJSJyi90J4+FHH+77SviP
         qG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728892537; x=1729497337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WpR+CN6uEEu6EeTwqUSFj9u8VTqS2qMOuFsh7BuOiM=;
        b=FiYej2xBy1dlUasiioDVL+myoOnUq2ULK3H53TdcbY3BoFxNBm2xXF751EejB54rZZ
         7iuCH9TWLjrTSrxki/uYz8nQNUTndh8ahJESIm9r1UViMmPHM7Cq+79aEohaTPh3apPs
         HuOSUd8wdNtacI75ZhQQnRAd1L3Q9p+IBE5lmfQclyg6XXJo3k9xHIsUqFCB469d4rpF
         p2pyig0xOY6keOGULRjKmkGuN+KiwhvSbvABnZk4HSJDmqzmUg2k45tDto8iho9ofP9c
         xfwFTqG5+XkFLn9BXkMG3vf7dEp92qYU8UznKqyOIvVQewZ1CjWHhc1le77FbFHdPIBD
         He5g==
X-Forwarded-Encrypted: i=1; AJvYcCXrXyM2Lg1OgpdHjnbo+IaOyfy5UrDHKdrzluv2EgtDXe242sC31pbCw8/wlgq4dP6gpktjVTVj@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyzTn25i/ZvvM7BQ6swIFZhbqGHH1eNXewu+ok1xF/ps+A2YS8X
	4b2REZqMhe6BCt53sSrzxzIuVZQmUb/oU16d1edp8pFLSC2Y6inYXJvSxKsgJD0BQ6vL6Tlhmeb
	AExxqkQlgeArjVkhoLYBX2seDsA==
X-Google-Smtp-Source: AGHT+IFcctVyNJkG1tiXJDJMAL32ITizXtIvBW2QMDcgKBM8PHI0UeAsniLAG3tGyewO4GbuKOAYmEj2MGLx6KzVxdg=
X-Received: by 2002:a17:907:3e21:b0:a99:5278:ac93 with SMTP id
 a640c23a62f3a-a99b95badfamr828775266b.51.1728892537111; Mon, 14 Oct 2024
 00:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241011055231.9826-1-kfting@nuvoton.com> <20241011055231.9826-5-kfting@nuvoton.com>
 <ZwkFwABviY8ClyUo@smile.fi.intel.com>
In-Reply-To: <ZwkFwABviY8ClyUo@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 14 Oct 2024 15:55:25 +0800
Message-ID: <CACD3sJbw8QVsfNW=Rz4WfzQ3-+d=Y_=U1kpkneSNmfDcGugChQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] i2c: npcm: Enable slave in eob interrupt
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, tali.perry1@gmail.com, wsa@kernel.org, andi.shyti@kernel.org, Charles Boyer <Charles.Boyer@fii-usa.com>, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, Vivekanand Veeracholan <vveerach@google.com>, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy:

Thank you for your feedback.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
10=E6=9C=8811=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=887:02=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Fri, Oct 11, 2024 at 01:52:31PM +0800, Tyrone Ting wrote:
> > From: Charles Boyer <Charles.Boyer@fii-usa.com>
> >
> > Nuvoton slave enable was in user space API call master_xfer, so it is
> > subject to delays from the OS scheduler. If the BMC is not enabled for
> > slave mode in time for master to send response, then it will NAK the
> > address match. Then the PLDM request timeout occurs.
> >
> > If the slave enable is moved to the EOB interrupt service routine, then
> > the BMC can be ready in slave mode by the time it needs to receive a
> > response.
>
> ...
>
> > +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> > +             /* reenable slave if it was enabled */
> > +             if (bus->slave)
> > +                     iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR=
_SAEN,
>
> GENMASK()?
> But why do we need it? Do we expect this to be 10-bit address or...?
>

0x7f is going to be removed in the next patch set.

> > +                              bus->reg + NPCM_I2CADDR1);
> > +#endif
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone
