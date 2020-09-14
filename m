Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5CE268ECD
	for <lists+openbmc@lfdr.de>; Mon, 14 Sep 2020 17:03:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqqNz4g1XzDqNx
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 01:03:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=UUEX2ymp; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqqDY1QfdzDqKN
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 00:55:55 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id e11so154202ybk.1
 for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2020 07:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0BThPJVcqJMIn+Dhy+TzE7Pq/5MtPbWqfBK46vnnP7w=;
 b=UUEX2ympZLx3FdwgAD1Pbx6UZ0EByGAc5I5kpdPQ/zWYHrX69IoibZPG0bZZn72gUL
 /cmPvsyZ+db7IFxOv2ucjln/BhlpIVz8FyDpgFf/gCtNtEQI8xNka95cvRqD9FS4QoNf
 G4I8eurRrgiaqu8LcGzG4TnUPYJ/7YvDPYRHNnKdB+2meQWmztSHZik688IscyQB8S5Z
 hN8A+HyzhP9VWCEYCLsobus+jRqR7F3PGFxLkcl1LNCWlabrkZGxsbj24CeaPB46s+yG
 8pcVdKKcZ37UTJjx23Vuy4MOX60/2X9MlY8LnxCySMeVma+rfK3B1nsNIJ8CqLuECg5S
 Y7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0BThPJVcqJMIn+Dhy+TzE7Pq/5MtPbWqfBK46vnnP7w=;
 b=KY33pHXNOTGOd93Ig1ik2s+B+jg33UX20Ibi3A18pTyIiXhkOuhogi2Qejj7GgAVAT
 80BJR4RsRbsVADUJfv24Xmvcptr8FJqTFWDvt7AHoOFOtA+yavPxdndHhxe8YI6QO4SG
 6JQNh4rwBTnXnq22wINzrBJ2oGbagR00RCwgCswjhaeEZdu8LbjO2ExT5KxPnugVq6P1
 Op87/CFARRYVFABIjwGkCB2cI6nZw8DGFSYO7oAo2sm7Ot7Jzo6737INF7QORWQkxXhx
 FxXvhXVWJKeYjN4RaXt6AKL7ABH/IJspdinPEkHeK8VVp1WQaYH2Z77RFiI3OQC/o+Lu
 WCKQ==
X-Gm-Message-State: AOAM532I384Cz4B3+lh8PvI6nVLlVYx5mR7nZVJll3J1ZSMTOwY+kziG
 Wm0uT6d6Q3gAVCihcMdArGWbnmaOxDF7VMV/49ZOWw==
X-Google-Smtp-Source: ABdhPJy9W73ypJGGPC2r6AU3X5tHJWhiRg1XketouWOkEI1JRZHMdXlkELLOcI4OfkWeBLimcl8HQdSffCBgfWLhPsU=
X-Received: by 2002:a25:b212:: with SMTP id i18mr20847573ybj.148.1600095350826; 
 Mon, 14 Sep 2020 07:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <1f5b34f7029a48f39a5dfdbf9aad9e93@SCL-EXCHMB-13.phoenix.com>
 <063c4d06-8e54-4682-8d41-573ce08839b5@linux.ibm.com>
 <bd56cc8d9bdc4bdea49046d9444e2a9f@SCL-EXCHMB-13.phoenix.com>
 <39b0c34a-d780-d4c8-ae23-b536d999df58@linux.ibm.com>
 <a9d812ca6d134e568a278db9693f1e66@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <a9d812ca6d134e568a278db9693f1e66@SCL-EXCHMB-13.phoenix.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 14 Sep 2020 07:55:38 -0700
Message-ID: <CACWQX801K=a9cvx5oQ4LLek4S9RaP0pUhYbvEPFfziZ7rLYjTA@mail.gmail.com>
Subject: Re: bmcweb 30 second lockout
To: Neil Bradley <Neil_Bradley@phoenix.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 11, 2020 at 2:43 PM Neil Bradley <Neil_Bradley@phoenix.com> wro=
te:
>
> Hi Joseph!
>
> Correct: The problem we wish to solve is to stop or make brute force pass=
word attacks logistically impossible/useless, but still allow credentialed =
individuals in.
>
> I don't have any particular objection to a short lockout period, provided=
 that lockout period is bound to both the user and the actual TCP connectio=
n (assuming a TCP link is maintained during the login process) or perhaps t=
he source IP address.
>
> I still think a simple 2-4 second delay (without the 30 second delay) is =
more than sufficient. For example, let's say there's 96 possible characters=
 and an 8 character password. That's 7,213,895,789,838,336 possibilities. L=
et's also say there are 8000 incoming TCP connections to the web server - I=
 know, it's kind of absurd, but let's assume a massively coordinated attack=
. /8000=3D901,736,973,729. Multiply that by 2 seconds, and you get roughly =
57,187 years to exhaust all possibilities. Granted, it's likely the passwor=
d would be found in a quarter of that time, but that's still 14,296 years. =
The problem gets lots worse quickly when the password is longer. Even a 4 c=
haracter password is 84,934,656 possibilities and 8000 incoming connections=
 it'd still take 5.8 hours to exhaust everything, and by then the system wo=
uld have lots of other problems with that many attempts. Though it also cou=
ld be successfully argued that anyone using a 4 character password is askin=
g for it.


This type of approach works great in an apache-type server, where we
have thread per connection, and we can rely on running out of threads
to slow us down.  For better or worse, bmcweb is an async reactor
model (a lot like nginx), so while a 2-4 second delay would slow that
that specific connection, all an attacker would have to do is to spin
up N connections in parallel to bypass this per-connection limit.

