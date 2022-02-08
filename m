Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3B04AD334
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 09:24:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtGJJ6zzBz3bSk
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 19:24:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=m69n7m4H;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=gpgpgp@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=m69n7m4H; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtGHt3mSZz2xKJ
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 19:23:52 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id u12so6124744plq.10
 for <openbmc@lists.ozlabs.org>; Tue, 08 Feb 2022 00:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JZasnJBXyqpVqWDb+ONSG6KTTnxIxMMskAmzRNPMCh4=;
 b=m69n7m4HeSNpBvg3y5bZ9nLrXoa0jnaRQEeb5QlkijGMGGJtsezoIc/REC9AifxlQO
 bp2lfKBetYSEg+JMsWsceI48+1Lhe/WwlkbrNEmjE8+kzOAFGpW4jih1wofLTjgftASr
 8rGvQqSr/W+/JVeMR3/kzoofHCOW8djQ+G+ncWEU+L3xkv07GST42beNQgyyc4Pr8Csg
 IQovDur5ssKMnwhXV4xoC13b2FXtctaLzMDk1bZTiRwAgA5g2ovaZh5QjSxXFn/jg/kV
 iAEgL0A3dFh4IXeu5/nH1DHIB1g+OeFM5fbt7kvEpgUmdEmR5X1WqbeKWdvAf+5PqcFH
 BStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JZasnJBXyqpVqWDb+ONSG6KTTnxIxMMskAmzRNPMCh4=;
 b=gNXrD7MQvbgev2fxqvvHxsK5EgSTCO/IKw7Z37+pGzLBok/aly1ntFD4ssRe0C3Q71
 F3fZCnpS9hEaw7+z95AUnUA4kMytlXgsQ2Ni8N9mc7HuhxqOuniF/cCCHf9WygAtxnGZ
 X3zoRZ0Ov4HbpbpohKoAcenOdyS2BXShm0hKHxFr019Y8T6G9PRjMt+8YZtod8Lx85+O
 F7LMB0f1R4/biC1DyaauYcvufh2eoIAk73tPQgka2aVoHIFfj8euM2Jw4l0Zbo9lT+VH
 0VHBZGt8zXX+Od9u1zcxNxz0EogYIefF3DheFh5BLZ6Zg/Ifyl2b6wrKYefJmR8lRT5i
 p5Yg==
X-Gm-Message-State: AOAM530nWqvAGO0XU6iRgDSZQvSIjilhIh2dZr5lYt215tkE/FSrrM62
 EAW2qF9jV9i40THdcEGLbQAVQybqF5dVxUGN+PQCOg==
X-Google-Smtp-Source: ABdhPJy4j55iv7SM2Kcy3Q2o4v2tn7ETDWhn16vTDab+owGNwQ1I+Q/kgk0uBbbzsHp2DDpRNyl/FOPUW111KjqojMw=
X-Received: by 2002:a17:90b:4a09:: with SMTP id
 kk9mr90320pjb.107.1644308628882; 
 Tue, 08 Feb 2022 00:23:48 -0800 (PST)
MIME-Version: 1.0
References: <CAD1rtg8sa2OG4jUL8x7Gr9ExzH-tEswhHwSDaZtWhcAN4sAvuw@mail.gmail.com>
 <YgIXodbEP9hmae6Q@heinlein>
In-Reply-To: <YgIXodbEP9hmae6Q@heinlein>
From: Michael Shen <gpgpgp@google.com>
Date: Tue, 8 Feb 2022 16:23:12 +0800
Message-ID: <CAD1rtg-tTrbjiL76NRDGnAfx36JBM4Rcb2gyUYjROR-2=H+Uqg@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Feb 8, 2022 at 3:11 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Tue, Feb 08, 2022 at 01:10:37PM +0800, Michael Shen wrote:
> > Hi Openbmc,
> >
> > We would like to propose an application that directly reads the DIMM
> > SPD over HW interface(mostly I2C/I3C).
>
> Who is "we"?

Google BMC team. Benjamin Fair is our techlead for this project. Just CC him.

>
> > If I understand correctly, the main method for obtaining the SPD
> > information in openbmc is from SMBIOS which is prepared by BIOS. And
> > We are exploring another way that excludes the involvement of BIOS.
>
> Unless you're proposing that the BIOS itself comes to the BMC to get the SPD
> data, I'm somewhat surprised you could come up with a hardware design to make
> this work.  Due to the number of DIMM channels and the limited number of CS pins
> on JEDEC DIMMs, you're going to have muxes on the bus somewhere.  Mixing muxes
> and multi-master access is pretty problematic.

Yes, we need an additional MUX for switching the master(between BIOS or BMC).
However, compared to the single-master(BIOS only) design, this MUX is
the only hardware difference.

> Either the BIOS and BMC are
> fighting over the mux, which is going to mess with the mux driver's view of the
> world, or you've got one mux for each in which case you're switching masters
> onto a bus, which violates a few i2c design rules.

BIOS owns the MUX select pin and it can decide who owns the SPD(I2C/I3C) bus.
From my understanding, BIOS only needs to read SPD during the POST stage.
For the rest of time, BIOS will hand over the SPD bus to BMC.

>
> > The architecture of this application will be similar to the
> > openbmc/smbios-mdr (the dimm part). The main difference will be the
> > data source (changed from SMBIOS to SPD).
> >
> > Currently the code is still being implemented, and we plan to support
> > DDR5 SPD first, then expand to other DDR generation(if needed).
>
> Hopefully you're leveraging the existing kernel drivers for reading SPD EEPROMs.
> This creates you a sysfs file containing the whole of the EEPROM content.  You'd
> just need to write a parser for JEDEC SPD format data.

Yes, the data is coming from the sysfs file. And the SPD parser is one
of the main parts.
The second main part is a D-Dus service that exposes data from SPD to
D-Bus interface.

>
> You should take a look at what is already existing in fru-device (part of
> entity-manager repository).  This is already doing this for IPMI-format EEPROM
> data.  We should be able to replicate/enhance this code, in the same repository,
> to handle SPD format.

I am not sure if it's a good idea to put it into the entity-manager
repo. As you said EM
is designed for IPMI-format EEPROM. Adding another parser into that
repo may violate
EM's design.
