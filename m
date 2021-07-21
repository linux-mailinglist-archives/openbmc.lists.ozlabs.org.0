Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1751C3D1138
	for <lists+openbmc@lfdr.de>; Wed, 21 Jul 2021 16:24:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVHrm6nxLz30D9
	for <lists+openbmc@lfdr.de>; Thu, 22 Jul 2021 00:24:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=h5+2GAJE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::333;
 helo=mail-wm1-x333.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=h5+2GAJE; dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVHrX01GMz2ykR
 for <openbmc@lists.ozlabs.org>; Thu, 22 Jul 2021 00:23:53 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id
 p15-20020a05600c358fb0290245467f26a4so1099262wmq.0
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jul 2021 07:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=otBxUhdHRaNUlB5OVrdRWhMiEn1Kcyj/u+gqaSmN4Z8=;
 b=h5+2GAJE49AKicUM10MBaU1Z4u5ooXEIDixwWuuZecT45YgU7izbJ8CzuEyd5fLNvg
 KUhFQuCCw3/thhbkG9VPVfdjppqbjWL40jeDKgzxbkfLnkIqhCEttndFY9bPSeRbnp4n
 F6285wNJjzRWcdxpZDMTUHk5ckaoTg3iNHXi7FKjTz2Ff3O3FCuiOuugJUc4E/o5559X
 OR26lwJWxh+yFjbeOfAxJQ0BarN0OrTOj8CN103QDS05by7tFiyh2PTEQEmweUardaDo
 0Qky1OUdykX6uA6AivJ5S6x55cgc5AbTnzGr7xsL/wRT0P4kbWS51FMpb2Ly9DX7gL7O
 eXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=otBxUhdHRaNUlB5OVrdRWhMiEn1Kcyj/u+gqaSmN4Z8=;
 b=abEmo2Kk+Vgp4T35J0MEERG3NzL2sEsORVhrocLVuZOtSvfp7c9zMncbOBD8zH5TN3
 qoH0pOvMYzJZWyrCkRJaJwcOHSO7qbufYy5bWDFPeGB6NX8bS2f6hQndjf/+cELsGnMg
 a4/D/ZeRaj6OkOUHfIvvDksPQso0AT1F/eLnpE0CYwZDAxGqhaA5CWaqyfuxfg/ZhBxH
 8VXHs0mT5HN7Z3055FkU7NKZRyXjebiL02zNkxWHVWHIuvduMeQomIBEZPm4FkF4c5Sh
 8fzZUBs8ddhnrQlXHhvliGR3AfHsS2vsmcE905l1pMkvsfMXKBCkUCF/5rXVxsfu2n3/
 tnsQ==
X-Gm-Message-State: AOAM531g25t+Xns59EfT1AOLKsf3xEJ77nM+mpoXx6vabvcqTW/KC5fW
 X0thcebwhThcbgfgL8l4ks/lv5N+LEK226jrNAMc/A==
X-Google-Smtp-Source: ABdhPJyUf50UDMShtl685b6Sv3mhn2s9MOW5XwIz3/DcxKCMPfOYpL6tNjcNxL1EKd1m0MJMfsXhC5TfKzSDbhXR+c4=
X-Received: by 2002:a7b:ce95:: with SMTP id q21mr4329396wmj.101.1626877429582; 
 Wed, 21 Jul 2021 07:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <DF4PR8401MB0634B89E3FF275E28FB590CC8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <CAH2-KxB5=VQ16c6Cabik6T3HRMNw-R+r8EStpLu-hpgqGtnO-g@mail.gmail.com>
 <CAM=TmwWJ58RaUhjW9axXdyPDSsePG0zQsnxh-FKSj4C5nZG0Kg@mail.gmail.com>
In-Reply-To: <CAM=TmwWJ58RaUhjW9axXdyPDSsePG0zQsnxh-FKSj4C5nZG0Kg@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 21 Jul 2021 07:23:38 -0700
Message-ID: <CAH2-KxCxy0G6cYRPkOKe+YQBX1h7No--fn7JLDz4yskwTMjyOw@mail.gmail.com>
Subject: Re: RDE Enablement
To: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "Garrett, Mike \(HPE Server Firmware\)" <mike.garrett@hpe.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jul 21, 2021 at 1:34 AM Deepak Kodihalli
<deepak.kodihalli.83@gmail.com> wrote:
>
> Hi All,
>
> On Fri, Jun 11, 2021 at 2:02 AM Ed Tanous <edtanous@google.com> wrote:
> >
> > On Thu, Jun 10, 2021 at 1:26 PM Garrett, Mike (HPE Server Firmware)
> > <mike.garrett@hpe.com> wrote:
> > >
> > > Greetings,
> > >
> > > I'm am interested to know if there has been any organized discussion =
or development on Redfish Device Enablement (RDE - DMTF DSP0218) for moving=
 encoded Redfish data across PLDM/MCTP interfaces.  We are interested in pr=
omoting this standard and are willing to lead a reference implementation fo=
r OpenBMC if there is not yet something in progress.  If there is something=
 in progress, can you point me at the work because I would love to see it.
> >
> > We are interested in this as well, although we are in the early stages
> > of looking into it.  Ideally we'd like to have OpenBMC support add in
> > cards (NICs, Accelerators, ect) that supported this functionality, and
> > make that data available to the normal OpenBMC channels
> > (Redfish/ipmi/ect).
>
> I had a couple of questions on RDE, and I wonder if this has crossed
> your mind as you started looking at RDE, or if this is
> misunderstanding on my part:

As a preface, you might consider asking these questions on the DMTF
forums if they're not specific to OpenBMC.  The authors of the RDE
spec are present in those places and generally have good answers for
what the "intent" was.

>
> 1) I understand the problem RDE tries to solve in terms of avoiding
> having device-specific knowledge/code on the BMC, but doesn't PLDM
> also solve a similar problem? For example, if a device supported PLDM
> Type 2 (and other PLDM specs such as the one for FRU, etc), the BMC
> could convert PLDM to Redfish. I understand this may not be as
> convenient as RDE but it still solves the device-specific code
> problem, PLDM being a standard protocol as well. Am I missing
> something here? Is it just that RDE is more convenient than PLDM to
> Redfish conversion, or is there more to it - for example, PLDM
> can't/isn't intended to be converted to Redfish, in an
> effective/lossless way?

From my limited knowledge, it's because RDE can be losslessly
converted to Redfish, and the BMC can take the form of a proxying
agent.  In the PLDM to Redfish model, the BMC would need upfront
knowledge of every interface in PLDM, and how it maps to the Redfish
tree, which could get onerous.  In the RDE model, embedded controllers
end up taking the same form as an individual server would to a redfish
aggregator, which is advantageous in that all the aggregator code can
be reused (if OpenBMC had an aggregator).

>
> 2) Is RDE specific to a class of devices? Some of the documents I see
> stress on I/O adapters. Would be it odd to implement RDE on devices
> like Accelerators, CPU, etc?

RDE is meant for devices with a small footprint.  There has been
discussion in the past about allowing it on the host interface for
standard out of band communication, but I don't think that ever
materialized.  Putting it on accelerators or CPUs seems logical to me
given that their controllers are small footprint.

>
> Thanks,
> Deepak
