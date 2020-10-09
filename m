Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA93288D39
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 17:46:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7C9Q51T3zDqd1
	for <lists+openbmc@lfdr.de>; Sat, 10 Oct 2020 02:46:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::c32;
 helo=mail-oo1-xc32.google.com; envelope-from=pashag@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ab7O/ggt; dkim-atps=neutral
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7C8Y0sYZzDqbB
 for <openbmc@lists.ozlabs.org>; Sat, 10 Oct 2020 02:45:44 +1100 (AEDT)
Received: by mail-oo1-xc32.google.com with SMTP id 4so2453758ooh.11
 for <openbmc@lists.ozlabs.org>; Fri, 09 Oct 2020 08:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SwqpeFXhLiWx1kSMta0qCVK7yAiv8uZi9CP1LJJleE0=;
 b=ab7O/ggt/ebaf+4wJqcu2hB9sUYCdyFyyrejk/0D0R61Oryzcims7O9WUCzGkNOeQV
 r7hbrmhQ4NqQ+4sNL7/J8FiN3ZInXjav3rCOkrSVj5dprUp7Tt7zvucuNNCBz5zJGONw
 k0Vq/juY7qV2PzzCy2TJfjaW5ngiE+qqgbff6N2djx3J4zEF98xBBgo8v37vu3dirqDz
 7RWne27Qa75oLnPivYohaFxENRA9A4pkKU929IVuXYrhH58YiDEFuP2iEIEIZe2GKjDN
 UjUEIFa9jgOzYc8UO+3xeCqiIgDcGfEyzTu6e0fmovi0BlJSYcdLvtzmj1H/Vb3dSHRF
 /GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SwqpeFXhLiWx1kSMta0qCVK7yAiv8uZi9CP1LJJleE0=;
 b=K/MzUzIjAwtHFlf4ypWKTLOtO+lqFukS/cM93yNjzjZY/L/FMfzM08s8WlrX6g8TLd
 PokxEYUbhoNb6IGwhcnj+Zqxk9gDKzD5uycW6aCUzUgNRVmakw9UagVgPa3pU9EhBD0Z
 BK7s/KlQ9BmWM6rniz4fPnlYuS30H7UgDKxmD+zj+uLh+oOxzkYmRMHqwCXaT/HTbRuo
 sfXHFC3z11qtGRTOdVqD6vEwk0hSw5XocRUaQjYj6GFs2XrTUkVpyLPTfjwumT1kphqa
 kulGwzmadup8fX/khGOHzsB/fZ5yGocqDI6BBlGj3K62vQ1we0eEqPAAmWEJdpDkLepR
 oSzw==
X-Gm-Message-State: AOAM530UaIXOrH/oYQjql5Si8teWWhm6dN5j8ibl81SEjyAmZbbCDYez
 6TM5qC4yR3SmAdRiTvCGmS6yQR28qSUV+23SDYbJSg==
X-Google-Smtp-Source: ABdhPJykU6rgmeE3qJvEGT8J7rEIvoBnyt/W6BGo7wlfz3VAPnNFhDEDm20z2wyYbowIrHu9EIcj0ZNmQuxhY55XBuU=
X-Received: by 2002:a4a:dcc8:: with SMTP id h8mr2095881oou.81.1602258340445;
 Fri, 09 Oct 2020 08:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <CA+-TXo_C3pP=5zn+O7dtP4wHu9JwhubdUC6aqSMK_J742Cpkaw@mail.gmail.com>
 <CA+-TXo-4MCkDwKG2087pgZsqgezfxda6LUWOv5GCtLK5k=cjUQ@mail.gmail.com>
 <50E8C07A-985E-4645-91BF-5ADF7D1D40B4@gmail.com>
In-Reply-To: <50E8C07A-985E-4645-91BF-5ADF7D1D40B4@gmail.com>
From: Pasha Ghabussi <pashag@google.com>
Date: Fri, 9 Oct 2020 11:45:29 -0400
Message-ID: <CA+-TXo9+wr2KT59HDGe5SSdZRtuJStGBqT6j-tQtL4NJMxr=3Q@mail.gmail.com>
Subject: Re: BMC Performance Profiler
To: Andrew Geissler <geissonator@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000038c0bd05b13ed70e"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000038c0bd05b13ed70e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Andrew for the feedback.

We're planning to capture the data using something like "dbus-monitor" or
"busctl capture" and on't want to write a new tool for sure.

For the analysis and visualization part, we looked into multiple options
including the ones I mentioned in the previous email and none of them
provide the exact functionality that we need. There are a few DBus
profilers, but they do not allow grouping the events. Hence, they are not
capable of visualizing many potential performance problems.

Regarding the implementation, we have a working prototype that can
visualize DBus pcap dumps. However, we were thinking that including this in
the UI would be more useful to the community.

