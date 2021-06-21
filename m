Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7711D3AE8F5
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 14:20:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7pXQ1gLZz307P
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 22:20:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=iXQM/3UK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::335;
 helo=mail-wm1-x335.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=iXQM/3UK; dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7pX53KC4z2yY7
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 22:20:37 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id
 h21-20020a1ccc150000b02901d4d33c5ca0so8523008wmb.3
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 05:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wcQpQsf4qbO2g01WupSPBoNYIKv1bnk7ZZX0AcCYtzk=;
 b=iXQM/3UKiZWX5QBhVaxLTHxmmwXbIltkEORQ4+U9/USJcJC9mNYU6aOn+TVfcCawm8
 4VKZkWkV9FnKzspo6bdPyKXudJhzdzrJdO5Spv67y7zPRtzrHq+GasNggxhhMTqLZpab
 BZ7pU1V8P7rDLqDxXOcG/ldWfj2E8kqyf+dXfm7OO9RiQ90JSQ5edEp12ym2JIXQUBcI
 7mRvj3iRgd+7PZqtiO50hUICa+NYr9CTWsi86fMxRXH1G5U6xetuQNc3nkmL8h+OpkK2
 n0zZwex6mUJxOvhm9blSu9HoUyMahWJ/vWpdBxNdzQv0mhtJprC8i9eH3srJGwVCJ84n
 e3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wcQpQsf4qbO2g01WupSPBoNYIKv1bnk7ZZX0AcCYtzk=;
 b=ErnQsGRO7C27MiV+FuCr6OUauMhLOaPUgWN04JhZr94NkOa6I/JRzY9UVemcMoRwUP
 70fhhauOSDVR8TkiS8G3XcHoJsZKHZXiqaJ27a48or3ptB7YrIiqPDR43ZJoVi46IKg6
 DhheH0y9GJwKv2xhXcym1c8B+8I5JreMADgaoXboB93IxOdixKuShj+txbDFMzuF0Yg3
 A1mFFsCNeQ4OZyAHrzDe9jSiAxB/2xVjYAVyeiDSikM2FzrQToy7mcsV57mFk2GYt/cb
 4dmEyv3NOViIbwXcyA7DENotbirg6UMq4ULsEzR44N8iZkDnD1akHnNC9La5CW5v6pwf
 Be0w==
X-Gm-Message-State: AOAM533ImrYykzZxmNAbSi9KSO7MeJJcdF+Psk2gos203QnI/cBRgIm9
 o/sRV9Sv4d/X8UbOxp4utBs7f/9Jvxwjts4m/HdxhQ==
X-Google-Smtp-Source: ABdhPJwN51jAm+A1l+Zpn1OS9q/AVdc0AZveYK3PSk22B0L2zreNGH2l7Cc+NJFWDE2GLnjrJGoSmvzH9lGejZoQFvs=
X-Received: by 2002:a7b:c405:: with SMTP id k5mr27312667wmi.34.1624278032313; 
 Mon, 21 Jun 2021 05:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB29649E3C07F77FD2FA2B3223FD0A9@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <HK0PR04MB2964EBAACD7025A165BB68C1FD0A9@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CAM=TmwXsDhDFTCaHCwyAjnAJSggWjWLgeaCz9qN0BCwsDKRfWQ@mail.gmail.com>
In-Reply-To: <CAM=TmwXsDhDFTCaHCwyAjnAJSggWjWLgeaCz9qN0BCwsDKRfWQ@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 21 Jun 2021 05:20:18 -0700
Message-ID: <CAH2-KxD_+bQKD-obw=kHLRMjR547fqVyM0mFZttDOrT94Bv7HQ@mail.gmail.com>
Subject: Re: Adding dependent service as Entity-manager to Ipmb-fru-service
To: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000022799f05c545b371"
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
Cc: Kumar Thangavel <thangavel.k@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, "Velumani T-ERS, HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000022799f05c545b371
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 3:30 AM Deepak Kodihalli <
deepak.kodihalli.83@gmail.com> wrote:

> Hi Kumar,
>
> On Mon, Jun 21, 2021 at 3:02 PM Kumar Thangavel <thangavel.k@hcl.com>
> wrote:
> >
> > Classification: Public
> >
> > Changing classification as Public.
> >
> >
> >
> > From: Kumar Thangavel
> > Sent: Monday, June 21, 2021 2:58 PM
> > To: openbmc@lists.ozlabs.org
> > Cc: Ed Tanous <ed@tanous.net>; Patrick Williams <patrick@stwcx.xyz>;
> Velumani T-ERS,HCLTech <velumanit@hcl.com>
> > Subject: Adding dependent service as Entity-manager to Ipmb-fru-service
> >
> >
> >
> > Classification: Confidential
> >
> > Hi All,
> >
> >
> >
> >            Ipmb-fru-device deamon trying to read some dbus objects from
> entity-manager to get the ipmb bus details. Entity-manager daemon initial=
ly
> taking some time to load all the dbus objects. But Ipmb-fru-device deamon
> starts at system startup.
> >
> >
> >
> >            Since, Entity-manager deamon initially taking some time to
> load all the dbus objects, ipmb-fru-device getting the below error.
> >
> >
> >
> >           Error :
> >
> >           =E2=80=9Cipmb-fru-device[345]:   what():  sd_bus_call:
> org.freedesktop.DBus.Error.UnknownObject: Unknown object
> '/xyz/openbmc_project/inventory/system/board/Yosemite_V2_Baseboard/IpmbBu=
s1'.=E2=80=9D
> >
> >
> >
> >          When we restart EM deamon once, this error got resolved.
> >
> >
> >
> >          I tried to add EM service as dependent service to
> Ipmb-fru-device service. Added EM service in =E2=80=9CWants=E2=80=9D, =E2=
=80=9CAfter=E2=80=9D fields in
> Ipmb-fru-service service.
> >
> >
> >
> >          But, still EM deamon taking some time load all the dbus object=
s.
> >
> >
> >
> >          So, Could you please let us know to how to add the EM as
> dependent service. Or Please let us know if any other approach.
>
> Isn't this supposed to be the other way around? A FRU daemon reads
> EEPROMs (or other means) and hosts raw FRU information on D-Bus, and
> then EM can add known D-Bus interfaces based on that. Either way, you
> may not need a dependency if you go by standard D-Bus signals
> (InterfacesAdded/PropertiesChanged).
>

This is a different case for IPMB because the IPMB FRU daemon needs some
information about which devices support IPMB before it starts to check for
SDRs, as if the device doesn't support it, we could be writing bad data
into a device on accident.


>
> Regards,
> Deepak
>

--00000000000022799f05c545b371
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 21, 2021 at 3:30 AM Deepa=
k Kodihalli &lt;<a href=3D"mailto:deepak.kodihalli.83@gmail.com">deepak.kod=
ihalli.83@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Hi Kumar,<br>
<br>
On Mon, Jun 21, 2021 at 3:02 PM Kumar Thangavel &lt;<a href=3D"mailto:thang=
avel.k@hcl.com" target=3D"_blank">thangavel.k@hcl.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Classification: Public<br>
&gt;<br>
&gt; Changing classification as Public.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; From: Kumar Thangavel<br>
&gt; Sent: Monday, June 21, 2021 2:58 PM<br>
&gt; To: <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">open=
bmc@lists.ozlabs.org</a><br>
&gt; Cc: Ed Tanous &lt;<a href=3D"mailto:ed@tanous.net" target=3D"_blank">e=
d@tanous.net</a>&gt;; Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.=
xyz" target=3D"_blank">patrick@stwcx.xyz</a>&gt;; Velumani T-ERS,HCLTech &l=
t;<a href=3D"mailto:velumanit@hcl.com" target=3D"_blank">velumanit@hcl.com<=
/a>&gt;<br>
&gt; Subject: Adding dependent service as Entity-manager to Ipmb-fru-servic=
e<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Classification: Confidential<br>
&gt;<br>
&gt; Hi All,<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ipmb-fru-device deamon trying=
 to read some dbus objects from entity-manager to get the ipmb bus details.=
 Entity-manager daemon initially taking some time to load all the dbus obje=
cts. But Ipmb-fru-device deamon starts at system startup.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Since, Entity-manager deamon =
initially taking some time to load all the dbus objects, ipmb-fru-device ge=
tting the below error.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error :<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=80=9Cipmb-fru-device[345]:=
=C2=A0 =C2=A0what():=C2=A0 sd_bus_call: org.freedesktop.DBus.Error.UnknownO=
bject: Unknown object &#39;/xyz/openbmc_project/inventory/system/board/Yose=
mite_V2_Baseboard/IpmbBus1&#39;.=E2=80=9D<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 When we restart EM deamon once, this=
 error got resolved.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I tried to add EM service as depende=
nt service to Ipmb-fru-device service. Added EM service in =E2=80=9CWants=
=E2=80=9D, =E2=80=9CAfter=E2=80=9D fields in Ipmb-fru-service service.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 But, still EM deamon taking some tim=
e load all the dbus objects.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 So, Could you please let us know to =
how to add the EM as dependent service. Or Please let us know if any other =
approach.<br>
<br>
Isn&#39;t this supposed to be the other way around? A FRU daemon reads<br>
EEPROMs (or other means) and hosts raw FRU information on D-Bus, and<br>
then EM can add known D-Bus interfaces based on that. Either way, you<br>
may not need a dependency if you go by standard D-Bus signals<br>
(InterfacesAdded/PropertiesChanged).<br></blockquote><div><br></div><div>Th=
is is a different case for IPMB because the IPMB FRU daemon needs some info=
rmation about which devices support IPMB before it starts to check for SDRs=
, as if the device doesn&#39;t support it, we could be writing bad data int=
o a device on accident.</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
Regards,<br>
Deepak<br>
</blockquote></div></div>

--00000000000022799f05c545b371--
