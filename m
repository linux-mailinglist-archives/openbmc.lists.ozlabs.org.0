Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 076D95A774
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2019 01:16:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bCMS3N8nzDr0T
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2019 09:16:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oiLQCzRW"; 
 dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45bCLz0VR9zDqxD
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jun 2019 09:16:25 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id k13so3219522pgq.9
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 16:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0VIsq0Gw8OQQ/sHGRrTjBpGMcrgjz/6fPH5RnlLltco=;
 b=oiLQCzRWpAZFo8T7TlefP1baK8aBDGaqV8UWYwxpW21MLQFtEBq5MGzX2XkiQrwvsl
 aFumf/1+GbzeSF2+DT2UiQWw+EmiCAI6xfUCYGhpRqW+hFCzypDE0iB3pQm0dB1uCAfX
 HbB9sycjpExjnOysVksDtTAUITD1RBeI5blS2bXDpoYWhusaqPzY1VioIr7kQV5ij9Gs
 Xd8Zfe7gqcEK1bLQQzMksTjiqysmkvPyeqYO5LykjoxDZfkyg1BAV9Ppo1epbkXUWQNI
 H+5NPXZRi2DMmToaUuZo4Q3wC0MSTB2Y95Cq9Z0RehmWo2BGo+yh+v456E2v2OThQGQy
 qRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0VIsq0Gw8OQQ/sHGRrTjBpGMcrgjz/6fPH5RnlLltco=;
 b=UypDKgEtJGwI/VZ16lR+23pHZ0wFJrjQvWn/qN5zc7arIfQ4U5jVymyyLRFsjSI+jj
 RlwO6hjTorxdT6tFCIUfc+4YL8h0oFM1xkM/kQGI3Pogp+8SvZF4zNpibCLj9h3VY9kw
 abB+SZtpBBPz4kKcPgL/LVjUhXQx0MhJpPOAFfuY+jc0ujsH+Iu3Hc9Re62xs4LFLxuV
 yD1itD9Bv/xD3kNode7CIVp+bKbRyRXkdiWljIUuJd28xGjkZKyvNupov9NoD+FuujMg
 qTyQfJxZC7RuLnQjNANsUWet1gH20/MubnH5DklihNmyim+ZM/skJKtddWmAy1wpq89H
 67Lg==
X-Gm-Message-State: APjAAAXCZGYoO4VDi8fLJc6GxuHDQC15BCvUdrzZGbCj4vQi89yhea9K
 Ej/trPqMPr6QzKLjpYrYbzsQCIwn31bMp5rrlsy2Bg==
X-Google-Smtp-Source: APXvYqzbOaYTiS3W1Ju7OnvnnM4i5Q8kurnEQoDPg/5j11XX5899OVgc/XESMxzCzjMR54NsZ8Ai1uUbbppdlMCcPlg=
X-Received: by 2002:a17:90a:23a4:: with SMTP id
 g33mr16561269pje.115.1561763781469; 
 Fri, 28 Jun 2019 16:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwFhvnF8PEJRAa06PaFc_6Ge4U=Q2eKzdSk26bjatRdfw@mail.gmail.com>
 <87653f09ac5f171ad42bb118e64ba058@linux.vnet.ibm.com>
 <CAO=notxU2_mJYSRVwHa=njcgXdVy+v_iUjMAmL-tj17PbN2Vcg@mail.gmail.com>
 <OF1470AD7B.0B11CFCF-ON00258427.007DA575-00258427.007DA57D@notes.na.collabserv.com>
In-Reply-To: <OF1470AD7B.0B11CFCF-ON00258427.007DA575-00258427.007DA57D@notes.na.collabserv.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 28 Jun 2019 16:16:10 -0700
Message-ID: <CAO=notw5XdX8Wg8Q7YyX3CE_B-tsiTYNdok1t-YnZZ9vLUuLKw@mail.gmail.com>
Subject: Re: Re: phosphor-ipmi-flash: Next Iteration of Control
To: Milton Miller II <miltonm@us.ibm.com>
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

