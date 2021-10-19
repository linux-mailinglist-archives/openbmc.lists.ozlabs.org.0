Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E66B43385A
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 16:23:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYbZc0M3jz3bW9
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 01:23:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EhsQml/p;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535;
 helo=mail-ed1-x535.google.com; envelope-from=61a91bc@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EhsQml/p; dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYbZ82D8gz2yNW
 for <openbmc@lists.ozlabs.org>; Wed, 20 Oct 2021 01:23:10 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id y12so14512687eda.4
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 07:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iXscTqFl1e9kz60QeeaYv0QGZTLRBksFxT8xXoP7B9o=;
 b=EhsQml/p4+a+WZVQ1Tr5VX7zR/pRgN4VG0Iz6xzsCsFvwldueCEhlk4r1QrL/f8uct
 vvZhI9evh51KBYOlDl8L7J34wCvOZJMn+gYrMhf+/DO06ZYumaTGDaNxLal8OkZQA7q2
 zw2vgZ2Q+itadUN2mIfqaWnlnu7A4eeiBD0t3EFhff6awofdTnc64nG/0ADL7sp6s7iS
 cF4pL1jwd8YX5bclpfLYg2lpzNpCis4HdVcMbwboEtcQay2trenHcdgZR7N2lEqStAUz
 FK5uBv//jXOS6shRMZ3fA1Qnx8htafKjtf49gkq4qSh+/z7/McXlCRtztT35hNfB7/+N
 DZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iXscTqFl1e9kz60QeeaYv0QGZTLRBksFxT8xXoP7B9o=;
 b=V0c8IU4hsfFPHjy9Ncfb6bKYffOFosSSzubaCVmUWlHhDVwOdYTuBCL79hoB7K8+HE
 bNb60jSJ1GlFbyBjs5Fk6s/jpRz/fA2MnJa/2fU+eezxUVTMI51JUgjOaZIZcZaEMbKf
 oHSDn9JFIuNBgbqKtCJCLHG2GR+mrLPi+KhqdmTyNgg0KF0jKHnbVmYbujCuDJzpTKh7
 ZUGpQaq4OI+EekInaN7zkgM2bhv+tvCkij9Rdnc08FSrmksNCm/gS4yld68F7+fGvpxH
 3RB1fikHW+YYrSOoZrw3xhK60OSlDw01yGC2e2hd4o3aku2j/RPnDVCdzQc8JlwLLeik
 HJ5Q==
X-Gm-Message-State: AOAM530aApdwWkrq8iSMUN04VWvDO2QCBt9/MFuDMtrDOYbvzU7eCI0e
 BtwLW7ya3DhtVx6IEMmc8E++cJb8Hs8IBZmwEGJD4EFEiDI=
X-Google-Smtp-Source: ABdhPJwDgcGZ5WlbgfgY3o5NrsE+qkFNKAsi1QU/5KOjZhjDjKWwrSYHK+kTSVMFncoOfHb1lweZHj8yFk0QzAhhbQA=
X-Received: by 2002:a17:906:b184:: with SMTP id
 w4mr37181417ejy.418.1634653318884; 
 Tue, 19 Oct 2021 07:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAMqwjCA0HFE4O9YHMAG4pxciCGLY5cLPJVdrDiKJMjTtQqrrEA@mail.gmail.com>
 <f06c4b91d9459061e380f860acd89802ab495524.camel@intel.com>
 <CAMqwjCBWB4LT8ZYO6gSY2azR_VoGoFqPj9rrLrR+yK20k7NMKw@mail.gmail.com>
 <CAMqwjCB7GaoNy4eSzrBEOeKCO1zj9fJ1=rZh3j3=AvgXhThfVQ@mail.gmail.com>
 <4f41bc7f0f320a9114d3576c814e99ae8a3015fa.camel@intel.com>
In-Reply-To: <4f41bc7f0f320a9114d3576c814e99ae8a3015fa.camel@intel.com>
From: Alexander Raih <61a91bc@gmail.com>
Date: Tue, 19 Oct 2021 17:23:05 +0300
Message-ID: <CAMqwjCC-=z3ZyVDWcJRsvkMUBGo9QvvrpD=gcpwHGQgDuXKJxA@mail.gmail.com>
Subject: Re: kenel module dont enable
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Content-Type: multipart/alternative; boundary="0000000000006730a005ceb562c3"
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

