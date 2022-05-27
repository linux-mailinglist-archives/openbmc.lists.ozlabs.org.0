Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23643535717
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 02:31:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8Qj90HzQz3bdY
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 10:31:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=crvQFxy2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e36; helo=mail-vs1-xe36.google.com; envelope-from=warp5tw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=crvQFxy2;
	dkim-atps=neutral
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8Qhk5rQGz307F
	for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 10:31:16 +1000 (AEST)
Received: by mail-vs1-xe36.google.com with SMTP id i186so2906145vsc.9
        for <openbmc@lists.ozlabs.org>; Thu, 26 May 2022 17:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bx0K5msFh3pNmzh8X+2nPnmbDmrzr93sWsFhFuKypb8=;
        b=crvQFxy2kETdBwme1u+UE2SJEU3y4X9qCP5+LitHocqZ0XGaNcg6o5EEXugaczwjLW
         +usd3vggxutmLaSOc7RLyOglDpt3IpzRxkfM4UbU1i2LU8mz9iLFMHpVLI+/9t63pd3v
         4WiJ7YRnmhS7lg9EO2OiEcK2C29rAvUbwETU91nOQ6d5xDqHEdYYhJYgcyimUmY0LMFJ
         XuHIHlGE8+mjOFS9xnDI6xQF6kR8eHxHSjkdn2Ob0UF/m3xMCplPMyOdj02nJk1G/eV4
         u1G9SltfMDPNkY+RgnvfGDUJRWbY0Qu5N7vdFyudAkVwS7JxGBYRK0oqZwIdQ/w+LeEi
         rCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bx0K5msFh3pNmzh8X+2nPnmbDmrzr93sWsFhFuKypb8=;
        b=GV0Erk/ePr6987CwNLoeHqofy7g5amROwdaliF4swXj/bdVDklpQVvJyuZh3yJeBZm
         fiCzeFpoZDpyGN3jVpFDYUgcJSOoVh9kCNkMLTeKsagqpRpcMzeQu1AUjijhCc1t0ub+
         N+TKz8eOtqszyULMpSBsAWqbYcqpHNT0FLJK8C8HlsBpCHeeOE3Ir6brT56+NOBuZC3+
         QRzP78JYJ+hgMzCiF3m4I0f07S0B3nXXzygFEBqC+8NfpDOAJWmnT+0bFTPTC2tjFv9x
         RrQgZq7rJKQL9bHGoF0mRihTAexrGQFzexFmqwfedsvqS+efdkWArpHWF8Q5VKsDtIkb
         SgLg==
X-Gm-Message-State: AOAM530243Tsf+y6h8mukmKCj6JMvHZrrgp2yUtieGoaYfB3Rnmxeh68
	sD9dWybd46+BalthffRwFz+TeCnijlgtOK/BGQ==
X-Google-Smtp-Source: ABdhPJxrv6RK04WOkAO9q9nyChrsL5sj/q/zMxHju9rv19w0OEl+GqzkgGRkR3ymujYxGl7/0mc9r5puVDakCE4dApA=
X-Received: by 2002:a67:1787:0:b0:337:d8cd:35b2 with SMTP id
 129-20020a671787000000b00337d8cd35b2mr6646742vsx.29.1653611472541; Thu, 26
 May 2022 17:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220525032341.3182-1-warp5tw@gmail.com> <Yo5ijJ9mqXRNB7d8@smile.fi.intel.com>
In-Reply-To: <Yo5ijJ9mqXRNB7d8@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 27 May 2022 08:31:01 +0800
Message-ID: <CACD3sJbGxJMks02qB2uWTivtMvBFhxe9Chq4B4Wyk1UtmqnTUg@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] i2c: npcm: Bug fixes timeout, spurious interrupts
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com, jsd@semihalf.com, krzysztof.kozlowski+dt@linaro.org, benjaminfair@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, arnd@arndb.de, sven@svenpeter.dev, robh+dt@kernel.org, Avi.Fishman@nuvoton.com, semen.protsenko@linaro.org, avifishman70@gmail.com, venture@google.com, linux-kernel@vger.kernel.org, wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com, jarkko.nikula@linux.intel.com, olof@lixom.net, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy:

