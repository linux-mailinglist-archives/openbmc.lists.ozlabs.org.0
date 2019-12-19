Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE901263C0
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 14:39:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dtKP4XspzDqrm
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 00:39:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=embeddedsteve@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="g/RvVPGK"; 
 dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dtH61XFJzDqC5
 for <openbmc@lists.ozlabs.org>; Fri, 20 Dec 2019 00:37:53 +1100 (AEDT)
Received: by mail-oi1-x22b.google.com with SMTP id d62so2689636oia.11
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 05:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+tTFI+JkZvOJ+zcMBOgMw/dgUYdcfTHPoBJ6JuyuyEo=;
 b=g/RvVPGKmcGVC1R8SIVjRVZynD+8h6Ck5GdJBNM9+1HY+cQpJPe5daUHus4StrLAC2
 Ndf8GurXF0HkrrUkxcWqoetGRgh2hXSZNk3aQifhH7ABt1bM1dGKiE/xNIFo5/2XsmpP
 dbI+C+qLjB3AMxfLU5gmzqbNsw1YrNIWKOPbxMOO8RhsgRozkrqpWkAz7BSTyV7HKkEY
 JsnR7IEnerun2t6+MAlbva0GMgxiIwgQvCTKrUjgSlAQxRzY1ffTSSR2HC5iz57XtcPd
 RqKqF9EXSAkTWUcMuSuLoemQZCkmP1dQONP2JOrPc63Xzt3ZpQ2wqGhuKyiWSN3IOjRX
 OHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+tTFI+JkZvOJ+zcMBOgMw/dgUYdcfTHPoBJ6JuyuyEo=;
 b=A1qxL89R+5WO3laLtFBVOaq32nVc7kR9qZ0szGE/oCF0/Aq19t5Bpszzdj2Og8epAy
 hm00ARdN4UAKbVli0WWaSoe3ZnvvWbLQvlrrnNz6iiUuDwWLbqBal4xkVOxh1d2Aq/17
 Mn4GOlseJHOvvsyvFh8HJqJp+cTmhxOTUxWjl0/QbftkvFlN1REOLNg45R1iM0eMCSsP
 OqQVB4jds+jDBUbFcFoj/1W93G0uFzJC8HvG+X7AK2ekyWDDV20CxHjw90t74JL7oghZ
 /2t7Qc/oEfQQoPsBaND6bCZxEJRHetA0RYRUMnnWUH9FVg0UBh0MN2oKjXkPKzon2CgL
 0srg==
X-Gm-Message-State: APjAAAVcHR+xJRW/6IByVUnc8x7gUa8B7EV5JzOZlTopHA1gdzpsQVIn
 yKeiDtmrqXgdvB/Y2wD4Bul3jzCjgvYw+m6w+70=
X-Google-Smtp-Source: APXvYqz/QHcMnqFxVFO4/05h6SHBCpt+SWPEu5ZYRAuuL+sfSjDULaKm2xfWATspmSdsKCSYklpO3d8qvK8SmRHePiE=
X-Received: by 2002:aca:ed81:: with SMTP id l123mr2221020oih.129.1576762669726; 
 Thu, 19 Dec 2019 05:37:49 -0800 (PST)
MIME-Version: 1.0
References: <tencent_0139807C40A9C767A1F947C84B4CD99FE80A@qq.com>
In-Reply-To: <tencent_0139807C40A9C767A1F947C84B4CD99FE80A@qq.com>
From: Stephen Beckwith <embeddedsteve@gmail.com>
Date: Thu, 19 Dec 2019 08:37:38 -0500
Message-ID: <CAN34foyoxNYP=wzB5mbVKkjk+m5RujdaF7UoMuBxDUZ2uTkDPw@mail.gmail.com>
Subject: Re: how the openbmc running in qemu communicate with the operating
 system running in another qemu via KCS/BT?
To: =?UTF-8?B?5Y2X6YeO44Og44Or44K344Ko44Op44K0?= <1181052146@qq.com>
Content-Type: multipart/alternative; boundary="000000000000d2ff55059a0eaae3"
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

--000000000000d2ff55059a0eaae3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lui Hongwei;
   Here is how we handled our initial setup for OpenBMC:
1) all of this runs in a single VirtualMachine on a Host System (an Apple
Macbook in my case) - the VM is running an ubuntu 18.04 LTS OS.
2) Within this VM:
a) Build the OpenBMC image for AST2500
b) You will need to rebuild from downloaded source the QEMU version 4.1.0
to run the AST2500.  The "stock" version that is delivered with Ubuntu
18.03 is 2.11, and does not work.   Rebuild this and keep a copy to
re-install as necessary.
c) you will also need to install ipmitool on this system.
3)  In Terminal Window 1:   Use this command to run the image:
qemu-system-arm \
-machine ast2500-evb \
-m 256 \
-nographic \
-drive file=3Dobmc-phosphor-image-evb-ast2500.static.mtd,format=3Draw,if=3D=
mtd \
-net nic \
-net user,hostfwd=3D:127.0.0.1:2222-:22,hostfwd=3D:127.0.0.1:2443
-:443,hostfwd=3Dudp:127.0.0.1:2623-:623,hostname=3Dqemu
3) In Terminal Window 2:  You can run the ipmitool to talk to the AST2500
BMC image:
ipmitool -H 127.0.0.1 -I lanplus -p 2623  -U root -P 0penBmc chassis power
status
Chassis Power is off

