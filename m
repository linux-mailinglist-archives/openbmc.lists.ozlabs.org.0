Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 422313AA13E
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 18:27:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4rDq6BJFz3bsQ
	for <lists+openbmc@lfdr.de>; Thu, 17 Jun 2021 02:27:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=UoLEPBGT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::329;
 helo=mail-wm1-x329.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=UoLEPBGT; dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4rDW2lM0z2yxS
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jun 2021 02:26:49 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id m3so1618675wms.4
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jun 2021 09:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jS3Gyot3c00V4OsdAk9brdEzOQOCIA/WjT6VGM+PIBI=;
 b=UoLEPBGTs3kzWq/WVHcwB1Eda/s7iGesBgTsjG/sv+sHUQxx971ga/Xbs+/Af+0PP5
 4+F39uFFOI+nF2B0nvGbFQ/4lWJuET2S1R0cGdzlmTdWC/2rOUBfwjQKK3FrcIy2jIFX
 h2mQAo9wFVuVBYDf4bbK/cxyo9EGxruqQShq7S1aG3csB17m4wcJD05B3hSczEc1rg35
 QIl+Q0nQecWOsy1H4gOhF1wy/KNK4f36DpAPnpB32gJ0ycM4hH++kEKFE4zcsAyqBC+A
 txYQ+Yh9f+QmVfhug5u/dGsHsPwuJ/hDSKwZSXwdhEQmBEX2d766V0ypmVBeq4kct6lF
 RtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jS3Gyot3c00V4OsdAk9brdEzOQOCIA/WjT6VGM+PIBI=;
 b=E5fyldUZb8oYgTo/7J4iLOlwrGyltFG8FvHISXvp9mS8A4fpeKYsUUQIwhYQeFcFcS
 3j51LBq2JjEkxQDDEu3kq9P/YVwhXvgNDzwUgPnj8ZG7cRLyO1Yk1SIUeVgEWf7mOlRU
 6W6h45RikQZGfa3s1j4J9tEnHKAMEHjnqjGH9RDbbKM0WvsaD6NCPgxN8pop3R84hYpK
 jut3bQHE8l+dsKghmVRzUlzV14Hzn9pT2UwEKm1HLDGcToTUMF9sQFtkaVYC0WmCTree
 taBdz0J4qDKF9Y9lN4GbhcuZnv3QQJlcpBNAOaJ62aevewxo7RFlQ3NJvKCIH27ThSQS
 q+qA==
X-Gm-Message-State: AOAM532AqYTztHXCU0ZNwS8+uzSOqPfDRBbdl67A71o3owDIPOLw4IBM
 JZL2Cg7+LE5MtRTGx6KRtJ9ZKcyPYBenlU4wD4NrUpG0g1c=
X-Google-Smtp-Source: ABdhPJzmD3izTUS7qDBMWSmT6FxYzWWhxXvxyOLsOpr0d4UUHYiDX+At03B+sAGbERKSM8HYXnPdI8wVdkuZWCzU+ug=
X-Received: by 2002:a1c:4e12:: with SMTP id g18mr12227513wmh.101.1623860800535; 
 Wed, 16 Jun 2021 09:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <f8e08249-d0e4-d632-c76b-495b8ce968d2@linux.alibaba.com>
In-Reply-To: <f8e08249-d0e4-d632-c76b-495b8ce968d2@linux.alibaba.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 16 Jun 2021 09:26:24 -0700
Message-ID: <CAH2-KxBJkBA1G6J5iMJ8nPEaX6qbO0qQGQ4ujhZ-TrZPjAS7oQ@mail.gmail.com>
Subject: Re: Does it make sense to create a centralized fan control module?
To: Heyi Guo <guoheyi@linux.alibaba.com>
Content-Type: multipart/alternative; boundary="0000000000002ee15805c4e48e13"
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002ee15805c4e48e13
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 10, 2021 at 6:19 PM Heyi Guo <guoheyi@linux.alibaba.com> wrote:

> Hi All,
>
> Right now fan related data like tacho and PWM is fetched in
> dbus-sensors, and published to d-bus as sensor data, while fan control
> is made in another module like pid-control, which can fetch data and set
> value via d-bus.
>
> In some common sense, we may think about putting all fan related work
> into one single module (which may be based on pid-control), i.e. it can
> read tacho and PWM from hardware directly, calculate the required PWM by
> some algorithm like PID, and then write to PWM hardware directly; the
> data will also be published to d-bus for other modules to consume, like
> fansensor from dbus-sensors.
>

To some extent, this design revolves around flexibility.  Fans aren't
necessarily tacho devices, and sensors aren't necessarily hwmon devices, so
dbus is used as an abstraction to be able to make them all look the same.
For example, an NCSI NIC might have both a temperature and a fan that
phosphor-pid-control might want to control, but we don't want
phosphor-pid-control to take a dependency on NCSI.  While we could put all
code for all possible sensor types into one daemon, that opens us up to the
possibility that crashes could take down all of fan and thermal control,
including the failsafe behavior.  That would be an issue.

It might be possible to handle these issues in a single daemon, but I
haven't really seen a design that covered all the cases;  Most
implementations tend to take the simple approach (hwmon sensor + tacho
device) and ignore the more complex setups.


>
> Does it make sense to do that? Or is there any reason for the current
> design?
>
> I'm new to OpenBMC and some of my understanding may be totally wrong.
>
> Looking forward to your expert advice.
>
> Thanks,
>
> Heyi
>
>

--0000000000002ee15805c4e48e13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 10, 2021 at 6:19 PM Heyi =
Guo &lt;<a href=3D"mailto:guoheyi@linux.alibaba.com">guoheyi@linux.alibaba.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Hi All,<br>
<br>
Right now fan related data like tacho and PWM is fetched in <br>
dbus-sensors, and published to d-bus as sensor data, while fan control <br>
is made in another module like pid-control, which can fetch data and set <b=
r>
value via d-bus.<br>
<br>
In some common sense, we may think about putting all fan related work <br>
into one single module (which may be based on pid-control), i.e. it can <br=
>
read tacho and PWM from hardware directly, calculate the required PWM by <b=
r>
some algorithm like PID, and then write to PWM hardware directly; the <br>
data will also be published to d-bus for other modules to consume, like <br=
>
fansensor from dbus-sensors.<br></blockquote><div><br></div><div>To some ex=
tent, this design revolves around flexibility.=C2=A0 Fans aren&#39;t necess=
arily=C2=A0tacho devices, and sensors aren&#39;t necessarily=C2=A0hwmon dev=
ices, so dbus is used as an abstraction to be able to make them all look th=
e same.=C2=A0 For example, an NCSI NIC might have both a temperature and a =
fan that phosphor-pid-control might want to control, but we don&#39;t want =
phosphor-pid-control to take a dependency on NCSI.=C2=A0 While=C2=A0we coul=
d put all code for all possible sensor types into one daemon, that opens us=
 up to the possibility that crashes could take down all of fan=C2=A0and the=
rmal control, including the failsafe behavior.=C2=A0 That would be an issue=
.</div><div><br></div><div>It might be possible to handle these issues in a=
 single daemon, but I haven&#39;t really seen a design that covered all the=
 cases;=C2=A0 Most implementations tend to take the simple approach (hwmon =
sensor=C2=A0+ tacho device) and ignore the more complex setups.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Does it make sense to do that? Or is there any reason for the current <br>
design?<br>
<br>
I&#39;m new to OpenBMC and some of my understanding may be totally wrong.<b=
r>
<br>
Looking forward to your expert advice.<br>
<br>
Thanks,<br>
<br>
Heyi<br>
<br>
</blockquote></div></div>

--0000000000002ee15805c4e48e13--
