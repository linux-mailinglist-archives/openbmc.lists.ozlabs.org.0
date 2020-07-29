Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 558FE2317B1
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 04:32:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGcyP4ZV1zDqyn
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 12:32:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=zcOPIbOc; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGcxZ1mLWzDqxc
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 12:31:45 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id x9so11732534ybd.4
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 19:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aPPGiHeLgQAcTAQziSaLVNiDjdvukoVCSwqevqO5IqU=;
 b=zcOPIbOcpPdkznV4WW9fSKNV26vmkIBSQZNt9WnAJE/e+2dgZsBVbmLL3TcEPO+L/2
 +GAE82ZlRpIFNtxF6/8DBSfuptBIleaY5mnjIokopxYv/aB+/sat1HvKPfJTfuANSpW/
 WwXV2YaFJ4Yb9Z9f1nEjWXgfe0jckylB1C3JfrsdMyqZ4SaV+Z7Vlv9ebkT67LidmRdT
 DWHjTFixyB7QrT2B75jVkdxUr4jrEkvStAEuMNooMPtYH20gPoJomw/QZpaPd4PHoVus
 /bUqky1gyNdjrlVXqaa3ThvLHq9/DDMjIXyyTACdfDWKUaJvGLO/coM5hellaHUtBjEO
 onbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aPPGiHeLgQAcTAQziSaLVNiDjdvukoVCSwqevqO5IqU=;
 b=dd8K2jesx/kD9mwCZMjqPuT+n2uGI0Z4S54De2CZ6dXhrf0bmej6mgs+opIXLQe+C3
 yvpEL4ktIGlwBi9sjcUZy8jP3UYKhoXUAJq7koOsc3ScFQyweZTauJPWl+2qUsThUr00
 saqzz/rigpUupylcU+hY7N+Y0Tltw7CofZxf8a53Q9apYNFRChEgTWzB+JAnr7gm9nsE
 ZRIMh0QzPgVLHAtHKUHprJuRrFgfvx/JiiRo8iuWBgzFvKZzju8kpMT9YIsh5Wz9Nzl0
 xzeaiBxcKwsO/lalD5bkOo/fFhP+AdPN4rlFmdk9C6PFGSV/FuIrwb9Q+kRKMSycaQnx
 fXkw==
X-Gm-Message-State: AOAM531o6MTyvFCZxKacit7zUvVF2hoV0ZukWNGDHe7oiwPWlKCu3nEg
 2vVT28dWN0R09tpwxsaxJt5kmPFbl09uSHAf+HILmg==
X-Google-Smtp-Source: ABdhPJwGmIHyPB78f6c49IRIFloBLXAjmkdxEQimI7GXnXK1pYPCgEuLDZUDLKNkMWUyMCBA6MQQYLd/V7lUt+aQtgo=
X-Received: by 2002:a25:a162:: with SMTP id z89mr49857904ybh.449.1595989901716; 
 Tue, 28 Jul 2020 19:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <d50417a7-3cc2-1674-b4d1-09283c4ddaf5@linux.ibm.com>
 <14851.1595795718@localhost>
 <CACWQX81hRk+syCoDmhnQRLEZx-usQRbos___vTDOCCBFF7LqVQ@mail.gmail.com>
 <17750.1595955794@localhost>
In-Reply-To: <17750.1595955794@localhost>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 28 Jul 2020 19:31:31 -0700
Message-ID: <CACWQX82QR0QfXVW4aPJ6rFbyapi+AO5Va1xcSvt2Yp_eQti3nA@mail.gmail.com>
Subject: Re: BMCWeb policy for HTTPS site identity certificate
To: Michael Richardson <mcr@sandelman.ca>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Jul 28, 2020 at 10:03 AM Michael Richardson <mcr@sandelman.ca> wrote:
>
>
> Ed Tanous <ed@tanous.net> wrote:
>     >> "certificate is missing" is pretty much unambiguous.
>
>     > Unfortunately, this ambiguity comes with the territory.  On first
>     > boot, bmcweb has no certificate, and doesn't know the difference
>     > between "missing" and "was never there".  Regardless, to bring up TLS
>     > it needs _some_ certificate, so the original behavior was that it
>
> This is reasonable behaviour, but given that browsers are trying very hard to
> make the certificate exception box go away, this does not really help
> long-term in my opinion.

I'd still be very surprised if this ever happened to browsers in the
long term without any control server side.  I get where their
motivation is, and I agree with it in principle, but without some
mechanism for initial embedded system provisioning, I don't know how
you completely disable that bypass.  With that said, I'm not a browser
developer, so if it does happen, we'll need to figure out another way
to handle initial boot and provisioning.  If you have a proposal for
how to handle this without self signed certs, it would be an
interesting discussion to have.

