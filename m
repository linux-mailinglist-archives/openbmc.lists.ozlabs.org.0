Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0038F5A7E28
	for <lists+openbmc@lfdr.de>; Wed, 31 Aug 2022 15:00:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHkml5Nr4z3bjX
	for <lists+openbmc@lfdr.de>; Wed, 31 Aug 2022 23:00:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hDQQe12Y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hDQQe12Y;
	dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHkmK6LhDz2xJ2
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 23:00:00 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id j17so10821665qtp.12
        for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 06:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc;
        bh=GDUD/OJVLcpVB0fDPrKHsgMRdcKP1+Nd+CJsgTX3gvk=;
        b=hDQQe12Y9JKscZImw8cKSw6gTgTPE8qBSQCz0xsZnLCAO0MU2PJFU9pxHCsLaGRgDW
         QZtSNqx84yu3/xcjxXAO6zjbo+KotkVe27hNWL1tL7I49kZuArQqJdKi6apB3F3QwSe3
         b96X8v9eyWKWcl/wrvn0Q5B7wdsQIDAUwpvbp6d++G+vuZoP15sTu/p3ZPdKxx2OIpy9
         c4kRTg6U/neG+wNEj4hz3ZjMp2vVAjqk6NPhg2Pyzbsa+6mrwGt6yNtdon2jDqrZu07u
         epviqwrW16c24f6cYVB6YidHTkrcF9RLJDLgmS4QiQA+9IIkV388XvktkplkqdQda3w/
         jM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc;
        bh=GDUD/OJVLcpVB0fDPrKHsgMRdcKP1+Nd+CJsgTX3gvk=;
        b=mWEeaPpEDhvF/7rL7VU5tLkRTTCROcLESr9tLACm3EikSz8etvYbEuZ/t2cafRlSpF
         nFS1RWV0qYZ3x0AGMLvw5L2bQmab2+bUxZRAAJnPXeSIdgIL6YQ+cUc7qAkXUVcoTEcN
         HDxf9+hG7R8ZVRhitBMLmdk/wJ2U1CpZiz130HfXbdA/nf6veeuFIUAtFYOmZxJUBDN0
         tldXVSWbomyhhGy6O4PNGVxUJVC9Uzz1FT3ZRWMgB69wFg4j2W3dHBykKzdEKcYQrQsC
         r8lzmOV1f5LkrUxPm67UvsR5oVGfx2Hm+jSz854Hn+OVitGPFCf4QnEO8Ku9vWkkXn88
         aJQQ==
X-Gm-Message-State: ACgBeo21tjPRQithEWol0FEmkfbfuXyhRwY4aQ+HBBgTjo3m644e/k/j
	k8nHWq533RWErQ+Os0jPBkvRIed2qMQ=
X-Google-Smtp-Source: AA6agR69elZVLjgSoYnSO/iKh+ejjoKjbJdnIXiCIwPoP9r98qW/zn1mBySz/LDMzClpRuk5dHObHQ==
X-Received: by 2002:a05:622a:c7:b0:343:2e72:8416 with SMTP id p7-20020a05622a00c700b003432e728416mr19343317qtw.92.1661950796748;
        Wed, 31 Aug 2022 05:59:56 -0700 (PDT)
Received: from smtpclient.apple (2603-7080-92f0-8130-915d-461e-b7ec-e53c.res6.spectrum.com. [2603:7080:92f0:8130:915d:461e:b7ec:e53c])
        by smtp.gmail.com with ESMTPSA id z129-20020a37b087000000b006b9b7879964sm9445398qke.28.2022.08.31.05.59.54
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Aug 2022 05:59:55 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: multi-bmc openbmc systems
Message-Id: <6497C254-2BB5-4545-B251-A87AE6A5B503@gmail.com>
Date: Wed, 31 Aug 2022 08:59:53 -0400
To: OpenBMC List <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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

Greetings,

