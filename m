Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEBBDF6E1
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2019 22:41:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xpSw6rtkzDqNS
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 07:41:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VMvXwsXQ"; 
 dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xpRz50gwzDqNS
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 07:40:29 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id q7so9143351pfh.8
 for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2019 13:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bMnhkHUvyFi3tSB3LuqXbV6JMSfG5FWox4MhgnvFup0=;
 b=VMvXwsXQQ42xulg93hfTPHuuG7wmqZ7eOd3fo0TOR7Jbiv6CJKwTLNniLYIlt9LHyz
 aU2hm/GsBg59oOpw1GyR0retdgZsF6daVTFUFaf1La1VGGdzxIFpfGqb5eaJHma2GoSW
 0glWPuY6FBT/4P0vmpRHPY5Ies2LLW3dcfxW6tZyTlCMwQZ1lx1cS6/DHifdC5Cx3m+B
 g+yrvK8JxUS1/fRN8QQtSKSwvdcpDCXg0jzRsncmdaQf8BOqGZc3Ls0YchC1+v2wgPMk
 AAhyeo8NPo0UmI6XcnrTSXquYEiOx6C24d9iFPIsQUcjQIUSD0LwbVWWqHSRFPRCj2uc
 6uLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bMnhkHUvyFi3tSB3LuqXbV6JMSfG5FWox4MhgnvFup0=;
 b=AxZH+ehM8rmXOTVho/vEQaSVVG4o/fPFnDVKEZPDyRXj7n4tQ6f11LRXanW6A3Q5Ot
 oPIGy5x8FYeOUBUy4fENIkAGBYIrs+gOE05fHtXjnNwGF56GB8OlGNcadb8DON9oY9fF
 EKQIT8cHF91mVdEJ5JI7qW9APCfdkPU21X6u1RF7p0ibAnlQI3VsMJYFSVKT07hxj281
 NeXE1y5hK0CzGjhMeMHRXXUmYVY9cYa0f5PpOuGQzxe3ds/gKdHGJgbBcR80KDdUWSYJ
 s37tOA2DUZAUR3wSt48Cvcf9j7vzJ4JDEYVik5JgINNKJZCOGduJGdBcqrW936YNh5bJ
 kh8w==
X-Gm-Message-State: APjAAAVAaK/f5GJO94K5EqRBmva0Da5QplJXUoXHYCD2iPfIbCuIQTvr
 Zt8PYf4NTdxg6HiwGLQmnieYkEfcXhxSJtZMl2jIQA==
X-Google-Smtp-Source: APXvYqzArvxFlQuotGrwqXmNJuBTit02MfPNey/KQ2gDVA5De31Bg0wL3uXwbEjEfOZIftfgU4tHakGCMZNftektr8A=
X-Received: by 2002:aa7:908b:: with SMTP id i11mr25554816pfa.186.1571690424187; 
 Mon, 21 Oct 2019 13:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <27c9e9df-6d1f-5fce-ed88-57d9cbfa71f9@intel.com>
In-Reply-To: <27c9e9df-6d1f-5fce-ed88-57d9cbfa71f9@intel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 21 Oct 2019 13:40:13 -0700
Message-ID: <CAO=notz3bML97-cS42Y9J2t-7eFdXpeMj0kBoCUeRBt8--wS1A@mail.gmail.com>
Subject: Re: It's been fun
To: Ed Tanous <ed.tanous@intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 21, 2019 at 1:34 PM Ed Tanous <ed.tanous@intel.com> wrote:
>
> All,
>
> This week will be my last week at Intel.  I'll be moving onto something
> else non-OpenBMC related for a bit;  While I may check in on the project
> from time to time, it's going to stop being my day job.
>
> You'll still be able to reach me at my other email, ed@tanous.net, and
> several key people across the project including the TSC have my cell
> number if there's some unknown OpenBMC "emergency", but I doubt that's
> going to be needed.  Functionally, I've made sure that every repo I
> maintain has backup maintainers, so as of the 25th, it will fall to
> those individuals to do new reviews for those individual repos.  I'll be
> pushing updates to the MAINTAINERS files shortly to that effect.
>
> Thanks you for all the patches, ideas, reviews, and merges that others
> have done for me over the last couple years.

It's been swell, good luck!

>
> Until we meet again,
>
> -Ed
