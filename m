Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 517007AAD78
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 11:09:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q7dJvNFt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsRKB1crbz3f5l
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 19:09:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q7dJvNFt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=dhruvaraj@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsRJY3RhXz3cBr
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 19:08:28 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2bffa8578feso31567511fa.2
        for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 02:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695373702; x=1695978502; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0f5wOwsKDYJmkpGTnRLro8rKHQw5rbhOmFlRzVsrq+8=;
        b=Q7dJvNFtLpAbq8Cjn/wPoN2Q85IjWMb2MWZafRmh8sNVbzRlLSAWFqSOaDscGXJSiR
         sIewBMsBxCbpxoAwrBectB941bRWM07+7PbJZ5RxIMecoechDGnXZCZXz9kNFL/l+sDO
         mzmr1DybRoxJ+gbQSkU9uds7lDM/Vt/SMNgyjozvo9vPgZVvLNxY8FF+G7XnaTwXHVVO
         1o9j3oRyEIVyZ09JCswhx+NYjBZHkJDFh+Uzqr27JqH/7xAHTHYIqvYigcKPaJx++pjP
         5HTiXhO83wdXiROnnDSvR/TgiZp7gD2EyipY3TXlEtX/AkgMEDYisYz/2y5yv8ZjhisR
         1QBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695373702; x=1695978502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0f5wOwsKDYJmkpGTnRLro8rKHQw5rbhOmFlRzVsrq+8=;
        b=pukCPLNJ6CKx2HiCJgrXzb7sIGdetMq5AlDRifc6zeYvrRJJWmDxiM63WrJ7VZ0fOL
         hD92LB2loQYtMKNG+K3W39JgDkVegWGIBDTctWUb94Ku3A+Ys5ZnGiZQEI9LFcfKcEIc
         rqn3bfNsqM0+hw42YVTW0JgUoDScQktV09mt2QQU1vt04O1l2sYDaWLs1HrOVBzM3s1o
         /oqFjh+QhLy8faQo0oUxAyiP+QnoJEE4lhTi9Xn76Gz+r5txF6ldv3s5FdOhdeDcr7Q8
         +EjZ/ulqG8hI6z82BZJw7OihrTXG+l2tkl0xxYJgzHiyNMPJ6FRNhqqd9YeoisVGIJZ9
         XACQ==
X-Gm-Message-State: AOJu0YwA9iXneNCxcXc1PQYXKCx8HD66mSoT3UN+Gd7xsr7VXO8b7nsN
	9vgS5JfTzDBHlz2b0VwB8cd9PX2+6Q4g3ELI8NDEQbwmQUY=
X-Google-Smtp-Source: AGHT+IHWakN7qdNbpzaLW46bo2JSizDK8z2XWinkTaCCkIKIX0m287lGXfC1Ryquks2rFhVubXrZjKyDXJWElT2Tmbo=
X-Received: by 2002:a2e:7410:0:b0:2c0:17bc:124e with SMTP id
 p16-20020a2e7410000000b002c017bc124emr7228025ljc.38.1695373701017; Fri, 22
 Sep 2023 02:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7WosgDEJN8gaLu+mC3W1xKAysdZY_pHTz46vqTpun69G0hfA@mail.gmail.com>
 <ZQxjlifIOo96FJj9@heinlein.vulture-banana.ts.net> <CAK7Wosg0ffdvnEfok0EaRQym+EGbi8R+MXf_nVC9yXiEfozjNg@mail.gmail.com>
 <CACWQX80G4MQ7DKO40+uxQKTGW-CyffbUASGYmb_0y4=vanp+jw@mail.gmail.com>
 <CAK7WosjzxY_MK1ukg7GPZGkuK6JW-CShmjjX0Z34x_WdH5_tpw@mail.gmail.com>
 <CACWQX82=RCt2xOy5jhZhiawLyONUFYdx8jw75q5T4B_kHnXtdA@mail.gmail.com>
 <CAK7Wosg6YpJtR-A3gT0yTguJHtbXxt4e5LjCjWLMySPTjGgv2g@mail.gmail.com> <CACWQX83jRWNf6AtJnzDbOFH8h3nK9ZL8XzUkAB5Gd_Gw4u-6dA@mail.gmail.com>
