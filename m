Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C767827628E
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 22:52:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxVk624blzDqVD
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 06:52:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b44; helo=mail-yb1-xb44.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=a2mJRFtG; dkim-atps=neutral
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxVj46dnKzDqS6
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 06:51:49 +1000 (AEST)
Received: by mail-yb1-xb44.google.com with SMTP id x8so687050ybe.12
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 13:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ff1CSStvUE5PNN8pEdPHHhoRzANWkHXw1E62HFtDBEU=;
 b=a2mJRFtG5obVloWDaRg8N0THYniIbL0D+oCCRGfuziqKmrmeaRYrECphqTmc5ATQec
 T5I0tqqs3I8BL9n2EOlQuQwCyCihli/13ZYVLpl/QuOPi2bkdrkJbx8k7c8U8STksXcF
 sKN43LOrjQtBBINoh3thVH6+mTKtix5rFPeD9CnzMTUey+fik6OygCMCeF/7XAQTnTPB
 8qsA1+/y2CRvdj6dTq1/MhIW5R5MwYzGl7bwPCB6xPXRosIxc2Il2FCEv0MKIe7gGslp
 df118ZsKGKkdGLbKXVn4QvCjJT28PqbfgpOy1MwSQ5JYc7rdUqOYuK1NV0Qrg8J/a7BA
 nLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ff1CSStvUE5PNN8pEdPHHhoRzANWkHXw1E62HFtDBEU=;
 b=EDo0/OQW14ifR6rnfFzvHLQZRA+7NjvEV7+iVpt9uf2ldxsiD80hD7pNBVNqlgMskX
 kUe6PkLComOMWLkO/andf6Z0/ZlB1lX7y+A0dkA1MiR8OnZ9Mp9x5j+nCBWYSoyxuTp3
 //oFOs+3QA9kM07EkAKlHh61jJ/D41gtyNZg0er3JmWE1781xrxbFc4NFmd6GEMoUbHD
 XeB2deOC1XPhFyu6iL6NGE+NIlfkYbdvkHuGaXRAhpBCPUHbuVl0zxqQshh5Yw9qcZ76
 LJGnwnerXvfF5q3ft98tg+IIhOkK/UuyJB1AOtRy42gjDWOF9V8e9gzFiZ9YSxHR3gIm
 LKng==
X-Gm-Message-State: AOAM533RWKs7CMJku2vB5I+o+jTNCoZtBSu0J/gdp6y1PaXv7+PIgv+e
 +NdWEX1s4a9kXA+9UItlEwyegMdwIUBlTq9oOFEueQ==
X-Google-Smtp-Source: ABdhPJyoB6aMBNK84PYtS1UUdeZbp9TPAc8HggK4GJpl6z36yNeSzl3NBW+K/x+Q0UjjGW8zhKbkEyLJOSFBBUdDaEk=
X-Received: by 2002:a5b:601:: with SMTP id d1mr2679312ybq.417.1600894304904;
 Wed, 23 Sep 2020 13:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
 <20200916172045.GD6152@heinlein>
 <CACWQX80BYYwPTN1PsbLfjFN5fQyjNGC1SxM9iyBKvxNiLh=WLQ@mail.gmail.com>
 <a5f0245d-703d-e0ba-0344-442c49a60cdf@linux.vnet.ibm.com>
 <20200917153601.GH6152@heinlein>
 <c007630e-54e2-df13-e6da-0af0b2998279@linux.vnet.ibm.com>
 <e7dc17f5-191c-b24f-4b92-1020cf77a54a@linux.vnet.ibm.com>
 <20200923192457.GS6152@heinlein>
In-Reply-To: <20200923192457.GS6152@heinlein>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 23 Sep 2020 13:51:33 -0700
Message-ID: <CACWQX83TAW8TfAUaNSkO7UA0VrYKjut8uFnd6pF3RgcJm_EDrA@mail.gmail.com>
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

On Wed, Sep 23, 2020 at 12:24 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Tue, Sep 22, 2020 at 02:39:04PM +0530, Ratan Gupta wrote:
> > Hi All,
> >
> > Adding one more problem here with settings infra and with some proposed
> > solutions.
> >
> > Problem Domain:
> >
> >        - With multi property update from redfish , webserver updates the
> > settings object
> >        - PLDM on bmc listens on the property update of settings object
> > and notifies to Hypervisor
> >        - As there can be multiple properties in single PATCH operation,
> > PLDM on bmc sends
> >          multiple Notifications to Hypervisor
> >        - Specifically in case of network config,  single property update
> > on phyp may lead to network inconsistency.
>
> The original bios config seemed to only apply settings at specific times
> (ie. when the BIOS restarts) but your problem seems to indicate that
> you're immediately sending settings up to the host whenever they change?

