Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1341F23F154
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 18:36:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNWFj0b1rzDqlh
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 02:36:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=jasonling@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=CxVVMrXg; dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNWDh43G6zDq7j
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 02:35:15 +1000 (AEST)
Received: by mail-oi1-x22b.google.com with SMTP id l204so2460322oib.3
 for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2020 09:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tnN8PD771c17xUXwe6M5hJMZBhfpzNQT+4eAM5+u+SI=;
 b=CxVVMrXgLABZAYk8u6EijsL0LSiIrVlXAxJ8KePRKHbh8iN8PHMvbjwAu77mhBKCFs
 etYZgJ//JYZzzvbqoOjae2626++74o4uP0+GWtGUfGVYSq+hpdmQxaHsU9nMFxaxd11L
 y+jdajpE6KDyO+lNW92m6csVJPYyq8qwo3HXeavMGn3PUv90aq+ZEJdM5GIKEuAs7EKC
 pEf/6ix7hb/0or8Bmq2NfWiRCMEp4GYVd+39nTJPnWCOLgV5NsB3feJuQCpMgKlWw3U9
 O0no7lHHs696gyLMqafhbhv3pX4qQz94J1CD7JXV8hZDK+aY1SfE2MMXCigcBCgJdpR8
 ZJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tnN8PD771c17xUXwe6M5hJMZBhfpzNQT+4eAM5+u+SI=;
 b=InT1zZbUlrKO+RD5v9gDzA9dyq838bxwUKfWkE7oA6cx5QMZ1F7st8GF2ZQ/NHm3Fj
 ul8DuA+HliVy/uyTniOFLiIpqU5bRgV5+PhR0h10xFXpqN+ZSUHuwB0NCnrq29OfBQTa
 nQRpcAnjfOiO3ZVhrJ5IE5cy37UbhoNuhd3DJcgTI1mqWn8+LkDzK1OqqWLOIH4NtizK
 q8j2+ZfdvRLHs7A90IxiuXA62sVDDIPGUG9hPiG19iyBkmghTXycoXsr+t6tWwhr24b9
 Y0+D4XSW3JBpi7gZYuSayinoS5QzqlmfSvML7NAnLNjBUZ1TiMzwfb9XO0QyKCTzfJNc
 eSOg==
X-Gm-Message-State: AOAM531+xzB484OkjGT0I0SCBzI8e1NHC5vl53q8gmkPtcyub/KYZA0o
 z2P57at82vvNbbfESVpk1EXXFeEbrzGSP7IIc6cMVA==
X-Google-Smtp-Source: ABdhPJzEtGFDqLJD7jH/D3+UE8JvVdTPq+J131zaa3CKuUagLnM5zDyxUGHXLXktzGDN0uLhbzOEmS/2d5X2kGgbQn0=
X-Received: by 2002:aca:c6c9:: with SMTP id w192mr12232361oif.28.1596818110273; 
 Fri, 07 Aug 2020 09:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
 <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
 <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
 <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
In-Reply-To: <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
From: Jason Ling <jasonling@google.com>
Date: Fri, 7 Aug 2020 09:34:34 -0700
Message-ID: <CAHBbfcUDMOZjxSvy8wVW_F9f3+NaX-WU3G5PF1oUoRx5VP7ZoQ@mail.gmail.com>
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="0000000000003c5ee805ac4c30e8"
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

--0000000000003c5ee805ac4c30e8
Content-Type: text/plain; charset="UTF-8"

ack,
sounds like I'm better off just moving temp sensors over to being handled
by PSUSensors.

Slightly different topic:
What about making the device/type lists in PSUSensors extendable using JSON?



On Fri, Aug 7, 2020 at 9:24 AM James Feist <james.feist@linux.intel.com>
wrote:

> On 8/6/2020 3:52 PM, Jason Ling wrote:
> > Assuming that you mean "Omit Name attribute from the sensor
> > configuration definition and then change hwmontemp to require any Name.*"
> > This won't work since Entity-Manager requires Name (tried it,
> > entity-manager does indeed complain about not finding name).
> >
> > My rationale for an omit list vs permit list
> > (1) if it's a permit list then everytime you add another temp you want
> > to monitor you need to add to this list..if you want to drop a temp then
> > you have to modify the list again.
> > (2) General assumption is that the primary use case is to display all
> > named temperatures which means a permit list is typically large
> > (3) adding a permit list also breaks all existing code. Everyone has to
> > go back into their json config and add all the sensor values to the list.
> >
> > My rationale for using the value for the "Name" attribute rather than
> > labels or referencing sysfs attributes
> > (1) Looking at just the config , it's obvious as to what you're omitting.
> > (2) If it's label base, a label change in a driver would mean a breakage
> > in the userspace daemon. Not a big deal; but it can be annoying.
> > (3) if it's sysfs attribute based then it's my opinion that it's not as
> > readable.
> >
>
> I'm not a huge fan of this as the PSU sensor already has a way of
> handling this, and it adds a new way of handling it. I'd rather follow
> what is already there. It's already confusing enough that hwmontemp and
> psu do things in slightly different ways.
>
> >
>

--0000000000003c5ee805ac4c30e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ack,<div>sounds like I&#39;m better off just moving temp s=
ensors over to being handled by PSUSensors.</div><div><br></div><div>Slight=
ly different topic:</div><div>What about making the device/type lists in PS=
USensors extendable using JSON?</div><div><br></div><div><br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, =
Aug 7, 2020 at 9:24 AM James Feist &lt;<a href=3D"mailto:james.feist@linux.=
intel.com">james.feist@linux.intel.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On 8/6/2020 3:52 PM, Jason Ling wrote=
:<br>
&gt; Assuming that you mean &quot;Omit Name attribute from the sensor <br>
&gt; configuration definition and then change hwmontemp to require any Name=
.*&quot;<br>
&gt; This won&#39;t work since Entity-Manager requires Name (tried it, <br>
&gt; entity-manager does indeed complain about not finding name).<br>
&gt; <br>
&gt; My rationale for an omit list vs permit list<br>
&gt; (1) if it&#39;s a permit list then everytime=C2=A0you add another temp=
 you want <br>
&gt; to monitor you need to add to this list..if you want to drop a temp th=
en <br>
&gt; you have to modify the list again.<br>
&gt; (2) General assumption is that the primary use case is to display all =
<br>
&gt; named temperatures which means a permit list is typically large<br>
&gt; (3) adding a permit list also breaks all existing code. Everyone has t=
o <br>
&gt; go back into their json config and add all the sensor values to the li=
st.<br>
&gt; <br>
&gt; My rationale for using the value for the &quot;Name&quot; attribute ra=
ther than <br>
&gt; labels or referencing sysfs attributes<br>
&gt; (1) Looking at just the config , it&#39;s obvious as to what you&#39;r=
e omitting.<br>
&gt; (2) If it&#39;s label base, a label change in a driver would mean a br=
eakage <br>
&gt; in the userspace daemon. Not a big deal; but it can be annoying.<br>
&gt; (3) if it&#39;s sysfs attribute based then it&#39;s my opinion that it=
&#39;s not as <br>
&gt; readable.<br>
&gt; <br>
<br>
I&#39;m not a huge fan of this as the PSU sensor already has a way of <br>
handling this, and it adds a new way of handling it. I&#39;d rather follow =
<br>
what is already there. It&#39;s already confusing enough that hwmontemp and=
 <br>
psu do things in slightly different ways.<br>
<br>
&gt; <br>
</blockquote></div>

--0000000000003c5ee805ac4c30e8--
