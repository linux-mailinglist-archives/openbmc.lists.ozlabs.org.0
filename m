Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1C928917B
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 20:54:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7HLC3lsczDqZb
	for <lists+openbmc@lfdr.de>; Sat, 10 Oct 2020 05:54:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=suichen@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=EAUl0vLU; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7HKW2D3qzDqT6
 for <openbmc@lists.ozlabs.org>; Sat, 10 Oct 2020 05:53:48 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id a7so10656536lfk.9
 for <openbmc@lists.ozlabs.org>; Fri, 09 Oct 2020 11:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3DjRYzRNuPbFYPe7YpSJuV4SB2BL+dfJ6vfMxbfEuIc=;
 b=EAUl0vLUupf18fJO7q8pkztYYCMoEao7POzwFp2cS32c+Cj2cVEudK2JCKHdgBErlD
 wfygQ2opK+PuoGric6c4zBdBnVyKBwRx5uBNawAxOYZOIB15BLo3gGFyCLxoqlnHnIUG
 emMpnvP2XSyLI5VOHhCE2bc2UBF9IJWkAFxE64q7WBKlBzUu4m5kCjsSo8PZg+js0dOO
 pZib2j1MmH5O4t+MZzEJ/lkdnmj/xG/gKDfiNxtbdkwasxHz6sLBTu5PeoqgmGs4vPr8
 EafVohUIQOT+xhYEUH3Xz1e0B8CjI31IQnifp+8WHt3f+09LCH/eFDPJ82tM1F75QVYj
 WQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3DjRYzRNuPbFYPe7YpSJuV4SB2BL+dfJ6vfMxbfEuIc=;
 b=KUcwTt7CtWJwVCaLActhm5u7GxtgqXmV9b49fjgg49dNLiTnlbDJ0G6zugOa9rWzrA
 HSdGX7eZLnMHjJA/HpGIYMP3hqAhGzDknzYtL2rT/rxMvSkFHEN76NwaVelhJO2D5K95
 mhzKXamySvEyiLKFTt2qxrhtxhrfOSlNZtOgCvifRKiF9DtK2LV6cwfoYeGMkf+GluzJ
 OplrYmQDabcNT7yK6sYZ2p81lm+FuQ5SnV60RXeIs/LHUvp37BHzt5Re44B2wUKMi1SF
 VnXPZ07vNnpWLtz2DTpxtUX2fXYBQvAqJth3dDewdZWvI1rcniMoWfL67F3dE5LTG5HM
 XhpA==
X-Gm-Message-State: AOAM531WJ3+1PVSuITQFe173a8W5KfzJqbcvh68rBeoI9ufYF2/HprrU
 lcc4MsKKDV0H5L6/LQrLFh5RZaxhjDX7qnWwbKbuzw==
X-Google-Smtp-Source: ABdhPJxRToiVENDMlObMpyjcflVpCGQYKbWPf0esxKCiU64uuiW9c5rcoNgi+dOtf4EYJ0P1tvTxEiGzvgRnk/YTbVo=
X-Received: by 2002:a05:6512:c5:: with SMTP id
 c5mr4054044lfp.396.1602269622751; 
 Fri, 09 Oct 2020 11:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <CA+-TXo_C3pP=5zn+O7dtP4wHu9JwhubdUC6aqSMK_J742Cpkaw@mail.gmail.com>
 <CA+-TXo-4MCkDwKG2087pgZsqgezfxda6LUWOv5GCtLK5k=cjUQ@mail.gmail.com>
 <50E8C07A-985E-4645-91BF-5ADF7D1D40B4@gmail.com>
In-Reply-To: <50E8C07A-985E-4645-91BF-5ADF7D1D40B4@gmail.com>
From: Sui Chen <suichen@google.com>
Date: Fri, 9 Oct 2020 11:53:30 -0700
Message-ID: <CAJOps0uJih3hm7OpGaDC9MYoDB6kh0gHx_FdiEKN8h1BOu_x8w@mail.gmail.com>
Subject: Re: BMC Performance Profiler
To: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Pasha Ghabussi <pashag@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 9, 2020 at 7:38 AM Andrew Geissler <geissonator@gmail.com> wrot=
e:
>
>
>
> > On Oct 8, 2020, at 4:44 PM, Pasha Ghabussi <pashag@google.com> wrote:
> >
> > Hello all,
> >
> > We would really appreciate it if you can take a few minutes to read the=
 proposal sent earlier and let us know your thoughts and suggestions.
> >
> > Thank you
> >
> > On Mon, Oct 5, 2020 at 1:57 PM Pasha Ghabussi <pashag@google.com> wrote=
:
> > Hello all,
> > We would really appreciate it if you can take a few minutes to read the=
 following proposal and let us know your thoughts and suggestions.
> > We are developing a tool to investigate performance problems by looking=
 at DBus traffic dumps.
