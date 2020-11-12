Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0242B09DF
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 17:26:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CX6RR244FzDqc2
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 03:26:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=X3jUu2zx; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CX6QY2rSZzDqyn
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2020 03:25:21 +1100 (AEDT)
Received: by mail-yb1-xb2f.google.com with SMTP id o71so5582395ybc.2
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 08:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Srv+B9unry6vpbdPCDcliE4nVDz68FXDEJ/JltzcItk=;
 b=X3jUu2zxfMnPL/mI8BNKvsNfmcVk8G5LBxYcQrpY4gr/TgsuRJ+L4y1qZi/gCC7Q0c
 k2NZd4jxcIGLzdiH+8OCKGOzh2/vEUBBrJ6D9TycqWUZpCJs3oSJlxn04ZKsgjUBWWI5
 AGZrslVDsefnO+XB0EhOXvKtDIazC5+m8kJECeLK2KGmkcvbdRY55SpuHMYDB2W3EECt
 t8vgMMpIFEApFQTEN2xzlb9dqurEHODM/6baJ8Kb3WLe8O1eK0EQ4kdQDzxfN47+ElAP
 swng3dmCIl3jf19SOKsBlSNRJW9/ZSwjcyveEDUp7pWXzhUGPLIwZ+5x3P3GAo8oRm/b
 Z7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Srv+B9unry6vpbdPCDcliE4nVDz68FXDEJ/JltzcItk=;
 b=LwIuHYCpr1nb8yoVCn58OwiObktmJ4U/k0b60cdcQMw9uNtExoZ3XeewdIX0SyJKY5
 7HXa8dlKVwgyaPBRMWa60bCIzDuXd8b/N06Z1V8eUYomnZ2DLPscwpnpuTJvzKfZ2GQY
 cLPJksKW9uIlg+5XYljc0kGN2n2jqvq1Q2RWeeRbUMzhHObAeHwnU5SvbnpAwKBqo7dG
 nBAz85pIjapkSd42Ue1VHCM07/i78bER8QsVLnMQAGDS+JWMY34RoCa5XG7d28llzwpY
 9s4ZYY1IBYnbIhBKtnxj5qxvHFYB5+gwQWb2y0SBVJ0KLYvlYlWBZcX3ye68+nL++2j5
 KBjQ==
X-Gm-Message-State: AOAM531Ur2MjnFdbFUJBcmse2uLwT5DYOnr3XH6NXmXoQodvgfTDAjkn
 Da4862zvsHDuELRJshjYaFsE+qYr/ts0WWuWXdWZxg==
X-Google-Smtp-Source: ABdhPJwQvwLS1yUJYMpd3MZEINA32ootyMw/Y/sOTOq3anOgLG5wiWrizZAUYlEn7TAywWp569vMz4AFLcjz+4dcicM=
X-Received: by 2002:a25:3603:: with SMTP id d3mr192265yba.170.1605198317871;
 Thu, 12 Nov 2020 08:25:17 -0800 (PST)
