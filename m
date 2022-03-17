Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9454DCB63
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 17:26:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKCG01qJFz30NC
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:26:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a3+i7IVi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=hughsient@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=a3+i7IVi; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKCFb1hR2z2ynV
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 03:26:25 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id b28so9903367lfc.4
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 09:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=ykQKHVK/b41zQGXTI/OW0EU3BRHK1r2hC/K9YIKXRBw=;
 b=a3+i7IViUD+Ql3pNHnOm7TnlwU8NsQ73xHoAuMcoPtPNmEyFG/psJNlVH8Bz4sOHs4
 NWVKT/738Lntvz/kNYvhTPf/3aB45nKP86pv3a7ZFfsLji72VSD6LysLCXzy8HNN4MPu
 +tw3/EPaDBNgIySFHg9CW63lRjHDE89IRUR592EozNhkHFQFQLKmCgp7Uba/s1OsO7Jk
 KW4+uvTLPvZRM0h8jegi9QOzDiWXKAnJ7AfwS8nA5ctgIjHdlM8Jengxq3vaidAzTcay
 HjHYRaMKeuQv8/VYP/aGT2CW1j1JgrCejYNBfHdjm5saym0cCc5SDUvmovp6pJZ6XEGN
 aeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=ykQKHVK/b41zQGXTI/OW0EU3BRHK1r2hC/K9YIKXRBw=;
 b=zuQgjluWdghVA6kZ8VR9Rq33olV15DN3/Mv3O20wZ9gXhTYyLEUnSBAGIqCmJvXJlp
 9t7dGCYAP2rKOcjZV0ppee2/4Y6LK4ATLPJdG7CsnLKKkaXEGxMzH4miAA0PHORjvhvI
 HaZQaTNLkrj0nWe+TzUd9PJ4IMn7N3M1b+kqejNz5zMRV+nnEpMJs7WZYNlXc/PsN07g
 HPadqLEPODf+D4Rq7ocanRgNDLgDIeXl3bDPF2TU8nd2clJoBWh6RGplTSZseEVGlcuq
 Ex1GPOsYQVXZ8OspOPoGOi1vqsECrI/NE0AIDucVgIDBQbdFZbdZQ27W/hocDZ/fiKNc
 0y+g==
X-Gm-Message-State: AOAM530pv9TQvmYOPz5gOnqdeQUlMyRISWOTfqhcoscVaiAUpgnL9zlk
 HErrrrm3f4KmirJ+bhupfJxHIGrfG4PZe7ISThmz7wYSfnU=
X-Google-Smtp-Source: ABdhPJxu9k9hMCSuQAmzsI3ayNIaUb1E/KaFE1IhmDDhS6fdbz0EGnX6HHD4U9K8YxgwmiDE9HnrXqym8RhVrqPFxlQ=
X-Received: by 2002:a05:6512:2248:b0:448:6ef2:9b2e with SMTP id
 i8-20020a056512224800b004486ef29b2emr3425252lfu.179.1647534380363; Thu, 17
 Mar 2022 09:26:20 -0700 (PDT)
MIME-Version: 1.0
From: Richard Hughes <hughsient@gmail.com>
Date: Thu, 17 Mar 2022 16:26:08 +0000
Message-ID: <CAD2FfiEKfS-=ER9qJ9mftjCsiAiseytrDCcbiCn+EcyKOLd9Mg@mail.gmail.com>
Subject: Software Bill of Materials
To: openBMC Maillist <openbmc@lists.ozlabs.org>
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

Hi all,

A Software Bill of Materials (aka SBoM) is something you=E2=80=99ve all
probably heard of. In May last year the US president issued an
executive order titled Improving the Nation=E2=80=99s Cybersecurity[1] in
which it outlines the way that critical software used by various
branches of the government should be more traceable and secure. One of
the key pieces of information captured in a SBoM is =E2=80=9Cwho built what
from where=E2=80=9D. This concept breaks down for firmware, where lots of
different entities build each subsection in different ways, usually
due to commercial and technical constraints.

