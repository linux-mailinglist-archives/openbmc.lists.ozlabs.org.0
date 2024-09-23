Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 631E297E4B6
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2024 03:59:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBmQb1BRxz3c66
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2024 11:59:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727056788;
	cv=none; b=KhvuIymrF/QwxORHc+m/Y9Rdxl/ev5GkCKIiyA2BYGwFwU1U6MC9w//n3bXaQZD7iO6U5y66zNwVZUFCjShVxaPg0b9NKz78WS+y7mmrNYxrNAnFvxq9FJPPR7RVFNVVVUIR+aEQSarIVzKXb8DBgTKulogtgZ7k5GEcgJhNtkybrWuiO1OunFJpq7K5aqW3qORU9NjbyHd/7OJ6sH6giTv7rr29cU4BuV04qSULYwzSmjhcRk5r6PTs/O9F2BZnuXJ8KFAbb9TlkFZmnyfyY/G2tFMHWiuPReyu/vQ5yLRSLHu20CRpiwFtYgEP+tl40ePAwT2+g/Pm2t24sWuy+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727056788; c=relaxed/relaxed;
	bh=V9OJDWcCedhcvF99YMNzmIyX3NS41PyYP1HFztj9/E8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sz4rGM3L8mspto9qPBXq2tLK30t1JP3wLL/DFOw4msN0vSY+PJiUFqgis6Wh8hvYCvvwqZFIGpQMJ/0o/gmXY1kSl+5p7LvrK/od3o015qz3Zid+AKQQIV8dw367G2VQhcCs1wnEgVZUZCu0f7oC/2lmVfayiq+dsdRNlipZIFxtutV46YWL8bVfgd2c77hpdOyAdpnSpHgDmz2OdZmwNBm8aEF5COVDLY6B0kTo68xz+zrWPUsD/H+utOd7DqVK/15kiErhexwgsWL3s2CLUhYRtM0eK5nKCOiLyccK2dUMPNVaNJYxl7OdxQOHzjL098nYjvIdyR0Wvrjkoyieuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XUkV3ZQz; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XUkV3ZQz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBmQW6Vrpz2xb3
	for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2024 11:59:46 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a910860e4dcso77142566b.3
        for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2024 18:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727056783; x=1727661583; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9OJDWcCedhcvF99YMNzmIyX3NS41PyYP1HFztj9/E8=;
        b=XUkV3ZQzHB+8bNknNSRJGsMWGmoxF3fh52ge6cj/yMpOinzhMuAdvWeAncUcPCxALG
         w+P+j/GMlxaDVGxbBYCCgq23n8mu4vd+Sr9iCqUA3bhgJBvLv53uF70jz3hRaVLK57sk
         35WV8cmHydxk2YwmwSuX9NCKifeYE+ALwf6JIziKVRH1drXzblZ1Vbh+F03/iayal3Rg
         whCGoLHmfoVijz8JB02XiAHB/7lbH8gFzt2kT6KyoeogNDaKiqO8PluaqVB0oVwPTZcG
         +eYsyrVwhUOgu5mPAk8ZLIeFIPaPTMu/p3KlQUOxV0yh8f4NzGfQ2i4CHVBkjqZsCzwJ
         SgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727056783; x=1727661583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9OJDWcCedhcvF99YMNzmIyX3NS41PyYP1HFztj9/E8=;
        b=J/kQjTiBBJOdmH7NVxTKJQvTbH9lcgVa38RHyDEDY6x/Ua0SjuJgG5xqJW5XUcKho4
         lw8jTvDKsCeqnl8aIjHRsGfLzVQoHFx6ppIHwucErT2XeLyBnbv96xCL3yiQatioaCG2
         Ayjvwe1ea0KfazLo5VEz+FiWcnvUvFk1CWZb6waaGiixJfSj2WYp2tHo57BjDmIdcdPf
         zVSTJxMX8Dej9NJXP9oiVFgpaVnfPduhMm/P0Li/+pLY3cj0uwrJfGSWnE1fwTjpPfCF
         FmiB7Um6tv1bom4PK1ydB4OKSKSWCL/Pv4PeuJAxAIlXemXTzzrf7MVP2xYXUL1FkeW4
         GA8A==
X-Forwarded-Encrypted: i=1; AJvYcCUL0D4N1zR4HHZVNJkT6Q6KmM0TcjYWLXsYgvorUA6yjNZwgQyWuuAdzSe4GQriQtLzWgL0FVp1@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxaPlk3qFHATPu2YLGf7/CAF4AXs4nUJd6MxEVQmxeHPTjWusmQ
	Z5HGzCoI0A4Urb0WLRUJbAte8fyOKAPn0G8twIPcsL9a+URke3LH97PQ2JWAQbmeM9dh25LFqB0
	Aq7n3skXe4QwQtM9wA7g/FHHUthf7zJYu5g==
X-Google-Smtp-Source: AGHT+IGH7hIQ6RwdGcaCJhgymTYoAwrIjsYdLmD0YE9w99TNSkrps9XHNNEM4U6mu/TbDbv6Y2vwBhmssX39HM1Yadc=
X-Received: by 2002:a17:906:d7e5:b0:a8d:4b02:3351 with SMTP id
 a640c23a62f3a-a90d510a5aamr966141666b.50.1727056782968; Sun, 22 Sep 2024
 18:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240920101820.44850-1-kfting@nuvoton.com> <20240920101820.44850-5-kfting@nuvoton.com>
 <Zu2HmkagbpMf_CNE@smile.fi.intel.com>
In-Reply-To: <Zu2HmkagbpMf_CNE@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 23 Sep 2024 09:59:31 +0800
Message-ID: <CACD3sJbD4TuhDwazBwcc4FR2yK40LV=D-mk6VAKwNvxqAHNGLw@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] i2c: npcm: Modify the client address assignment
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
9=E6=9C=8820=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:33=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Fri, Sep 20, 2024 at 06:18:18PM +0800, warp5tw@gmail.com wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > From: Tyrone Ting <kfting@nuvoton.com>
>
> It seems all your mails have an issue.
>

Acked in the previous email.

> > Store the client address earlier since it might get called in
> > the i2c_recover_bus logic flow at the early stage of the func()
> > npcm_i2c_master_xfer.
>
> You got my comment really wrong.
>
> func() in my example was to refer to _a_ function mentioned in the text.
> And IIRC I even posted the example, like: i2c_recover_bus().
>

So the commit message in next patch set would be like:
Store the client address earlier since it might get called in
the i2c_recover_bus() logic flow at the early stage of
npcm_i2c_master_xfer().

The code comment would be like:
Previously, the address was stored w/o left-shift by one bit and
with that shift in the following call to npcm_i2c_master_start_xmit().

Since there are cases that the i2c_recover_bus() gets called at the
early stage of npcm_i2c_master_xfer(), the address is
stored with the shift and used in the i2c_recover_bus call().


> --
> With Best Regards,
> Andy Shevchenko
>
>

Have a nice day.

Regards,
Tyrone
