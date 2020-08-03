Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A83823AC1C
	for <lists+openbmc@lfdr.de>; Mon,  3 Aug 2020 20:04:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BL5PV6XLVzDqTG
	for <lists+openbmc@lfdr.de>; Tue,  4 Aug 2020 04:04:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2b;
 helo=mail-io1-xd2b.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Gr+7AKpG; dkim-atps=neutral
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BL5Nk1brDzDqSt
 for <openbmc@lists.ozlabs.org>; Tue,  4 Aug 2020 04:03:48 +1000 (AEST)
Received: by mail-io1-xd2b.google.com with SMTP id s189so32226320iod.2
 for <openbmc@lists.ozlabs.org>; Mon, 03 Aug 2020 11:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:message-id:date:to;
 bh=0F8Y02PSPEiqvBMDQyqKxTJhSHdpqGNRh2SXa73C5WU=;
 b=Gr+7AKpG02ctfMmo6JR/njrEJDDCtSjgHhZ3dkFlQIQajhQfeJxK2X2IrNX143SrTA
 0H+JwRE9E3assBwV6CtcCMJwVNqktkmsH361y+Qq/GN0/AZqok/OFQho5koabH94bkgg
 lcciJnN7PiGyYqYdoRVKiiSCrHdX/BUa29Fna75GcAu45+tWxzswynXc42Ed1GM5IPgN
 JgWUTi/6OoXkQ+cwfKctETulaZGCb/38tqcuCCDlm/C+73mBiDqZBtGhn569u7EL2uPf
 VIZEiotVQyvnHb1+z6unhBtWWbvFnWYN3OegerpenGU+02NMhjWUuIO/PUGuErMoqhF9
 RUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:message-id:date:to;
 bh=0F8Y02PSPEiqvBMDQyqKxTJhSHdpqGNRh2SXa73C5WU=;
 b=Ef1piP+LZwIloYE+/NwxJekCWcLx/cq8mOu2kqWZTcAoraD0cgi/z6cKRK9a8+9KMv
 WPcEw+xAfaylc6O7nPmcU58EN7TVwd3hoAO/emFuGys1m1hUM2Yd4pFGLhNicqyO9zXK
 p3W9K+fqoqKsEeSE1wmt1NNKtKEry58aetaepLsIr1zfWX72yKUYE4NTnuFCr5pZfW7t
 AafjPNrrBvBaayz0SWuOHDC/X/nTa925Qo8HMf/sa38N4cFE/YStQbyu8re16Ct+7EPl
 ELXwFy0+3gXmoPO6VR73RWFtw7IXqZSrZUlCYfNzyJ/d2vZE7jwOoSUqc/Z6Ygz2K7n2
 kwVA==
X-Gm-Message-State: AOAM533PwMOOxhJa0lrNVqxdydvqLsS41lKkv7HHqvgers0Tgw8sKTRJ
 KSStxd/PsbCTkrM47wNZi9DsblAgpdQ=
X-Google-Smtp-Source: ABdhPJw3IgeYBGCNHQDl3LyZ5L98fYyuLlzjx8ZrgBgQmrFoRiBdnnGJb2v0XldHin4PQDxRHeyazw==
X-Received: by 2002:a05:6638:1313:: with SMTP id
 r19mr1013834jad.60.1596477823320; 
 Mon, 03 Aug 2020 11:03:43 -0700 (PDT)
Received: from [10.21.10.10] ([199.115.103.2])
 by smtp.gmail.com with ESMTPSA id r7sm10534006ioj.42.2020.08.03.11.03.40
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Aug 2020 11:03:42 -0700 (PDT)
From: Mike Jones <proclivis@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_02FCAD1E-D6C7-411E-B658-233BE3D40604"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: How to put sensors into the ObjectMapper
Message-Id: <34F75302-6F54-4EE1-849F-F5B1D7118259@gmail.com>
Date: Mon, 3 Aug 2020 12:03:39 -0600
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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


--Apple-Mail=_02FCAD1E-D6C7-411E-B658-233BE3D40604
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

My RaspPi work has progressed but I don=E2=80=99t know how to get =
sensors in the ObjectMapper, which I hope will mean sensors end up in =
webui.

BASIC INFORMATION
------------------------------

At this point, I have my PMbus devices in the device tree like this =
path:

=
/sys/firmware/devicetree/base/soc/i2c@7e804000/ltc2974@32/regulators/vout0=
 to vout3

And the config files like this path:

/etc/default/obmc/hwmon/soc/i2c#7e804000/ltc2974@32/reg1@32.conf =
<mailto:32/reg1@32.conf>

The sensors show up here:

/sys/bus/i2c/devices/1-0032/hwmon/hwmon2

Indicating that the device tree is causing hwmon to offer its telemetry =
nodes.

=46rom my reading of the docs, it seems like the ObjectMapper keeps an =
inventory of sensors.

So to search, I did something like:

dbus-send =E2=80=94system -print-reply \
=E2=80=94dest=3Dxyz.openbmc_project.ObjectMapper \
/xyz/openbmc_project/object_mapper \
xyz.openbmc_project.ObjectMapper.GetAncestors \
string:=E2=80=9D/xyz/openbmc_project/inventory.system=E2=80=9D =
array:string: | grep ltc2974

But none of my devices are there.

I looked at meta-ibm and meta-hxt and could not see how to get the =
devices into the ObjectMapper.

ACTUAL QUESTIONS
------------------------------

So I have these questions:

- What it the mechanism for getting these into the ObjectMapper?
- Once there, will they show up in webui without any other files and =
recipes?
- What docs might describe what I need to know to connect the hwmon =
devices to the ObjectMapper?
- Is there something I have to do to start the ObjectMapper service? I =
don=E2=80=99t see it with a grep through systemctl.
- Is there an existing meta layer that would be a good example and a =
pointer to the proper bb files to look at?

THE CODE/LAYERS
----------------------------

My work so far is here:

https://github.com/Proclivis/meta-pmbus =
<https://github.com/Proclivis/meta-pmbus>

Configured by:

https://github.com/Proclivis/conf-meta-rasberrypi-evb =
<https://github.com/Proclivis/conf-meta-rasberrypi-evb>

Thanks, and sorry I am a newbie without tribal knowledge. I am trying to =
find solutions on my own and only ask for help when stuck. =
Unfortunately, I=E2=80=99m stuck.

Mike=

--Apple-Mail=_02FCAD1E-D6C7-411E-B658-233BE3D40604
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">My =
RaspPi work has progressed but I don=E2=80=99t know how to get sensors =
in the ObjectMapper, which I hope will mean sensors end up in webui.<div =
class=3D""><br class=3D""></div><div class=3D"">BASIC =
INFORMATION</div><div class=3D"">------------------------------<br =
class=3D""><div class=3D""><br class=3D""></div><div class=3D"">At this =
point, I have my PMbus devices in the device tree like this =
path:</div><div class=3D""><br class=3D""></div><div =
class=3D"">/sys/firmware/devicetree/base/soc/i2c@7e804000/ltc2974@32/regul=
ators/vout0 to vout3</div><div class=3D""><br class=3D""></div><div =
class=3D"">And the config files like this path:</div><div class=3D""><br =
class=3D""></div><div =
class=3D"">/etc/default/obmc/hwmon/soc/i2c#7e804000/ltc2974@<a =
href=3D"mailto:32/reg1@32.conf" class=3D"">32/reg1@32.conf</a></div><div =
class=3D""><br class=3D""></div><div class=3D"">The sensors show up =
here:</div><div class=3D""><br class=3D""></div><div =
class=3D"">/sys/bus/i2c/devices/1-0032/hwmon/hwmon2</div><div =
class=3D""><br class=3D""></div><div class=3D"">Indicating that the =
device tree is causing hwmon to offer its telemetry nodes.</div><div =
class=3D""><br class=3D""></div><div class=3D"">=46rom my reading of the =
docs, it seems like the ObjectMapper keeps an inventory of =
sensors.</div><div class=3D""><br class=3D""></div><div class=3D"">So to =
search, I did something like:</div><div class=3D""><br =
class=3D""></div><div class=3D"">dbus-send =E2=80=94system -print-reply =
\</div><div class=3D"">=E2=80=94dest=3Dxyz.openbmc_project.ObjectMapper =
\</div><div class=3D"">/xyz/openbmc_project/object_mapper \</div><div =
class=3D"">xyz.openbmc_project.ObjectMapper.GetAncestors \</div><div =
class=3D"">string:=E2=80=9D/xyz/openbmc_project/inventory.system=E2=80=9D =
array:string: | grep ltc2974</div><div class=3D""><br =
class=3D""></div><div class=3D"">But none of my devices are =
there.</div><div class=3D""><br class=3D""></div><div class=3D"">I =
looked at meta-ibm and meta-hxt and could not see how to get the devices =
into the ObjectMapper.</div><div class=3D""><br class=3D""></div><div =
class=3D"">ACTUAL QUESTIONS</div><div =
class=3D"">------------------------------</div><div class=3D""><br =
class=3D""></div><div class=3D"">So I have these questions:</div><div =
class=3D""><br class=3D""></div><div class=3D"">- What it the mechanism =
for getting these into the ObjectMapper?</div><div class=3D"">- Once =
there, will they show up in webui without any other files and =
recipes?</div><div class=3D"">- What docs might describe what I need to =
know to connect the hwmon devices to the ObjectMapper?</div><div =
class=3D"">- Is there something I have to do to start the ObjectMapper =
service? I don=E2=80=99t see it with a grep through systemctl.</div><div =
class=3D"">- Is there an existing meta layer that would be a good =
example and a pointer to the proper bb files to look at?</div><div =
class=3D""><br class=3D""></div><div class=3D"">THE =
CODE/LAYERS</div><div class=3D"">----------------------------</div><div =
class=3D""><br class=3D""></div><div class=3D"">My work so far is =
here:</div><div class=3D""><br class=3D""></div><div class=3D""><a =
href=3D"https://github.com/Proclivis/meta-pmbus" =
class=3D"">https://github.com/Proclivis/meta-pmbus</a></div><div =
class=3D""><br class=3D""></div><div class=3D"">Configured by:</div><div =
class=3D""><br class=3D""></div><div class=3D""><a =
href=3D"https://github.com/Proclivis/conf-meta-rasberrypi-evb" =
class=3D"">https://github.com/Proclivis/conf-meta-rasberrypi-evb</a></div>=
</div><div class=3D""><br class=3D""></div><div class=3D"">Thanks, and =
sorry I am a newbie without tribal knowledge. I am trying to find =
solutions on my own and only ask for help when stuck. Unfortunately, =
I=E2=80=99m stuck.</div><div class=3D""><br class=3D""></div><div =
class=3D"">Mike</div></body></html>=

--Apple-Mail=_02FCAD1E-D6C7-411E-B658-233BE3D40604--
