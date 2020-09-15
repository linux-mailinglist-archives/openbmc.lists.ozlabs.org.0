Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9964C26AD1F
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 21:10:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrXqV5dG0zDqM5
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 05:10:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::630;
 helo=mail-ej1-x630.google.com; envelope-from=pparth@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=RDS8VR1r; dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrXpV69m2zDqPb
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 05:09:21 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id j11so6710946ejk.0
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 12:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=6UzwhXUXQhInxWDz2iI64RRSM9nsiLZRCPuwe1LAFj0=;
 b=RDS8VR1rhrQm8GhK0gDQ1iSPTp7hNqyCPQ9BS+swBSQL7YO/dGg/mJIgDY1elWDBDX
 xLOG7iiTdSX49bv2XLEbgOWcxuUsxlSjhKCXZ3JhnuTDtNIKJHrUKxC5j6iu+wR4sFe9
 U2GVcuCJuPq3ouyvqpvmQvhFdxp7eUOQTavDNRzpgWT1izIhT5NA1gDa9jPdrL3Yj2OD
 YTw17uWXQ43DaAdp7Y8Ysjo416lCmZrVdWXuqAqFyY2WI/bwFJaDJhdUKBuqc67iKQsT
 EzZ0tFWfbXzxnrzQbUdUVtKk/whZ7N7tZ1zULI45N6bu7KKA1sBilkrAHI3BSUWmhHOQ
 EkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6UzwhXUXQhInxWDz2iI64RRSM9nsiLZRCPuwe1LAFj0=;
 b=l4TenpvhDxIR7VRXTAcR+wJHwnU3tB3ptPcyjyBOl/dbAjeEMLmaTs8IaNhDKA96AN
 9eSGuI+rZHp2vTWxVnCY7dC33NI/6V0IKi/g4qcl0z7gdfi7NyUWOLO6ue1iT7vBU6hN
 BCQXBgNcCfTSggfK0Rkmaw+wLdFUZ99AZ8dQaIYr/8nf1FlvehngXEgK046yv6tGulbK
 boCrPono+NbWdwPHuMr6xYgT+iAsz8Qwi806Oay/XoVkdAJAC8biaVO+Mpxcc/VJscMf
 kOa6ko/EB84kGDf+AIlExh2EyjiMmhGw/boE28TTlGyQ2uYUDJePFlYfWpdAwUjDC+G6
 4q8A==
X-Gm-Message-State: AOAM5333S2c5xCmlhvCWswb3ZsHo88B7yXEnkw14Nju+6Ac8pQ7GFu7R
 llfNzMSY7uUkxmTusBqWR4J2pJYpJXpOzuBdajrIGJVkzWgSCQ==
X-Google-Smtp-Source: ABdhPJzw3UbYNq4K90qYxs2b8NzSf7V/yA9nNiQdtqv/Lpbcsyv8aZUkuwgMNkFDMTGO3FND1fJ+PgowEzxCgNc4e0I=
X-Received: by 2002:a17:907:213b:: with SMTP id
 qo27mr21120311ejb.441.1600196956635; 
 Tue, 15 Sep 2020 12:09:16 -0700 (PDT)
MIME-Version: 1.0
From: Parth Shukla <timevortex@google.com>
Date: Tue, 15 Sep 2020 21:08:39 +0200
Message-ID: <CAC1Cx+u9ooasL7Kvi4tEjV+MTMk8bzjMd4mLrh6HXRmt_VEMwQ@mail.gmail.com>
Subject: Security Working Group Meeting - Wed 16 September
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000002c75d605af5ee3ad"
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

--0000000000002c75d605af5ee3ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is a reminder of the OpenBMC Security Working Group meeting scheduled
for this Wednesday September 16 at 10:00am PDT.

