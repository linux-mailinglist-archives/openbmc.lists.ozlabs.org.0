Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7754B9762
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 05:00:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jzh1Y2stjz3bZg
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 15:00:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sgM2X66d;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=gpgpgp@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=sgM2X66d; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jzh1C6lKRz2yK3
 for <openbmc@lists.ozlabs.org>; Thu, 17 Feb 2022 14:59:57 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 n19-20020a17090ade9300b001b9892a7bf9so8268245pjv.5
 for <openbmc@lists.ozlabs.org>; Wed, 16 Feb 2022 19:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vWaRluJkahymkhBY5iTtJYWymk3Y6VOfrmfXtvcc7Zg=;
 b=sgM2X66dE4yvpWRLkvddysPstGy437RSKnOT/0BxVy/Dr2Bdn8tad5IHmKIlT0s9sB
 TxhG5c50Z3R/gT5qaNR9vG6VlKsPUDfBeA8zTHs3q/wTDgU83lPcvy5iy0c7AzTBW5jS
 G2cx3eSPrgDc36Wi98bORwYMva4mArTDzxcXCMFIJrMd/inIKGt5j6scbJH3ikTJPLHx
 HmWabFpnA2OSv8LLAlXVnFwasJBGiLVtSbhb4uO9MRodMvTXU4XX1haD6G+4tN6ndPmL
 3VV815e963HiYXCT1ORpU2cl+FhE+I7fWTU8T3Y0HKOrnP53+8H/TvLRjtVxINnswYZm
 F0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vWaRluJkahymkhBY5iTtJYWymk3Y6VOfrmfXtvcc7Zg=;
 b=ARMBo0NRrnObrQ1DRCRkjCvUWdcv1j4vxJhx4Y+HEp2Gv5IMynG/MbZSnyZ94s88YC
 x3Aj9i+G8VbMy4FcFHfNDKVXShDW5Gf+SrzewqSX616N/houUkQJe/blhY+6QxkBIeey
 0GDaOn+N2RabK2vAa/UasPU0GVBbAnH2v+zj8OPEx6KqLlsqdmIyCyVbm6bTsofx6naZ
 aKHwDYthin3yiyk754YZFkQGUVX87QoJmc/0nsO6+Br0Qug5tUJXeewyPKf0m7IrC+EZ
 0Vf1Oth6D2XV3eQ7lXfMA7rizKT+fNZfgGl3GCH1k/a2FvKiNFt/mFXFa2pfUi4aRELh
 j5hQ==
X-Gm-Message-State: AOAM5323oOMvXPaAmNOzI+Eo5xuoEn7i7NP7V6bQo4fN8exDk6o+CWua
 mdgrGTbvl9E9ks5yzG9w4xzQnbPLEOAZIzON2QpOVLfmOS4=
X-Google-Smtp-Source: ABdhPJxb2t1jWsjKJfaW5PlHZAohz4088WyEiqMPGngGlLUnvtXKNY53N91SEyUcZ6qT+/RrBGwLCdjuvRFuzghs8fs=
X-Received: by 2002:a17:903:2d0:b0:14d:8a8d:cb1 with SMTP id
 s16-20020a17090302d000b0014d8a8d0cb1mr1052163plk.50.1645070394832; Wed, 16
 Feb 2022 19:59:54 -0800 (PST)
