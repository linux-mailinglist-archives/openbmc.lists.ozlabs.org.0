Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C6351D109
	for <lists+openbmc@lfdr.de>; Fri,  6 May 2022 08:04:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvg5M2V2wz3c1K
	for <lists+openbmc@lfdr.de>; Fri,  6 May 2022 16:04:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=djRW4GTN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=djRW4GTN; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kvg4w6LShz3bqd
 for <openbmc@lists.ozlabs.org>; Fri,  6 May 2022 16:04:30 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id y41so627531pfw.12
 for <openbmc@lists.ozlabs.org>; Thu, 05 May 2022 23:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=zmDbjFCUO9etDHREg+pJ53E2SH8ktdMRc6nf4hHusHw=;
 b=djRW4GTN+TJaPQs8ykmkVJuOQUTO5rZoYRK++Ft6yBc8rj7XZpTTmMuCxlt1Ivovbk
 DoElEKv+rOVYQ8S1gKCekQxIfFCs1vdS2UoKW88Fm3QGznsKt4cn5Yy4V5IreN4R84BB
 xmD1/eyjkMliIVnzYIwWUql9gIgHyg0XCZK+V9x7l6Rkjigu2WESZO1/yOxCTQDbrcSo
 FCLP5Bied4UgKAJ0ka6CoXbYddgMZb6PzQeWticHKlJ1jD3f9mW5ngGwsrKljNi1O3Sv
 SzWTmiwZuhGY8hC09whFOIT9TJiFeHSyNAT4d5S3+BoEJtHSMOBPB6GiFLZsa9AomgUb
 9pjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=zmDbjFCUO9etDHREg+pJ53E2SH8ktdMRc6nf4hHusHw=;
 b=Kf1dWuDhWs7rSKW9BdjC/B9KoAwlkHQaCBG1f7IN5K/qTb0EoRwaJx0b41a+Xa2rge
 7WPfOqJr1b1E51QnyipEClnRuqn61U0g++03IGRhEYMalrQ5idaWCEdJe+eU74x7tmsL
 FohMFmRWtDEt4HlSRvMHPerw2hLl+FoHJXH1HLz2Xf8tl04sHlTzTWHWE1HuvoMcQUWj
 0rP7tLuJYYaBUpM8112rjCa6ll7Yzl81ggcBBo2v+LNTVSr2IcfvtBcu0Feuv5s2zgAw
 TfiHsUfFSWIwkiF2vC+WAEYS2gHXUHAcuHMH2F7e/QPkMM+Jo1XImewTx0qKqBOT/1d+
 FOgA==
X-Gm-Message-State: AOAM532QUpsBnCYoSre6sdbXGT2uedo4i+hx+ZkYKG79iozdUn9Qze6S
 lWTjMcKIJmP6vTmMdyj/xma3iNcsszBzqx+XLYVQ/p3+pxf6vg==
X-Google-Smtp-Source: ABdhPJxDdFNQ6J772dQBoQrmRoTXrC8A6F+Zx9vTI9trJdoyDpWxIFI6UHsQ/T3abZZtlDD5eF5ZsYI5UCKAQLFWk9I=
X-Received: by 2002:a05:6a00:114b:b0:4f7:915:3ec3 with SMTP id
 b11-20020a056a00114b00b004f709153ec3mr1807905pfm.8.1651817067134; Thu, 05 May
 2022 23:04:27 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Rudolph <patrick.rudolph@9elements.com>
Date: Fri, 6 May 2022 08:04:16 +0200
Message-ID: <CALNFmy39ph1pQoVavHZbdTCACLMxf38f86WKH-CbPbrHDoomNg@mail.gmail.com>
Subject: Aspeed platforms: MAC address provisioning
To: openbmc@lists.ozlabs.org
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,
I'm looking for the generic "OpenBMC way" of provisioning the BMC MAC
address on platforms with an integrated NIC. In the past there has
been the u-boot "u-boot-initial-env" target to create an environment,
but it's no longer used on u-boot-common-aspeed-sdk_2019.04.

What's the default/common/preferred way of provisioning an unique MAC
address in production? Should it be stored in an I2C EEPROM or should
the u-boot env be created from the running system?

Regards,
Patrick Rudolph
B.Sc. Electrical Engineering
System Firmware Developer

9elements GmbH, Kortumstra=C3=9Fe 19-21, 44787 Bochum, Germany
Email: patrick.rudolph@9elements.com
Phone:  +49 234 68 94 188

Sitz der Gesellschaft: Bochum
Handelsregister: Amtsgericht Bochum, HRB 17519
Gesch=C3=A4ftsf=C3=BChrung: Sebastian Deutsch, Eray Basar

Datenschutzhinweise nach Art. 13 DSGVO
