Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E150F1B5B1D
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 14:11:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497GP60wcFzDqkp
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 22:11:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::134;
 helo=mail-il1-x134.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=A4hAGOpm; dkim-atps=neutral
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497GMs19MmzDqkK
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 22:10:15 +1000 (AEST)
Received: by mail-il1-x134.google.com with SMTP id f82so5253287ilh.8
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 05:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VyYjDW+JIJkniAfrop5c592dFMitmO6oGkZaWnRsdJg=;
 b=A4hAGOpm9dfJZSq9XrT9tXgXVf41pQUMcU1JI5VkyUMrUw68ejZpKMcquNC18pmpOZ
 mCs4cDDC46aChxaNcZGSCSAxyg8ZRqhESoSUJA8aocvRnQvMMjNes7T90sFEvEXqvGr7
 cgSAJynGWTU3qMO8Aoa+q+Q/JoShkHQL3OuNXsOEBPF/9a+k8q//bNg8zUe1iVg99wvj
 OU7wHAHVcLHDPQefzxSfuZXxkRReaOvAAy88iLdyszWHFKm2bL0gBDHj3XbaFg/bP8kM
 F65muk4jDSrOE2g8ic80c1WWc6T7V82PQlU7LuYjaM4Tp5OwM+4Aln9nqVwl0e8HsHYW
 XhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VyYjDW+JIJkniAfrop5c592dFMitmO6oGkZaWnRsdJg=;
 b=dgT4cuP3mtj9bRYpsOJgO522rJE3M+lnYnJlupYDDBHUnhZZhJ1tvIGIhuKC0aqivP
 WA0OCfqC/o6OW181jDM8ms7xoGDd0oueu9KvRNFvdcDXnKLWfdJx/dwSDR3ALplBUJY2
 G/DtpUBR9A0iI7G+zcbI8jxND0cRd8sA0LaPmTsGrEpFNx9nf6gyP/+YPjnTI8ED047n
 lF0hFcHwtYAGI/gAT2xjnDqFEbGATF2k26GfEjXo/r9TFwsHh36L23N8vV1bzWkTL/lC
 aZw4prtmr99qPAgKeJm+pmzSU2LSdye0Cdf+ld/bVCv2ZZkOjTk5rLfUGoSEQKfw+rbC
 jV0A==
X-Gm-Message-State: AGi0PubPxv9/OJtSHNq2kI7uPfVRhHTMzk1Ysw0HMPZ8yOyP5ETJ8KaI
 V0MnXN+BsmBNq/zG9hiKnNSsBFumRXy7VUki8Ov06A==
X-Google-Smtp-Source: APiQypLpglZmRjtYUsOmu8oo8XuYcqnY22fREehtjxz6OebCYtX8zj/jdNhXrZIFOjLkD950wtIcgQulrEuM3SH5weA=
X-Received: by 2002:a92:3604:: with SMTP id d4mr3131438ila.255.1587643811985; 
 Thu, 23 Apr 2020 05:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <44bae429-2507-e044-2d0e-c4e110dfa700@linux.ibm.com>
 <9e9929c1-1c55-43ea-236d-b14c82aacf88@linux.vnet.ibm.com>
 <CADVsX8-r8ebFydQJgGQ=C7sTFVQmxk_vFinbRi2kkJ5skRgXcA@mail.gmail.com>
 <01100446-5312-2ab4-f2e4-7bab3a86631d@linux.vnet.ibm.com>
 <CADVsX8-2L6umOA8OE-8z3Buu=dKefPJa8KQvycJPPLX9QDz=nQ@mail.gmail.com>
 <CADVsX89dY1YcKmsBvsymb2dGu5_tXQNzmDCgrmf38b0_0T_y4Q@mail.gmail.com>
 <089D9714-9BE3-468C-A29D-5DEF9FB94191@fuzziesquirrel.com>
In-Reply-To: <089D9714-9BE3-468C-A29D-5DEF9FB94191@fuzziesquirrel.com>
From: Anton Kachalov <rnouse@google.com>
Date: Thu, 23 Apr 2020 14:10:00 +0200
Message-ID: <CADVsX8_Yck3vCDQGDRZXBBN744X_HSTOPeYJKy0kOuSMdQr+5w@mail.gmail.com>
Subject: Re: Security Working Group - Wednesday April 1
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="00000000000071eece05a3f421cd"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Manojeda@in.ibm.com,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000071eece05a3f421cd
Content-Type: text/plain; charset="UTF-8"

