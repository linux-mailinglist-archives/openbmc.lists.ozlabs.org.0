Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BBF4CBE37
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 13:55:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8WD73rptz3c31
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 23:55:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IKexSrjm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=tali.perry1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IKexSrjm; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8WCj31Mfz2x9R
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 23:54:40 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id c7so3751338qka.7
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 04:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gpvc/JncUD6k2jJA3rPe/Gzgk+Fq4UJfHnGecuBxreA=;
 b=IKexSrjmgJhU/WoXJKfWByEwrcXXCaNVPlDjEbMiSg0nxBodoBSBq20+tAwigK6+pC
 9Dp6cFBNY+QNtcPfFvnwju/gHjuFP+6ukcCnooqujSXxGAkBpnouqN1b+TQXjs+Yfi36
 WUWSGgNTjHRQiqueElBcOjkFqfNubmTwkDuIPRDKk65BJVYxujTBTUB/R9Yj71lu8EmR
 1Dh4K2vfrjlXP5q1NTc264erP0AEzWAhFK8isbrZAlyXsw11MyCLEOS2Xu/38VYki9dP
 VCdIcInwZgLBQFuPC8S/9sVzCg7bShQNrudP7qD0LkThcDgEkk0geVGMx22W9GCSObdd
 eVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gpvc/JncUD6k2jJA3rPe/Gzgk+Fq4UJfHnGecuBxreA=;
 b=lWHwnIJq116SoNbliyUm4Llxo4EjEWeKuKDpWrk2PrklHdpPjuLe5R/UE927224jri
 3dTgyC7CBkrstHWouKJqykzDiD+JqtzuhMTQn+ws9XOEq36oDTm300Skk3itX0SeqOeA
 o6S2ZYRCBoN7XxoTURgsLjnLl0VP6pXYmIw/4RLPq66txgGGJqAlY7o66jJWO/MQPKf6
 cWY8RUVXcJoYOO24Msawr//4BQhhAnsKMDlqpj5syJYZK3VMCrdbFvbiWob4TmiwOxRC
 meWHfrnxg4CWz2ONJMTNgcn7sPVXVZJ0S41I7mD7NFJkzbLywQ2JBWi9IyrdtO+nCnFg
 9j+A==
X-Gm-Message-State: AOAM532rYuiONDH/0AlGmzBydVCB2TEhmOkdoO7la/2HbfajsooHxute
 6wzTXRPd94r4jn8GZiXNN4WFlKEVRg9qh6lcKyE=
X-Google-Smtp-Source: ABdhPJya62aW6zfOJJA50kUityeXdjHGZGgzkLm44Teu6/f9/Pp5GGbIVsrZWAIDPZCmqYoXqiTzVJWyoZq7y7zgu3A=
X-Received: by 2002:a05:620a:11:b0:508:7199:40ef with SMTP id
 j17-20020a05620a001100b00508719940efmr18483948qki.62.1646312078413; Thu, 03
 Mar 2022 04:54:38 -0800 (PST)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-9-warp5tw@gmail.com>
 <YiCZlhJoXPLpQ6/D@smile.fi.intel.com>
In-Reply-To: <YiCZlhJoXPLpQ6/D@smile.fi.intel.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Thu, 3 Mar 2022 14:54:27 +0200
Message-ID: <CAHb3i=t+Ai3w5mMhmZxxMsD7Zv0xpM4ZicMCmdDMtVn_OMbWYA@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] i2c: npcm: Correct register access width
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 yangyicong@hisilicon.com, Linux I2C <linux-i2c@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 Rob Herring <robh+dt@kernel.org>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 Tyrone Ting <warp5tw@gmail.com>, semen.protsenko@linaro.org,
 jie.deng@intel.com, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
 Tali Perry <tali.perry@nuvoton.com>, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> On Thu, Mar 03, 2022 at 04:31:38PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Use ioread8 instead of ioread32 to access the SMBnCTL3 register since
> > the register is only 8-bit wide.
>
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
>
> No, this is bad commit message, since you have bitwise masks and there is
> nothing to fix from functional point of view. So, why is this a fix?
>

The next gen of this device is a 64 bit cpu.
The module is and was 8 bit.

The ioread32 that seemed to work smoothly on a 32 bit machine
was causing a panic on a 64 bit machine.
since the module is 8 bit we changed to ioread8.
This is working both for the 32 and 64 CPUs with no issue.


> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>
> This is wrong SoB chain.
>
> ...
>
> > -     return !!(I2CCTL3_SCL_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
> > +     return !!(I2CCTL3_SCL_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
>
> ...
>
> > -     return !!(I2CCTL3_SDA_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
> > +     return !!(I2CCTL3_SDA_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
>
> --
> With Best Regards,
> Andy Shevchenko

Thanks Andy,

BR,
Tali Perry
