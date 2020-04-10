Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E6B1A4BCE
	for <lists+openbmc@lfdr.de>; Sat, 11 Apr 2020 00:16:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zXR26nCszDqTX
	for <lists+openbmc@lfdr.de>; Sat, 11 Apr 2020 08:16:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ss4hhumS; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zXQ86SMtzDqFv
 for <openbmc@lists.ozlabs.org>; Sat, 11 Apr 2020 08:15:28 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id g23so3193960otq.4
 for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2020 15:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IxX7IdkN66pBpGa/xcmaFfvfEhtsw69Vf7VfNWosYQA=;
 b=ss4hhumSSU4jsxmQEANuzOml2kjUagdWlk55XidmKuTgzopgcMYyrko4i1n++Rgwjv
 1GF/6WreL4RYCW5VNDj5DBjmsB5nWWVs1wqnpg66l+g3SscbnzSExUNqYM0RQEEdfpUo
 DIfL4wdOKkpRFL81JjIdvbgZFZ5N10PzymbHuGDBVr7LVaOdahWVfyIXMb1EM8Fpugo5
 HxxCY0dya68uACMSq0chRp5L6AmFBwTijaGelhKcNzn+XfoCskm0zcfkBm+xT40E0MSj
 I6qACwrUGVQucoCou43rZiIShRGPJn2Ek5c8lFPwUD+v6sETSa7hXpcbnjXCuSYq5+SA
 6cnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IxX7IdkN66pBpGa/xcmaFfvfEhtsw69Vf7VfNWosYQA=;
 b=C9cL8wn8Q2GffrnTkgdenqfj0UauDx8p6DqexokMQhFJmCbiSsIy3ZkPdVNl54d3M6
 hJevYBl7RRUvVTRQq8OAKvPev8PqP82saEPLWhSfWmypFHVIitAyXRS49NxaJd19w7WE
 vpNouIvzrC+Wvi+VOdcgLls3zUWkhYDHNx8MyJUE3kSDfE82R7KdINIQE2RqMyUKdbS0
 jMihkpgxxbJQ2HjS0rYKwVsSjTbVg3QHUYvP0P3PSEj6xECo+QdEqv0iB4igGN0sOTAt
 q9zR9HqgbNyI68uSOMtNty1cvU2KfoMtUkebcbyh7yBRiOsN9juNv79yr+9qEte6vduB
 r+Qw==
X-Gm-Message-State: AGi0PuYqhiPe+KHKcrfHXuGca1bg6IjXyV6QLXhQbXxxYFjiCiziKLjP
 vv0Atk1FAzduB9DnFYqJXyY=
X-Google-Smtp-Source: APiQypLcT9FQCsSFSI2LDtD5AV9QDBOLHhh+gM+LP2zOHKhh1MAngLMgjBoDyrI9nJ1mjMUcdzsI9w==
X-Received: by 2002:a05:6830:19d8:: with SMTP id
 p24mr5828911otp.309.1586556924778; 
 Fri, 10 Apr 2020 15:15:24 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:cdbd:448f:4511:9cd3])
 by smtp.gmail.com with ESMTPSA id f45sm1820436otf.30.2020.04.10.15.15.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Apr 2020 15:15:23 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Call for Gardening Tasks
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <CAH1kD+bqZfeO8ezvwbmjx_PZ4vaKyhxGgvirVz13P3FK9UDBWQ@mail.gmail.com>
Date: Fri, 10 Apr 2020 17:15:23 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <841AE66A-2FCC-4381-97A4-792394890834@gmail.com>
References: <CAH1kD+bqZfeO8ezvwbmjx_PZ4vaKyhxGgvirVz13P3FK9UDBWQ@mail.gmail.com>
To: Richard Hanley <rhanley@google.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Apr 9, 2020, at 4:54 PM, Richard Hanley <rhanley@google.com> wrote:
>=20
> Hi everyone,
>=20
> Last week I started a thread on Open BMC Gardening, and I wanted to =
kick off the process.
>=20
> The basic idea here is to get a survey of various improvement tasks =
throughout OpenBMC.  Some things might be small refactoring or changes =
that can be done incrementally (i.e. weeding the garden). Other tasks =
might be more research or structural (i.e. excavating the garden).
>=20
> Just getting these in writing can be helpful for others to gauge what =
they should focus on. It also helps leave breadcrumbs for any new =
developer interested in the subject.
>=20
> So here's how I see this working. Anyone who has some ideas can reply =
to this thread with a short to medium description.  Try to avoid new =
features, and instead look at ways we could improve the status quo. =
Think about changes and tools that would make your day to day life =
better.

Meson Migrations
Moving projects over to meson build system. I think(?) we can all agree =
it=E2=80=99s the best build system for OpenBMC. There=E2=80=99s some =
good examples out there of other repos doing it. Should be fairly easy =
for a new person to migrate a repository over and gets them some good =
experience with the community.

Gerrit Owner Plugin
Gerrit provides the ability to assign maintainers on a sub-directory =
basis. We just need someone to dig into this a bit. This would provide =
some added flexibility on co-maintainers on repositories and allow my =
next item to go forward.

Build Simplification
Go back to everything in openbmc/openbmc and get rid of the meta-* =
sub-repos. I believe this was mostly done so we could have more fine =
grained maintainers. It makes things complicated (merge into sub repo, =
merge bump into meta-*, then run another script to move the meta-* into =
openbmc/openbmc) and doubles our CI resource requirements.

Systemd Visualization
Another complicated area of OpenBMC is our systemd targets and services. =
Building on the upstream tools to visualize our systemd targets and =
services would be useful to new people.

>=20
> =46rom there we can do a write up about what we know about the issue.  =
This can function as an early stage design doc that gives a broad =
overview on where the dev's head is at right now.
>=20
> Finally, we can do a quarterly review to keep the garden refreshed. =
Obviously, things can change between that time, but having a =
semi-regular cadence will hopefully give us a better chance of keeping =
this up to date.
>=20
> - Richard

