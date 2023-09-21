Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 191707A9DD6
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 21:49:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=mk1wr+KA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs5Zw65wQz3clw
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 05:49:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=mk1wr+KA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs5ZJ50RLz3cRC
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 05:49:10 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32167a4adaaso1353927f8f.1
        for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 12:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20230601.gappssmtp.com; s=20230601; t=1695325743; x=1695930543; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gyoj6GcLlzh+qinueiktWKUMESCHlOEDZ9RL0ofW2a8=;
        b=mk1wr+KA2wBGCxV3qCaDLxgq/Eo8QiN1ek34Vz0QfvBHhNWUqD2s7jqkYH7qGAXXY2
         plmXM+0YCV+wgFlJEyyUJ++SLwV5H/IxanSqQ8C93O3QMzKRZRlvRbaGNlsvWgp42elJ
         HDnGI9yeTzoPK+nGdly+4uzj6nLYC5nZYllclhdQlS0od7G/2lyU9NOXhbtNV2NaAa90
         RcbdnvNezfWzskdzvVQG0Jear1/A7e3DSlaKUd0SootxwPZokAYSa7gSdhTvRDd/E6vF
         YY39eDpJEbNck1drCIsrtU3G3Sb3xxqnF1OT8/U7CH106P0Mge2YG9buKXyFICw/jTYS
         I5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695325743; x=1695930543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gyoj6GcLlzh+qinueiktWKUMESCHlOEDZ9RL0ofW2a8=;
        b=qYsNS8ES93b2tmUPWti3NmNkiqYpmqMQt+lJiA684Ys3S0VWQ6qS4P7uhDFhaDQfWO
         ehUWk9rO5b18LuLTnZrkc+9jJAezm6kfnY+REIVzHMeJDi5YKtSL7Fr2NdQShXixi5JX
         3x/MonHiktvAaXHYy3TWTcJnZxgAugtPYkREv0to8Ab5qe+KF42+1v3hf4FKz2hAAprg
         GLOwqIS8IoSFtuj1kCm+brfhk/etcAqnJ44PQDLRf1mO1V7889HFQ6+BZL9jqmWBTXns
         SA6R4YrZQZjFiRE4kdtUegT/Zh7EGf6fJERC9PxXrEjSb/KIOk4hNtCou1DFMorQhrjN
         wLkQ==
X-Gm-Message-State: AOJu0Yx3pgwZCZB8+fhdUDMh6k2475kHygtEuZtDPmoJFqfRfzwCjrym
	D6kRC+s1pJIU+5+3fFqyFluYSb7T8KcWqgP8seSQHw==
X-Google-Smtp-Source: AGHT+IHivtjw8c5jbS4J2IOaAfwagswGmrdPo9b1f92rhAkOZaQ8OUwATA893ztVdDWzT6PnvqBqbTYvsR/H1LSn0Gc=
X-Received: by 2002:a05:6000:10c1:b0:319:63f3:c0cb with SMTP id
 b1-20020a05600010c100b0031963f3c0cbmr6739332wrx.40.1695325742308; Thu, 21 Sep
 2023 12:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7WosgDEJN8gaLu+mC3W1xKAysdZY_pHTz46vqTpun69G0hfA@mail.gmail.com>
 <ZQxjlifIOo96FJj9@heinlein.vulture-banana.ts.net> <CAK7Wosg0ffdvnEfok0EaRQym+EGbi8R+MXf_nVC9yXiEfozjNg@mail.gmail.com>
 <CACWQX80G4MQ7DKO40+uxQKTGW-CyffbUASGYmb_0y4=vanp+jw@mail.gmail.com>
 <CAK7WosjzxY_MK1ukg7GPZGkuK6JW-CShmjjX0Z34x_WdH5_tpw@mail.gmail.com>
 <CACWQX82=RCt2xOy5jhZhiawLyONUFYdx8jw75q5T4B_kHnXtdA@mail.gmail.com> <CAK7Wosg6YpJtR-A3gT0yTguJHtbXxt4e5LjCjWLMySPTjGgv2g@mail.gmail.com>
