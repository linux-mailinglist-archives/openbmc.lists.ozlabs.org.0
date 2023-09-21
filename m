Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2027A987E
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 19:48:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TpTOPYyn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs2v55P4kz3cNS
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 03:48:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TpTOPYyn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=dhruvaraj@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs2tW1M2fz3cD1
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 03:48:01 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9ad8d47ef2fso153328866b.1
        for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 10:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695318477; x=1695923277; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ui+iaY/xx+EMddVO8f62mPpWy411GCufafLVEoNW74g=;
        b=TpTOPYynN6fqBbOoP2oPAaDqMmkhW+QOqIL4HrPcz5mdQSvNqugcUBzwhysVDDMakh
         9Wwox0012Gu/1lQQB7/biwtwJoxCl5luq97+QrsEyF/QD4edJVieV6tewF9U1wuZVmTW
         I1UHyN8d7/JvNX64w99F4v1tQNWvWB6pyNKeQpAJE7cYpdh7cQr++qmVTt1qakF9xNqz
         VgRHdyrdQAnieVhlHsi4bXqISdUTnMbJGAF7uIESTLTlS0JQGakYrAgu42sX0tuSDiI8
         vzmpwM+BOdrGbQxKnr/lVI6JKIXLO7BuO88wCAeMFxldykVFQ6f74LNqWSoV+ODzOK5x
         wA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695318477; x=1695923277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ui+iaY/xx+EMddVO8f62mPpWy411GCufafLVEoNW74g=;
        b=j29JrwVuu4Gl3Xcp0ATJBeqaWUHAkYKn+gbIOaKIAWj5wdNo82IXM8y7CFuDcEfL8V
         EIzzLO2h9TX9B6RLNFj0899muOkHPbWw4bRe4MI/ms5kEeYTShlbkfFK3qdbzyV0L44g
         8ZwZ4t8Et1h14o2zqLaeKVfc8I/I5TxtxxjESQNZQ/oYJMZK2t2hMqKhmIKs25eYJvpb
         pVR4Cd7WMLLYBuuId9GGYU0O3g8z52Q1S1D7gRkbA7pl4ZWHrORXl61Lg95009iQt87V
         L+xHgSitFmDBUe4F0Qjn2uG7OIskqAbkekfFn5g3+8UL3xp64d+HFqBz2S8xcMLHx0o2
         bPmQ==
X-Gm-Message-State: AOJu0Yzk8hIO8Wanw0cPvtLbzovmyy/m6pN0jSS+tz8Ya7obsl1cnGGJ
	ZNbL6sE+BIIYRFzYgTADzeEN/IMzwauXKGKkefk=
X-Google-Smtp-Source: AGHT+IE/TDTICiNO4JpTL1xf3vr41jmfXNSAiStp2oRIphtO2+rolLqO3hrB4BAPVUp4itJ6Nf7w6E7LXysm5cQht8U=
X-Received: by 2002:a17:906:31da:b0:9ae:424b:a92c with SMTP id
 f26-20020a17090631da00b009ae424ba92cmr5859376ejf.50.1695318477049; Thu, 21
 Sep 2023 10:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7WosgDEJN8gaLu+mC3W1xKAysdZY_pHTz46vqTpun69G0hfA@mail.gmail.com>
 <ZQxjlifIOo96FJj9@heinlein.vulture-banana.ts.net> <CAK7Wosg0ffdvnEfok0EaRQym+EGbi8R+MXf_nVC9yXiEfozjNg@mail.gmail.com>
 <CACWQX80G4MQ7DKO40+uxQKTGW-CyffbUASGYmb_0y4=vanp+jw@mail.gmail.com>
In-Reply-To: <CACWQX80G4MQ7DKO40+uxQKTGW-CyffbUASGYmb_0y4=vanp+jw@mail.gmail.com>
From: dhruvaraj S <dhruvaraj@gmail.com>
Date: Thu, 21 Sep 2023 23:17:43 +0530
Message-ID: <CAK7WosjzxY_MK1ukg7GPZGkuK6JW-CShmjjX0Z34x_WdH5_tpw@mail.gmail.com>
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

On Thu, 21 Sept 2023 at 22:59, Ed Tanous <ed@tanous.net> wrote:
>
> On Thu, Sep 21, 2023 at 8:44=E2=80=AFAM dhruvaraj S <dhruvaraj@gmail.com>=
 wrote:
> >
> > On Thu, 21 Sept 2023 at 21:09, Patrick Williams <patrick@stwcx.xyz> wro=
te:
> > >
> > > On Thu, Sep 21, 2023 at 08:52:15AM +0530, dhruvaraj S wrote:
> > > > Hi,
> > > >
> > > > In the current implementation, objects implementing the dump entry
> > > > interface implement both xyz.openbmc_project.Common.Progress (for d=
ump
> > > > creation start time, end time, and status) and
> > > > xyz.openbmc_project.Time.Epoch (for dump creation time, which is
> > > > effectively the end time). This leads to a redundancy in specifying
> > > > the dump creation end time.
>
> Don't the two interfaces describe different things?  Time.Epoch
> represents when the event occurred, not when the recording of that
> event was complete, Common.progress represents when the
> logging/processing of that event was complete.  In a lot of on-bmc
> scenarios, they're going to be similar if not the same, but in the
> case of something like a remote processor flagging an error, they're
> going to be different.  An error might not be completely processed
> until minutes later.
The progress interface contains both the start time and completed
time, the start time
is set when the request comes and completed time once the dump package
is completed, EpochTime is also set when the packaging is completed, so bot=
h
are representing the same value now.

>
> FWIW, in terms of complexity reduction on DBus, I think there's a lot
> more impactful places to start for a lot less effort, but if this is
> something you really want to chase to conclusion, and it reduces the
> code complexity (measured by a net-negative diff patchset to OpenBMC)
> and you're willing to test all the scenarios, feel free to continue to
> chase it down.
>
> > > >
> > > > My proposed change updates the documentation of the interface,
> > > > removing the reference to xyz.openbmc_project.Time.Epoch and adding=
 a
> > > > reference to xyz.openbmc_project.Common.Progress. This is to remove
> > > > the need for updating the creation time in multiple locations.
> > > >
> > > > You can review the change here:
> > > > https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/666=
80
> > > >
> > > > Please note that this change will have an impact on any application=
s
> > > > that are currently reading the dump creation time from the EpochTim=
e
> > > > interface. These applications will need to be updated to read the
> > > > creation time from the xyz.openbmc_project.Common.Progress interfac=
e
> > > > instead.
> > > > Link to the interface
> > > > https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yam=
l/xyz/openbmc_project/Common/Progress.interface.yaml
> > > >
> > > > I would appreciate it if you could take a look at the change and
> > > > provide any feedback you have.
> > > >
> > >
> > > It looks like the potential concern would be with bmcweb.  There appe=
ars
> > > to maybe be some common code related to LogServices that expects all
> > > logs to have the Time.EpochTime interface.  Are you going to add
> > > alternative code there to look at the Common.Progress interface inste=
ad?
> > > Is this acceptable to the bmcweb side?
> >
> > Common.Progress interface is already implemented in dump entry and
> > bmcweb reads that
> > for the status of the dump, now that needs to be extended to read the
> > CompletedTime also.
> > >
> > > --
> > > Patrick Williams
> >
> >
> >
> > --
> > --------------
> > Dhruvaraj S



--=20
--------------
Dhruvaraj S
