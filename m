Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 154DB9172AA
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2024 22:51:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rg6iPbYl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7xnz3Nbyz3fnN
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2024 06:51:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rg6iPbYl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7xnN1VZ0z3cXQ
	for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 06:51:03 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2ed5ac077f5so1160721fa.1
        for <openbmc@lists.ozlabs.org>; Tue, 25 Jun 2024 13:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719348653; x=1719953453; darn=lists.ozlabs.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n/hV2KUd4R8BLLtITVftdgEMbbSxZxqhbfIND7hYmNY=;
        b=Rg6iPbYluqlvh7wxMvO00yPMEMsFy8CZnkHAimPbFw1NHuq206YPl56XeVkAFlbXUT
         ZoI2E/2f6lTkhhwjDjF8K7Mh2P7br38P2/fzW9LIKv1LgwONOyqFtWNTNffIqezsW1yy
         V0mkh0lGUI7r+bb1oTI/l34sMBM64Gc5Jfe7/ORIUS6ThwEldy2sQkB0vL3Xse1wCxyw
         7gSDO8T/dYZN8y/7AnkUi39g7wDga8zr64nQYEMQ1h+TVngpXl0DIIzqb0WUedYNZSQx
         gq3t87tI2GLAbuV4CNba6Bv2n66HRuacezOYCQcANRROqHxuZEFu75DInLCdMJXEawiD
         b31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719348653; x=1719953453;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/hV2KUd4R8BLLtITVftdgEMbbSxZxqhbfIND7hYmNY=;
        b=bBgBPE5Pb9lYtkyQ1RKjnfjig+cDodZTcFuInzZJ8OjJpOJgC0xXsBHji4ooDFsU92
         bUSO7nadSyLH7/dpg38zY+O3stq5TQFlChQi7QgKpZRCuCZmyAcJ9dq+JOaHWlacV6am
         wzTMstLT0ELinFKAQsvj4GfQmOgwjbmiwglF/3p3dXR0n3e1LhcVaenPKK1tkeXgOfjL
         HczJIyTbq6ZqKY0t4D2grDwmnseCyz8L7FExwzOm3pXv4201PElotzR7Equ7gVy0h40D
         o6PzM+BGF6nWYnfDsYKevozF1fZVZHtXjujp5y7fdXiQWtXugYtfMIN+wL1wlvvqO9S4
         prtQ==
X-Gm-Message-State: AOJu0YxKKmJulfghCWNjffzxMtyG1Ffu75wkoSQL1qQt3t3Ip3VBej+I
	gz/j9FtN+AIDWcsXSdArodkqaWQhb7HVwFf6yoF9SCWHZ2JNDCQfSTyu0w==
X-Google-Smtp-Source: AGHT+IEdiA72BWGuxU2HSRNIv3uWtNQyz4iJKZL4NaNta4eK5rWzqZ9bAmexYXo0hFHPFq8vfUhqjA==
X-Received: by 2002:ac2:5617:0:b0:52c:b606:2b2 with SMTP id 2adb3069b0e04-52ce0673b84mr5206531e87.46.1719348653221;
        Tue, 25 Jun 2024 13:50:53 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd645132dsm1324986e87.293.2024.06.25.13.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 13:50:53 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 45PKonP0001180;
	Tue, 25 Jun 2024 23:50:50 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 45PKolqi001179;
	Tue, 25 Jun 2024 23:50:47 +0300
Date: Tue, 25 Jun 2024 23:50:47 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: openbmc@lists.ozlabs.org, Ninad Palsule <ninad@linux.ibm.com>
Subject: Introduction of "hostconsole" group requirement for bmcweb SOL
 regresses LDAP (and other remote authentication) usecases
Message-ID: <Znstp/1lmbtWS0vR@home.paul.comp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Ravi Teja <raviteja28031990@gmail.com>, Ratan Gupta <ratankgupta31@gmail.com>, Ed Tanous <ed@tanous.net>, Joseph Reynolds <joseph-reynolds@charter.net>, Gunnar Mills <gunnar@gmills.xyz>, Kirankumar Ballapalli <kirankumarb@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

Moving the discussion here from closed code review comments for the
commit that introduced the regression[0].

Ed, I hope this is the right medium to discuss issues like that and
I'm including webui and phosphor-user-manager maintainers now.