>
> Missing means: "ENOFILE", not "Can we use this certificate file for starting
> up an SSL Connect".

Today, that's not the definition bmcweb uses to determine whether to
generate a new cert.  I can't tell if you're proposing a different
behavior here, or making a statement about current behavior.  If the
file is present but corrupt, or inaccessible due to permissions, what
are you proposing the behavior should be?
Flash corruption does happen, and in that case, we need a way to bring
up the (sometimes only) configuration interface in a way that is
usable to exchange the certs with valid ones, even if it's sub-optimal
for security.

>
>     >> "bad format" depends a bit upon evolution of libraries.
>
>     > Today this is defined as the above.  "Can we use this certificate file
>     > for starting up an SSL context?"  If the answer is no, we regenerate.
>     > In theory, the only library we rely on for this is OpenSSL, which I
>     > would hope doesn't have a backward incompatible evolution in this
>     > area.
>
> Yes, it does.
> For instance, you can't load 1024-bit RSA keys with 1.1.1.
> It refuses to start.

When I get a free second, I'll look up where we landed on "should we
allow 1k keys" discussion we had a long time back.  I know we had
talked about disallowing them and I think the conclusion was that we
disallow them at upload time.  With that said, maybe 2k keys fail to
load in the future?

> Meanwhile, 1.0.x does not have any ECDSA support,
bmcweb has never targeted OpenSSL 1.0, and has always generated self
signed EC keys so this shouldn't be an issue in practice, but your
point about "could've broken us if" is well taken.

> and you won't find this out
> until the TLS session actually tries to start, at which point, it logs an
> obsure message to stderr, and returns an error that most programs don't know
> what to do with.
> (And the TCP connection just ends)

I could've sworn that EVP_PKEY_get1_RSA returns NULL if it's an EC key
(which is a call that bmcweb explicitly checks).  That call is one of
our "can we build an SSL context" checks today.  Maybe OpenSSL 1.0 is
different?  Regardless, it's really hard to talk about backward
compatibility with hypothetical openbmc + openssl 1.0 builds that to
my knowledge have never existed.  If this situation presents itself in
the future on another OpenSSL upgrade, I suspect that is the best time
to discuss it.

>
>     >> In particular, a new version of libssl might support some new algorithm, and
>     >> then should the firmware be rolled back, it will "bad format".
>
>     > In this hypothetical, you're thinking about a new, non x509
>     > certificate file format?  I vote let's cross that bridge when we get
>
> Nope, not about non-X.509.
> Algorithms and keysize changes.

Agreed, there are possible changes that could break us in the future
(if openssl stops accepting 2k keys for example).

>
>     > there, as it seems like there's a lot more discussion that would need
>     > to happen around upgrades and downgrades.  Today the assumption we
>     > make is that x509 certificate reading is backward and forward
>     > compatible since the begining of openbmc, which, to my knowledge, it
>     > is.
>
> Until... it isn't.
> But, the proposal would have considered a certificate with an invalid date as
> being invalid, and generated a new one.

Yes, I do not believe date, nor cert chain should be used under the
definition of "valid"; "Can we use this certificate file for starting
up an SSL context?" answers yes, even if the date and/or cert chain is
invalid, so I think the definition still works.
With that said, I think all of the above is covered by general idea of
"upgrades are guaranteed, downgrades are best effort" that most BMC
implementations (including OpenBMC at this point) tend to take.  (yes,
sometimes we break the upgrade path and have to fix it).  I don't
think I've seen anywhere in the project where we include both a
forward and backward path for nonvolatile schema migrations.  Are you
proposing something different we should do to handle these types of
situations?

With all of this said, I'm open to the possibility that we have a
backward incompatible openssl change that invalidates the cert.  Do
you think you could code up a patch with what you're hoping the
behavior to be?  It might be easier to approach it from a patchset.

>
>     >> So I suggest that the certificate+keypair is never deleted, but may be renamed.
>     >> I think that we could have a debate about getting telemetry about bad
>     >> certificates back via HTTP.
>
>     > We can have a discussion, but I suspect a lot of people would be very
>     > against using unencrypted HTTP for this purpose.
>
> I agree.
> So, how do you get information at this point?
>

I'm not following.  At the point where you've downgraded, and your key
is no longer valid?  bmcweb will regenerate a self-signed one, and a
user can connect to the HTTPS port insecurely.  Hopefully their next
step is to set up a valid key again, but I don't know how to force
that on people.  Is there a better behavior you'd like?  Brick the
system until it's factory reset?
