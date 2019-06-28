Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AF159711
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 11:13:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZrfY4hLLzDqhK
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 19:13:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=asmithakarun@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YOg5OzhZ"; 
 dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZrcL6QvfzDqZb
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 19:11:40 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id p13so5438823wru.10
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 02:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=bvWvQmQywnoQeVGD+3LwAAURMw+KSXQ+sSgkh9m3Zg4=;
 b=YOg5OzhZ0L/uOc/8bEpCgBChcYk7gqiY8y9bzlr3mtM28thaKUm/VZmhhu1yA1kh5n
 xzkDZoB2zLeQB3pXhAHsIVqAK1CxfAskhci6ZT3qO58Zf0PeqlZFbZoalEyaeOkIAlYM
 /EZSAIbTSpqn8z53zBrKA7v7c1DfDdwnJmKyKpsJ0fRV1NDGp7bUoR50lXxtjuH7ENp3
 /iI/mTYrekwEw0qYW8XCkCCvR2ZocwYCVAocIfmu4XNwbdoXUjnNOwW1Z4fbAy7GV4mM
 DU2fcb5TeirmppP3CePycTR5i211ZBQhuH0h5pd8B5b3aw71W4M/dcSFZpNnj/qAyWFt
 d4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bvWvQmQywnoQeVGD+3LwAAURMw+KSXQ+sSgkh9m3Zg4=;
 b=TdD1T1gAG0jHm1O2+itYOdpbhCdxlA20MOQR1Nqti8WPaB77Pj9wVMcVxHz+OhwIGB
 sRAByvGQ3OMYCXBxeJ92M51FlP3M+yvrBTwj4oxUs/Oz6PG5vXTqGQ5OisFjYqulnTEs
 FvXq+Ec4oY4wK0f9G1qBl1OfuuyrqK6apXLrU/0m6fHbHhoq8NF3zUksea5iUBAPJ2H4
 Nj+sMzrrmAPmOSFsFASzuCbU5jhnABUEWtRYZ5SX2wX3exj9YQFt1kGhPb/0cQYXFkfl
 7jjxu6JhiW0gEL1JekRlwonBdyRM0NG5QEkfQKCc6RSKx8JRvAIQ/+gHU4vzdqIZAZtt
 2kUw==
X-Gm-Message-State: APjAAAU8fG8Ocb5BnfFPH3A9eJMEECStgsJr5MImfhCwWbfYC964+gNo
 8T35bS4Pk27DY05vyh3QDJl6iY6Eoc+OWOOu/k29zdpJis8=
X-Google-Smtp-Source: APXvYqwU2SUTg9Z98fWBPcK627fIDl4vNXOMGE9EuBXCzXS/vBzLBfLc79KdezwGlfgFzKf982DvtvhfExc4G3U68Us=
X-Received: by 2002:adf:afd5:: with SMTP id y21mr6892556wrd.12.1561713093371; 
 Fri, 28 Jun 2019 02:11:33 -0700 (PDT)
MIME-Version: 1.0
From: Asmitha Karunanithi <asmithakarun@gmail.com>
Date: Fri, 28 Jun 2019 14:40:57 +0530
Message-ID: <CANGK-S4fQmYJ_kgH6SWRwkQ8E4TD6rukirs-0LR4+EMVY_Admw@mail.gmail.com>
Subject: Enhance Discovery class infrastructure
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000002be9e8058c5eaa2c"
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

--0000000000002be9e8058c5eaa2c
Content-Type: text/plain; charset="UTF-8"

Hi All,

Below is the design document for enhancing the discovery class
infrastructure.

# Enhance Discovery class infrastructure

Primary assignee:
  Asmitha KR

Other contributors:
  Ratan K Gupta

Created:
  2019-06-28

## Problem Description
Avahi is a system which facilitates service discovery on a local network via
the mDNS/DNS-SD protocol suite. It allows programs to publish and discover
services running on a local network. The format of the Avahi service file is
in the "Background and References[1]" section. We have a requirement where
the
management console needs to identify the vendor-specific servers in a
network.

## Background and References
[1]
https://github.com/lathiat/avahi/blob/master/avahi-daemon/example.service
[2] https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/22950
[3] https://gerrit.openbmc-project.xyz/c/openbmc/meta-ibm/+/22951

## Requirements
None.

## Proposed Design
The services that are being published by avahi have various fields like -
service name, type, port, hostname, address, port, and a text record. To
solve
the above-listed problem, we are proposing a solution in which the
vendor-specific information is included in the text record field of the
avahi
service file.

To do so, currently, in OpenBMC we have the infrastructure where the
service-specific data is passed through a specific service bb file.
Depending
on the distro feature(slp or avahi), it generates the service file with the
given data. We are enhancing this infrastructure to add the vendor-specific
information in the avahi service file(under txt-record).

There is a commit "Background and References[2 & 3]" section which is up for
review.

## Alternatives Considered
None.

## Impacts
None.

## Testing
The path /etc/avahi/services contain all the services that avahi publishes
on
startup.
-- 
Thanks & Regards,
Asmitha Karunanithi

--0000000000002be9e8058c5eaa2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>Below is the design document fo=
r enhancing the discovery class infrastructure.</div><div><br></div><div># =
Enhance Discovery class infrastructure<br><br>Primary assignee:<br>=C2=A0 A=
smitha KR<br><br>Other contributors:<br>=C2=A0 Ratan K Gupta<br><br>Created=
:<br>=C2=A0 2019-06-28<br><br>## Problem Description<br>Avahi is a system w=
hich facilitates service discovery on a local network via<br>the mDNS/DNS-S=
D protocol suite. It allows programs to publish and discover<br>services ru=
nning on a local network. The format of the Avahi service file is<br>in the=
 &quot;Background and References[1]&quot; section. We have a requirement wh=
ere the<br>management console needs to identify the vendor-specific servers=
 in a network.<br><br>## Background and References<br>[1] <a href=3D"https:=
//github.com/lathiat/avahi/blob/master/avahi-daemon/example.service">https:=
//github.com/lathiat/avahi/blob/master/avahi-daemon/example.service</a><br>=
[2] <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+=
/22950">https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/22950<=
/a><br>[3] <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/meta-ibm=
/+/22951">https://gerrit.openbmc-project.xyz/c/openbmc/meta-ibm/+/22951</a>=
<br><br>## Requirements<br>None.<br><br>## Proposed Design<br>The services =
that are being published by avahi have various fields like -<br>service nam=
e, type, port, hostname, address, port, and a text record. To solve<br>the =
above-listed problem, we are proposing a solution in which the<br>vendor-sp=
ecific information is included in the text record field of the avahi<br>ser=
vice file.<br><br>To do so, currently, in OpenBMC we have the infrastructur=
e where the<br>service-specific data is passed through a specific service b=
b file. Depending<br><div>on the distro feature(slp or avahi), it generates=
 the service file with the<br>given data. We are enhancing this infrastruct=
ure to add the vendor-specific<br>information in the avahi service file(und=
er txt-record).<br><br>There is a commit &quot;Background and References[2 =
&amp; 3]&quot; section which is up for<br>review.<br><br>## Alternatives Co=
nsidered<br>None.<br><br>## Impacts<br>None.<br><br>## Testing<br>The path =
/etc/avahi/services contain all the services that avahi publishes on<br>sta=
rtup.<br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Thanks &amp=
; Regards,<div>Asmitha Karunanithi</div></div></div></div></div></div></div=
>

--0000000000002be9e8058c5eaa2c--