In-Reply-To: <CACWQX83jRWNf6AtJnzDbOFH8h3nK9ZL8XzUkAB5Gd_Gw4u-6dA@mail.gmail.com>
From: dhruvaraj S <dhruvaraj@gmail.com>
Date: Fri, 22 Sep 2023 14:38:07 +0530
Message-ID: <CAK7WoshO4ZRv_2DGEQaHFWgsHr-LyRPLrQXO=BMFR+hNV_acGQ@mail.gmail.com>
Subject: Re: Proposal: Removing redundant EpochTime interface from dump entry
To: Ed Tanous <ed@tanous.net>
Content-Type: multipart/alternative; boundary="00000000000035f7cd0605eef36a"
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

--00000000000035f7cd0605eef36a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 22 Sept 2023 at 01:19, Ed Tanous <ed@tanous.net> wrote:
>
> On Thu, Sep 21, 2023 at 11:59=E2=80=AFAM dhruvaraj S <dhruvaraj@gmail.com=
> wrote:
> >
> > On Thu, 21 Sept 2023 at 23:22, Ed Tanous <ed@tanous.net> wrote:
> > >
> > > On Thu, Sep 21, 2023 at 10:47=E2=80=AFAM dhruvaraj S <dhruvaraj@gmail=
.com>
wrote:
> > > >
> > > > On Thu, 21 Sept 2023 at 22:59, Ed Tanous <ed@tanous.net> wrote:
> > > > >
> > > > > On Thu, Sep 21, 2023 at 8:44=E2=80=AFAM dhruvaraj S <dhruvaraj@gm=
ail.com>
wrote:
> > > > > >
> > > > > > On Thu, 21 Sept 2023 at 21:09, Patrick Williams <
patrick@stwcx.xyz> wrote:
> > > > > > >
> > > > > > > On Thu, Sep 21, 2023 at 08:52:15AM +0530, dhruvaraj S wrote:
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > In the current implementation, objects implementing the
dump entry
> > > > > > > > interface implement both
xyz.openbmc_project.Common.Progress (for dump
> > > > > > > > creation start time, end time, and status) and
> > > > > > > > xyz.openbmc_project.Time.Epoch (for dump creation time,
which is
> > > > > > > > effectively the end time). This leads to a redundancy in
specifying
> > > > > > > > the dump creation end time.
> > > > >
> > > > > Don't the two interfaces describe different things?  Time.Epoch
> > > > > represents when the event occurred, not when the recording of tha=
t
> > > > > event was complete, Common.progress represents when the
> > > > > logging/processing of that event was complete.  In a lot of on-bm=
c
> > > > > scenarios, they're going to be similar if not the same, but in th=
e
> > > > > case of something like a remote processor flagging an error,
they're
> > > > > going to be different.  An error might not be completely processe=
d
> > > > > until minutes later.
> > > > The progress interface contains both the start time and completed
> > > > time, the start time
> > >
> > > That's the time that the dump started.  The dump could've been
> > > triggered by something that happened before it started, because of
> > > scheduling or resources.  To be more clear, the timeline goes
> > > something like:
> > >
> > > Some hardware failure happens -> Time.Epoch
> > > Dump creation starts -> Common.Progress.Start
> > > Dump creation completes -> Common.Progress.End
> > >
> > > If the dumps are manually triggered, and there is no queuing time,
> > > yes, steps 1 and 2 will likely report the same value (which is the
> > > common case), but that doesn't mean they're the same in all cases.
> >
> > Based on the documentation
> >
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/op=
enbmc_project/Dump/Entry.interface.yaml
> > TimeEpoch is dump creation time, which is assumed as the time when the
> > final packaging
> > is completed.
> > The current implementation for BMC dump is like,
> > - Dump requested, an entry created with status set as InProgress and
> > Start Time is recorded
> > - Once the packaging is completed, the Status is changed to Completed,
> > Completed Time and TimeEpoch are set to the same value.
> >
> > But I agree some implementations can have the Time.Epoch set to the
start time,
> > which may be close to the hardware or software failure in the system.
> > I think it is fine to keep TimeEpoch also to set the failure time, but
> > there can be a PEL
> > logged in such cases, and the failure time can be available from that
right?
>
> Lets see what it actually saves us in terms of code and patchsets to
> do this simplification (even if it's just a couple daemons that are
> representative), and continue from there.  Unless I'm mistaken, this
> is going to change on the order of 10 lines of code diff in the
> daemons for this simplification, which is fine, but without seeing the
> patches, it's hard to assess impact to actual use cases, and whether
> those lines of diff are worth reworking and retesting everything.

