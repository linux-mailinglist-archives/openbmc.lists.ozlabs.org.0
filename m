Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 449FE26A9B0
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 18:25:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrT9T5pm0zDqPR
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 02:25:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=bqinEaBm; dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrT3w0PVpzDqTT
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 02:20:43 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id c17so3099843ybe.0
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 09:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=y523qEYm6RGX7QtIgJEexQSEakN1GtdEU061ku5icV0=;
 b=bqinEaBmIIEuVcpmYE7MSiuP4YP6yU/klr9OoezOk1IwOMjVaol6vS4j/VrgvyqyUY
 HjVMMJjqEtBRwwY7xFJCuwvuKLxhv6e9C9S8q+jHBve3wIdv3L5JJHAfzOTzA1bNjJR9
 wNlu16vjJSIH7ro4kqMmQ1r7ZMBVSSZfnXFawuHI6bc4leLW3Jze22DOcv7iHwIvs27J
 zmb4iOWBQfw8Hlseumy6+0FnyHaKujG4nRLWT4Kcvlx4yFXPqT19LRJtPAbK6S1S9Fho
 v5ycZMN4OUVwbt2oSV1Cklbgb0/QD6hJZDHCtoEe7zq7vLSi4bEDyN36oFmgQuCzMOCP
 /xMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y523qEYm6RGX7QtIgJEexQSEakN1GtdEU061ku5icV0=;
 b=bET7lrWKHV42qzBC7QZCF5JoW8tGaNzEyEAAWaizgsro+L5dwvAJgWiq38n7GytvcH
 R7aX4ZvifA4GVVtIpE9498HcW763lwYzj9qL2CdsllpHpkT/nklMkOM4kX/m2Yy+IOfP
 dS0TR6JUBs8EHMhEcmgnJm3Z4wZYuecpnDR9qVt1Xk5geE3EqDjMVvbqoYLd7MPk24TE
 /SMPQ6IwdOX6CdTk9yW7z2iycOhuSVRM6LfyxU7OjFgnTkPUO3kFCOiA06DVLv0IWbWo
 /99tERO00XafE4TNkjvJS4XGunbt5VBRPJf+JLv+Iq4OoJCq15Gxot4dv9o4W+yJ/Jvv
 sT/w==
X-Gm-Message-State: AOAM532CU6z31pB3vMu9jCTwBmACXnHTMO24bQYURaSAxRIqwL+YN9Rf
 cblkwgM/KNxyArinw4hgH+0PWzJzgQ7d94yukblcYw==
X-Google-Smtp-Source: ABdhPJzzHP/1iMUiJeRUciCfy2zqAsAh2f+2kplqj8XsYFJaNjBbEWiXFG/+2qdIEdeLLdA+IEIqjxRtSAxcDYc/a24=
X-Received: by 2002:a25:9845:: with SMTP id k5mr24070416ybo.209.1600186837492; 
 Tue, 15 Sep 2020 09:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <1f5b34f7029a48f39a5dfdbf9aad9e93@SCL-EXCHMB-13.phoenix.com>
 <063c4d06-8e54-4682-8d41-573ce08839b5@linux.ibm.com>
 <bd56cc8d9bdc4bdea49046d9444e2a9f@SCL-EXCHMB-13.phoenix.com>
 <39b0c34a-d780-d4c8-ae23-b536d999df58@linux.ibm.com>
 <a9d812ca6d134e568a278db9693f1e66@SCL-EXCHMB-13.phoenix.com>
 <CACWQX801K=a9cvx5oQ4LLek4S9RaP0pUhYbvEPFfziZ7rLYjTA@mail.gmail.com>
 <08e5c541-b889-c911-a7f9-d0cb540c6c80@linux.ibm.com>
In-Reply-To: <08e5c541-b889-c911-a7f9-d0cb540c6c80@linux.ibm.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 15 Sep 2020 09:20:27 -0700
Message-ID: <CACWQX829UfZpcDYF_70h7O+5-D+qY4jna8ErKT3JqsdweNa2Qw@mail.gmail.com>
Subject: Re: bmcweb 30 second lockout
To: Joseph Reynolds <jrey@linux.ibm.com>
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
Cc: Neil Bradley <Neil_Bradley@phoenix.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 15, 2020 at 9:15 AM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
> On 9/14/20 9:55 AM, Ed Tanous wrote:
> > On Fri, Sep 11, 2020 at 2:43 PM Neil Bradley <Neil_Bradley@phoenix.com>=
 wrote:
