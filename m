Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EFD27EE13
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 17:58:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1gsR5hwczDqTh
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 01:58:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=UbZFh97u; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1gqk0WzyzDqDp
 for <openbmc@lists.ozlabs.org>; Thu,  1 Oct 2020 01:57:03 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id k2so1649151ybp.7
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 08:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HjKBgbh9BLTH7capOXBF+We9VGIULIXPZyy7TZhyon4=;
 b=UbZFh97uwi2RYWXHr83tvdpGvU2vQGom2tbTCWdOD94oZPnErUu7tZYA8J7RlDrhn+
 rU4hEm68fb/sxBhzO3+1opW3j8DAhmw86KfvN1dMLwmEIUp6XZCxyk9B8NlbFIer33mN
 d2XH/THvHFGe8iILiD1PgydfU5QaIxXGRNSW8by96CTtK1r7jgH+4096HRZNsv1oCcRA
 NlUsyXe0OHzeOLqgLOqH/R9VxHaVQ1dG8QFeE4Y1vJH94Tig83TBP4NJds95X9wDODFc
 PCkwz0LwLDfqmIPdx1abMAEEAJQm+RVxjy1Jys3Z1McSjhzLmjGl7K8Lit3j4RIQS3g5
 fXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HjKBgbh9BLTH7capOXBF+We9VGIULIXPZyy7TZhyon4=;
 b=iFLdM4PzSVEIyDt/kwVbDVK6f0azhTgDZZaXUGxT46oqJ3k9RG9PDLLUf1zIWuFuGp
 W67OHMBJ06uWEldr2r5pa4j5fv29CxueZKN8hhG2vrcSPlCHIdcJLG0ysCT8NVj7qrKq
 yu+sxsK86TDLl3/fjMO/Lk0omi194W/pWyHTBBM8vL/C+a5dmKvfLOEywhE6xKvIZmFJ
 SdGcMQuZfCDxunD+kz7EmNUKG0CMW8UCa0GBWMblDn/NfTf/TmX+/R20ggpRvZu4i6UQ
 9/R5nZg/MHsYwbp9eZmOd00U7d5Jfe20taMD4Esv18XkixxlGZo2CVlIHytEpgCT3ENV
 kHRw==
X-Gm-Message-State: AOAM530phBr2QdACEHdj+BGLWuxClRHXk2kPmEOvsPuqIRQOnwPkieHR
 CXbqIoHG6sV7C/UJMxzcBoSfZIqGLz808zqMmiUxOw==
X-Google-Smtp-Source: ABdhPJwieOETEDTGE5aYentu8oO3d10JJNeEEG1boqjcGqRipCqaXJu39KvfsjQscK/8+d4QGgc26MlmS8dsYdMS+jQ=
X-Received: by 2002:a25:aa4d:: with SMTP id s71mr4267872ybi.203.1601481419724; 
 Wed, 30 Sep 2020 08:56:59 -0700 (PDT)
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
 <CACWQX81RBhQUPyU3KpL+4AGCob9me0HLf6QJ0qgUphzJdxRu7w@mail.gmail.com>
 <da763cca-6054-dcc7-6ce4-19ae58ff051b@linux.vnet.ibm.com>
In-Reply-To: <da763cca-6054-dcc7-6ce4-19ae58ff051b@linux.vnet.ibm.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 30 Sep 2020 08:56:48 -0700
Message-ID: <CACWQX82GoSTjD9=2rrWxxjGbsOZ1EiX0GLf=osFvv=2RJr8f9w@mail.gmail.com>
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 30, 2020 at 8:05 AM Ratan Gupta <ratagupt@linux.vnet.ibm.com> wrote:
>
> Thanks all for providing the suggestions
>
> Currently Redfish Ethernet interface is not having the concept of
> pending and configured values,That means if we use the EthernetInterface
> schema, User can only see the configured values, There is no way through
> which user can see the pending value, We need to come up with some REST
> API to show the pending values.
>
> To solve this problem, Redfish has bios schema whch has the pending
> attributes as well as the configured attributes

Did not realize that about the Redfish schema.  Sounds like we need both then.

>
> How about using the Redfish Bios schema for front end and Bios-settings
> manager as backend to make the things simpler?

I'm not quite following.  Are you saying put the pending settings in
the webserver?

