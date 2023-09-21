Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D1C7A98CE
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 19:53:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=SB2hWfWi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs30W1111z3cPY
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 03:53:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=SB2hWfWi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs2zx6Gtrz3cGM
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 03:52:45 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-32155a45957so1278744f8f.0
        for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 10:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20230601.gappssmtp.com; s=20230601; t=1695318762; x=1695923562; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0BCit8oFRVK6DCjmuh8VhNLh3RNvlRpqYwzmzapQbQ=;
        b=SB2hWfWikOV8rkea7lwWck3z6lDymcvkNOSHQc6siYkDNEhk03jdnGgNRyhsKR/JNd
         4WIhTIyvDbDOGxEEHNZ/JiN7BY4jnIvmX88UwdJhG0j24c84k9LW+5kYRNXJOlO9bRfj
         2ciLVxiVwpqhPl8Qz/AZSBfqU3stv7MwKk4mhDyDDsB0VXm20qSGWfBAO4TurrE1RU4/
         Vq83K7OxrWhDhwk30WJLd+nmtwk/D67179aGtY6eOZHE0XL5FJ9ga6+6CY/ix7H7ed7s
         YQ54Y4jNoSlrpcEKuKzkGomcQGUPYyfy2WzT9j1MFY/jjSNEpr5GHtcxAjyr2GyqLd/R
         t9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695318762; x=1695923562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0BCit8oFRVK6DCjmuh8VhNLh3RNvlRpqYwzmzapQbQ=;
        b=bHlYHS5Aqg4Vx3S1kgawCngyqlQL9s6ky69a51matQ/cj8QaXbEms/zt466h9LqCVC
         +j2PkPfDW40AksQU6NEeQSUX51MgDZS2wPJ5FY1KInH8zCe5HOVvsF7pUVVSdrzRbcrF
         AayjAGXw/9mWDmCc2G+8SLKDND6vqZ7vGExj3wWhHpPIZIuLrVG19LRJt4PuMmnGk8/L
         d4yatTNMmdkVvnPpuPvEJujFL0uGWAeQPE8m90CuesMGbH1qFK9+EpTZzENANvKpeEtn
         cu4dpD+fr2nwmRVzfwGExkxYrE7o5DmwKunyVe+4zHzdvkGjn3gTCuDKzkj9VzFp/yIl
         H7HQ==
X-Gm-Message-State: AOJu0Yx9ISw2llpF8A/gCW3mBmOCkcKBrVM47Sggb6LKQUTKk4U0QaDy
	vapvqJ5PbJ4lIRR7RDfsldNa+1vVYQYv+vhxOmr7qQ==
X-Google-Smtp-Source: AGHT+IGMLo77Vpym16p2Qc17ZYRmv1ftEeY//SO7Pu5+dNlwFQjbiNLv98cMIbBO986OU3IwLeTCzbFgNYExSPfDzT0=
X-Received: by 2002:adf:ef0e:0:b0:321:5971:23a5 with SMTP id
 e14-20020adfef0e000000b00321597123a5mr5417896wro.20.1695318762385; Thu, 21
 Sep 2023 10:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7WosgDEJN8gaLu+mC3W1xKAysdZY_pHTz46vqTpun69G0hfA@mail.gmail.com>
 <ZQxjlifIOo96FJj9@heinlein.vulture-banana.ts.net> <CAK7Wosg0ffdvnEfok0EaRQym+EGbi8R+MXf_nVC9yXiEfozjNg@mail.gmail.com>
 <CACWQX80G4MQ7DKO40+uxQKTGW-CyffbUASGYmb_0y4=vanp+jw@mail.gmail.com> <CAK7WosjzxY_MK1ukg7GPZGkuK6JW-CShmjjX0Z34x_WdH5_tpw@mail.gmail.com>
In-Reply-To: <CAK7WosjzxY_MK1ukg7GPZGkuK6JW-CShmjjX0Z34x_WdH5_tpw@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 21 Sep 2023 10:52:31 -0700
Message-ID: <CACWQX82=RCt2xOy5jhZhiawLyONUFYdx8jw75q5T4B_kHnXtdA@mail.gmail.com>
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

