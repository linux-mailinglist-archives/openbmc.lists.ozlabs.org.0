Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 708C6287E48
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 23:46:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6lBj3T2gzDqXq
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 08:46:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::330;
 helo=mail-ot1-x330.google.com; envelope-from=pashag@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=J3YMMkZV; dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6l951cK8zDqX6
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2020 08:44:39 +1100 (AEDT)
Received: by mail-ot1-x330.google.com with SMTP id f37so6994722otf.12
 for <openbmc@lists.ozlabs.org>; Thu, 08 Oct 2020 14:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=K6aXb4BMi9tFQIAIOnmtCcUxdWA9brb3Yj+0K2rLBEA=;
 b=J3YMMkZVjtSaWPIbnG9MI/NlQRGiBfeK1GpESLpOg3RYvKgO+gr4raMTY/NbEQgDOD
 j1/uy0prEb9Vz4S+Qe2YMvoOYxb8TW01G3/5h1lHoHNqX7nlQ7NmIsGBKrRTOCsRATWq
 NfR46M49+x0CMvfkxD2kqBOY02YDeg23T537hUz2582Xho1H+FuTQvWixXe4HOKeW9uK
 9GRQ6zC7ey0DqQmFFqgbyxz2qWKGJywWaJRvkJCP9FIsGWEWOrNLnLHB4+CXD/DhUAmq
 ZH3DF+W1Hniu8gBZubjYyvyJzQXiXGxryeeEs1m9BPhimzDNxHT6nK/r6u0HmEGxpzrh
 yC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=K6aXb4BMi9tFQIAIOnmtCcUxdWA9brb3Yj+0K2rLBEA=;
 b=ckOT3xL5ZXBNUsb5pN5clAdVvQCSNsq/6azhvcnLwy9JykO+tl8t/jYemFLcGnX6A8
 77S2iJPvwkJv2I2cpJZkqz+nWKAYXLkoLRhX28+UY5vPCdsmZDHgteTKyYMSB09FZO/K
 yHzChiRrNpVimjY75Wne5Lcg03H18xuDrz9BwS4P8iygO54dsFbUUa6SghRke5/B0wKB
 bIJyWlEQbP8oh94pySg7I2OR6qeIU5AWnx/2t8eZi1S2Ouxu58tfTOhrDYMAS2vVhNgS
 vT37SmK6yW1CqQ5q2UaT8Rh182Dn0sHLgLt54GXoGlXQ0fGyhzyS4r9u5PxVRxh9QoVB
 tMtw==
X-Gm-Message-State: AOAM533/tFu3wlgwkvS+g9iJ/RxVnlXYzh4QeUddYMVHBNdeZkborgk3
 pbtnF+VgqCPCJVL2+3IeyAdXdihPRnRTichJ8ufXzZsKjonciA==
X-Google-Smtp-Source: ABdhPJwbSB7dukVfV+Dgwn9uqYEvqX0kcdAxKytMtcZpmT+2Nb8wYgwb1rtPoLCMKPUi50DJCjHxspLfHpqGKrejFww=
X-Received: by 2002:a9d:3bca:: with SMTP id k68mr6039866otc.150.1602193474596; 
 Thu, 08 Oct 2020 14:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <CA+-TXo_C3pP=5zn+O7dtP4wHu9JwhubdUC6aqSMK_J742Cpkaw@mail.gmail.com>
In-Reply-To: <CA+-TXo_C3pP=5zn+O7dtP4wHu9JwhubdUC6aqSMK_J742Cpkaw@mail.gmail.com>
From: Pasha Ghabussi <pashag@google.com>
Date: Thu, 8 Oct 2020 17:44:23 -0400
Message-ID: <CA+-TXo-4MCkDwKG2087pgZsqgezfxda6LUWOv5GCtLK5k=cjUQ@mail.gmail.com>
Subject: Re: BMC Performance Profiler
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000ea931905b12fbcb7"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000ea931905b12fbcb7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

We would really appreciate it if you can take a few minutes to read the
proposal sent earlier and let us know your thoughts and suggestions.

Thank you

On Mon, Oct 5, 2020 at 1:57 PM Pasha Ghabussi <pashag@google.com> wrote:

> Hello all,
>
> We would really appreciate it if you can take a few minutes to read the
> following proposal and let us know your thoughts and suggestions.
>
> We are developing a tool to investigate performance problems by looking a=
t
> DBus traffic dumps. Current DBus inspection and visualization tools do no=
t
> represent the DBus events similar to a typical performance profiler.
> Additionally, these tools do not address typical BMC workloads such as IP=
MI
> and ASIO. Hence, identifying potential performance problems requires
> inspecting the raw BMC DBus traffic, which can become a long and complex
> process. We want to add a graphical interface to webui-vue to visualize t=
he
> DBus traffic to address the abovementioned problem.
>
> There have been DBus and IPMI performance-related discussions in the
> OpenBMC community, both of which can be helped by this work: IPMI-related
> issues started to appear as early as in 2017. One issue (#2630)
> <https://github.com/openbmc/openbmc/issues/2630> describes a problem
> related to large numbers of sensors. Its follow-up (#3098)
> <https://github.com/openbmc/openbmc/issues/3098> mentions =E2=80=9Chostbo=
ot
> crashes due to poor IPMI performance=E2=80=9D. Another issue (#2519)
> <https://github.com/openbmc/openbmc/issues/2519> describes a
> commonly-seen problem of IPMI taking very long to respond (> 5s).
> There are also discussions on RedFish performance
> <https://lists.ozlabs.org/pipermail/openbmc/2018-February/010735.html> on
> the mailing list; A patch
> <https://lists.ozlabs.org/pipermail/openbmc/2016-June/003380.html>
> optimized DBus performance by introducing a cache for name translation.
>
> All the performance investigations listed above involve DBus and may be
> helped by this work.
>
> We are planning to use the BMCweb file hosting functionality to access th=
e
> DBus event dumps and visualize the events in the web UI. The available
> profiling tools such as dbus-pcap
> <https://github.com/openbmc/openbmc-tools/tree/master/amboar/obmc-scripts=
/dbus-pcap>,
> Wireshark <https://www.wireshark.org/>, Bustle
> <https://gitlab.freedesktop.org/bustle/bustle>, Snyh
> <https://github.com/snyh/dbus-profiler>, or DFeet
> <https://wiki.gnome.org/action/show/Apps/DFeet?action=3Dshow&redirect=3DD=
Feet>
> do not provide the exact functionality we are looking for. Our goal is to
> develop functionalities similar to other widely used profilers such as
> GPUView or VTune Profiler.
>
> One alternative solution considered was to stream DBus requests over
> websocket, but the existing websocket endpoints available on BMC webserve=
r
> do not provide the exact information we need.
>
> Requirements and Scalability:
>
>    -
>
>    Should provide the adequate functionalities to filter, visualize the
>    events timeline, and group the DBus traffic based on multiple criteria=
 such
>    as type, source, destination, path, interface, demon signatures, and m=
ore.
>    -
>
>    Should support capture of DBus messages using as little resources as
>    possible.
>    -
>
>    Should be able to show many (~thousands of) entries on screen
>    simultaneously
>    -
>
>    Integration with webui-vue
>
>
> Thank you
>

--000000000000ea931905b12fbcb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"color:rgb(0,0,0);font-family:Roboto,sa=
ns-serif;font-size:14.6667px;white-space:pre-wrap">Hello all,</span><br></d=
iv><div><span style=3D"color:rgb(0,0,0);font-family:Roboto,sans-serif;font-=
size:14.6667px;white-space:pre-wrap"><br></span></div><div><span style=3D"c=
olor:rgb(0,0,0);font-family:Roboto,sans-serif;font-size:14.6667px;white-spa=
ce:pre-wrap">We would really appreciate it if you can take a few minutes to=
 read the proposal sent earlier and let us know your thoughts and suggestio=
ns.</span><br></div><div><span style=3D"color:rgb(0,0,0);font-family:Roboto=
,sans-serif;font-size:14.6667px;white-space:pre-wrap"><br></span></div><div=
><span style=3D"color:rgb(0,0,0);font-family:Roboto,sans-serif;font-size:14=
.6667px;white-space:pre-wrap">Thank you</span></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 5, 2020 at =
1:57 PM Pasha Ghabussi &lt;<a href=3D"mailto:pashag@google.com">pashag@goog=
le.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><span id=3D"gmail-m_8286078852088997877gmail-docs-in=
ternal-guid-dce10fd1-7fff-c3f6-074a-86b4e551c8e4"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:10pt;margin-bottom:0pt"><span style=3D"font-size=
:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-=
align:baseline;white-space:pre-wrap">Hello all,</span></p><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:10pt;margin-bottom:0pt"><span style=3D"f=
ont-size:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre-wrap">We would really appreciate it =
if you can take a few minutes to read the following proposal and let us kno=
w your thoughts and suggestions.</span></p><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:10pt;margin-bottom:0pt"><span style=3D"font-size:11pt;f=
ont-family:Roboto,sans-serif;color:rgb(0,0,0);background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:b=
aseline;white-space:pre-wrap">We are developing a tool to investigate perfo=
rmance problems by looking at DBus traffic dumps. Current DBus inspection a=
nd visualization tools do not represent the DBus events similar to a typica=
l performance profiler. Additionally, these tools do not address typical BM=
C workloads such as IPMI and ASIO. Hence, identifying potential performance=
 problems requires inspecting the raw BMC DBus traffic, which can become a =
long and complex process. We want to add a graphical interface to webui-vue=
 to visualize the DBus traffic to address the abovementioned problem.</span=
></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;font-family:Roboto,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">There=
 have been DBus and IPMI performance-related discussions in the OpenBMC com=
munity, both of which can be helped by this work: IPMI-related issues start=
ed to appear as early as in 2017. </span><a href=3D"https://github.com/open=
bmc/openbmc/issues/2630" style=3D"text-decoration-line:none" target=3D"_bla=
nk"><span style=3D"font-size:11pt;font-family:Roboto,sans-serif;background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;text-decoration-line:underline;vertical-align:baseline;white-space:pre-wr=
ap">One issue (#2630)</span></a><span style=3D"font-size:11pt;font-family:R=
oboto,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whit=
e-space:pre-wrap"> describes a problem related to large numbers of sensors.=
 </span><a href=3D"https://github.com/openbmc/openbmc/issues/3098" style=3D=
"text-decoration-line:none" target=3D"_blank"><span style=3D"font-size:11pt=
;font-family:Roboto,sans-serif;background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;text-decoration-line:underline;=
vertical-align:baseline;white-space:pre-wrap">Its follow-up (#3098)</span><=
/a><span style=3D"font-size:11pt;font-family:Roboto,sans-serif;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;vertical-align:baseline;white-space:pre-wrap"> mentions =
=E2=80=9Chostboot crashes due to poor IPMI performance=E2=80=9D. </span><a =
href=3D"https://github.com/openbmc/openbmc/issues/2519" style=3D"text-decor=
ation-line:none" target=3D"_blank"><span style=3D"font-size:11pt;font-famil=
y:Roboto,sans-serif;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;text-decoration-line:underline;vertical-al=
ign:baseline;white-space:pre-wrap">Another issue (#2519)</span></a><span st=
yle=3D"font-size:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre-wrap"> describes a commonly-=
seen problem of IPMI taking very long to respond (&gt; 5s).</span><span sty=
le=3D"font-size:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=
=3D"font-size:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre-wrap">There are also discussion=
s on </span><a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2018-Febr=
uary/010735.html" style=3D"text-decoration-line:none" target=3D"_blank"><sp=
an style=3D"font-size:11pt;font-family:Roboto,sans-serif;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;text-=
decoration-line:underline;vertical-align:baseline;white-space:pre-wrap">Red=
Fish performance</span></a><span style=3D"font-size:11pt;font-family:Roboto=
,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spa=
ce:pre-wrap"> on the mailing list; </span><a href=3D"https://lists.ozlabs.o=
rg/pipermail/openbmc/2016-June/003380.html" style=3D"text-decoration-line:n=
one" target=3D"_blank"><span style=3D"font-size:11pt;font-family:Roboto,san=
s-serif;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-decoration-line:underline;vertical-align:baseline=
;white-space:pre-wrap">A patch</span></a><span style=3D"font-size:11pt;font=
-family:Roboto,sans-serif;color:rgb(0,0,0);background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:base=
line;white-space:pre-wrap"> optimized DBus performance by introducing a cac=
he for name translation.</span></p><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-famil=
y:Roboto,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;w=
hite-space:pre-wrap">All the performance investigations listed above involv=
e DBus and may be helped by this work.</span></p><br><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre-wrap">We are planning to use the BMCweb =
file hosting functionality to access the DBus event dumps and visualize the=
 events in the web UI. The available profiling tools such as </span><a href=
=3D"https://github.com/openbmc/openbmc-tools/tree/master/amboar/obmc-script=
s/dbus-pcap" style=3D"text-decoration-line:none" target=3D"_blank"><span st=
yle=3D"font-size:11pt;font-family:&quot;Courier New&quot;;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;text=
-decoration-line:underline;vertical-align:baseline;white-space:pre-wrap">db=
us-pcap</span></a><span style=3D"font-size:11pt;font-family:Roboto,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">, </span><a href=3D"https://www.wireshark.org/" style=3D"text-decoratio=
n-line:none" target=3D"_blank"><span style=3D"font-size:11pt;font-family:Ar=
ial;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;text-decoration-line:underline;vertical-align:baseline;whi=
te-space:pre-wrap">Wireshark</span></a><span style=3D"font-size:11pt;font-f=
amily:Roboto,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseli=
ne;white-space:pre-wrap">, </span><a href=3D"https://gitlab.freedesktop.org=
/bustle/bustle" style=3D"text-decoration-line:none" target=3D"_blank"><span=
 style=3D"font-size:11pt;font-family:Roboto,sans-serif;background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;text-de=
coration-line:underline;vertical-align:baseline;white-space:pre-wrap">Bustl=
e</span></a><span style=3D"font-size:11pt;font-family:Roboto,sans-serif;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">, =
</span><a href=3D"https://github.com/snyh/dbus-profiler" style=3D"text-deco=
ration-line:none" target=3D"_blank"><span style=3D"font-size:11pt;font-fami=
ly:Roboto,sans-serif;background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;text-decoration-line:underline;vertical-a=
lign:baseline;white-space:pre-wrap">Snyh</span></a><span style=3D"font-size=
:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-=
align:baseline;white-space:pre-wrap">, or </span><a href=3D"https://wiki.gn=
ome.org/action/show/Apps/DFeet?action=3Dshow&amp;redirect=3DDFeet" style=3D=
"text-decoration-line:none" target=3D"_blank"><span style=3D"font-size:11pt=
;font-family:Roboto,sans-serif;background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;text-decoration-line:underline;=
vertical-align:baseline;white-space:pre-wrap">DFeet</span></a><span style=
=3D"font-size:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre-wrap"> do not provide the exact=
 functionality we are looking for. Our goal is to develop functionalities s=
imilar to other widely used profilers </span><span style=3D"font-size:11pt;=
font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whi=
te-space:pre-wrap">such as GPUView or VTune Profiler.</span></p><br><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre-wrap">One alternative solution conside=
red was to stream DBus requests over websocket, but the existing websocket =
endpoints available on BMC webserver do not provide the exact information w=
e need.</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Roboto,sans=
-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">Requirements and Scalability:</span></p><ul style=3D"margin-top:0px=
;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-=
align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;vertical-align:baseline;white-space:pre-wrap">Should provide the adequ=
ate functionalities to filter, visualize the events timeline, and group the=
 DBus traffic based on multiple criteria such as type, source, destination,=
 path, interface, demon signatures, and more.</span></p></li><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Roboto,sans-seri=
f;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">Should support capture of DBus messages using as little re=
sources as possible.</span></p></li><li dir=3D"ltr" style=3D"list-style-typ=
e:disc;font-size:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Should=
 be able to show many (~thousands of) entries on screen simultaneously</spa=
n></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fon=
t-family:Roboto,sans-serif;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:bas=
eline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre-wrap">Integration with webui-vue</span>=
</p></li></ul><div><font color=3D"#000000" face=3D"Roboto, sans-serif"><spa=
n style=3D"font-size:14.6667px;white-space:pre-wrap"><br></span></font></di=
v><div><font color=3D"#000000" face=3D"Roboto, sans-serif"><span style=3D"f=
ont-size:14.6667px;white-space:pre-wrap">Thank you</span></font></div></spa=
n></div>
</blockquote></div>

--000000000000ea931905b12fbcb7--
