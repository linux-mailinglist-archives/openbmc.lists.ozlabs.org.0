Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3385205AE
	for <lists+openbmc@lfdr.de>; Mon,  9 May 2022 22:09:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kxshj4Dr7z3cKr
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 06:09:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=N2AWjEE0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::332;
 helo=mail-wm1-x332.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=N2AWjEE0; dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxsgH6l05z3bdN
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 06:08:26 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id
 a14-20020a7bc1ce000000b00393fb52a386so184621wmj.1
 for <openbmc@lists.ozlabs.org>; Mon, 09 May 2022 13:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IB8TfyTbS5+OJan4iajXnbZyomuAmKBgvnGrKo2onbs=;
 b=N2AWjEE0P85Gzt/PXcUoMhKsg8Rz7CN4INqAcR1D0GVV3eH1LT8QbGnKKpvH8a8xBH
 JhANSW3GqdNTrPGRXo/OkB+afcg6kNcC/b7fiywSMuU4cpQ6tq+xNFw9DYNM5Zzcewqw
 nzAXH5SQxffgB+ROmHeM2Hp7M64u8Vtv/nnsaQ+N7djfx7sLRvQ+/rje1Ty33z00MYlx
 SgvySBG06pBvVy2M58zspO2T0BaOh+b9QwW5ZrJP5zLZgUuc0HOM43gH/hZnjqOAI6uJ
 zQTcE8bIjovVR8EkB5lDhMu/1pb5pjHIxL9Ywg+WWw1fWXleuBnLbjs3gYnzSu8kVnuX
 WRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IB8TfyTbS5+OJan4iajXnbZyomuAmKBgvnGrKo2onbs=;
 b=umRXr9d1+t5KcbDd7waBWvkg/u4rf+LWu1HEiDUmwIZqUupAUQsGt2wYqhqpudu1gl
 8dPUXne9jfzl2bUfWyLctgcWg4aV0Il1kELJCXctKUs9j8iIUH39ysAqAtF1DLTzRL7m
 ELAifWVILcQFeFJ0Qe/DCTAMITI3lLYnHfvfxunZaPcWSKw453GXAuuiedYSch3I46Su
 ATGKOSogMf9kzczTGE0O5Vc6ohWhpF/FoGc5OZ0MlCQuKOJPlIcjcgvfUnf8W8c6H1kD
 /8Hq0oHfZEPRh0h+UMlg5tRusPHHTxjBG77+ncwBDNkJDWdgvdv83hZtPviQjIgyQNx4
 lm0g==
X-Gm-Message-State: AOAM532i98AS8GJrTYwuhUwgXbTyi+GdKNxA3rglEnJmi5fi8/xpoY0y
 IkrwF2l4fgcgaDkenlSTs5+XmV3T2EPF4di0kWxh8A==
X-Google-Smtp-Source: ABdhPJx0w94RtA1061MBuq5/ksPcWKdHpzJ3yE1EO/UxeBbVODpwWaNbemBIuXunTB4hQH5WxmZbO7cXKVuPwk4pneo=
X-Received: by 2002:a05:600c:1151:b0:394:6816:d4f2 with SMTP id
 z17-20020a05600c115100b003946816d4f2mr23545778wmz.195.1652126900458; Mon, 09
 May 2022 13:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <16ba58d6-d06b-1c92-340b-e94119a47708@linux.intel.com>
In-Reply-To: <16ba58d6-d06b-1c92-340b-e94119a47708@linux.intel.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 9 May 2022 13:08:09 -0700
Message-ID: <CAH2-KxDkugwGbZZEenBObwzJENCXTUDGtZn5TXPi7c3Kkog5DQ@mail.gmail.com>
Subject: Re: Running OpenBMC Daemons/Applications as non root using D-Bus
 Session/User Bus.
To: nirav.j2.shah@linux.intel.com
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
Cc: openbmc@lists.ozlabs.org, nirav.j2.shah@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 2, 2022 at 2:58 PM Nirav Shah <nirav.j2.shah@linux.intel.com> w=
rote:
>
> Hello,
>
>
>
> I am new to OpenBMC (and BMC ),

Welcome!  Glad to have you.

> so apologies if I am posting this in the wrong place. I have been looking=
 at this issue.  Here is my summary of the problem statement, please do com=
ment and let me know if I got this right.
>
> The biggest challenge is the use of system bus and non root access to the=
 system bus.

This statement could be phrased a little more precisely.  The biggest
challenge is that:
1. bmcweb (and all user-facing daemons) run as root.
2. There is no way to define an ACL such that a user-facing daemon
would not have access to something.
4. User-facing daemons enforce their own authorization systems,
instead of relying on something out of process, which makes them more
vulnerable than is ideal.

> As previously suggested an ACL based approach can work. (whether it is us=
ing a D-Bus ACL configuration file or SELinux)
> However, it does require an exact configuration to cover all security sce=
narios (for MAC) and IMO =E2=80=9Cmay=E2=80=9D make debugging efforts harde=
r.
>
> Coming from a desktop background (which additionally uses D-BUS session/u=
ser bus for user isolation), I was investigating if having a session bus wo=
uld help. For OpenBMC, the idea would be to allow non root application to c=
ommunicate with each other and with root** applications on a single session=
 bus to begin with. This can be further augmented using ACL based approache=