> >> Hi Joseph!
> >>
> >> Correct: The problem we wish to solve is to stop or make brute force p=
assword attacks logistically impossible/useless, but still allow credential=
ed individuals in.
> >>
> >> I don't have any particular objection to a short lockout period, provi=
ded that lockout period is bound to both the user and the actual TCP connec=
tion (assuming a TCP link is maintained during the login process) or perhap=
s the source IP address.
> >>
> >> I still think a simple 2-4 second delay (without the 30 second delay) =
is more than sufficient. For example, let's say there's 96 possible charact=
ers and an 8 character password. That's 7,213,895,789,838,336 possibilities=
. Let's also say there are 8000 incoming TCP connections to the web server =
- I know, it's kind of absurd, but let's assume a massively coordinated att=
ack. /8000=3D901,736,973,729. Multiply that by 2 seconds, and you get rough=
ly 57,187 years to exhaust all possibilities. Granted, it's likely the pass=
word would be found in a quarter of that time, but that's still 14,296 year=
s. The problem gets lots worse quickly when the password is longer. Even a =
4 character password is 84,934,656 possibilities and 8000 incoming connecti=
ons it'd still take 5.8 hours to exhaust everything, and by then the system=
 would have lots of other problems with that many attempts. Though it also =
could be successfully argued that anyone using a 4 character password is as=
king for it.
> >
> > This type of approach works great in an apache-type server, where we
> > have thread per connection, and we can rely on running out of threads
> > to slow us down.  For better or worse, bmcweb is an async reactor
> > model (a lot like nginx), so while a 2-4 second delay would slow that
> > that specific connection, all an attacker would have to do is to spin
> > up N connections in parallel to bypass this per-connection limit.
>
> Ed, thanks.  Would the solution above help if BMCWeb also limited the
> number of simultaneous connections, for example N=3D32.  Then the attacke=
r
> can guess only 32 password every few seconds.  But what are the
> consequences?  During an attack, can a legitimate user compete for one
> of these connections?

They can compete, but if the connections are slow and long lived, a
user is unlikely to succeed.  With that said, it's easy enough to run
the bmc out of bandwidth and cause a DOS attack that way, so we're not
really any worse off.
With that said, I'd still much rather a per-ip lockout.

>
> I am summarizing the results of this email conversation here:
> https://github.com/openbmc/bmcweb/issues/151
>
> - Joseph
>
> >
> > For what it's worth, I think something similar to the fail2ban
> > approach would work well here, where after a number of failures, we
> > lock out specific IPs for a specific amount of time at the networking
> > layer using something like nftables.  Unfortunately, fail2ban is
> > python, so that's a non-starter but there's a similar "copy" of it
> > here that I've been meaning to play with at some point:
> > https://github.com/swillner/regban
> > (credit goes to James F for finding it).
>
> For what its worth, I think fail2ban or regban could be part of a solutio=
n.
>
> >> Unless I'm completely missing something, I don't see that a longer loc=
kout period is necessary or at all. I do understand the confusion of a user=
 who doesn't know if they're being locked out because their password , howe=
ver, but without a lockout period, that problem goes away.
> >>
> >>
> >> Let me know what you think.
> >>
> >> -->Neil
> >>
> >> -----Original Message-----
> >> From: Joseph Reynolds <jrey@linux.ibm.com>
> >> Sent: Friday, September 11, 2020 2:11 PM
> >> To: Neil Bradley <Neil_Bradley@phoenix.com>; OpenBMC Maillist <openbmc=
@lists.ozlabs.org>
> >> Subject: Re: bmcweb 30 second lockout
> >>
> >> On 9/9/20 6:26 PM, Neil Bradley wrote:
> >>> Thanks Joseph! I'll look at this in more detail in a bit but I notice=
d your comments here:
> >>>
> >>> " This issue is to add capability for "authentication rate limiting" =
for BMCWeb (login and Basic Auth), SSH login, and ideally for IPMI authenti=
cation. This capability is to be independent from account lockouts, specifi=
cally so someone could use the auth rate limiting as an effective defense a=
nd not need to lock accounts."
> >>>
> >>> This is precisely what I was getting at. I'm not a fan of lockouts ge=
nerally because they can be abused (depending upon implementation of course=
), and adding in auth rate limiting (just delaying a few seconds when crede=
ntials are wrong) winds up making brute force attacks ineffective.
> >> Thanks Neil.  Its you and me against the world.
> >>
> >> Let's be clear about the problem we want to solve: stop brute force pa=
ssword-guessing attacks but not deny service to legitimate users. Is that a=
lso your problem?  That is a difficult problem, and I think solving it will=
 require defenses in multiple layers.
