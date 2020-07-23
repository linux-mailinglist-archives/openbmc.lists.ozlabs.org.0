Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 212E322B7AD
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 22:26:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCP4Q35zLzDrck
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 06:26:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=uoituAER; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCNhw433CzDrVT
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 06:09:36 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id 133so3487134ybu.7
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 13:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IEPXQBI3SDOsIPYh/eeh1SmSKMJ4z6d6LZHjgywObF8=;
 b=uoituAERr9fQt6SSzW5XrD8K4MBC3uIXogOW0SFonpKeDBDaQR6wxC+DOBQHwJpDcS
 ATK6M/Ye6Xq1srBI9PBZghZZIQYzyNhYr/AkF20o3hnN1r3rUaP7+K5QM9rF2cy90OqU
 Pjf8801MPNBzOMtx/EnksdZSblq128YWgzfOUaMgV48gBVhQAMNsngg/pQiZzuatkhZQ
 k1qw6U7uW2HuF7SJpSfm+mgxLf1lhvWH/G6xUPTaWLO/mgEMSaXQNaeKsZuadnFJEh85
 hdUUY4z/1Jajd2mWoNV+lSLNpd5yl7GBkP921myLZKz+XQu7SciNFb+9xw6CeL4y5aC8
 bm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IEPXQBI3SDOsIPYh/eeh1SmSKMJ4z6d6LZHjgywObF8=;
 b=dzDPGHUdBL5PhJfHnSvZKGXDSsHL78dewxVBxOvlWX+Z/s+6W1i1K3bne3t+b8a3Hz
 joAEwsJ6DfRUDVBkG15Az5QhBninI0IoCW3ky4cimbAGsqmIcvQbsJKTtpOhFZuQCdcC
 U54Id3NF7N4IaHdXZKyypqZIpzLkvCMF/bnCjqgC9QI3EbM16BnO/x4wFf8GOw+yaUq6
 JTLWV3FRpYE7m814xI44bMzE+n4VjqZhRoRk01veqHNPsXUwn8w+tOoBNVkBUN3gf3ax
 Me4/+3dYqyOC/fzkQQt64CvwGeEEeDh3S+dRLxdFkGgpkVTOHzqWZPQlYRgk/1nX68W3
 Zuaw==
X-Gm-Message-State: AOAM532lPODsJMM6Ofp5NhEIu+562tiCiAQSPbcieAZAg2EZ8I0M4E5X
 R/o4hAfVJ/yoAfyxqJH8Jnl68Ek7fcrh+1W3PcvU8w==
X-Google-Smtp-Source: ABdhPJzNj5k0eT9/gITJ4oTAX/9jxQYGef8SfLaxsfURGblg+hE6v952dD3zhD3N/wB9WPJ3QpeYq506Y4aNkcFrcWk=
X-Received: by 2002:a5b:74d:: with SMTP id s13mr8362777ybq.170.1595534970079; 
 Thu, 23 Jul 2020 13:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <b8ec220b-56ca-45f7-99be-5ab197c4d881@linux.ibm.com>
 <b5f1c04f-eb6c-7dac-2945-cff9815a7ca6@linux.ibm.com>
 <CACWQX80aD212+JKwqGJoowyb4S7wLcnUCyVLwOMko8T_86yunA@mail.gmail.com>
 <8008.1595531126@localhost>
In-Reply-To: <8008.1595531126@localhost>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 23 Jul 2020 13:09:19 -0700
Message-ID: <CACWQX83HPvOTRkf=K8BfBjAgJGaDi2_UEi3GvWMO8j3kNJ2Tqg@mail.gmail.com>
Subject: Re: Security Working Group - Wednesday July 22 - results
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 23, 2020 at 12:05 PM Michael Richardson <mcr@sandelman.ca> wrote:
>
>
> Ed Tanous <ed@tanous.net> wrote:
>     > One thing to note;  At one point, I had talked through how to
>     > prototype ACME protocol replacement of certificates automatically, so,
>     > given an ACME server on the network, the BMC could essentially
>     > automatically provision itself and keep its certs up to date.  If
>     > someone wanted to run with that, it might reduce some of the pain here
>     > (and be extremely cool).
>
> I have running code, but to use ACME, requires some initial trust
> relationship.  The manufacturer can do that if they want.

Lots of (mostly private) meta layers have this set up already for
internal use and add the relevant CA cert to the build.  Also, I think
(I could be wrong) the ca-certificates package is included in most
builds already so we can handle trust with foreign servers (for things
like HTTP event push).  Presumably ACME uses the same trust
relationship, or does it have a specific mechanism that's unique?

>
> One can also use draft-ietf-anima-bootstrapping-keyinfra + EST (RFC7030).

... has been added to my nightly reading list.

> These two are not mutually exclusive.
>
> I hope to clear my plate enough before the end of the year to demonstrate
> this on OpenBMC.

Awesome.  Looking forward to it.

>     > It should be noted, most browsers (in my testing) seem to ignore the
>     > HTTP date header entirely, so the BMC doesn't even need the correct
>     > time to set up a proper encryption channel.
>
> That's very surprising and counter to my experience.
> The more likely case is that the OpenBMC has the wrong date.
>

IIIIInteresting.  Clearly I need to do more testing.  Just to be
clear, I'm talking about the HTTP response date:
https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Date

Not the validity dates in the TLS certificate.  There were a couple
versions of bmcweb where the Date field was broken as well as systems
with a reset CMOS where the date is incorrectly set to epoch.  In both
cases, no browsers threw any kind of warning that I recall, we just
happened to notice it on the debug output.