On Thu, Sep 21, 2023 at 10:47=E2=80=AFAM dhruvaraj S <dhruvaraj@gmail.com> =
wrote:
>
> On Thu, 21 Sept 2023 at 22:59, Ed Tanous <ed@tanous.net> wrote:
> >
> > On Thu, Sep 21, 2023 at 8:44=E2=80=AFAM dhruvaraj S <dhruvaraj@gmail.co=
m> wrote:
> > >
> > > On Thu, 21 Sept 2023 at 21:09, Patrick Williams <patrick@stwcx.xyz> w=
rote:
> > > >
> > > > On Thu, Sep 21, 2023 at 08:52:15AM +0530, dhruvaraj S wrote:
> > > > > Hi,
> > > > >
> > > > > In the current implementation, objects implementing the dump entr=
y
> > > > > interface implement both xyz.openbmc_project.Common.Progress (for=
 dump
> > > > > creation start time, end time, and status) and
> > > > > xyz.openbmc_project.Time.Epoch (for dump creation time, which is
> > > > > effectively the end time). This leads to a redundancy in specifyi=
ng
> > > > > the dump creation end time.
> >
> > Don't the two interfaces describe different things?  Time.Epoch
> > represents when the event occurred, not when the recording of that
> > event was complete, Common.progress represents when the
> > logging/processing of that event was complete.  In a lot of on-bmc
> > scenarios, they're going to be similar if not the same, but in the
> > case of something like a remote processor flagging an error, they're
> > going to be different.  An error might not be completely processed
> > until minutes later.
> The progress interface contains both the start time and completed
> time, the start time

That's the time that the dump started.  The dump could've been
triggered by something that happened before it started, because of
scheduling or resources.  To be more clear, the timeline goes
something like:

Some hardware failure happens -> Time.Epoch
Dump creation starts -> Common.Progress.Start
Dump creation completes -> Common.Progress.End

If the dumps are manually triggered, and there is no queuing time,
yes, steps 1 and 2 will likely report the same value (which is the
common case), but that doesn't mean they're the same in all cases.

> is set when the request comes and completed time once the dump package
> is completed, EpochTime is also set when the packaging is completed, so b=
oth
> are representing the same value now.
>
> >
> > FWIW, in terms of complexity reduction on DBus, I think there's a lot
> > more impactful places to start for a lot less effort, but if this is
> > something you really want to chase to conclusion, and it reduces the
> > code complexity (measured by a net-negative diff patchset to OpenBMC)
> > and you're willing to test all the scenarios, feel free to continue to
> > chase it down.
> >
> > > > >
> > > > > My proposed change updates the documentation of the interface,
> > > > > removing the reference to xyz.openbmc_project.Time.Epoch and addi=
ng a
> > > > > reference to xyz.openbmc_project.Common.Progress. This is to remo=
ve
> > > > > the need for updating the creation time in multiple locations.
> > > > >
> > > > > You can review the change here:
> > > > > https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/6=
6680
> > > > >
> > > > > Please note that this change will have an impact on any applicati=
ons
> > > > > that are currently reading the dump creation time from the EpochT=
ime
> > > > > interface. These applications will need to be updated to read the
> > > > > creation time from the xyz.openbmc_project.Common.Progress interf=
ace
> > > > > instead.
> > > > > Link to the interface
> > > > > https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/y=
aml/xyz/openbmc_project/Common/Progress.interface.yaml
> > > > >
> > > > > I would appreciate it if you could take a look at the change and
> > > > > provide any feedback you have.
> > > > >
> > > >
> > > > It looks like the potential concern would be with bmcweb.  There ap=
pears
> > > > to maybe be some common code related to LogServices that expects al=
l
> > > > logs to have the Time.EpochTime interface.  Are you going to add
> > > > alternative code there to look at the Common.Progress interface ins=
tead?
> > > > Is this acceptable to the bmcweb side?
> > >
> > > Common.Progress interface is already implemented in dump entry and
> > > bmcweb reads that
> > > for the status of the dump, now that needs to be extended to read the
> > > CompletedTime also.
> > > >
> > > > --
> > > > Patrick Williams
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
