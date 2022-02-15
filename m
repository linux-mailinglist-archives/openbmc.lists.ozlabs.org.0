Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FCD4B6037
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 02:51:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyPGH6cslz3bT6
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 12:51:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GQVrGjCO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=gpgpgp@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=GQVrGjCO; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyPFx5BGWz2x9b
 for <openbmc@lists.ozlabs.org>; Tue, 15 Feb 2022 12:51:33 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id l19so26505006pfu.2
 for <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 17:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ygGx0zt1abQefASjSlZ9bCvK2jD29RdQCOOljDZ7kfg=;
 b=GQVrGjCOLK1/bOPkk0ay91k9Os072x434gQmr8yHPcMBC4ax+fPYxZLnfOFQ52TVum
 jwhp9ETgfgDkRe8WdG7PPqQpccnA8Ixh8ZWvHP6ISu0ndmTFKInYqBXRkRrEnaKKkpBq
 1WgsVN6GJ82D8X7tXlnooVs6k4Pvun6N1hi+v8PZcnNwogPR7aIJ2X94kBm4UYtkqH3+
 NjXcIU+QxKHEF23jEOCcS5rjIO5QkaEuzlzQ5LoBKl66hiP3qb/upM6Lxug5srWwxO+G
 sZq0em9FVZPwuYLNzK+C18K1hY+b9pDx+3s9KeHqIIULI2XEVHQhZVQ2+1aY+/fHHZUc
 XAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ygGx0zt1abQefASjSlZ9bCvK2jD29RdQCOOljDZ7kfg=;
 b=P3umAISdHqkz+WjPERW1FhbouvvR5yhM8NTF98zzsuFzadglwLqU7ZxzOhnTRAEubW
 Yo2Lc6HnBBa3QAqv4SUb2AqN8Hr140IU2k9ObURbQ/pwQT3sHtzZQF9jEXeFMMmytnAt
 adUWv8xSGnPENfOFeSRuTbv1qSe4Pv7tEqRI3QF/TnU6vCBBGgpF+7G7eAllsajL6KTu
 gxTdHl5oM5Mv9sUS/qPgeoU4Na4D5JOx0E72HG6TRkvk0eGrcO0xlD1djEosrx6DvcR+
 CoKg7IIeeyrKAiW5CJtLGkSHQdTgKIIexmChM2M+00WDFqeX5E4RrMjPLLDK15+nd88e
 VLEA==
X-Gm-Message-State: AOAM532kKalDRVH4Xfwf34asUrlC10azyn3Q5QMUjKizs8I7OvPFZ6iZ
 7gif1nyz9t9uiPoxj7k0KBNrgz8qw8btu/E0SS3Pjw==
X-Google-Smtp-Source: ABdhPJwgvvHX4/HchssZPtEDs1Trqf6GhF6EzskmLg0Gb2QLA1yZGUI58GHGhmT0sRuukz0kDsD0Iuw4wmBQlZMZfb8=
X-Received: by 2002:a63:fe42:: with SMTP id x2mr1615679pgj.334.1644889890482; 
 Mon, 14 Feb 2022 17:51:30 -0800 (PST)
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
In-Reply-To: <CADKL2t7Jrn5LqTu8Yy9CbCaH2VHHe_Ub=gPaH78Hx2-ZHj2g1w@mail.gmail.com>
From: Michael Shen <gpgpgp@google.com>
Date: Tue, 15 Feb 2022 09:50:54 +0800
Message-ID: <CAD1rtg8Ja4_XMu3O4KBrhJv4kRwezEPYi4J1698uW1_4ff=TiQ@mail.gmail.com>
Subject: Re: Propose a new application for reading DIMM SPD directly
To: Benjamin Fair <benjaminfair@google.com>
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
Cc: Ed Tanous <edtanous@google.com>, "Zbigniew,
 Lukwinski" <zbigniew.lukwinski@linux.intel.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> What about CLTT? Switching MUX to the BMC makes CPU not able to get DIMM
> temperature. Are you assuming here this feature is enabled in BMC FW?
CPU can still monitor the DIMM temp by reading the MR4 register and
trigger the DIMM throttling if needed. So I think the CLTT will not be
affected.
If CPU needs something more than MR4 register provided, BMC can assist
it in another separate daemon like Benjamin mentioned.

