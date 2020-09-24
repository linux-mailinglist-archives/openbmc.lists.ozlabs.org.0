Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CAA27659A
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 03:06:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxcLq0zwmzDqPj
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 11:06:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b43; helo=mail-yb1-xb43.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=d7pdEF4H; dkim-atps=neutral
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxcKy5XZszDqNr
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 11:05:40 +1000 (AEST)
Received: by mail-yb1-xb43.google.com with SMTP id s19so1108491ybc.5
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 18:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=JyYQ4yt0kpyVaHupVn4k5vxpvCyznNh3ZzdXJj5JxjA=;
 b=d7pdEF4Hbkgh7I/mqCcrBXVoap0eyMl9BsdcSb2grWV7VGEuYhcCpjCrgUqyU8zRTN
 6pYJfD/ywVQxKkPV90sOfRHekz6cbW4UIbruy0niDrCRgKei+n6LCNImJHSfbL/BadYD
 ZTLWV/Awq1SDKWVX+nDAcWhsgoFs5jp8BxvxeBeJcP98v+UwU9SKPYVH13xzatV9+QNy
 jAzJDShdYaQhjbce2JDN+1BNnIC/FkO8JF0HReQ0lfcxDUqRLaK1n/4VGn+f0iKe2nIW
 LO/s0WPsrW8TZrt+MQ41tVCmmqTThTTKJcSPTIyl24sBqGy3eAFMvzzPFGIeEssfsTJK
 P3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=JyYQ4yt0kpyVaHupVn4k5vxpvCyznNh3ZzdXJj5JxjA=;
 b=J77x8j7dcVv6Ka3OLNjKwpt/9hfatREI3fTbdwCh86UNPwDpA64K7hXTBaAB1pfLgu
 y6J9DtUA+HQvb2ex1uZQhSg9GJsTaWCEk0GEDU/NL8A3jECEuhcOi5z8tOsj4OYBm72f
 Ure8pDP2lKTFLX7C7SyS3u4vMzSWSoTwjAo962FnAGxRqO5HZ9fV5d+HMmR1dB8ik4RO
 3nSxQM2UYTMNV7Llnb95vdY0NLX+YD0IYoScRRHtsE5uPYm7j/rC6aRGijJ1sZ8TMRyq
 iEKChvjAQfXMAHyKQHpL8Nj4WbeMvtjHPayDkYr5dh8k3RjZCDGuTKpEC4zmsbyDFOSj
 vfJQ==
X-Gm-Message-State: AOAM531UZbp/18a9uUhYvcYNl69V4i+IwYDavgkB0UN7y30SkZJn5OFr
 UJKOwp8uqdjgCIIu1x3d0VHYsLK1ftv8f3tNpTJp+w==
X-Google-Smtp-Source: ABdhPJyq2pMNcfXzbrwJ3XjIDCr3z5tgXFTLbfcVKYj8LE+KJpq6f43MRH3jGk+wGoXCZHv4qgCYUzEagmR2mDeSm6o=
X-Received: by 2002:a25:aaf4:: with SMTP id t107mr3502728ybi.209.1600909536273; 
 Wed, 23 Sep 2020 18:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <CDC90A55-957D-47BB-9B42-4283BB6706AF@apple.com>
 <CACWQX831sTH1Mp5nZEo+_bs2pCgz9ovspXD9onqiHCgAs=vciw@mail.gmail.com>
In-Reply-To: <CACWQX831sTH1Mp5nZEo+_bs2pCgz9ovspXD9onqiHCgAs=vciw@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 23 Sep 2020 18:05:25 -0700
Message-ID: <CACWQX82SjPjhzqwM2jLi4aRnS8DPtPOtug1_wU8ok-vFN9VVEw@mail.gmail.com>
Subject: Re: Difficulty booting on Raspberry Pi 4.
To: Cheng Yang <cyang999@apple.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I hit reply instead of reply all earlier.  Apologies if you were just
confused.  The content of my reply is below.
-Ed

On Wed, Sep 23, 2020 at 3:43 PM Ed Tanous <ed@tanous.net> wrote:
>
> On Wed, Sep 23, 2020 at 3:35 PM Cheng Yang <cyang999@apple.com> wrote:
> >
> > Hi,  I=E2=80=99m openbmc noob here.
> >
> > I follow the instruction of https://github.com/openbmc/openbmc/blob/mas=
ter/meta-raspberrypi/README.md
> >
> > After 2.5 hours everything built, (I used either x86 ubuntu 18.04 or 20=
.04 same result)
> > However after I copied to the image to micro SD, raspberry Pi 4 won=E2=
=80=99t boot.
> > No video output, no serial output at all.  (The board works fine with u=
buntu 18.04.)
> >
> > Any tip/cheat sheet to get openbmc running on Raspberry Pi 4?
> >
> > The steps I did, anything I missed? Is the recipe correct?
> >
> > git clone the openbmc code.
> > source poky/oe-init-build-env rpi-build  <=3D=3D  yes I did this.
> > Add this layer to bblayers.conf and the dependencies above  <=3D=3D yes=
 I added /var/openbmc/openbmc/meta-raspberrypi (where I=E2=80=99m using /va=
r/openbmc as the source code dir.)
> > Set MACHINE in local.conf to one of the supported boards  <=3D=3D I add=
ed MACHINE ??=3D =E2=80=9Craspberrypi4=E2=80=9D (replacing the original qem=
u line)
> > bitbake core-image-base  <=3D=3D  went through, only 5 warnings, no err=
or, everything successful.
> > Use bmaptool to copy the generated .wic.bz2 file to the SD card  <=3D=
=3D with =E2=80=9Csudo ~/bmap-tools/bmaptool copy core-image-base-raspberry=
pi4.wic.bz2 /dev/sdc1=E2=80=9D no error copied successfully.
> > Boot your RPI  <=3D=3D  nothing happen, no VGA, can=E2=80=99t be ping=
=E2=80=99ed, no console serial output either (no uboot messages).
>
> So many people hit this;  I suspect we need to update the
> local.conf.sample file to do some things.
>
> The short version is, you're loading a binary (meant for a spi flash)
> image onto an SD card.  You need an SD image that the RPI boot loader
> can recognize.
>
> Add:
> IMAGE_FSTYPES=3D"rpi-sdimg"
> to your build/conf/local.conf image.  That should get you the correct
> image type.
>
> Side note: in the past I've hit an error about phosphor-gpio-keys.  If
> you do, you might need to add this as well.
> KERNEL_FEATURES_remove =3D "phosphor-gpio-keys"
>
> This should cause your build to generate a
> obmc-phosphor-image-raspberrypi4.rpi-sdimg file in your deploy
> directory.  Load that on your SDcard, and you should get a booting
> OpenBMC image.  I've never tried on an RPI4 yet, but those steps have
> worked on previous RPI variants.
>
> After that, if you could read the rules for contributing, and send up
> a patch to fix the local.conf.sample for our default RPI build, it
> would be appreciated.
>
> >
> >
> > Any tip/pointer will be greatly appreciated.
> >
> > Cheng
