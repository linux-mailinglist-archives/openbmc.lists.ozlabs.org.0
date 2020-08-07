Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B1E23F272
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 20:06:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNYFl1mzGzDq61
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 04:06:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=jasonling@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=v0vzcMeK; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNYDd5JVCzDq61
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 04:05:19 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id b22so2680735oic.8
 for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2020 11:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FscRUT5QovAKGDt/TCgV5XvTjjEQQXDdvuv1gs9jh2A=;
 b=v0vzcMeKPo6PP2JRmaA6l/Ht5UwqM1tOsrLUu6ijxtvYJRvXr9jNZvYEIX78v41PC4
 brAHtkBh1ZlNFmg6IevwUUZW0IwmpWrgorrSfQmmJj83rdD7GYQKSEwL//rFPwZfyF/H
 ffS7gMkCUx3Hpn9uWpcL1j8yQxZwQPXnzDwjeU76hcHcIPwGxx25rhNUanVlgz06nezo
 7qC+0bXhRjZPAFgPM76NZaTWV5rZzG2/fMhpI36Rowy4pLnKfsD5xp2nqTGzqHkViDXj
 STvd56VlY0R0iCcxQpWQNbcA7rgYGtCi6qS5kos3Z2PT1T5RHnlJPmBDEorlb9ShigKb
 Ofng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FscRUT5QovAKGDt/TCgV5XvTjjEQQXDdvuv1gs9jh2A=;
 b=LZ+TH3jeiLBvRl+s2o2485Umb5rX7vqXTLo9Pf14f5IzCcW0H6KKgZaGFCmVq9EJVk
 +2hYh69zvJfnBkBvDl0ktL4FEL/ZIGPKClPXtZQCzaFGOnQDZzsL0QZJuMqiiJk6A+Se
 vMdTFOsu9BwQHIIdZMViN9YKOeMpsD+Cq7adpQ8884zZuwVUrH3LAe9E05+7gOd03POK
 8CCwow+TI9lRXqq7AIKUgTEbftay8OmcDCLXDUERXourMxVAuHNZRrrkAjvUJaYR9yqc
 hP6HaMDDUl8N3j9wKtpSRm4Q983182bwiAT7Ww5y0W0HwUUQjo09WmU+qOIQETSDsG4/
 aWvQ==
X-Gm-Message-State: AOAM530JCQd4Ex5BSajVHkAyznJYoyQwC9XIVMbYyf3mUXsGW4iu2gRc
 ZO5g8LiKA1uY014BHDHMR1uzUuqLeKQ8sU88OuUUHw==
X-Google-Smtp-Source: ABdhPJzpBKV+nEwyLqfUfU/YJtHZGn6C96m82mo1RmeDqxhlvBYT6iBwmx3fOEW/ZNpBxxHJNTZJDrTk7CAKdZzRp0M=
X-Received: by 2002:aca:cdc4:: with SMTP id d187mr12389440oig.69.1596823517250; 
 Fri, 07 Aug 2020 11:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
 <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
 <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
 <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
 <CAHBbfcUDMOZjxSvy8wVW_F9f3+NaX-WU3G5PF1oUoRx5VP7ZoQ@mail.gmail.com>
 <CACWQX82KAhmRbg-CYa8+Yjd8mE7qCM_vG_Q1_hYZVR77c3gdtw@mail.gmail.com>
 <CAHBbfcUJGnsW_dxONwjsT=w3ZM453-o0Ubc7DE7oOJQ8u28=ww@mail.gmail.com>
 <5a59238b-7653-b11f-701b-039d57dd5b98@linux.intel.com>
 <CAHBbfcXRO5ZB3S0T6SyRkWkLLAruKPdS8UhUkyG3qssU5YkHNw@mail.gmail.com>
 <9deda21d-aa01-d15e-464e-7ab0fb2f751c@linux.intel.com>
In-Reply-To: <9deda21d-aa01-d15e-464e-7ab0fb2f751c@linux.intel.com>
From: Jason Ling <jasonling@google.com>
Date: Fri, 7 Aug 2020 11:04:40 -0700
Message-ID: <CAHBbfcX7TahfKcVcUqWKQGTK5s9Rzw3mT4_3v4tWtkAgHBgX6g@mail.gmail.com>
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: James Feist <james.feist@linux.intel.com>, Alex Qiu <xqiu@google.com>
Content-Type: multipart/alternative; boundary="00000000000084265d05ac4d72c1"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000084265d05ac4d72c1
Content-Type: text/plain; charset="UTF-8"

> Yeah that's what I meant, a generic PSUSensor Type with a field called
> 'Export' or something that EM can use to get the Export type.
>
Sure, I think that handles the EM side of things.

I'm conflicted on that.  Part of the reason that list is there, and
> not in the config files directly, is to convey that those are the
> types that have been tested to work correctly, and the types that the
> config files "promise" to work sanely.  The other thing is, if you've
> done the testing, adding to that list is (should be) relatively
> trivial and straightforward.  Opening up that list to runtime parsing
> opens a lot of security questions I'm not prepared to answer.

Sure, let's scrap runtime parsing and go for something far simpler.
(1) have a base type, devices list that represents the approved device list.
(2) have an empty extended type, device list that represents user specified
extensions.
(3) factor these out into separate files and provide a method that returns
the union of the base and extended types/devices.

now we have a base type/device list that contains supported guaranteed
devices and another extended type/device list that is easier to maintain
patches for.
I think that's a rather small change and accomplishes what I'd like while
preserving the intent of keeping a list of supported types/devices.
What do you think?

--00000000000084265d05ac4d72c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Yeah that&#39;s what I meant,=
 a generic PSUSensor Type with a field called<br>&#39;Export&#39; or someth=
ing that EM can use to get the Export type.<br></blockquote><div>Sure, I th=
ink that handles the EM side of things.=C2=A0</div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">I&#39;m conflicted on that.=C2=A0 =
Part of the reason that list is there, and<br>not in the config files direc=
tly, is to convey that those are the<br>types that have been tested to work=
 correctly, and the types that the<br>config files &quot;promise&quot; to w=
ork sanely.=C2=A0 The other thing is, if you&#39;ve<br>done the testing, ad=
ding to that list is (should be) relatively<br>trivial and straightforward.=
=C2=A0 Opening up that list to runtime parsing<br>opens a lot of security q=
uestions I&#39;m not prepared to answer.</blockquote><div>Sure, let&#39;s s=
crap runtime parsing and go for something far simpler.=C2=A0</div><div>(1) =
have a base type, devices list that represents the approved device list.</d=
iv><div>(2) have an empty extended type, device list that represents user s=
pecified extensions.</div><div>(3) factor these out into separate files and=
 provide a method that returns the union of the base and extended types/dev=
ices.</div><div><br></div><div>now we have a base type/device list that con=
tains supported guaranteed devices and another extended type/device list th=
at is easier to maintain patches for.</div><div>I think that&#39;s a rather=
 small change and accomplishes what I&#39;d like while preserving the inten=
t of keeping a list of supported types/devices.</div><div>What do you think=
?=C2=A0</div></div></div>

--00000000000084265d05ac4d72c1--
