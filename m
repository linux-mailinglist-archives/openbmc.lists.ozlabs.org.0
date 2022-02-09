Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 254A64AFE1F
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 21:20:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvB8T5TVRz3bZG
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 07:20:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=STSKjTPi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::334;
 helo=mail-wm1-x334.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=STSKjTPi; dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvB84040dz30jV
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 07:20:17 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id k41so1028190wms.0
 for <openbmc@lists.ozlabs.org>; Wed, 09 Feb 2022 12:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OAUA6GCseXIZWz/fecm8viBx6Uye9Mv4PSOm3883gdg=;
 b=STSKjTPi4Hrnlm7Z7MUzrmVETCchS90my1L/8Ctv4UdVnzcNPD/FQUa8xJNpRit7Dw
 Fa5s/QRB84Kpm0YrPZhOK5mKWY4lVKEViV0YAukUsQPAJG2ujdkMi2si2HHSVmNxFTf7
 sB11YquiuldcMr8EM2PEWy3XD5+M01ghGA+IyfgjZjd0T9H2WWcTRyj+4hSMbMvKhmxJ
 +mByypuQ+VkwPY/o0k4SB3nKsmhhJj5tnAxTGYUahHcjWjPx5/uhWn4c2cfoypzBSJGp
 hW6EnsYncAkUEbXT6+CBNflbTQr7sxEtvCGV6w8hnUA3Px/Q+VrNNQnLYHjSb8Y+s9o3
 f5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OAUA6GCseXIZWz/fecm8viBx6Uye9Mv4PSOm3883gdg=;
 b=Q99UsaTLrMbDBHRwBxPnbGTn89wLN1ZofUGBVBR1DIDSa6O15d+Z5Z4rVfdBkgWZZv
 jOvL9LofmQFyC81re7fwbLDQUbcA6L8koU76Iq/EelAi0nXzCOtZHJMt5+hIvATVN6bc
 2pTOhi6FDLrI2BEbMsc5UuoDqvxWoB58pm5PcI0mK/2Tr8Ql+hvduCXiuGxFgFJztRRw
 12TE90rF6HxVInsSA4u0c9CC9lJzBx9hkGsabBn3GJ3R7tu4Mnzl1tuMSJcs19tLypqI
 uOIk5mDRlyxcOCKdKo3ZSeF18LZLe+rvep9wl3Ka2BM/Kf/0OYH6pAyXhUs7zRBVLz/W
 90DQ==
X-Gm-Message-State: AOAM533OFRjj8/vbT2n1gzdYgrEH6TQ7RmZ7MDHDh4OaJ9qwdm/lRqtW
 T4B+HCx/4AeMPZ9HQua435HFLlmwNr+kmSFVkI4KEQ==
X-Google-Smtp-Source: ABdhPJzFS/j8Hu8exOJKE+L++l4wVQcpxLo8nWEJT7gTWNdA/ZbMD9pa0QW15ukuAFKLSrXUe484TY3hON9tgjrgaLc=
X-Received: by 2002:a05:600c:1da4:: with SMTP id
 p36mr4108392wms.98.1644438012240; 
 Wed, 09 Feb 2022 12:20:12 -0800 (PST)
MIME-Version: 1.0
References: <CAD1rtg8sa2OG4jUL8x7Gr9ExzH-tEswhHwSDaZtWhcAN4sAvuw@mail.gmail.com>
 <YgIXodbEP9hmae6Q@heinlein>
 <CAD1rtg-tTrbjiL76NRDGnAfx36JBM4Rcb2gyUYjROR-2=H+Uqg@mail.gmail.com>
 <YgQcaInEBq8ZBlIm@heinlein>
In-Reply-To: <YgQcaInEBq8ZBlIm@heinlein>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 9 Feb 2022 12:20:00 -0800
Message-ID: <CAH2-KxAyXn3YndZY_aWAMt4M6eTMrkPA91vCPeOj0tZOgPv-vA@mail.gmail.com>
Subject: Re: Propose a new application for reading DIMM SPD directly
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: openbmc@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>,
 Michael Shen <gpgpgp@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 9, 2022 at 11:56 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Tue, Feb 08, 2022 at 04:23:12PM +0800, Michael Shen wrote:
> > On Tue, Feb 8, 2022 at 3:11 PM Patrick Williams <patrick@stwcx.xyz> wrote:
> > > On Tue, Feb 08, 2022 at 01:10:37PM +0800, Michael Shen wrote:
> > > > If I understand correctly, the main method for obtaining the SPD
> > > > information in openbmc is from SMBIOS which is prepared by BIOS. And
> > > > We are exploring another way that excludes the involvement of BIOS.
> > >
> > > Unless you're proposing that the BIOS itself comes to the BMC to get the SPD
> > > data, I'm somewhat surprised you could come up with a hardware design to make
> > > this work.  Due to the number of DIMM channels and the limited number of CS pins
> > > on JEDEC DIMMs, you're going to have muxes on the bus somewhere.  Mixing muxes
> > > and multi-master access is pretty problematic.
> >
> > Yes, we need an additional MUX for switching the master(between BIOS or BMC).
> > However, compared to the single-master(BIOS only) design, this MUX is
> > the only hardware difference.

The other thing to recognize is that in these systems, the bmc
controls the CPU init state machine, so in practice, the BMC can
generally read the JEDEC eeproms long before the host would even want
to access them, and can hold off the host until the read is complete,
which mostly renders this race condition moot (daemon crashes might
still have problems.)

> >
> > > Either the BIOS and BMC are
> > > fighting over the mux, which is going to mess with the mux driver's view of the
> > > world, or you've got one mux for each in which case you're switching masters
> > > onto a bus, which violates a few i2c design rules.
> >
> > BIOS owns the MUX select pin and it can decide who owns the SPD(I2C/I3C) bus.
> > From my understanding, BIOS only needs to read SPD during the POST stage.
> > For the rest of time, BIOS will hand over the SPD bus to BMC.
>
> That seems like it might work.  You'll have to deal with the time when the BIOS
> has the mux in the BMC code somehow.  Ideally I'd ask for the mux select to also
> be fed to the BMC as an input GPIO so that you can differentiate between "we
> don't own the mux" and "all the devices are NAKing us".

This seems like a nitty gritty design detail that's best handled in
code when we review it.  I think the important bit here is that there
are paths where this could work without a significant design issue.

>
> > > You should take a look at what is already existing in fru-device (part of
> > > entity-manager repository).  This is already doing this for IPMI-format EEPROM
> > > data.  We should be able to replicate/enhance this code, in the same repository,
> > > to handle SPD format.
> >
> > I am not sure if it's a good idea to put it into the entity-manager
> > repo. As you said EM
> > is designed for IPMI-format EEPROM. Adding another parser into that
> > repo may violate
> > EM's design.
>
> I'm not sure why it would be an issue.  Hopefully one of the maintainers of that
> repo can weigh in.  I wouldn't expect "parsing only IPMI-format EEPROMs" is a
> design but just the current state of implementation.

So long as it can function properly in its current design, i have no
problem with FruDevice adding more parsing types.  In fact, there's
already patchsets out to add Linkedins proprietary fru type to
FruDevice, so in terms of design, Patricks request seems reasonable.



>
> --
> Patrick Williams
