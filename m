Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2500222B23E
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 17:15:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCG9d7296zDr74
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 01:15:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=dF4mWG76; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCG78442kzDrBn
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 01:13:22 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id j1so3006484ybh.10
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 08:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m0E/RGM4tFAppbdAAERnPiDNRD40rKYtwKc1nUM3CCk=;
 b=dF4mWG76ueRvr+J8N80wqhVVnKeIPOsvuuHC5HHBsnWvnrseWlTaO5KlP7ZqIlY1VD
 8dfIM7JbyUZe2Q1dFRXImZmSGGOY0lc7zXH6kybR96tS6hmk3PypOhk38nXSnMPUSlgL
 cmLT08uZPUcHeU2brnWX69KKHvpXD6fFnWFkUtCjEB0DqVYN9+gs1smYgSBx9x2pA9su
 hll8+DBpu7cPMqtfpza+LVS9g9p2BcQSUjaBp0t1zWHLX0sMs6BhfOXljEjSq+2dKhRb
 OAc3PbcBvMdFgDKf+MVL3YqtVOhNdwnHNRiC9joAerKuhPUePmXcNpGR2cSJtIzfT16M
 ipvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m0E/RGM4tFAppbdAAERnPiDNRD40rKYtwKc1nUM3CCk=;
 b=AdmPB7T2QvFWA51sSFd1/jfPyCajZ+vVtZ8zplz+6prUIwv3uMtP9GFlBWsxr+8y2p
 M9ljSrQONc1pS3Uw5oqK+vyJOc/yxdofZf7j/SCbnvywhYZOH+mHBQKswQ15QVkHse23
 fzQ74mj0CoaXTLacOPvR1k2qT06vyTFVKSc4UVOxTJmnn4+XfG1NGSMkWB+LhrwYz1mA
 h+KkdSdBiwDUn0EJxmZBYnlU9+NUCrJapATXbpc20e35Bs9OIvh9nbfN59QCS1SaXsZN
 xhtdzw+B3mPs2NpZ6/ILxIJEXd77vfcZOKHntdTs7ET04D87XYlvnBHKmDZ0/Fhxv8/M
 svKA==
X-Gm-Message-State: AOAM532OkbMnN4dqHPPVCoIwX/ajHcdv6xqbR6j0qWhPuEUWyySgJvWi
 6ZTPD5srTNGi2U8vpo2wtydL4AdENatf7OutzSvXKifcMGGtfQ==
X-Google-Smtp-Source: ABdhPJyO6+QjEXS0VUPG/dSQOKYxN2dAqJ3h83Jy6gimVhSuE7rVvDMH70KKlZpfGw7wvzVQ+h2oWLfcWr88tlGjLH4=
X-Received: by 2002:a25:abc5:: with SMTP id v63mr7464762ybi.148.1595517196477; 
 Thu, 23 Jul 2020 08:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <b8ec220b-56ca-45f7-99be-5ab197c4d881@linux.ibm.com>
 <b5f1c04f-eb6c-7dac-2945-cff9815a7ca6@linux.ibm.com>
In-Reply-To: <b5f1c04f-eb6c-7dac-2945-cff9815a7ca6@linux.ibm.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 23 Jul 2020 08:13:05 -0700
Message-ID: <CACWQX80aD212+JKwqGJoowyb4S7wLcnUCyVLwOMko8T_86yunA@mail.gmail.com>
Subject: Re: Security Working Group - Wednesday July 22 - results
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

First off, if you are finding certificates are expiring in a
production environment, you need to rethink your certificate
replacement strategy.  The BMC cannot be the primary entity in charge
of certificate replacement and revocation, and the fact that this is
happening points to a greater organizational problem than the bmc can
cover.

One thing to note;  At one point, I had talked through how to
prototype ACME protocol replacement of certificates automatically, so,
given an ACME server on the network, the BMC could essentially
automatically provision itself and keep its certs up to date.  If
someone wanted to run with that, it might reduce some of the pain here
(and be extremely cool).

On Thu, Jul 23, 2020 at 7:24 AM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
>
> 4 Question: If BMCWeb finds an unusable HTTPS site identity certificate,
> it DELETES it and self-generates one.  This has caused problems for
> certificates that are not valid until a future date. In general, what
> certificate management support should we have for BMCWeb?  What is needed=
?

