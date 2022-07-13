Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EB75738FE
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 16:37:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjgDv44Wvz3c5g
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 00:37:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=AcwGJBkl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=AcwGJBkl;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjgDS1Slmz300x
	for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2022 00:36:38 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id x18-20020a17090a8a9200b001ef83b332f5so4061097pjn.0
        for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 07:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=stg7VlvVC66wnwSuWwJdfamqBpTMH1Lajy8GOZjCK4o=;
        b=AcwGJBklze9EepztHMysi0odMr5fhWFRSPOAu02K0YUIBYvlFXN9oyB9Vgh1KOFUVU
         MEX0S/CAZWs/9GvH5P03E9HmFK7Tzmprbd6D8zH6mWTcHulVt4Powb6oq1TUFNFQTis+
         w3vNMgna3++fqyaNldoBD2snp0SG19GjR/5EElAhkDfVAjMo+0G55J7M4x5huoJ15d4f
         3IZ8KZD8Bk0Uf+RgBxvGVZTHo1gYvNTObtX8gjvFlNhf3gYwS6qAzBXEQ7xuCxsTbdBD
         q7BOi+6oNAlcUt6TYljUN9ro7S6H8Tk9dYs+6IU71UTXj4iebHPRxn8m5viPK4o241zc
         cLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=stg7VlvVC66wnwSuWwJdfamqBpTMH1Lajy8GOZjCK4o=;
        b=WlviqiEOB+AdEhI/z9vGvuvABmw2DT37kZ+XPVA9AU0xULSawuKyrA+nyk22o0H6rg
         kuOvSBary/kVnu8o35Zv8VDcE+AUTRZjOvkNwFoRhlkeCAWP/Kb4enI8qMg6n2IP1yDj
         3Re2GUE3GS2/KeeJzb/2T6cEAZFPtIdmd44ZSF7yMVItANjtg5o3atclJ+fzzqcPINfw
         E0WDCMGGj9bQpOgugsJ7P+3K4H0IvXflGC2jimSnsD0ej3CuFPAK4NAk2ZaboX9rPFjH
         IwseGlptmpfatAqzlKqYpKGL7ND1NFMt4vZMUSG4Zz4MMQnaMNecl9drsa9JH2Shdl0H
         EdyQ==
X-Gm-Message-State: AJIora+vudGq84DpBhcuTw7CCXxlfAjwoS0XWx1VXO42Jl/P7P0hX7zq
	V5XYiLnrGu6GMaAOF+gviaotkSNqRQdv0rmhDFkl2w==
X-Google-Smtp-Source: AGRyM1v2ex/+x7y2/ndZU/VURjricB+ZYgXpMWybU+dqAsR6VAvzTgszS55BqOrq925BrEl93eohfCZCaAnQhycfrkA=
X-Received: by 2002:a17:902:f391:b0:16b:f995:437d with SMTP id
 f17-20020a170902f39100b0016bf995437dmr3472828ple.22.1657722995846; Wed, 13
 Jul 2022 07:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxBmFwVmF4cr+_eTFrwdz9-he--PPfRvW=cN6oNGf4KA_A@mail.gmail.com>
 <Ys6riEnZm5SP8v76@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <Ys6riEnZm5SP8v76@heinlein.stwcx.org.github.beta.tailscale.net>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 13 Jul 2022 07:36:24 -0700
Message-ID: <CAH2-KxBYyg240d48oNRbhNyRK+JkdWrzOcjrxs2JU959=NGP+A@mail.gmail.com>
Subject: Re: DBus ObjectManager Interface usages within the project
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Nan Zhou <nanzhou@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jul 13, 2022 at 4:24 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Tue, Jul 12, 2022 at 11:48:31AM -0700, Ed Tanous wrote:
> > We've had a couple cases in the project where patches have needed to be
> > slowed down because of inconsistencies in our use of object manager, so
> > IMO, the time has come to make our usage of ObjectManager consistent,
> > documented, and drop support for the (not upstream) daemons that don't
> > follow the rules.  As part of this, we will port forward all the upstream
> > daemons to be consistent, and do our best to avoid bugs, but this email is
> > intended to inform those that have non-upstream daemons about the change so
> > they can resolve their implementations.
>
> There isn't much in the dbus spec that puts requirements on where the
> object manager is, but that certainly doesn't mean we can't add our own
> design requirements on top of it.  Thanks for starting this.
>
> > The basics:
> > ObjectManager DBus interface will now be required for any daemon
> > implementing a Sensor.Value interface or Inventory.Item interface.
> >
> > Daemons producing sensors will be required to place their ObjectManager at
> > /xyz/openbmc_project/sensors
> > Daemons producing inventory items will be required to place their
> > ObjectManager at /xyz/openbmc_project/inventory.
> >
> > Both of these interfaces will be required to be published before claiming a
> > well known name on dbus, to allow for the possibility of caching
> > implementations at some point in future.
>
> This means we can end up having N object managers in a single daemon if
> it is hosting multiple namespaces?  Why not just host it at
> /xyz/openbmc_project?

Because rarely is the question being asked "What are all the openbmc
interfaces and values for those interfaces that this application
supports".  Usually the question is more specific, like "What sensors
does this application support".  If we had to get all the inventory
items, nics, and other stuff at the same time that we got all the
sensors, it would make the responses larger.

>
> > This was discussed pretty heavily on discord in the #development topic, and
> > some of the nitty gritty details on why this is needed is available there,
> > as well as I'm happy to discuss here.  This is one of those nasty
> > spaghetti-code things that we've lived with for a while;  Hopefully if we
> > can get this behind us, we can get some good real world performance
> > improvements.
>
> I see the background being discussed when I read through the history on
> #development, but I don't see the rationale on why this was chosen.  I see one
> comment that placing the OM at / is "wrong" but I don't see any justification.
> Why is ".../sensors" right but "/" or "/xyz/openbmc_project" is not?

GetManagedObjects doesn't have a way to filter down further, and for
daemons that might return both, it's advantageous to be able to filter
down more and not return every interface in one response.

>
> We had a good chunk of this discussion about 6 months back in
> phosphor-virtual-sensors where some Redfish code was broken against that
> daemon because it _was_ using "/xyz/openbmc_project/sensors" and there
> was a patch to move it to "/" which ended up getting merged.

Yep, this is essentially the continuation of that discussion.

> Fundamentally, I think it boiled down to neither being in opposition to
> the standard and there was a bunch of code that already implied "/" so
> it was the simplest way forward to achieve compatibility.
>
> >
> > Thoughts?
>
> I do think that moving the OM lower in the hierarchy is probably better
> because it allows us to have parts of the hierarchy which do not emit
> signals, where having it on "/" does not.  I'm just trying to understand
> (and hopefully document more) the rationale on why this choice was made.

Sounds good.

>
> --
> Patrick Williams