Proposed changes to phosphor-debug-collector and bmcweb:

Although the number of lines of code changed is small, as you mentioned,
this change will remove the duplication of information in two places and th=
e
dependency on an additional interface.

Links to the Gerrit changes:

bmcweb: https://gerrit.openbmc.org/c/openbmc/bmcweb/+/66732
Phosphor-debug-collector:
https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/66606


On Fri, 22 Sept 2023 at 01:19, Ed Tanous <ed@tanous.net> wrote:

> On Thu, Sep 21, 2023 at 11:59=E2=80=AFAM dhruvaraj S <dhruvaraj@gmail.com=
> wrote:
> >
> > On Thu, 21 Sept 2023 at 23:22, Ed Tanous <ed@tanous.net> wrote:
> > >
> > > On Thu, Sep 21, 2023 at 10:47=E2=80=AFAM dhruvaraj S <dhruvaraj@gmail=
.com>
> wrote:
> > > >
> > > > On Thu, 21 Sept 2023 at 22:59, Ed Tanous <ed@tanous.net> wrote:
> > > > >
> > > > > On Thu, Sep 21, 2023 at 8:44=E2=80=AFAM dhruvaraj S <dhruvaraj@gm=
ail.com>
> wrote:
> > > > > >
> > > > > > On Thu, 21 Sept 2023 at 21:09, Patrick Williams <
> patrick@stwcx.xyz> wrote:
> > > > > > >
> > > > > > > On Thu, Sep 21, 2023 at 08:52:15AM +0530, dhruvaraj S wrote:
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > In the current implementation, objects implementing the dum=
p
> entry
> > > > > > > > interface implement both xyz.openbmc_project.Common.Progres=
s
> (for dump
> > > > > > > > creation start time, end time, and status) and
> > > > > > > > xyz.openbmc_project.Time.Epoch (for dump creation time,
> which is
> > > > > > > > effectively the end time). This leads to a redundancy in
> specifying
> > > > > > > > the dump creation end time.
> > > > >
> > > > > Don't the two interfaces describe different things?  Time.Epoch
> > > > > represents when the event occurred, not when the recording of tha=
t
> > > > > event was complete, Common.progress represents when the
> > > > > logging/processing of that event was complete.  In a lot of on-bm=
c
> > > > > scenarios, they're going to be similar if not the same, but in th=
e
> > > > > case of something like a remote processor flagging an error,
> they're
> > > > > going to be different.  An error might not be completely processe=
d
> > > > > until minutes later.
> > > > The progress interface contains both the start time and completed
> > > > time, the start time
> > >
> > > That's the time that the dump started.  The dump could've been
> > > triggered by something that happened before it started, because of
> > > scheduling or resources.  To be more clear, the timeline goes
> > > something like:
> > >
> > > Some hardware failure happens -> Time.Epoch
> > > Dump creation starts -> Common.Progress.Start
> > > Dump creation completes -> Common.Progress.End
> > >
> > > If the dumps are manually triggered, and there is no queuing time,
> > > yes, steps 1 and 2 will likely report the same value (which is the
> > > common case), but that doesn't mean they're the same in all cases.
> >
> > Based on the documentation
> >
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/=
openbmc_project/Dump/Entry.interface.yaml
> > TimeEpoch is dump creation time, which is assumed as the time when the
> > final packaging
> > is completed.
> > The current implementation for BMC dump is like,
> > - Dump requested, an entry created with status set as InProgress and
> > Start Time is recorded
> > - Once the packaging is completed, the Status is changed to Completed,
> > Completed Time and TimeEpoch are set to the same value.
> >
> > But I agree some implementations can have the Time.Epoch set to the
> start time,
> > which may be close to the hardware or software failure in the system.
> > I think it is fine to keep TimeEpoch also to set the failure time, but
> > there can be a PEL
> > logged in such cases, and the failure time can be available from that
> right?
>
> Lets see what it actually saves us in terms of code and patchsets to
> do this simplification (even if it's just a couple daemons that are
> representative), and continue from there.  Unless I'm mistaken, this
> is going to change on the order of 10 lines of code diff in the
> daemons for this simplification, which is fine, but without seeing the
> patches, it's hard to assess impact to actual use cases, and whether
> those lines of diff are worth reworking and retesting everything.
>
>
> >
> > >
> > > > is set when the request comes and completed time once the dump
> package
> > > > is completed, EpochTime is also set when the packaging is completed=
,
> so both
> > > > are representing the same value now.
> > > >
> > > > >
> > > > > FWIW, in terms of complexity reduction on DBus, I think there's a
> lot
> > > > > more impactful places to start for a lot less effort, but if this
> is
> > > > > something you really want to chase to conclusion, and it reduces
> the
> > > > > code complexity (measured by a net-negative diff patchset to
> OpenBMC)
> > > > > and you're willing to test all the scenarios, feel free to
> continue to
> > > > > chase it down.
> > > > >
> > > > > > > >
> > > > > > > > My proposed change updates the documentation of the
> interface,
> > > > > > > > removing the reference to xyz.openbmc_project.Time.Epoch an=
d
> adding a
> > > > > > > > reference to xyz.openbmc_project.Common.Progress. This is t=
o
> remove
> > > > > > > > the need for updating the creation time in multiple
> locations.
> > > > > > > >
> > > > > > > > You can review the change here:
> > > > > > > >
> https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/66680
> > > > > > > >
> > > > > > > > Please note that this change will have an impact on any
> applications
> > > > > > > > that are currently reading the dump creation time from the
> EpochTime
> > > > > > > > interface. These applications will need to be updated to
> read the
> > > > > > > > creation time from the xyz.openbmc_project.Common.Progress
> interface
> > > > > > > > instead.
> > > > > > > > Link to the interface
> > > > > > > >
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/=
openbmc_project/Common/Progress.interface.yaml
> > > > > > > >
> > > > > > > > I would appreciate it if you could take a look at the chang=
e
> and
> > > > > > > > provide any feedback you have.
> > > > > > > >
> > > > > > >
> > > > > > > It looks like the potential concern would be with bmcweb.
> There appears
> > > > > > > to maybe be some common code related to LogServices that
> expects all
> > > > > > > logs to have the Time.EpochTime interface.  Are you going to
> add
> > > > > > > alternative code there to look at the Common.Progress
> interface instead?
> > > > > > > Is this acceptable to the bmcweb side?
> > > > > >
> > > > > > Common.Progress interface is already implemented in dump entry
> and
> > > > > > bmcweb reads that
> > > > > > for the status of the dump, now that needs to be extended to
> read the
> > > > > > CompletedTime also.
> > > > > > >
> > > > > > > --
> > > > > > > Patrick Williams
> > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > --------------
> > > > > > Dhruvaraj S
> > > >
> > > >
> > > >
> > > > --
> > > > --------------
> > > > Dhruvaraj S
> >
> >
> >
> > --
> > --------------
> > Dhruvaraj S
>