This is not how bmcweb was intended to work, and I had explicitly
tested that it doesn't have this behavior (prior to it being moved
over to certificate manager).  The only time it previously would
replace a certificate was if the cert file didn't exist, or was
completely unreadable.  I suspect the right thing here is to bisect
the commit that broke this behavior (I'll bet it's easy to find) and
get a bug filed with the author so they can either fix it or revert
the patch.

This one smells awfully suspicious: 082f28fd2588fd9fcd9452ad38234ce87531916=
3.

> ANSWER:
> There were two discussion threads: The BMC=E2=80=99s notion of time of da=
y
> (TOD), and how BMCWeb should handle certificates.
>
> Does the BMC have a battery backed TOD clock?  Depends on BMC model.
> Can it validate if it has access to its NTP server (when configured)?
> Does the BMC know if its time was set correctly?
>
> How does the BMC know if the BMC has the correct time?  Have a BMC flag
> that says, =E2=80=9CLook like the BMC TOD clock is not working.=E2=80=9D =
 Does the BMC
> know if we got a good time from an  NTP server?  Can we read the GPS
> signal?  What is the industry solution?
> Should the BMC store its idea of what date it is?  So it can report if
> the time changes significantly.  Or will this lead to a bigger problem?
> Is it better/simpler to check for TOD =3D beginning-of-era-1/1/1970?  =E2=
=86=92
> start an email thread

The above is all asking the wrong question: "Can we determine if the
certificate is valid?"  This is irrelevant, the question is: "Should
we ever be replacing a user provided certificate with one generated on
the BMC."  The answer previously has been no.  In almost all cases the
user provided certificate, even an expired one, will still be better
than one the BMC self signs.  Between having an invalid certificate
chain, and an invalid date, I'll take the invalid date every time.

It should be noted, most browsers (in my testing) seem to ignore the
HTTP date header entirely, so the BMC doesn't even need the correct
time to set up a proper encryption channel.

>
> BMCWeb configuration?  Configure option: delete cert and generate
> self-signed -vs- use defective certificate.  What is the purpose of
> deleting the unusable cert?

This question needs answered.  I suspect this was unintentional, and
someone simply used some bad openssl code to attempt to verify the
cert against the (possibly non existent) chain without realizing this
requirement.

>  Should =E2=80=9Cout of date=E2=80=9D not be part of the
> =E2=80=9Cunusable=E2=80=9D definition? =E2=87=92 Ideas: 1. If bmcweb find=
s a usable cert but is
> out of date, that cert can still be used.  2. Leave the defective
> certificate (do not delete it) and log an error.

A lot of BMCs don't have a dedicated RTC, and rely on other systems
(like the PCH or NTP) to get the correct time.  bmcweb needs to come
up long before the PCH or NTP (both of which are also optional) so as
a general rule, using these for valid time is a non-starter.  I could
see logging an error _if_ you know time is valid, but I'm not sure how
a bmc could know that.

>
> The group consensus was that BMCWeb should treat its HTTPS site identity
> certificate like this:
> 1 certificate is perfectly good - Use the certificate
> 2 certificate is good but expired or not yet valid - Use the certificate
> and log a warning

Add "and we know time has been set appropriately".  Also, be careful
with not yet valid.  I don't know how openssl chains handle clock skew
between certificate generator and client.  If the BMC has a time
that's 1 minute fast, is the certificate "not yet valid"?

> 3 certificate is missing or bad format or algorithm too old - Use
> another certificate or self-generate a certificate (and log that action)

We shouldn't be replacing certificates unless it's completely missing
(ie, we're on a first boot or a factory reset) and wouldn't be
switching certificates on the fly.  If the algorithm is too old, the
user is free to replace it with their own, which is the right
procedure anyway.  We also have no idea if the user has added this
public certificate to their local root store, so replacing it out of
the blue might look like an attack.  Also, we have no idea if the
users' client systems support the new crypto format.  We could be
unintentionally DOSing them if, say, we turn on a new keytype or size
and their clients don't support that key.

> There are no cases where BMCWeb should delete any certificate.

I think I know what you mean, but to be clear, we should delete the
old certificates when they're replaced.  We should delete root trust
store certificates when requested, ect.  I don't think we can say "no
cases" here.