--0000000000006730a005ceb562c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Power state is S0 state.
I have intel platform with 2 sockets.
1 socket: intel xeon bronze
2 socket: empty
Chipset: lewisburg

=D0=B2=D1=82, 19 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 17:05, Winiarska, =
Iwona <iwona.winiarska@intel.com>:

> On Tue, 2021-10-19 at 12:10 +0300, Alexander Raih wrote:
> > Hi,
> > I try to register peci device in sysfs but I have same problem
> >
> > [  800.339605] peci peci-0: Failed to register peci client peci-client
> at 0x30
> > (-5)
>
> Were you able to confirm that your platform is in S0 power state before y=
ou
> tried this?
>
> Could you share details about Intel Platform/CPU that you're using?
>
> -Iwona
>
> >
> >
> >
> >
> >
> > =D0=B2=D1=82, 19 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 10:44, Alexand=
er Raih <61a91bc@gmail.com>:
> > > Thanks, Iwona
> > > I will try this.
> > >
> > > Best regards,
> > > Alex
> > >
> > > =D0=BF=D0=BD, 18 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 17:43, Winia=
rska, Iwona <
> iwona.winiarska@intel.com>:
> > > > Hi Alex,
> > > >
> > > > (in the future, please Cc: openbmc mailing list)
> > > >
> > > > This may occur when CPU can=E2=80=99t be detected - is your platfor=
m in S0
> power
> > > > state?
> > > > BMC usually is booted before the platform goes to S0, so I would
> recommend
> > > > registering peci-client manually (using sysfs) rather than using DT=
S.
> > > >
> > > > # echo peci-client 0x30 > /sys/bus/peci/devices/peci-0/new_device
> > > >
> > > > Or if you=E2=80=99re using dbus-sensors, peci-client devices are ex=
ported
> there:
> > > >
> https://github.com/openbmc/dbus-sensors/blob/master/src/CPUSensorMain.cpp=
#L406
> > > >
> > > > --
> > > > Note that PECI subsystem you=E2=80=99re using is subject to change =
in the
> future:
> > > >
> https://lore.kernel.org/lkml/20210803113134.2262882-1-iwona.winiarska@int=
el.com/
> > > >
> > > > -Iwona
> > > >
> > > > From: Alexander Raih <61a91bc@gmail.com>
> > > > Sent: Friday, October 15, 2021 1:46 PM
> > > > To: Yoo, Jae Hyun <jae.hyun.yoo@intel.com>; Winiarska, Iwona
> > > > <iwona.winiarska@intel.com>
> > > > Subject: kenel module dont enable
> > > >
> > > > Hello,
> > > > I use intel kernel module peci. In dtb I have this describe about
> peci:
> > > >
> > > >
> > > > bus@1e78b000 {
> > > > compatible =3D "simple-bus";
> > > > #address-cells =3D <0x01>;
> > > > #size-cells =3D <0x01>;
> > > > ranges =3D <0x00 0x1e78b000 0x60>;
> > > > peci-bus@0 {
> > > > compatible =3D "aspeed,ast2500-peci";
> > > > reg =3D <0x00 0x60>;
> > > > #address-cells =3D <0x01>;
> > > > #size-cells =3D <0x00>;
> > > > interrupts =3D <0x0f>;
> > > > clocks =3D <0x02 0x06>;
> > > > resets =3D <0x02 0x06>;
> > > > clock-frequency =3D <0x16e3600>;
> > > > msg-timing =3D <0x01>;
> > > > addr-timing =3D <0x01>;
> > > > rd-sampling-point =3D <0x08>;
> > > > cmd-timeout-ms =3D <0x3e8>;
> > > > status =3D "okay";
> > > >
> > > > peci-client@30 {
> > > > compatible =3D "intel,peci-client";
> > > > reg =3D <0x30>;
> > > > };
> > > >
> > > > peci-client@31 {
> > > > compatible =3D "intel,peci-client";
> > > > reg =3D <0x31>;
> > > > };
> > > > };
> > > > };
> > > >
> > > >
> > > > I have this error in dmesg:
> > > > [    2.516383] peci peci-0: Failed to register peci client  at 0x30
> (-5)
> > > > [    2.526767] peci peci-0: Failed to create PECI device for
> > > > /ahb/apb/bus@1e78b000/peci-bus@0/peci-client@30
> > > >
> > > > How I can resolve this ?
> > > >
> > > > best regards,
> > > > alex
>
>

