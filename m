Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD50A792FC
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 20:25:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y7Qc039GzDqQG
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 04:25:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="DM0+TnvF"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y7Py3d4czDqNy
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 04:24:37 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id i10so8840492iol.13
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 11:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k3NFR1moC3/CtBkfpXfYuFbBp8YjLOLhTIVZ/LJ648E=;
 b=DM0+TnvFl8Fyggx2A8arZCstubQw6EKwtlh/53o2mdouh4enn4wWEubKSR5RiUl2k7
 BIPxs9tgXYY1kDxaWUdflFmGQuP7a1f1Wab6Sp7u69WRcFutNray7FwdTwniyVLZCjQi
 gCjmhcN5dMjZJNZxfffxl0qKXRUBOJsWJ2WI57puq59hkpIGe1qymbrL5EFcmTZ67MyG
 stx5z1/wNSi0lKeZbjh10gtJG0vx2Cd/XCIL348qPzEImAAV5WNwOzk4oM1xh8iNYNZu
 dGvjZ59stfpp3z06XJjeutX6z/aLE+pCsV3/CXLWx4c9r0qKfODniNS38jEphTVThgyP
 7MIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k3NFR1moC3/CtBkfpXfYuFbBp8YjLOLhTIVZ/LJ648E=;
 b=VoV5NIVQMEMq4l3aCVVQplHEhwHwSXArmtd5GKAlVach3Jdvp5DdyIIwLW52cQvt+I
 Rw0bZzeI1jzjdrE2aPAxMoBmm033xl1LL4UNaVOC43aHPrWePq87bNyJtjIfsSBwGz8l
 TwIDYa2U+imkAX5eHUxncBifr0zQMPhfQYB2hdR23NDQ1YYKUC59dmsbWgll2gpaixlD
 egirF8l24LfahR/4lHzaWbSNX3OXUIjn4rNklLOcXe7XlEM1i4Ur9yaGFKEuVXuKJurG
 5Kp8wP5GlEBeneEIH4KjdjQBZESk5cksRgI7RJzO3Of/dsoX37ri8tIB8HFGrpRvpPu+
 jEHA==
X-Gm-Message-State: APjAAAVCmD5JzPm/RPzhFzJ9Es/+qRozqvBlXvK9/raIOsn+xoCt6EAY
 L0BSpgMKLKYwXc3Gnb15ZYxLMwut+cYRz8C7S29KdA==
X-Google-Smtp-Source: APXvYqyt2wNaVottMFMi770rtqId1tUsaPiWG1daUpVokv2Koe7a9+L4Qib23pqRJbt9OD6GcwAKnKhV2QCLhrGGIKY=
X-Received: by 2002:a5d:91d7:: with SMTP id
 k23mr100083385ior.163.1564424673884; 
 Mon, 29 Jul 2019 11:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwJd4QkJVP2qRiB56DWf+D=qs6S9cMCcfiywpOJZO03mA@mail.gmail.com>
 <b5f26e39-965d-4c64-bd51-5e83b86a12d4@linux.intel.com>
 <CAO=notwboY-awYHPxq4JqLoNMDfhr+xHZaPiRdO=vnFiat75KA@mail.gmail.com>
In-Reply-To: <CAO=notwboY-awYHPxq4JqLoNMDfhr+xHZaPiRdO=vnFiat75KA@mail.gmail.com>
From: Kun Yi <kunyi@google.com>
Date: Mon, 29 Jul 2019 11:24:07 -0700
Message-ID: <CAGMNF6Uiox_ajU29TGxM4wtuO4rOgKzQZ-=m6e=t9HXNTbQH2g@mail.gmail.com>
Subject: Re: Limitations of entity-manager:FruDevice
To: Patrick Venture <venture@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>, "Tanous, Ed" <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 29, 2019 at 10:22 AM Patrick Venture <venture@google.com> wrote:
>
> On Mon, Jul 29, 2019 at 10:05 AM James Feist
> <james.feist@linux.intel.com> wrote:
> >
> > On 7/29/19 9:11 AM, Patrick Venture wrote:
> > > Hi;
> > >
> > > I don't know much about FRUs.  However, I know that for some eeproms
> > > on the device-tree for my platform, the default eeprom driver instance
> > > isn't correct and I need to explicitly use 24c64.
> > >
> > > root@semitruck:~# echo "eeprom 0x50" > /sys/bus/i2c/devices/i2c-14/new_device
> > > i2c i2c-14: new_device: Instantiated device eeprom at 0x50
> > > root@semitruck:~#
> > > root@semitruck:~# ls -l /sys/bus/i2c/devices/14-0050/
> > > -r--r--r--    1 root     root          4096 Jul 29 15:20 modalias
> > > -r--r--r--    1 root     root          4096 Jul 29 15:20 name
> > > drwxr-xr-x    2 root     root             0 Jul 29 15:20 power
> > > lrwxrwxrwx    1 root     root             0 Jul 29 15:20 subsystem ->
> > > ../../../../../../../bus/i2c
> > > -rw-r--r--    1 root     root          4096 Jul 29 15:20 uevent
> > >
> > > root@semitruck:~# echo "24c64 0x50" > /sys/bus/i2c/devices/i2c-14/new_device
> > > at24 14-0050: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
> > > i2c i2c-14: new_device: Instantiated device 24c64 at 0x50
> > > root@semitruck:~# ls -l /sys/bus/i2c/devices/14-0050/
> > > drwxr-xr-x    3 root     root             0 Jul 29 15:46 14-00500
> > > lrwxrwxrwx    1 root     root             0 Jul 29 15:46 driver ->
> > > ../../../../../../../bus/i2c/drivers/at24
> > > -rw-------    1 root     root          8192 Jul 29 15:46 eeprom
> > > -r--r--r--    1 root     root          4096 Jul 29 15:46 modalias
> > > -r--r--r--    1 root     root          4096 Jul 29 15:46 name
> > > drwxr-xr-x    2 root     root             0 Jul 29 15:46 power
> > > lrwxrwxrwx    1 root     root             0 Jul 29 15:46 subsystem ->
> > > ../../../../../../../bus/i2c
> > > -rw-r--r--    1 root     root          4096 Jul 29 15:46 uevent
> > >
> > > For entity-manager, I can add the type and it'll do the right thing.
> > > However, when FruDevice runs first and populates the FRUs, it doesn't
> > > seem to detect the difference in the eeproms.  I don't know enough (as
> > > previously stated) to jump into fixing this, so I wanted to check if
> > > this was a known limitation (presumably) and whether there was a plan
> > > to fix it?
> >
> > FruDevice basically does a i2cdetect, i2cdump, then reads the fru data
> > and sees if it looks like a fru. Do i2cdetect and i2cdump work with this
> > eeprom?

I have some questions regarding this approach:
1. How do you specify the 'pagesize' property? (or is it meant to be
implemented as a read-only eeprom afterall?)

2. Could it be implemented as a map of specified devices to the kernel
device name to load?

> >
> > I know for 16 bit eeproms, that it doesn't work correctly, as in this
> > thread:
> > https://lists.ozlabs.org/pipermail/openbmc/2019-July/017134.html
> >
> > There's also a issue: https://github.com/openbmc/entity-manager/issues/1
> > with a link to using device tree.
> >
> > I don't have any of these eeproms available to try that don't work, I
> > can't comment on others attempts to get them going.
>
> Ok, I'll take a look when I get a little further into this.  Currently
> it's adding an eeprom as /_0 in the device-tree.  So, I have a hunch
> it's related.
>
> Patrick
>
> >
> > -James
> >
> > >
> > > Patrick
> > >



-- 
Regards,
Kun
