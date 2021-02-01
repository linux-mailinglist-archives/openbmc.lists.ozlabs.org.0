Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2CD30ACE1
	for <lists+openbmc@lfdr.de>; Mon,  1 Feb 2021 17:45:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTv2Y60pNzDrfS
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 03:45:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=vkrk.user@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EUmuIo3B; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTv1g4QNSzDrRW
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 03:44:52 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id h12so23659299lfp.9
 for <openbmc@lists.ozlabs.org>; Mon, 01 Feb 2021 08:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=KSMLITIxVeKbMm5Vnc4SaRf+y212Xp2DbExMAhs9w9U=;
 b=EUmuIo3Bbw3oAbMHHwB63ORdk+ptW4BBmFiWmrwHgwfqEGK1RfvkjyjfcosdRj6vEV
 AMADmsbeuIb/irVkQX9EO6IMJpL9V2WJhr9GvtAObpVdYaGZxpXsnunrwp62mkzm1VCf
 ld40nBOSxNZNHKqJb2mrTknHdTzfYRAW+yWRTW/VNW3gEcNn9GLLgSuc6gd0EemUWY7N
 bvMSnD5SBFpdaENzH0A9ojK6rUCWB/8vOKFCcoUa2fr7ypB3YIoRN9mXONVC8nMyADcx
 y3o9mo8/vnShwkuWPzwBimul4jQXPnB/+BH/c2pGJ3egAHSpdjMSP8bt/h984bB7Ndr3
 4cBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=KSMLITIxVeKbMm5Vnc4SaRf+y212Xp2DbExMAhs9w9U=;
 b=Y7+u/X/i17sXRr/ugNlaF9iF22wf6Wt+K3LvSljj/cBvje/I2WqJbMphADGbRUGsKg
 MinHf/evJNWrz6lGupWBhtuudMUUCGcOmkYezSZkSBiQQexmf8LbM9F8ttYPGGXksfCs
 qaoHJ69AszZBfX+GE9k3kBkwicokyBWjS2hJ1ACmKS6+nfvA2+Voyr/7RdM/x4SoM08P
 iPUyiJZFusxEULr4/7d1uNXkC+fWAiybHNGh8i4HLwlQeyNLmiSRU2nvawlQhj9Pf5SV
 Bo9fO/Yktznr/te9++chg4Qxe/F9sviawS5//qebwNCVyGVrA51GOSYZBu6kZpjyxzSL
 PV0A==
X-Gm-Message-State: AOAM532oi1h2n1YPL0c508K2fx3+v340t95V2NF73TXoOhaAVBg8skch
 dD2nE8P5xc4NSoV/LB2TBOZ3A3MIOzknpT2jW77b/XAQLXDUZw==
X-Google-Smtp-Source: ABdhPJyEtqehvHfHcMt/F7ZMIKBC1Jpz0XfWmjE7zNv8hFoW5TpDswIbJAjRsGH+VnqpbLU15P19csJhPaDM3hcuq64=
X-Received: by 2002:ac2:5f76:: with SMTP id c22mr9235517lfc.335.1612197888489; 
 Mon, 01 Feb 2021 08:44:48 -0800 (PST)
MIME-Version: 1.0
From: VINOTHKUMAR RK <vkrk.user@gmail.com>
Date: Mon, 1 Feb 2021 22:14:45 +0530
Message-ID: <CAHf5cse5eKPZOPxxh9imwVQAmG4rvWc-X+4LJh=CDFGzU=FeCA@mail.gmail.com>
Subject: AST2600: Linux driver support for PCIe RC/EP driver and USB 2.0
 Device controller
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000737c1705ba4912a8"
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

--000000000000737c1705ba4912a8
Content-Type: text/plain; charset="UTF-8"

Hello all,

I'm new to OpenBMC, I'm trying to look at 'AST2600' specific driver support
on OpenBMC Kernel (https://github.com/openbmc/linux). When I was searching
for the below drivers, they're not available in the Kernel repository:

- PCIe RC driver (where i want to see the complete PCIe tree from sysfs and
lspci etc..,)
- PCIe EP driver
- USB 2.0 Device controller driver

May I get some pointers/support on this?


Regards,
Vinoth Kumar RK

--000000000000737c1705ba4912a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,<br><br>I&#39;m new to OpenBMC, I&#39;m trying t=
o look at &#39;AST2600&#39; specific driver support on OpenBMC Kernel (<a h=
ref=3D"https://github.com/openbmc/linux">https://github.com/openbmc/linux</=
a>). When I was searching for the below drivers, they&#39;re not available =
in the Kernel repository:<br><br>- PCIe RC driver (where i want to see the =
complete PCIe tree from sysfs and lspci etc..,)<br>- PCIe EP driver<br>- US=
B 2.0 Device controller driver<br><br>May I get some pointers/support on th=
is?<br><br><br>Regards,<br>Vinoth Kumar RK<br></div>

--000000000000737c1705ba4912a8--
