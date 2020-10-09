Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD93288B93
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 16:38:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C79g81jXJzDqDQ
	for <lists+openbmc@lfdr.de>; Sat, 10 Oct 2020 01:38:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fbtg+MeW; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C79dh5WlvzDqbk
 for <openbmc@lists.ozlabs.org>; Sat, 10 Oct 2020 01:37:26 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id 60so9191776otw.3
 for <openbmc@lists.ozlabs.org>; Fri, 09 Oct 2020 07:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=B+WQCBoXdG0O3Fw+7xDtVNlbQhRaqfn48MrbgzNlqc0=;
 b=fbtg+MeW4nzjrGwWKvYomcJeb7y+2Jb07npMMGr3o/K+F+c2ANhLoezIQEY2HnUT0E
 TUI3y35RPAsIGdKlG0e551fDLB1gdNv/odfVqACuKl5iLP7IisyGBKWa8Mm6EvMhHfEQ
 bqV7rzOvkRcBSQDCcj4efe0czkw9rmqtakf4R8U9HjOB/0wlh84HzVXlmmMqkiWfjlYc
 ps5tIZ6rU2FxaxI7s6Uy6Nf4TbKjzIgvT18dnYEYZEgfE8r2Ndk/UiZW7+Y8ITMVou+D
 H6P+OV+falB59joJ6+R4qb0JNzEcnavknpJcjy3ObGoIHpWLgeczhZs7Gp/a8Vvx0I8r
 F7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=B+WQCBoXdG0O3Fw+7xDtVNlbQhRaqfn48MrbgzNlqc0=;
 b=QYb3nGU7noTba4ho3HeGMoaJU7Az+Y4uyfWaaKX7MochF85Vp0YeOG9fTSvO7f+j/3
 Ss0Q0OyFIlGYqT254UAZLefLaBTDMIjQmNzNOvgfBdCmQjFNGKzMDhZYQHNG3XjK1E3E
 WJYN23X0iQJHv1+E3LcaF04MFGDh6UC/sr8s8z8epGnUrNLT889pBwDlnyRVirqhnfNB
 lbxV3mV2kQBKN3h1+xL2XVmoXlD1OLY5l39bauaj2lltLDrfYazkzlNBfCV1jJ9VVRMO
 sDEwh0RATxC499z4ObiGAUkRCUUJbUpXRI5ZNqXyJbNSwV7yQ3Oipas6kNdhJwWpqpBT
 754w==
X-Gm-Message-State: AOAM530HPSRtuUJEmKUJ3kKUvy/Fd9WdHGTMoVq3FLIgAG9PgTSMcXPu
 UEMt2sRKbZ+gpq4uucgRy7ikWxe4uJz7oQ==
X-Google-Smtp-Source: ABdhPJxj8cH2Jz6zB4C3a2RZzgEfzpexAAdh9bezL5LpWRouLaPW6IqUZkQkl+OiHVd3AluFllGsHA==
X-Received: by 2002:a9d:6d95:: with SMTP id x21mr9335621otp.339.1602254242716; 
 Fri, 09 Oct 2020 07:37:22 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
 by smtp.gmail.com with ESMTPSA id k22sm1071850oih.24.2020.10.09.07.37.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Oct 2020 07:37:22 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: BMC Performance Profiler
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <CA+-TXo-4MCkDwKG2087pgZsqgezfxda6LUWOv5GCtLK5k=cjUQ@mail.gmail.com>
Date: Fri, 9 Oct 2020 09:37:21 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <50E8C07A-985E-4645-91BF-5ADF7D1D40B4@gmail.com>
References: <CA+-TXo_C3pP=5zn+O7dtP4wHu9JwhubdUC6aqSMK_J742Cpkaw@mail.gmail.com>
 <CA+-TXo-4MCkDwKG2087pgZsqgezfxda6LUWOv5GCtLK5k=cjUQ@mail.gmail.com>
To: Pasha Ghabussi <pashag@google.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
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



> On Oct 8, 2020, at 4:44 PM, Pasha Ghabussi <pashag@google.com> wrote:
>=20
> Hello all,
>=20
> We would really appreciate it if you can take a few minutes to read =
the proposal sent earlier and let us know your thoughts and suggestions.
>=20
> Thank you
>=20
> On Mon, Oct 5, 2020 at 1:57 PM Pasha Ghabussi <pashag@google.com> =
wrote:
> Hello all,
> We would really appreciate it if you can take a few minutes to read =
the following proposal and let us know your thoughts and suggestions.
> We are developing a tool to investigate performance problems by =
looking at DBus traffic dumps.

I definitely think this could be a very useful tool. Performance issues =
have hindered us from day 1 with OpenBMC and countless hours have gone =
into trying to identify the different issues. One area we=E2=80=99ve =
seen a lot of issues with is on BMC startup, especially after a firmware =
update. If you could provide a way to enable the needed profiling debug, =
and then reboot the BMC and capture the data for analysis, it would be =
appreciated.

> Current DBus inspection and visualization tools do not represent the =
DBus events similar to a typical performance profiler. Additionally, =
these tools do not address typical BMC workloads such as IPMI and ASIO. =
Hence, identifying potential performance problems requires inspecting =
the raw BMC DBus traffic, which can become a long and complex process. =
We want to add a graphical interface to webui-vue to visualize the DBus =
traffic to address the abovementioned problem.

Will you be using something like "busctl capture=E2=80=9D to capture the =
data? I hope you don=E2=80=99t have to write a new tool to get the data?=20=



>=20
> There have been DBus and IPMI performance-related discussions in the =
OpenBMC community, both of which can be helped by this work: =
IPMI-related issues started to appear as early as in 2017. One issue =
(#2630) describes a problem related to large numbers of sensors. Its =
follow-up (#3098) mentions =E2=80=9Chostboot crashes due to poor IPMI =
performance=E2=80=9D. Another issue (#2519) describes a commonly-seen =
problem of IPMI taking very long to respond (> 5s).
> There are also discussions on RedFish performance on the mailing list; =
A patch optimized DBus performance by introducing a cache for name =
translation.
> All the performance investigations listed above involve DBus and may =
be helped by this work.

Agreed

>=20
> We are planning to use the BMCweb file hosting functionality to access =
the DBus event dumps and visualize the events in the web UI. The =
available profiling tools such as dbus-pcap, Wireshark, Bustle, Snyh, or =
DFeet do not provide the exact functionality we are looking for. Our =
goal is to develop functionalities similar to other widely used =
profilers such as GPUView or VTune Profiler.
>=20

For the analysis and visualization side, I=E2=80=99m never a big fan of =
writing something from scratch. Have you looked into enhancing some of =
the existing tools out there vs. writing your own?

Although having in the web UI could be useful, I don=E2=80=99t really =
see it as a requirement. Could your tool be simpler to write or be made =
more generic for others to use if it was not tied to the web UI?

> One alternative solution considered was to stream DBus requests over =
websocket, but the existing websocket endpoints available on BMC =
webserver do not provide the exact information we need.
>=20
> Requirements and Scalability:
> 	=E2=80=A2 Should provide the adequate functionalities to filter, =
visualize the events timeline, and group the DBus traffic based on =
multiple criteria such as type, source, destination, path, interface, =
demon signatures, and more.
> 	=E2=80=A2 Should support capture of DBus messages using as =
little resources as possible.
> 	=E2=80=A2 Should be able to show many (~thousands of) entries on =
screen simultaneously
> 	=E2=80=A2 Integration with webui-vue
>=20
> Thank you

