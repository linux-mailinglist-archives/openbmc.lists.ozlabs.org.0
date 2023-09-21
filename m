Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B9A7A9810
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 19:29:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=nQx/TiNk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs2TT4vHjz3cNT
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 03:29:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=nQx/TiNk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs2Sv17Vtz3cCw
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 03:29:17 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31f737b8b69so1065261f8f.3
        for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 10:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20230601.gappssmtp.com; s=20230601; t=1695317353; x=1695922153; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRUFf3YqS8URCVLPv1BP//T1w/YX6ft/Ng6lXFBd1iI=;
        b=nQx/TiNk3h455v5XaJ0avltiMD9fEeEOplzTfUknOZ+YA/fH+06nlea+RObqFlkhIS
         Bgf23N2H8UWZmU6BLDNd96MyJhTRdUKT/h/ZzcshwaO9MKxw/I2Z11Fu2C9BZ/DuSHQz
         2g6G2aWPZPjJGZgssyvPZMsasFVYFhDdNNtRBW2SU2OtfE6LDjatYroCZWU6M8UjnbSe
         0quZiiPI8PrR7s5M5mC+sBtVtxEl/O24YbWKsv5duKFiHs23LHy+WrUyGcaXCpzFyPsB
         fU/WCFSvIdBsjJrhEVM2hEoWToHseM7yAyNJp4jn7n2GpZeF5mMJZtVSY32bAtLTsoJI
         RoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695317353; x=1695922153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRUFf3YqS8URCVLPv1BP//T1w/YX6ft/Ng6lXFBd1iI=;
        b=jziJVKFdmv4xte8JlXf0iBeZ7A73nHBT7+kIWM2vVM3oKvPBjiV8PguNymANzwf5Sr
         O1ezEOFiw6UTLh87OSrWd20xyki7e1Lh8LSZ0nFJYvvBsiVO42oCtIt40XQVeSbutzeu
         /CaMEIK+3eoxAsfazkQVccoQg+Ae1OE9C8l/lhE337JP68VqujqIacSFnB/5dulP6d7h
         HEydyU4CqvwFAs1K8tywKzyFzUwNCInvl38CMVcQ9zTG8WEZ5RAqrCib6INXI6Kp8Yzm
         PXe3pv8XtAsXadOXx+PozFrddlC5IlZTmZJUW/3c/kVHvF0Y/NqG/h+LJ1USENDDyP38
         1UUg==
X-Gm-Message-State: AOJu0YyuZe6e2abM9LDkXoBmKI/lfRG7GVe0LyK06tA+xZAjvFO4rEIu
	lsOB2CMgfkQgu9+xXqO0RD6wFLZw97u8UyMxBwmJNQ==
X-Google-Smtp-Source: AGHT+IFIwJ3ZoexSoniq+t3Vo8L2lmKpuuDS0v4dmBiGwrC42Aw8W+Vw22p+OLjQzQh/ikFW5Y1LCy2+TZMaEkNIfQs=
X-Received: by 2002:adf:f705:0:b0:31f:f432:b541 with SMTP id
 r5-20020adff705000000b0031ff432b541mr5024289wrp.69.1695317353413; Thu, 21 Sep
 2023 10:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7WosgDEJN8gaLu+mC3W1xKAysdZY_pHTz46vqTpun69G0hfA@mail.gmail.com>
 <ZQxjlifIOo96FJj9@heinlein.vulture-banana.ts.net> <CAK7Wosg0ffdvnEfok0EaRQym+EGbi8R+MXf_nVC9yXiEfozjNg@mail.gmail.com>
In-Reply-To: <CAK7Wosg0ffdvnEfok0EaRQym+EGbi8R+MXf_nVC9yXiEfozjNg@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 21 Sep 2023 10:29:02 -0700
Message-ID: <CACWQX80G4MQ7DKO40+uxQKTGW-CyffbUASGYmb_0y4=vanp+jw@mail.gmail.com>
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

On Thu, Sep 21, 2023 at 8:44=E2=80=AFAM dhruvaraj S <dhruvaraj@gmail.com> w=
rote:
>
> On Thu, 21 Sept 2023 at 21:09, Patrick Williams <patrick@stwcx.xyz> wrote=
:
> >
> > On Thu, Sep 21, 2023 at 08:52:15AM +0530, dhruvaraj S wrote:
> > > Hi,
> > >
> > > In the current implementation, objects implementing the dump entry
> > > interface implement both xyz.openbmc_project.Common.Progress (for dum=
p
> > > creation start time, end time, and status) and
> > > xyz.openbmc_project.Time.Epoch (for dump creation time, which is
> > > effectively the end time). This leads to a redundancy in specifying
> > > the dump creation end time.

Don't the two interfaces describe different things?  Time.Epoch
represents when the event occurred, not when the recording of that
event was complete, Common.progress represents when the
logging/processing of that event was complete.  In a lot of on-bmc
scenarios, they're going to be similar if not the same, but in the
case of something like a remote processor flagging an error, they're
going to be different.  An error might not be completely processed
until minutes later.

FWIW, in terms of complexity reduction on DBus, I think there's a lot
more impactful places to start for a lot less effort, but if this is
something you really want to chase to conclusion, and it reduces the
code complexity (measured by a net-negative diff patchset to OpenBMC)
and you're willing to test all the scenarios, feel free to continue to
chase it down.

> > >
> > > My proposed change updates the documentation of the interface,
> > > removing the reference to xyz.openbmc_project.Time.Epoch and adding a
> > > reference to xyz.openbmc_project.Common.Progress. This is to remove
> > > the need for updating the creation time in multiple locations.
> > >
> > > You can review the change here:
> > > https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/66680
> > >
> > > Please note that this change will have an impact on any applications
> > > that are currently reading the dump creation time from the EpochTime
> > > interface. These applications will need to be updated to read the
> > > creation time from the xyz.openbmc_project.Common.Progress interface
> > > instead.
> > > Link to the interface
> > > https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/=
xyz/openbmc_project/Common/Progress.interface.yaml
> > >
> > > I would appreciate it if you could take a look at the change and
> > > provide any feedback you have.
> > >
> >
> > It looks like the potential concern would be with bmcweb.  There appear=
s
> > to maybe be some common code related to LogServices that expects all
> > logs to have the Time.EpochTime interface.  Are you going to add
> > alternative code there to look at the Common.Progress interface instead=
?
> > Is this acceptable to the bmcweb side?
>
> Common.Progress interface is already implemented in dump entry and
> bmcweb reads that
> for the status of the dump, now that needs to be extended to read the
> CompletedTime also.
> >
> > --
> > Patrick Williams
>
>
>
> --
> --------------
> Dhruvaraj S
