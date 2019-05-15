Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A145D1F4CB
	for <lists+openbmc@lfdr.de>; Wed, 15 May 2019 14:48:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453vVy0pQHzDqJj
	for <lists+openbmc@lfdr.de>; Wed, 15 May 2019 22:48:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::242; helo=mail-oi1-x242.google.com;
 envelope-from=ojayanth@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uhs7sm7e"; 
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453vK96N6jzDqcK
 for <openbmc@lists.ozlabs.org>; Wed, 15 May 2019 22:40:13 +1000 (AEST)
Received: by mail-oi1-x242.google.com with SMTP id m204so1710549oib.0
 for <openbmc@lists.ozlabs.org>; Wed, 15 May 2019 05:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=aIm96oxJTYEQivRVIInOlS9leVsnfzZ+2qZVwDrZkvw=;
 b=uhs7sm7e/ukvgnvn1tb2fuu/4TEjZXHHEZJ0khB0rroBJ8CWg17Q2xw1CgaACxCWQp
 95p5mrHMr29N9GIQFceSIDOs3mps3ebkJAwUd1pxlWlPc6ytOYfqAAeTIV5TEZsQcdEy
 ETV1cPw/zjYsp603fOV/cPHEQiQRiOMj9+oad7NXT01HfijhtKENe2o3ffsHCLx4LRtL
 lbG4pCW5OKQffZ7N1GqUxRNTrXwV0YvNLPsHIamZZ63CbscTQs+jC6YlajPbYsX4WrKm
 9L9Q419w6huuzk7L/rQOBIuii0EV+g9sHqqIFZ2zq/rKnZiClw3LQ+5sNHOIZC0AI814
 mxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=aIm96oxJTYEQivRVIInOlS9leVsnfzZ+2qZVwDrZkvw=;
 b=ApncwCNmQAbxNnyyIqoQmNv3f57KVM03NarT1wfenz2ErPcaTWVdSqYgfR3umZ2EZy
 4nj5bxN10W+h4VZMgleyhgI98Shof3aQOjv6WkUcZozhi1w1Ey78nuf+zuNr4cq4QHbI
 hDEL/NXVO+/Dbaa1ltRwSVZpBkw1ziIZjk9irApVNAXsLvzCs5d+YId+kRoV1LRn2ChY
 6Fdr5wmeWiym47zm1fcdG+CLl96sIa+bdh5v+8nxy/iLyHLzpk9dYXdowIemPkcURFiV
 BM3UBSqrhrgZX2X/hd3bpdxxn/fjwskL4nGRfFbMAhXMrJiEMnaGUIVQvu6/Enc1epPW
 hjnA==
X-Gm-Message-State: APjAAAUEux6rGf3k4xBEgSKQmjENIQGbB8ok31mbq3xWeUpNBMOjYHWA
 hQdZD9ramstPFzDd2NTRLTBvQnzrTAsvx3Cn/F1kac/H
X-Google-Smtp-Source: APXvYqx1vsN7WtucB7xfq7dMyo96CpZIjhX34+OzQapoJQAPlQsN3CtJYsO/MP4hoSba78ZuFsD0Eq2xP5ex0UM4Nto=
X-Received: by 2002:aca:a844:: with SMTP id r65mr1420127oie.50.1557924009940; 
 Wed, 15 May 2019 05:40:09 -0700 (PDT)
MIME-Version: 1.0
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Wed, 15 May 2019 18:09:59 +0530
Message-ID: <CACkAXSqktuOVy02_R9q4iWcTL=_v7iOrxoBOOCMb5xTAXnxREg@mail.gmail.com>
Subject: Add support to debug unresponsive host
To: openbmc@lists.ozlabs.org, geissonator@gmail.com, 
 bradleyb@fuzziesquirrel.com
Content-Type: multipart/alternative; boundary="0000000000003320d50588ec7319"
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

--0000000000003320d50588ec7319
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
* Reference: DSP2046 2018.3,
* ComputerSystem 1.6.0 schema provides an action called
#ComputerSystem.Reset=E2=80=9D, This action is used to reset the system. Re=
setType
parameter is used  for indicating type of reset need to be performed. In
this use case we can use =E2=80=9CNmi=E2=80=9D type
    * Nmi: Generate a Diagnostic Interrupt (usually an NMI on x86 systems)
to cease normal operations, perform diagnostic actions and typically halt
the system.
* ### d-bus :

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

--0000000000003320d50588ec7319
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">## Problem Description<br>Issue #457:=C2=
=A0 Add support to debug unresponsive host.<br><br>Scope: High level design=
 direction to solve this problem, <br><br>## Background and References<br>T=
here are situation at customer places where OPAL/Linux goes unresponsive ca=
using a system hang. And there is no way to figure out what went wrong with=
 Linux kernel or OPAL. Looking for a way to trigger a dump capture on Linux=
 host so that we can capture the OS dump for post analysis.<br><br>## Propo=
sed Design for POWER processor based systems:<br>Get all Host CPUs in reset=
 vector and Linux then has a mechanism to patch it into panic-kdump path to=
 trigger dump capture. This will enable us to analyze and fix customer issu=
e where we see Linux hang and unresponsive system.<br><br>### Redfish Schem=
a used:<br>* Reference: DSP2046 2018.3,<br>* ComputerSystem 1.6.0 schema pr=
ovides an action called #ComputerSystem.Reset=E2=80=9D, This action is used=
 to reset the system. ResetType parameter is used=C2=A0 for indicating type=
 of reset need to be performed. In this use case we can use =E2=80=9CNmi=E2=
=80=9D type <br>=C2=A0=C2=A0=C2=A0 * Nmi: Generate a Diagnostic Interrupt (=
usually an NMI on x86 systems) to cease normal operations, perform diagnost=
ic actions and typically halt the system. =E2=80=A8<br>* ### d-bus :<br><br=
>Option 1:=C2=A0=C2=A0 Extending=C2=A0 the existing=C2=A0 d-bus interface=
=C2=A0 state.Host=C2=A0 name space ( /openbmc/phosphor-dbus-interfaces/xyz/=
openbmc_project/State/Host.interface.yaml ) to support new RequestedHostTra=
nsition property called=C2=A0 =E2=80=9CNmi=E2=80=9D.=C2=A0=C2=A0 d-bus back=
end can internally invoke processor specific target to do Sreset( equivalen=
t to x86 NMI) and associated=C2=A0 actions.<br><br>Option 2: Introducing ne=
w d-bus interface in the control.state namespace ( /openbmc/phosphor-dbus-i=
nterfaces/xyz/openbmc_project/Control/Host/NMI.interface.yaml) namespace an=
d implement the new d-bus back-end for respective=C2=A0 processor specific =
targets.<br><br>## Alternatives Considered<br>NA<br><br>## Impacts:<br>NA<b=
r><br>## Testing<br>NA<br><br>Looking for input from the team on this=C2=A0=
 High level design direction approach.<br><br></div></div>

--0000000000003320d50588ec7319--
