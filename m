Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1229148BCDC
	for <lists+openbmc@lfdr.de>; Wed, 12 Jan 2022 03:05:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYW9d6snTz2ypY
	for <lists+openbmc@lfdr.de>; Wed, 12 Jan 2022 13:05:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20210112.gappssmtp.com header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=rQpbD9nL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20210112.gappssmtp.com
 header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=rQpbD9nL; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYW9D0rz0z2xsG
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jan 2022 13:05:01 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id br17so2993791lfb.6
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 18:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FkQ137eaUWa9xtZ2+Jy8YfaIvF3yVTqNyQ8urNakj/0=;
 b=rQpbD9nL3ncYgO89MYhgZTQ6NbJeVqQ9FJwFysXiKh/IJ8JzzFlm0WTPPMDRDkz1vH
 utQC8PuCPHsoxIT/wLxfHCOzxTuqpeV7EGcjJofBuiEamGxA6NaT2fmUAUs7Efsmx5ek
 NbhkGMxIvybhSjpWwA/eCkfRHuCQd9Ec9Cqe2S4kAcgleMlU0g8iJXhBBjYvCh6ceKRU
 ig9Vf0KcpxYASxX+KZOJ4dWJEDZF+Y79MKTADtKxTrI4fOi8UpqVqept7AWL8kPbv75I
 8k24c/utWdF4xIfc9khoipIk9XWQXIPfjq1RJdine86PWfHtW+YgLiBvH8kay8w9pOAa
 u+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FkQ137eaUWa9xtZ2+Jy8YfaIvF3yVTqNyQ8urNakj/0=;
 b=xMvTt5ulwfy/4X2shEmx3NE4lxAsw46/nYbnnhzeztLWSiCynQbtwt8jJDy70wiX+t
 +dR8PF+ko4IkYULySNHZMrGu0oonYXkt0lQsm7zYEniiBqqjMcTgzbkQOzG4VAGu+xeg
 Nz5GfiQ92d3n1ATlBADxtJYfr7Uu4ylgl7ZGT2ELXx4AFOWE3uUcDU4Y72EiGZvyiZZg
 TyPCtWLGFSzzeYCd/e9/+RLLavuWVfN063FAM1mhanrtbxa29XiVUNqEuQU/eAdgLNzX
 oTcnvfeubGopglAFHg+IUUHe4Hj/Jk0+qpOtEvvJgdk7+4Mh8Pryd9KCQbPzcEuGOwML
 5YBw==
X-Gm-Message-State: AOAM5309CS+zQUN1NWZgViyH+e/oES3QsBu4jiT/QrlX1S9nF5YNV3Uh
 kuV1lHOpjzawBJOxu1fTKhR+SQVEB9gFNMsiA2CerQ==
X-Google-Smtp-Source: ABdhPJx07IBDCOYakxdk/2klEdFYwCBs5LMIwcjy5gQlkSDIXdkbu1UHo936Blo0Uy54Zlx6CEWrUbGHAzWvkffV9io=
X-Received: by 2002:a2e:3514:: with SMTP id z20mr2719436ljz.56.1641953095068; 
 Tue, 11 Jan 2022 18:04:55 -0800 (PST)
MIME-Version: 1.0
References: <CAH2-KxBPXa6woa-9cFQ_Bn1Oqk3OYFKLPf2jpRU0mgRm443S1A@mail.gmail.com>
 <725B4491-C6A5-4B90-BE1A-B9EA6BE277AA@gmail.com>
In-Reply-To: <725B4491-C6A5-4B90-BE1A-B9EA6BE277AA@gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 11 Jan 2022 18:04:44 -0800
Message-ID: <CACWQX82gK7O-qNrFJxi3q70ejdXJLULCPxBi=8+jtZvZNj8t8w@mail.gmail.com>
Subject: Re: Query Sensor
To: Mike Jones <proclivis@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f84e7505d558fe01"
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
Cc: Ed Tanous <edtanous@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000f84e7505d558fe01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 11, 2022 at 9:53 AM Mike Jones <proclivis@gmail.com> wrote:

> Ed,
>
> So to be sure I understand, dbus-sensors implements the dbus services for
> each sensor type, and the requests I made were serviced by one of these.


Correct.


>
> The interface is defined by yaml files in phosphor-dbus-interfaces.


Yep.


>
> phosphor-dbus- interfaces generates c++ base classes, and dbus-sensors
> probably have c++ classes inheriting from them.



