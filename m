Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 927B26F4E3A
	for <lists+openbmc@lfdr.de>; Wed,  3 May 2023 02:49:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9yyF3c3vz3cKb
	for <lists+openbmc@lfdr.de>; Wed,  3 May 2023 10:49:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20221208.gappssmtp.com header.i=@tanous-net.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=JujVfidw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20221208.gappssmtp.com header.i=@tanous-net.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=JujVfidw;
	dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9yxh1R18z3bbZ
	for <openbmc@lists.ozlabs.org>; Wed,  3 May 2023 10:48:53 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3063afa2372so1012074f8f.0
        for <openbmc@lists.ozlabs.org>; Tue, 02 May 2023 17:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20221208.gappssmtp.com; s=20221208; t=1683074927; x=1685666927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E12FHGsVRXs+h/zVKpX0oFVC/9F2Hy2ImI9uupy3tKc=;
        b=JujVfidwRKHX9e2XZLEr/KiJZGQxAVCuDkLCEv3TiIh5wqavuHGb7/4ySHfQqA6K67
         /H1bb6mTO9cBwVAt8sZe7iJAAJYgj8cSB+4D92K5XiYn3Ml/HfHzCqMod0k84oRNrg5C
         R8zr3WPPSp5StQMpVZ3Bk5c4W6/2rct4F6smkegPPbGdQLofi3duAbkDh0oN5qeEvOTZ
         m0fLRWFlP8ECcm1vz4fYA0+ATM0m9+0jN2L/o52eVg8MWo043AIDzx+RgkeMcP4hy7xw
         bQvLX+PLgW9WQEDJvh5IS4viQmm5WRcwst4uTUQmV/gth98A6AT+DhjdBgpcpQaZmiAm
         4How==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683074927; x=1685666927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E12FHGsVRXs+h/zVKpX0oFVC/9F2Hy2ImI9uupy3tKc=;
        b=ZHGMjcicb8+dIYkEzd1ixrBf8WBni/WkZZmpWDpueyEdBotyvYRuTK7Mk2RVzy1rbQ
         YFJOYk9DsqeczR+KEgn6zGyAQmcYN59t0SvlhLBOd42pnlXW5wAZ83JyK33QzVvz6Wle
         evOpi8jhBL770IxoGTxB4tLbFmBr9HnE9tM7/EJroBrZzfTA+X+LopHa+zN5NebzF98d
         sgjYtJr9YtfOqy+oCnhtkQmz3/tc+vXSQf6rnGtMR06Dk7+a2D0VUtsqKXvCTtG65s6E
         Q2TGgNvnYPDxViBx9dTkv2FFFGI0PeBsWcexpphyGPGYZoFG2hhbftuFgNKG8sbOmV+0
         9xNg==
X-Gm-Message-State: AC+VfDw2e2Nh5dsmvMpfzJRWm2N/oCB/y6IWk1lFNqZy4iPJFw8Byvjv
	d4FQ+RuG5P9i6nCaRrCW4j+HIq7IhSkMx6aFLOkRGg==
X-Google-Smtp-Source: ACHHUZ6pv2fPsddrYNBIbSR/jZDvLCubDs08PXVUGy6iausnEQtORPa42TtMZlz1UsUsd1+wLLl07zsFO5TO4BGY754=
X-Received: by 2002:adf:e54c:0:b0:2fa:a4b5:6b8 with SMTP id
 z12-20020adfe54c000000b002faa4b506b8mr13033508wrm.27.1683074926482; Tue, 02
 May 2023 17:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <0992ABFC-7CD8-4E4E-8731-167E59C8A9F7@gmail.com>
In-Reply-To: <0992ABFC-7CD8-4E4E-8731-167E59C8A9F7@gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 2 May 2023 17:48:35 -0700
Message-ID: <CACWQX81Tg+22k=bwniGG4Brvj5uENM_ZXOg5B=9fOCKMfKKyLw@mail.gmail.com>
Subject: Re: Preventing a system power on before BMC Ready
To: Andrew Geissler <geissonator@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001fa96e05fabf6b21"
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000001fa96e05fabf6b21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 2, 2023 at 1:49=E2=80=AFPM Andrew Geissler <geissonator@gmail.c=
om>
wrote:
>
> About once a month a bug arrives internally where someone has powered on
the
> host without waiting for the BMC to reach its Ready state. Our systems
for a
> variety of reasons require the BMC to be at Ready before initiating a
system
> power on.
>
> The defects are usually returned as user error in that users are supposed
to
> know to wait. Our Redfish clients (including the web UI) know to not
allow a
> power on operation until Ready. Recently however we had a bug where our
external
> Redfish client allowed a power on before Ready. That client is event
driven once
> connected to the BMC and because they never got an event about an
unexpected BMC
> reboot, they allowed a power on before Ready when the BMC came back up.
Granted
> there is only about a 30s window where we have a problem here, but as we
all
> know, when there's a window, someone finds it.
>
> That got us brainstorming about some possible solutions:
> - Write some code in bmcweb to send a =E2=80=9Cbmc state change event=E2=
=80=9D anytime
bmcweb
>   comes up to ensure listening clients know =E2=80=9Csomething=E2=80=9D h=
as happened
> - Add an optional compile option to bmcweb (or PSM/x86-power-control) to
require
>   BMC Ready before issuing chassis or system POST requests (return error
if not
>   at Ready)

