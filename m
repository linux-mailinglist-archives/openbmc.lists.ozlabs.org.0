Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B105D44D81F
	for <lists+openbmc@lfdr.de>; Thu, 11 Nov 2021 15:17:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqkMB4RRMz304t
	for <lists+openbmc@lfdr.de>; Fri, 12 Nov 2021 01:17:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h98KfKhe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229;
 helo=mail-lj1-x229.google.com; envelope-from=hughsient@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=h98KfKhe; dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqkLp3N9jz2yb5
 for <openbmc@lists.ozlabs.org>; Fri, 12 Nov 2021 01:17:20 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id z8so12178907ljz.9
 for <openbmc@lists.ozlabs.org>; Thu, 11 Nov 2021 06:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=Bse4adxE4e44Go3vyIVdmhc526CY8D8VmAClhrpwtvk=;
 b=h98KfKhe2Xml0DpPTdIVSh5DIm5COv4ujY1VZ+khmOl3KyroygGsn3Jq4zsAD04fpO
 IIxCbetbM8VeWEGnJQ4A9mjzPUOseiHvH2RmikZtBikISAWX0Dpga8xxYrfg4ps2U0aj
 /9U6BX0Wmbx3qAK48TVUUAABxgF8+tv1DHo2KDpoJzcQE9P/0WVEOg/o0h2jTgACUVuv
 Svt0urcYofeojitEJAvqKCjvJ7KfrxQvONA/a2ZP4gjjEUPZdbv7s+ud3WxRs4XUt0pK
 sxPHZNs/2mr0HgaBT8uxI/+mixyBXM49128MSjXyaIKNCtJvC+zxcKViLC6QfYstaE0D
 Dppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Bse4adxE4e44Go3vyIVdmhc526CY8D8VmAClhrpwtvk=;
 b=SKA3TFORG8uw5yH8jpynFXp9TOKN48DXc6e/ay+v1i2/J7pWID7okgAeEOIdwM692j
 UEnF3wlu1r/5qQdeCIMc5M3eDnQ29I269frJ5Jwtow01N2e/Wv1aF4fWtTl5ScFQMtGJ
 ykeItkkcHIeK0I+ZT9ZXtGwwW+vcLHJqKHjKkmRl5pq+JtBBYF1wIWO+w/1je6+EWzD/
 O3sgXDcnHjrquZvOeuKmJ+dSJR2+LGgnrbFKrFyqL+fgWjshXoa5B1rme1nhFDzAmdtn
 qI8gNcCZ5ilDS0lyNA08umWPIM4S0ThrIgNOFg0P2nB/DiQyNzfidgR8QRyhbrdydBFY
 dvsA==
X-Gm-Message-State: AOAM5336zWwY+/9R9OWTjlOncWAcRp1Ops8CnBrZOR63RBvmea4WG38O
 fsnxGzI8WwAusXUIO4QBK3CWllQBiM2zMv1piDS1KYAyxLI=
X-Google-Smtp-Source: ABdhPJwQjkKDGm5InVbr2hKavr+zcu5ONe4ksr59/XOLtNHRyxHCe47HVKJUrGAFraC+07ItkVz5HoHunz3/oLKCPd0=
X-Received: by 2002:a2e:9641:: with SMTP id z1mr7948750ljh.66.1636640230553;
 Thu, 11 Nov 2021 06:17:10 -0800 (PST)
MIME-Version: 1.0
From: Richard Hughes <hughsient@gmail.com>
Date: Thu, 11 Nov 2021 14:16:59 +0000
Message-ID: <CAD2FfiGpG_J5W8Ftdp5wE2wLB=7Tfmvfmivy0_4vW=D0fYdw3g@mail.gmail.com>
Subject: Redfish implementation does not supply SoftwareId
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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

Hi all,

My name is Richard Hughes and I'm the upstream maintainer of fwupd
which is a linux program that allows flashing hardware. It's used by a
few million people already and there's recently been a lot of interest
about getting fwupd to run on the actual BMC chip, rather than on the
host OS. That's not really what this email is about, but might explain
the bigger picture. I'll come back to this in a few weeks time :)

At the moment fwupd runs on the host OS and uses a plugin to
communicate with various Redfish implementations, for example iDRAC
for Dell or XClarity for Lenovo. Teddy Reed kindly donated (loaned?)
me some hardware so I could test the fwupd plugin against the Redfish
implementation of OpenBMC, more specifically git master on a
evb-ast2500 board.

With a small patch to fwupd (setting CURLOPT_SSL_VERIFYHOST=0) it
seems to load and enumerate correctly, but doesn't add any devices.
The reason I found was that the SoftwareId property is missing from
the /redfish/v1/UpdateService/FirmwareInventory/7d021ade path. The
SoftwareId is the "key" that maps the hardware to a specific firmware
*stream*, so for instance it could be something like
"USB\VID_17EF&PID_3083" for a peripheral or some other kind of
vendor-specific string, e.g. "SAMSUNG MZVLB2T0HALB-000L7". The idea is
that vendors then upload firmware to the LVFS website with a defined
*stream* and updates get deployed onto matching hardware
automatically. I'm not so sure that makes a huge amount of sense for
the OpenBMC BMC image itself. Or maybe it does; getting new official
OpenBMC images from the LVFS would be way cool, but I don't think we
want to flash the entire MTD image. Anyway, I digress.

I guess my question is if I could get a SoftwareId set for 7d021ade --
e.g. "evb-ast2500" -- that at least allows the device to enumerate in
fwupd and gives me something to test against. I guess my next question
is how a OpenBMC distributor adds a new device into
/redfish/v1/UpdateService/FirmwareInventory.Members -- and if there's
a way to set SoftwareId for that new device too.

Sorry if all these are newbie questions, and I appreciate any
pointers; I'm happy to send patches. Thanks.

Richard.