MIME-Version: 1.0
References: <OF51173777.BBAB38E9-ON0025861E.0014BEED-0025861E.0020A56A@notes.na.collabserv.com>
In-Reply-To: <OF51173777.BBAB38E9-ON0025861E.0014BEED-0025861E.0020A56A@notes.na.collabserv.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 12 Nov 2020 08:25:08 -0800
Message-ID: <CACWQX82Ab4bXSrn2f+LQqbA3nVJ32UPVEOzQ97RXU+iLp9u0uw@mail.gmail.com>
Subject: Re: support NVMe drive health monitoring
To: Jet Li <Jet.Li@ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: andrew@aj.id.au, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 rashmi.r.v@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Nov 11, 2020 at 9:56 PM Jet Li <Jet.Li@ibm.com> wrote:
>
> Hi Ed, Rashmi,
>
> IBM are working on supporting NVMe drive health monitoring for some new s=
ystem designs and have been posting some patches to dbus-sensors (e.g. [1])=
.
>
> [1] https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/38058/
>
> As some background our high level requirements are that we need to:
>
> 1. Monitor NVMe drive health to supply data for fan management and error =
logging
> 2. Support arbitrary drive configurations in the platform(s), which are p=
lugged into removable IO cards
>
> As you're no doubt aware, NVMe drive state is exposed via two interfaces:
>
> 3. A Basic Management Command over SMBus
> 4. NVMe-MI over MCTP, via the SMBus MCTP binding
>
> And in OpenBMC there are two corresponding NVMe monitoring implementation=
s:
>
> 5. phosphor-nvme: Basic Management Command, static configuration
> 6. dbus-sensors: NVMe-MI over MCTP, dynamic configuration
>
> IBM are migrating our BMC designs towards entity-manager and dbus-sensors=
, and our newer system designs would benefit from dbus-sensor's dynamic con=
figuration via entity-manager (we have reservations about the drive presenc=
e GPIO configuration in the phosphor-nvme with respect to our system design=
s).
> Zooming out briefly we're looking to, where possible, use upstream code a=
nd avoid the use of forks. However, as dbus-sensors uses NVMe-MI over MCTP =
via libmctp, we have some concerns:
>
> 7. Upstream libmctp (openbmc/libmctp) currently implements just two bindi=
ngs
>     a. Serial (DSP0253)
>     b. ASTLPC (Vendor-specific binding)
> 8. Intel have forked libmctp (intel-bmc/libmctp) and implemented a furthe=
r two bindings
>     a. SMBus (DSP0237)
>     b. PCIe VDM (DSP0238)
> 9. Both the SMBus and PCIe VDM binding implementations in intel-bmc/libmc=
tp require kernel patches that only exist in Intel's OpenBMC tree

Nit;  the SMBus side requires one patch which was written by aspeed,
and was part of the Aspeed original BSP.  That doesn't exist "only" in
the Intel tree.

It should also be noted, this patch was in fact submitted to the
kernel, and hopefully looks like it just needs some minor cleanups
that never got done.
https://lkml.org/lkml/2018/4/23/835

PCIe VDM, I agree with you, is only in the intel tree.

>
> Finally, for the moment, the data provided by the NVMe Basic Management C=
ommand meets IBM's current requirements, and we're using drives that suppor=
t the Basic Management Command.
>
> So the direction we chose is to use entity-manager and dbus-sensors for N=
VMe drive monitoring, and
> implement support for the Basic Management Command over SMBus in the NVMe=
Sensor application. To get there, as far as I have determined, we should do=
 the following:
>
> 10. Make optional the dependency of NVMeSensor on the forked libmctp
> 11. Add a compile-time flag to {en,dis}able the MCTP NVMe-MI backend
> 12. Add a compile-time flag to {en,dis}able the Basic Management Command =
backend
> 13. Patch intel-bmc/openbmc to configure NVMeSensor with MCTP NVMe-MI ena=
bled
> 14. Change the default build configuration of NVMeSensor use the Basic Ma=
nagement Command
> 15. Enable out-of-tree builds of NVMeSensor by default
> 16. Add NVMeSensor unit tests
> 17. Enable CI for dbus-sensors where we can / is necessary
>
>

You've listed quite a few things here, but I'm not following "why" we
need two NVMe implementations.  MCTP NVMe-MI is more feature rich, and
is much better supported than its MI basic brethren, and generally
provides more information.  Considering we have patches to do it, why
don't we just work on getting the required patch upstreamed?  On top
of that, the committee that writes the NVMe-MI spec keeps threatening
to deprecate it, so we might end up with code that's used for one
generation, then never again.  I really don't like the idea of having
a second NVMe subsystem just because one is _slightly_ easier to
write.  If there's other good technical reasons why a user would
prefer MI-basic, and we can get those reasons written down, I'm happy
to hear them, but if the overall reason is "we don't want to upstream
code to the kernel" that doesn't seem like a good enough justification
to build out support for both;  Especially considering the MI basic
functionality probably would best be done as a kernel driver.

It should also be noted if we end up doing this, I'd probably advocate
for it to be its own separate sensor, distinct from the MCTP one,
because from a BMC perspective, it has very little in common with the
existing NVMe sensor (different protocols, different IO loops, ect),
and would probably be a good candidate for adding the hwmon.  Also, it
would need to be distinctly selectable from the entity-manager json,
as some drives don't possess support for NVMe-MI basic, and we need to
keep track of which protocol to use in which case.

Thanks,

-Ed