Thank you for your review.

Much appreciated.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2022=E5=B9=B4=
5=E6=9C=8826=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=881:32=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Wed, May 25, 2022 at 11:23:36AM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > This patchset includes the following fixes:
> >
> > - Add dt-bindings description for NPCM845.
> > - Bug fix for timeout calculation.
> > - Better handling of spurious interrupts.
> > - Fix for event type in slave mode.
> > - Removal of own slave addresses [2:10].
> > - Support for next gen BMC (NPCM845).
> >
> > The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.
>
> LGTM,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> > Addressed comments from:
> >  - Wolfram Sang : https://lkml.org/lkml/2022/5/21/51
> >
> > Changes since version 5:
> >  - Shorten npcm_i2caddr array since the number of supported i2c slave
> >    addresses is reduced.
> >  - Create a new patch from the original PATCH v5 08/10 to modify the sl=
ave
> >    transaction logic.
> >
> > Changes since version 4:
> >  - Remove quotes around ref handle to nuvoton,sys-mgr in i2c binding
> >    document.
> >  - Keep the "longer line first" order.
> >  - Correct the SoB chain.
> >  - Modify the if statement in one line and add new line characters.
> >  - Modify the commit message format in the patch Remove own slave
> >    addresses 2:10. Correct the if statement in one line and shorten the
> >    debug messages.
> >  - Create a new patch to capitalize the one-line comment in the driver.
> >
> > Changes since version 3:
> >  - Correct the const format in if condition in i2c binding document.
> >  - Add the oops message statement and register information in register
> >    access width patch.
> >  - Add the occurring rate of the i2c spurious interrupt issue and more
> >    details in driver's behavior to overcome this issue.
> >  - Address Andy's comments in the patch to support NPCM845.
> >
> > Changes since version 2:
> >  - Keep old code as fallback, if getting nuvoton,sys-mgr property fails=
.
> >  - Fix the error reported by running 'make DT_CHECKER_FLAGS=3D-m
> >    dt_binding_check'.
> >  - Make nuvoton,sys-mgr required for nuvoton,npcm845-i2c.
> >  - Correct the patch's subject about changing the way of getting GCR
> >    regmap and add the description about keeping old code as fallback
> >    if getting nuvoton,sys-mgr property fails.
> >  - Correct the patch title and description about removing the unused
> >    variable clk_regmap.
> >  - Use the data field directly instead of the macros since macros are
> >    not constants anymore in this patch.
> >
> > Changes since version 1:
> >  - Add nuvoton,sys-mgr property in NPCM devicetree.
> >  - Describe the commit message in imperative mood.
> >  - Modify the description in i2c binding document to cover NPCM series.
> >  - Add new property in i2c binding document.
> >  - Create a new patch for client address calculation.
> >  - Create a new patch for updating gcr property name.
> >  - Create a new patch for removing unused clock node.
> >  - Explain EOB in the commit description.
> >  - Create a new patch for correcting NPCM register access width.
> >  - Remove some comment since the corresponding logic no longer exists.
> >  - Remove fixes tag while the patch adds an additional feature.
> >  - Use devicetree data field to support NPCM845.
> >
> > Tali Perry (2):
> >   i2c: npcm: Remove own slave addresses 2:10
> >   i2c: npcm: Correct slave role behavior
> >
> > Tyrone Ting (3):
> >   dt-bindings: i2c: npcm: support NPCM845
> >   i2c: npcm: Support NPCM845
> >   i2c: npcm: Capitalize the one-line comment
> >
> >  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     |  25 ++-
> >  drivers/i2c/busses/Kconfig                    |   8 +-
> >  drivers/i2c/busses/Makefile                   |   2 +-
> >  drivers/i2c/busses/i2c-npcm7xx.c              | 176 ++++++++++--------
> >  4 files changed, 124 insertions(+), 87 deletions(-)
> >
> > --
> > 2.17.1
> >
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Best Regards,
Tyrone
