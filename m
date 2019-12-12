Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4A911C683
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 08:37:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YQcN3sqgzDqws
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 18:37:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=karo33bug@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wjg59JrO"; 
 dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YQbc1LRczDqxg
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 18:36:43 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id y19so890170lfl.9
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 23:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=5cs/+JOq7lnQVG/XN/kukGB1jzN8YN7T4lWKEJUhzU4=;
 b=Wjg59JrOJVb1S+Fo3AJ6el1tT/HoYsSw8Z455f+NPqiJ/BsgUml7Mm2nmAkgZ/gjVc
 1tgr0o8Z2JkszvIXp/tZqQ0un0UIBZBHJpDG/LxB5GVV5iVol5Mnpqdb07vgFN75LkVV
 QW1IE2hLr1R6PrlIwQxqu4coAMBJXKSUOCGxj78OmoMGGETlN1VGn4/Nu4OayZMYQ0lJ
 DvV9T7QWLVaLSNHD3VFh4nHch7mqTFvAnhAowmyBtam+Im4XtUsp/jOy2ukacnI1t6ls
 g8LsqEjWIdJcBGyx4ckUPnDDovtWm7+p5Mpvmaj/15t3pKqkGeAJxDVawHeUgxwkbvoe
 mBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=5cs/+JOq7lnQVG/XN/kukGB1jzN8YN7T4lWKEJUhzU4=;
 b=O0RpcFjwWPKp9NopOJ/zjhyfsvnAl7ZLubzlpAD9NZraex934DTaYsyK59pvVBW5jW
 L+U4eK8GVRXM6XYKXBoNZaR6T8VSCFog493MWCO/Qb+HSQ/UwY7kL9iaHV1ax76HR/d1
 Ur3zEw7XWja5KGlJF8nocEDlBrGZp5Uhm/9JH2WYkwQ3A0b2V5ymRMXfJRpM5xT/KG/1
 vdnD0UEOse6cdmyK/tjgL+b1/b/cZ3UHrug0flKDTY8dFnP1JTilX1zb/E/bP33TT2S1
 aIVucnmtmgQyRX/HAoeeugS0KguWER/CK2UZKCNH2iMDnAHSTaPmeIHpg7PsU2SyFCMc
 Ag4g==
X-Gm-Message-State: APjAAAWEJwQE3WIdMkk9gub6ZKMiAj8frj9JKzuY6LDwhdRJSaK6HpHo
 8zYPIbx/SyDlV+jinhwsUtkBrn20tdkCBXjUUjiuUkytI6k=
X-Google-Smtp-Source: APXvYqwcy89AVS31q+YgB8Se5bhJw61vaWBKOi7R7h3kEWmLX+AC/b6vzI/QfFyqkp7asECmn8tK2ZXdvyFV3RE2yOc=
X-Received: by 2002:ac2:4834:: with SMTP id 20mr4301046lft.166.1576135823341; 
 Wed, 11 Dec 2019 23:30:23 -0800 (PST)
MIME-Version: 1.0
From: Carol Wang <karo33bug@gmail.com>
Date: Thu, 12 Dec 2019 15:30:12 +0800
Message-ID: <CALzeG+-bxR0oqA_h8Gaf-RQLJygL1QYXy3y2DU=GKdLC9nhWhw@mail.gmail.com>
Subject: Redfish: Disable/enable out of band IPMI
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000de3d7c05997cb7c1"
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
Cc: "Puli, Apparao" <apparao.puli@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000de3d7c05997cb7c1
Content-Type: text/plain; charset="UTF-8"

Hi,

Looking to implement IPMI Enable / Disable as part of Redfish's Manager
Network
Protocol.
https://redfish.dmtf.org/schemas/ManagerNetworkProtocol.v1_5_0.json

Two ways to get/set the current status of net IPMI:
1. Add an interface in phosphor-dbus-interface to indicate the status of
net IPMI.
Have a daemon to monitor the status, if the status is changed, then enable
or
disable the net IPMI service and socket.
2. Check the net IPMI socket state by getData()[1] in bmcweb. If the state
is
"running" or "listening", the net IPMI status is true, otherwise, the
status is
false. Then bmcweb can enable or disable the service and socket.

Wondering if anyone has any thoughts on this feature, which way is better.
If add interface, in which daemon this interface should be implemented?

[1]
https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/network_protocol.hpp#L190

Thanks,

--000000000000de3d7c05997cb7c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>Looking to implement IPMI Enable / Disable as p=
art of Redfish&#39;s Manager Network<br>Protocol.<br><a href=3D"https://red=
fish.dmtf.org/schemas/ManagerNetworkProtocol.v1_5_0.json">https://redfish.d=
mtf.org/schemas/ManagerNetworkProtocol.v1_5_0.json</a><br><br>Two ways to g=
et/set the current status of net IPMI:<br>1. Add an interface in phosphor-d=
bus-interface to indicate the status of net IPMI.<br>Have a daemon to monit=
or the status, if the status is changed, then enable or<br>disable the net =
IPMI service and socket.<br>2. Check the net IPMI socket state by getData()=
[1] in bmcweb. If the state is<br>&quot;running&quot; or &quot;listening&qu=
ot;, the net IPMI status is true, otherwise, the status is<br>false. Then b=
mcweb can enable or disable the service and socket.<br><br>Wondering if any=
one has any thoughts on this feature, which way is better.<br>If add interf=
ace, in which daemon this interface should be implemented?<br><br>[1] <a hr=
ef=3D"https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/networ=
k_protocol.hpp#L190">https://github.com/openbmc/bmcweb/blob/master/redfish-=
core/lib/network_protocol.hpp#L190</a><br><br>Thanks,</div>

--000000000000de3d7c05997cb7c1--
