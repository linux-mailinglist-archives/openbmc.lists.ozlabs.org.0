Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8098E2DD692
	for <lists+openbmc@lfdr.de>; Thu, 17 Dec 2020 18:49:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxfdM6z55zDqWN
	for <lists+openbmc@lfdr.de>; Fri, 18 Dec 2020 04:49:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=CFfbz5Dz; dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cxfcg3383zDqTb
 for <openbmc@lists.ozlabs.org>; Fri, 18 Dec 2020 04:48:49 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id t13so26519156ybq.7
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2020 09:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xdNIeldSr5WZhPNus1nlFN6l+aFkGkRJ+Qs1ZQT+RGw=;
 b=CFfbz5DzNqhVtdAa5M8vdw9WusF1I+XPyLAhyHZOjoOyP1tFO/p33t+jF8AV1fTGxV
 Z7IqmFx74xGGtpNEuapWTlbk4UtRyUJGHvt2g3Xi1XuJfrb6wHs8vMM4PQdF9jKcH57W
 0vsVHYjAopXlomjA5Mky0O7sJ0uAaLicCZ5+8rkNXAP2xzTzKFdB993tQKPMB7P8JfYu
 MxpC55z+P3FRykDfxJYWjNNkRapQhHtgpye+fC+F6RTX4IMIVLUUMhgppLzliYg65YVV
 qqpyYYJs4svVLoJFRkLT3vlV4qKHzJhrQB33YVRoPqgPIIXtrqRWmIEAOXyPsoJtuhkl
 j9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xdNIeldSr5WZhPNus1nlFN6l+aFkGkRJ+Qs1ZQT+RGw=;
 b=nlslhV5C/LUogpiNefKH04QZ4i8s4RbkTHGa/DYHN25/PE3yfTiZ+NZ3173QOkYyce
 P1+h252xwXJVhMYnehyKDiZbaS/MScKr38ob7ni4JBR6Km0XNGVGguY3SAOjGDf4saxS
 BLEyaXfAX9olmVAcYbm3OoM3Uzsjkflie+GPsqUk0X9/dRhvPoaIz9fFDoW4scx198bT
 lE1isZPRqqzvv/NDEDYDrknEKlzyoTa06KM/mXOkVTtJizfRmDoOZikit/aysRcy+aYg
 8YNBG4acdDNklI6a7xcrFQ84Syyhx+mVcgHOlTZwnDpqDDmZ1uz7UBpbxc2r/M/I8Z/B
 Oc9A==
X-Gm-Message-State: AOAM533F5nvT+vpGomShkBXg6ayLPre+fQQlQg0pjzY/HUzoyPYjse5I
 TNU9RLXuOex67Rg43NdQrzXY0Zph7Gl5yNPp1AhBTqoHG2DRkg==
X-Google-Smtp-Source: ABdhPJx8EppiqCU1ZvrCUok8qua/4fDtVTzekGaY4zOBzWO3/yNB4MAvhv+8PwR5Az7KK6ny87ZDHlxPqfTshvUAugI=
X-Received: by 2002:a25:d4e:: with SMTP id 75mr376410ybn.340.1608227325170;
 Thu, 17 Dec 2020 09:48:45 -0800 (PST)
MIME-Version: 1.0
References: <1bfe87ea-9fc5-8664-d1de-d3138616a427@linux.ibm.com>
 <CACWQX83Rc1pTmPbv9xhca-mMyGHenrVbj0a9oikOxHPy=XFxQA@mail.gmail.com>
 <83f68884-9e4a-7d5f-18b9-f054de0ab4ed@linux.ibm.com>
In-Reply-To: <83f68884-9e4a-7d5f-18b9-f054de0ab4ed@linux.ibm.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 17 Dec 2020 09:48:33 -0800
Message-ID: <CACWQX836ecUwRnHn8pUQNfvKjxcd+_2fLh3v0vqjGk47iToyuw@mail.gmail.com>
Subject: Re: Proposal add PerformService privilege
To: Joseph Reynolds <jrey@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Dec 17, 2020 at 9:31 AM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
> On 12/9/20 12:25 PM, Ed Tanous wrote:
> > On Fri, Dec 4, 2020 at 12:13 PM Joseph Reynolds<jrey@linux.ibm.com>  wrote:
> >> This is a proposal to add an OemOpenBMCPerformService privilege to BMCWeb.
> >>
> >> Seehttps://redfishforum.com/thread/397/redfish-direction-update-eeproms
> >> As mentioned in the Redfish forum thread, the use case is that some
> >> OpenBMC use cases require isolating manufacturing and service functions
> >> away from the customer/admin (including updating FRU serial numbers, and
> >> updating a permanent MAC address), and this is a Redfish compatible way
> >> to do it.
> >>
> >> The work items would be like:
> >> - Add this OEM privilege to the base BMCWeb implementation.
> > Can you talk through how you would do this mechanically?  Today, we
> > rely on privilege registry (published from DMTF) to guide these roles
> > and urls.  Now that you've invented a new role, how do you plan on
> > fitting that in?  Will it be required for all systems?  Will it be
> > optional?  Will it only apply to OEM schemas?
>
> Note: Around the same this this email was sent, we discussed this in the
> Security working group 2020-12-09, with minutes here:
> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI
>
> Here are the basics of the low level design:
> #. Enhance redfish-core/include/privileges.hpp -- add the new
> "OEMPerformService" privilege.
> #. Enhance redfish-core/lib/roles.hpp -- add OEMPerformService to thje
> existing Administrator role && add the new "ServiceAgent" role #ifdef's
> by a new config option.
> #. Modify the privilege map for individual operations as appropriate to
> require the OEMPerformService privilege.
>
> However, you are correct that this may not be the best approach. See below.
>
>
> >> - Identify URIs that we need to be able to isolate away from
> >> customer/admins.  Then modify the privilege mapping to require this
> >> privilege to PUT to those URIs.
> > What URLs have what privileges is already defined by DMTF in the base
> > privilege registry.  What you're talking about would require a
> > customizable privilege registry, which definitely needs some
> > significant thought, as the current privileges mechanisms in bmcweb
> > are very static today.  Just "customizable privileges registry" is
> > probably a design on its own, and would likely need to land before
> > adding OEM privilege levels.
>
> That makes sense.  However, some URIs are outside the scope of Redfish
> including:
> - The URI named by the Assembly BinaryDataURI property.

