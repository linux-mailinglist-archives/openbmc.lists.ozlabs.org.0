Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 916A727759D
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 17:40:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxzlj0vswzDqbs
	for <lists+openbmc@lfdr.de>; Fri, 25 Sep 2020 01:40:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=xd48Rabq; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxzg73FYPzDqYC
 for <openbmc@lists.ozlabs.org>; Fri, 25 Sep 2020 01:36:48 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id 133so2563787ybg.11
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 08:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4rlI6D2EutZrV0rUVGMwUz9b5Gwplj3tVe2V3HyQj+E=;
 b=xd48RabqUsri9l04mvEtSluPqq2rmdHV8QnHOLmxgebKE2oLEPM0iB7oAG4H+6n5rg
 ITzVAzy9Wfb69sHaAK15mXx/kMtsSVjkCKLufRHhRzQs8gW3134Lhnx1Q0Bo9WTFrTqg
 Omcv13zAPJjMs9RwfrziakUY+pWnUeLAsG8DIyoRdt+dTXkBAT1uZf27E9qlP40SGCDh
 HZthAafzt4fJChOoDri/f/5EwC2cYz6n6tVz7KcB7wBEPxI0XEw/1+uBTD9nX3f7o/rL
 0MBfog9Vkg8S+O17X4raiY7lSqBE0vBM4hqt58ByhfoJA4QJb9W4uJxNV0ZSBy4oaeEx
 rSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4rlI6D2EutZrV0rUVGMwUz9b5Gwplj3tVe2V3HyQj+E=;
 b=XpunCEpq3UdMr6l3gPf7lI7J/AwIhzabRx79yDdJaOOwifhaHzJckfyT5DtH6m5JTQ
 sLU2vy4WUIfFAxm55u6dERjSDSm8vPtBSfithiKgLDapVuOqBCFQaRhj8T0hh7CDNAkF
 fDpDcvMKWL3cFrdIhMDAs8fWmFgjDFKx7XZvDgQiW2rkfrr/u8Be3O89pLbgQhisVnae
 FlwMgg9ygJq1qME2snbNT06UYMIsFv2i0imGylfNIjvUnbsD0gkmoZ23U0lvWILhyxqE
 KW1NJiVTMP2/GUxsITI5tl89dqHn3tngfY2Brtzq/qv3CvHEWed48ZTnKI0YQQTv5Raq
 HrRA==
X-Gm-Message-State: AOAM533wu6Ek/4o0gee3Lf2JaZ2zHNVtnLKPB9YS4AkPBWJ4i3josA75
 3tNHrg/P942WPTe8Tast9gGwo4mvdfwxOpnV6Z7F3g==
X-Google-Smtp-Source: ABdhPJyv+O6tqHBt3F7JokM51GuiOkxko7cpNOzaW3ouxuLDtzk8K3k7W71SSYG5t1gzu8lgJXk5TcDd83vslbJAWjA=
X-Received: by 2002:a25:b8cb:: with SMTP id g11mr169450ybm.203.1600961803656; 
 Thu, 24 Sep 2020 08:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
 <20200916172045.GD6152@heinlein>
 <CACWQX80BYYwPTN1PsbLfjFN5fQyjNGC1SxM9iyBKvxNiLh=WLQ@mail.gmail.com>
 <a5f0245d-703d-e0ba-0344-442c49a60cdf@linux.vnet.ibm.com>
 <20200917153601.GH6152@heinlein>
 <c007630e-54e2-df13-e6da-0af0b2998279@linux.vnet.ibm.com>
 <e7dc17f5-191c-b24f-4b92-1020cf77a54a@linux.vnet.ibm.com>
 <20200923192457.GS6152@heinlein>
 <CACWQX83TAW8TfAUaNSkO7UA0VrYKjut8uFnd6pF3RgcJm_EDrA@mail.gmail.com>
 <20200923212645.GU6152@heinlein>
