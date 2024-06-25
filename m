Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB56917423
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2024 00:14:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=fhK8saCJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7zd90075z3cBN
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2024 08:14:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=fhK8saCJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7zcZ5Ycpz3cT1
	for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 08:13:32 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7066f68e22cso2553268b3a.2
        for <openbmc@lists.ozlabs.org>; Tue, 25 Jun 2024 15:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20230601.gappssmtp.com; s=20230601; t=1719353604; x=1719958404; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2NrRK2AJvlOBmh5HNaTYDrgrq4dYzrcSQI0w2SU1wI=;
        b=fhK8saCJ/HZUE0IEelVCl8J9tFN3YXVnHDXHufbbwv9Y+KGxkoUG3nJZylgmhPEESP
         8bMuDMk5gp8qR3COLRZWsxEA12KsYN8n/qTGThBPhdki3So+Cbo8hXfZtrK4zIlRDDHL
         RiXu2FxGSRaUtZ/O6eYeeCn9Jr5D+mD2sYWf5vOXg/kGGKsXggJDiKTIZt5r+Q2YpcHS
         A7loOE0wzuGU+9VDwz34vUZLITmeBrBRbk59vL9oB/cVd0xLN4cbLtKP9tMcoVHWpZae
         y306Blf7iUr59brsuT+BsZdsPSQlqVHsEWOMfNiV7BaAUdh/Gf1h19Jo1G9EdS9BYQ04
         D6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719353604; x=1719958404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2NrRK2AJvlOBmh5HNaTYDrgrq4dYzrcSQI0w2SU1wI=;
        b=DwUfZ/ttPH/9pz1MBexGf6bq9nr3ol/SM1tp/Sk6xr3BeTfKz5xSOar3bYXC6KFEZL
         svV+r9LmK4JatYqufE55yDqMbn56TjQWgD1hqFL5n9jkqbiMSE5tDwqdRmQuQNjG57c/
         tdWRksPb+kBTQLQGm1DS5tm+YyzPY03/3rrel2KmHlBucEXyZH1Jzo2/saj6cpyYyKYQ
         RLITHHXmM0P0g//4X38XmT9WyDYKAxy4FkpC4C0UA+gtOadSb7UdW4kTsOysplQJtHhV
         PwjFy8xLa6BgBMWblTSguxzNGGezZ4F8hGeXR2TfLfHQM5mPH5ACx8aOaUD5oVQ//K9u
         qVHg==
X-Gm-Message-State: AOJu0YwPwfR04ha/gZYqneE2yJMldoUYVQJkBEAcn+zf423v1nO4anbH
	SR68oeq0ripMIlpfjnWDclEgAnpIDbK67hQJiR/nXZjDNgTVRPkYtbxXzePVMnc/UBNc5koJNIT
	VuxOF9V5WvU28FW/MueCPZ2p6uXfDc+nFMMdZQA==
X-Google-Smtp-Source: AGHT+IFFN3aQsx/z3QUvgcVrqQaTSoCCM2t5sklPYwufStZVUGP+qmfLojpcdZAa3hUJZq9Sa4L1g35QtkxBGnOL1YQ=
X-Received: by 2002:aa7:85d5:0:b0:706:2b1f:d443 with SMTP id
 d2e1a72fcca58-706710041bcmr9288302b3a.29.1719353604155; Tue, 25 Jun 2024
 15:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <Znstp/1lmbtWS0vR@home.paul.comp>
In-Reply-To: <Znstp/1lmbtWS0vR@home.paul.comp>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 25 Jun 2024 15:13:13 -0700
Message-ID: <CACWQX80B7o9Dn611OOVDS4ViV9BOjn_x_Lwh62em+0-6q3g4Kw@mail.gmail.com>
Subject: Re: Introduction of "hostconsole" group requirement for bmcweb SOL
 regresses LDAP (and other remote authentication) usecases