For what it's worth, I think something similar to the fail2ban
approach would work well here, where after a number of failures, we
lock out specific IPs for a specific amount of time at the networking
layer using something like nftables.  Unfortunately, fail2ban is
python, so that's a non-starter but there's a similar "copy" of it
here that I've been meaning to play with at some point:
https://github.com/swillner/regban
(credit goes to James F for finding it).

>
>
> Unless I'm completely missing something, I don't see that a longer lockou=
t period is necessary or at all. I do understand the confusion of a user wh=
o doesn't know if they're being locked out because their password , however=
, but without a lockout period, that problem goes away.
>
>
> Let me know what you think.
>
> -->Neil
>
> -----Original Message-----
> From: Joseph Reynolds <jrey@linux.ibm.com>
> Sent: Friday, September 11, 2020 2:11 PM
> To: Neil Bradley <Neil_Bradley@phoenix.com>; OpenBMC Maillist <openbmc@li=
sts.ozlabs.org>
> Subject: Re: bmcweb 30 second lockout
>
> On 9/9/20 6:26 PM, Neil Bradley wrote:
> > Thanks Joseph! I'll look at this in more detail in a bit but I noticed =
your comments here:
> >
> > " This issue is to add capability for "authentication rate limiting" fo=
r BMCWeb (login and Basic Auth), SSH login, and ideally for IPMI authentica=
tion. This capability is to be independent from account lockouts, specifica=
lly so someone could use the auth rate limiting as an effective defense and=
 not need to lock accounts."
> >
> > This is precisely what I was getting at. I'm not a fan of lockouts gene=
rally because they can be abused (depending upon implementation of course),=
 and adding in auth rate limiting (just delaying a few seconds when credent=
ials are wrong) winds up making brute force attacks ineffective.
>
> Thanks Neil.  Its you and me against the world.
>
> Let's be clear about the problem we want to solve: stop brute force passw=
ord-guessing attacks but not deny service to legitimate users. Is that also=
 your problem?  That is a difficult problem, and I think solving it will re=
quire defenses in multiple layers.
>
> I believe the most promising solution is limiting the number of authentic=
ation attempts after too many failures (item 1 in the email below).  I thin=
k a PAM authentication module like pam_abl could be a solution here.  Would=
 that work for you?  But I want to go a step farther and actually notify th=
e person logging in when their attempt was rejected because authentication =
rate-limiting is in effect. Right now they get an "authentication failure" =
message which leads them to believe their password was wrong, or their acco=
unt is missing, and that confuses them.  My issues with linux-pam and pam_a=
bl are to help provide clarity to the user what happeded to their login att=
empt.  Is this what you want?
>
> The approach you mentioned ("delay a few seconds when credentials are
> wrong") defends against a single-threaded attacker (or a misbehaving tool=
), but it breaks down in (at least) two ways:
> - When the attacker establishes multiple connections to the BMC.  A defen=
se against this might be limiting the number of connections.
> - When the attacker has a long time to attack, for example, a year or mor=
e.  A defense might be password expiration.
>
> Which of these were you thinking?  I would be happy to make progress on a=
ny of them.
>
> - Joseph
>
> > -->Neil
> >
> >
> > -----Original Message-----
> > From: Joseph Reynolds <jrey@linux.ibm.com>
> > Sent: Wednesday, September 9, 2020 4:21 PM
> > To: Neil Bradley <Neil_Bradley@phoenix.com>; OpenBMC Maillist
> > <openbmc@lists.ozlabs.org>
> > Subject: Re: bmcweb 30 second lockout
> >
> > On 9/9/20 5:13 PM, Neil Bradley wrote:
> >> I had recently read somewhere on the OpenBMC mailing list (forgive
> >> me, as I can't find it anywhere now) recently indicating that there'd
> >> be a
> >> 30 second lockout for a given user if there were 3 consecutive failed
> >> login attempts. My question is firstly, is this the case, and
> >> secondly, is it tied to the user globally regardless of connection or
> >> is it per user and connection? The reason I ask is that the former
> >> would still allow for a denial of service attack and want to make
> >> sure that's not actually the case.
> >>
> > I can think of two items:
> >
> > 1. I had pushed an experimental gerrit code review to do what you descr=
ibed.
> > Here: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/31841
> > My idea has not gained much traction and is recorded here:
> > https://github.com/ibm-openbmc/dev/issues/2434
> > and here: https://github.com/linux-pam/linux-pam/issues/216
> > and here: https://github.com/deksai/pam_abl/issues/4
> > and other places.
> > If this ever gets merged, it would NOT the be default behavior.
> >
> > 2. The user lockouts for failed authentication attempts is handled by
> > pam_tally2 and controlled by Redfish APIs.
> > See
> > https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-e
> > xtended/pam/libpam/pam.d/common-auth
> > In pam.d/common-auth, the default pam_tally2 deny=3D0 means "accounts
> > are never locked because of failed authentication attempts".
> >
> > The Redfish APIs are implemented here:
> > https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/account
> > _service.hpp Specifically, PATCHing /redfish/v1/AccountService/
> > property AccountLockoutDurationor AccountLockoutThreshold invokes a
> > D-Bus method which ultimately modifies the pam.d/common-auth config
> > file above.
> >
> > Note that downstream projects may typically want to modify these
> > default settings.
> >
> > 3. I don't think you mean this: There is a current code review for a
> > BMCWeb enhancement to allow the BMC admin to control the idle session
> > SessionTimeout property.  The minimum is 30 seconds. See
> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36016
> >
> > - Joseph
> >
> >> Thanks!
> >>
> >> =C3=A0Neil
> >>
>