--=20
--------------
Dhruvaraj S

--00000000000035f7cd0605eef36a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Fri, 22 Sept 2023 at 01:19, Ed Tanous &lt;<a hr=
ef=3D"mailto:ed@tanous.net">ed@tanous.net</a>&gt; wrote:<br>&gt;<br>&gt; On=
 Thu, Sep 21, 2023 at 11:59=E2=80=AFAM dhruvaraj S &lt;<a href=3D"mailto:dh=
ruvaraj@gmail.com">dhruvaraj@gmail.com</a>&gt; wrote:<br>&gt; &gt;<br>&gt; =
&gt; On Thu, 21 Sept 2023 at 23:22, Ed Tanous &lt;<a href=3D"mailto:ed@tano=
us.net">ed@tanous.net</a>&gt; wrote:<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; On=
 Thu, Sep 21, 2023 at 10:47=E2=80=AFAM dhruvaraj S &lt;<a href=3D"mailto:dh=
ruvaraj@gmail.com">dhruvaraj@gmail.com</a>&gt; wrote:<br>&gt; &gt; &gt; &gt=
;<br>&gt; &gt; &gt; &gt; On Thu, 21 Sept 2023 at 22:59, Ed Tanous &lt;<a hr=
ef=3D"mailto:ed@tanous.net">ed@tanous.net</a>&gt; wrote:<br>&gt; &gt; &gt; =
&gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; On Thu, Sep 21, 2023 at 8:44=E2=80=AF=
AM dhruvaraj S &lt;<a href=3D"mailto:dhruvaraj@gmail.com">dhruvaraj@gmail.c=
om</a>&gt; wrote:<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &=
gt; &gt; On Thu, 21 Sept 2023 at 21:09, Patrick Williams &lt;<a href=3D"mai=
lto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br>&gt; &gt; &gt; &=
gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt; On Thu, Sep 21, 20=
23 at 08:52:15AM +0530, dhruvaraj S wrote:<br>&gt; &gt; &gt; &gt; &gt; &gt;=
 &gt; &gt; Hi,<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt;=
 &gt; &gt; &gt; &gt; &gt; In the current implementation, objects implementi=