>
> I definitely think this could be a very useful tool. Performance issues h=
ave hindered us from day 1 with OpenBMC and countless hours have gone into =
trying to identify the different issues. One area we=E2=80=99ve seen a lot =
of issues with is on BMC startup, especially after a firmware update. If yo=
u could provide a way to enable the needed profiling debug, and then reboot=
 the BMC and capture the data for analysis, it would be appreciated.
>
> > Current DBus inspection and visualization tools do not represent the DB=
us events similar to a typical performance profiler. Additionally, these to=
ols do not address typical BMC workloads such as IPMI and ASIO. Hence, iden=
tifying potential performance problems requires inspecting the raw BMC DBus=
 traffic, which can become a long and complex process. We want to add a gra=
phical interface to webui-vue to visualize the DBus traffic to address the =
abovementioned problem.
>
> Will you be using something like "busctl capture=E2=80=9D to capture the =
data? I hope you don=E2=80=99t have to write a new tool to get the data?
>

We will be using "busctl capture" to capture the data and not writing
a new one, just like Pasha mentioned.

>
> >
> > There have been DBus and IPMI performance-related discussions in the Op=
enBMC community, both of which can be helped by this work: IPMI-related iss=
ues started to appear as early as in 2017. One issue (#2630) describes a pr=
oblem related to large numbers of sensors. Its follow-up (#3098) mentions =
=E2=80=9Chostboot crashes due to poor IPMI performance=E2=80=9D. Another is=
sue (#2519) describes a commonly-seen problem of IPMI taking very long to r=
espond (> 5s).
> > There are also discussions on RedFish performance on the mailing list; =
A patch optimized DBus performance by introducing a cache for name translat=
ion.
> > All the performance investigations listed above involve DBus and may be=
 helped by this work.
>
> Agreed
>
> >
> > We are planning to use the BMCweb file hosting functionality to access =
the DBus event dumps and visualize the events in the web UI. The available =
profiling tools such as dbus-pcap, Wireshark, Bustle, Snyh, or DFeet do not=
 provide the exact functionality we are looking for. Our goal is to develop=
 functionalities similar to other widely used profilers such as GPUView or =
VTune Profiler.
> >
>
> For the analysis and visualization side, I=E2=80=99m never a big fan of w=
riting something from scratch. Have you looked into enhancing some of the e=
xisting tools out there vs. writing your own?
>

One existing tool on the visualization side that resembles what we are
looking for is the ChromeDevTools performance profiler UI
(https://github.com/ChromeDevTools/devtools-frontend/tree/master/front_end/=
perf_ui),
in that it is capable of showing thousands of events in an interactive
way (allowing the user to pan/scale the time line and inspect
individual events). If we plug the debug UI to existing DBus-related
tools, we basically get something similar to the prototype (
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/34263 )
but a lot more polished.

The Perf UI mentioned above seems to have many dependencies and is
tightly integrated into Chrome so that we feel it might take less
effort to write a basic implementation from scratch (covering basic
functionalities such as timelines and histograms) than to integrate it
into existing tools. Actually, both the Perf UI and the rendering
routine in the prototype use the HTML canvas element for
visualization, which are typically hardware-accelerated and can render
many thousands of objects (basic shapes, images, text, etc) at
interactive frame rates. The visualization runs in the user's browser
and does not consume the BMC's processing power.

> Although having in the web UI could be useful, I don=E2=80=99t really see=
 it as a requirement. Could your tool be simpler to write or be made more g=
eneric for others to use if it was not tied to the web UI?
>

WebUI was considered for the following reasons: 1) web technologies,
in particular the hardware-accelerated HTML canvas, are convenient and
performant enough for the visualization we are looking for, and it
makes reusing the code in the prototype (which was also HTML based)
very easy; 2) accessing the BMC through WebUI saves the user the
trouble of having to manually start DBus capture and transfer the dump
file back to the host for doing visualization; 3) it might make it
easier to integrate this tool with future technologies such as
Redfish.

To untie the visualizer from the WebUI, there could be a few alternatives:
1) visualize the data using a text-based UI. In that case, the tool
would function similarly to tools like "top".
2) generate the visualization in SVG or HTML format similarly to FlameGraph=
.

In any case, the visualization part and the integrated performance
profiling experience would be our main contribution and is the extra
step we are taking on top of existing text-based tools like dbus-pcap
(which already parses dbus dumps and is being depended on by the
prototype.)

> > One alternative solution considered was to stream DBus requests over we=
bsocket, but the existing websocket endpoints available on BMC webserver do=
 not provide the exact information we need.
> >
> > Requirements and Scalability:
> >       =E2=80=A2 Should provide the adequate functionalities to filter, =
visualize the events timeline, and group the DBus traffic based on multiple=
 criteria such as type, source, destination, path, interface, demon signatu=
res, and more.
> >       =E2=80=A2 Should support capture of DBus messages using as little=
 resources as possible.
> >       =E2=80=A2 Should be able to show many (~thousands of) entries on =
screen simultaneously
> >       =E2=80=A2 Integration with webui-vue
> >
> > Thank you
>
