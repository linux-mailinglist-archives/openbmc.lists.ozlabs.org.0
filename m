Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF285A6D5
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2019 00:21:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bB7g142DzDqw1
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2019 08:21:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JU2k905x"; 
 dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45bB760C73zDqfj
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jun 2019 08:21:04 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id cl9so3977897plb.10
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 15:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z+Sjxb7iEo59RtCdLnIy5VkYwjdNmf7MrAXsgILaatQ=;
 b=JU2k905xHhPZoF+j4m3vc3bhGOUfsfy+ywT5S5eRLWZDhIjrA5T81xpGj6TSnAQRxl
 oywd6NAvBfekaB0dRRWlNiYuiWrcNLxIRornSnyo1wVJgYiTycXsVCys4GrKAdkZ7KjV
 tfvJOKWJQ7RGhV65LBHPUwp7eFi5uwILY4cOiOhiz7kHUuZmvhYwG79ZHq8V9My9W1HY
 j6yVDt3cqq6hb5Kat2coq2I0MRWmCRqiKk5c45yFtoH2Bzn4GjyEtfjkj/YDzvx0IkjM
 HF6PZ2dWxC+MaBNB/3WXg47KEPZrKAzqAA+qiWeZV45NpobYMAk9H3g7E/qMDg4AuKOj
 JfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z+Sjxb7iEo59RtCdLnIy5VkYwjdNmf7MrAXsgILaatQ=;
 b=nyTzjED/op3M7V7Ft/Ba/lHkx4xG5MCNnFKuKKqGue6HzKN2Gy7CqOcp6cgBr/q2N3
 cYO69zRPWCzFbNg9d0VH02xDQRumnGJ/VpiVl7nCPY0MMiAEJrmfpkuAPxJKwCBUqzPP
 w1kVsKKw/SLMD4G55J0wKVUP/UBTd0L7HjJxUQjlmFWvhglxQwAwB1O7EroMmOtWoQQ7
 ow5//HoRK0g/Z/sAbkJRqkn6sVRSbv5rEkjpoiWHogwk7Dv4AINjlTISYZoe9YqLcJPw
 +h8uzn7kD0yNdOGa+sMAahaLg/AQoi1n6N2/nOiKeFLTJj+3VJS3HVAUmJu29Yfd/Zeh
 WXrg==
X-Gm-Message-State: APjAAAUZvcLYP1MgpZPhUqC7AYr9hH9TwkqmM7aLGJGAmIFQk7URG8IS
 bjG7IEspFdc+LaNaT+dX/06mh4jlkfuEj9Gaktz2ug==
X-Google-Smtp-Source: APXvYqw++Cd4ahJ8AR2i79Y0qYY4Rn0bYVHbu4GcuASRrlwFzDL/gS7a/jDoW8wqUqU+uXNdwvm63tPK2KQQ+78Mhwo=
X-Received: by 2002:a17:902:9307:: with SMTP id
 bc7mr13874007plb.183.1561760460381; 
 Fri, 28 Jun 2019 15:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwFhvnF8PEJRAa06PaFc_6Ge4U=Q2eKzdSk26bjatRdfw@mail.gmail.com>
 <87653f09ac5f171ad42bb118e64ba058@linux.vnet.ibm.com>
In-Reply-To: <87653f09ac5f171ad42bb118e64ba058@linux.vnet.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 28 Jun 2019 15:20:49 -0700
Message-ID: <CAO=notxU2_mJYSRVwHa=njcgXdVy+v_iUjMAmL-tj17PbN2Vcg@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash: Next Iteration of Control
To: Adriana Kobylak <anoo@linux.ibm.com>
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jun 28, 2019 at 12:56 PM Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> On 2019-06-28 13:37, Patrick Venture wrote:
> > I was thinking, since I'm going to extend phosphor-ipmi-flash to
> > support updating a BIOS -- it might make sense to make it more general
> > further.  I was thinking about how right now, there are default
> > services you can implement for each thing, prepare, verify, update,
> > and currently we don't install them (although I was going to implement
> > a default prepare service).
> >
> > I was thinking that possibly adoption would be easier if they were
> > targets instead of service files directly and then we'd always install
> > the targets:
> >
> > - phosphor-ipmi-flash-prepare-update.target (always called when
> > starting up a process each time a new process is started)
> > - phosphor-ipmi-flash-verify-bmc.target
> > - phosphor-ipmi-flash-update-bmc.target
> >
> > Then a user can just install their services into the targets and not
> > have to really worry about doing anything more.  I think it's equally
> > as usable as before, but ... I don't know.  This way, it always
> > installs the targets.
>
> Yeah I think it'd make it more obvious to have the targets installed
> than
> having optional services. Also this could allow services to be started
> in parallel, like verifying 2 different images at the same time
> triggered
> by the target (just thinking out loud).

Yeah, someone mentioned needing to run additional services, and
although they could chain them from the initial service, might be
easier with just having a target.  So, I'm going to roll that patch
into review today.  It'll require some recipe changes, but otherwise I
don't anticipate any issues.

>
> >
> > I was thinking about this further and was thinking about how
> > everything is compiled into the application, dynamically/configurable,
> > but compiled in.
> >
> > If it's going to start supporting BIOS, and then later other firmware,
> > perhaps the list of Blobs and their associated actions should be
> > configured via json.  There is a limitation to this though that if
> > that's the case, then the ActionInterface used for different things
> > would really just become a SystemdActionInterface and we'd use
> > services to control everything.  In theory, the json could specify the
> > ActionInterfaceType from a list and the parameters after that point
> > would be per type..., but I think that's getting a bit easy-to-break.
>
> Yeah, maybe we wait to see if anybody would prefer not having to compile
> the
> tool with the available options.

Yeah.  I'll play around with it a bit and submit patches next week.
Still need to do more testing, and it's missing some tests :)

>
> >
> > Those are just some thoughts I had today.
> >
> > Regards,
> > Patrick
