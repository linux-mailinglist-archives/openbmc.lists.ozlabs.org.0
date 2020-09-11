Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA292669D9
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 23:01:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp7TT3RVfzDqvR
	for <lists+openbmc@lfdr.de>; Sat, 12 Sep 2020 07:01:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=vivekgani@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m0fYFXJo; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp7SM0ClSzDqvR
 for <openbmc@lists.ozlabs.org>; Sat, 12 Sep 2020 07:00:14 +1000 (AEST)
Received: by mail-qv1-xf2c.google.com with SMTP id cv8so5889399qvb.12
 for <openbmc@lists.ozlabs.org>; Fri, 11 Sep 2020 14:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=Hfihzj5siEGAeJTBZqf21dGPMIyzaCZv6JTvPc4DHu8=;
 b=m0fYFXJo6l+rxdpwb/OC9YLFoARlctRhWqkW/gK4xS1Lja80NnXc8m2HCpeuZUn+gQ
 fasDzzVqULXhgVdG5AmdC5XkRG/iw52ZoJB7wyKsgQPf22tYXtlZzsbPr5UEK+hJ5tF3
 sHZace3Fr+9VCh+hF/PNAOj4Pp3Z7ow1Jtl2JVDnos87hSju2MyQe7QaIX+Scoz9QFMy
 ZDHMJudIv9CzrwBaVcAzwg4GIjrR+JpWMEhnMv2ap2LwWvDBP/JyrX1/n2MAjoKWT17P
 Drhgmf9cwVzLuU8pQI/4SfTUPxcgNjf+BUzcgc70stlR8W9o42nSNjOQpSoRfNC6KRAo
 1zUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=Hfihzj5siEGAeJTBZqf21dGPMIyzaCZv6JTvPc4DHu8=;
 b=YFWRZNt9khYi/BohnLjH04peT/zkt5PLe+vKVVDoG5ekYobf/2lgxSypG8oEY0WMtJ
 DhHJPZAluX601B49QVDKTTGPHZdvBwB44Mgo+bqEPnA/SYWi4yw6A/gYLn/JFBUxuZl4
 mWKhjltl9PV5tX8/JrT7GfkajXUlniqYa+PljQ/DT+DlsdoxJSTH46jvaqbjhSfztEzf
 RDNU3U3DcH26xVZU0JP9rMlGl6nxVdejlQcS+c9FV33YdxPWmDTUKrZA+a94P4K8sx8N
 4pqSn1ywsxgOFs+oeTqIyIhTiWvNQdQT5lbg9KwX4RnEmY4sBM89RUVb5mskaGTDRlh9
 0erA==
X-Gm-Message-State: AOAM530lBdbEOS7WYU6dKT522bN9HaBua0DRh6qfpN3WXusS2QLkrXBh
 DJgBNB1Jb5LUdzduG0xVe4diHSj9IHCLNBZXiEdOLTf7WVs=
X-Google-Smtp-Source: ABdhPJxsTBf0xTqOSaYl5u5w7pxWPxr1J5D8eD1OMZHyplGR1Maq4Zp6UCqony23wT8xdUsB+LN+oKrfr/tRfpaYUaY=
X-Received: by 2002:a0c:fb47:: with SMTP id b7mr3758780qvq.48.1599858011369;
 Fri, 11 Sep 2020 14:00:11 -0700 (PDT)
MIME-Version: 1.0
From: Vivek Gani <vivekgani@gmail.com>
Date: Fri, 11 Sep 2020 14:00:00 -0700
Message-ID: <CAB-qw-hpuKJbuqoafpZpFBCZYdZhKrRHbjeUjgziX2pgxYGBRg@mail.gmail.com>
Subject: Defining a Power Supply Configuration Format with the PMBus Standards
 Working Group
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000075755f05af0ff85e"
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
Reply-To: vivek@gani.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000075755f05af0ff85e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