I hope that interested parties will share the information and ideas
needed to allow LDAP-authenticated users to use SOL again.

> > looks like something that breaks compatibiliity with existing
> > installs way too much.
>
> What does "installs" mean in this context? We have an API, so far
> as I understand the API backward compatibility support has been
> maintained.

This patch seems to be written under assumption that a single user
can belong to several groups (which is normal for POSIX
systems). Compare these two cases:
```
# busctl call xyz.openbmc_project.User.Manager
/xyz/openbmc_project/user xyz.openbmc_project.User.Manager
GetUserInfo s root
a{sv} 6 "RemoteUser" b false "UserEnabled" b true "UserGroups" as 5
"hostconsole" "ipmi" "redfish" "ssh" "web"
"UserLockedForFailedAttempt" b false "UserPasswordExpired" b false
"UserPrivilege" s "priv-admin"
```
and
```
# busctl call xyz.openbmc_project.User.Manager
/xyz/openbmc_project/user xyz.openbmc_project.User.Manager
GetUserInfo s ldap_sync
a{sv} 2 "RemoteUser" b true "UserPrivilege" s "priv-admin"
```

for remote users `phosphor-user-manager` doesn't even report the
list of `UserGroups` as it has no facilities to obtain that. And
even if it did, that would require changes to the database serving
the user data. That's what I mean by existing installs, the LDAP
databases customers already have in production, plus existing
working BMC configuration.

So with this new code the old LDAP configuration can not allow SOL
anymore. Unless we fake `UserGroups` for `priv-admin` and the
rest. Is that what you suggest?

> > RHEL or Windows Server
>
> I would say the majority of OpenBMC installs aren't running either
> of these, so I'm not sure where the comparison comes from

Hm, I thought those are the most popular operating systems running
on server machines these days. What's the majority then, ESXi? But
that seems unlikely since OpenBMC was feeding it IPMI sensor names
it couldn't understand for many years and nobody complained. Is ESXi
offering more control over serial than KVM by default? So what the
majority of OpenBMC installs are running on host CPUs?

> All of this feedback it great, but you haven't really stated what
> you'd like to see happen here.

Hah, guess not so great if my point is still not clear, sorry about
that, not sure how we have this impedance mismatch again and again.

I'd like Ninad Palsule, who was behind this code creation and
submission (or anyone else who knows what the deal is about), to
provide clear rationale and explanation for this feature so that the
regression could be fixed in a meaningful way without regressing
their feature or compromising their goals. But for that we need to
understand their goals first. In your earlier comment you said "I'm
not sure what the point is of this patch then, which I thought was
to be able to dish out host console access separate from user role,
but at least this retains the current behavior." so it looks like
the intent behind this patch is not so clear and needs
clarifications.

I'd like to see the way forward with fixing the regression with
remotely authenticated users. Be it by reverting this patch or by
fixing phosphor-user-manager (I do not see a practical way other
than faking groups for remote users) or other ideas that do not
cross my mind. I think whomever introduced the regression should be
at least trying to help with that. I referred to them by "those
people" when I asked for the threat model they're working with (not
you, it's not you who introduced and advocated this functionality).

> > even worse, the web interface terminates the session on attempt
> > as it gets 401 reply
>
> I just looked, and I'm not sure how this could happen in the
> code.  I would expect a 403 forbidden from here:
>
> https://github.com/openbmc/bmcweb/blob/0bdda665a3589924e1f5a51d7ff8633c6544ffa1/include/dbus_privileges.hpp#L94
>
> Presumably that's not what you're seeing.

Indeed, I'm not seeing exactly that. With a version few months old I
was getting 401 as an unfortunate combination of bmcweb segfaulting
(presumably due to some lifetime object issues) trying to make a
reply to the request of Upgrading to websocket when user is not
allowed to that and answering 401 after restarting on some other
query. But since it's not current HEAD that's not relevant much.

Current version shows me `NS_ERROR_NET_RESET` when Firefox tries to
`GET wss://172.41.1.250/console/default` on behalf of an LDAP user
mapped to Administrator. Which is kind of OK (better than 401) but
still is a regression.


[0] https://gerrit.openbmc.org/c/openbmc/bmcweb/+/61580
-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