On Fri, Jun 28, 2019 at 3:52 PM Milton Miller II <miltonm@us.ibm.com> wrote:
>
> On  06/28/2019 at 05:21PM in some timezone,  Patrick Venture wrote:
> >On Fri, Jun 28, 2019 at 12:56 PM Adriana Kobylak <anoo@linux.ibm.com>
> >wrote:
> >>
> >> On 2019-06-28 13:37, Patrick Venture wrote:
> >> > I was thinking, since I'm going to extend phosphor-ipmi-flash to
> >> > support updating a BIOS -- it might make sense to make it more
> >general
> >> > further.  I was thinking about how right now, there are default
> >> > services you can implement for each thing, prepare, verify,
> >update,
> >> > and currently we don't install them (although I was going to
> >implement
> >> > a default prepare service).
> >> >
> >> > I was thinking that possibly adoption would be easier if they
> >were
> >> > targets instead of service files directly and then we'd always
> >install
> >> > the targets:
> >> >
> >> > - phosphor-ipmi-flash-prepare-update.target (always called when
> >> > starting up a process each time a new process is started)
> >> > - phosphor-ipmi-flash-verify-bmc.target
> >> > - phosphor-ipmi-flash-update-bmc.target
> >> >
> >> > Then a user can just install their services into the targets and
> >not
> >> > have to really worry about doing anything more.  I think it's
> >equally
> >> > as usable as before, but ... I don't know.  This way, it always
> >> > installs the targets.
> >>
> >> Yeah I think it'd make it more obvious to have the targets
> >installed
> >> than
> >> having optional services. Also this could allow services to be
> >started
> >> in parallel, like verifying 2 different images at the same time
> >> triggered
> >> by the target (just thinking out loud).
> >
> >Yeah, someone mentioned needing to run additional services, and
> >although they could chain them from the initial service, might be
> >easier with just having a target.  So, I'm going to roll that patch
> >into review today.  It'll require some recipe changes, but otherwise
> >I
> >don't anticipate any issues.
>
> Unfornately a simple target may be difficult:  Currently
> prepare-for-flash-update may curretnly set a firmware variable that
> requires a BMC reboot to take effect.  In this mode, the initramfs
> copies the file system to RAM during startup so theat the flash is
> available for writing the replacement image.  (Doing this step
> allows the flash to be written while full services are written).
>
> I suppose this could be turned into a target, but it would imply
> a BMC reboot loosing other sessions and may be unexpected.  The
> existing targets would need to be modified to recognise the
> system is in this state and NOP (currently it can not be
> deterimined if you are currently in the state otther than
> unreliably peeking at /proc/mounts).

I'm not entirely sure how this would be different from the case where
a service is executing the things, versus a target.

>
> Not to say having the targets is a bad idea, just that it might
> require a bit more work.
>
> milton
>
> >>>
> >> >
> >> > I was thinking about this further and was thinking about how
> >> > everything is compiled into the application,
> >dynamically/configurable,
> >> > but compiled in.
> >> >
> >> > If it's going to start supporting BIOS, and then later other
> >firmware,
> >> > perhaps the list of Blobs and their associated actions should be
> >> > configured via json.  There is a limitation to this though that
> >if
> >> > that's the case, then the ActionInterface used for different
> >things
> >> > would really just become a SystemdActionInterface and we'd use
> >> > services to control everything.  In theory, the json could
> >specify the
> >> > ActionInterfaceType from a list and the parameters after that
> >point
> >> > would be per type..., but I think that's getting a bit
> >easy-to-break.
> >>
> >> Yeah, maybe we wait to see if anybody would prefer not having to
> >compile
> >> the
> >> tool with the available options.
> >
> >Yeah.  I'll play around with it a bit and submit patches next week.
> >Still need to do more testing, and it's missing some tests :)
> >
> >>
> >> >
> >> > Those are just some thoughts I had today.
> >> >
> >> > Regards,
> >> > Patrick
> >
> >
>
