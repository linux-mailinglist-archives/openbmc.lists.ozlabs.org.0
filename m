Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B75BB4B5D89
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 23:18:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyJWn26sQz3cP5
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 09:18:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZTRwJbBo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::433;
 helo=mail-wr1-x433.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=ZTRwJbBo; dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyJWP63VRz3bPP
 for <openbmc@lists.ozlabs.org>; Tue, 15 Feb 2022 09:17:52 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id u1so15329455wrg.11
 for <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 14:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SLIqGgQ691gOx0sCReH052AW/z6J2Gj6SmP7IPYWf7Q=;
 b=ZTRwJbBoMpU6EkQo7f7P/HL8cgjuUSoMPvAL1bbKf40FxTVwgzbx8NJHprDttpggET
 nif995oJbC7k9sshytGil96zJzv4DjgZwBzkTFur7VNqnx++nqF80K86C/aTBis9SPlq
 m3DNl3leioNsbmQQ8gQws5BWGJBwALfO8Oof7uzGrfXuqI04pDd2byNgwv0mspWS5TZ2
 I2xWu42HCpxR/o+jEy6Lb0Wr/+SD4cZOYfrkyEWlAUw1NAkDWp+4kIMh9Iqh2X7CVprP
 rJSGPlpjzs/5u8MEg2cPu8Eh/Zwm+5mWdWVxTbNW7m8aXTyKEy9ZRwAQ+jXmFGlyPW6M
 eymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SLIqGgQ691gOx0sCReH052AW/z6J2Gj6SmP7IPYWf7Q=;
 b=vzRQ7iGAPavJQwK2x6oieNILEg7ZG/1IftahnJ0R31QXKmbhaqmSODplSvhmnwPtAg
 ZDN7qJzaVUGakYnJj1GyTcJgIucpHwVZpFLHWDd8+gt1K7EyLhEVUJA1pyveu2DOljAT
 glk9fW8h8FCAui3J0J9QLi+3lpYHn/8Xxzt0cu0ulxaCZ5xDNZlrjOeLs2u4gGjAxInn
 srzIehejcCgzcerJleP556dnbCpXpktBIjrRz07w6j0/XvLMavfEjSVGmaS3tiqXiLFB
 fi+932XuHtfRn7UYOyUm2I3rR6Wfvo0r+USUD0pG2PpoYAxUuikmSMOev2tOz6eS1rw7
 /1Qg==
X-Gm-Message-State: AOAM533Zl3m82IbtmWDhwAYfie685NkCYZYikYKw2CTI/8zYDdWWeCAb
 p9iMeoRjU8LDnWv//1VwF3nsFSbC0SOxa+/4W1i+2g==
X-Google-Smtp-Source: ABdhPJy+GkLzfvFyYG658HSvjbWmtR+kdbgNkvgMxUWJ9EH0L+V8aH3jUDnBGkfrXk8gIVKPRrSlF4SU7CY3XyVDm6g=
X-Received: by 2002:a5d:5264:: with SMTP id l4mr767134wrc.483.1644877066648;
 Mon, 14 Feb 2022 14:17:46 -0800 (PST)
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
In-Reply-To: <5892de79-ea79-8922-d809-1dd5622a84ad@linux.intel.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Mon, 14 Feb 2022 14:17:09 -0800
Message-ID: <CADKL2t7Jrn5LqTu8Yy9CbCaH2VHHe_Ub=gPaH78Hx2-ZHj2g1w@mail.gmail.com>
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
Cc: Ed Tanous <edtanous@google.com>, openbmc@lists.ozlabs.org,
 Michael Shen <gpgpgp@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 11 Feb 2022 at 13:21, Zbigniew, Lukwinski
<zbigniew.lukwinski@linux.intel.com> wrote:
>
> On 2/11/2022 1:40 AM, Michael Shen wrote:
> > On Thu, Feb 10, 2022 at 6:45 AM Ed Tanous <edtanous@google.com> wrote:
> >> On Wed, Feb 9, 2022 at 1:14 PM Patrick Williams <patrick@stwcx.xyz> wrote:
> >>> On Wed, Feb 09, 2022 at 12:20:00PM -0800, Ed Tanous wrote:
> >>>> On Wed, Feb 9, 2022 at 11:56 AM Patrick Williams <patrick@stwcx.xyz> wrote:
> >>>>> On Tue, Feb 08, 2022 at 04:23:12PM +0800, Michael Shen wrote:
> >>>>>> On Tue, Feb 8, 2022 at 3:11 PM Patrick Williams <patrick@stwcx.xyz> wrote:
> >>>>>>> On Tue, Feb 08, 2022 at 01:10:37PM +0800, Michael Shen wrote:
> >>>>>> BIOS owns the MUX select pin and it can decide who owns the SPD(I2C/I3C) bus.
> >>>>>>  From my understanding, BIOS only needs to read SPD during the POST stage.
> >>>>>> For the rest of time, BIOS will hand over the SPD bus to BMC.
> >>>>> That seems like it might work.  You'll have to deal with the time when the BIOS
> >>>>> has the mux in the BMC code somehow.  Ideally I'd ask for the mux select to also
> >>>>> be fed to the BMC as an input GPIO so that you can differentiate between "we
> >>>>> don't own the mux" and "all the devices are NAKing us".
> >>>> This seems like a nitty gritty design detail that's best handled in
> >>>> code when we review it.  I think the important bit here is that there
> >>>> are paths where this could work without a significant design issue.
> >>> Just one subtlety.  I wouldn't expect this, necessarily, to be in _our_ design
> >>> and/or code, except that we'd want to document the GPIO line like we do all
> >>> others.  I was trying to hint that "if I were involved in this hardware design,
> >>> I'd ask for...".  If you leave it out, I'm sure it'll work _most_ of the time
> >>> just fine and it'll be your problem to debug it when it doesn't.
> >> Understood.
> > Thanks for all your suggestions. I will keep them in mind during implementation.
>
> What about CLTT? Switching MUX to the BMC makes CPU not able to get DIMM
> temperature. Are you assuming here this feature is enabled in BMC FW?

BMC could assist with CLTT, but since this is CPU-specific it would
belong in a separate daemon. That daemon could get the relevant
temperatures over D-Bus using the standard sensor interface, so I
don't think it should affect the design for this component.

> Are you going to support DCPMM as well? If so, there is another problem
> since switching MUX to BMC you brakes NVDIMM related FW/SW running on
> Host OS.

There are no plans currently for supporting NVDIMMs, just DDR5 at
first as Michael mentioned, and possibly other DDR versions in the
future.

> >>>>> You should take a look at what is already existing in fru-device (part of
> >>>>> entity-manager repository).  This is already doing this for IPMI-format EEPROM
> >>>>> data.  We should be able to replicate/enhance this code, in the same repository,
> >>>>> to handle SPD format.
> >>>> I am not sure if it's a good idea to put it into the entity-manager
> >>>> repo. As you said EM
> >>>> is designed for IPMI-format EEPROM. Adding another parser into that
> >>>> repo may violate
> >>>> EM's design.
> >>> I'm not sure why it would be an issue.  Hopefully one of the maintainers of that
> >>> repo can weigh in.  I wouldn't expect "parsing only IPMI-format EEPROMs" is a
> >>> design but just the current state of implementation.
> >> So long as it can function properly in its current design, i have no
> >> problem with FruDevice adding more parsing types.  In fact, there's
> >> already patchsets out to add Linkedins proprietary fru type to
> >> FruDevice, so in terms of design, Patricks request seems reasonable.
> > Got it. Then I will push the code to EM.