> >>
> >> I believe the most promising solution is limiting the number of authen=
tication attempts after too many failures (item 1 in the email below).  I t=
hink a PAM authentication module like pam_abl could be a solution here.  Wo=
uld that work for you?  But I want to go a step farther and actually notify=
 the person logging in when their attempt was rejected because authenticati=
on rate-limiting is in effect. Right now they get an "authentication failur=
e" message which leads them to believe their password was wrong, or their a=
ccount is missing, and that confuses them.  My issues with linux-pam and pa=
m_abl are to help provide clarity to the user what happeded to their login =
attempt.  Is this what you want?
> >>
> >> The approach you mentioned ("delay a few seconds when credentials are
> >> wrong") defends against a single-threaded attacker (or a misbehaving t=
ool), but it breaks down in (at least) two ways:
> >> - When the attacker establishes multiple connections to the BMC.  A de=
fense against this might be limiting the number of connections.
> >> - When the attacker has a long time to attack, for example, a year or =
more.  A defense might be password expiration.
> >>
> >> Which of these were you thinking?  I would be happy to make progress o=
n any of them.
> >>
> >> - Joseph
> >>
> >>> -->Neil
> >>>
> >>>
> >>> -----Original Message-----
> >>> From: Joseph Reynolds <jrey@linux.ibm.com>
> >>> Sent: Wednesday, September 9, 2020 4:21 PM
> >>> To: Neil Bradley <Neil_Bradley@phoenix.com>; OpenBMC Maillist
> >>> <openbmc@lists.ozlabs.org>
> >>> Subject: Re: bmcweb 30 second lockout
> >>>
> >>> On 9/9/20 5:13 PM, Neil Bradley wrote:
> >>>> I had recently read somewhere on the OpenBMC mailing list (forgive
> >>>> me, as I can't find it anywhere now) recently indicating that there'=
d
> >>>> be a
> >>>> 30 second lockout for a given user if there were 3 consecutive faile=
d
> >>>> login attempts. My question is firstly, is this the case, and
> >>>> secondly, is it tied to the user globally regardless of connection o=
r
> >>>> is it per user and connection? The reason I ask is that the former
> >>>> would still allow for a denial of service attack and want to make
> >>>> sure that's not actually the case.
> >>>>
> >>> I can think of two items:
> >>>
> >>> 1. I had pushed an experimental gerrit code review to do what you des=
cribed.
> >>> Here: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/31841
> >>> My idea has not gained much traction and is recorded here:
> >>> https://github.com/ibm-openbmc/dev/issues/2434
> >>> and here: https://github.com/linux-pam/linux-pam/issues/216
> >>> and here: https://github.com/deksai/pam_abl/issues/4
> >>> and other places.
> >>> If this ever gets merged, it would NOT the be default behavior.
> >>>
> >>> 2. The user lockouts for failed authentication attempts is handled by
> >>> pam_tally2 and controlled by Redfish APIs.
> >>> See
> >>> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-=
e
> >>> xtended/pam/libpam/pam.d/common-auth
> >>> In pam.d/common-auth, the default pam_tally2 deny=3D0 means "accounts
> >>> are never locked because of failed authentication attempts".
> >>>
> >>> The Redfish APIs are implemented here:
> >>> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/accoun=
t
> >>> _service.hpp Specifically, PATCHing /redfish/v1/AccountService/
> >>> property AccountLockoutDurationor AccountLockoutThreshold invokes a
> >>> D-Bus method which ultimately modifies the pam.d/common-auth config
> >>> file above.
> >>>
> >>> Note that downstream projects may typically want to modify these
> >>> default settings.
> >>>
> >>> 3. I don't think you mean this: There is a current code review for a
> >>> BMCWeb enhancement to allow the BMC admin to control the idle session
> >>> SessionTimeout property.  The minimum is 30 seconds. See
> >>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36016
> >>>
> >>> - Joseph
> >>>
> >>>> Thanks!
> >>>>
> >>>> =C3=A0Neil
> >>>>
>