On Fri, Oct 9, 2020 at 10:37 AM Andrew Geissler <geissonator@gmail.com>
wrote:

>
>
> > On Oct 8, 2020, at 4:44 PM, Pasha Ghabussi <pashag@google.com> wrote:
> >
> > Hello all,
> >
> > We would really appreciate it if you can take a few minutes to read the
> proposal sent earlier and let us know your thoughts and suggestions.
> >
> > Thank you
> >
> > On Mon, Oct 5, 2020 at 1:57 PM Pasha Ghabussi <pashag@google.com> wrote=
:
> > Hello all,
> > We would really appreciate it if you can take a few minutes to read the
> following proposal and let us know your thoughts and suggestions.
> > We are developing a tool to investigate performance problems by looking
> at DBus traffic dumps.
>
> I definitely think this could be a very useful tool. Performance issues
> have hindered us from day 1 with OpenBMC and countless hours have gone in=
to
> trying to identify the different issues. One area we=E2=80=99ve seen a lo=
t of
> issues with is on BMC startup, especially after a firmware update. If you
> could provide a way to enable the needed profiling debug, and then reboot
> the BMC and capture the data for analysis, it would be appreciated.
>
> > Current DBus inspection and visualization tools do not represent the
> DBus events similar to a typical performance profiler. Additionally, thes=
e
> tools do not address typical BMC workloads such as IPMI and ASIO. Hence,
> identifying potential performance problems requires inspecting the raw BM=
C
> DBus traffic, which can become a long and complex process. We want to add=
 a