MIME-Version: 1.0
References: <CAD1rtg8sa2OG4jUL8x7Gr9ExzH-tEswhHwSDaZtWhcAN4sAvuw@mail.gmail.com>
 <YgIXodbEP9hmae6Q@heinlein>
 <CAD1rtg-tTrbjiL76NRDGnAfx36JBM4Rcb2gyUYjROR-2=H+Uqg@mail.gmail.com>
 <YgQcaInEBq8ZBlIm@heinlein>
 <CAH2-KxAyXn3YndZY_aWAMt4M6eTMrkPA91vCPeOj0tZOgPv-vA@mail.gmail.com>
 <YgQuzD9AkrqstygH@heinlein>
 <CAH2-KxA6MhNXUs+KXAjHTcJe1gWyGwfL+OUQBuCfQnPMSX7GZQ@mail.gmail.com>
 <CAD1rtg8vM-2PckG1Cct7m5tyFJ-axvKQ_ky2z=rzV4O9mZjoWA@mail.gmail.com>
 <5892de79-ea79-8922-d809-1dd5622a84ad@linux.intel.com>
 <CADKL2t7Jrn5LqTu8Yy9CbCaH2VHHe_Ub=gPaH78Hx2-ZHj2g1w@mail.gmail.com>
 <CAD1rtg8Ja4_XMu3O4KBrhJv4kRwezEPYi4J1698uW1_4ff=TiQ@mail.gmail.com>
 <54fa7998-223c-f8fe-2fb5-124822a0b06f@linux.intel.com>
In-Reply-To: <54fa7998-223c-f8fe-2fb5-124822a0b06f@linux.intel.com>
From: Michael Shen <gpgpgp@google.com>
Date: Thu, 17 Feb 2022 11:59:18 +0800
Message-ID: <CAD1rtg_=EPWU-4B3o4Cyuf9EU7sZtSLSuL5PSG7FvSRp62D9Sw@mail.gmail.com>
Subject: Re: Propose a new application for reading DIMM SPD directly
To: "Zbigniew, Lukwinski" <zbigniew.lukwinski@linux.intel.com>
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
Cc: Ed Tanous <edtanous@google.com>, Benjamin Fair <benjaminfair@google.com>,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> I see. So the app will just read SPD non-volatile content and provide it
> for user, e.g. over DBus, right?

Yes, the plan is over DBus.

> Are you going to access DIMM periodically? It seems that it shall be
> enough to access DIMMs once per ac cycle/dc cycle. And just return SPD
> ownership to the CPU for the rest of time.

I think reading the SPD once per ac/dc cycle is enough like you said.
But if we want BMC to monitor the DIMM temp instead of CPU, then BMC
can't return the SPD ownership since the temp needs to be read
periodically.

On Wed, Feb 16, 2022 at 4:39 AM Zbigniew, Lukwinski

