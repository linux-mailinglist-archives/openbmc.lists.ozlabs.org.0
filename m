Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EE7446ABD
	for <lists+openbmc@lfdr.de>; Fri,  5 Nov 2021 22:59:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HmDtr40Dsz30G6
	for <lists+openbmc@lfdr.de>; Sat,  6 Nov 2021 08:59:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jEmJC7ak;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32e;
 helo=mail-wm1-x32e.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=jEmJC7ak; dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HmDtR6L2Sz2yXv
 for <openbmc@lists.ozlabs.org>; Sat,  6 Nov 2021 08:59:09 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso10547780wmc.1
 for <openbmc@lists.ozlabs.org>; Fri, 05 Nov 2021 14:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ez///DVX5RnLV95tvvrIypjLV0fmAbp7utKBgcWdA5k=;
 b=jEmJC7ak8WGLHXLhhueX3MQ3axr9rP/IVZXD++8f46uQ4uy++TSsSq6LO5PXm6GXxO
 tBoLhZQJMirHv4sDqaoc76zBZjduWemQrRPhVDluw8qt5o6T8DnivzNLr0JBhrgnMcr9
 v8PmKM1sOyjXBk8ryM4CWgnog4xeZJJSB+c8JfQqedKqrIsMySHMOO1Pd27s8anjbixQ
 v6O55lKj54YdLAd6kh7aZ5829YSTnV6BjJPvhybgSmYRWdNxx2P7sJIfCxZHdfAjlkH0
 tvj6Q29R62eP4Ejl+uf0F9COVMrFCLo1a18ntEKQwAivuqxckNRjaV4kVo6Q8W04JE4O
 zQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ez///DVX5RnLV95tvvrIypjLV0fmAbp7utKBgcWdA5k=;
 b=R43LhBzMBEhOx7pmDDnnW/s21HGuZJUpBQS+QZXHhaZrL6w8vhtBmn6q4mWWuOLM5O
 CYTufY7Ydab11YZhliHsXN6AkiCPgjGLQm8RIUX/pjKBETvgDhhQw3imHsUAnK+0L3hU
 uqszxTGPE6jfG7W2aFDvdAO4lc/IPrqsMvtoQEKd4qZBHfMa5JpYxKOcE8nmaUKxLYyo
 5XlXcA9QoPkVcU4GeITPAV/DRbxOotSybgyE+biKPfJcDB1KyPSzuYZLbwRpj6/F3jGA
 MaqUqOW5qmKSktBx1e+g/GRG3gi6nNPTDsFdSLtID0BkNXEaWHN4/McKuyeIH7283bTp
 jI5g==
X-Gm-Message-State: AOAM533xFc0CMXjt5rZtNVkrFILVvHpS/hGJYgxH4Jo4dvz5QRyzZCjG
 4WZdR4GT//xElYZ0oP7IbsEm20tI7hQlOiYNQaA56Q==
X-Google-Smtp-Source: ABdhPJyLUp9OCmi/CUbzIuvSsUZ97RcktpKaVpu7dh79HKbXzZ6p9kqUETnLSJREHpn2krXJSE4Wy5SjBXYI5DxibgM=
X-Received: by 2002:a1c:1fd6:: with SMTP id f205mr34270673wmf.98.1636149542553; 
 Fri, 05 Nov 2021 14:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR03MB3089CFCA31102DE7BB551413F5BE9@HK0PR03MB3089.apcprd03.prod.outlook.com>
 <b71bb325-cf41-deab-5422-11520f85cc55@linux.ibm.com>
 <YXBPMNi5yzzEtE/R@heinlein>
 <CACWQX83=F77Rh=oGJWRd9SkhqFoik-duLGJdVpaU2E+SBgWXQQ@mail.gmail.com>
 <YYROU4ar31l9iibj@heinlein>
