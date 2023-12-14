Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC6B8136E6
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 17:51:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XFYgjKSO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Srdf93k4Zz3cZ1
	for <lists+openbmc@lfdr.de>; Fri, 15 Dec 2023 03:51:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XFYgjKSO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrddW3BMrz3cLQ
	for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2023 03:50:37 +1100 (AEDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so6010996276.1
        for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2023 08:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702572633; x=1703177433; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GCp7oH/gOJp7J9eGa5Fv3Vw5adjzdlx0cxRf567SUHs=;
        b=XFYgjKSO+lGOBK2XE6J8Yx1uj0HSJmihK0MrvqZPFy3mEII5vjgHye4jUkKDO85shx
         XJ7SCWzBLdxdZnJRjn5p4cLaKjLbRuDl+D4FsZTzJNT3E4lFUrLRwo3Gc0qoSe02IeNW
         CFDdUKTSZP1vNkLNpgoFA/uAvQ7v/HRD0Xd0Crwzq4oSFQQeX7YKDc5aMDktRm0/0ZcJ
         jLgJ43yDibM9gTGVUMoxEsiEsYGjUC34LxQtK2obtRU6NmJ9PmAk1m/INh6KvoS5n8Rf
         JaBVXtW4TImywI8k4Af9A+6mhCwfqcHuXyDXNtMoak0wqdQ44UFyVsBtkP7Dc66AoX14
         a0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702572633; x=1703177433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GCp7oH/gOJp7J9eGa5Fv3Vw5adjzdlx0cxRf567SUHs=;
        b=Jk9Q9kL2B5We16yJdRVP9VXebod0hcyar3hHDFyZCY98DKlSYGFcaXHoFYUhvxT88x
         2X90h0iavICGHfTO80eCm0uBTJPaL6m3csS1felmkXg47+/SlE4Xvg1t/J1l39beWWpg
         rojL7fz8AOuJ4q8ZsH7A3ljHyJHov6TxpSY7bdstg//v+1xq2Xt3Nx0yqlYZ/RkyUFEJ
         fWovNlBX+1Wo550skXmbIduJ4VP2N9EU2fEjVbaF78wctB9Eo+K7q3I8ADAbiLsJlVxy
         SX3O1ldZ3KtJNKP1Lnq9wvmF0NYBci2fCBTpsDt5/uK7qV65J+5B/eRvMJMyOUSdrLfh
         tT5A==
X-Gm-Message-State: AOJu0YzaWP7usWMTmiWkaEffaMmJ2owHR9dnPZIWCLESfyF8soxcTXfC
	YNSBCCwQ8j/J9k4TWPl/ZwdbnLnc8cG9csPvu0Q=
X-Google-Smtp-Source: AGHT+IHrQv/zGVf9OaFxbpocOPZzcUmOj8Ved/+MSnhM0SJDoI50jIVku44SJoWKiweBXvQlPaNG5U0SeghbqBkrEJ0=
X-Received: by 2002:a25:55c2:0:b0:dbc:b6e0:e302 with SMTP id
 j185-20020a2555c2000000b00dbcb6e0e302mr2171816ybb.83.1702572632960; Thu, 14
 Dec 2023 08:50:32 -0800 (PST)
MIME-Version: 1.0
References: <20231213190528.3751583-1-tmaimon77@gmail.com> <20231213190528.3751583-4-tmaimon77@gmail.com>
 <cf3ce945-2f1c-4dae-86b8-349dae3d962b@app.fastmail.com> <CAP6Zq1inLOMHORqO8=RbP6NfwJ63kLaH0G3+TKBhfn0p2CE53w@mail.gmail.com>
 <88040035-d971-4012-bb9f-9f2ae91fdc6e@app.fastmail.com>
In-Reply-To: <88040035-d971-4012-bb9f-9f2ae91fdc6e@app.fastmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 14 Dec 2023 18:50:21 +0200
Message-ID: <CAP6Zq1iZbNnPuVnJW0=HhnOryrdZOcnNMK420H3X0KcA1k3-Uw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] soc: nuvoton: add NPCM BPC driver
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: pmenzel@molgen.mpg.de, Conor Dooley <conor+dt@kernel.org>, benjaminfair@google.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, tali.perry1@gmail.com, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Arnd,

Thanks for your suggestion.

Appreciate it if Joel, OpenBMC Linux kernel maintainer,  could share
his thoughts about it.


On Thu, 14 Dec 2023 at 17:49, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Dec 14, 2023, at 14:09, Tomer Maimon wrote:
> > On Thu, 14 Dec 2023 at 14:44, Arnd Bergmann <arnd@arndb.de> wrote:
> >> >
> >> > +config NPCM_BP
> >> > +     tristate "NPCM BIOS Post Code support"
> >> > +     depends on (ARCH_NPCM || COMPILE_TEST)
> >> > +     help
> >> > +       Provides NPCM driver to control the BIOS Post Code
> >> > +       interface which allows the BMC to monitor and save
> >> > +       the data written by the host to an arbitrary I/O port,
> >> > +       the BPC is connected to the host thourgh LPC or eSPI bus.
> >> > +
> >>
> >> This one in particular looks like this might be implemented
> >> by more than one BMC type, it's a fairly generic functionality.
> >>
> >> Have you talked to the other maintainers of SoCs used in
> >> OpenBMC about coming up with a common interface?
> > Yes, Both Nuvoton and Aspeed use the same user-facing code to manage
> > the host snooping.
> > https://github.com/openbmc/phosphor-host-postd
>
> Ok, that's good. I found the driver in drivers/soc/aspeed/aspeed-lpc-snoop.c
> now and see that the implementation looks very similar.
>
> I think we should do two things here:
>
>  - split out the common code into a shared module that exports the
>    symbols to be used by either one
>
>  - find a better place for both drivers outside of drivers/soc.
>    I would suggest drivers/misc/bmc/ but am open to other suggestions.
>
>       Arnd

Best regards,

Tomer