I've been thinking this about the SBoM problem from a firmware point
of view, but in a "BMC image" it's often lumped together as one thing,
but in reality a single BMC image might contain a BSP/FSP, microcode
blob, an EC, a root filesystem and a lot more. Even something as
seemingly-monolithic as a USB controller might contain a HAL from the
silicon vendor, an ISV-supplied bootloader and an ODM-provided runtime
firmware all built together.

I=E2=80=99ve been spending the last few months putting all the pieces toget=
her
to make a firmware SBoM not just possible, but super easy for ISVs,
OEMs, ODMs and IBVs to generate. This is so that vendors can make some
plans on how to be in compliance with any future requirement from the
US government, rather than reacting reactively. I was asked today if
I'd considered "the BMC blob" and the answer until just now was "no"
-- apologies if I'm coming across like a 800-pound gorilla but I
figured I'd get some discussion started.

For UEFI firmware, one of the problems is how to embed the software ID
(also known as SWID) metadata into each EFI binary. This is solved by
putting coSWID metadata (a DTMF specification[2]) into a new COFF
section called =E2=80=9CSBOM=E2=80=9D. This allows us to automatically capt=
ure at
build time some data, for instance the tree hash, and the files that
were used to build the binary, etc. This isn't so relevant for BCMs,
although some things like file hashes and tree hashes for the rootfs
probably are. The uSWID readme[3] explains how to do this manually.

The second problem is how to include SWID metadata for the blobs we
either don=E2=80=99t build, or we can=E2=80=99t modify in any way, e.g. the=
 BSP/FSP or
microcode. For this there=E2=80=99s an =E2=80=9Cexternal=E2=80=9D version o=
f the same coSWID
metadata which has a simple header we can find in the firmware image.
This can either be included in the blob header, or just included as a
file alongside the binary deliverable. The vendor can either use the
[pip install] uswid command line (more examples in the uSWID readme)
or more helpfully there=E2=80=99s also a web-generator[4] on the LVFS that =
can
spit out the tiny coSWID blob with the correct header ready to be
included anywhere in the binary image.

Open source firmware like coreboot is also in the same boat of course,
but here we have more flexibility in how to generate and include the
SWID metadata in the image. Some vendors are planning to work on this
really soon, so we can have feature parity for free firmware like
coreboot =E2=80=93 even when non-free blobs are included into the image so
that it can actually work on real hardware. For firmware like NVME
drives, NAS adaptors and the like the uSWID+coSWID blob can be
included anywhere in the image =E2=80=93 even in the
0xFF,0xFF,0xFF,0xFF,0xFF,0xFF =E2=80=9Cspare=E2=80=9D space left at the end=
 of the
update image.

This means the firmware blob will soon have the metadata from the IBV,
ODM and OEM all sprinkled around the update binary. The LVFS now
decompresses all the shards of the firmware, and does all the usual
checks. At this point we also look for coSWID metadata in the EFI
binaries and also uSWID+coSWID metadata for the non-free microcode or
SATA blobs. From this we can save any of the detected SWID metadata to
the database, and make it available as a SBoM HTML page[5] and also
.zip archive[6] containing the raw SWID XML data. We're also planning
a standalone tool which is more useful for the BMC firmware that's not
ever going to be uploaded to the LVFS.

If you do think it's helpful to add uSWID metadata to the BMC image
please let me know; I think this makes just as much sense for firmware
that sits on a USB hub as it does your system firmware. Comments
welcome. Thanks!

Richard

[1] https://www.whitehouse.gov/briefing-room/presidential-actions/2021/05/1=
2/executive-order-on-improving-the-nations-cybersecurity/
[2] https://datatracker.ietf.org/doc/draft-ietf-sacm-coswid/
[3] https://github.com/hughsie/python-uswid
[4] https://fwupd.org/lvfs/uswid
[5] https://fwupd.org/lvfs/components/12400/swid
[6] https://fwupd.org/lvfs/components/12400/swid/archive
