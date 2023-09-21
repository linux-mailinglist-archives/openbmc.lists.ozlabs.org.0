Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A86DC7A9B68
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 21:00:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fbiM80Yb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs4Tq47h6z3cgk
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 05:00:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fbiM80Yb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=dhruvaraj@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs4TB1xlRz3cD1
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 04:59:40 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9a9d82d73f9so159373266b.3
        for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 11:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695322777; x=1695927577; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXefobdA7urx6SSC4tdmgNW+Yhz3seUIU9kmj79G/tw=;
        b=fbiM80YbLMrAIsWEo1VNAnsAstdslB3n47mu5PiB5/oyj8/UWolJhl8CP7qc5bunZS
         EtXDVe+kONX3cGMY+QR2wfgXBiudffISoOHpxWQaLQZmc7HSJWfAnoy6Izbc5sCVixkz
         xLcsj939pmZAIc3lGMiV0cDqgB8wGAggn3Oyt9N1zErMxTvl368dUPVEDZtoJY1kN6Tq
         RmxG2OxxNcvSazenkRv6GjRRBNvmHtmZXpD7qPCYVTDJP7tszIed6Mwo8MP7saZ8zlWq
         NwrRecWYpA5vU1F+Fd5Q3FJOl2VdCdJ1XPk1NSNMa0mXOPg1FZ6cHbGPC7VWaRYTOEzO
         Wjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695322777; x=1695927577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXefobdA7urx6SSC4tdmgNW+Yhz3seUIU9kmj79G/tw=;
        b=g4wnaVmxA8yb56tcMIMMOupX5cJIJW3dqvy1KQ1d9RzCyJAXTfH3crf7LbDWnnpGN+
         CulNs68/5YEiGS7ptH1J90u72I6HvZdja3PeSG1mycx/Pnkw/jkkZWdcweBRuf5G1+Wg
         jHEnjcWeSUW087enNXZNtKo15xBmEoXu/SW0HPpDr2AUMMej4kum9Fm5KPGlKEGugjcY
         DIM4iFjgbqglnHW+obLOLxXgxWaLHNGIj/bbyuTlnlS2ERk9yzxzYDWGGpiG+DjSXRMZ
         SbrrMRaM06R5IdC7Oq0g567rRQir2fx0cbjdWVZfL9mIij9bse7FoApvNYbBOYBYJIls
         vQmA==
X-Gm-Message-State: AOJu0YzVR79abg6XXhMIUIMwfcjzFHTb9rGVoKbXmBX0rwJVIBtuDiMC
	5UAQnUbkPMQIAjWARnWFUmsMYB8H1N9KK5BgdGae6GZw+G5lfg==
X-Google-Smtp-Source: AGHT+IEsOcYj8S4J+RPdOoGdCfCo8OE8I0zMfqcQk+35uPPB/T3eq9SpRXm3a4udB2APzjQvReHkRfgV8kuxXpAQ5MI=
X-Received: by 2002:a17:907:7610:b0:9ae:40d1:999b with SMTP id
 jx16-20020a170907761000b009ae40d1999bmr5369707ejc.16.1695322776426; Thu, 21
 Sep 2023 11:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7WosgDEJN8gaLu+mC3W1xKAysdZY_pHTz46vqTpun69G0hfA@mail.gmail.com>
 <ZQxjlifIOo96FJj9@heinlein.vulture-banana.ts.net> <CAK7Wosg0ffdvnEfok0EaRQym+EGbi8R+MXf_nVC9yXiEfozjNg@mail.gmail.com>
 <CACWQX80G4MQ7DKO40+uxQKTGW-CyffbUASGYmb_0y4=vanp+jw@mail.gmail.com>
 <CAK7WosjzxY_MK1ukg7GPZGkuK6JW-CShmjjX0Z34x_WdH5_tpw@mail.gmail.com> <CACWQX82=RCt2xOy5jhZhiawLyONUFYdx8jw75q5T4B_kHnXtdA@mail.gmail.com>
In-Reply-To: <CACWQX82=RCt2xOy5jhZhiawLyONUFYdx8jw75q5T4B_kHnXtdA@mail.gmail.com>
From: dhruvaraj S <dhruvaraj@gmail.com>
Date: Fri, 22 Sep 2023 00:29:22 +0530
Message-ID: <CAK7Wosg6YpJtR-A3gT0yTguJHtbXxt4e5LjCjWLMySPTjGgv2g@mail.gmail.com>
Subject: Re: Proposal: Removing redundant EpochTime interface from dump entry
To: Ed Tanous <ed@tanous.net>
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