For various technical and social reasons which I=E2=80=99ve detailed in mai=
l to
this list in the past, dbus-sensors doesn=E2=80=99t depend directly on
phosphor-dbus-interfaces, nor rely on the generated code. It instead
generates code from c++ template expansion in sdbusplus.


>
> These interfaces are not Redfish interfaces.


Correct.


>
> When WebUI fetches sensor values, is it using these interfaces, or is
> there another Redfish layer involved that translates the query? Or perhap=
s
> Redfish only matters for things like a PSU?



Depends on which webui you=E2=80=99re talking about, there are two.

Phosphor-webui (ie the =E2=80=9Cold=E2=80=9D one) goes directly to dbus thr=
ough the
rest-dbus abstraction in bmcweb.  This was very good for initial
prototyping (aside from a port to c++, the code largely hasn=E2=80=99t chan=
ged
since it was written) but not great at keeping a consistent or standardized
API.

Webui-vue (ie, the new one) relies on Redfish directly, which in-effect
makes a very nice Redfish gui, and minimizes the chance that the dbus
interfaces are correct, but redfish is broken.  It also keeps us standard
compliant, so in theory webui-vue could be used on another non-openbmc
project in the future.

Ed


>
> Mike
>
>
> Sent from my iPad
>
> > On Jan 11, 2022, at 10:22 AM, Ed Tanous <edtanous@google.com> wrote:
> >
> > =EF=BB=BFOn Tue, Jan 11, 2022 at 9:17 AM Mike Jones <proclivis@gmail.co=
m> wrote:
> >>
> >> =EF=BB=BFThis is how to do it:
> >>
> >> dbus-send --system --print-reply \
> >>
> >>
> --dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a187a66b=
71eb7a1f29187594c05bb8fd9a.Hwmon1
> \
> >>
> >> /xyz/openbmc_project/sensors/temperature/lm75temp \
> >>
> >> org.freedesktop.DBus.Properties.Get
> string:xyz.openbmc_project.Sensor.Value string:Value \
> >>
> >> double:
> >>
> >>
> >> It is not clear to me why the second parameter string:Value
> >>
> >>
> >> I guessed on that and it works. Perhaps xyz=E2=80=A6Sensor.Value is th=
e
> Property name, and properties have values, so the second parameter says g=
et
> the Value of a property whose name ends in .Value.\
> >
> > For better or worse, the term "Value" is overloaded in both the
> > interface name, yz.openbmc_project.Sensor.Value, and the property name
> > within the interface, Value.  That's why you see it twice in this
> > case.  They are distinct things within the request that just happen to
> > share a name.  Docs for the interface and property are here:
> >
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/e0674c894ed36a2e=
8cf96207907a531d2f514054/yaml/xyz/openbmc_project/Sensor/Value.interface.ya=
ml#L24
> >
> > Happy to see you figured it out.
> >
> >>
> >>
> >> To test that, I tried string:MaxValue, and that works.
> >>
> >>
> >> I confirmed with this:
> >>
> >>
> >> busctl introspect
> xyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a187a66b71eb7a1f2=
9187594c05bb8fd9a.Hwmon1
> /xyz/openbmc_project/sensors/temperature/lm75temp
> >>
> >>
> >> A very useful command.
> >>
> >>
> >> Also useful:
> >>
> >>
> >> dbus-send --system --print-reply \
> >>
> >> --dest=3Dxyz.openbmc_project.ObjectMapper /\
> >>
> >> xyz/openbmc_project/object_mapper \
> >>
> >> xyz.openbmc_project.ObjectMapper.GetSubTree \
> >>
> >> string:"/" int32:0 array:string:"xyz.openbmc_project.Sensor.Value"
> >>
> >>
> >>
> >> Mike
> >>
> >>
> >> Sent from my iPad
> >>
> >> On Jan 10, 2022, at 4:50 PM, Ed Tanous <edtanous@google.com> wrote:
> >>
> >> =EF=BB=BFOn Mon, Jan 10, 2022 at 3:47 PM Mike Jones <proclivis@gmail.c=
om>
> wrote:
> >>
> >>
> >> Hi,
> >>
> >>
> >> I could not find an example of a sensor query in the docs. I assume
> something like this:
> >>
> >>
> >> dbus-send --system --print-reply \
> >>
> >>
> >>
> --dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a187a66b=
71eb7a1f29187594c05bb8fd9a.Hwmon1
> \
> >>
> >>
> >> /xyz/openbmc_project/sensors/temperature/lm75temp
> >>
> >>
> >> xyz.openbmc_project.Sensor.Property.Get
> xyz.openbmc_project.Sensor.Value \
> >>
> >>
> >> double:
> >>
> >>
> >>
> >> I don't have an example offhand, but the interface you're looking for
> >> in the bolded area is
> >> org.freedesktop.DBus.Properties.Get
> >>
> >> Stack overflow for essentially the same question with an example:
> >>
> https://stackoverflow.com/questions/48648952/set-get-property-using-dbus-=
send
> >>
> >>
> >> With the bold interface replaced with something correct.
> >>
> >>
> >> Can some one give me an example, and a url about how to query
> properties?
> >>
> >>
> >> Mike
> >>
> >>
> >> Sent from my iPad
>
--=20
-Ed