PSM or x86-power-control mods would be my preference.  bmcweb should not be
in charge of business logic.  If the system shouldn't allow power on while
the bmc is in ready state, then the daemons that handle power on need to
have that as a constraint, otherwise you'd have the same problem if a user
tried from IPMI.

> - Queue up the power on request and execute it once we reach BMC Ready
(not sure
>   what type of response that would be to Redfish clients or what error
path
>   looks like if we never reach Ready?)

Redfish has async tasks for this exact use case, and we already have code
to do them.  Alternatively you could just return an error that the
operation is not possible, along with a retry-after header instructing the
user when to retry their request.  We do this in the few update apis
already.

> - Find a way in the client to better detect an unexpected bmc reboot
(heartbeat
>   of some sort)
> - Push bmcweb further in the startup to BMC Ready, ensuring clients can't
talk
>   to the BMC until it's near Ready state

For your use case, if this is possible, that=E2=80=99s probably easiest and=
 most
client friendly, so long as you can handle the case where the bmc never
hits =E2=80=9Cready=E2=80=9D

>
> Thoughts?
> Andrew
--=20
-Ed

--0000000000001fa96e05fabf6b21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br>
<br>
On Tue, May 2, 2023 at 1:49=E2=80=AFPM Andrew Geissler &lt;<a href=3D"mailt=
o:geissonator@gmail.com" target=3D"_blank">geissonator@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; About once a month a bug arrives internally where someone has powered =
on the<br>
&gt; host without waiting for the BMC to reach its Ready state. Our systems=
 for a<br>
&gt; variety of reasons require the BMC to be at Ready before initiating a =
system<br>
&gt; power on.<br>
&gt;<br>
&gt; The defects are usually returned as user error in that users are suppo=
sed to<br>
&gt; know to wait. Our Redfish clients (including the web UI) know to not a=
llow a<br>
&gt; power on operation until Ready. Recently however we had a bug where ou=
r external<br>
&gt; Redfish client allowed a power on before Ready. That client is event d=
riven once<br>
&gt; connected to the BMC and because they never got an event about an unex=
pected BMC<br>
&gt; reboot, they allowed a power on before Ready when the BMC came back up=
. Granted<br>
&gt; there is only about a 30s window where we have a problem here, but as =
we all<br>
&gt; know, when there&#39;s a window, someone finds it.<br>
&gt;<br>
&gt; That got us brainstorming about some possible solutions:<br>
&gt; - Write some code in bmcweb to send a =E2=80=9Cbmc state change event=
=E2=80=9D anytime bmcweb<br>
&gt;=C2=A0 =C2=A0comes up to ensure listening clients know =E2=80=9Csomethi=
ng=E2=80=9D has happened<br>
&gt; - Add an optional compile option to bmcweb (or PSM/x86-power-control) =
to require<br>
&gt;=C2=A0 =C2=A0BMC Ready before issuing chassis or system POST requests (=
return error if not<br>
&gt;=C2=A0 =C2=A0at Ready)<br>
<br></div><div>
PSM or x86-power-control mods would be my preference.=C2=A0 bmcweb should n=
ot be in charge of business logic.=C2=A0 If the system shouldn&#39;t allow =
power on while the bmc is in ready state, then the daemons that handle powe=
r on need to have that as a constraint, otherwise you&#39;d have the same p=
roblem if a user tried from IPMI.</div><div><br>
&gt; - Queue up the power on request and execute it once we reach BMC Ready=
 (not sure<br>
&gt;=C2=A0 =C2=A0what type of response that would be to Redfish clients or =
what error path<br>
&gt;=C2=A0 =C2=A0looks like if we never reach Ready?)</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Redfish has async tasks for this exact use ca=
se, and we already have code to do them.=C2=A0 Alternatively you could just=
 return an error that the operation is not possible, along with a retry-aft=
er header instructing the user when to retry their request.=C2=A0 We do thi=
s in the few update apis already.</div><div dir=3D"auto"><br>
&gt; - Find a way in the client to better detect an unexpected bmc reboot (=
heartbeat<br>
&gt;=C2=A0 =C2=A0of some sort)<br>
&gt; - Push bmcweb further in the startup to BMC Ready, ensuring clients ca=
n&#39;t talk<br>
&gt;=C2=A0 =C2=A0to the BMC until it&#39;s near Ready state</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">For your use case, if this is possibl=
e, that=E2=80=99s probably easiest and most client friendly, so long as you=
 can handle the case where the bmc never hits =E2=80=9Cready=E2=80=9D</div>=
<div dir=3D"auto"><br>
&gt;<br>
&gt; Thoughts?<br>
&gt; Andrew<br>
</div><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">-Ed</div></div>

--0000000000001fa96e05fabf6b21--
