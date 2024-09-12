Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67389977159
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 21:19:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4S1M6yKdz3c9w
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 05:19:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726168772;
	cv=none; b=bQVn4YJCkoZt/S8VFHhPVb8RT/9jjU1i9FxMTo49M+qzLjre5WBPhSYh3zT769HAU6wO/Smxr5gWIxhhOXfLXOEBaPRWMb/xfmSGi8BxsRhDKbhJv/26vh1qSUf/odaBbMTCGp/Pq9FaC68SFpX1tSux6e71/6ImRtJkV4sVbFX6XVoLApjgYL1iSseLF3fPqjIMKK397+Q7CDt7OHhlS1rIilZeZfAG5lfxykIHZ1jorKVd7NjO93/G5PpcqLbsFkKdEvoftX8JSlN0XC/YdNJCVU/fZVaVS2HaIyG4RQiHzvdz6iOsUlLqDRXFPKdXV/C58StdmAajVIlKx4Er7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726168772; c=relaxed/relaxed;
	bh=pSRSbbCaoVGe7HmH3q/bfk+SXi7th06IJQJ3A/RsFqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hW5d2Tf/sh0RPxBturZ2wa5/OWq9iad5M9c/NZUvDZJZc0WmqnQr3PGsn+3TbZpHf8Kz2D0s1FajIYt7UxeYGeeuOHFj5t84/x8JocCHGYJC+ZzH2iMwNfGSE2r7kvQcp/OK7xkWVDH9kP4XH7rS2ROjaX/oEigHytuL9Xi00slHf+3PbYl6lx+rspFzja8ivnCaSQ/5BsTV5+rYPM1JHE4sbabUAO4MBW/KPtRnsTvcBurmtwAKZ8j4X6X3Lr6aeD0AcE2Y0X400Dx21Nr7qien7hnIZRlX8ZqHGx7lIW4eml0WcyA7MAuTK/IgGOpyxfPiIlUgbLYDEQXAe72Ldw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JZV++HLg; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JZV++HLg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4S1H5yqCz2yLJ
	for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 05:19:31 +1000 (AEST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-6d5893cd721so1378787b3.0
        for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2024 12:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726168768; x=1726773568; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pSRSbbCaoVGe7HmH3q/bfk+SXi7th06IJQJ3A/RsFqs=;
        b=JZV++HLg8fPvnS7awsidhwlDgO6rT0vWGsOeXaqZ/3KC3UXMkat3zptnkFEyooNtnu
         sv5Ojee5MA3duKgrkNI3+2h3jJe0eWFRCSgyr6F2MsBdPIiludaZbFFbaKcaGf3hfYwm
         aqExWM3LQ2JZuz/1fUeCxY7FCZ7mCz/qcJ/oEAYnoa+ceMMNCsabQQGG0gUkcPQQ8Rzj
         X9qI9g96eaJ6Qt7SPwodti9Oc2JD2mPq7oBGWRqxk/kKFXqXUK+cgPdCUGLDo8ut+ird
         J71qoRVMZiGrrPFIUZMxlM1Fiu+XJaaBP771BZYhWNuSXSpd2Yj7wtzg7gE+x62Dz57M
         Cqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726168768; x=1726773568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSRSbbCaoVGe7HmH3q/bfk+SXi7th06IJQJ3A/RsFqs=;
        b=gDscYrcNukCS0pYh+TnViELkb1h93zUoJQmUAYChh32eZw8z7B03RirX/XpNUTInUo
         s6h8tiGf2IfkeRY1nZSmpKuDGs96NHkec91EByZtWdnjLdOiun1aAT8CDUlUXUl/Nfg9
         I7V+THKvLX1tUhLHXdfv7UldJWn3F3RKXGfcQL8H8Zr0rWfuAWxrzUT0czTC+g5AskYX
         qWQ+I9gfO29ePJwPsVhgCdYlWc7U3eJpE/wbkz594YR8RwBvRsfPOGgm16IpA9S8RgNb
         vIz0UGCYsx1FkiUdRHdp9z5RUyibS+PKGVuWuFGCR6TRW1dfP5vwt439fkeyArgkK2Ui
         10QA==
X-Forwarded-Encrypted: i=1; AJvYcCXhC4kS7g8gDvsHv33Egr+m0NBL9QDUfjn6sGzW3warcACBZf3YMm1nG4p63AjNGuKwXYgvRKVo@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy7Xjn3C3puArP6ZDskPqUrfB3ELe/PGjyD3vkUnvjhvDQ9jdwK
	Y0nUH7ansgbe74nDIlmNd9goZNySzXTNCtVZpdI7l+GYClWhMyASwbYaImVBkBp1n6jyi2b83tG
	NPHATQ4CJREvVX5f8XKHnwhQHMUc=
X-Google-Smtp-Source: AGHT+IHDzg+zuesi6uutLUgvzvlW5QWSMXu094bH44N/ZMJx/iOCNtDk078OF3doxaKoeYS0g5VOwuKnwoA7hDXn6II=
X-Received: by 2002:a05:690c:4f04:b0:6ae:614e:cbb with SMTP id
 00721157ae682-6dbcc59b514mr3673117b3.42.1726168768270; Thu, 12 Sep 2024
 12:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240815150255.3996258-1-tmaimon77@gmail.com> <2f21322a2412684c6aa7bb7d817e861c.sboyd@kernel.org>
 <CAP6Zq1hxwb3eWakPJecWXbt6_JqOmph-72bRn6pztxy1KiuF+Q@mail.gmail.com>
In-Reply-To: <CAP6Zq1hxwb3eWakPJecWXbt6_JqOmph-72bRn6pztxy1KiuF+Q@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 12 Sep 2024 22:19:17 +0300
Message-ID: <CAP6Zq1jFg5Ex3OA32MjKp50XJQizhBD-sGe04DW0RD6VPCxfzQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v27 0/3] Introduce Nuvoton Arbel NPCM8XX BMC SoC
To: Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, krzysztof.kozlowski+dt@linaro.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, p.zabel@pengutronix.de, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Stephen,

Philipp approved the reset patch with the minor changes; these minor
changes are already addressed in V28 that sent few minutes ago.

So the clock patchset could be applied :-)

Appreciate your efforts and guidance.

Best regards,

Tomer

On Thu, 29 Aug 2024 at 11:07, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Hi Stephen,
>
> Sure.
>
> Thanks a lot,
>
> Tomer
>
> On Wed, 28 Aug 2024 at 23:54, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Tomer Maimon (2024-08-15 08:02:52)
> > > This patchset adds clock support for the Nuvoton
> > > Arbel NPCM8XX Board Management controller (BMC) SoC family.
> > >
> > > The NPCM8xx clock controller is created using the auxiliary device framework
> > > and set up in the npcm reset driver since the NPCM8xx clock is using the
> > > same register region.
> > >
> > > This patchset cover letter is based from the initial support for NPCM8xx BMC to
> > > keep tracking the version history.
> > >
> > > This patchset was tested on the Arbel NPCM8XX evaluation board.
> > >
> > > No changes since version 26, only tested in kernel 6.11.rc1
> >
> > Thanks for working on this! I'm waiting for Philipp to review/ack the
> > reset driver part. Until then I don't think I can apply this series to
> > the clk tree. I'll add a review tag to the clk driver patch in case that
> > helps.
