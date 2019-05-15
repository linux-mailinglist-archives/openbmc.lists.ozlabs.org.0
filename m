Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD37F1F4C6
	for <lists+openbmc@lfdr.de>; Wed, 15 May 2019 14:47:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453vTm0kd8zDqVy
	for <lists+openbmc@lfdr.de>; Wed, 15 May 2019 22:47:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::244; helo=mail-oi1-x244.google.com;
 envelope-from=ojayanth@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rf8KTVDv"; 
 dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453vDX43DwzDqY3
 for <openbmc@lists.ozlabs.org>; Wed, 15 May 2019 22:36:11 +1000 (AEST)
Received: by mail-oi1-x244.google.com with SMTP id a132so1702092oib.2
 for <openbmc@lists.ozlabs.org>; Wed, 15 May 2019 05:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=0aJzlFJHKl6eJdIrMEijKdC9i56twd/UJ5CTkZG3aHk=;
 b=Rf8KTVDvI5rJe9nzEGyiAfk57gwb/e1ZeB2low9mTywsud+DaIHaUhtaSwROhy/1XV
 QkJ5Z4D7TJNzznpHK8tmFPaETbq6IOGn8EYGI6TsrjEJw2BenEKUW2z43Juds5FG1Nwb
 X995eW/yAD3SPM4Up8LmhkI0g01vO8r5lhdzNrHiyi9bYjJ0psLZQ9b54h3Kvp0wIf4b
 hJma4cesDN37ADGtRms9h8CbeSi2oUondNWdeYh0xC6efJjJ4bg3+YWAs6wYnQSgz+Ji
 +HsqZbP44ekJXZRrJTI88l+HdHyXE7VvaS3Fz6IETLqnTnQhQ929UShwrZ+Ciw49q/aD
 Uhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0aJzlFJHKl6eJdIrMEijKdC9i56twd/UJ5CTkZG3aHk=;
 b=Ye0bi9ec1zzErY/+9BFMpNoPNgtL83QGYsz/DttxxdiFG6w1NJoghJY0lUoI/JhXLG
 kxDRWaLAr5tclUEwGMesTAEC+l72XfDl3MBrw4Po0udqkUGuzVspWQEiI4SGcw8NBDW6
 nAncbcBSqhSbrSA+Mhdl7NVThFwvheLIAoDf6824jSpCvUEa34JJnsZY8jA+nbxri2wz
 i4H2FMRerc2GyCrei7NWEo5obLzOpmyUW7Px6QFGxczlSpl8YvofjwyVXp0jKriJwsfZ
 mhj7EcoLUFOYRViQcdqWGe5+iP44W7fVWWjleJqiI1wECW7P0FBhJjSqkVR9zlA9K0OV
 Wnxg==
X-Gm-Message-State: APjAAAWSpAf6zLAjVmnF9tgUmUSZiULPEGU1hzI0Z4gxqkKAkB7eNUKy
 gQ4Tq+V+wpHXekpLMovg6GWrY6G1WMpQFhii8GzRxhD1
X-Google-Smtp-Source: APXvYqxj0nl7ANH/+uoUAddo79hqnrh4MMVakPSP1fgobmnUS6LBtzlJWhZdsCHswT1z4tHznVGP1u3RotwinbpqF6Y=
X-Received: by 2002:aca:a844:: with SMTP id r65mr1409160oie.50.1557923768242; 
 Wed, 15 May 2019 05:36:08 -0700 (PDT)
MIME-Version: 1.0
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Wed, 15 May 2019 18:05:58 +0530
Message-ID: <CACkAXSr4qMdxP9jRHmu4=yHe14Om8MQpcA4cNNdnyAAsjmGwtg@mail.gmail.com>
Subject: 
To: openbmc@lists.ozlabs.org, geissonator@gmail.com, 
 bradleyb@fuzziesquirrel.com
Content-Type: multipart/alternative; boundary="000000000000cb15ae0588ec644f"
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

--000000000000cb15ae0588ec644f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

## Problem Description
Issue #457:  Add support to debug unresponsive host.

Scope: High level design direction to solve this problem,

## Background and References
There are situation at customer places where OPAL/Linux goes unresponsive
causing a system hang. And there is no way to figure out what went wrong
with Linux kernel or OPAL. Looking for a way to trigger a dump capture on
Linux host so that we can capture the OS dump for post analysis.

