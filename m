Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B33548DF72
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 22:16:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZcgP2XnFz2yLT
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 08:16:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oYygOdV6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232;
 helo=mail-oi1-x232.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=oYygOdV6; dkim-atps=neutral
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZcfx1zCfz2xCp
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jan 2022 08:16:06 +1100 (AEDT)
Received: by mail-oi1-x232.google.com with SMTP id s22so9572328oie.10
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jan 2022 13:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=EP+7AoPO88rXwuvITKT40bqiFgsH6imcR7tL6S+jX24=;
 b=oYygOdV6Vj0a7lB1jxkpwUtDnDcv574YGNJu9qLnGmMvBc+kkx+5ygc4ebvHWhvddV
 yGsV5rGNnDYks8CIlfYUWAuw3EJfsP2QFC75tAcU1z7rmvNFtANJnVa3+LI8c11B3eaz
 NY6chOh9UyhivcttxKyU5cW/2Q/yEHM0OYs8D0PhQkr/0vc7Z7LI01eQ8b+3BEtQ1RGv
 vSSdrNbGx1I1jisDsadcDkaUAcmkgVCeV5vWKXt1kZ7nC3aazF7MMPvtbu8SY2JJfOAN
 wo76nNfsrNJjxyArjSpIMzEVRLQFs8th1Mp6NlZ3zVw9ke7+J1CWPVsC4v4c0AkX1gUn
 zJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=EP+7AoPO88rXwuvITKT40bqiFgsH6imcR7tL6S+jX24=;
 b=F3t4+qtYTisX2deJDr8Vk9oB+Bk9+o1B6JfQUoITaPvE3i5bYNex+Gn9NUWOPVEFek
 /fca0OhYBPtvXHK8iaOwtTaDQqHr5JM0NNOvhDXYfCzSxcK6GKEw/UHyuYcsQqzjsPXr
 ZbQPmi/mJ+/hzGMBGE++FbStuhVteKcCUQT0xHShPWqw+vU7oH9yfO9c8Qkxz6HIqld/
 UF5w/+l8DhhB+Qv3hpyEmhEI3to8+BI5hH5KedXG8wU5gNd4Fmbz3m9qCHGCdR0ihXLs
 LRT7mXAYvCWXjo2LDbn1xcl9FhzNCbYudG/8CO8U/rrLMxNuus/ZPAfMsAM3f6OoRok+
 u7vQ==
X-Gm-Message-State: AOAM533H5o7I3VJBbchKxUgdleFnLYf9RQOf0clOv10yT3hPoAWSkZal
 xClVQ9D3GC+daEO36VjmMdPbgnJ4knc=
X-Google-Smtp-Source: ABdhPJzWJVS7/05XQG/eHM/FK4OhcOi85CCEOZF4F0hCHPnDAMJ19McLOr1zNZGPnP+HNh/Ohdz1Pw==
X-Received: by 2002:a05:6808:10d1:: with SMTP id
 s17mr10186229ois.26.1642108562528; 
 Thu, 13 Jan 2022 13:16:02 -0800 (PST)
Received: from smtpclient.apple ([2600:100e:b019:730a:d05d:cc64:4dca:3e7d])
 by smtp.gmail.com with ESMTPSA id e36sm661208oow.20.2022.01.13.13.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 13:16:02 -0800 (PST)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-B50A3575-60B4-4F20-A63B-24A214E469B2
Content-Transfer-Encoding: 7bit
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Query Sensor
Date: Thu, 13 Jan 2022 14:16:01 -0700
Message-Id: <AB057B30-4E65-4958-BDB9-0EDF4771C5B7@gmail.com>
References: <CACWQX82gK7O-qNrFJxi3q70ejdXJLULCPxBi=8+jtZvZNj8t8w@mail.gmail.com>
In-Reply-To: <CACWQX82gK7O-qNrFJxi3q70ejdXJLULCPxBi=8+jtZvZNj8t8w@mail.gmail.com>
To: Ed Tanous <ed@tanous.net>
X-Mailer: iPad Mail (19C56)
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


--Apple-Mail-B50A3575-60B4-4F20-A63B-24A214E469B2
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ed,

What translates the redfish query into a dbus query?

Mike

Sent from my iPad

> On Jan 11, 2022, at 7:04 PM, Ed Tanous <ed@tanous.net> wrote:
>=20
> =EF=BB=BF
>=20
>=20
>> On Tue, Jan 11, 2022 at 9:53 AM Mike Jones <proclivis@gmail.com> wrote:
>> Ed,
>>=20
>> So to be sure I understand, dbus-sensors implements the dbus services for=
 each sensor type, and the requests I made were serviced by one of these.