In-Reply-To: <CAK7Wosg6YpJtR-A3gT0yTguJHtbXxt4e5LjCjWLMySPTjGgv2g@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 21 Sep 2023 12:48:51 -0700
Message-ID: <CACWQX83jRWNf6AtJnzDbOFH8h3nK9ZL8XzUkAB5Gd_Gw4u-6dA@mail.gmail.com>
Subject: Re: Proposal: Removing redundant EpochTime interface from dump entry
To: dhruvaraj S <dhruvaraj@gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 21, 2023 at 11:59=E2=80=AFAM dhruvaraj S <dhruvaraj@gmail.com> =
wrote:
>
> On Thu, 21 Sept 2023 at 23:22, Ed Tanous <ed@tanous.net> wrote:
> >
> > On Thu, Sep 21, 2023 at 10:47=E2=80=AFAM dhruvaraj S <dhruvaraj@gmail.c=
om> wrote:
> > >
> > > On Thu, 21 Sept 2023 at 22:59, Ed Tanous <ed@tanous.net> wrote:
> > > >
> > > > On Thu, Sep 21, 2023 at 8:44=E2=80=AFAM dhruvaraj S <dhruvaraj@gmai=
l.com> wrote:
> > > > >
> > > > > On Thu, 21 Sept 2023 at 21:09, Patrick Williams <patrick@stwcx.xy=
z> wrote:
> > > > > >
> > > > > > On Thu, Sep 21, 2023 at 08:52:15AM +0530, dhruvaraj S wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > In the current implementation, objects implementing the dump =
entry
> > > > > > > interface implement both xyz.openbmc_project.Common.Progress =
(for dump
> > > > > > > creation start time, end time, and status) and
> > > > > > > xyz.openbmc_project.Time.Epoch (for dump creation time, which=
 is
> > > > > > > effectively the end time). This leads to a redundancy in spec=
ifying
> > > > > > > the dump creation end time.
> > > >
> > > > Don't the two interfaces describe different things?  Time.Epoch
> > > > represents when the event occurred, not when the recording of that
> > > > event was complete, Common.progress represents when the
> > > > logging/processing of that event was complete.  In a lot of on-bmc
> > > > scenarios, they're going to be similar if not the same, but in the
> > > > case of something like a remote processor flagging an error, they'r=
e
> > > > going to be different.  An error might not be completely processed
> > > > until minutes later.
> > > The progress interface contains both the start time and completed
> > > time, the start time
> >
> > That's the time that the dump started.  The dump could've been
> > triggered by something that happened before it started, because of
> > scheduling or resources.  To be more clear, the timeline goes
> > something like:
> >
> > Some hardware failure happens -> Time.Epoch
> > Dump creation starts -> Common.Progress.Start
> > Dump creation completes -> Common.Progress.End
> >
> > If the dumps are manually triggered, and there is no queuing time,
> > yes, steps 1 and 2 will likely report the same value (which is the
> > common case), but that doesn't mean they're the same in all cases.
>
> Based on the documentation
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/=
openbmc_project/Dump/Entry.interface.yaml
> TimeEpoch is dump creation time, which is assumed as the time when the
> final packaging
> is completed.
> The current implementation for BMC dump is like,
> - Dump requested, an entry created with status set as InProgress and
> Start Time is recorded
> - Once the packaging is completed, the Status is changed to Completed,
> Completed Time and TimeEpoch are set to the same value.
>
> But I agree some implementations can have the Time.Epoch set to the start=
 time,
> which may be close to the hardware or software failure in the system.
> I think it is fine to keep TimeEpoch also to set the failure time, but
> there can be a PEL
> logged in such cases, and the failure time can be available from that rig=
ht?

Lets see what it actually saves us in terms of code and patchsets to
do this simplification (even if it's just a couple daemons that are
representative), and continue from there.  Unless I'm mistaken, this
is going to change on the order of 10 lines of code diff in the
daemons for this simplification, which is fine, but without seeing the
patches, it's hard to assess impact to actual use cases, and whether
those lines of diff are worth reworking and retesting everything.


>
> >
> > > is set when the request comes and completed time once the dump packag=
e
> > > is completed, EpochTime is also set when the packaging is completed, =
so both
> > > are representing the same value now.
> > >
> > > >
> > > > FWIW, in terms of complexity reduction on DBus, I think there's a l=
ot
> > > > more impactful places to start for a lot less effort, but if this i=
s
> > > > something you really want to chase to conclusion, and it reduces th=
e
> > > > code complexity (measured by a net-negative diff patchset to OpenBM=
C)
> > > > and you're willing to test all the scenarios, feel free to continue=
 to
> > > > chase it down.
> > > >
> > > > > > >
> > > > > > > My proposed change updates the documentation of the interface=
,
> > > > > > > removing the reference to xyz.openbmc_project.Time.Epoch and =
adding a
> > > > > > > reference to xyz.openbmc_project.Common.Progress. This is to =
remove
> > > > > > > the need for updating the creation time in multiple locations=
.
> > > > > > >
> > > > > > > You can review the change here:
> > > > > > > https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces=
/+/66680
> > > > > > >
> > > > > > > Please note that this change will have an impact on any appli=
cations
> > > > > > > that are currently reading the dump creation time from the Ep=
ochTime
> > > > > > > interface. These applications will need to be updated to read=
 the
> > > > > > > creation time from the xyz.openbmc_project.Common.Progress in=
terface
> > > > > > > instead.
> > > > > > > Link to the interface
> > > > > > > https://github.com/openbmc/phosphor-dbus-interfaces/blob/mast=
er/yaml/xyz/openbmc_project/Common/Progress.interface.yaml
> > > > > > >
> > > > > > > I would appreciate it if you could take a look at the change =
and
> > > > > > > provide any feedback you have.
> > > > > > >
> > > > > >
> > > > > > It looks like the potential concern would be with bmcweb.  Ther=
e appears
> > > > > > to maybe be some common code related to LogServices that expect=
s all
> > > > > > logs to have the Time.EpochTime interface.  Are you going to ad=
d
> > > > > > alternative code there to look at the Common.Progress interface=
 instead?
> > > > > > Is this acceptable to the bmcweb side?
> > > > >
> > > > > Common.Progress interface is already implemented in dump entry an=
d
> > > > > bmcweb reads that
> > > > > for the status of the dump, now that needs to be extended to read=
 the
> > > > > CompletedTime also.
> > > > > >
> > > > > > --
> > > > > > Patrick Williams
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > --------------
> > > > > Dhruvaraj S
> > >
> > >
> > >
> > > --
> > > --------------
> > > Dhruvaraj S
>
>
>
> --
> --------------
> Dhruvaraj S