s if needed. I have a small POC, which tests this on OpenBMC with D-Bus bro=
ker

I think the thing you haven't touched on here is that in the way linux
generally uses these, session busses are spun up per-user session,
which provides some level of abstraction and segmentation between
various users.  it'd be interesting to talk through that as an
architecture, and how it maps, but as Patrick points out elsewhere,
simply moving nearly everything onto a shared session bus doesn't
really do much to solve the security concerns.

An architecture that would be interesting would be:

1. On creation of a session, bmcweb registers the session with linux,
and gives the session that users permissions levels, similar to how a
"normal distro" session manager would act.
2. ACLs would define specifically (at dbus level) what that user was
allowed to do.  Ideally we could drive some of these from
PrivilegeRegistry.
3. When user requests come in, bmcweb would route the requests to the
appropriate session bus for that user.

And in theory, at the end, we could remove the permissions code from
bmcweb, because we'd be relying on linux permissions, which are
arguably better.

>
> To run the demo
>
> As root, copy files dbus_session.service and dbus_session.socket to /etc/=
systemd/system/
> useradd nirav //or change the .service and .socket file to your user
> systemctl daemon-reload
> systemctl start dbus_session
> ps | grep dbus //will show an additional dbus-broker running
> compile dbus_server.c and dbus_client.c using yocto sdk or write a receip=
e
> ssh as root, export DBUS_SESSION_BUS_ADDRESS=3Dunix:path=3D/run/user/bus1=
 and ./dbus_server
> ssh as nirav, export DBUS_SESSION_BUS_ADDRESS=3Dunix:path=3D/run/user/bus=
1 and ./dbus_client
>
> With the POC I was able to =E2=80=A6..
>
> Show dbus_broker_launch =E2=80=9C=E2=80=93scope user=E2=80=9D works on Op=
enBMC (A session busses can be created using the right system unit files an=
d launcher provided by D-Bus broker)
>
> Since I am new to D-Bus broker and systemd I had to confirm this.
>
> Show DBUS_SESSION_BUS_ADDRESS is the only env variable required by root t=
o access the session bus of another user. There is a limitation here, discu=
ssed below.
>
> As far as the actual solution, idea would be to have a configuration file=
 to specify which D-Bus interfaces can be on the session bus. An opt in mod=
el which does not need any modification to existing and future OpenBMC daem=
ons/applications would be the goal but there are limitations =E2=80=A6..
>
> For root**, to access another user=E2=80=99s session bus, its needs to se=
tuid/setgid to the corresponding user.
>
> This is because D-Bus actively blocks any user even uid 0 from accessing =
another=E2=80=99s session bus. It would be a simple patch to make an except=
ion for root. But still something that needs to be maintained.

This is something that would need to be looked at in more depth technically=
.

>
> My POC was not using sdbus/plus. At the very least, modification will be =
needed to sdbusplus, sdbus, phosphor-dbus and possibly to object mapper. No=
t sure if more applications need to change.
> Supporting multiple session D-Buses will be really complicated for a lot =
of reasons. So even if session bus is a reasonable idea (which I need feedb=
ack on), I would not jump into having a session bus per usecase from the ge=
t-go.
>
> I am happy to start with a design document on git hub and also make some =
code changes, but I had a few questions.
>
> Your views on, if this a workable idea?

I have very similar concerns with Patrick;  With that said, if these
are minor additions to existing daemons that are optional, I'd be in
support of some amount of experimentation in this regard to find an
acceptable solution, but I don't think the above gets us to what we
need.

> I am hoping I can isolate all the changes to sdbusplus, sdbus, phosphor-d=
bus and object mapper. What else might need to change?

I'm fairly certain every daemon needs some changes to define the
appropriate ACLs.  Essentially we need to distribute BMCWEBs privilege
registry mapping to dbus, so individual daemons can put in ACLs that
define whether their APIs are Admin, Operator, user, or read-only
privilege level.

> If I can make all these changes, I was thinking of starting with BMCWeb a=
s non root but since BMCWeb interfaces with a lot of daemons that would be =
a big step. Any better ideas?

Keep in mind, bmcweb also accesses things that:
1. Aren't openbmc dbus daemons (primarily systemd)
2. Supports accessing data through unix sockets (KVM, serial port,
virtual media, ect).
3. Supports accessing system data through the filesystem (EventLog,
HostLog, ect).
4. Has data that it needs to persist (sessions, guids, ect) in
bmcweb_persistent_data.json.

If you want to run bmcweb as non-root on any non-trivial system, you'd
have to find solutions for those use cases as well.  WIth that said,
if you want to focus on the dbus aspects first, happy to work through
that piecemeal, but it will mean that we will have to support both
configs (bmcweb as root, and bmcweb as non-root) for some amount of
time, so keep that in mind when you write your patches.

>
>
>
> Thanks,
>
> Nirav.
>
>
>
>
>
>
>
> --
> Nirav Shah
