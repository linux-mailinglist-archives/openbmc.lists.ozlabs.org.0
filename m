Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F75B0C3C
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 12:05:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TZBv24T8zF3wH
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 20:05:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eGqBepuE"; 
 dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TZB91R3gzDqg3
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 20:04:32 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id 41so21707030oti.12
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 03:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=uXwwt6jSRo79mMrAR0OBk1Q6bGRXbqXI5JnUy69YnXY=;
 b=eGqBepuEEfGiKU+gL6QdCrolrMqIJKV7K/UfjndAxzZ8OU1LM+Z4OWjZ59L4SUN4x+
 acjl0jXJBL/rL6h85mtazSJFkGy/IDAQcw7YKlRnVup1i9tKm06bTW+5y7lzoFH4jqu/
 ajG4S0iOgDPijwmVT8Z+WnrDyCNoq8673YcKD+WGwCDCxWkg8AR9wmEUphSAhkPUHXZr
 FH1ibNKJguE9ZiY+m12Y/yr1I2XcfptuU3XGg+77FsoYxwhO34ag3668h+n9E+pZafoR
 zn9gW6iQT7Ngu8IQKmam43FBiov5Mow7QOkuvu8R40GD8FopSYE/8A78ekC5d7P4FgiT
 2GYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=uXwwt6jSRo79mMrAR0OBk1Q6bGRXbqXI5JnUy69YnXY=;
 b=k4m02rDHelinBtpIx+o9/BsybIe/V/fmvW035b94li/01SSIAl/S5V90mgVo6eWHjB
 upP5IeVXNR9TmAkTlgWGkQM4YEJtAzEnkmSImv/U1yE6KLqH8NoWBJvnwWhS0atcR1iI
 +FWO4saKGk162m05lFZSd3yh9A1V8xPdfliU8QAOD6IboGdpEhZY3vLheabOQx2EzIus
 YIG/pEHU8b6F5tncTgFR4N4m2M8CxR/lTodFbw/e5L20s7LpXbPSgqwW5cTO8DPVuJis
 j9m5c3U5o3xGwj2a1KkTFkXX8x/1UNETuGcNxIqdLkX3QHPqpvRGzOA9w9DiA2klMCrf
 OEew==
X-Gm-Message-State: APjAAAWtoTOiI1YSVzTZkm9q39uhJ/TTvcoO+DYlUzXFAqhr6u4Fr6Lh
 FhQr2dq7jTvJxL7YwuoYKCJd/htEFzELuWawbCC2rInNjJsQ5Q==
X-Google-Smtp-Source: APXvYqxUmBrq2+Iv7+IKtsEGVqrUletEgY+qVmhOXPeL/mB1Tm98uhBZjd+DbRwtM4qLXKDWnnO8Gt2ee5Dl0t6HXmI=
X-Received: by 2002:a05:6830:c1:: with SMTP id
 x1mr14376749oto.272.1568282668277; 
 Thu, 12 Sep 2019 03:04:28 -0700 (PDT)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Thu, 12 Sep 2019 15:32:35 +0530
Message-ID: <CAE33tLGe+SLRoJiYU51wRGa30W18VvLyBV5mY9UeVU=wJzSTFQ@mail.gmail.com>
Subject: Sensors not showing in ipmitool commands [S2600WF]
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000059a1f10592584338"
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

--00000000000059a1f10592584338
Content-Type: text/plain; charset="UTF-8"

Hi all,

root@s2600wf:~# cat /etc/os-release
ID="openbmc-phosphor"
NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
VERSION="2.8.0-dev"
VERSION_ID="2.8.0-dev-309-g2e155a0-dirty"
PRETTY_NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)
2.8.0"
BUILD_ID="2.8.0-dev"
OPENBMC_TARGET_MACHINE="s2600wf"

While trying to get sensor readings using ipmitool it is showing error

root@s2600wf:~# ipmitool -I dbus sdr type temperature
Error obtaining SDR info: Requested sensor, data, or record not found
Unable to open SDR for reading


Temperature sensor readings are available in sysfs

root@s2600wf:~# cat /sys/class/hwmon/hwmon*/temp1_input
27000
26312
24750
26562
24000

It is not showing when using ipmitool commands. How to add the sensor in
s2600wf machine configuration?


Thanks in advance.

Akash

--00000000000059a1f10592584338
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,<br></div><div><br></div><div>root@s2600wf:~# =
cat /etc/os-release</div>ID=3D&quot;openbmc-phosphor&quot;<br>NAME=3D&quot;=
Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)&quot;<br>VERSI=
ON=3D&quot;2.8.0-dev&quot;<br>VERSION_ID=3D&quot;2.8.0-dev-309-g2e155a0-dir=
ty&quot;<br>PRETTY_NAME=3D&quot;Phosphor OpenBMC (Phosphor OpenBMC Project =
Reference Distro) 2.8.0&quot;<br>BUILD_ID=3D&quot;2.8.0-dev&quot;<br>OPENBM=
C_TARGET_MACHINE=3D&quot;s2600wf&quot;<br><br>While trying to get sensor re=
adings using ipmitool it is showing error<br><br>root@s2600wf:~# ipmitool -=
I dbus sdr type temperature<br>Error obtaining SDR info: Requested sensor, =
data, or record not found<br>Unable to open SDR for reading<br><br><br>Temp=
erature sensor readings are available in sysfs<br><br>root@s2600wf:~# cat /=
sys/class/hwmon/hwmon*/temp1_input<br>27000<br>26312<br>24750<br>26562<br>2=
4000<br><br>It is not showing when using ipmitool commands. How to add the =
sensor in s2600wf machine configuration?<br><div><br></div><div><br></div>T=
hanks in advance.<br><br>Akash<br></div>

--00000000000059a1f10592584338--