>=20
> Correct.
>=20
>>=20
>>=20
>> The interface is defined by yaml files in phosphor-dbus-interfaces.
>=20
> Yep.
>=20
>>=20
>>=20
>> phosphor-dbus- interfaces generates c++ base classes, and dbus-sensors pr=
obably have c++ classes inheriting from them.
>=20
>=20
> For various technical and social reasons which I=E2=80=99ve detailed in ma=
il to this list in the past, dbus-sensors doesn=E2=80=99t depend directly on=
 phosphor-dbus-interfaces, nor rely on the generated code. It instead genera=
tes code from c++ template expansion in sdbusplus.
>=20
>>=20
>>=20
>> These interfaces are not Redfish interfaces.
>=20
> Correct.
>=20
>>=20
>>=20
>> When WebUI fetches sensor values, is it using these interfaces, or is the=
re another Redfish layer involved that translates the query? Or perhaps Redf=
ish only matters for things like a PSU?
>=20
>=20
> Depends on which webui you=E2=80=99re talking about, there are two.
>=20
> Phosphor-webui (ie the =E2=80=9Cold=E2=80=9D one) goes directly to dbus th=
rough the rest-dbus abstraction in bmcweb.  This was very good for initial p=
rototyping (aside from a port to c++, the code largely hasn=E2=80=99t change=
d since it was written) but not great at keeping a consistent or standardize=
d API.
>=20
> Webui-vue (ie, the new one) relies on Redfish directly, which in-effect ma=
kes a very nice Redfish gui, and minimizes the chance that the dbus interfac=
es are correct, but redfish is broken.  It also keeps us standard compliant,=
 so in theory webui-vue could be used on another non-openbmc project in the f=
uture.
>=20
> Ed
>=20
>>=20
>>=20
>> Mike
>>=20
>>=20
>> Sent from my iPad
>>=20
>> > On Jan 11, 2022, at 10:22 AM, Ed Tanous <edtanous@google.com> wrote:
>> >=20
>> > =EF=BB=BFOn Tue, Jan 11, 2022 at 9:17 AM Mike Jones <proclivis@gmail.co=
m> wrote:
>> >>=20
>> >> =EF=BB=BFThis is how to do it:
>> >>=20
>> >> dbus-send --system --print-reply \
>> >>=20
>> >> --dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a187a=
66b71eb7a1f29187594c05bb8fd9a.Hwmon1 \
>> >>=20
>> >> /xyz/openbmc_project/sensors/temperature/lm75temp \
>> >>=20
>> >> org.freedesktop.DBus.Properties.Get string:xyz.openbmc_project.Sensor.=
Value string:Value \
>> >>=20
>> >> double:
>> >>=20
>> >>=20
>> >> It is not clear to me why the second parameter string:Value
>> >>=20
>> >>=20
>> >> I guessed on that and it works. Perhaps xyz=E2=80=A6Sensor.Value is th=
e Property name, and properties have values, so the second parameter says ge=
t the Value of a property whose name ends in .Value.\
>> >=20
>> > For better or worse, the term "Value" is overloaded in both the
>> > interface name, yz.openbmc_project.Sensor.Value, and the property name
>> > within the interface, Value.  That's why you see it twice in this
>> > case.  They are distinct things within the request that just happen to
>> > share a name.  Docs for the interface and property are here:
>> > https://github.com/openbmc/phosphor-dbus-interfaces/blob/e0674c894ed36a=
2e8cf96207907a531d2f514054/yaml/xyz/openbmc_project/Sensor/Value.interface.y=
aml#L24
>> >=20
>> > Happy to see you figured it out.
>> >=20
>> >>=20
>> >>=20
>> >> To test that, I tried string:MaxValue, and that works.
>> >>=20
>> >>=20
>> >> I confirmed with this:
>> >>=20
>> >>=20
>> >> busctl introspect xyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da90590=
7088a187a66b71eb7a1f29187594c05bb8fd9a.Hwmon1 /xyz/openbmc_project/sensors/t=
emperature/lm75temp
>> >>=20
>> >>=20
>> >> A very useful command.
>> >>=20
>> >>=20
>> >> Also useful:
>> >>=20
>> >>=20
>> >> dbus-send --system --print-reply \
>> >>=20
>> >> --dest=3Dxyz.openbmc_project.ObjectMapper /\
>> >>=20
>> >> xyz/openbmc_project/object_mapper \
>> >>=20
>> >> xyz.openbmc_project.ObjectMapper.GetSubTree \
>> >>=20
>> >> string:"/" int32:0 array:string:"xyz.openbmc_project.Sensor.Value"
>> >>=20
>> >>=20
>> >>=20
>> >> Mike
>> >>=20
>> >>=20
>> >> Sent from my iPad
>> >>=20
>> >> On Jan 10, 2022, at 4:50 PM, Ed Tanous <edtanous@google.com> wrote:
>> >>=20
>> >> =EF=BB=BFOn Mon, Jan 10, 2022 at 3:47 PM Mike Jones <proclivis@gmail.c=
om> wrote:
>> >>=20
>> >>=20
>> >> Hi,
>> >>=20
>> >>=20
>> >> I could not find an example of a sensor query in the docs. I assume so=
mething like this:
>> >>=20
>> >>=20
>> >> dbus-send --system --print-reply \
>> >>=20
>> >>=20
>> >> --dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a187a=
66b71eb7a1f29187594c05bb8fd9a.Hwmon1 \
>> >>=20
>> >>=20
>> >> /xyz/openbmc_project/sensors/temperature/lm75temp
>> >>=20
>> >>=20
>> >> xyz.openbmc_project.Sensor.Property.Get xyz.openbmc_project.Sensor.Val=
ue \
>> >>=20
>> >>=20
>> >> double:
>> >>=20
>> >>=20
>> >>=20
>> >> I don't have an example offhand, but the interface you're looking for
>> >> in the bolded area is
>> >> org.freedesktop.DBus.Properties.Get
>> >>=20
>> >> Stack overflow for essentially the same question with an example:
>> >> https://stackoverflow.com/questions/48648952/set-get-property-using-db=
us-send
>> >>=20
>> >>=20
>> >> With the bold interface replaced with something correct.
>> >>=20
>> >>=20
>> >> Can some one give me an example, and a url about how to query properti=
es?
>> >>=20
>> >>=20
>> >> Mike
>> >>=20
>> >>=20
>> >> Sent from my iPad
> --=20
> -Ed