On Tue, Feb 15, 2022 at 6:17 AM Benjamin Fair <benjaminfair@google.com> wrote:
>
> On Fri, 11 Feb 2022 at 13:21, Zbigniew, Lukwinski
> <zbigniew.lukwinski@linux.intel.com> wrote:
> >
> > On 2/11/2022 1:40 AM, Michael Shen wrote:
> > > On Thu, Feb 10, 2022 at 6:45 AM Ed Tanous <edtanous@google.com> wrote:
> > >> On Wed, Feb 9, 2022 at 1:14 PM Patrick Williams <patrick@stwcx.xyz> wrote:
> > >>> On Wed, Feb 09, 2022 at 12:20:00PM -0800, Ed Tanous wrote:
> > >>>> On Wed, Feb 9, 2022 at 11:56 AM Patrick Williams <patrick@stwcx.xyz> wrote:
> > >>>>> On Tue, Feb 08, 2022 at 04:23:12PM +0800, Michael Shen wrote:
> > >>>>>> On Tue, Feb 8, 2022 at 3:11 PM Patrick Williams <patrick@stwcx.xyz> wrote:
> > >>>>>>> On Tue, Feb 08, 2022 at 01:10:37PM +0800, Michael Shen wrote:
> > >>>>>> BIOS owns the MUX select pin and it can decide who owns the SPD(I2C/I3C) bus.
> > >>>>>>  From my understanding, BIOS only needs to read SPD during the POST stage.
> > >>>>>> For the rest of time, BIOS will hand over the SPD bus to BMC.
> > >>>>> That seems like it might work.  You'll have to deal with the time when the BIOS
> > >>>>> has the mux in the BMC code somehow.  Ideally I'd ask for the mux select to also
> > >>>>> be fed to the BMC as an input GPIO so that you can differentiate between "we
> > >>>>> don't own the mux" and "all the devices are NAKing us".
> > >>>> This seems like a nitty gritty design detail that's best handled in
> > >>>> code when we review it.  I think the important bit here is that there
> > >>>> are paths where this could work without a significant design issue.
> > >>> Just one subtlety.  I wouldn't expect this, necessarily, to be in _our_ design
> > >>> and/or code, except that we'd want to document the GPIO line like we do all
> > >>> others.  I was trying to hint that "if I were involved in this hardware design,
> > >>> I'd ask for...".  If you leave it out, I'm sure it'll work _most_ of the time
> > >>> just fine and it'll be your problem to debug it when it doesn't.
> > >> Understood.
> > > Thanks for all your suggestions. I will keep them in mind during implementation.
> >
> > What about CLTT? Switching MUX to the BMC makes CPU not able to get DIMM
> > temperature. Are you assuming here this feature is enabled in BMC FW?
>
> BMC could assist with CLTT, but since this is CPU-specific it would
> belong in a separate daemon. That daemon could get the relevant
> temperatures over D-Bus using the standard sensor interface, so I
> don't think it should affect the design for this component.
>
> > Are you going to support DCPMM as well? If so, there is another problem
> > since switching MUX to BMC you brakes NVDIMM related FW/SW running on
> > Host OS.
>
> There are no plans currently for supporting NVDIMMs, just DDR5 at
> first as Michael mentioned, and possibly other DDR versions in the
> future.
>
> > >>>>> You should take a look at what is already existing in fru-device (part of
> > >>>>> entity-manager repository).  This is already doing this for IPMI-format EEPROM
> > >>>>> data.  We should be able to replicate/enhance this code, in the same repository,
> > >>>>> to handle SPD format.
> > >>>> I am not sure if it's a good idea to put it into the entity-manager
> > >>>> repo. As you said EM
> > >>>> is designed for IPMI-format EEPROM. Adding another parser into that
> > >>>> repo may violate
> > >>>> EM's design.
> > >>> I'm not sure why it would be an issue.  Hopefully one of the maintainers of that
> > >>> repo can weigh in.  I wouldn't expect "parsing only IPMI-format EEPROMs" is a
> > >>> design but just the current state of implementation.
> > >> So long as it can function properly in its current design, i have no
> > >> problem with FruDevice adding more parsing types.  In fact, there's
> > >> already patchsets out to add Linkedins proprietary fru type to
> > >> FruDevice, so in terms of design, Patricks request seems reasonable.
> > > Got it. Then I will push the code to EM.
