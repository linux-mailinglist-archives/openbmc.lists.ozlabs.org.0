Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6876822EBB4
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 14:06:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFdp54K2PzF10j
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 22:06:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=tyler.sabdon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZWIUJLHp; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFdmt116BzF0fg
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 22:05:49 +1000 (AEST)
Received: by mail-qk1-x72f.google.com with SMTP id b14so13215006qkn.4
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 05:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FILf6PdUnzw4YUTaVoZU341Bz25gZ5j/QJ2SkZClFEc=;
 b=ZWIUJLHpCmya9Ekfg/Q7Ib1JSV/R5OrzQTPxtTlf3/NOTElaLftLEyBqqqXHkURe08
 AEwpcb4dys+Zc27AClKx94UfeS/naNTO5TcFOKc4qPQNsGhuxX6QEHPEAy/3W8nQdl4L
 bhO4q+9ENBKUvwKSd0+izWCGnpUWEVwmlCg7/dF6pqNoDi48BqcnEZ0PlRRqcpYxIFEB
 UKXzSx/Iy0T6rKmq+w6zbipzJ2jHL+wHoIZdX0DHAp8WjzXYMcI9CBO2AgWj3RonmGrz
 zzzWkHEzbRgnVWuTaJcECBH7Wq8wo2ZTL4arbRD0nRFHOnHDTwtJgzDbsb7n9K5BfoOH
 0o3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FILf6PdUnzw4YUTaVoZU341Bz25gZ5j/QJ2SkZClFEc=;
 b=RvD84lU19HrzlD9QctDPaS+L1bPsxXPlOamem3SEog9plZLUFzwv5tlD5x3IU/cOLO
 iRTKPdx/0eYg4u1HGrWBewT9tHb1If3grO+ez0OabhBZ3aN8bnNhLPiZritskHo1G+ja
 aLHuaX+EENoCHHofBLMwxHSeZJi2TR1em+OwENA+Vn7i7GoP5NWbK/UxNokVZaZlBDOw
 KUlFX0qcTs+anTo75hxlDabYGw3xfs/CMcabTz3cLsspXxQFUkBDRAdZRr3iBvixcozO
 NaGn1wsD8fl9Ae+qYv1je4IEQ1lop+SjcT90K32lkWgdIlFlNc91RmfTau9DjJIWDv7C
 +LoA==
X-Gm-Message-State: AOAM531SvzLUXGbRbJ4h4oFDcNPInLfpKO4cT5K/FDMFX1Ek8iV1uEtM
 lYgDm16RAKTm9+rMSftwNT2+TIk54KI0131+PzYe7/P8
X-Google-Smtp-Source: ABdhPJxXrMD2ZzsczU8RBTVXkVBnxVy9rwXYM1nvDscJCwz5IEV8GhxkrYFuX4Y9dWwq4vXsHZd1QKMJAUfMDkkR2P4=
X-Received: by 2002:a37:44c1:: with SMTP id
 r184mr22821947qka.232.1595851544990; 
 Mon, 27 Jul 2020 05:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <dbdb4dac-a73a-5c39-8cf8-33dd2d318d16@linux.ibm.com>
 <2cb1c83a-9803-c9ac-ae76-2e09b616562e@linux.intel.com>
 <4a5cad39-b366-0a0c-54b0-23da9f2a3d81@linux.ibm.com>
 <c9ec3a62-8fa2-f48b-14c2-d9cb3a3c2467@linux.intel.com>
In-Reply-To: <c9ec3a62-8fa2-f48b-14c2-d9cb3a3c2467@linux.intel.com>
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Mon, 27 Jul 2020 20:06:22 +0800
Message-ID: <CAO9PYRLTB7PGMTjh3K5RFgOMtThGRRCUOTwx72cjMBhP=GYuGA@mail.gmail.com>
Subject: Re: dbus-sensors
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000074188405ab6b243e"
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
 Matt Spinler <mspinler@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000074188405ab6b243e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jame:
    I am investigating and porting psusensor to my platform. I have a