Do we support this yet?  It seems like the BinaryDataURI would follow
the same permissions as the equivalent property/resource within
redfish.  With that said,

> - Various manufacturer-specific REST APIs.
This confuses me a little.  Manufacturer specific rest APIs will have
their own privilege/authorization systems, similar to how IPMI has its
own privilege system.  While they're related, the other manufacturer
rest APIs can apply whatever permissions they like.  Within redfish,
they would appear as something like "OEM<Company API name>Privilege"
and be orthogonal to Redfish privileges, as it's a totally separate
API;

>
> >> - Add this privilege to the Administrator role (but not Operator or
> >> ReadOnly).
> > If we're adding this privilege to the Administrator role, how does it
> > differ from ConfigureManager role?
>
> The main idea is that the Redfish-defined Administrator role *by
> default* has all Redfish standard privileges.  But I don't think this
> applies to OEM privileges, so I am re-thinking this point.
> My point remains that I need a separate OEMPerformService privilege;
> having this privilege enables my Enterprise Server system to remove this
> privilege from admins, and give it to my service agents.
> I'm not sure if I understood or answered your question.

"I need to create a new privilege and apply it to certain endpoints"
is a use case covered by Redfish and well understood in a fully
functioning PrivilegeRegistry implementation.  We just don't have a
configurable privilege registry setup yet.

>
> >> - Document how to isolate these operations.  Specifically, remove this
> >> privilege from Administrator, and create a custom OEM role that has this
> >> privilege
> >>
> >> What do you think?
> > I think we've got a couple designs that would need to land ahead of
> > this before we'd have the infrastructure and documentation to build
> > something like this.
> >
> >
> > The designs I see coming before this are:
> > Static PrivilegeRegistry implementation
> > modifiable/dynamic Per-URI privilege registry implementation
> > modifiable/dynamic Per-property privilege registry implementation
> > OemOpenBMCPerformService registry added.
>
> Yes, we discussed this in the workgroup call.
>
> Specifically, we discussed making a better privilege registry
> implementation.  Redfish (DSP0266) defines an operation-to-privilege
> mapping and is represented as a Privilege Registry.
>
> BMCWeb currently implements the Redfish authorization model as a mapping
> from URI -> HTTP verb -> privileges.  The privilege overrides are
> hard-coded in C++ in each operation handler.
>
> If I understood this correctly, the first step is to enhance BMCWeb to
> directly use the published Redfish PrivilegeRegistry (such as
> Redfish_1.0.4_PrivilegeRegistry.json).  Elements includes:
> - Add new build step to convert the PrivilegeRegistry file into C++ code
> that implements the authority checking.  The main ideas are: a
> downstream implementation can easily customize their PrivilegeRegistry
> and it will automatically build into the code. And performing the
> authority check must be fast and efficient.

Sounds exactly right.  When we first wrote the existing privileges
system, we actually had a script that automated this, but that was on
an old machine that's now defunct, so it's probably gone and certainly
out of date.  With that said, it was a trivial amount of code.

> - The set of privileges is part of the Privilege Registry, and its
> implementation should be enhanced accordingly.
> - Handling the basic "privilege and and or syntax clauses" is
> straightforward.

The existing privileges system is already set up to handle and/or
clauses per the redfish schema, you just need to generate the correct
set of bracketed C++ structures (same as you see in the Node class)
for it to read in.

>  Handling Resource URI overrides seems
> straightforward.  Handling property overrides I need to think about
> more.  And I am not aware that BMCWeb has any Subordinate overrides

Yep, the per property stuff gets hard, as we don't really do "per
property" code.  In the next few years of Redfish development, I
suspect this problem will come up more and more and we'll need to
start breaking out individual properties into their own little world.

> - All the overrides can be build-time configurable; I do not need
> dynamic changes to the privilege registry.

Sounds good.

>
> I plan think about this over break,and have a proposal in January 2021.
>
> Thanks!
> Joseph
>
> >> - Joseph
> >>
>
