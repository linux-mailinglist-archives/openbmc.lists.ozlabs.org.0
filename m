Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC532730EE
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 19:38:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwBW03XbFzDqX8
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 03:38:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d36;
 helo=mail-io1-xd36.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PGWeB8ub; dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwBTL6gCGzDqnv
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 03:37:02 +1000 (AEST)
Received: by mail-io1-xd36.google.com with SMTP id g128so16293267iof.11
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 10:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=tAXCZGLJN5GZIYKUDTDG+tWc+HeheqhKoQZzX3skSic=;
 b=PGWeB8ubUAWsUmsukAmk2GLDRVR7coY2T/DSRX1SaJl+GE3Vor55ln1JW3ostPc6hM
 Hcl/3ijzlckHsKmvgkCxfysd7Sj24muI/K7Z2ZzStLT/c86azU897sI6NpqFEdcldNOC
 iaka6ftHDmJWSrDFFztrGS7MECLtu4ytUN0C+g1DE7fHrWqfoVmw6PVxuBgjdPBlKgV9
 RBYF7MMi5bq5qm7sE6qmE6iDN5Rj522yDgK8HoSt46i34Ltj07pHpUdOfcZogGZzZGg/
 rWnlVLgLn8JlYPUOUzaLaDSoMp1XDlDGjQoA3ygQ2/t+EQu2oJ8ukC00aj6jUB37vMPu
 RfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=tAXCZGLJN5GZIYKUDTDG+tWc+HeheqhKoQZzX3skSic=;
 b=ZooDWP6EHDPW/t5vkq2MJGokkIeNSIsC6/KAbaBeuNtWNc8nRq91MwGm+bXq9Kk1zz
 cSK7hyi9P67sx2OWft6a5xBZ8kbIuaQU0xLGo2NanBrR+Ob9GtBT4KLpE5RJBKz3cmRP
 mBKP3ZrtZ1cMGuZ9JiGh1nl+WM8glxKQ2uCOJpoQiz6FZ1lfxs+OVPMdfNa+hAxEzAdE
 1PNZn46yZYc91hlWHQantbaubinnfSuQi7vlHQT1HBkohemBy0haEUnQy/j/2/t0A7r4
 aZAHHMOauC4meO4lMYOSHGzCnNXaVjwVYacy0tw+5r2rjjDYiP8u1ESQayoQoGHDhdzm
 fBeg==
X-Gm-Message-State: AOAM532h4wM0kwxIKHPrjnHX1bTrVI2kWmArwTG/bDpHlirzaKGKzoHt
 sxHr9CYC01tavXlKwKBJfsudpyrNYjSTZicWmUEjJ4VyAV8=
X-Google-Smtp-Source: ABdhPJwR/S7AsdLOi4rPog48FFdjJieC9YaUEMOAMSgMU7qxBKLHOjf5Lxkj0/9Wx1xYxoPi221QdCUvo56PBN+lR6w=
X-Received: by 2002:a5e:dc08:: with SMTP id b8mr392455iok.13.1600709816699;
 Mon, 21 Sep 2020 10:36:56 -0700 (PDT)
MIME-Version: 1.0
From: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
Date: Mon, 21 Sep 2020 23:06:45 +0530
Message-ID: <CAMRErLMEn1bXQ9NB0h1zi6sy2ds5ckbm=fy9YFsQ=g_iXJ4GLg@mail.gmail.com>
Subject: Add multi-host support in phosphor-buttons
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000003507705afd64c83"
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
Cc: velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000003507705afd64c83
Content-Type: text/plain; charset="UTF-8"

Hi All,
         Our platform is based on the multi-host with one power(1 GPIO),
reset gpio(1 GPIO) and hand switch
(4 GPIO) connected to the base board(BMC). There are five positions that
can be calculated based
on hand switch selection for the power and uart control of all hosts in the
chassis based
on the hand switch position along with power and reset button press.

The below feature needs to be added as part of the multi-host
implementation in the obmc-phosphor-buttons.

 1. Simple power-button press to "on/off" the specific host based on the
selection key position.
 2. Simple reset-button press to "Reset" the specific host based on the
selection key position.
 3. Long power-button press to "Slot AC on/off" on specific host based on
the
    selection key position(triggers if Hand switch == host).
 4. Long power-button press to "Chassis System Reset"(triggers if Hand
switch == BMC).
 5. UART console(BMC & Four host) selection based on the selection key
position.

In addition to the baseboard GPIO control, we also use the removal debug
card for
host selection button which is virtually mapped to the baseboard Hand
switch(4 GPIO) to
act as a host selector on each button press in the debug card.

The OCP Debug card details can be found in below,

https://www.opencompute.org/documents/facebook-ocp-debug-card-with-lcd-spec_v1p0

Please let me know your valuable comments.


Thanks

--00000000000003507705afd64c83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Our platform is based on the multi-host with one power(1 GPIO), reset g=
pio(1 GPIO) and hand switch <br>(4 GPIO) connected to the base board(BMC). =
There are five positions that can be calculated based <br>on hand switch se=
lection for the power and uart control of all hosts in the chassis based <b=
r>on the hand switch position along with power and reset button press.<br><=
br>The below feature needs to be added as part of the multi-host <br>implem=
entation in the obmc-phosphor-buttons.<br><br>=C2=A01. Simple power-button =
press to &quot;on/off&quot; the specific host based on the selection key po=
sition.<br>=C2=A02. Simple reset-button press to &quot;Reset&quot; the spec=
ific host based on the selection key position.<br>=C2=A03. Long power-butto=
n press to &quot;Slot AC on/off&quot; on specific host based on the <br>=C2=
=A0 =C2=A0 selection key position(triggers if Hand switch =3D=3D host).<br>=
=C2=A04. Long power-button press to &quot;Chassis System Reset&quot;(trigge=
rs if Hand switch =3D=3D BMC).<br>=C2=A05. UART console(BMC &amp; Four host=
) selection based on the selection key position.<br><br>In addition to the =
baseboard GPIO control, we also use the removal debug card for <br>host sel=
ection button which is virtually mapped to the baseboard Hand switch(4 GPIO=
) to <br>act as a host selector on each button press in the debug card.<br>=
<br>The OCP Debug card details can be found in below,<br><div>=C2=A0 <a hre=
f=3D"https://www.opencompute.org/documents/facebook-ocp-debug-card-with-lcd=
-spec_v1p0">https://www.opencompute.org/documents/facebook-ocp-debug-card-w=
ith-lcd-spec_v1p0</a></div><br>Please let me know your valuable comments.<b=
r><br><br>Thanks<br></div>

--00000000000003507705afd64c83--