Hi, Brad.

AppArmor is upstreamed. I just enabled apparmor config for aspeed kernel.

Furthermore, Ubuntu's kernel has additional not upstreamed patches for
AppArmor. E.g. patch from:
https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/linux/5.4.0-26.30/linux_5.4.0-26.30.diff.gz

is adding new routines like:
 -- apparmor_unix_stream_connect to check perms before making unix domain
connection
 -- apparmor_unix_may_send to check perms before conn or sending unix dgrams

and various new hooks for LSM.

Without those patches we wouldn't have all the benefits for DBus hardening.
Plus, the dbus-broker doesn't support all that stuff and needs to have
features to be ported from Freedesktop/DBus.

I'm also looking into 3rd LSM alternative: KRSI

https://lkml.org/lkml/2019/12/20/641

Nevertheless which LSM we're going to use at the end, we can define rules
in phosphor-dbus-interfaces:

https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Control/Host.interface.yaml

to white list daemons / processes that might talk to specific methods or
query specific properties and so on.

Those definitions will be used to generate appropriate rules for underlying
LSM (besides general system-wide rules) at build time.

On Wed, 22 Apr 2020 at 14:33, Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> at 5:57 AM, Anton Kachalov <rnouse@google.com> wrote:
>
> > Once such dependencies were dropped, I got a working AppArmor-enabled
> > system with only a 2MB increase.
>
> Hi Anton!
>
> General question about AppArmor - would it require kernel patches to
> deploy
> it in OpenBMC?
>
> thx - brad
>

--00000000000071eece05a3f421cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, Brad.</div><div><br></div>AppArmor is upstreamed.=
 I just enabled apparmor config for aspeed kernel.<div><br></div><div>Furth=
ermore, Ubuntu&#39;s kernel has additional not upstreamed patches for AppAr=
mor. E.g. patch from:</div><div><a href=3D"https://launchpad.net/ubuntu/+ar=
chive/primary/+sourcefiles/linux/5.4.0-26.30/linux_5.4.0-26.30.diff.gz" tar=
get=3D"_blank">https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/l=
inux/5.4.0-26.30/linux_5.4.0-26.30.diff.gz</a><br></div><div><br></div><div=
>is adding new routines like:</div><div>=C2=A0-- apparmor_unix_stream_conne=
ct to check perms before making=C2=A0unix domain connection</div><div>=C2=
=A0--=C2=A0apparmor_unix_may_send to check perms before conn or sending uni=
x dgrams</div><div><br></div><div>and various new hooks for LSM.</div><div>=
<br></div><div>Without those patches we wouldn&#39;t have all the benefits =
for DBus hardening. Plus, the dbus-broker doesn&#39;t support all that stuf=
f and needs to have features to be ported from Freedesktop/DBus.</div><div>=
<br></div><div>I&#39;m also looking into 3rd LSM alternative: KRSI</div><di=
v><br></div><div><a href=3D"https://lkml.org/lkml/2019/12/20/641">https://l=
kml.org/lkml/2019/12/20/641</a><br></div><div><br></div><div>Nevertheless w=
hich LSM we&#39;re going to use at the end, we can define rules in phosphor=
-dbus-interfaces:</div><div><br></div><div><a href=3D"https://github.com/op=
enbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Control/Host=
.interface.yaml">https://github.com/openbmc/phosphor-dbus-interfaces/blob/m=
aster/xyz/openbmc_project/Control/Host.interface.yaml</a><br></div><div><br=
></div><div>to white list daemons / processes that might talk to specific m=
ethods or query specific properties and so on.</div><div><br></div><div>Tho=
se definitions will be used to generate appropriate rules for underlying LS=
M (besides general system-wide rules) at build time.</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 22 Apr 20=
20 at 14:33, Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com"=
 target=3D"_blank">bradleyb@fuzziesquirrel.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">at 5:57 AM, Anton Kachalov &l=
t;<a href=3D"mailto:rnouse@google.com" target=3D"_blank">rnouse@google.com<=
/a>&gt; wrote:<br>
<br>
&gt; Once such dependencies were dropped, I got a working AppArmor-enabled=
=C2=A0 <br>
&gt; system with only a 2MB increase.<br>
<br>
Hi Anton!<br>
<br>
General question about AppArmor - would it require kernel patches to deploy=
=C2=A0 <br>
it in OpenBMC?<br>
<br>
thx - brad<br>
</blockquote></div>

--00000000000071eece05a3f421cd--
