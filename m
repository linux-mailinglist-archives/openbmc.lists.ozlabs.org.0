Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C388283DF9
	for <lists+openbmc@lfdr.de>; Mon,  5 Oct 2020 20:08:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4pR80LMyzDr80
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 05:05:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2b;
 helo=mail-yb1-xb2b.google.com; envelope-from=pashag@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4pQN2m5LzDqWj
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2020 05:04:22 +1100 (AEDT)
Received: by mail-yb1-xb2b.google.com with SMTP id x8so7335527ybe.12
 for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2020 11:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=9ew90SXu8kTTO99lFQ++FuIl22x4VvwSac3YCASvaqI=;
 b=WIPBLz5gkb/q7YvU3ILnMVBxcu+/E4Xx4nvOi+wU0e46trqv2JNfO9T9Q1cSktIH9d
 H+nSXnamkF7bWCafF5N8Czd93oRgH3bHMnAMBArB6dha2xmvhq7HcqMKbLqKrNk7VMtS
 +gnt6T3xb9vjwNFrB31/wNVUVYAjuI9z9f/U+CJQ7TdhW1uaSnC7y6mfEUGHPo1Zy/+q
 4DUlL6YMMQV9D+FbDe7t0tndmW2Ql91nlkPlEpaJ1eqA3NlICeO7pjhsRS42J74x0vJg
 eUl36NUQEtZ74v3HvFn1+ih1SJcJOtwCdjs7aPkn/KUsMKJQ83lRjG7SkG2sXz9znILH
 L2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=9ew90SXu8kTTO99lFQ++FuIl22x4VvwSac3YCASvaqI=;
 b=mlC+FMO/R2Ag9c4WeXoQwvuh8KjZXay8Jx9NgKeck8+J7NOswjNSX04yxsfD41F2zd
 wH9l14Hy8GtPHEk0dBTJ7VN0IB0efP/Dg6whk1eIJOZJzf/IMqeXO08ScmS0AOvB3nfc
 Cfo3F+3g1yZbCL1CiEyORAujM/dfKA2KMyFZZSEPguV6zPWq9HniY9C5aJzsF/i2JIbi
 ZpMrCEwTUZ0dCSmOvvx0yjrKdvwxNG6Ic2tQMcbZery/pzggJbeYaFrmhO6TlT+jEXYM
 JBQtVCOgmSvqIcHoLIq1jclS7OpiW+A3iewffw//nGziw0QAADHHf6Y122R5EMDEAw1w
 q+OQ==
X-Gm-Message-State: AOAM531OiMaBdBmeGO16zzseviNsU6pWx7HQlF8Ue1iGnVw7w6LL7TWA
 tVkC+Zifvc/XaP+k71vUgBsP7ljdqqQz0XkZklthTOK0NRGpOQ==
X-Google-Smtp-Source: ABdhPJxKliKeWJc2sBjmU7WCrBvKHrKOJ+DobBtuTVJCcTYgejb2sPwoKP9RBGnMrWpgH+9a6JSagjOTu8JZvL/m+Zw=
X-Received: by 2002:a9d:7095:: with SMTP id l21mr374683otj.224.1601920671332; 
 Mon, 05 Oct 2020 10:57:51 -0700 (PDT)
MIME-Version: 1.0
From: Pasha Ghabussi <pashag@google.com>
Date: Mon, 5 Oct 2020 13:57:41 -0400
Message-ID: <CA+-TXo_C3pP=5zn+O7dtP4wHu9JwhubdUC6aqSMK_J742Cpkaw@mail.gmail.com>
Subject: BMC Performance Profiler
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000931b4205b0f038ce"
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
Cc: Ed Tanous <edtanous@google.com>, Sui Chen <suichen@google.com>,
 Ofer Yehielli <ofery@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000931b4205b0f038ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

We would really appreciate it if you can take a few minutes to read the
following proposal and let us know your thoughts and suggestions.

We are developing a tool to investigate performance problems by looking at
DBus traffic dumps. Current DBus inspection and visualization tools do not
represent the DBus events similar to a typical performance profiler.
Additionally, these tools do not address typical BMC workloads such as IPMI
and ASIO. Hence, identifying potential performance problems requires
inspecting the raw BMC DBus traffic, which can become a long and complex
process. We want to add a graphical interface to webui-vue to visualize the
DBus traffic to address the abovementioned problem.