>
> Ratan
>
> On 9/24/20 9:06 PM, Ed Tanous wrote:
> > On Wed, Sep 23, 2020 at 2:26 PM Patrick Williams <patrick@stwcx.xyz> wrote:
> >> On Wed, Sep 23, 2020 at 01:51:33PM -0700, Ed Tanous wrote:
> >>> On Wed, Sep 23, 2020 at 12:24 PM Patrick Williams <patrick@stwcx.xyz> wrote:
> >>>> On Tue, Sep 22, 2020 at 02:39:04PM +0530, Ratan Gupta wrote:
> >>>>
> >>>> It is unfortunate that org.freedesktop.DBus.Properties doesn't have a
> >>>> way to set multiple properties as the analogous operation to 'GetAll'.
> >>> It was proposed we (OpenBMC) add one while back.  I think it muddies
> >>> the water of what it means to be a method call, and what it means to
> >>> be a property, especially for the use case that it was being proposed
> >>> to cover.
> >> I'm not sure why it would be considered mudding the water.  All property
> >> Get/Set/GetAll operations really are just a method call under the covers
> >> anyhow to org.freedesktop.DBus.Properties.  I do think that ideally we'd
> >> get the method added directly to that interface because then the DBus
> >> bindings will support it natively.
> > Mudding the water of when to use a property, versus when to use a
> > method call (yes, properties are method calls underneath).  If there's
> > a method call, the dependency between the parameters is documented in
> > the interface, with a SetProperties method call, it isn't, and you
> > have to rely on just knowing, or it being implementation defined.  In
> > those cases, I'd much rather the itnerface make the jump straight to a
> > method call, and skip properties entirely.
> >
> >> I forgot the mention this again, but another way to solve it is similar
> >> to xyz.openbmc_project.Inventory.Manager where you take a fully (or
> >> partially) formed object as a method parameter and the process which
> >> hosts Inventory.Manager hosts the object.  Settings could be done the
> >> same way.  The issue is, again, having other processes know when to use
> >> this new method and when to just update properties.
> > This tends to be the pattern we use.  My usual take on it when I see a
> > new interface is, if the create method exists, use it.
> >
> >>>> When all of our DBus objects were serial we likely never had this issue
> >>>> because the request to read the properties (to send to the hypervisor)
> >>>> would come behind the signal and subsequent property updates.  Now that
> >>>> we're moving towards more ASIO we likely will see this kind of issue
> >>>> more often.  I don't like it but we could certainly proposal a
> >>>> 'SetMultiple' extension to org.freedesktop or create our own interface.
> >>> If you have properties that need to be set in lockstep with one
> >>> another to be valid, I suspect that indicates that properties are not
> >>> the right tool.  Redfish hits this a lot, where each resource is
> >>> expected that any property is modifiable independently, and certain
> >>> implementations need an atomic "unit" of update.  bmcweb doesn't want
> >>> to have to cache properties that are collectively invalid right now,
> >>> but might become valid in the future, so there's an impasse.  Who
> >>> keeps the state while it's invalid?  Thus Far, that falls to the
> >>> dbus-daemons to store.
> >> Agreed.  This has also been a general statement  we've made in reviews
> >> for new interfaces.  "If you need to update multiple properties, use
> >> a method; if you are just updating a single property, update the property."
> > +1
> >
> >>>> We could define an interface to implement something like Proposal #1,
> >>>> but we would need a new interface and not a property we tack onto
> >>>> existing interfaces.  We'd probably need to revisit a lot of our
> >>>> interface definitions and see which ones typicallly have multi-property
> >>>> updates and does an intermediate state leave us in a bad situation.
> >>>>
> >>>> Specifically for BIOS/Hypervisor settings, I mentioned before that it
> >>>> isn't clear to me what the proposal is for applying Pending to Current.
> >>>> Again, this isn't general, but we could define an interface specific for
> >>>> BIOS/Hypervisor settings which has a way to indicate 'Pending
> >>>> transaction is complete' (set by entities like Redfish) and 'Pending
> >>>> values applied to Current' (set by entities like PLDM).  For the current
> >>>> settings-style values though, this requires external interfaces to
> >>>> somehow know that the setting is associated with the Host in order to do
> >>>> the application, since BMC-owned properties won't have or need this.
> >>> Dumb question: Does anyone actually need to know the "current" value?
> >>> Redfish certainly would need to return  the "pending" value in all
> >>> cases, as it's required so the restful API emulates ACID-like
> >>> compliance to the user.  Could we just have an optional interface that
> >>> indicates "values might not be loaded yet" and simplify the dbus API a
> >>> little?
> >> I think this is generally for humans in the case of BIOS settings.
> >>     - "What is the setting my system is currently running with?"
> >>     - "What will happen next time I reboot?"
> > I wonder if we could make a logging API for humans to use, and keep
> > the "present" things off dbus.  It seems like it would simplify the
> > implementation quite a bit. <thinking out loud a little>
> >
> >> I don't know how this is modeled in Redfish.
> >>
> >> --
> >> Patrick Williams
