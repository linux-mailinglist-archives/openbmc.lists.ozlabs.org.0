Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D3B8D4590
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2024 08:44:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=AYcT6ICl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqcF44R3nz3ck4
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2024 16:44:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=AYcT6ICl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=yulei.sh@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqcDS6f2Jz3cYM
	for <openbmc@lists.ozlabs.org>; Thu, 30 May 2024 16:44:22 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-60585faa69fso353282a12.1
        for <openbmc@lists.ozlabs.org>; Wed, 29 May 2024 23:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1717051460; x=1717656260; darn=lists.ozlabs.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsBLgcj9j5gl7P+eUKaebDQIxwhoG6saI3aXR3FN5iM=;
        b=AYcT6IClaEI9MB53+ueq/KIKwgXu0Ccrb0IaCzZdPvI1htTweqYyi/LrHEJ3xN8/wt
         C3hose4qDJlnTEHTR2Msp4A8QRi6Gv4LmpZBEv4vyfzJnc1nL/g589e7csSBVnxeHxMC
         OVwIetSbfccyvZUq7gle1XmbewP5cf10VWDVdvNRNmiaTDwMsvrLyE4H2fb1UzzQYU48
         AXUtIKQc1C3HU004pDjJMeJjgtJqhP4QwF/2vXYss4XQLzti996AkPgLvwyld3/rIncM
         EGhZc8LguyzEbrf8UlR95xZyyUzEb9wTnGN0k5inNksQtS3nxIk+xkMs072T2bE6hayK
         AeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717051460; x=1717656260;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsBLgcj9j5gl7P+eUKaebDQIxwhoG6saI3aXR3FN5iM=;
        b=W9I//zQPdokyVL7tIUs9pkP66/vRB6/u6sozfEOAgoRDJycC2C108nJNXxEmZGHPFz
         fkuECFXp3316uxpy9SOqhFa76QRIV6BCZX3Jfzpv3+aK8t4V9yPkZBmC+GoaHZ/5dj6u
         b8e7KTzgk7vNJ/QGmUElzl/3ww/jiVU/tW8JV8zzVqUFuwQi3gVLW2PH+Gpex3hqL7jQ
         wWxFPNjuy2gV6W5Z7qlE8MGMHGEB15VvaoDAm5EpHCY234QSB7cY5/VlnH67BlqjZJil
         UifQtNuCDrNdh7dTTCIn0ypS7V9+3HtAl9lmI/wzEgw480838Y9xyRsV2IZBiYr3R0CS
         LfZg==
X-Forwarded-Encrypted: i=1; AJvYcCXFsXu3BSAYasRY5KYON7o1jXROaJqJJx7JmHrKr6Gh4M+zWvKtZLPGN22QszUQg9VM+6aCX8DtSNmGHHVlKdizH32ZgsWOGd4=
X-Gm-Message-State: AOJu0YzLvyph/xDpI7VqMQ3Iys0SDKcJGVl6UyduClUPrbU4920eH79x
	SG8Bz1Cf6fHPmYzu0Vb/pZW1FvW5rRkdxKAHWn9yHV3DZ7FxSUB6cXm//z+Wc9MFQU/2ECmP1f8
	TISuQMI/7bKxpfD9YAseans173goNhIICcmpH1p2Oj/sMZftjNOm0Dbcf
X-Google-Smtp-Source: AGHT+IFMyBC0QILSsOgyhc0aN9DFb8A1XnKRyXxewmHAOf16ELSuSiSpL2FDNPJInUVjqgQ50JJWSLX5U3SyT38H2OM=
X-Received: by 2002:a17:90a:38c4:b0:2ab:8324:1b47 with SMTP id
 98e67ed59e1d1-2c1acc59d8fmr1659281a91.15.1717051459883; Wed, 29 May 2024
 23:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <ZlYU4X1sXIou-C6L@heinlein.vulture-banana.ts.net>
 <CAGm54UG-KQ2HZosGQRwwjmGq4GUZcbfs5csAj2i4+AfXd8E7yg@mail.gmail.com> <ZlcfrFHcxsUGiBng@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZlcfrFHcxsUGiBng@heinlein.vulture-banana.ts.net>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 30 May 2024 14:44:08 +0800
Message-ID: <CAGm54UEq373aFszGadrvDynAOUG+qtu1=e_5T7V7tZUzpSs2PA@mail.gmail.com>
Subject: Re: /var/log as persistent
To: Patrick Williams <patrick@stwcx.xyz>, OpenBMC List <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 29, 2024 at 8:29=E2=80=AFPM Patrick Williams <patrick@stwcx.xyz=
> wrote:
>
> On Wed, May 29, 2024 at 11:49:15AM +0800, Lei Yu wrote:
> > On Wed, May 29, 2024 at 1:41=E2=80=AFAM Patrick Williams <patrick@stwcx=
.xyz> wrote:
> > >
> > > Hello,
> > >
> > > It was pointed out that I did not do a good job of broadcasting a cha=
nge
> > > I made back in March, so I am sending this out for awareness now.
> > >
> > > https://gerrit.openbmc.org/c/openbmc/openbmc/+/69959
> > >
> > > A default setting from bitbake (to VOLATILE_LOG_DIR) was causing some
> > > platforms to not be able to persist `/var/log` and instead it was
> > > mounted as a temporary directory.  This meant that even if you
> > > explicitly configured journald to use `/var/log` (instead of the
> > > `/run/log` it uses by default) you would not get persistent journalli=
ng.
> > > It also meant that applications like `obmc-console` log files were no=
t
> > > persistent and would be lost in a BMC reboot.
> > >
> >
> > 1. VOLATILE_LOG_DIR is defaulted to `yes` in poky/meta/conf/bitbake.con=
f
> > 2. With static layout, the above config makes the `/var/log` a
> > volatile dir linked to `/var/volatile/log`, where `/var/volatile` is a
> > tmpfs.
> >
> > Be noted that it's the default for OpenBMC machines with static flash l=
ayouts.
> > So the journal log and obmc-console were volatile **by default**.
>
> I was still surprised that the journal was being persisted for you with
> this change.  I'm looking now in more detail at the journald.conf because
> there are only a few platforms that explicitly set `Storage=3Dpersistent`=
.
>
> The primary reason I made this change was because setting the journal
> config had **no effect**, which is, I think very unintuitive.