ng the dump entry<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; interface impl=
ement both xyz.openbmc_project.Common.Progress (for dump<br>&gt; &gt; &gt; =
&gt; &gt; &gt; &gt; &gt; creation start time, end time, and status) and<br>=
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; xyz.openbmc_project.Time.Epoch (for=
 dump creation time, which is<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; ef=
fectively the end time). This leads to a redundancy in specifying<br>&gt; &=
gt; &gt; &gt; &gt; &gt; &gt; &gt; the dump creation end time.<br>&gt; &gt; =
&gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; Don&#39;t the two interfaces des=
cribe different things?=C2=A0 Time.Epoch<br>&gt; &gt; &gt; &gt; &gt; repres=
ents when the event occurred, not when the recording of that<br>&gt; &gt; &=
gt; &gt; &gt; event was complete, Common.progress represents when the<br>&g=
t; &gt; &gt; &gt; &gt; logging/processing of that event was complete.=C2=A0=
 In a lot of on-bmc<br>&gt; &gt; &gt; &gt; &gt; scenarios, they&#39;re goin=
g to be similar if not the same, but in the<br>&gt; &gt; &gt; &gt; &gt; cas=
e of something like a remote processor flagging an error, they&#39;re<br>&g=
t; &gt; &gt; &gt; &gt; going to be different.=C2=A0 An error might not be c=
ompletely processed<br>&gt; &gt; &gt; &gt; &gt; until minutes later.<br>&gt=
; &gt; &gt; &gt; The progress interface contains both the start time and co=
mpleted<br>&gt; &gt; &gt; &gt; time, the start time<br>&gt; &gt; &gt;<br>&g=
t; &gt; &gt; That&#39;s the time that the dump started.=C2=A0 The dump coul=
d&#39;ve been<br>&gt; &gt; &gt; triggered by something that happened before=
 it started, because of<br>&gt; &gt; &gt; scheduling or resources.=C2=A0 To=
 be more clear, the timeline goes<br>&gt; &gt; &gt; something like:<br>&gt;=
 &gt; &gt;<br>&gt; &gt; &gt; Some hardware failure happens -&gt; Time.Epoch=