We'll discuss the following items on the agenda, and anything else that
comes up:

   1. (Parth) Common Remote API for TLS certificate management?
      1. Certificate management =3D installation, rotation, revocation
   2. FYI: BMCWeb Code review: Admin-configurable session timeouts
   https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36016
   3. FYI: BMCWeb core review: moving to Meson build system (from cmake): A
   security concern is ensuring project defaults are preserved so that
   builders get the same options when they use the new build system.
   https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/32816
   4. BMCWeb code review: WIP toward HTTP-HTTPS redirect:
   https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/36245
   5. (Joseph): Interest in implementing Redfish ManagerNetworkProtocol
   properties: HTTPS, IPMI, SSH, VirtualMedia, KVMIP, HTTP (redirect),
   Oem.OpenBMC.TFTP, and Oem.OpenBMC.mDNS?  This allows the BMC admin to
   enable and disable these services.  Previous discussion on 2019-11-13.
   6. (Joseph): Interest in implementing Redfish
   ManagerAccount.AccountTypes.  This allows the BMC admin to control which
   users are allowed to access specific BMC interfaces (like SSH or IPMI).
   See https://redfishforum.com/thread/219/account-groups-property
   7. (email): Protect BMCWeb against password guessing attacks.  See
   https://lists.ozlabs.org/pipermail/openbmc/2020-September/023054.html
   8. Gerrit code review for =E2=80=9CEventService: https client support=E2=
=80=9D
   https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/31735/
   9.  (Anton) PoC work for daemons=E2=80=99 privilege separation
   <https://github.com/openbmc/openbmc/issues/3383>
   Use systemd features for privilege drop & sandboxing.


Access, agenda, and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group

Regards,
Parth

--0000000000002c75d605af5ee3ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is a reminder of the OpenBMC Security Working Group m=
eeting scheduled for this Wednesday September 16 at 10:00am PDT.<br><div><d=
iv dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr">We&#39;ll discus=
s the following items on the agenda, and anything else that comes up:<br></=
div><div><ol><li>(Parth) Common Remote API for TLS certificate management?<=
/li><ol><li>Certificate management =3D installation, rotation, revocation</=
li></ol><li>FYI: BMCWeb Code review: Admin-configurable session timeouts <a=
 href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36016">https=
://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36016</a> </li><li>FYI: BM=
CWeb core review: moving to Meson build system (from cmake): A security con=
cern is ensuring project defaults are preserved so that builders get the sa=
me options when they use the new build system. =C2=A0<a href=3D"https://ger=
rit.openbmc-project.xyz/c/openbmc/bmcweb/+/32816">https://gerrit.openbmc-pr=
oject.xyz/c/openbmc/bmcweb/+/32816</a> </li><li>BMCWeb code review: WIP tow=
ard HTTP-HTTPS redirect: <a href=3D"https://gerrit.openbmc-project.xyz/c/op=
enbmc/meta-phosphor/+/36245">https://gerrit.openbmc-project.xyz/c/openbmc/m=
eta-phosphor/+/36245</a> </li><li>(Joseph): Interest in implementing Redfis=
h ManagerNetworkProtocol properties: HTTPS, IPMI, SSH, VirtualMedia, KVMIP,=
 HTTP (redirect), Oem.OpenBMC.TFTP, and Oem.OpenBMC.mDNS?=C2=A0 This allows=
 the BMC admin to enable and disable these services.=C2=A0 Previous discuss=
ion on 2019-11-13.</li><li>(Joseph): Interest in implementing Redfish Manag=
erAccount.AccountTypes.=C2=A0 This allows the BMC admin to control which us=
ers are allowed to access specific BMC interfaces (like SSH or IPMI).=C2=A0=
 See <a href=3D"https://redfishforum.com/thread/219/account-groups-property=
">https://redfishforum.com/thread/219/account-groups-property</a></li><li>(=
email): Protect BMCWeb against password guessing attacks.=C2=A0 See <a href=
=3D"https://lists.ozlabs.org/pipermail/openbmc/2020-September/023054.html">=
https://lists.ozlabs.org/pipermail/openbmc/2020-September/023054.html</a> <=
/li><li>Gerrit code review for =E2=80=9CEventService: https client support=
=E2=80=9D <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/=
31735/">https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/31735/</a></l=
i><li>=C2=A0(Anton) PoC work for daemons=E2=80=99 <a href=3D"https://github=
.com/openbmc/openbmc/issues/3383">privilege separation</a><br>Use systemd f=
eatures for privilege drop &amp; sandboxing.</li></ol></div><div><br></div>=
<div dir=3D"ltr"><div>Access, agenda, and notes are in the wiki:<br><a href=
=3D"https://github.com/openbmc/openbmc/wiki/Security-working-group" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/openbmc/openbmc/wiki/Secur=
ity-working-group</a><br></div><br clear=3D"all"><div><div dir=3D"ltr"><div=
 dir=3D"ltr">Regards,<div>Parth</div></div></div></div></div></div></div></=
div>

--0000000000002c75d605af5ee3ad--
