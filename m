Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27050522BCE
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 07:38:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KykGM6lpGz3c80
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 15:38:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iSXjFtVd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e34;
 helo=mail-vs1-xe34.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=iSXjFtVd; dkim-atps=neutral
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KykFz61yxz3bd4
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 15:37:58 +1000 (AEST)
Received: by mail-vs1-xe34.google.com with SMTP id q2so897712vsr.5
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 22:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=99+74zi/ugqpPP/H1BYx5mgxsw+MDJDahwiZMO6/fXg=;
 b=iSXjFtVdoulAW6NWsq1PlmfC+Qc6T0H6RCPJgN+0OIjZRODULDLwlVSQfCwx2mvpu4
 LeRNFlmImRZYhJo2Gipt91G9tXQlMJR6esNrSwjqvBDd218CuRg2Ct7WOxdYUoxA3dcy
 mma0bmpQdUAuxDWaBP4/vx2EshnDFGylyHaeVxK5KWWuW4mZpSOOy0Ogmyd1JaSkxuQg
 unlANkeTyEalXxWZMCJnsK2WG+XLkJJnMllmD17jQf2zbwj1Yl6Hn4s8ySOGuNUBoc3i
 si4s7/48IlQJ+tsGWUao50RjPAMdunVkiXKe6wmV9pUS/if4BYYIxycPZe5AqxByEjUE
 b69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=99+74zi/ugqpPP/H1BYx5mgxsw+MDJDahwiZMO6/fXg=;
 b=5r/tQGQCnUdFnE/TWUeD44N+aq0smFOqmV1hNlvq7ba3J+XJfErQau26dueYGVXOtm
 cMLn5u/rUmPqN1vZdjHwI4dHOsiz44zZ20RP9EY0z44EV4my68EX5c+VehlgyKc/IwbW
 uTf8lKLf2+8yFMqAjQPr5aJ78Iire3Ef0TidjdJw9/34SSRSGBi7wr624XR3SPTiERBQ
 dS2H9zyM5/QsWauzsAnK4nYaEUQ33mvAZAOWoK9hj5ThN9bzVI1Ghv4t75XIxLOUJRn5
 OHeL47DSakTkATM7PDF6gJrP7+EtLmM2SDK6VWzzepi4/1E5FMe3nBxAXqD7ZGzrSKTS
 Gg3w==
X-Gm-Message-State: AOAM532HnNKLXPwOKaJhXY/JFJt0lPw3OPf55P9z7+/B+53O5GvDO5Kw
 rN4NgcIyyqHId+bDIE3VNgbv66zCZUEJ/IKdzw==
X-Google-Smtp-Source: ABdhPJzGI4xLPZN4cIpW61gkAg41dLMEipuG1mmnFJBEpFDmP97YmzjtAqLMeg6hmzlp8t4UkpaMK8VUfoOjgxnHaNs=
X-Received: by 2002:a67:b60b:0:b0:32c:e69e:15b3 with SMTP id
 d11-20020a67b60b000000b0032ce69e15b3mr13088417vsm.2.1652247475469; Tue, 10
 May 2022 22:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220510091654.8498-1-warp5tw@gmail.com>
 <20220510091654.8498-8-warp5tw@gmail.com>
 <Yno7IaBNnR5U2GuF@smile.fi.intel.com>
In-Reply-To: <Yno7IaBNnR5U2GuF@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Wed, 11 May 2022 13:37:43 +0800
Message-ID: <CACD3sJYPrQoWzOkOKM5tWuTWS0uEertBSrwMa5QmX0cMAPF4EQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/9] i2c: npcm: Handle spurious interrupts
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 jsd@semihalf.com, krzysztof.kozlowski+dt@linaro.org, benjaminfair@google.com,
 openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, arnd@arndb.de, sven@svenpeter.dev,
 robh+dt@kernel.org, Avi.Fishman@nuvoton.com, semen.protsenko@linaro.org,
 avifishman70@gmail.com, venture@google.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com,
 jarkko.nikula@linux.intel.com, olof@lixom.net, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy:

Thank you for your comments and they will be addressed.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2022=E5=B9=B4=
5=E6=9C=8810=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:15=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Tue, May 10, 2022 at 05:16:52PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > On some platforms in rare cases (1 to 100,000 transactions),
> > the i2c gets a spurious interrupt which means that we enter an interrup=
t
> > but in the interrupt handler we don't find any status bit that points t=
o
> > the reason we got this interrupt.
> >
> > This may be a case of a rare HW issue or signal integrity issue that is
> > still under investigation.
> >
> > In order to overcome this we are doing the following:
> > 1. Disable incoming interrupts in master mode only when slave mode is n=
ot
> >    enabled.
> > 2. Clear end of busy (EOB) after every interrupt.
> > 3. Clear other status bits (just in case since we found them cleared)
> > 4. Return correct status during the interrupt that will finish the
> >    transaction.
> >
> > On next xmit transaction if the bus is still busy the master will issue=
 a
> > recovery process before issuing the new transaction.
>
> ...
>
> > +     /* clear status bits for spurious interrupts */
>
> Clear
>
> ...
>
> > +     /*
> > +      * if irq is not one of the above, make sure EOB is disabled and =
all
>
> If
>
> > +      * status bits are cleared.
> > +      */
>
> ...
>
> > +             /* verify no status bits are still set after bus is relea=
sed */
>
> Verify
>
> ...
>
> > +     /* check HW is OK: SDA and SCL should be high at this point. */
>
> Check
>
> ...
>
> > +     if ((npcm_i2c_get_SDA(&bus->adap) =3D=3D 0) ||
> > +         (npcm_i2c_get_SCL(&bus->adap) =3D=3D 0)) {
>
> This fits one line
>
> > +             dev_err(bus->dev, "I2C%d init fail: lines are low", bus->=
num);
> > +             dev_err(bus->dev, "SDA=3D%d SCL=3D%d", npcm_i2c_get_SDA(&=
bus->adap),
> > +                     npcm_i2c_get_SCL(&bus->adap));
>
> No '\n' at the end of each?!
>
> > +             return -ENXIO;
> > +     }
>
> ...
>
> > +     /* clear status bits for spurious interrupts */
>
> Clear
>
> ...
>
> > +     /* after any xfer, successful or not, stall and EOB must be disab=
led */
>
> After
>
> ...
>
> Maybe you chose the small letter for one-liner comments, but I see even i=
n the
> original code the inconsistent style. Please, add an explanation to the c=
over
> letter and follow it, assuming you add the patch at the end of the series=
 that
> makes comment style consistent (for the one-liners, for the multi-line co=
mments
> we have a clear understanding about the style).
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Best Regards,
Tyrone