<br>&gt; &gt; &gt; Dump creation starts -&gt; Common.Progress.Start<br>&gt;=
 &gt; &gt; Dump creation completes -&gt; Common.Progress.End<br>&gt; &gt; &=
gt;<br>&gt; &gt; &gt; If the dumps are manually triggered, and there is no =
queuing time,<br>&gt; &gt; &gt; yes, steps 1 and 2 will likely report the s=
ame value (which is the<br>&gt; &gt; &gt; common case), but that doesn&#39;=
t mean they&#39;re the same in all cases.<br>&gt; &gt;<br>&gt; &gt; Based o=
n the documentation<br>&gt; &gt; <a href=3D"https://github.com/openbmc/phos=
phor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Dump/Entry.interf=
ace.yaml">https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/y=
aml/xyz/openbmc_project/Dump/Entry.interface.yaml</a><br>&gt; &gt; TimeEpoc=
h is dump creation time, which is assumed as the time when the<br>&gt; &gt;=
 final packaging<br>&gt; &gt; is completed.<br>&gt; &gt; The current implem=
entation for BMC dump is like,<br>&gt; &gt; - Dump requested, an entry crea=
ted with status set as InProgress and<br>&gt; &gt; Start Time is recorded<b=
r>&gt; &gt; - Once the packaging is completed, the Status is changed to Com=
pleted,<br>&gt; &gt; Completed Time and TimeEpoch are set to the same value=
.<br>&gt; &gt;<br>&gt; &gt; But I agree some implementations can have the T=
ime.Epoch set to the start time,<br>&gt; &gt; which may be close to the har=
dware or software failure in the system.<br>&gt; &gt; I think it is fine to=
 keep TimeEpoch also to set the failure time, but<br>&gt; &gt; there can be=
 a PEL<br>&gt; &gt; logged in such cases, and the failure time can be avail=
