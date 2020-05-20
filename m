Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BD21DA7F0
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 04:26:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rc7V4yVyzDqWW
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 12:26:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::235;
 helo=mail-lj1-x235.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=VtPgEaYa; dkim-atps=neutral
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Rc6l1XSrzDqNS
 for <openbmc@lists.ozlabs.org>; Wed, 20 May 2020 12:25:33 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id w10so1904410ljo.0
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 19:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XdnCIvUKcinUb/gDz27tgm86WdzihAkb0OvC0kwQb7E=;
 b=VtPgEaYaIdqPpiKisHcMNu/NsJCcCBJWyzUb2jzYNqDkAlfWAmxoCZuxNgsuIZ/WvG
 ExChfol+qwaQaSpBJOLxFdGJhuE9hrad+uRf6U63U1dwfk0OCVZfsDO1Mr9kvTP4wE9g
 sDF85AOL0b3Xrp9c8KcjPL+azeHgu9Hr8TAkW9opm24L3IvE+9nRtwt+m977nnX5mynj
 luMHHhut+DfKBFELXwkmOz2PQqN3YFEFwddMc4ZMavY3fyBHEDfY8rl+7KJ+NO5nlE9r
 yLqOZCeXosPwl2VLKPfWV5BgEq8Cgpg2nEAV0XgCtLALnVtd5Uc0KzSsGvZT3lKh0txG
 cUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XdnCIvUKcinUb/gDz27tgm86WdzihAkb0OvC0kwQb7E=;
 b=a5tajxLuSaqaRy/aBfQJpN/q3VHE7PBqg0aVsqbZYhZ0OqbrCJMJc9UuKyxvXq0EUN
 WmZMRGVy6a+BV3+H0fMdGR9KvIiQ4gnrKCt7W/ATcyYMst286vp6a4OXwEy4LOOrXedE
 P9pvoN44h59Ed5TMWx5Y+paxugUrCn1tSosCVjtu1/zf31QZHIeTX/bLRm1hH0NcMCRb
 Ba3aj49QQgDIVom5rQyZ9zYvH1rZm/DQfgCSMbYGsbYfMwW8IhIy+X1TsLIpIKGl+b3t
 HQHQ6czCRJlPvRBE473YMYi7j1BdZgekU2yHOpFo3HJvdeTb6EioUtuUxKTlimY8V3mU
 NMZw==
X-Gm-Message-State: AOAM530rPd2VRxWIcH0oWsIf8tWt4w8qLjJxWZ/RR0xG0r+qTRTch2Eq
 eQOg6RV0+PKbuu2tPqPTl1dR2pnKsBZYkdL+V/JEhw==
X-Google-Smtp-Source: ABdhPJxkxSIFD0wGYIwYYVvbI5v9nfTr9lUP6SQw8jaS/i3mDSQqIO9rFjpZPLFKZY/YqY2tPypulmqrE5L8qZj0hwc=
X-Received: by 2002:a2e:8901:: with SMTP id d1mr1384097lji.37.1589941526487;
 Tue, 19 May 2020 19:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <d7da4861c449609d2cf1b1b1434c653e9a27a805.camel@ozlabs.org>
 <AA2FE467-1072-4CD6-BA9F-3AAAD40DC8E0@gmail.com>
 <CAGm54UFc15aXH9qJz+-hig8NDbX-bVxjpZa-g-9Bg=uUpjEydQ@mail.gmail.com>
 <9b94cd92ae0d06992f897fa3e5008a1537498578.camel@fuzziesquirrel.com>
In-Reply-To: <9b94cd92ae0d06992f897fa3e5008a1537498578.camel@fuzziesquirrel.com>
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Wed, 20 May 2020 10:25:15 +0800
Message-ID: <CAGm54UG0FZ38QzY0rROYVnk3izTE46SNb1D39Hdbz77xz3POZQ@mail.gmail.com>
Subject: Re: Reducing fragmentation in OpenBMC
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 19, 2020 at 8:50 PM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
> On Tue, 2020-05-19 at 10:25 +0800, =E9=83=81=E9=9B=B7 wrote:
> > On Tue, May 19, 2020 at 8:53 AM Andrew Geissler <
> > geissonator@gmail.com> wrote:
> >
> > > I know phosphor-dbus-interfaces has always been a bit onerous. I do
> > > feel like
> > > we get some good stuff in the reviews though. It also ensures we
> > > have
> > > documentation  of our interfaces. The cross-repo dependencies we
> > > get are a bit frustrating (i.e. need to get interface merged and
> > > bubbled into
> > > openbmc before you can implement). There=E2=80=99s also no versioning
> > > concept so
> > > if an interface needs to be changed, it=E2=80=99s a huge pain. Ideas =
on how
> > > we could
> > > make this easier but keep the benefits? Or people that don=E2=80=99t =
use it
> > > and just
> > > define their own interfaces, any improvements we could make to get
> > > you to use it?
> > >
> >
> > This usually involves the repo CI.
> > If we could implement "Cross-repo dependencies", making the Jenkins
> > job able to pick the "dependent" revision of phosphor-dbus-interfaces
> > (or sdbusplus, or else), and build a docker container with the
> > dependencies to run the repo CI, the issue could be resolved.
>
> This would be a nice feature to have in our CI when cross repo
> dependencies come up.  But I don't think  having that would give us
> free license to add cross repo dependencies everywhere though - I would
> like to see us come up with a system that avoids the need for cross-
> repo dependencies in the first place.

As Andrew indicates, phosphor-dbus-interfaces is the major cross repo
dependency already.

--=20
BRs,
Lei YU
