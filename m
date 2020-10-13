Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8CE28D434
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 21:07:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9lRR4v6TzDqZk
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 06:07:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::633;
 helo=mail-ej1-x633.google.com; envelope-from=pparth@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=uU4dtjFe; dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9lQg4VXhzDqXl
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 06:06:49 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id c22so1377402ejx.0
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 12:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JKK0ITfHcjhdQC6dcvcLlbnw19oud19akkyz9iHjgew=;
 b=uU4dtjFeS3p/VgVgiH/IaDImtOx5rpM13zhjlYJ4auU+UUSLIvOZmCPPksPhcSIHrU
 /63sQUvud0fVxTYL3JZuMU9hutDT570HrzdvuIIzxX/OsLPsgBu30pkDzo87tbWRs8dW
 SWkq7bbym9VAK6Pm+33KZ36pt+A5PitvMlXxktmkrXyXP3hYmHoCgR4vTthXe8wojnhx
 KVeLYs16nCH3ycwfzXI8qWGBB+i2/O7wY+j2atbztDzMFYSPk/mC6iDVH0iK8HPc/UNo
 +fNn2KhFZYyu5o65syisE8kUPHQ2ika5ojQc6BA+crQsLETHqRc3+40x0GIiiBetgq77
 tXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JKK0ITfHcjhdQC6dcvcLlbnw19oud19akkyz9iHjgew=;
 b=U9krB9XnJIDnBdaykJKBjL7VLdoeGxXySzwVc7LwQd2+oWwX5kl3GKQpLrHweVzZhs
 nUnraA99GxDBuNg+pl+jEBCCztLgGBKxS/myKiKNCQx0L3H2+YzN1bUL1bMplyAxNP5w
 wTU5CvzGSW+zej6Ia8NZR6F5gCZhicpYsLl2I8Y6w9yEoETZhkPZXKXQOzTOctLnPdAq
 rxsSRjl+95YffiRTPE+ZbS6aOUO3F1ddJ1lDC/13qvMVaW7gyl1GZHmakKGF5mzeo+pB
 bTHYusTVXi/NVcbQxosiudAxffh1HX6GGWhn+DqhIvRPFfq4YfMRJoYrp5SHWdGKiIoH
 JPvQ==
X-Gm-Message-State: AOAM531dnYDe5L88/4snzwZrxFW1uxIJ2aPn01q8KfADYJHoB0GKxh4z
 fLq+QKRKjG3aUy9Tx+n9FGvNRGWjS8M8B1yhd3ujyV4LnaPI4g==
X-Google-Smtp-Source: ABdhPJwvfyyjJ+lZsmJaqfPyX/LR2Y4RWwyn3HZ1tLmP+YoEMQpGCwnLtOR/w0JEKHj+7spP8eoSkzrMZRKmU5ILUS0=
X-Received: by 2002:a17:906:314d:: with SMTP id
 e13mr1304748eje.412.1602616004293; 
 Tue, 13 Oct 2020 12:06:44 -0700 (PDT)
MIME-Version: 1.0
From: Parth Shukla <timevortex@google.com>
Date: Tue, 13 Oct 2020 21:06:08 +0200
Message-ID: <CAC1Cx+sq1RM4YBnbbiKq1uJ-1bjdETj2u116cSzsd2vhSo2K7Q@mail.gmail.com>
Subject: Security Working Group Meeting - Wed 14 October
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000a67f1e05b1921d81"
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

--000000000000a67f1e05b1921d81
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is a reminder of the OpenBMC Security Working Group meeting scheduled
for this Wednesday October 14 at 10:00am PDT.

We'll discuss the following items on the agenda
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDU=
WmAOI/edit>,
and anything else that comes up:

   1. (Joseph): Follow up from 2020-8-19: Gerrit code review: BMCWeb webUI
   login change: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/3545=
7
   Question: What are the security risks of using the proposed config flag
   BMCWEB_INSECURE_ENABLE_UNAUTHENTICATED_ASSETS=3DYES?
      1. Fingerprinting (leak information about the BMC=E2=80=99s manufactu=
rer and
      version).
      2. Attackers have an easier time getting the code to find and exploit
      security bugs.
      3. May make DoS easier.
      4. More?
   2. (Joseph): Per
   https://lists.ozlabs.org/pipermail/openbmc/2020-October/023530.html do
   we agree on the approach?  What security categories seem most important?

Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group

Regards,
Parth

--000000000000a67f1e05b1921d81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div dir=3D"auto">This is a reminder of =
the OpenBMC Security Working Group meeting scheduled for this Wednesday Oct=
ober 14 at 10:00am PDT.<br><br>We&#39;ll discuss the following items on the=
 <a href=3D"https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4x=
oJRQvLxxsDUWmAOI/edit">agenda</a>, and anything else that comes up:<br></di=
v><div><ol><li>(Joseph): Follow up from 2020-8-19: Gerrit code review: BMCW=
eb webUI login change: <a href=3D"https://gerrit.openbmc-project.xyz/c/open=
bmc/bmcweb/+/35457">https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/3=
5457</a> Question: What are the security risks of using the proposed config=
 flag BMCWEB_INSECURE_ENABLE_UNAUTHENTICATED_ASSETS=3DYES?</li><ol><li>Fing=
erprinting (leak information about the BMC=E2=80=99s manufacturer and versi=
on).</li><li>Attackers have an easier time getting the code to find and exp=
loit security bugs.</li><li>May make DoS easier.</li><li>More? </li></ol><l=
i>(Joseph): Per <a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2020-=
October/023530.html">https://lists.ozlabs.org/pipermail/openbmc/2020-Octobe=
r/023530.html</a> do we agree on the approach?=C2=A0 What security categori=
es seem most important?</li></ol></div><div dir=3D"auto"><font face=3D"sans=
-serif"><span style=3D"font-size:12.8px">Access, agenda and notes are in th=
e wiki:</span></font></div><div dir=3D"auto"><font face=3D"sans-serif"><spa=
n style=3D"font-size:12.8px"><a href=3D"https://github.com/openbmc/openbmc/=
wiki/Security-working-group" target=3D"_blank">https://github.com/openbmc/o=
penbmc/wiki/Security-working-group</a></span></font></div><div dir=3D"auto"=
><font face=3D"sans-serif"><span style=3D"font-size:12.8px"><br></span></fo=
nt></div><div dir=3D"auto"><font face=3D"sans-serif"><span style=3D"font-si=
ze:12.8px">Regards,</span></font></div><div dir=3D"auto"><font face=3D"sans=
-serif"><span style=3D"font-size:12.8px">Parth</span></font></div></div>
</div>

--000000000000a67f1e05b1921d81--