--Apple-Mail-B50A3575-60B4-4F20-A63B-24A214E469B2
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Ed,<div><br></div><div>What translates the r=
edfish query into a dbus query?</div><div><br></div><div>Mike<br><br><div di=
r=3D"ltr">Sent from my iPad</div><div dir=3D"ltr"><br><blockquote type=3D"ci=
te">On Jan 11, 2022, at 7:04 PM, Ed Tanous &lt;ed@tanous.net&gt; wrote:<br><=
br></blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<d=
iv><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Tue, Jan 11, 2022 at 9:53 AM Mike Jones &lt;<a href=3D"mailto:=
proclivis@gmail.com">proclivis@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,20=
4)">Ed,<br>
<br>
So to be sure I understand, dbus-sensors implements the dbus services for ea=
ch sensor type, and the requests I made were serviced by one of these.</bloc=
kquote><div dir=3D"auto"><br></div><div dir=3D"auto">Correct.</div><div dir=3D=
"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
The interface is defined by yaml files in phosphor-dbus-interfaces.</blockqu=
ote><div dir=3D"auto"><br></div><div dir=3D"auto">Yep.</div><div dir=3D"auto=
"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
phosphor-dbus- interfaces generates c++ base classes, and dbus-sensors proba=
bly have c++ classes inheriting from them.</blockquote><div dir=3D"auto"><br=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">For various technical a=
nd social reasons which I=E2=80=99ve detailed in mail to this list in the pa=
st, dbus-sensors doesn=E2=80=99t depend directly on phosphor-dbus-interfaces=
, nor rely on the generated code. It instead generates code from c++ templat=
e expansion in sdbusplus.</div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bor=
der-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" di=
r=3D"auto"><br>
<br>
These interfaces are not Redfish interfaces.</blockquote><div dir=3D"auto"><=
br></div><div dir=3D"auto">Correct.</div><div dir=3D"auto"><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,20=
4,204)" dir=3D"auto"><br>
<br>
When WebUI fetches sensor values, is it using these interfaces, or is there a=
nother Redfish layer involved that translates the query? Or perhaps Redfish o=
nly matters for things like a PSU?</blockquote><div dir=3D"auto"><br></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Depends on which webui you=E2=80=
=99re talking about, there are two.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Phosphor-webui (ie the =E2=80=9Cold=E2=80=9D one) goes directly t=
o dbus through the rest-dbus abstraction in bmcweb.&nbsp; This was very good=
 for initial prototyping (aside from a port to c++, the code largely hasn=E2=
=80=99t changed since it was written) but not great at keeping a consistent o=
r standardized API.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Webui=
-vue (ie, the new one) relies on Redfish directly, which in-effect makes a v=
ery nice Redfish gui, and minimizes the chance that the dbus interfaces are c=
orrect, but redfish is broken.&nbsp; It also keeps us standard compliant, so=
 in theory webui-vue could be used on another non-openbmc project in the fut=