question item 5.
>> 5. We have a case where a driver isn't loaded with power off, so somehow
>>    we still need the sensors to stay on D-Bus when off (and show them
>>    as not available).
>
> All sensors are on d-bus all the time, its based on the EM config.

I create 2 psu config, psu1 and psu2, in entityManager and booting my
system with 1 psu. There is only psu1 sensor object created in psusensor
service.
After inserting psu2 and the driver binding hwmon for psu2, psusensor
service don't create psu2 sensor object.
Does it work as design? or I need update dbus-sensor?
My dbus-sensor revision is "c140e2008b038b5fbf07aca0795b8030224eddd4".

Tyler

James Feist <james.feist@linux.intel.com> =E6=96=BC 2020=E5=B9=B44=E6=9C=88=
23=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=881:27=E5=AF=AB=E9=81=93=EF=
=BC=9A

> On 4/22/2020 9:19 AM, Matt Spinler wrote:
> >>>
> >>> 4. If not already supported (was unsure), be able to find an
> >>>    _input file based on a value it has in the corresponding _label
> file.
> >>
> >> PSU sensor does this, hwmontemp does it by index.
> >
> > Would you be OK with us also adding this to PSUSensor?
>
> PSUSensor already does this? Do you mean hwmontemp sensor? I'd be fine
> with converting the index scheme to a label scheme.
>
>

--00000000000074188405ab6b243e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jame:<div>=C2=A0 =C2=A0 I am investigating and porting =
psusensor to my platform. I have a question item 5.</div><div><span style=
=3D"color:rgb(80,0,80)">&gt;&gt; 5. We have a case where a driver isn&#39;t=
 loaded with power off, so somehow</span><br style=3D"color:rgb(80,0,80)"><=
span style=3D"color:rgb(80,0,80)">&gt;&gt; =C2=A0=C2=A0 we still need the s=
ensors to stay on D-Bus when off (and show them</span><br style=3D"color:rg=
b(80,0,80)"><span style=3D"color:rgb(80,0,80)">&gt;&gt; =C2=A0=C2=A0 as not=
 available).</span><br style=3D"color:rgb(80,0,80)"><span style=3D"color:rg=
b(80,0,80)">&gt;</span><br style=3D"color:rgb(80,0,80)"><span style=3D"colo=
r:rgb(80,0,80)">&gt; All sensors are on d-bus all the time, its based on th=
e EM config.</span>=C2=A0</div><div><br></div><div>I create 2 psu config, p=
su1 and psu2, in entityManager and booting my system with 1 psu. There is o=
nly psu1 sensor object created in psusensor service.</div><div>After insert=
ing psu2 and the driver binding hwmon for psu2, psusensor service don&#39;t=
 create psu2 sensor object.<br></div><div>Does it work as design? or I need=
 update dbus-sensor?</div><div>My dbus-sensor revision is &quot;c140e2008b0=
38b5fbf07aca0795b8030224eddd4&quot;.</div><div><br></div><div>Tyler</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Ja=
mes Feist &lt;<a href=3D"mailto:james.feist@linux.intel.com">james.feist@li=
nux.intel.com</a>&gt; =E6=96=BC 2020=E5=B9=B44=E6=9C=8823=E6=97=A5 =E9=80=
=B1=E5=9B=9B =E4=B8=8A=E5=8D=881:27=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On 4/22/2020 9:19 AM, Matt S=
pinler wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 4. If not already supported (was unsure), be able to find an<b=
r>
&gt;&gt;&gt; =C2=A0=C2=A0 _input file based on a value it has in the corres=
ponding _label file.<br>
&gt;&gt;<br>
&gt;&gt; PSU sensor does this, hwmontemp does it by index.<br>
&gt; <br>
&gt; Would you be OK with us also adding this to PSUSensor?<br>
<br>
PSUSensor already does this? Do you mean hwmontemp sensor? I&#39;d be fine =
<br>
with converting the index scheme to a label scheme.<br>
<br>
</blockquote></div>

--00000000000074188405ab6b243e--