My name is Vivek Gani and I=E2=80=99m representing the Power Management Bus
(PMBus(r)) Forum (https://PMBus.org), part of the System Management
Interface Forum (SMIF), Inc (http://smiforum.org/). Our group is composed
of both power supply vendors and chip/system manufacturers. Together we
create digital power protocols (PMBus, AVSBus(tm)) supported by a number of
power supplies on the market.

Lately we have been discussing how to define a standard file format for
digital power supplies. Currently each power supply vendor has their own
format. This causes a burden for the system designer and manufacturer using
a mixture of power supplies from different vendors. On the power supply
vendor (and procurement manager) end this has also led to more logistics in
order to ship power supplies 'preconfigured' when in many cases an
'off-the-shelf' product could have been used then configured during system
board manufacture or even in-system.

Our focus is currently around power supply configuration and updates over
PMBus, though we want it to be open-ended to support other usecases too. As
far as stakeholders, initially this started out within the PMBus Standards
Working Group where power supply vendors were focused on board bringup
scenarios but thanks to people like Mike Jones (Analog Devices) and Mariusz
Oriol (Intel) we=E2=80=99re now realizing such an effort will make more sen=
se if
done while keeping in mind the needs of groups like OpenBMC & Redfish.
Specifically we want to try and create a configuration format and toolchain
that will find a balance between:

- Being human editable.
In theory files could be generated in syntactically verbose formats like
XML, but in practice as an applications engineer being able to easily edit
configuration files by hand has proven very helpful in resolving customer
issues.

- Protocol generic enough to support minimum data to perform a PMBus
transaction.
Specifically, one can use just address, command code, data (in hex/binary),
and PMBus transaction type data to configure a device. Additional
specifiers such as numeric format & named bitfields are optional.

- Facilitates conditional/stateful aspects in the configuration process.
While in theory things would be purely declarative in practice most power
supply devices may be in certain states (that change as commands are sent)
that necessitate management of state, dependencies, and ordering.

- Having a verification mechanism with common format for =E2=80=98proof of =
content=E2=80=99.
Format could be something standard like sha1/md5 sum though the
instructions to perform verification may be vendor-specific. May be limited
to RAM-only though some vendors may offer non-volatile memory verification
methods.

Here=E2=80=99s a high-level graphic of what we have in mind:
https://www.dropbox.com/s/8ey0errn7fe9gc0/2020-09-11%20-%20standard%20confi=
g%20groups%20and%20collateral.png

We want to first present the idea here and see what the OpenBMC community
thinks about this effort. Is power supply configuration and updates
something of interest to this community? Have there been any pain points
experienced so far from the system engineering side you could see solved
through collaboration on a common format?

Regards,

Vivek

--00000000000075755f05af0ff85e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>My name is Vivek Gani and I=E2=80=99m repres=
enting the Power Management Bus (PMBus(r)) Forum (<a href=3D"https://PMBus.=
org">https://PMBus.org</a>), part of the System Management Interface Forum =
(SMIF), Inc (<a href=3D"http://smiforum.org/">http://smiforum.org/</a>). Ou=
r group is composed of both power supply vendors and chip/system manufactur=
ers. Together we create digital power protocols (PMBus, AVSBus(tm)) support=
ed by a number of power supplies on the market.<br><br>Lately we have been =
discussing how to define a standard file format for digital power supplies.=
 Currently each power supply vendor has their own format. This causes a bur=
den for the system designer and manufacturer using a mixture of power suppl=
ies from different vendors. On the power supply vendor (and procurement man=
ager) end this has also led to more logistics in order to ship power suppli=
es &#39;preconfigured&#39; when in many cases an &#39;off-the-shelf&#39; pr=
oduct could have been used then configured during system board manufacture =
or even in-system.<br><br>Our focus is currently around power supply config=
uration and updates over PMBus, though we want it to be open-ended to suppo=
rt other usecases too. As far as stakeholders, initially this started out w=
ithin the PMBus Standards Working Group where power supply vendors were foc=
used on board bringup scenarios but thanks to people like Mike Jones (Analo=
g Devices) and Mariusz Oriol (Intel) we=E2=80=99re now realizing such an ef=
fort will make more sense if done while keeping in mind the needs of groups=
 like OpenBMC &amp; Redfish.=E2=80=A8=E2=80=A8Specifically we want to try a=
nd create a configuration format and toolchain that will find a balance bet=
ween:<br><br>- Being human editable.<br>In theory files could be generated =
in syntactically verbose formats like XML, but in practice as an applicatio=
ns engineer being able to easily edit configuration files by hand has prove=
n very helpful in resolving customer issues.<br><br>=E2=80=A8- Protocol gen=
eric enough to support minimum data to perform a PMBus transaction.<br>Spec=
ifically, one can use just address, command code, data (in hex/binary), and=
 PMBus transaction type data to configure a device. Additional specifiers s=
uch as numeric format &amp; named bitfields are optional.<br>=E2=80=A8<br>-=
 Facilitates conditional/stateful aspects in the configuration process.<br>=
While in theory things would be purely declarative in practice most power s=
upply devices may be in certain states (that change as commands are sent) t=
hat necessitate management of state, dependencies, and ordering.<br>=E2=80=
=A8<br>- Having a verification mechanism with common format for =E2=80=98pr=
oof of content=E2=80=99.<br>Format could be something standard like sha1/md=
5 sum though the instructions to perform verification may be vendor-specifi=
c. May be limited to RAM-only though some vendors may offer non-volatile me=
mory verification methods.<br><br><div>Here=E2=80=99s a high-level graphic =
of what we have in mind: <a href=3D"https://www.dropbox.com/s/8ey0errn7fe9g=
c0/2020-09-11%20-%20standard%20config%20groups%20and%20collateral.png">http=
s://www.dropbox.com/s/8ey0errn7fe9gc0/2020-09-11%20-%20standard%20config%20=
groups%20and%20collateral.png</a><br></div><div><br></div><div>We want to f=
irst present the idea here and see what the OpenBMC community thinks about =
this effort. Is power supply configuration and updates something of interes=
t to this community? Have there been any pain points experienced so far fro=
m the system engineering side you could see solved through collaboration on=
 a common format?<br><br>Regards,<br><br>Vivek</div></div>

--00000000000075755f05af0ff85e--
