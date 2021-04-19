Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9904363C59
	for <lists+openbmc@lfdr.de>; Mon, 19 Apr 2021 09:18:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNypr63fKz3c5V
	for <lists+openbmc@lfdr.de>; Mon, 19 Apr 2021 17:18:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=dYy+ypBi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=dYy+ypBi; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNypc2f8Fz3c0C
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 17:18:31 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id k73so31282678ybf.3
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 00:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H9rmcYOS95Y5SY3Igu8yAwGQVPamw5+CTRXzfZxCy64=;
 b=dYy+ypBiddy1dWuf9w1u+WgxSmfBGC+uUjQJqoHUwvrjleScvf9bfOs2G5XvapM0hd
 BRzwPaV4rWVw033Bv5D7At6r8aXmGlz9m6eiFZzVY826tcC1ZQmThClCfOX/WIskVewv
 xa4C/verN2kJP6dgobR09823xZKGyNAQVl15DA2GTXnd6pNZkLRz9UOF+X3n4ISKbp2w
 0YMNM3QLwG0QAOKBT+IpSTJayQTnbpqc2OR/bhM8rojQPBnmlmUS8ZMIX6zkH/gu0tOG
 GZdTuZrnAzYplq3hXWxrs3H/50bzY/Bzn3w86ZyhNFa92vjrAkiu0R7tlnE/dkZd+KX5
 4/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H9rmcYOS95Y5SY3Igu8yAwGQVPamw5+CTRXzfZxCy64=;
 b=mY+hTpNpsu7pqscQbSgtzjXROL3A0jFC230tB7tFfGiL/8SPuFZeJpVv2KQbD/rpCQ
 A0zCeJRJFdWNy3LGy6pxewTUvj42nS1Gj052/XldVmt7WSt58nxJEevx5UrVks9BVAnO
 nOn3/1EqHSjln7xgr/i2ghfbUI/zWTNDx2C7Qfkwkq4gCGuckRipdEotFpNI3zUoG0bu
 oqCYaTWiGnqwHXNB7rMSH6kJmzTVeYE0ulBmg2w785YLx5hfOqj1jJ5qNm8cVbseaQix
 hViM3NB8KF6kVre4EbY6ydG6Q5At6Ak5sIYZMx8RTllkH5M7ynGTp4qKnsm/4B05fgaB
 Cd/w==
X-Gm-Message-State: AOAM5333AMb4K6Utf/qHQlHxj4Bd5ag7SA8+RjsYY/1GDqz8vintscyA
 ojguyae+XRoInqYgobKrSdugYsFnFW+u6CBZ17ubdw==
X-Google-Smtp-Source: ABdhPJxdNA4ceMETCFwsL3QAl7siDfsBkjKM+rJdb2x7i7jd9dy/A6pO8kz0sgiai6LSDVfMDkKqN1bRSMJq51YpClM=
X-Received: by 2002:a05:6902:1108:: with SMTP id
 o8mr10927771ybu.131.1618816707027; 
 Mon, 19 Apr 2021 00:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAMXw96PmAoSb5LJj-CzYA-47D-nCy81gBa=T94N_u2fqWL54EQ@mail.gmail.com>
 <10871.1618685448@localhost>
In-Reply-To: <10871.1618685448@localhost>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 19 Apr 2021 00:18:15 -0700
Message-ID: <CACWQX8166T=3-ZKo+EtC-e67KzTgfgh0JxKA3G3ap1LVucbQYg@mail.gmail.com>
Subject: Re: bmcweb: Install encrypted certificate to BMC
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
Cc: Justin Chen <juschen@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <edtanous@google.com>,
 Richard Hanley <rhanley@google.com>, gmills@us.ibm.com,
 Zhenfei Tai <ztai@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Apr 17, 2021 at 11:56 AM Michael Richardson <mcr@sandelman.ca> wrote:
>
>
> Zhenfei Tai <ztai@google.com> wrote:
>     > For our use case it's a more restricted environment in which we don't want
>     > to have plaintext certificates in the request. Instead we want to send a
>     > pair of encrypted key and certificate from the host to the BMC and there
>     > will be another daemon to decrypt them using an internal library.
>
> certificates are public objects.
> Perhaps you are transfering a private key?

Correct;  This wasn't made clear in the initial email, but this
"certificate" is really a certificate and the private key.

> Is this an IDevID-like installed by the manufacturer, or is this a cert/key
> to be used on the production floor (DC).

DC.

>
> If you have a daemon present that can decrypt things, then you already have a
> private key (or symmetric key) present, and that key is subject to attack.
> (Unless you add yet another layer of indirection via TPM chip....)

This wasn't clear in the initial email, but yes, this would be a case
of exactly what you described in the "unless" part.  The TPM-like chip
has a specific format that we're hoping to upload to it through the
OOB interfaces that would give it a form of identity.

>
> I strongly recommend that you do not invent new technology here.
> EST (RFC7030) is considered the best technology here, with SCEP (RFC8894)
> being a legacy choice.

I read through that spec a bit.  The issue there is that it has no
compatibility with Redfish, so implementing that would be yet another
subsystem to build and maintain, and wouldn't work in tandem with
Redfish aggregators once the key was decoded.  While I wouldn't be
against anyone implementing that on OpenBMC, that wouldn't meet the
needs of what we're trying to accomplish;  Also, it isn't clear that
RFC8894 has provisions for custom certificate formats, of which this
would definitely be one.

>
>     > My questions are:
>     > 1. Is this a reasonable approach?
>     > 2. Shall we define an OEM schema for our request?
>
> Finally, I am working on a BRSKI (RFC8995, aka
> draft-ietf-anima-bootstrapping-keyinfra, not quite published, still in middle
> of AUTH48) module for OpenBMC.

Neat.  Looking forward to seeing it.

>   You may prefer help with that instead of
> inventing something that hasn't gone through the same level of review.
>
> --
> ]               Never tell me the odds!                 | ipv6 mesh networks [
> ]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [
>
>

While there are efforts to standardize these kinds of payloads (see
cerberus and opentitan) the systems today will never be physically
capable of implementing whatever protocol gets standardized, so we
will need some solution regardless.

In this case, I see 3 options for how to proceed.

1. Create an OEM action within CertificateService, specific to Google,
and namespaced as such.  I'm imagining something like "Google/SetKey".
Considering the TPM-like devices have a device-specific format, and
will only ever be seen on a Google system, this seems like an
appropriate and intended use of Redfish OEM schemas.  If we went this
route, I would commit our team to at least make progress on solving
the existing OEM schema tech debt
(https://github.com/openbmc/bmcweb/issues?q=is%3Aissue+is%3Aopen+label%3A%22OEM+schema%22)
so as this would not make the situation worse.
2. Similar to 1, but the action would be namespaced within OpenBMC.
While this would also solve the problem, in-lies another problem with
how a client would know what the format of the file should be.  Other
systems that implement ROT solutions will likely have their own
format, and clients won't be able to inspect the format.
3. Put it within a google/v1 namespace path similar to ibm/v1.  This
would prevent using Redfish aggregators, which would be a problem for
the intended use case of deploying this to many bmcs.
