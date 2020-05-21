Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ACF1DD8A1
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 22:47:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ShW737Y6zDqt3
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 06:46:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=tali.perry1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=H+JXV4Ix; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ShV40NlZzDqvR
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 06:46:03 +1000 (AEST)
Received: by mail-lj1-x244.google.com with SMTP id k5so9960884lji.11
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 13:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uTez8kuMY3TP5XsYIYA67o+sB7pgMVGNezpgMi033kI=;
 b=H+JXV4Ixd6t9+mkrG0yCupqx+KR1gWYSFhjUFNvuKf/wkH+6khAb6xrNdNuhnj5QXk
 X9Zm/XBFtHdUmbOmELCzPYWUI20raJQz8yo3cgVLs+6gTwPtuh8rC1gYYGkCbnqSNjvq
 FKGXIEO5+WlXbr7mDxvQKahVXYOykev04GbpMcOK1//pegIotbHdVOPnPDPIJ+Q43i6K
 3+NZEH8E0T8oCXk2yB8v8jPjAMrOmL2FB26EvDJqRacwpz+Z7L0QhWMjWRU49U1stx1e
 bMHNCva0IhTKMKVUOvjV7rocF8mJaazH7yMc0h8TI32bZRcJb4uVXDKLZ1SioqjCAY/x
 pe+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uTez8kuMY3TP5XsYIYA67o+sB7pgMVGNezpgMi033kI=;
 b=mc/kLs7zvxfq0OzuhJEMuYnj8uQwZK9BE75Gv3Rz2Gs6r+Jw5HNJfGlZYZxUjCfNKR
 NMsA1QYohwfm1Nj2wsy6zTE6S7YuwIJBG6qXR0Fduz3QrXojiCZcSovtP23BejEPSwoR
 ExYU2xNwgAuf2fxyUNlZwBQuobrqXa4Awu9fUR0n34AEd0cNFCnWHa248/fpsEJWIMNA
 j7I06579GYclXtV0JMJYgqTEuYgjHdBwjKv0lmC996jsiWC0kAo0TTHWoiQC/GPL8aso
 Lx+gluDla7ylTfHWqyU9/zPbSYIhqf4edqb6irSLlMOnR3gK6S0OjuR4tJ27OZefCNFH
 m2Sg==
X-Gm-Message-State: AOAM530ktG49K8kCRmSPoQLTF8ulQWBGZgIBGCyLaodgAn52rzNF9DY6
 kvJij6KzXzU/WWyICjI1oK9iKqTIQuoEqL5N5o4=
X-Google-Smtp-Source: ABdhPJxzQSWFIUeHpddcteib1fh2PMeMjFE+FkunevVip9n2ACN30aLCRo7QK85YpmYxoO6chpiGZFOVh0YMQSAjPsg=
X-Received: by 2002:a05:651c:87:: with SMTP id 7mr5990758ljq.2.1590093958157; 
 Thu, 21 May 2020 13:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200521110910.45518-1-tali.perry1@gmail.com>
 <20200521110910.45518-3-tali.perry1@gmail.com>
 <20200521142340.GM1634618@smile.fi.intel.com> <20200521143100.GA16812@ninjato>
 <CAHb3i=vcVLWHjdiJoNZQrwJCqzszpOL7e9SAjqObsZCRH4ifwg@mail.gmail.com>
 <20200521145347.GO1634618@smile.fi.intel.com> <20200521203758.GA20150@ninjato>
In-Reply-To: <20200521203758.GA20150@ninjato>
From: Tali Perry <tali.perry1@gmail.com>
Date: Thu, 21 May 2020 23:47:18 +0300
Message-ID: <CAHb3i=tF2YF3LbbWRK9buObU-LjWGhxKCwvj2Jtn=VH1p+zDJg@mail.gmail.com>
Subject: Re: [PATCH v12 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
To: Wolfram Sang <wsa@the-dreams.de>
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
Cc: devicetree <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 avifishman70@gmail.com, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>, Ofer Yehielli <ofery@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kfting@nuvoton.com,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 21, 2020 at 11:37 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
>
> > > > I wondered also about DEBUG_FS entries. I can see their value when
> > > > developing the driver. But since this is done now, do they really h=
elp a
> > > > user to debug a difficult case? I am not sure, and then I wonder if=
 we
> > > > should have that code in upstream. I am open for discussion, though=
.
> > >
> > > The user wanted to have health monitor implemented on top of the driv=
er.
> > > The user has 16 channels connected the multiple devices. All are oper=
ated
> > > using various daemons in the system. Sometimes the slave devices are =
power down.
> > > Therefor the user wanted to track the health status of the devices.
> >
> > Ah, then there are these options I have in mind (Wolfram, FYI as well!)=
:
> > 1) push with debugfs as a temporary solution and convert to devlink hea=
lth protocol [1];
> > 2) drop it and develop devlink_health solution;
> > 3) push debugfs and wait if I=C2=B2C will gain devlink health support
>
> No need for 2). We can push it now and convert it later. That being
> said, I wonder if [1] is suitable for this driver? Things like NACKs and
> timeouts happen regularly on an I2C bus and are not a state of bad
> health.
>

Agree, having a timeout every now and then is not an issue. The user
is interested
in cases when the number of timeouts\BER\nack\recovery are high.
