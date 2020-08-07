Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F3923F18E
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 18:55:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNWhF1XYSzDqMX
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 02:55:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=jasonling@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=P7u9R7xi; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNWgH3wH9zDqnW
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 02:54:49 +1000 (AEST)
Received: by mail-oi1-x229.google.com with SMTP id v13so2456884oiv.13
 for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2020 09:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6m7H/TNTOgi6ek5c4yGYEYo0FBbbzvDc9gGJ9T+ENwk=;
 b=P7u9R7xi1RKBcoDVRI+D4V88j3p1WeOuvODPrszohx73veU+F5p7OQqglS0sglc584
 DYJJPe6ATXtqTS/MqVLizTA1WaL0/EEcHl4lRLkSUYqWY6jcgWAQVdPPG+KnWDnCN8Jc
 5GdeInKfNYYP2kSDZTJwfDvrI6AmBNM5suwFI2cXUsL0jJN5x+Pr7tjoKRnyzBoeKB7P
 20XXH07EEZ1aIc3HW3/DbaSyc0sNndhNHMKWXy0etYfdD4L6XR+9sqeQ8bNTlqyQaVMP
 6rJrpNq1SPy1opJek2vbhXVb0+lg+RD9XQ19KwXBRqZ5/PIKkjCUAF/sbplZSqOvCpim
 gQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6m7H/TNTOgi6ek5c4yGYEYo0FBbbzvDc9gGJ9T+ENwk=;
 b=FZc2QuUvS8lD/S3qxadA+gh7Bv+YUte2jPw/fogFxEGWKE7UNhP3JPUYdL83Lqjk//
 MtKJR7y/hloN6RfG9TyPTiGuD2k+Xduh1DRZ0KoWfdJCCyb+uOdBj/EwrhrcWYw7oT7P
 9vn8S7Eyv986NHnQ761BO4wNgxHho2ZLtWpqL5U/TPI2ObFkTtRpnowngdh5+5K03XRz
 6G+zIjiamd8KuXK04fNcfGo3/NpD2/J4DYXIIGs+k0YrtmrEgDCSfoQq0oNG3fjU2i4T
 T+8FeKG6qc1Md2N/1QINw1bDX8rvR5kNAi2jjVwSE99Zy8pwk0xhOuJ3d4VZHTBmOvN1
 TQrw==
X-Gm-Message-State: AOAM530oVn3HpRkXiV9y7t2nQKEdiVbkPwzSL0dSpfRM0XYZFKV5/o4e
 zF2IYdGHrZbLnjlDVhDhbwZRArCRJqsUxWDE+CwISA==
X-Google-Smtp-Source: ABdhPJxP/q8Dhie/eJXW+8yBdn1uxjZJa+7nfCNGaZzEsVeBPrv1tsOh+3fmnE3siFdEJIaIb95wJdkaXcsS8+q3j6k=
X-Received: by 2002:aca:c0c1:: with SMTP id q184mr12597567oif.56.1596819285532; 
 Fri, 07 Aug 2020 09:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
 <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
 <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
 <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
 <CAHBbfcUDMOZjxSvy8wVW_F9f3+NaX-WU3G5PF1oUoRx5VP7ZoQ@mail.gmail.com>
 <CACWQX82KAhmRbg-CYa8+Yjd8mE7qCM_vG_Q1_hYZVR77c3gdtw@mail.gmail.com>
In-Reply-To: <CACWQX82KAhmRbg-CYa8+Yjd8mE7qCM_vG_Q1_hYZVR77c3gdtw@mail.gmail.com>
From: Jason Ling <jasonling@google.com>
Date: Fri, 7 Aug 2020 09:54:09 -0700
Message-ID: <CAHBbfcUJGnsW_dxONwjsT=w3ZM453-o0Ubc7DE7oOJQ8u28=ww@mail.gmail.com>
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: Ed Tanous <ed@tanous.net>
Content-Type: multipart/alternative; boundary="000000000000495bc905ac4c769b"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000495bc905ac4c769b
Content-Type: text/plain; charset="UTF-8"

> What about making the device/type lists in PSUSensors extendable using
JSON?

> Say more about what you're wanting to do here.....

 Take
https://github.com/openbmc/dbus-sensors/blob/master/src/PSUSensorMain.cpp#L43
 and
https://github.com/openbmc/dbus-sensors/blob/master/src/PSUSensorMain.cpp#L59
and
make it so those can be extended using (for example) without an upstream
code change. I picked JSON as the easiest example.
IIRC PSUSensors does validity checks to make sure that the device emits a
name in its 'permit list' (hwmontempsensor is less picky) so tricking
PSUSensors into gathering telemetry for a non-public device is tricky.

Can you give an
> example of what you would use it for?

Sure, the primary use case would be
It's a non public device. Would rather not broadcast information about it
or have to obfuscate the device name. Really would rather not maintain
patches until the device is made public.



On Fri, Aug 7, 2020 at 9:39 AM Ed Tanous <ed@tanous.net> wrote:

> On Fri, Aug 7, 2020 at 9:36 AM Jason Ling <jasonling@google.com> wrote:
> >
> > Slightly different topic:
> > What about making the device/type lists in PSUSensors extendable using
> JSON?
> >
>
> Say more about what you're wanting to do here.....  Can you give an
> example of what you would use it for?
>

--000000000000495bc905ac4c769b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(80,0,80)">&gt; What about making =
the device/type lists in PSUSensors extendable using JSON?</span><br><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Say more about what you&#39;re =
wanting to do here.....=C2=A0</blockquote><div>=C2=A0Take=C2=A0<a href=3D"h=
ttps://github.com/openbmc/dbus-sensors/blob/master/src/PSUSensorMain.cpp#L4=
3">https://github.com/openbmc/dbus-sensors/blob/master/src/PSUSensorMain.cp=
p#L43</a>=C2=A0and=C2=A0<a href=3D"https://github.com/openbmc/dbus-sensors/=
blob/master/src/PSUSensorMain.cpp#L59">https://github.com/openbmc/dbus-sens=
ors/blob/master/src/PSUSensorMain.cpp#L59</a>=C2=A0and make it so those can=
 be extended using (for example) without an upstream code change. I picked =
JSON as the easiest example.<br>IIRC PSUSensors does validity checks to mak=
e sure that the device emits a name in its &#39;permit list&#39; (hwmontemp=
sensor is less picky) so tricking PSUSensors into gathering telemetry for a=
 non-public device is tricky.<br><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"> Can you give an<br>example of what you would use it for?=
</blockquote><div>Sure, the primary use case would be</div><div>It&#39;s a =
non public device. Would rather not broadcast information about it or have =
to obfuscate the device name. Really would rather not maintain patches unti=
l the device is made public.</div><div><br></div><div><br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug=
 7, 2020 at 9:39 AM Ed Tanous &lt;<a href=3D"mailto:ed@tanous.net">ed@tanou=
s.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Fri, Aug 7, 2020 at 9:36 AM Jason Ling &lt;<a href=3D"mailto:jasonl=
ing@google.com" target=3D"_blank">jasonling@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Slightly different topic:<br>
&gt; What about making the device/type lists in PSUSensors extendable using=
 JSON?<br>
&gt;<br>
<br>
Say more about what you&#39;re wanting to do here.....=C2=A0 Can you give a=
n<br>
example of what you would use it for?<br>
</blockquote></div>

--000000000000495bc905ac4c769b--