<zbigniew.lukwinski@linux.intel.com> wrote:
>
> On 2/15/2022 2:50 AM, Michael Shen wrote:
> >> What about CLTT? Switching MUX to the BMC makes CPU not able to get DIMM
> >> temperature. Are you assuming here this feature is enabled in BMC FW?
> > CPU can still monitor the DIMM temp by reading the MR4 register and
> > trigger the DIMM throttling if needed. So I think the CLTT will not be
> > affected.
> > If CPU needs something more than MR4 register provided, BMC can assist
> > it in another separate daemon like Benjamin mentioned.
>
> Got it.
>
> > On Tue, Feb 15, 2022 at 6:17 AM Benjamin Fair <benjaminfair@google.com> wrote:
> >> On Fri, 11 Feb 2022 at 13:21, Zbigniew, Lukwinski
> >> <zbigniew.lukwinski@linux.intel.com> wrote:
> >>> On 2/11/2022 1:40 AM, Michael Shen wrote:
> >>>> On Thu, Feb 10, 2022 at 6:45 AM Ed Tanous <edtanous@google.com> wrote:
> >>>>> On Wed, Feb 9, 2022 at 1:14 PM Patrick Williams <patrick@stwcx.xyz> wrote:
> >>>>>> On Wed, Feb 09, 2022 at 12:20:00PM -0800, Ed Tanous wrote:
> >>>>>>> On Wed, Feb 9, 2022 at 11:56 AM Patrick Williams <patrick@stwcx.xyz> wrote:
> >>>>>>>> On Tue, Feb 08, 2022 at 04:23:12PM +0800, Michael Shen wrote:
> >>>>>>>>> On Tue, Feb 8, 2022 at 3:11 PM Patrick Williams <patrick@stwcx.xyz> wrote:
> >>>>>>>>>> On Tue, Feb 08, 2022 at 01:10:37PM +0800, Michael Shen wrote:
> >>>>>>>>> BIOS owns the MUX select pin and it can decide who owns the SPD(I2C/I3C) bus.
> >>>>>>>>>   From my understanding, BIOS only needs to read SPD during the POST stage.
> >>>>>>>>> For the rest of time, BIOS will hand over the SPD bus to BMC.
> >>>>>>>> That seems like it might work.  You'll have to deal with the time when the BIOS
> >>>>>>>> has the mux in the BMC code somehow.  Ideally I'd ask for the mux select to also
> >>>>>>>> be fed to the BMC as an input GPIO so that you can differentiate between "we
> >>>>>>>> don't own the mux" and "all the devices are NAKing us".
> >>>>>>> This seems like a nitty gritty design detail that's best handled in
> >>>>>>> code when we review it.  I think the important bit here is that there
> >>>>>>> are paths where this could work without a significant design issue.
> >>>>>> Just one subtlety.  I wouldn't expect this, necessarily, to be in _our_ design
> >>>>>> and/or code, except that we'd want to document the GPIO line like we do all
> >>>>>> others.  I was trying to hint that "if I were involved in this hardware design,
> >>>>>> I'd ask for...".  If you leave it out, I'm sure it'll work _most_ of the time
> >>>>>> just fine and it'll be your problem to debug it when it doesn't.
> >>>>> Understood.
> >>>> Thanks for all your suggestions. I will keep them in mind during implementation.
> >>> What about CLTT? Switching MUX to the BMC makes CPU not able to get DIMM
> >>> temperature. Are you assuming here this feature is enabled in BMC FW?
> >> BMC could assist with CLTT, but since this is CPU-specific it would
> >> belong in a separate daemon. That daemon could get the relevant
> >> temperatures over D-Bus using the standard sensor interface, so I
> >> don't think it should affect the design for this component.
> >>
> >>> Are you going to support DCPMM as well? If so, there is another problem
> >>> since switching MUX to BMC you brakes NVDIMM related FW/SW running on
> >>> Host OS.
> >> There are no plans currently for supporting NVDIMMs, just DDR5 at
> >> first as Michael mentioned, and possibly other DDR versions in the
> >> future.
>
> I see. So the app will just read SPD non-volatile content and provide it
> for user, e.g. over DBus, right?
>
> Are you going to access DIMM periodically? It seems that it shall be
> enough to access DIMMs once per ac cycle/dc cycle. And just return SPD
> ownership to the CPU for the rest of time.
>
> >>>>>>>> You should take a look at what is already existing in fru-device (part of
> >>>>>>>> entity-manager repository).  This is already doing this for IPMI-format EEPROM
> >>>>>>>> data.  We should be able to replicate/enhance this code, in the same repository,
> >>>>>>>> to handle SPD format.
> >>>>>>> I am not sure if it's a good idea to put it into the entity-manager
> >>>>>>> repo. As you said EM
> >>>>>>> is designed for IPMI-format EEPROM. Adding another parser into that
> >>>>>>> repo may violate
> >>>>>>> EM's design.
> >>>>>> I'm not sure why it would be an issue.  Hopefully one of the maintainers of that
> >>>>>> repo can weigh in.  I wouldn't expect "parsing only IPMI-format EEPROMs" is a
> >>>>>> design but just the current state of implementation.
> >>>>> So long as it can function properly in its current design, i have no
> >>>>> problem with FruDevice adding more parsing types.  In fact, there's
> >>>>> already patchsets out to add Linkedins proprietary fru type to
> >>>>> FruDevice, so in terms of design, Patricks request seems reasonable.
> >>>> Got it. Then I will push the code to EM.