I have a very similar use case that I will need to build out in the
next year.  Yes, if the host is on, we'd like them to be pushed
immediately, ideally with error codes returned to dbus if the
operation fails.

>
> > How can we solve this?
> >
> >   * Proposal 1: Add one more property in the settings Dbus object itself
> >     which tells that it is ready to be read, PLDM on the BMC watching on
> >     that property and read the whole network configuration and notifies
> >     Hypervisor.
> >
> >   * Proposal 2: Hypervisor runs the timer if the bios attr belongs to
> >     network configuration and once the timer expires,it reads the bios
> >     attr related to network and applies it.
> >
> >   * Proposal 3: Add one more bios attribute in the bios table which
> >     tells that Bios configuration can be read and applied by the
> >     Hypervisor for the network configuration.
>
> It is unfortunate that org.freedesktop.DBus.Properties doesn't have a
> way to set multiple properties as the analogous operation to 'GetAll'.

It was proposed we (OpenBMC) add one while back.  I think it muddies
the water of what it means to be a method call, and what it means to
be a property, especially for the use case that it was being proposed
to cover.

>
> In the case of networking, how do we handle this for the BMC settings?
> Don't we have a similar situation where multiple properties are changed
> via some interface and could leave the network in an unusual state?  I'm
> thinking IPMI does this.

I think today the behavior is that the network is left in an unusual
state until it's not.  If the config is invalid, and can't be
written(because of depdent properties) we just don't push it down
until it's valid.

>
> When all of our DBus objects were serial we likely never had this issue
> because the request to read the properties (to send to the hypervisor)
> would come behind the signal and subsequent property updates.  Now that
> we're moving towards more ASIO we likely will see this kind of issue
> more often.  I don't like it but we could certainly proposal a
> 'SetMultiple' extension to org.freedesktop or create our own interface.

If you have properties that need to be set in lockstep with one
another to be valid, I suspect that indicates that properties are not
the right tool.  Redfish hits this a lot, where each resource is
expected that any property is modifiable independently, and certain
implementations need an atomic "unit" of update.  bmcweb doesn't want
to have to cache properties that are collectively invalid right now,
but might become valid in the future, so there's an impasse.  Who
keeps the state while it's invalid?  Thus Far, that falls to the
dbus-daemons to store.

In terms of this issue, most (all?) ASIO clients are single threaded,
so I think you have the same dependencies.

>
> Proposal #2 isn't great because, well, how long do you wait?  In the
> case of hypervisor updates, delaying something on the order of a second
> is probably sufficient for Redfish/PLDM, but that doesn't really
> generally solve the problem.

This tends to be what I've recommended in the past (assuming the
"update" is computationally expensive).  If the update is
computationally "cheap", just go ahead and do it on every transaction.
Ideally PLDM would be modeled such that transactional changes are
"cheap", and don't require a full payload update on every property
change.

>
> We could define an interface to implement something like Proposal #1,
> but we would need a new interface and not a property we tack onto
> existing interfaces.  We'd probably need to revisit a lot of our
> interface definitions and see which ones typicallly have multi-property
> updates and does an intermediate state leave us in a bad situation.
>
> Specifically for BIOS/Hypervisor settings, I mentioned before that it
> isn't clear to me what the proposal is for applying Pending to Current.
> Again, this isn't general, but we could define an interface specific for
> BIOS/Hypervisor settings which has a way to indicate 'Pending
> transaction is complete' (set by entities like Redfish) and 'Pending
> values applied to Current' (set by entities like PLDM).  For the current
> settings-style values though, this requires external interfaces to
> somehow know that the setting is associated with the Host in order to do
> the application, since BMC-owned properties won't have or need this.

Dumb question: Does anyone actually need to know the "current" value?
Redfish certainly would need to return  the "pending" value in all
cases, as it's required so the restful API emulates ACID-like
compliance to the user.  Could we just have an optional interface that
indicates "values might not be loaded yet" and simplify the dbus API a
little?

>
> --
> Patrick Williams
