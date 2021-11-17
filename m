Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF0C454F97
	for <lists+openbmc@lfdr.de>; Wed, 17 Nov 2021 22:50:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hvc751VDKz2yxx
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 08:50:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20210112.gappssmtp.com header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=FvGhRo2H;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20210112.gappssmtp.com
 header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=FvGhRo2H; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hvc6g29D3z2yMc
 for <openbmc@lists.ozlabs.org>; Thu, 18 Nov 2021 08:50:17 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id f18so15378289lfv.6
 for <openbmc@lists.ozlabs.org>; Wed, 17 Nov 2021 13:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9BgyzMcVBTK+nMiNv1GeYJBLPx6llPsjZ8+KtfIdSRg=;
 b=FvGhRo2HCyYWuKKQMDCZH7phoHg9Ny7GpZDHLKW3lsjBWj3tD0qxA9O7nvKtg1l8pD
 SM4LjUvIVYJ2bctHo+kSWd53EjVUWdNUjZx66nBy32Z6gXyiihLFNCapZeFEz4RV7kBh
 aTpYHN6eO88nQ4zEx7EtwqPbfSAtkyad1xzX3fGGVrXmrRQWMTF+4cBV5f9G/CyaRfK+
 +n34yhIaVtOhTJdSe5siJm8HdAUxw7+El2w7qQeuER7x3y+r9YM1fDjGBeVA0MdbqkJb
 fZCNw0aZOX5qOceo2W0Aim2Ev67rVO3vYOh8YfALacviZ8T3Uk+bdxY7P19GQbTMiAV8
 0YxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9BgyzMcVBTK+nMiNv1GeYJBLPx6llPsjZ8+KtfIdSRg=;
 b=CamFMqdZxHFzCZ3gn+VOx7fbV2VyidbqVc1fg4BfgCNZyp2Vjl36jz63JVRYFiUJ7r
 FoyUDbo6/yRwLfkLU0VTAtG52tzDrNGO7ESD/vBXJc0qKNW/+9i7i9rvsWdVhXKLKnJQ
 zIT2MueFWCCrupCSfrxkRM17LmA76e4tRiegPf2BQtDIjclBGGiJst2IuzDH9MFJaFq2
 1qErO3L+PzB7YyOJ0HL66LOxKe5fHl6G+Y01oFAolR1ezrAEnVUoCCrEv32ztmmb2a5+
 WTDC4Kg8uDR5uRfxzYfW/HdxkwRRmSlctaUOu3aAhq1HrA38CmLYAVM//26jbKfSWmBq
 F2Cg==
X-Gm-Message-State: AOAM533Gefada+nK3ppVqBVZp66ajGFUYRV+AccTFVgcHYZx3BTH+OI2
 s+dZe0Sumkf+aYboDdPje8VCacbcVL3ut3mpPOnmzOlqb2U2KA==
X-Google-Smtp-Source: ABdhPJwAGX2390D3AlrQJ8d4KXLB+BF2XqcKIYiE5U49YSjQmXaM/Ur4csoqOeTXo9GPLbeSc8ncOABnRoZSIQIjaDU=
X-Received: by 2002:a05:651c:17a6:: with SMTP id
 bn38mr11398992ljb.56.1637185810538; 
 Wed, 17 Nov 2021 13:50:10 -0800 (PST)
MIME-Version: 1.0
References: <CAD2FfiGpG_J5W8Ftdp5wE2wLB=7Tfmvfmivy0_4vW=D0fYdw3g@mail.gmail.com>
In-Reply-To: <CAD2FfiGpG_J5W8Ftdp5wE2wLB=7Tfmvfmivy0_4vW=D0fYdw3g@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 17 Nov 2021 13:49:59 -0800
Message-ID: <CACWQX80qoJ13v0gkFJBb6Tyi9wcvrS0-geDD1erbJzeynKnGZg@mail.gmail.com>
Subject: Re: Redfish implementation does not supply SoftwareId
To: hughsient@gmail.com
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Nov 11, 2021 at 6:18 AM Richard Hughes <hughsient@gmail.com> wrote:
>
> Hi all,
>
> My name is Richard Hughes and I'm the upstream maintainer of fwupd
> which is a linux program that allows flashing hardware. It's used by a
> few million people already and there's recently been a lot of interest
> about getting fwupd to run on the actual BMC chip, rather than on the
> host OS. That's not really what this email is about, but might explain
> the bigger picture. I'll come back to this in a few weeks time :)
>
> At the moment fwupd runs on the host OS and uses a plugin to
> communicate with various Redfish implementations, for example iDRAC
> for Dell or XClarity for Lenovo. Teddy Reed kindly donated (loaned?)
> me some hardware so I could test the fwupd plugin against the Redfish
> implementation of OpenBMC, more specifically git master on a
> evb-ast2500 board.
>
> With a small patch to fwupd (setting CURLOPT_SSL_VERIFYHOST=0) it
> seems to load and enumerate correctly, but doesn't add any devices.
> The reason I found was that the SoftwareId property is missing from
> the /redfish/v1/UpdateService/FirmwareInventory/7d021ade path. The
> SoftwareId is the "key" that maps the hardware to a specific firmware
> *stream*, so for instance it could be something like
> "USB\VID_17EF&PID_3083" for a peripheral or some other kind of
> vendor-specific string, e.g. "SAMSUNG MZVLB2T0HALB-000L7". The idea is
> that vendors then upload firmware to the LVFS website with a defined
> *stream* and updates get deployed onto matching hardware
> automatically. I'm not so sure that makes a huge amount of sense for
> the OpenBMC BMC image itself. Or maybe it does; getting new official
> OpenBMC images from the LVFS would be way cool, but I don't think we
> want to flash the entire MTD image. Anyway, I digress.
>
> I guess my question is if I could get a SoftwareId set for 7d021ade --
> e.g. "evb-ast2500" -- that at least allows the device to enumerate in
> fwupd and gives me something to test against. I guess my next question
> is how a OpenBMC distributor adds a new device into
> /redfish/v1/UpdateService/FirmwareInventory.Members -- and if there's
> a way to set SoftwareId for that new device too.

This seems like a reasonable thing to do.  We probably want to
namespace SoftwareId with OpenBMC-<machine name> just to make sure we
don't have the possibility of conflicting with the manufacturer
firmwares for these boards.  I'm not sure this information is
available on dbus today, so we'd need to get something that can
publish that to bmcweb, then get bmcweb to consume it to publish the
Redfish property.  Considering that we're very likely to be adding
updates of PSUs/drives/other components in the future, we'll likely
need a SoftwareId interface anyway.

If the above is something you're interested in tackling, you might
consider hopping on discord in the bmcweb-and-redfish channel to
hammer out the details if you're unsure;  These days it tends to get
faster responses to quick-turnaround support stuff.  If this isn't
something you're wanting to tackle, I think it's important enough that
I can add it to my plate, but my cup runneth over these days, so I'm
not sure when I can get there.

>
> Sorry if all these are newbie questions, and I appreciate any
> pointers; I'm happy to send patches. Thanks.
>
> Richard.