--000000000000f84e7505d558fe01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jan 11, 2022 at 9:53 AM Mike Jones &lt;<a href=3D"m=
ailto:proclivis@gmail.com">proclivis@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(2=
04,204,204)">Ed,<br>
<br>
So to be sure I understand, dbus-sensors implements the dbus services for e=
ach sensor type, and the requests I made were serviced by one of these.</bl=
ockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Correct.</div><div d=
ir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1=
ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
The interface is defined by yaml files in phosphor-dbus-interfaces.</blockq=
uote><div dir=3D"auto"><br></div><div dir=3D"auto">Yep.</div><div dir=3D"au=
to"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;borde=
r-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
phosphor-dbus- interfaces generates c++ base classes, and dbus-sensors prob=
ably have c++ classes inheriting from them.</blockquote><div dir=3D"auto"><=
br></div><div dir=3D"auto"><br></div><div dir=3D"auto">For various technica=
l and social reasons which I=E2=80=99ve detailed in mail to this list in th=
e past, dbus-sensors doesn=E2=80=99t depend directly on phosphor-dbus-inter=
faces, nor rely on the generated code. It instead generates code from c++ t=
emplate expansion in sdbusplus.</div><div dir=3D"auto"><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204=
,204)" dir=3D"auto"><br>
<br>
These interfaces are not Redfish interfaces.</blockquote><div dir=3D"auto">=
<br></div><div dir=3D"auto">Correct.</div><div dir=3D"auto"><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(20=
4,204,204)" dir=3D"auto"><br>
<br>
When WebUI fetches sensor values, is it using these interfaces, or is there=
 another Redfish layer involved that translates the query? Or perhaps Redfi=
sh only matters for things like a PSU?</blockquote><div dir=3D"auto"><br></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Depends on which webui yo=
u=E2=80=99re talking about, there are two.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Phosphor-webui (ie the =E2=80=9Cold=E2=80=9D one) goes d=
irectly to dbus through the rest-dbus abstraction in bmcweb.=C2=A0 This was=
 very good for initial prototyping (aside from a port to c++, the code larg=
ely hasn=E2=80=99t changed since it was written) but not great at keeping a=
 consistent or standardized API.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Webui-vue (ie, the new one) relies on Redfish directly, which in-=