Last week, the IBM team held an internal workshop discussing some =
potential future designs. One interesting design point is a single =
=E2=80=9Csystem" that contains multiple compute sleds within it, each =
with their own BMC. The host portion of each sled would be cabled via =
Symmetric MultiProcessing cables (SMP) to the others. Each sled host =
would boot in in parallel, managed by its BMC. The host firmware would =
initially be booting in each compute sled independently until it reaches =
a point where it trains and starts the SMP. At that point the host =
firmware merges into a single instance across all of the cabled compute =
sleds, giving a system where multiple BMCs are associated with a single =
host. Further, there is no rack controller BMC in the current system =
design.

This design bring a lot of interesting technical challenges. A few that =
jumped out:
- Providing a consistent external interface (Redfish) to a client that =
allows them to manage the entire system.
- Electing a BMC from the pool as the "system coordinator", that will =
act as the point-of-contact for the whole system and deal with the =
details of the BMC-to-BMC communication
- Keeping common data like BIOS consistent across the BMC=E2=80=99s (one =
design point we=E2=80=99d like is that the host firmware is abstracted =
from the system coordinator BMC and can query it=E2=80=99s data from its =
own (pre-SMP) or any (post-SMP) BMC)
- Handling the failure of a BMC (removal from system, reconfiguration of =
SMP)
- Handling the failure of the BMC acting as the system coordinator (fail =
over to another BMC, service IP address to potentially follow)
- OpenBMC applications that will need to know the system configuration =
and execute commands on other BMC=E2=80=99s
- Debug tools like obmcutil that currently operate on a single BMC =
system concept

There has been some great work going on within bmcweb recently that =
starts to solve some of these issues. This [commit][1] introduced the =
idea of =E2=80=9Csatellite=E2=80=9D BMC=E2=80=99s. bmcweb looks for some =
entity manager hosted objects that indicate configuration and login =
information for other BMC=E2=80=99s. If bmcweb sees those objects, it =
queries those BMC=E2=80=99s and return the appropriate data to the =
Redfish query.

Redfish has the concept of a [composable system][2] which is something =
that appears to make a lot of sense on us implementing (allowing a user =
to add/removed BMC sleds and perform common operations on system).

One design point we=E2=80=99d really like is that all communication from =
BMC to BMC is via Redfish, although for leader election and data =
consistency we were looking into something like [etcd][3].

As we walked through the different OpenBMC applications that would be =
affected by this system design (state management, host firmware =
failures, logging, code update, LED, SMP cable validation, =E2=80=A6) we =
found some functions that could probably just be handled within bmcweb. =
But other functions, for example one to validate the SMP cabling is =
plugged properly, would contain a lot of very specific business logic =
that doesn't seem to belong within bmcweb. This logic would need to talk =
with all BMCs, read ID bits and GPIOs to ensure the SMP cables are =
plugged correctly. Should bmcweb provide D-Bus objects that this =
application could operate against to talk with other BMCs? Should the =
application do direct Redfish to the other BMCs? Should we just bury all =
the logic within bmcweb itself?

Whether the system coordinator implementation is one application or =
more, it felt like a reasonable design point was to isolate the code =
from the general BMC implementation. We called this isolated code the =
"System Coordinator Application" (SCA). The fact the SCA must be =
"mobile" in order to handle fail over scenarios started to lead us down =
design a point where the system coordinator logic is not within the =
regular bmcweb instance. Possibly a separate bmcweb-like application? =
Not sure here but a differentiation between bmcweb, which runs on all =
BMC=E2=80=99s, and a system coordinator application that only runs on =
one felt better (although it very well could just be another application =
within the bmcweb repo that utilizes some of the same files as bmcweb). =
When we discussed this on discord, it was a wait and see what the code =
looks like type direction.

This is a =E2=80=9Cwhat we=E2=80=99re thinking=E2=80=9D type email and =
not meant to be a =E2=80=9Cthis is the way it shall be=E2=80=9D. We=E2=80=99=
re interested in any feedback from anyone who might have similar designs =
in the pipeline. Our goal is to start rolling out some design documents =
and work on some of the simpler code pieces to assess feasibility and =
things we have not thought of.

[1]: https://gerrit.openbmc.org/c/openbmc/bmcweb/+/53310=20
[2]: https://redfish.dmtf.org/redfish/mockups/v1/1151
[3]: https://etcd.io/=