On Thu, 21 Sept 2023 at 23:22, Ed Tanous <ed@tanous.net> wrote:
>
> On Thu, Sep 21, 2023 at 10:47=E2=80=AFAM dhruvaraj S <dhruvaraj@gmail.com=
> wrote:
> >
> > On Thu, 21 Sept 2023 at 22:59, Ed Tanous <ed@tanous.net> wrote:
> > >
> > > On Thu, Sep 21, 2023 at 8:44=E2=80=AFAM dhruvaraj S <dhruvaraj@gmail.=
com> wrote:
> > > >
> > > > On Thu, 21 Sept 2023 at 21:09, Patrick Williams <patrick@stwcx.xyz>=
 wrote:
> > > > >
> > > > > On Thu, Sep 21, 2023 at 08:52:15AM +0530, dhruvaraj S wrote:
> > > > > > Hi,
> > > > > >
> > > > > > In the current implementation, objects implementing the dump en=
try
> > > > > > interface implement both xyz.openbmc_project.Common.Progress (f=
or dump
> > > > > > creation start time, end time, and status) and
> > > > > > xyz.openbmc_project.Time.Epoch (for dump creation time, which i=
s
> > > > > > effectively the end time). This leads to a redundancy in specif=
ying
> > > > > > the dump creation end time.
> > >
> > > Don't the two interfaces describe different things?  Time.Epoch
> > > represents when the event occurred, not when the recording of that
> > > event was complete, Common.progress represents when the
> > > logging/processing of that event was complete.  In a lot of on-bmc
> > > scenarios, they're going to be similar if not the same, but in the
> > > case of something like a remote processor flagging an error, they're
> > > going to be different.  An error might not be completely processed
> > > until minutes later.
> > The progress interface contains both the start time and completed
> > time, the start time
>
> That's the time that the dump started.  The dump could've been
> triggered by something that happened before it started, because of
> scheduling or resources.  To be more clear, the timeline goes
> something like:
>
> Some hardware failure happens -> Time.Epoch
> Dump creation starts -> Common.Progress.Start
> Dump creation completes -> Common.Progress.End
>
> If the dumps are manually triggered, and there is no queuing time,
> yes, steps 1 and 2 will likely report the same value (which is the
> common case), but that doesn't mean they're the same in all cases.

Based on the documentation
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/op=
enbmc_project/Dump/Entry.interface.yaml
TimeEpoch is dump creation time, which is assumed as the time when the
final packaging
is completed.
The current implementation for BMC dump is like,
- Dump requested, an entry created with status set as InProgress and
Start Time is recorded
- Once the packaging is completed, the Status is changed to Completed,
Completed Time and TimeEpoch are set to the same value.

But I agree some implementations can have the Time.Epoch set to the start t=
ime,
which may be close to the hardware or software failure in the system.
I think it is fine to keep TimeEpoch also to set the failure time, but
there can be a PEL
logged in such cases, and the failure time can be available from that right=
?

>
> > is set when the request comes and completed time once the dump package
> > is completed, EpochTime is also set when the packaging is completed, so=
 both
> > are representing the same value now.
> >
> > >
> > > FWIW, in terms of complexity reduction on DBus, I think there's a lot
> > > more impactful places to start for a lot less effort, but if this is
> > > something you really want to chase to conclusion, and it reduces the
> > > code complexity (measured by a net-negative diff patchset to OpenBMC)
> > > and you're willing to test all the scenarios, feel free to continue t=
o
> > > chase it down.
> > >
> > > > > >
> > > > > > My proposed change updates the documentation of the interface,
> > > > > > removing the reference to xyz.openbmc_project.Time.Epoch and ad=
ding a
> > > > > > reference to xyz.openbmc_project.Common.Progress. This is to re=
move
> > > > > > the need for updating the creation time in multiple locations.
> > > > > >
> > > > > > You can review the change here:
> > > > > > https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+=
/66680
> > > > > >
> > > > > > Please note that this change will have an impact on any applica=
tions
> > > > > > that are currently reading the dump creation time from the Epoc=
hTime
> > > > > > interface. These applications will need to be updated to read t=
he
> > > > > > creation time from the xyz.openbmc_project.Common.Progress inte=
rface
> > > > > > instead.
> > > > > > Link to the interface
> > > > > > https://github.com/openbmc/phosphor-dbus-interfaces/blob/master=
/yaml/xyz/openbmc_project/Common/Progress.interface.yaml
> > > > > >
> > > > > > I would appreciate it if you could take a look at the change an=
d
> > > > > > provide any feedback you have.
> > > > > >
> > > > >
> > > > > It looks like the potential concern would be with bmcweb.  There =
appears
> > > > > to maybe be some common code related to LogServices that expects =
all
> > > > > logs to have the Time.EpochTime interface.  Are you going to add
> > > > > alternative code there to look at the Common.Progress interface i=
nstead?
> > > > > Is this acceptable to the bmcweb side?
> > > >
> > > > Common.Progress interface is already implemented in dump entry and
> > > > bmcweb reads that
> > > > for the status of the dump, now that needs to be extended to read t=
he
> > > > CompletedTime also.
> > > > >
> > > > > --
> > > > > Patrick Williams
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



--=20
--------------
Dhruvaraj S