effect makes a very nice Redfish gui, and minimizes the chance that the dbu=
s interfaces are correct, but redfish is broken.=C2=A0 It also keeps us sta=
ndard compliant, so in theory webui-vue could be used on another non-openbm=
c project in the future.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Ed</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Mike<br>
<br>
<br>
Sent from my iPad<br>
<br>
&gt; On Jan 11, 2022, at 10:22 AM, Ed Tanous &lt;<a href=3D"mailto:edtanous=
@google.com" target=3D"_blank">edtanous@google.com</a>&gt; wrote:<br>
&gt; <br>
&gt; =EF=BB=BFOn Tue, Jan 11, 2022 at 9:17 AM Mike Jones &lt;<a href=3D"mai=
lto:proclivis@gmail.com" target=3D"_blank">proclivis@gmail.com</a>&gt; wrot=
e:<br>
&gt;&gt; <br>
&gt;&gt; =EF=BB=BFThis is how to do it:<br>
&gt;&gt; <br>
&gt;&gt; dbus-send --system --print-reply \<br>
&gt;&gt; <br>
&gt;&gt; --dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a=
187a66b71eb7a1f29187594c05bb8fd9a.Hwmon1 \<br>
&gt;&gt; <br>
&gt;&gt; /xyz/openbmc_project/sensors/temperature/lm75temp \<br>
&gt;&gt; <br>
&gt;&gt; org.freedesktop.DBus.Properties.Get string:xyz.openbmc_project.Sen=
sor.Value string:Value \<br>
&gt;&gt; <br>
&gt;&gt; double:<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; It is not clear to me why the second parameter string:Value<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; I guessed on that and it works. Perhaps xyz=E2=80=A6Sensor.Value i=
s the Property name, and properties have values, so the second parameter sa=
ys get the Value of a property whose name ends in .Value.\<br>
&gt; <br>
&gt; For better or worse, the term &quot;Value&quot; is overloaded in both =
the<br>
&gt; interface name, yz.openbmc_project.Sensor.Value, and the property name=
<br>
&gt; within the interface, Value.=C2=A0 That&#39;s why you see it twice in =
this<br>
&gt; case.=C2=A0 They are distinct things within the request that just happ=
en to<br>
&gt; share a name.=C2=A0 Docs for the interface and property are here:<br>
&gt; <a href=3D"https://github.com/openbmc/phosphor-dbus-interfaces/blob/e0=
674c894ed36a2e8cf96207907a531d2f514054/yaml/xyz/openbmc_project/Sensor/Valu=
e.interface.yaml#L24" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/openbmc/phosphor-dbus-interfaces/blob/e0674c894ed36a2e8cf96207907a531d2f=
514054/yaml/xyz/openbmc_project/Sensor/Value.interface.yaml#L24</a><br>
&gt; <br>
&gt; Happy to see you figured it out.<br>
&gt; <br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; To test that, I tried string:MaxValue, and that works.<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; I confirmed with this:<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; busctl introspect xyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da9=
05907088a187a66b71eb7a1f29187594c05bb8fd9a.Hwmon1 /xyz/openbmc_project/sens=
ors/temperature/lm75temp<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; A very useful command.<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; Also useful:<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; dbus-send --system --print-reply \<br>
&gt;&gt; <br>
&gt;&gt; --dest=3Dxyz.openbmc_project.ObjectMapper /\<br>
&gt;&gt; <br>
&gt;&gt; xyz/openbmc_project/object_mapper \<br>
&gt;&gt; <br>
&gt;&gt; xyz.openbmc_project.ObjectMapper.GetSubTree \<br>
&gt;&gt; <br>
&gt;&gt; string:&quot;/&quot; int32:0 array:string:&quot;xyz.openbmc_projec=
t.Sensor.Value&quot;<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; Mike<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; Sent from my iPad<br>
&gt;&gt; <br>
&gt;&gt; On Jan 10, 2022, at 4:50 PM, Ed Tanous &lt;<a href=3D"mailto:edtan=
ous@google.com" target=3D"_blank">edtanous@google.com</a>&gt; wrote:<br>
&gt;&gt; <br>
&gt;&gt; =EF=BB=BFOn Mon, Jan 10, 2022 at 3:47 PM Mike Jones &lt;<a href=3D=
"mailto:proclivis@gmail.com" target=3D"_blank">proclivis@gmail.com</a>&gt; =
wrote:<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; Hi,<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; I could not find an example of a sensor query in the docs. I assum=
e something like this:<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; dbus-send --system --print-reply \<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; --dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a=
187a66b71eb7a1f29187594c05bb8fd9a.Hwmon1 \<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; /xyz/openbmc_project/sensors/temperature/lm75temp<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; xyz.openbmc_project.Sensor.Property.Get xyz.openbmc_project.Sensor=
.Value \<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; double:<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; I don&#39;t have an example offhand, but the interface you&#39;re =
looking for<br>
&gt;&gt; in the bolded area is<br>
&gt;&gt; org.freedesktop.DBus.Properties.Get<br>
&gt;&gt; <br>
&gt;&gt; Stack overflow for essentially the same question with an example:<=
br>
&gt;&gt; <a href=3D"https://stackoverflow.com/questions/48648952/set-get-pr=
operty-using-dbus-send" rel=3D"noreferrer" target=3D"_blank">https://stacko=
verflow.com/questions/48648952/set-get-property-using-dbus-send</a><br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; With the bold interface replaced with something correct.<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; Can some one give me an example, and a url about how to query prop=
erties?<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; Mike<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; Sent from my iPad<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr">-Ed</div></div>

--000000000000f84e7505d558fe01--