> graphical interface to webui-vue to visualize the DBus traffic to address
> the abovementioned problem.
>
> Will you be using something like "busctl capture=E2=80=9D to capture the =
data? I
> hope you don=E2=80=99t have to write a new tool to get the data?
>
>
> >
> > There have been DBus and IPMI performance-related discussions in the
> OpenBMC community, both of which can be helped by this work: IPMI-related
> issues started to appear as early as in 2017. One issue (#2630) describes=
 a
> problem related to large numbers of sensors. Its follow-up (#3098) mentio=
ns
> =E2=80=9Chostboot crashes due to poor IPMI performance=E2=80=9D. Another =
issue (#2519)
> describes a commonly-seen problem of IPMI taking very long to respond (>
> 5s).
> > There are also discussions on RedFish performance on the mailing list; =
A
> patch optimized DBus performance by introducing a cache for name
> translation.
> > All the performance investigations listed above involve DBus and may be
> helped by this work.
>
> Agreed
>
> >
> > We are planning to use the BMCweb file hosting functionality to access
> the DBus event dumps and visualize the events in the web UI. The availabl=
e
> profiling tools such as dbus-pcap, Wireshark, Bustle, Snyh, or DFeet do n=
ot
> provide the exact functionality we are looking for. Our goal is to develo=
p
> functionalities similar to other widely used profilers such as GPUView or
> VTune Profiler.
> >
>
> For the analysis and visualization side, I=E2=80=99m never a big fan of w=
riting
> something from scratch. Have you looked into enhancing some of the existi=
ng
> tools out there vs. writing your own?
>
> Although having in the web UI could be useful, I don=E2=80=99t really see=
 it as a
> requirement. Could your tool be simpler to write or be made more generic
> for others to use if it was not tied to the web UI?
>
> > One alternative solution considered was to stream DBus requests over
> websocket, but the existing websocket endpoints available on BMC webserve=
r
> do not provide the exact information we need.
> >
> > Requirements and Scalability:
> >       =E2=80=A2 Should provide the adequate functionalities to filter, =
visualize
> the events timeline, and group the DBus traffic based on multiple criteri=
a
> such as type, source, destination, path, interface, demon signatures, and
> more.
> >       =E2=80=A2 Should support capture of DBus messages using as little
> resources as possible.
> >       =E2=80=A2 Should be able to show many (~thousands of) entries on =
screen
> simultaneously
> >       =E2=80=A2 Integration with webui-vue
> >
> > Thank you
>
>

--00000000000038c0bd05b13ed70e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks=C2=A0Andrew for the feedback.<div><br></div><div>We=
&#39;re planning to capture the data using something like &quot;dbus-monito=
r&quot; or &quot;busctl capture&quot; and on&#39;t want to write a new tool=
 for sure.</div><div><br></div><div>For the analysis and visualization part=
, we looked into multiple options including the ones I mentioned in the pre=
vious email and none of them provide the exact functionality that we need. =
There are a few DBus profilers, but they do not allow grouping the events. =
Hence, they are not capable of visualizing many potential performance probl=
ems.</div><div><br></div><div>Regarding the implementation, we have a worki=
ng prototype that can visualize DBus pcap dumps. However, we were thinking =
that including this in the UI would be more useful to the community.</div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Fri, Oct 9, 2020 at 10:37 AM Andrew Geissler &lt;<a href=3D"mailto:geisso=
nator@gmail.com">geissonator@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; On Oct 8, 2020, at 4:44 PM, Pasha Ghabussi &lt;<a href=3D"mailto:pasha=
g@google.com" target=3D"_blank">pashag@google.com</a>&gt; wrote:<br>
&gt; <br>
&gt; Hello all,<br>
&gt; <br>
&gt; We would really appreciate it if you can take a few minutes to read th=
e proposal sent earlier and let us know your thoughts and suggestions.<br>
&gt; <br>
&gt; Thank you<br>
&gt; <br>
&gt; On Mon, Oct 5, 2020 at 1:57 PM Pasha Ghabussi &lt;<a href=3D"mailto:pa=
shag@google.com" target=3D"_blank">pashag@google.com</a>&gt; wrote:<br>
&gt; Hello all,<br>
&gt; We would really appreciate it if you can take a few minutes to read th=
e following proposal and let us know your thoughts and suggestions.<br>
&gt; We are developing a tool to investigate performance problems by lookin=
g at DBus traffic dumps.<br>
<br>
I definitely think this could be a very useful tool. Performance issues hav=
e hindered us from day 1 with OpenBMC and countless hours have gone into tr=
ying to identify the different issues. One area we=E2=80=99ve seen a lot of=
 issues with is on BMC startup, especially after a firmware update. If you =
could provide a way to enable the needed profiling debug, and then reboot t=
he BMC and capture the data for analysis, it would be appreciated.<br>
<br>
&gt; Current DBus inspection and visualization tools do not represent the D=
Bus events similar to a typical performance profiler. Additionally, these t=
ools do not address typical BMC workloads such as IPMI and ASIO. Hence, ide=
ntifying potential performance problems requires inspecting the raw BMC DBu=
s traffic, which can become a long and complex process. We want to add a gr=
aphical interface to webui-vue to visualize the DBus traffic to address the=
 abovementioned problem.<br>
<br>
Will you be using something like &quot;busctl capture=E2=80=9D to capture t=
he data? I hope you don=E2=80=99t have to write a new tool to get the data?=
 <br>
<br>
<br>
&gt; <br>
&gt; There have been DBus and IPMI performance-related discussions in the O=
penBMC community, both of which can be helped by this work: IPMI-related is=
sues started to appear as early as in 2017. One issue (#2630) describes a p=
roblem related to large numbers of sensors. Its follow-up (#3098) mentions =
=E2=80=9Chostboot crashes due to poor IPMI performance=E2=80=9D. Another is=
sue (#2519) describes a commonly-seen problem of IPMI taking very long to r=
espond (&gt; 5s).<br>
&gt; There are also discussions on RedFish performance on the mailing list;=
 A patch optimized DBus performance by introducing a cache for name transla=
tion.<br>
&gt; All the performance investigations listed above involve DBus and may b=
e helped by this work.<br>
<br>
Agreed<br>
<br>
&gt; <br>
&gt; We are planning to use the BMCweb file hosting functionality to access=
 the DBus event dumps and visualize the events in the web UI. The available=
 profiling tools such as dbus-pcap, Wireshark, Bustle, Snyh, or DFeet do no=
t provide the exact functionality we are looking for. Our goal is to develo=
p functionalities similar to other widely used profilers such as GPUView or=
 VTune Profiler.<br>
&gt; <br>
<br>
For the analysis and visualization side, I=E2=80=99m never a big fan of wri=
ting something from scratch. Have you looked into enhancing some of the exi=
sting tools out there vs. writing your own?<br>
<br>
Although having in the web UI could be useful, I don=E2=80=99t really see i=
t as a requirement. Could your tool be simpler to write or be made more gen=
eric for others to use if it was not tied to the web UI?<br>
<br>
&gt; One alternative solution considered was to stream DBus requests over w=
ebsocket, but the existing websocket endpoints available on BMC webserver d=
o not provide the exact information we need.<br>
&gt; <br>
&gt; Requirements and Scalability:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=80=A2 Should provide the adequate functi=
onalities to filter, visualize the events timeline, and group the DBus traf=
fic based on multiple criteria such as type, source, destination, path, int=
erface, demon signatures, and more.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=80=A2 Should support capture of DBus mes=
sages using as little resources as possible.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=80=A2 Should be able to show many (~thou=
sands of) entries on screen simultaneously<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=80=A2 Integration with webui-vue<br>
&gt; <br>
&gt; Thank you<br>
<br>
</blockquote></div>

--00000000000038c0bd05b13ed70e--