--0000000000006730a005ceb562c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Power state is S0 state.<div>I have intel platform with 2 =
sockets.=C2=A0<br></div><div>1 socket: intel xeon bronze</div><div>2 socket=
: empty</div><div>Chipset: lewisburg</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=82, 19 =D0=BE=D0=BA=D1=
=82. 2021 =D0=B3. =D0=B2 17:05, Winiarska, Iwona &lt;<a href=3D"mailto:iwon=
a.winiarska@intel.com">iwona.winiarska@intel.com</a>&gt;:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Tue, 2021-10-19 at 12:10 +0300=
, Alexander Raih wrote:<br>
&gt; Hi,<br>
&gt; I try to register peci device in sysfs but I have same=C2=A0problem<br=
>
&gt; <br>
&gt; [ =C2=A0800.339605] peci peci-0: Failed to register peci client peci-c=
lient at 0x30<br>
&gt; (-5)<br>
<br>
Were you able to confirm that your platform is in S0 power state before you=
<br>
tried this?<br>
<br>
Could you share details about Intel Platform/CPU that you&#39;re using?<br>
<br>
-Iwona<br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; =D0=B2=D1=82, 19 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 10:44, Alexan=
der Raih &lt;<a href=3D"mailto:61a91bc@gmail.com" target=3D"_blank">61a91bc=
@gmail.com</a>&gt;:<br>
&gt; &gt; Thanks, Iwona<br>
&gt; &gt; I will try this.<br>
&gt; &gt; <br>
&gt; &gt; Best regards,<br>
&gt; &gt; Alex<br>
&gt; &gt; <br>
&gt; &gt; =D0=BF=D0=BD, 18 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 17:43, W=
iniarska, Iwona &lt;<a href=3D"mailto:iwona.winiarska@intel.com" target=3D"=
_blank">iwona.winiarska@intel.com</a>&gt;:<br>
&gt; &gt; &gt; Hi Alex,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; (in the future, please Cc: openbmc mailing list)<br>
&gt; &gt; &gt; =C2=A0=C2=A0<br>
&gt; &gt; &gt; This may occur when CPU can=E2=80=99t be detected - is your =
platform in S0 power<br>
&gt; &gt; &gt; state?<br>
&gt; &gt; &gt; BMC usually is booted before the platform goes to S0, so I w=
ould recommend<br>
&gt; &gt; &gt; registering peci-client manually (using sysfs) rather than u=
sing DTS.<br>
&gt; &gt; &gt; =C2=A0<br>
&gt; &gt; &gt; # echo peci-client 0x30 &gt; /sys/bus/peci/devices/peci-0/ne=
w_device<br>
&gt; &gt; &gt; =C2=A0<br>
&gt; &gt; &gt; Or if you=E2=80=99re using dbus-sensors, peci-client devices=
 are exported there:<br>