There have been DBus and IPMI performance-related discussions in the
OpenBMC community, both of which can be helped by this work: IPMI-related
issues started to appear as early as in 2017. One issue (#2630)
<https://github.com/openbmc/openbmc/issues/2630> describes a problem
related to large numbers of sensors. Its follow-up (#3098)
<https://github.com/openbmc/openbmc/issues/3098> mentions =E2=80=9Chostboot=
 crashes
due to poor IPMI performance=E2=80=9D. Another issue (#2519)
<https://github.com/openbmc/openbmc/issues/2519> describes a commonly-seen
problem of IPMI taking very long to respond (> 5s).
There are also discussions on RedFish performance
<https://lists.ozlabs.org/pipermail/openbmc/2018-February/010735.html> on
the mailing list; A patch
<https://lists.ozlabs.org/pipermail/openbmc/2016-June/003380.html>
optimized DBus performance by introducing a cache for name translation.

All the performance investigations listed above involve DBus and may be
helped by this work.

We are planning to use the BMCweb file hosting functionality to access the
DBus event dumps and visualize the events in the web UI. The available
profiling tools such as dbus-pcap
<https://github.com/openbmc/openbmc-tools/tree/master/amboar/obmc-scripts/d=
bus-pcap>,
Wireshark <https://www.wireshark.org/>, Bustle
<https://gitlab.freedesktop.org/bustle/bustle>, Snyh
<https://github.com/snyh/dbus-profiler>, or DFeet
<https://wiki.gnome.org/action/show/Apps/DFeet?action=3Dshow&redirect=3DDFe=
et>
do not provide the exact functionality we are looking for. Our goal is to
develop functionalities similar to other widely used profilers such as
GPUView or VTune Profiler.

One alternative solution considered was to stream DBus requests over
websocket, but the existing websocket endpoints available on BMC webserver
do not provide the exact information we need.

Requirements and Scalability:

   -

   Should provide the adequate functionalities to filter, visualize the
   events timeline, and group the DBus traffic based on multiple criteria s=
uch
   as type, source, destination, path, interface, demon signatures, and mor=
e.
   -

   Should support capture of DBus messages using as little resources as
   possible.
   -

   Should be able to show many (~thousands of) entries on screen
   simultaneously
   -

   Integration with webui-vue


Thank you

--000000000000931b4205b0f038ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-dce10fd1-7fff-c3f6-07=
4a-86b4e551c8e4"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:10pt;m=
argin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Roboto,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">Hello all,</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:10pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Roboto,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre-wrap">We would really appreciate it if you can take a few minutes to =
read the following proposal and let us know your thoughts and suggestions.<=
/span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:10pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;font-family:Roboto,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">We =
are developing a tool to investigate performance problems by looking at DBu=
s traffic dumps. Current DBus inspection and visualization tools do not rep=
resent the DBus events similar to a typical performance profiler. Additiona=
lly, these tools do not address typical BMC workloads such as IPMI and ASIO=
. Hence, identifying potential performance problems requires inspecting the=
 raw BMC DBus traffic, which can become a long and complex process. We want=
 to add a graphical interface to webui-vue to visualize the DBus traffic to=
 address the abovementioned problem.</span></p><br><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size=
:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-=
align:baseline;white-space:pre-wrap">There have been DBus and IPMI performa=
nce-related discussions in the OpenBMC community, both of which can be help=
ed by this work: IPMI-related issues started to appear as early as in 2017.=
 </span><a href=3D"https://github.com/openbmc/openbmc/issues/2630" style=3D=
"text-decoration-line:none"><span style=3D"font-size:11pt;font-family:Robot=
o,sans-serif;background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;text-decoration-line:underline;vertical-align:bas=
eline;white-space:pre-wrap">One issue (#2630)</span></a><span style=3D"font=
-size:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre-wrap"> describes a problem related to l=
arge numbers of sensors. </span><a href=3D"https://github.com/openbmc/openb=
mc/issues/3098" style=3D"text-decoration-line:none"><span style=3D"font-siz=
e:11pt;font-family:Roboto,sans-serif;background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;text-decoration-line:unde=
rline;vertical-align:baseline;white-space:pre-wrap">Its follow-up (#3098)</=
span></a><span style=3D"font-size:11pt;font-family:Roboto,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap"> ment=
ions =E2=80=9Chostboot crashes due to poor IPMI performance=E2=80=9D. </spa=
n><a href=3D"https://github.com/openbmc/openbmc/issues/2519" style=3D"text-=
decoration-line:none"><span style=3D"font-size:11pt;font-family:Roboto,sans=
-serif;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;text-decoration-line:underline;vertical-align:baseline;=
white-space:pre-wrap">Another issue (#2519)</span></a><span style=3D"font-s=
ize:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertic=
al-align:baseline;white-space:pre-wrap"> describes a commonly-seen problem =
of IPMI taking very long to respond (&gt; 5s).</span><span style=3D"font-si=
ze:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertica=
l-align:baseline;white-space:pre-wrap"><br></span><span style=3D"font-size:=
11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre-wrap">There are also discussions on </span><a=
 href=3D"https://lists.ozlabs.org/pipermail/openbmc/2018-February/010735.ht=
ml" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-=
family:Roboto,sans-serif;background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-decoration-line:underline;vertic=
al-align:baseline;white-space:pre-wrap">RedFish performance</span></a><span=
 style=3D"font-size:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;vertical-align:baseline;white-space:pre-wrap"> on the mailing lis=
t; </span><a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2016-June/0=
03380.html" style=3D"text-decoration-line:none"><span style=3D"font-size:11=
pt;font-family:Roboto,sans-serif;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;text-decoration-line:underlin=
e;vertical-align:baseline;white-space:pre-wrap">A patch</span></a><span sty=
le=3D"font-size:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;vertical-align:baseline;white-space:pre-wrap"> optimized DBus perform=
ance by introducing a cache for name translation.</span></p><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre-wrap">All the performance investiga=
tions listed above involve DBus and may be helped by this work.</span></p><=
br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-size:11pt;font-family:Roboto,sans-serif;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;vertical-align:baseline;white-space:pre-wrap">We are plan=
ning to use the BMCweb file hosting functionality to access the DBus event =
dumps and visualize the events in the web UI. The available profiling tools=
 such as </span><a href=3D"https://github.com/openbmc/openbmc-tools/tree/ma=
ster/amboar/obmc-scripts/dbus-pcap" style=3D"text-decoration-line:none"><sp=
an style=3D"font-size:11pt;font-family:&quot;Courier New&quot;;background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;text-decoration-line:underline;vertical-align:baseline;white-space:pre-wra=
p">dbus-pcap</span></a><span style=3D"font-size:11pt;font-family:Roboto,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:p=
re-wrap">, </span><a href=3D"https://www.wireshark.org/" style=3D"text-deco=
ration-line:none"><span style=3D"font-size:11pt;font-family:Arial;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;text-decoration-line:underline;vertical-align:baseline;white-space:pre-=
wrap">Wireshark</span></a><span style=3D"font-size:11pt;font-family:Roboto,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre-wrap">, </span><a href=3D"https://gitlab.freedesktop.org/bustle/bustl=
e" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-f=
amily:Roboto,sans-serif;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;text-decoration-line:underline;vertica=
l-align:baseline;white-space:pre-wrap">Bustle</span></a><span style=3D"font=
-size:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre-wrap">, </span><a href=3D"https://githu=
b.com/snyh/dbus-profiler" style=3D"text-decoration-line:none"><span style=
=3D"font-size:11pt;font-family:Roboto,sans-serif;background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;text-decorati=
on-line:underline;vertical-align:baseline;white-space:pre-wrap">Snyh</span>=
</a><span style=3D"font-size:11pt;font-family:Roboto,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">, or </spa=
n><a href=3D"https://wiki.gnome.org/action/show/Apps/DFeet?action=3Dshow&am=
p;redirect=3DDFeet" style=3D"text-decoration-line:none"><span style=3D"font=
-size:11pt;font-family:Roboto,sans-serif;background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;text-decoration-line:=
underline;vertical-align:baseline;white-space:pre-wrap">DFeet</span></a><sp=
an style=3D"font-size:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;vertical-align:baseline;white-space:pre-wrap"> do not provide t=
he exact functionality we are looking for. Our goal is to develop functiona=
lities similar to other widely used profilers </span><span style=3D"font-si=
ze:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:base=
line;white-space:pre-wrap">such as GPUView or VTune Profiler.</span></p><br=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre-wrap">One alternative solution =
considered was to stream DBus requests over websocket, but the existing web=
socket endpoints available on BMC webserver do not provide the exact inform=
ation we need.</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Robo=
to,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-s=
pace:pre-wrap">Requirements and Scalability:</span></p><ul style=3D"margin-=
top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ve=
rtical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre-wrap">Should provide the ade=
quate functionalities to filter, visualize the events timeline, and group t=
he DBus traffic based on multiple criteria such as type, source, destinatio=
n, path, interface, demon signatures, and more.</span></p></li><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Roboto,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt">=
<span style=3D"font-size:11pt;background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-sp=
ace:pre-wrap">Should support capture of DBus messages using as little resou=
rces as possible.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:d=
isc;font-size:11pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre-wrap">Should be able t=
o show many (~thousands of) entries on screen simultaneously</span></p></li=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:R=
oboto,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt"><span style=3D"font-size:11pt;background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:base=
line;white-space:pre-wrap">Integration with webui-vue</span></p></li></ul><=
div><font color=3D"#000000" face=3D"Roboto, sans-serif"><span style=3D"font=
-size:14.6667px;white-space:pre-wrap"><br></span></font></div><div><font co=
lor=3D"#000000" face=3D"Roboto, sans-serif"><span style=3D"font-size:14.666=
7px;white-space:pre-wrap">Thank you</span></font></div></span></div>

--000000000000931b4205b0f038ce--
