Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4740730F319
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 13:27:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWd8m19Q7zDwhX
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 23:27:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92c;
 helo=mail-ua1-x92c.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EIj7hi/X; dkim-atps=neutral
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWcxY1FK0zDrQP
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2021 23:17:20 +1100 (AEDT)
Received: by mail-ua1-x92c.google.com with SMTP id 67so871827uao.1
 for <openbmc@lists.ozlabs.org>; Thu, 04 Feb 2021 04:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XBy83A4xOxzEs+u1beWhKgowZoxpaQ/Eg6D1EWmonEE=;
 b=EIj7hi/X3NMpl6Er27UCxsZ/ypIkVfPAWmdpId3BpV/tylCHQGrwFO5QrJksIFyLId
 DXG21vkzFDbn6KC9aeHaV21ti5AyQyPGH4kihDspwUyoWVtITznNyrzAipuqxWs30yim
 vIRY+5Mqk2jkICqdXXRI2LnuRPelM+PKLjeqESIw1ROr/82W2YySYgGg+Fv9VHMt3F5s
 IqpJ2OGxyXHwpDuTbTtwpw497KlZLQMNOxImpUkQAeSgD8CwfqM0hAsk8fgdMLbWLmbd
 HqyvQ5O0J1z68HyyC/miQObu4fcD36A/OtG4g0syrrlIaj/4zTCWPMxKZ+ESO7338jBA
 aUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XBy83A4xOxzEs+u1beWhKgowZoxpaQ/Eg6D1EWmonEE=;
 b=XwsKvN399xlCuZBUOJmvQ+HGlhgloXAaFbWfMRRdOfyylm9xR9byQUYDmIlSCDo2pw
 0umJHz3QvUVRGuYMsTyByAJhFjgimUOktgxPsDfvKYCCsMGLncvHjWLe+LUjww4qZwoM
 0T5hvXInfP17xSz/k8+mJYfs6Awd8OV8pFHNchTfKpSwrSjnmJOcSFMxMDgk7QOdA+q3
 GZV+1CaZyB/fqwFSC4ABQYK8cGozKvKAVcoWe7lHhF28K6e2cnyasM6W0ymdFwmn9ruB
 chteX9Wrfw1Ap+27VRGIn42aUMMpeHjnuqNkxU5rvEUscJ2Nd/1OAJYDP4TG7qrYPYBR
 FYWg==
X-Gm-Message-State: AOAM530ACQB2msHg22poGppFe3HvA+5J30NuKjWyku+6R0sMypXIzU1g
 Y+FfrJ/uvisSC1oxSVqe4myAaOpEgjoJNKbsrRo=
X-Google-Smtp-Source: ABdhPJy+oSiapgfIjCgdqb8TxWCF4An+PQW8j7XUMG5vo4BeEpk9NJ7ChrxdRs/OjrBSMAZKZsfnbsSXfANzEjsSXD4=
X-Received: by 2002:ab0:224e:: with SMTP id z14mr4863098uan.48.1612441034727; 
 Thu, 04 Feb 2021 04:17:14 -0800 (PST)
MIME-Version: 1.0
References: <CAM=TmwXhvPaVfrugd__e8gmgaRw8YBuO9DwhAiRKm+iAUP=KbQ@mail.gmail.com>
 <48BA3AB4-40C7-4A0D-A370-06B8C9B94235@getmailspring.com>
In-Reply-To: <48BA3AB4-40C7-4A0D-A370-06B8C9B94235@getmailspring.com>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Thu, 4 Feb 2021 17:47:03 +0530
Message-ID: <CAM=TmwWngpHdEMHhq-GKba=T5uH6bbZey=wdp0NQr5oB95n_Xw@mail.gmail.com>
Subject: Re: Progress Codes in BMC
To: manoj kiran <manojkiran.eda@gmail.com>
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
Cc: "kunyi731@gmail.com" <kunyi731@gmail.com>, "ed@tanous.net" <ed@tanous.net>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "anoo@us.ibm.com" <anoo@us.ibm.com>,
 "gmills@linux.ibm.com" <gmills@linux.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "vishwa@linux.ibm.com" <vishwa@linux.ibm.com>,
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
 "vijaykhemka@fb.com" <vijaykhemka@fb.com>, "wak@google.com" <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Manoj,

On Thu, Feb 4, 2021 at 3:53 PM manoj kiran <manojkiran.eda@gmail.com> wrote:
>
> Hi Deepak,
>
> On Feb 4 2021, at 3:04 pm, Deepak Kodihalli
> <deepak.kodihalli.83@gmail.com> wrote:
>
> > Hi Manoj,
> >
> > On Thu, Feb 4, 2021 at 2:17 PM manoj kiran <manojkiran.eda@gmail.com> wrote:
> >>
> >> Hi All,
> >>
> >> Thanks to everyone for all the implementation ideas on this thread.
> >>
> >> After understanding all the inputs from the community , we were
> >> planning to proceed forward with using the existing infrastructure
> >> provided by phosphor-host-postd, phosphor-post-code-manager repo's &
> >> leverage the BIOS POSTCode Log service to do the job.
> >>
> >> The plan is to start with minimal working pieces. On the first go we
> >> are planning to come up with patchsets that will do the following:
> >>
> >> 1.Come up with a compilation flag & make sure phosphor-host-postd
> >> still hosts the dbus interface even if it does not see the snoop port.
> >
> > Is there a benefit of using phosphor-host-postd as opposed to pldmd
> > implementing the Boot.Raw interface (i.e if you take out the snoop
> > part, does it do anything else than just hosting a D-Bus object)?
> > Post-code-manager should still work as-is. If you use host-postd for
> > this and if pldmd makes a D-Bus call to write Boot.Raw as a client,
> > that seems like one additional D-Bus call to get a code out via
> > Redfish.
>
> Agree, as far as i understood there is no added benefit as such in using
> the host-postd. We are just using it for hosting the dbus object.
>
> But in IBM systems, its not just the host firmware but we also have
> couple of applications in BMC that would want to send these progress
> codes during the early boot sequence. In that case, would pldm be a
> right place to host this interface ?

I wasn't aware of this based on your previous email, but in this case
it makes sense to have a single owner of the progress code object,
which could be host-postd.

Thanks,
Deepak
