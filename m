Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2487B23F4F1
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 00:43:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNgPH4qVFzDqn4
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 08:43:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::234;
 helo=mail-oi1-x234.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=fidpTTXY; dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNgNP4YLyzDqlY
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 08:42:28 +1000 (AEST)
Received: by mail-oi1-x234.google.com with SMTP id v13so3306746oiv.13
 for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2020 15:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=NseO6BU13fliT8oyPH9TmU1yw0jAZ+BWzI6NKB71plU=;
 b=fidpTTXYRPnEtu6+Uj/7eYuwlBL/ZbHxcQHEjw3dipS9o0y5roVXyBORvPYJZmz5Vg
 yiu9qi/+lkyXfTZKmQRVvDdynrxdnC6F8vBtxoJGCe+xf54c7rTUIubYywMU+qCHYkBz
 ZFUCMRvU9pyhCDKhN47X403vKND0xzF0Wr5YPRvV2NAhZ8gAh2FZjm4ieNOmNbscy843
 fhEEd4repI+seZT6MgiWQMwMy7plkYSZy0Kld28ofQ5qO7wVGZ+iTYh76TbL6Hw7CCEN
 tHM0mHomVYgUMf7kJBTCgo5Ny1iXNyw3QObTjT4Dd4JnIXfBLG4zDIpEVdFzN7mcrree
 LFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=NseO6BU13fliT8oyPH9TmU1yw0jAZ+BWzI6NKB71plU=;
 b=Oh4r5sksMI9aXwLEzyEwJSIb12sx16H6R44d5b6QCkVBrLDonwRDOwZIoofbRkPm4W
 GJjL23ONSVN3tKm1e0jsaRt4aSj/bvpK8eHNPOtBGIr/ViuqW0RjaiXIPY2/y7cDBotw
 WlRs1hBFBcLIwRalT9H4KAJK2UtTgNoLcE4M0lgvlIGdPEMbYkB3bUXRenlvO4lCN6e0
 1TlsPqcFqHi30bhlhLzNap4c6/dusGe7CYuYZIKWJ3Ye0h2iPuZVBgdpMNuPw2WpwNyw
 QUCGWAF8SJRO63z78Oxyx0eYuNUPyryGBzS0C4hNv1bzKGSsYficq0msWZCkBCUZ99UT
 JQRg==
X-Gm-Message-State: AOAM5315tkaaNv/bnf4EXAU44qw/HfYn0Ft/4a3oSmAE9c2e0JfnPtDX
 1ufH71VGakrXKt7L/2SAeQUL4DqpVkAKHxS5USQhzA==
X-Google-Smtp-Source: ABdhPJyteRUpJTBTxwKiQkhtj0SfIUklPyjyvkQUmJ19d7/ojtEmOf5IWfWgKiF2p0/zjsaZ8EScxvyaACQtzSkaQDU=
X-Received: by 2002:aca:490:: with SMTP id 138mr11640777oie.62.1596840145897; 
 Fri, 07 Aug 2020 15:42:25 -0700 (PDT)
MIME-Version: 1.0
From: Alex Qiu <xqiu@google.com>
Date: Fri, 7 Aug 2020 15:42:15 -0700
Message-ID: <CAA_a9xKze8pBf1zH0icAhQX55ESbtnqQMaTe-aTxnxBx5tfcCA@mail.gmail.com>
Subject: Inconsistent performance of dbus call GetManagedObjects to PSUSensor
 in dbus-sensors
To: Ed Tanous <ed@tanous.net>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000a9492505ac515180"
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 Drew Macrae <drewmacrae@google.com>, Josh Lehan <krellan@google.com>,
 Jie Yang <jjy@google.com>, Sui Chen <suichen@google.com>,
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a9492505ac515180
Content-Type: text/plain; charset="UTF-8"

Hi folks,

I'm branching this topic as Jason mentioned about this in the other topic
that he started, and I'll report the information I have for now. Sui and
Jie will follow up on this as they are actively working on this issue.

The setup has a total of 249 IPMI sensors, and among these, dbus-sensors
reports 59 objects from HwmonTempSensor and 195 objects from PSUSensor, and
we've already decreased the polling rate of PSUSensor to every 10 seconds
to mitigate the issue. As the intel-ipmi-oem does, we measure the time of
calling GetManagedObjects with commands:

time busctl call xyz.openbmc_project.HwmonTempSensor /
org.freedesktop.DBus.ObjectManager GetManagedObjects
time busctl call xyz.openbmc_project.PSUSensor /
org.freedesktop.DBus.ObjectManager GetManagedObjects

The first command for HwmonTempSensor constantly finishes in about 60 ms.
However, the run time of the second command for PSUSensor is very
inconsistent. Out of 50 continuous runs, most of them finish in about 150
ms, but 2 or 3 of them will take as long as about 6 seconds to return. This
results in long time to scan the SDR and inconsistent performance polling
IPMI sensors.

Thanks.

- Alex Qiu

--000000000000a9492505ac515180
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi folks,</div><div><br></div><div>I&#39;m branching =
this topic as Jason mentioned about this in the other topic that he started=
, and I&#39;ll report the information I have for now. Sui and Jie will foll=
ow up on this as they are actively working on this issue.</div><div><br></d=
iv><div>The setup has a total of 249 IPMI sensors, and among these, dbus-se=
nsors reports 59 objects from HwmonTempSensor and 195 objects from PSUSenso=
r, and we&#39;ve already decreased the polling rate of PSUSensor to every 1=
0 seconds to mitigate the issue. As the intel-ipmi-oem does, we measure the=
 time of calling GetManagedObjects with commands:</div><div><br></div><div>=
time busctl call xyz.openbmc_project.HwmonTempSensor / org.freedesktop.DBus=
.ObjectManager GetManagedObjects<br></div><div>time busctl call xyz.openbmc=
_project.PSUSensor / org.freedesktop.DBus.ObjectManager GetManagedObjects<b=
r></div><div><br></div><div>The first command for HwmonTempSensor constantl=
y=C2=A0finishes in about 60 ms. However, the run time of the second command=
 for PSUSensor is very inconsistent. Out of 50 continuous=C2=A0runs, most o=
f them finish in about 150 ms, but 2 or 3 of them will take as long as abou=
t 6 seconds to return. This results in long time to scan the SDR and incons=
istent performance polling IPMI sensors.</div><div><br></div><div>Thanks.</=
div><div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-sma=
rtmail=3D"gmail_signature"><div dir=3D"ltr">- Alex Qiu</div></div></div></d=
iv>

--000000000000a9492505ac515180--