able from that right?<br>&gt;<br>&gt; Lets see what it actually saves us in=
 terms of code and patchsets to<br>&gt; do this simplification (even if it&=
#39;s just a couple daemons that are<br>&gt; representative), and continue =
from there.=C2=A0 Unless I&#39;m mistaken, this<br>&gt; is going to change =
on the order of 10 lines of code diff in the<br>&gt; daemons for this simpl=
ification, which is fine, but without seeing the<br>&gt; patches, it&#39;s =
hard to assess impact to actual use cases, and whether<br>&gt; those lines =
of diff are worth reworking and retesting everything.<br><br>Proposed chang=
es to phosphor-debug-collector and bmcweb:<br><br>Although the number of li=
nes of code changed is small, as you mentioned,<br>this change will remove =
the duplication of information in two places and the<br>dependency on an ad=
ditional interface.<br><br>Links to the Gerrit changes:<br><br>bmcweb: <a h=
ref=3D"https://gerrit.openbmc.org/c/openbmc/bmcweb/+/66732">https://gerrit.=
openbmc.org/c/openbmc/bmcweb/+/66732</a><br>Phosphor-debug-collector: <a hr=
ef=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/66606=
">https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/66606</a>=
</div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri, 22 Sept 2023 at 01:19, Ed Tanous &lt;<a href=3D"mailto:ed@tanou=
s.net">ed@tanous.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Thu, Sep 21, 2023 at 11:59=E2=80=AFAM dhruvaraj S &l=
t;<a href=3D"mailto:dhruvaraj@gmail.com" target=3D"_blank">dhruvaraj@gmail.=
com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, 21 Sept 2023 at 23:22, Ed Tanous &lt;<a href=3D"mailto:ed@tano=
us.net" target=3D"_blank">ed@tanous.net</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Sep 21, 2023 at 10:47=E2=80=AFAM dhruvaraj S &lt;<a href=
=3D"mailto:dhruvaraj@gmail.com" target=3D"_blank">dhruvaraj@gmail.com</a>&g=
t; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Thu, 21 Sept 2023 at 22:59, Ed Tanous &lt;<a href=3D"mail=
to:ed@tanous.net" target=3D"_blank">ed@tanous.net</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Thu, Sep 21, 2023 at 8:44=E2=80=AFAM dhruvaraj S &lt=
;<a href=3D"mailto:dhruvaraj@gmail.com" target=3D"_blank">dhruvaraj@gmail.c=
om</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Thu, 21 Sept 2023 at 21:09, Patrick Williams &l=
t;<a href=3D"mailto:patrick@stwcx.xyz" target=3D"_blank">patrick@stwcx.xyz<=
/a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Thu, Sep 21, 2023 at 08:52:15AM +0530, dhr=
uvaraj S wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; In the current implementation, objects i=
mplementing the dump entry<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; interface implement both xyz.openbmc_pro=
ject.Common.Progress (for dump<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; creation start time, end time, and statu=
s) and<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; xyz.openbmc_project.Time.Epoch (for dump=
 creation time, which is<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; effectively the end time). This leads to=
 a redundancy in specifying<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; the dump creation end time.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Don&#39;t the two interfaces describe different things?=
=C2=A0 Time.Epoch<br>
&gt; &gt; &gt; &gt; represents when the event occurred, not when the record=
ing of that<br>
&gt; &gt; &gt; &gt; event was complete, Common.progress represents when the=
<br>
&gt; &gt; &gt; &gt; logging/processing of that event was complete.=C2=A0 In=
 a lot of on-bmc<br>
&gt; &gt; &gt; &gt; scenarios, they&#39;re going to be similar if not the s=
ame, but in the<br>
&gt; &gt; &gt; &gt; case of something like a remote processor flagging an e=
rror, they&#39;re<br>
&gt; &gt; &gt; &gt; going to be different.=C2=A0 An error might not be comp=
letely processed<br>
&gt; &gt; &gt; &gt; until minutes later.<br>
&gt; &gt; &gt; The progress interface contains both the start time and comp=
leted<br>
&gt; &gt; &gt; time, the start time<br>
&gt; &gt;<br>
&gt; &gt; That&#39;s the time that the dump started.=C2=A0 The dump could&#=
39;ve been<br>
&gt; &gt; triggered by something that happened before it started, because o=
f<br>
&gt; &gt; scheduling or resources.=C2=A0 To be more clear, the timeline goe=
s<br>
&gt; &gt; something like:<br>
&gt; &gt;<br>
&gt; &gt; Some hardware failure happens -&gt; Time.Epoch<br>
&gt; &gt; Dump creation starts -&gt; Common.Progress.Start<br>
&gt; &gt; Dump creation completes -&gt; Common.Progress.End<br>
&gt; &gt;<br>
&gt; &gt; If the dumps are manually triggered, and there is no queuing time=
,<br>
&gt; &gt; yes, steps 1 and 2 will likely report the same value (which is th=
e<br>
&gt; &gt; common case), but that doesn&#39;t mean they&#39;re the same in a=
ll cases.<br>
&gt;<br>
&gt; Based on the documentation<br>
&gt; <a href=3D"https://github.com/openbmc/phosphor-dbus-interfaces/blob/ma=
ster/yaml/xyz/openbmc_project/Dump/Entry.interface.yaml" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/openbmc/phosphor-dbus-interfaces/blob=
/master/yaml/xyz/openbmc_project/Dump/Entry.interface.yaml</a><br>
&gt; TimeEpoch is dump creation time, which is assumed as the time when the=
<br>
&gt; final packaging<br>
&gt; is completed.<br>
&gt; The current implementation for BMC dump is like,<br>
&gt; - Dump requested, an entry created with status set as InProgress and<b=
r>
&gt; Start Time is recorded<br>
&gt; - Once the packaging is completed, the Status is changed to Completed,=
<br>
&gt; Completed Time and TimeEpoch are set to the same value.<br>
&gt;<br>
&gt; But I agree some implementations can have the Time.Epoch set to the st=
art time,<br>
&gt; which may be close to the hardware or software failure in the system.<=
br>
&gt; I think it is fine to keep TimeEpoch also to set the failure time, but=
<br>
&gt; there can be a PEL<br>
&gt; logged in such cases, and the failure time can be available from that =
right?<br>
<br>
Lets see what it actually saves us in terms of code and patchsets to<br>
do this simplification (even if it&#39;s just a couple daemons that are<br>
representative), and continue from there.=C2=A0 Unless I&#39;m mistaken, th=
is<br>
is going to change on the order of 10 lines of code diff in the<br>
daemons for this simplification, which is fine, but without seeing the<br>
patches, it&#39;s hard to assess impact to actual use cases, and whether<br=
>
those lines of diff are worth reworking and retesting everything.<br>
<br>
<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; is set when the request comes and completed time once the du=
mp package<br>
&gt; &gt; &gt; is completed, EpochTime is also set when the packaging is co=
mpleted, so both<br>
&gt; &gt; &gt; are representing the same value now.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; FWIW, in terms of complexity reduction on DBus, I think=
 there&#39;s a lot<br>
&gt; &gt; &gt; &gt; more impactful places to start for a lot less effort, b=
ut if this is<br>
&gt; &gt; &gt; &gt; something you really want to chase to conclusion, and i=
t reduces the<br>
&gt; &gt; &gt; &gt; code complexity (measured by a net-negative diff patchs=
et to OpenBMC)<br>
&gt; &gt; &gt; &gt; and you&#39;re willing to test all the scenarios, feel =
free to continue to<br>
&gt; &gt; &gt; &gt; chase it down.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; My proposed change updates the documenta=
tion of the interface,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; removing the reference to xyz.openbmc_pr=
oject.Time.Epoch and adding a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; reference to xyz.openbmc_project.Common.=
Progress. This is to remove<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; the need for updating the creation time =
in multiple locations.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; You can review the change here:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://gerrit.openbmc.org/c/=
openbmc/phosphor-dbus-interfaces/+/66680" rel=3D"noreferrer" target=3D"_bla=
nk">https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/66680</=
a><br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Please note that this change will have a=
n impact on any applications<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; that are currently reading the dump crea=
tion time from the EpochTime<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; interface. These applications will need =
to be updated to read the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; creation time from the xyz.openbmc_proje=
ct.Common.Progress interface<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; instead.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Link to the interface<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://github.com/openbmc/ph=
osphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Common/Progress=
.interface.yaml" rel=3D"noreferrer" target=3D"_blank">https://github.com/op=
enbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Common/=
Progress.interface.yaml</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; I would appreciate it if you could take =
a look at the change and<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; provide any feedback you have.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; It looks like the potential concern would be =
with bmcweb.=C2=A0 There appears<br>
&gt; &gt; &gt; &gt; &gt; &gt; to maybe be some common code related to LogSe=
rvices that expects all<br>
&gt; &gt; &gt; &gt; &gt; &gt; logs to have the Time.EpochTime interface.=C2=
=A0 Are you going to add<br>
&gt; &gt; &gt; &gt; &gt; &gt; alternative code there to look at the Common.=
Progress interface instead?<br>
&gt; &gt; &gt; &gt; &gt; &gt; Is this acceptable to the bmcweb side?<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Common.Progress interface is already implemented i=
n dump entry and<br>
&gt; &gt; &gt; &gt; &gt; bmcweb reads that<br>
&gt; &gt; &gt; &gt; &gt; for the status of the dump, now that needs to be e=
xtended to read the<br>
&gt; &gt; &gt; &gt; &gt; CompletedTime also.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; Patrick Williams<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; --------------<br>
&gt; &gt; &gt; &gt; &gt; Dhruvaraj S<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; --------------<br>
&gt; &gt; &gt; Dhruvaraj S<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; --------------<br>
&gt; Dhruvaraj S<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">--=
------------<br>Dhruvaraj S</div>

--00000000000035f7cd0605eef36a--