In-Reply-To: <YYROU4ar31l9iibj@heinlein>
From: Ed Tanous <edtanous@google.com>
Date: Fri, 5 Nov 2021 14:58:51 -0700
Message-ID: <CAH2-KxC6Za+ZfCL9_WnyPmoAh9Tb16kk2rz0eZRJrn8hdH8mmQ@mail.gmail.com>
Subject: Re: [phosphor-logging] About the "Stop emitting Entry propChanged
 before ifacesAdded" change reason
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, CS20 CHMa0 <chma0@nuvoton.com>,
 Matt Spinler <mspinler@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Nov 4, 2021 at 2:19 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Thu, Nov 04, 2021 at 12:39:05PM -0700, Ed Tanous wrote:
> > On Wed, Oct 20, 2021 at 10:18 AM Patrick Williams <patrick@stwcx.xyz> wrote:
> > >
> > > On Wed, Oct 20, 2021 at 10:13:06AM -0500, Matt Spinler wrote:
> > > > values, and then explicitly emits the IA signal.   Others can chime in,
> > > > but I didn't see it as proper D-Bus behavior to emit propertiesChanged
> > > > before InterfacesAdded, since in fact no property is changing after the
> > > > interface was added.
> > >
> > > Correct.  PropertiesChanged signals should not show up before InterfacesAdded.
> >
> > But they should still show up eventually (after the InterfacesAdded),
> > right?
>
> I'm not positive what you're asking.  Does it happen or should it be done?  What
> I tried to describe is what correct behavior would look like.
>
> My understanding is that if you don't have a service name, no signals will be
> emitted.  I don't recall where I've seen that in code before.
>
> If you have a service name, but the object does not have an object manager in
> the path, then no InterfacesAdded signals will be emitted.  Many processes put
> this into the root, so this isn't an issue.
>
> PropertiesChanged and InterfacesAdded are independent from a sd_bus perspective
> (and they belong to two different Interfaces anyhow).  If you call
> sd_bus_emit_properties_changed before calling sd_bus_emit_interfaces_added or
> sd_bus_emit_object_added you will still get signals emitted for the properties
> changed (I confirmed this in the systemd repo).
>
> There is no queueing or deferring of the PropertiesChanged signals until after
> the InterfacesAdded.
>
> To me, it does not make any sense to emit signals for PropertiesChanged prior to
> actually informing the world that the interface exists via InterfacesAdded.
> You'll end up sending out signals for properties which nobody even knows they
> exist anyhow.
>
> It is _also_ a bad idea to send out InterfacesAdded signals before you have
> fully constructed and initialized your object.  This can cause other processes
> to act on the property information they received via the InterfacesAdded signal
> but with half-constructed / invalid property state.
>
> > The patchset here seems to be under the impression that
> > PropertyChanged is never emitted when the object is added, which seems
> > incorrect, or at the very least is a breaking behavioral change.
> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/48231
>
> The PropertyChanged signal is only emitted if the property changes *after* the
> object was fully formed (by sending out its InterfacesAdded).  The
> PropertyChanged signals are not queued up from the time the object is first
> added until after InterfacesAdded is emitted, which is what it sort of sounded
> like you were implying might happen.
>

My only concern here is that this would require everyone that
implements a Log to implement ObjectManager, which might be
reasonable, but we should document as part of which interfaces
actually REQUIRE ObjectManager.  As written, the above patch would
break if a logging implementation chose to not implement
ObjectManager, which I think is legal in the dbus interfaces today.
This I think is the first place where we would explicitly require an
object manager (maybe we did before for sensors?).

> I'm not sure why you are saying it is breaking behavioral change, other than it
> might have use to work this way, but that way it use to work didn't make any
> sense from a dbus perspective.

I say breaking change as in there was a user facing feature that is
now broken because of this patch.  I'm not making any statement about
which is correct in terms of the dbus interface.  Maybe "regression"
is the better word?

> This proposed change in bmcweb seems
> conceptually reasonable.
>
> --
> Patrick Williams