&gt; &gt; &gt; <a href=3D"https://github.com/openbmc/dbus-sensors/blob/mast=
er/src/CPUSensorMain.cpp#L406" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/openbmc/dbus-sensors/blob/master/src/CPUSensorMain.cpp#L406</a>=
<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; Note that PECI subsystem you=E2=80=99re using is subject to =
change in the future:<br>
&gt; &gt; &gt; <a href=3D"https://lore.kernel.org/lkml/20210803113134.22628=
82-1-iwona.winiarska@intel.com/" rel=3D"noreferrer" target=3D"_blank">https=
://lore.kernel.org/lkml/20210803113134.2262882-1-iwona.winiarska@intel.com/=
</a><br>
&gt; &gt; &gt; =C2=A0<br>
&gt; &gt; &gt; -Iwona<br>
&gt; &gt; &gt; =C2=A0<br>
&gt; &gt; &gt; From: Alexander Raih &lt;<a href=3D"mailto:61a91bc@gmail.com=
" target=3D"_blank">61a91bc@gmail.com</a>&gt; <br>
&gt; &gt; &gt; Sent: Friday, October 15, 2021 1:46 PM<br>
&gt; &gt; &gt; To: Yoo, Jae Hyun &lt;<a href=3D"mailto:jae.hyun.yoo@intel.c=
om" target=3D"_blank">jae.hyun.yoo@intel.com</a>&gt;; Winiarska, Iwona<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:iwona.winiarska@intel.com" target=3D"_=
blank">iwona.winiarska@intel.com</a>&gt;<br>
&gt; &gt; &gt; Subject: kenel module dont enable<br>
&gt; &gt; &gt; =C2=A0<br>
&gt; &gt; &gt; Hello,<br>
&gt; &gt; &gt; I use intel kernel module peci. In dtb I have this describe =
about peci:=C2=A0<br>
&gt; &gt; &gt; =C2=A0<br>
&gt; &gt; &gt; =C2=A0<br>
&gt; &gt; &gt; bus@1e78b000 {<br>
&gt; &gt; &gt; compatible =3D &quot;simple-bus&quot;;<br>
&gt; &gt; &gt; #address-cells =3D &lt;0x01&gt;;<br>
&gt; &gt; &gt; #size-cells =3D &lt;0x01&gt;;<br>
&gt; &gt; &gt; ranges =3D &lt;0x00 0x1e78b000 0x60&gt;;<br>
&gt; &gt; &gt; peci-bus@0 {<br>
&gt; &gt; &gt; compatible =3D &quot;aspeed,ast2500-peci&quot;;<br>
&gt; &gt; &gt; reg =3D &lt;0x00 0x60&gt;;<br>
&gt; &gt; &gt; #address-cells =3D &lt;0x01&gt;;<br>
&gt; &gt; &gt; #size-cells =3D &lt;0x00&gt;;<br>
&gt; &gt; &gt; interrupts =3D &lt;0x0f&gt;;<br>
&gt; &gt; &gt; clocks =3D &lt;0x02 0x06&gt;;<br>
&gt; &gt; &gt; resets =3D &lt;0x02 0x06&gt;;<br>
&gt; &gt; &gt; clock-frequency =3D &lt;0x16e3600&gt;;<br>
&gt; &gt; &gt; msg-timing =3D &lt;0x01&gt;;<br>
&gt; &gt; &gt; addr-timing =3D &lt;0x01&gt;;<br>
&gt; &gt; &gt; rd-sampling-point =3D &lt;0x08&gt;;<br>
&gt; &gt; &gt; cmd-timeout-ms =3D &lt;0x3e8&gt;;<br>
&gt; &gt; &gt; status =3D &quot;okay&quot;;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; peci-client@30 {<br>
&gt; &gt; &gt; compatible =3D &quot;intel,peci-client&quot;;<br>
&gt; &gt; &gt; reg =3D &lt;0x30&gt;;<br>
&gt; &gt; &gt; };<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; peci-client@31 {<br>
&gt; &gt; &gt; compatible =3D &quot;intel,peci-client&quot;;<br>
&gt; &gt; &gt; reg =3D &lt;0x31&gt;;<br>
&gt; &gt; &gt; };<br>
&gt; &gt; &gt; };<br>
&gt; &gt; &gt; };<br>
&gt; &gt; &gt; =C2=A0<br>
&gt; &gt; &gt; =C2=A0<br>
&gt; &gt; &gt; I have this error in dmesg:<br>
&gt; &gt; &gt; [ =C2=A0 =C2=A02.516383] peci peci-0: Failed to register pec=
i client =C2=A0at 0x30 (-5)<br>
&gt; &gt; &gt; [ =C2=A0 =C2=A02.526767] peci peci-0: Failed to create PECI =
device for<br>
&gt; &gt; &gt; /ahb/apb/bus@1e78b000/peci-bus@0/peci-client@30<br>
&gt; &gt; &gt; =C2=A0<br>
&gt; &gt; &gt; How I can resolve this ?<br>
&gt; &gt; &gt; =C2=A0<br>
&gt; &gt; &gt; best regards,<br>
&gt; &gt; &gt; alex<br>
<br>
</blockquote></div>

--0000000000006730a005ceb562c3--
