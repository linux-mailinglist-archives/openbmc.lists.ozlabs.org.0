Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B79F2589738
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 06:57:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LyxKt1Mlwz305d
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 14:57:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dkp+/LZ9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=saiallforums@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dkp+/LZ9;
	dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LyxKQ4nqKz2xJ4
	for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2022 14:56:56 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id u1so18952034lfq.4
        for <openbmc@lists.ozlabs.org>; Wed, 03 Aug 2022 21:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=e+IVjuZbvj7n9a4CtjJTSqjNjG03is85QxDsWqQqyws=;
        b=dkp+/LZ9pI8CVczeO8TtfjBxdaJ00NT6NDxxbC0TdBndCxu2/5iN/feLqJKsU6RC6C
         V+hzOlU/7E5qm96ChbiaxJUJfgTJ1exGvAq4ffIgx/qof1AtA6exbi0BbvaSPQUHwc7s
         bqubk3/b/Icng9GwOozo2FUTHxJ32xHP8MO03NIC9I1DTvz3ernZjSI5chJO3RQahEyX
         aVbowod1HGraxxGhj/KPyrzsBZ9w3VsSRHcxwS1Lo+qBaG8pqIwnBeYSv6VnFUAgz5Pd
         bQx6tBMjLGkDt+hQKD+laBg4mTwvzMPwhzfs2vGInfk4sinIxoHxz7+R8zfr2Tt/8Pyh
         I/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=e+IVjuZbvj7n9a4CtjJTSqjNjG03is85QxDsWqQqyws=;
        b=zDB3cO+CLcfshtQ7zknHVNfUJuVArhtgDaiYJvUYBUbqaRLrAnVvfkvnXx9219EVOB
         721QC6o6d2AyfWzkxssL01GUQlsE6/MwQ3TDjLmxDBzbMrx/cnfgjRZDmG639+UVFJDn
         BYu1MBiJCSMTEv4ntm5MeB6hP+VHwFXx0l0SAdoIvnlRjPm8VmO81UgdpEDdmF92gm68
         b8OUF1gkkf5Cfi1qyavElWVlqmo6UKFjxsyXk3kR2YyY6X89qbXTMONuAB6mrcznw3vR
         Ii9bSXbWvG+MFvrfYK+ZAWJhQnuUoVPiI/I7wRR4ph5tOEaL2FcsplL0tTMhrg6dpog7
         9Wcg==
X-Gm-Message-State: ACgBeo01gjr+sCFCTxjBmB+XY8O3V5BXp4MBuZoqZ7PXvB3D7ACmdz01
	AG0RsHtw5rCByfisym3+ApvchcZYqjQYX83JzJEBDFB6
X-Google-Smtp-Source: AA6agR5/NDLkIIGaUeSti9K9XGexqKIi4mBTNTsgSJrQEodMgp7VDgDqnlhzjDOCXPnPMzhOdTPbSeSsnLPEDB4ANus=
X-Received: by 2002:a05:6512:6c5:b0:48a:85b5:d55f with SMTP id
 u5-20020a05651206c500b0048a85b5d55fmr86178lff.402.1659589009389; Wed, 03 Aug
 2022 21:56:49 -0700 (PDT)
MIME-Version: 1.0
From: sainath grandhi <saiallforums@gmail.com>
Date: Wed, 3 Aug 2022 23:56:40 -0500
Message-ID: <CABqzqi5+F65hsHTHojpRqNo2Z-tc9Ua-sYZzgWs2AAbf=MaQNg@mail.gmail.com>
Subject: AST2600 ARM CPU - 64 byte PCIe MemRd and MemWr
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000060bd8805e5632dcd"
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

--00000000000060bd8805e5632dcd
Content-Type: text/plain; charset="UTF-8"

Hello,
I am reaching out to check if someone knows how (or if someone tried) to
generate a 64 byte MemRd or MemWr PCIe TLP on an AST2600.
AST2600 uses Dual-core ARM Cortex A7 processor.

Quick search on internet says that X86 supports Memory Write combining
feature to be able to generate a 64 byte PCIe TLP. But there is not much
information about similar support for ARM CPUs.

Thanks

--00000000000060bd8805e5632dcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello,<div dir=3D"auto">I am reaching out to check if som=
eone knows how (or if someone tried) to generate a 64 byte MemRd or MemWr P=
CIe TLP on an AST2600.</div><div dir=3D"auto">AST2600 uses Dual-core ARM Co=
rtex A7 processor.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Quick=
 search on internet says that X86 supports Memory Write combining feature t=
o be able to generate a 64 byte PCIe TLP. But there is not much information=
 about similar support for ARM CPUs.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Thanks</div><div dir=3D"auto"><br></div></div>

--00000000000060bd8805e5632dcd--