In-Reply-To: <20200923212645.GU6152@heinlein>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 24 Sep 2020 08:36:32 -0700
Message-ID: <CACWQX81RBhQUPyU3KpL+4AGCob9me0HLf6QJ0qgUphzJdxRu7w@mail.gmail.com>
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 23, 2020 at 2:26 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Sep 23, 2020 at 01:51:33PM -0700, Ed Tanous wrote:
> > On Wed, Sep 23, 2020 at 12:24 PM Patrick Williams <patrick@stwcx.xyz> wrote:
> > >
> > > On Tue, Sep 22, 2020 at 02:39:04PM +0530, Ratan Gupta wrote:
> > >
> > > It is unfortunate that org.freedesktop.DBus.Properties doesn't have a
> > > way to set multiple properties as the analogous operation to 'GetAll'.
> >
> > It was proposed we (OpenBMC) add one while back.  I think it muddies
> > the water of what it means to be a method call, and what it means to
> > be a property, especially for the use case that it was being proposed
> > to cover.
>
> I'm not sure why it would be considered mudding the water.  All property
> Get/Set/GetAll operations really are just a method call under the covers
> anyhow to org.freedesktop.DBus.Properties.  I do think that ideally we'd
> get the method added directly to that interface because then the DBus
> bindings will support it natively.

Mudding the water of when to use a property, versus when to use a
method call (yes, properties are method calls underneath).  If there's
a method call, the dependency between the parameters is documented in
the interface, with a SetProperties method call, it isn't, and you
have to rely on just knowing, or it being implementation defined.  In
those cases, I'd much rather the itnerface make the jump straight to a
method call, and skip properties entirely.

>
> I forgot the mention this again, but another way to solve it is similar
> to xyz.openbmc_project.Inventory.Manager where you take a fully (or
> partially) formed object as a method parameter and the process which
> hosts Inventory.Manager hosts the object.  Settings could be done the
> same way.  The issue is, again, having other processes know when to use
> this new method and when to just update properties.

This tends to be the pattern we use.  My usual take on it when I see a
new interface is, if the create method exists, use it.

>
> > > When all of our DBus objects were serial we likely never had this issue
> > > because the request to read the properties (to send to the hypervisor)
> > > would come behind the signal and subsequent property updates.  Now that
> > > we're moving towards more ASIO we likely will see this kind of issue
> > > more often.  I don't like it but we could certainly proposal a
> > > 'SetMultiple' extension to org.freedesktop or create our own interface.
> >
> > If you have properties that need to be set in lockstep with one
> > another to be valid, I suspect that indicates that properties are not
> > the right tool.  Redfish hits this a lot, where each resource is
> > expected that any property is modifiable independently, and certain
> > implementations need an atomic "unit" of update.  bmcweb doesn't want
> > to have to cache properties that are collectively invalid right now,
> > but might become valid in the future, so there's an impasse.  Who
> > keeps the state while it's invalid?  Thus Far, that falls to the
> > dbus-daemons to store.
>
> Agreed.  This has also been a general statement  we've made in reviews
> for new interfaces.  "If you need to update multiple properties, use
> a method; if you are just updating a single property, update the property."

+1

>
> > > We could define an interface to implement something like Proposal #1,
> > > but we would need a new interface and not a property we tack onto
> > > existing interfaces.  We'd probably need to revisit a lot of our
> > > interface definitions and see which ones typicallly have multi-property
> > > updates and does an intermediate state leave us in a bad situation.
> > >
> > > Specifically for BIOS/Hypervisor settings, I mentioned before that it
> > > isn't clear to me what the proposal is for applying Pending to Current.
> > > Again, this isn't general, but we could define an interface specific for
> > > BIOS/Hypervisor settings which has a way to indicate 'Pending
> > > transaction is complete' (set by entities like Redfish) and 'Pending
> > > values applied to Current' (set by entities like PLDM).  For the current
> > > settings-style values though, this requires external interfaces to
> > > somehow know that the setting is associated with the Host in order to do
> > > the application, since BMC-owned properties won't have or need this.
> >
> > Dumb question: Does anyone actually need to know the "current" value?
> > Redfish certainly would need to return  the "pending" value in all
> > cases, as it's required so the restful API emulates ACID-like
> > compliance to the user.  Could we just have an optional interface that
> > indicates "values might not be loaded yet" and simplify the dbus API a
> > little?
>
> I think this is generally for humans in the case of BIOS settings.
>    - "What is the setting my system is currently running with?"
>    - "What will happen next time I reboot?"

I wonder if we could make a logging API for humans to use, and keep
the "present" things off dbus.  It seems like it would simplify the
implementation quite a bit. <thinking out loud a little>

>
> I don't know how this is modeled in Redfish.
>
> --
> Patrick Williams