To: Paul Fertser <fercerpav@gmail.com>
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
Cc: Ravi Teja <raviteja28031990@gmail.com>, Ratan Gupta <ratankgupta31@gmail.com>, openbmc@lists.ozlabs.org, Ninad Palsule <ninad@linux.ibm.com>, Joseph Reynolds <joseph-reynolds@charter.net>, Gunnar Mills <gunnar@gmills.xyz>, Kirankumar Ballapalli <kirankumarb@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 25, 2024 at 1:50=E2=80=AFPM Paul Fertser <fercerpav@gmail.com> =
wrote:
>
> Hello,
>
> Moving the discussion here from closed code review comments for the
> commit that introduced the regression[0].
>
> Ed, I hope this is the right medium to discuss issues like that and
> I'm including webui and phosphor-user-manager maintainers now.
>
> I hope that interested parties will share the information and ideas
> needed to allow LDAP-authenticated users to use SOL again.
>
> > > looks like something that breaks compatibiliity with existing
> > > installs way too much.
> >
> > What does "installs" mean in this context? We have an API, so far
> > as I understand the API backward compatibility support has been
> > maintained.
>
> This patch seems to be written under assumption that a single user
> can belong to several groups (which is normal for POSIX
> systems). Compare these two cases:
> ```
> # busctl call xyz.openbmc_project.User.Manager
> /xyz/openbmc_project/user xyz.openbmc_project.User.Manager
> GetUserInfo s root
> a{sv} 6 "RemoteUser" b false "UserEnabled" b true "UserGroups" as 5
> "hostconsole" "ipmi" "redfish" "ssh" "web"
> "UserLockedForFailedAttempt" b false "UserPasswordExpired" b false
> "UserPrivilege" s "priv-admin"
> ```
> and
> ```
> # busctl call xyz.openbmc_project.User.Manager
> /xyz/openbmc_project/user xyz.openbmc_project.User.Manager
> GetUserInfo s ldap_sync
> a{sv} 2 "RemoteUser" b true "UserPrivilege" s "priv-admin"
> ```
>
> for remote users `phosphor-user-manager` doesn't even report the
> list of `UserGroups` as it has no facilities to obtain that. And
> even if it did, that would require changes to the database serving
> the user data. That's what I mean by existing installs, the LDAP
> databases customers already have in production, plus existing
> working BMC configuration.
>
> So with this new code the old LDAP configuration can not allow SOL
> anymore. Unless we fake `UserGroups` for `priv-admin` and the
> rest. Is that what you suggest?
>
> > > RHEL or Windows Server
> >
> > I would say the majority of OpenBMC installs aren't running either
> > of these, so I'm not sure where the comparison comes from
>
> Hm, I thought those are the most popular operating systems running
> on server machines these days. What's the majority then, ESXi? But
> that seems unlikely since OpenBMC was feeding it IPMI sensor names
> it couldn't understand for many years and nobody complained. Is ESXi
> offering more control over serial than KVM by default? So what the
> majority of OpenBMC installs are running on host CPUs?
>
> > All of this feedback it great, but you haven't really stated what
> > you'd like to see happen here.
>
> Hah, guess not so great if my point is still not clear, sorry about
> that, not sure how we have this impedance mismatch again and again.
>
> I'd like Ninad Palsule, who was behind this code creation and
> submission (or anyone else who knows what the deal is about), to
> provide clear rationale and explanation for this feature so that the
> regression could be fixed in a meaningful way without regressing
> their feature or compromising their goals. But for that we need to
> understand their goals first. In your earlier comment you said "I'm
> not sure what the point is of this patch then, which I thought was
> to be able to dish out host console access separate from user role,
> but at least this retains the current behavior." so it looks like
> the intent behind this patch is not so clear and needs
> clarifications.
>
> I'd like to see the way forward with fixing the regression with
> remotely authenticated users. Be it by reverting this patch or by
> fixing phosphor-user-manager (I do not see a practical way other
> than faking groups for remote users) or other ideas that do not
> cross my mind. I think whomever introduced the regression should be
> at least trying to help with that. I referred to them by "those
> people" when I asked for the threat model they're working with (not
> you, it's not you who introduced and advocated this functionality).
>
> > > even worse, the web interface terminates the session on attempt
> > > as it gets 401 reply
> >
> > I just looked, and I'm not sure how this could happen in the
> > code.  I would expect a 403 forbidden from here:
> >
> > https://github.com/openbmc/bmcweb/blob/0bdda665a3589924e1f5a51d7ff8633c=
6544ffa1/include/dbus_privileges.hpp#L94
> >
> > Presumably that's not what you're seeing.
>
> Indeed, I'm not seeing exactly that. With a version few months old I
> was getting 401 as an unfortunate combination of bmcweb segfaulting
> (presumably due to some lifetime object issues) trying to make a
> reply to the request of Upgrading to websocket when user is not
> allowed to that and answering 401 after restarting on some other
> query. But since it's not current HEAD that's not relevant much.
>
> Current version shows me `NS_ERROR_NET_RESET` when Firefox tries to
> `GET wss://172.41.1.250/console/default` on behalf of an LDAP user
> mapped to Administrator. Which is kind of OK (better than 401) but
> still is a regression.
>

You've quoted and replied to a discussion that isn't on the mailing
list which makes it difficult to track.  It would help a lot if you
could start a new thread with:

- Background on the regression.
- Details on the behavior that you're seeing that's not working.
- What you'd like to see changed.

Feel free to crosslink the gerrit review, but directly quoting a
portion of a single comment chain from it it removes authors,
timestamps, and reply details that are important to be able to follow
the conversation.

>
> [0] https://gerrit.openbmc.org/c/openbmc/bmcweb/+/61580
> --
> Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
> mailto:fercerpav@gmail.com