IPMI "raw" commands also work:
ipmitool -H 127.0.0.1 -I lanplus -p 2623  -U root -P 0penBmc raw 0x00 0x0f
 3c 00 00 00 00

Hope this helps.
Regards,
Stephen Beckwith




On Thu, Dec 19, 2019 at 3:26 AM =E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=
=B7=E3=82=A8=E3=83=A9=E3=82=B4 <1181052146@qq.com> wrote:

> Greetings!
>
> I am a learner of openbmc, for some reason I do not have a real BMC nor a
> real server, I run openbmc in qemu. Recentlly I want to learn how BMC
> communicate with HOST System. But it seems qemu can not emulate this
> scenario.
> Can someone help tell me:
> Is there a mechanism allow me to run openbmc in qemu1 and at the same tim=
e
> run OS in qemu2. And let qemu1 run as the qemu2's BMC hardware and
> communicate via KCS or BT interface? Like the following sequence:
> [qemu1  [openbmc  [bt-bmc]]]<------LPC-------->|-----system
> IPC-----|<------LPC-------->[[[ipmi_si]  host]  qemu2]
> And what can I do?
> I have seen there is some code in qemu source code:
> qemu/hw/ipmi/*
> and in linux-5.3 source code:
> drivers/char/ipmi/*
> Dose this can help mitigate my problem?
>
> Best Regards!
> Liu Hongwei
>

--000000000000d2ff55059a0eaae3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Lui Hongwei;</div><div>=C2=A0=C2=A0 Here is how we ha=
ndled our initial setup for OpenBMC:</div><div>1) all of this runs in a sin=
gle VirtualMachine on a Host System (an Apple Macbook in my case) - the VM =
is running an ubuntu 18.04 LTS OS.</div><div>2) Within this VM:</div><div>a=
) Build the OpenBMC image for AST2500</div><div>b) You will need to rebuild=
 from downloaded source the QEMU version 4.1.0 to run the AST2500.=C2=A0 Th=
e &quot;stock&quot; version that is delivered with Ubuntu 18.03 is 2.11, an=
d does not work.=C2=A0=C2=A0 Rebuild this and keep a copy to re-install as =
necessary.</div><div>c) you will also need to install ipmitool on this syst=
em.<br></div><div>3)=C2=A0 In Terminal Window 1:=C2=A0=C2=A0 Use this comma=
nd to run the image:</div><div><span style=3D"font-family:monospace">qemu-s=
ystem-arm \<br></span>-machine ast2500-evb \<br>-m 256 \<br>-nographic \<br=
>-drive file=3Dobmc-phosphor-image-evb-ast2500.static.mtd,format=3Draw,if=
=3Dmtd \<br>-net nic \<br>-net user,hostfwd=3D:127.0.0.1:2222-:22,hostfwd=
=3D:127.0.0.1:2443-:443,hostfwd=3Dudp:127.0.0.1:2623-:623,hostname=3Dqemu <=
br></div><div>3) In Terminal Window 2:=C2=A0 You can run the ipmitool to ta=
lk to the AST2500 BMC image:</div><div><span style=3D"font-family:monospace=
">ipmitool -H 127.0.0.1 -I lanplus -p 2623 =C2=A0-U root -P 0penBmc chassis=
 power status<br>Chassis Power is off</span></div><div><br></div><div>IPMI =
&quot;raw&quot; commands also work:</div><div>i<span style=3D"font-family:m=
onospace">pmitool -H 127.0.0.1 -I lanplus -p 2623 =C2=A0-U root -P 0penBmc =
raw 0x00 0x0f<br>=C2=A03c 00 00 00 00</span></div><div><br></div><div>Hope =
this helps.</div><div>Regards,</div><div>Stephen Beckwith<br></div><div><br=
></div><div><br></div><div><br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 19, 2019 at 3:26 AM =E5=8D=
=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=B7=E3=82=A8=E3=83=A9=E3=82=B4 &lt;<a h=
ref=3D"mailto:1181052146@qq.com">1181052146@qq.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div>Greetings!</div><div=
><br></div><div>I am a learner of openbmc, for some reason I do not have a =
real BMC nor a real server, I run openbmc in qemu. Recentlly I want to lear=
n how BMC communicate with HOST System. But it seems qemu can not emulate t=
his scenario.=C2=A0</div><div>Can someone help tell me:</div><div>Is there =
a mechanism allow me to run openbmc in qemu1 and at the same time run OS in=
 qemu2. And let qemu1 run as the qemu2&#39;s BMC hardware and communicate v=
ia KCS or BT interface? Like the following sequence:</div><div>[qemu1=C2=A0=
 [openbmc=C2=A0 [bt-bmc]]]&lt;------LPC--------&gt;|-----system IPC-----|&l=
t;------LPC--------&gt;[[[ipmi_si]=C2=A0 host]=C2=A0 qemu2]</div><div>And w=
hat can I do?</div><div>I have seen there is some code in qemu source code:=
</div><div>qemu/hw/ipmi/*</div><div>and in linux-5.3 source code:</div><div=
>drivers/char/ipmi/*</div><div>Dose this can help mitigate my problem?</div=
><div><br></div><div>Best Regards!</div><div>Liu Hongwei</div></blockquote>=
</div>

--000000000000d2ff55059a0eaae3--