Agreed that it's "unintuitive" for `Storage=3Dpersistent` had **no effect**=
.
But as I mentioned before, it's the "default" behavior in OpenBMC
builds with static layout.

>
> It seems that the default journal config is `Storage=3Dauto` which means
> that it will be volatile only if `/var/log/journal` exists.  This might
> be why you are now seeing it persist.
>
> > Users should not expect the above logs to be persistent, and if they
> > do, they could config `VOLATILE_LOG_DIR` to `no`, which is done in
> > `mtjade` and `mtmitchell` layer.
>
> Conversely we could have machines that want it to be non-persistent to
> set VOLATILE_LOG_DIR, right?  It isn't obvious why one default is
> "better" than another.
>
> My impression is that VOLATILE_LOG_DIR is default partially because
> syslog is also the default.  As I said, with VOLATILE_LOG_DIR,
> `Storage=3Dpersistent` has no affect.
>
> If the only discussion here is really about the systemd-journal, we can
> add a PACKAGECONFIG that chooses between `Storage=3Dvolatile` and
> `Storage=3Dpersistent`.  It seems we already have 3 different meta-layers
> with a custom journald-config to trigger this, so we might as well
> consolidate those.
>
> > The change `https://gerrit.openbmc.org/c/openbmc/openbmc/+/69959`
> > makes `VOLATILE_LOG_DIR` to `yes` by default in `meta-phosphor` layer,
> > which effectively affects all OpenBMC builds.
> >
> > > I had asked a few machine owners and most of them either had it set t=
o
> > > explicitly unset `VOLATILE_LOG_DIR` in their meta-layer or through so=
me
> > > downstream changes had overwritten it.  So, I made this the default.
> > >
> > > I thought this only affected:
> > >    - machines that explicitly set `Storage=3Dpersistent` in the journ=
ald
> > >      config.
> > >    - everyone's obmc-console logs.
> > >
> > > Based on the report from a downstream user, it seems like there might=
 be
> > > more effects?  I'm not sure at this point, but advertising it wider.
> >
> > As above information, OpenBMC users were expecting "volatile" logs
> > before, and we should keep it default.
> > So I would suggest we revert the change to keep the consistency about
> > the default volatile log dir.
>
> Were they "expecting"?  This is where I did ask a few of the machine
> owners who have upstream systems in production.  All of them told me
> they overwrite this already.

What do you mean by "overwrite" here? In upstream systems, we only see
`VOLATILE_LOG_DIR =3D "no"` in `meta-ampere` layer. (Check out to
`828c130f59^` and `git grep VOLATILE_LOG_DIR` shows the result.)
All other layers were using the default `VOLATILE_LOG_DIR =3D "yes"`

>
> I highly suspect that any commercial system is going to want
> persistence.  I can understand what you have referred to with rsyslog
> for cloud systems.  I think this is one of those cases where whatever
> the default is, it won't satisfy everyone.  (We would be considered a
> "cloud" style system but don't want to rely exclusively on rsyslog
> because you then don't get visibility to debug network issues.)
>
> > And for the reasons why I prefer the volatile log directory:
> > * In most OpenBMC machine builds we see 32/64/128 SPI flashes are
> > used, so the `rwfs` is limited and the frequent "writes" to the SPI
> > flash costs the lifespan.
>
> Are you seeing lifetime issues with SPI-NOR?  Aren't they rated for at
> least 1 million erase cycles?  Even with the static layout, where all
> writes are going to the same location, that should give you 32 years of
> use at 1 erase per second (assuming only 4MiB of rwfs space).

In case you have many logs in obmc-console, there could be much more
erases per second.

>
> > * To collect the logs, we could either use rsyslog or the host-logger
> > (which were "already there") to send the logs to remote servers. So
> > there is no strong requirement to make the logs persistent.
>
> Are you really wanting obmc-console to *not* persist?  Do you think most
> people want this?  This is a bit surprising to me because obmc-console
> already has configuration limiting the size of the log files and it has
> a rotate functionality; the amount of space (and erase cycles) used by it
> is probably low.

I can not speak for others, but what is true is that before the commit
`828c130f59` all OpenBMC upstream builds (except meta-ampere) were
using `VOLATILE_LOG_DIR =3D "yes"`.