## Proposed Design for POWER processor based systems:
Get all Host CPUs in reset vector and Linux then has a mechanism to patch
it into panic-kdump path to trigger dump capture. This will enable us to
analyze and fix customer issue where we see Linux hang and unresponsive
system.

### Redfish Schema used:

   - Reference: DSP2046 2018.3,
   - ComputerSystem 1.6.0 schema provides an action called
   #ComputerSystem.Reset=E2=80=9D, This action is used to reset the system.=
 ResetType
   parameter is used  for indicating type of reset need to be performed. In
   this use case we can use *=E2=80=9CNmi=E2=80=9D *type
      - Nmi: Generate a Diagnostic Interrupt (usually an NMI on x86
      systems) to cease normal operations, perform diagnostic actions and
      typically halt the system.

### d-bus :

Option 1:   Extending  the existing  d-bus interface  state.Host  name
space (
/openbmc/phosphor-dbus-interfaces/xyz/openbmc_project/State/Host.interface.=
yaml
) to support new RequestedHostTransition property called  =E2=80=9CNmi=E2=
=80=9D.   d-bus
backend can internally invoke processor specific target to do Sreset(
equivalent to x86 NMI) and associated  actions.

Option 2: Introducing new d-bus interface in the control.state namespace (
/openbmc/phosphor-dbus-interfaces/xyz/openbmc_project/Control/Host/NMI.inte=
rface.yaml)
namespace and implement the new d-bus back-end for respective  processor
specific targets.

## Alternatives Considered
NA

## Impacts:
NA

## Testing
NA

Looking for input from the team on this  High level design direction
approach.

--000000000000cb15ae0588ec644f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">## Problem Description<br>Issue #457:=C2=
=A0 Add support to debug unresponsive host.</div><div dir=3D"ltr"><br>Scope=
: High level design direction to solve this problem, <br><br>## Background =
and References<br>There are situation at customer places where OPAL/Linux g=
oes unresponsive causing a system hang. And there is no way to figure out w=
hat went wrong with Linux kernel or OPAL. Looking for a way to trigger a du=
mp capture on Linux host so that we can capture the OS dump for post analys=
is.<br><br>## Proposed Design for POWER processor based systems:<br>Get all=
 Host CPUs in reset vector and Linux then has a mechanism to patch it into =
panic-kdump path to trigger dump capture. This will enable us to analyze an=
d fix customer issue where we see Linux hang and unresponsive system.<br><b=
r>### Redfish Schema used:</div><div dir=3D"ltr"><ul><li>Reference: DSP2046=
 2018.3,</li><li>ComputerSystem 1.6.0 schema provides an action called #Com=
puterSystem.Reset=E2=80=9D, This action is used to reset the system. ResetT=
ype parameter is used=C2=A0 for indicating type of reset need to be perform=
ed. In this use case we can use <b>=E2=80=9CNmi=E2=80=9D </b>type=C2=A0</li=
><ul><li>Nmi: Generate a Diagnostic Interrupt (usually an NMI on x86 system=
s) to cease normal operations, perform diagnostic actions and typically hal=
t the system. <br></li></ul></ul>### d-bus :<br></div><div dir=3D"ltr"><br>=
</div><div dir=3D"ltr">Option 1:=C2=A0=C2=A0 Extending=C2=A0 the existing=
=C2=A0 d-bus interface=C2=A0 state.Host=C2=A0 name space ( /openbmc/phospho=
r-dbus-interfaces/xyz/openbmc_project/State/Host.interface.yaml ) to suppor=
t new RequestedHostTransition property called=C2=A0 =E2=80=9CNmi=E2=80=9D.=
=C2=A0=C2=A0 d-bus backend can internally invoke processor specific target =
to do Sreset( equivalent to x86 NMI) and associated=C2=A0 actions.<br><br>O=
ption 2: Introducing new d-bus interface in the control.state namespace ( /=
openbmc/phosphor-dbus-interfaces/xyz/openbmc_project/Control/Host/NMI.inter=
face.yaml) namespace and implement the new d-bus back-end for respective=C2=
=A0 processor specific targets.<br><br>## Alternatives Considered<br>NA<br>=
<br>## Impacts:<br>NA<br><br>## Testing<br>NA<br><br>Looking for input from=
 the team on this=C2=A0 High level design direction approach.<br></div></di=
v>

--000000000000cb15ae0588ec644f--