ure.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Ed</div><div dir=3D"=
auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;borde=
r-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Mike<br>
<br>
<br>
Sent from my iPad<br>
<br>
&gt; On Jan 11, 2022, at 10:22 AM, Ed Tanous &lt;<a href=3D"mailto:edtanous@=
google.com" target=3D"_blank">edtanous@google.com</a>&gt; wrote:<br>
&gt; <br>
&gt; =EF=BB=BFOn Tue, Jan 11, 2022 at 9:17 AM Mike Jones &lt;<a href=3D"mail=
to:proclivis@gmail.com" target=3D"_blank">proclivis@gmail.com</a>&gt; wrote:=
<br>
&gt;&gt; <br>
&gt;&gt; =EF=BB=BFThis is how to do it:<br>
&gt;&gt; <br>
&gt;&gt; dbus-send --system --print-reply \<br>
&gt;&gt; <br>
&gt;&gt; --dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a1=
87a66b71eb7a1f29187594c05bb8fd9a.Hwmon1 \<br>
&gt;&gt; <br>
&gt;&gt; /xyz/openbmc_project/sensors/temperature/lm75temp \<br>
&gt;&gt; <br>
&gt;&gt; org.freedesktop.DBus.Properties.Get string:xyz.openbmc_project.Sens=
or.Value string:Value \<br>
&gt;&gt; <br>
&gt;&gt; double:<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; It is not clear to me why the second parameter string:Value<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; I guessed on that and it works. Perhaps xyz=E2=80=A6Sensor.Value is=
 the Property name, and properties have values, so the second parameter says=
 get the Value of a property whose name ends in .Value.\<br>
&gt; <br>
&gt; For better or worse, the term "Value" is overloaded in both the<br>
&gt; interface name, yz.openbmc_project.Sensor.Value, and the property name<=
br>
&gt; within the interface, Value.&nbsp; That's why you see it twice in this<=
br>
&gt; case.&nbsp; They are distinct things within the request that just happe=
n to<br>
&gt; share a name.&nbsp; Docs for the interface and property are here:<br>
&gt; <a href=3D"https://github.com/openbmc/phosphor-dbus-interfaces/blob/e06=
74c894ed36a2e8cf96207907a531d2f514054/yaml/xyz/openbmc_project/Sensor/Value.=
interface.yaml#L24" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
openbmc/phosphor-dbus-interfaces/blob/e0674c894ed36a2e8cf96207907a531d2f5140=
54/yaml/xyz/openbmc_project/Sensor/Value.interface.yaml#L24</a><br>
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
&gt;&gt; busctl introspect xyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da90=
5907088a187a66b71eb7a1f29187594c05bb8fd9a.Hwmon1 /xyz/openbmc_project/sensor=
s/temperature/lm75temp<br>
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
&gt;&gt; string:"/" int32:0 array:string:"xyz.openbmc_project.Sensor.Value"<=
br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; Mike<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; Sent from my iPad<br>
&gt;&gt; <br>
&gt;&gt; On Jan 10, 2022, at 4:50 PM, Ed Tanous &lt;<a href=3D"mailto:edtano=
us@google.com" target=3D"_blank">edtanous@google.com</a>&gt; wrote:<br>
&gt;&gt; <br>
&gt;&gt; =EF=BB=BFOn Mon, Jan 10, 2022 at 3:47 PM Mike Jones &lt;<a href=3D"=
mailto:proclivis@gmail.com" target=3D"_blank">proclivis@gmail.com</a>&gt; wr=
ote:<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; Hi,<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; I could not find an example of a sensor query in the docs. I assume=
 something like this:<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; dbus-send --system --print-reply \<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; --dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a1=
87a66b71eb7a1f29187594c05bb8fd9a.Hwmon1 \<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; /xyz/openbmc_project/sensors/temperature/lm75temp<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; xyz.openbmc_project.Sensor.Property.Get xyz.openbmc_project.Sensor.=
Value \<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; double:<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; I don't have an example offhand, but the interface you're looking f=
or<br>
&gt;&gt; in the bolded area is<br>
&gt;&gt; org.freedesktop.DBus.Properties.Get<br>
&gt;&gt; <br>
&gt;&gt; Stack overflow for essentially the same question with an example:<b=
r>
&gt;&gt; <a href=3D"https://stackoverflow.com/questions/48648952/set-get-pro=
perty-using-dbus-send" rel=3D"noreferrer" target=3D"_blank">https://stackove=
rflow.com/questions/48648952/set-get-property-using-dbus-send</a><br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; With the bold interface replaced with something correct.<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; Can some one give me an example, and a url about how to query prope=
rties?<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; Mike<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; Sent from my iPad<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" d=
ata-smartmail=3D"gmail_signature"><div dir=3D"ltr">-Ed</div></div>
</div></blockquote></div></body></html>=

--Apple-Mail-B50A3575-60B4-4F20-A63B-24A214E469B2--
