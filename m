Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C65C223896
	for <lists+openbmc@lfdr.de>; Fri, 17 Jul 2020 11:41:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7R352gQDzDrPg
	for <lists+openbmc@lfdr.de>; Fri, 17 Jul 2020 19:41:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=tyler.sabdon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Dn+sBFls; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7R2H6rRgzDqBG
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jul 2020 19:40:52 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id w27so7133102qtb.7
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jul 2020 02:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=v4U7VQ1V1K3B7hTcFr/anHYuHI/+s2gVZZrT9fOJ424=;
 b=Dn+sBFlsq0OeQx7rLbmBHopJfMqOjwTgLXHOBj3Zh7BdCppVX7/jQxD5zdHMb+Rs9p
 vVqvuUdnqPJTGjkONEqDUepSvF703Pl/UtZcfg5RLgyY8ufCphwKdwQ04XwUZYHGRtww
 Tk9Cl9cyqVJTcSDUAoSW6UwfjegAUgAVDR3SMvMsbcs20fOpeUlMasJ/m9rY5Aaj2AJI
 lxuII/QNSTC42AL2nyCg+6tv7nk1+ryy2bKKYAowCbnDgzLEvOAAohiKJ+Re2vtO4aeD
 cBC5nCkGCl1XSxH/fRfEQAz3zZ1kMw5eO6LcMljITGLwGcj8fpAugpVo5R41NbudFYr6
 E3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=v4U7VQ1V1K3B7hTcFr/anHYuHI/+s2gVZZrT9fOJ424=;
 b=VTD/qnF7hlZQayqyuRz50NwmJWRIP/wbyZ4j0hia1aG0JpnonL+XV09GgVwEbLSl87
 94xmSyLVtNCDgUoJFo+dvCiRiJXPR1G4wi0eJjMsI4fb16T/ulrRQQdYa+/kd3N38iJR
 m/7O7BIkotDM1uL/Mb1gTbCCs3DNRa7rAynV0g0nlWt8Ue+BXMr0a5e+g4JGz2eaWNLr
 KrFAWeAzhd/wdhdT39LbpKPXPSZxsjXfEYw8REfYzYAdB1jwYH+UHdAwHEJ00YSA/ey0
 G5PjiVHGxpPQuqQ4pOHvsCSIojdeYBwtU1/mOl9NCvKaxyH3ebRddSSdguloMdc2Wkd0
 jK0g==
X-Gm-Message-State: AOAM532lofCqdkndcKEMhidJDAH+dmlVdX5HRTnnv+Q5PJmg+6GU87pK
 ahjV8R2f9oUB+0kQyAaZGXCyiY+029a6zcbMH86eus20
X-Google-Smtp-Source: ABdhPJwkbxvnr4jExA54XacKxCfAfGMRSl4/7bI2zh5nJGqmkmRwnnW8/feGL8DORJDYw08QoLsSeBHPk8YXZ6dVjxY=
X-Received: by 2002:ac8:6f7a:: with SMTP id u26mr9579524qtv.33.1594978849151; 
 Fri, 17 Jul 2020 02:40:49 -0700 (PDT)
MIME-Version: 1.0
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Fri, 17 Jul 2020 17:41:23 +0800
Message-ID: <CAO9PYRKHu-d2YDyu+toarFysKZWgRYbjhO5H+xetcL_V8aJ1NA@mail.gmail.com>
Subject: PSU inventory
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000ba5e8505aa9ff312"
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

--000000000000ba5e8505aa9ff312
Content-Type: text/plain; charset="UTF-8"

Hi All:
    I am developing PSU monitor module on my platform and investigating
phosphor-power first. I have some question about phosphor-power
1. in power-supply-monitor@.service file
...
Description=Power Supply %I Monitor
Wants=mapper-wait@
-xyz-openbmc_project-inventory-system-chassis-motherboard-powersupply%i.service
After=mapper-wait@
-xyz-openbmc_project-inventory-system-chassis-motherboard-powersupply%i.service
...
I know Wants and After in systemd service file but I don't understand what
is  mapper-wait@-xyz-openbmc_project-inventory-system-chassis-motherboard-powersupply%i.service
mean? It seems not a service.
I also execute psu-monitor binary as below
...
root@test:~# psu-monitor --path=/sys/bus/i2c/devices/13-0068 --instance=0
--inventory=/system/chassis/motherboard/powersupply0
terminate called after throwing an instance of
'sdbusplus::exception::SdBusError'
  what():  sd_bus_call: org.freedesktop.DBus.Error.UnknownObject: Unknown
object
'/xyz/openbmc_project/inventory/system/chassis/motherboard/powersupply0'.
Aborted
...
PSU inventory is not exist. Which service need to create PSU inventory and
how to create it?
Thanks.

Tyler

--000000000000ba5e8505aa9ff312
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All:<br>=C2=A0 =C2=A0 I am developing PSU monitor modul=
e on my platform and investigating phosphor-power first. I have some questi=
on about phosphor-power<div>1. in=C2=A0power-supply-monitor@.service file</=
div><div>...</div><div>Description=3DPower Supply %I Monitor<br>Wants=3Dmap=
per-wait@-xyz-openbmc_project-inventory-system-chassis-motherboard-powersup=
ply%i.service<br>After=3Dmapper-wait@-xyz-openbmc_project-inventory-system-=
chassis-motherboard-powersupply%i.service<br></div><div>...</div><div>I kno=
w Wants and After in systemd service=C2=A0file but I don&#39;t understand w=
hat is=C2=A0

mapper-wait@-xyz-openbmc_project-inventory-system-chassis-motherboard-power=
supply%i.service mean? It seems not a service.</div><div>I also execute psu=
-monitor binary as below</div><div>...</div><div>root@test:~# psu-monitor -=
-path=3D/sys/bus/i2c/devices/13-0068 --instance=3D0 --inventory=3D/system/c=
hassis/motherboard/powersupply0<br>terminate called after throwing an insta=
nce of &#39;sdbusplus::exception::SdBusError&#39;<br>=C2=A0 what(): =C2=A0s=
d_bus_call: org.freedesktop.DBus.Error.UnknownObject: Unknown object &#39;/=
xyz/openbmc_project/inventory/system/chassis/motherboard/powersupply0&#39;.=
<br>Aborted<br></div><div>...</div><div>PSU inventory is not exist. Which s=
ervice need to create PSU inventory and how to create it?</div><div>Thanks.=
</div><div><br></div><div>Tyler</div></div>

--000000000000ba5e8505aa9ff312--
