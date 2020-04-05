Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBDB19EB76
	for <lists+openbmc@lfdr.de>; Sun,  5 Apr 2020 15:30:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wF0r1YCSzDqyY
	for <lists+openbmc@lfdr.de>; Sun,  5 Apr 2020 23:30:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d29;
 helo=mail-io1-xd29.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=aoAKZy4U; dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wDz352QrzDqwl
 for <openbmc@lists.ozlabs.org>; Sun,  5 Apr 2020 23:29:01 +1000 (AEST)
Received: by mail-io1-xd29.google.com with SMTP id c16so12795243iod.6
 for <openbmc@lists.ozlabs.org>; Sun, 05 Apr 2020 06:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=drAiiFHK5nYBYVpUIYxjaPiqYhA+9Rpr6ZfJ9o/2gKc=;
 b=aoAKZy4UEzzazwxGHrLY827VCMC9/+l8Crlh/HxMi6j6L8rJB2EHtZuaz0e/meGEaK
 26G/4nR7HIWgrQgg9L1IPWlsO4GM9JurnSJYRaY7+hucSp4TdBimJBWUCvgAGpFyFg5+
 hrD0bsefmT7ioG0JHHugvg9qMVQlkHP254Q4YeZ1Xq+g2Sy2L4x+2IVFizU0XcJlm3oD
 VayHOhihR6v9rgEDm76jYAQgbfZwNyr8dQYFQD/4jVY8SsMAR2ZYy3p/o2v5jCQiGWPO
 7Suq3XIVsISdqyf7YZqvtHey17Xb4yuqFQsJGsUlwzVzPeSjTxXlJXI2Ck+VYVyk0d7k
 kkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=drAiiFHK5nYBYVpUIYxjaPiqYhA+9Rpr6ZfJ9o/2gKc=;
 b=qEbhzpL1U258b36QGfLfkkrUdzrehk5RA7EWMRHaQSyMMRFQml0Iww120Hf+1KIAj7
 bDrrLLW477reYf2PafCKjUTEyuUBtLOX0lAd0IOUqgJVMFWXdhfvqcd1jGL18m7TEPse
 bJCccGALxjg4jW7r+5C8Sp6zGA+FcnbdZ4e7mDinrAOYY3oB+UTGBz0EQSxkg9hxLYPt
 HRuoLOsSqrnzwRb6Vo9bSUseO2Qb4fXkx3clLrAa3F18IqmLMxCV4MXZqL4zLcJRmVVY
 sIMPY3/5I9WldZBuopAvzjSn0OZ3ww3QLW+Sg/xY4AF841tpusZKrhhL5PSs+53uZS9X
 7EDA==
X-Gm-Message-State: AGi0Pubw6c3O3fCsufm9DlFAjdZLS893al4LkcUG2OkaumpHgL6I6C0Z
 ZWD/JyVedzDrL7SkR78xDi9hkzvSthIth+/fjGRxdA==
X-Google-Smtp-Source: APiQypKo+5J20sJ4YPoZ2n8RiS9M+CPenjJO5GTW8eeGJSUBM33P6zAbKGQTmMzMDQHVC7uV9ZuNTUBwdlaMKZk9Sho=
X-Received: by 2002:a02:70c7:: with SMTP id f190mr9510111jac.60.1586093335865; 
 Sun, 05 Apr 2020 06:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <44bae429-2507-e044-2d0e-c4e110dfa700@linux.ibm.com>
 <9e9929c1-1c55-43ea-236d-b14c82aacf88@linux.vnet.ibm.com>
In-Reply-To: <9e9929c1-1c55-43ea-236d-b14c82aacf88@linux.vnet.ibm.com>
From: Anton Kachalov <rnouse@google.com>
Date: Sun, 5 Apr 2020 15:28:44 +0200
Message-ID: <CADVsX8-r8ebFydQJgGQ=C7sTFVQmxk_vFinbRi2kkJ5skRgXcA@mail.gmail.com>
Subject: Re: Security Working Group - Wednesday April 1
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000dde80805a28b2196"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000dde80805a28b2196
Content-Type: text/plain; charset="UTF-8"

Hello, Ratan.

Would you mind breaking down the estimation, curious about what brought up
18MB when enabling SELinux.
Precompiled rules in Android took 3MB on average.

On Wed, 1 Apr 2020 at 16:22, Ratan Gupta <ratagupt@linux.vnet.ibm.com>
wrote:

> Hi Joseph,
>
> We did some POC around selinux, will share the detailed use-cases with
> selinux which can be useful in openbmc stack.
>
> selinux is taking around 18MB space on flash, Is it a concern?
>
> Regards
>
> Ratan
>
> On 3/31/20 9:51 PM, Joseph Reynolds wrote:
> > This is a reminder of the OpenBMC Security Working Group meeting
> > scheduled for this Wednesday April 1 at 10:00am PDT.
> >
> > We'll discuss current development items, and anything else that comes up.
> >
> > The current topics:
> >
> > 1. SELinux or AppArmor plans
> >
> > Access, agenda, and notes are in the wiki:
> >
> > https://github.com/openbmc/openbmc/wiki/Security-working-group
> >
> > - Joseph
> >
>
>

--000000000000dde80805a28b2196
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello, Ratan.<div><br></div><div>Would you mind breaking d=
own the estimation, curious about what brought up 18MB when enabling SELinu=
x.</div><div>Precompiled rules in Android took 3MB on average.</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed,=
 1 Apr 2020 at 16:22, Ratan Gupta &lt;<a href=3D"mailto:ratagupt@linux.vnet=
.ibm.com">ratagupt@linux.vnet.ibm.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Hi Joseph,<br>
<br>
We did some POC around selinux, will share the detailed use-cases with <br>
selinux which can be useful in openbmc stack.<br>
<br>
selinux is taking around 18MB space on flash, Is it a concern?<br>
<br>
Regards<br>
<br>
Ratan<br>
<br>
On 3/31/20 9:51 PM, Joseph Reynolds wrote:<br>
&gt; This is a reminder of the OpenBMC Security Working Group meeting <br>
&gt; scheduled for this Wednesday April 1 at 10:00am PDT.<br>
&gt;<br>
&gt; We&#39;ll discuss current development items, and anything else that co=
mes up.<br>
&gt;<br>
&gt; The current topics:<br>
&gt;<br>
&gt; 1. SELinux or AppArmor plans<br>
&gt;<br>
&gt; Access, agenda, and notes are in the wiki:<br>
&gt;<br>
&gt; <a href=3D"https://github.com/openbmc/openbmc/wiki/Security-working-gr=
oup" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/openbm=
c/wiki/Security-working-group</a><br>
&gt;<br>
&gt; - Joseph<br>
&gt;<br>
<br>
</blockquote></div>

--000000000000dde80805a28b2196--
