Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFE4A01C69
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 00:14:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRCln5574z3vXq
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 10:13:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b30"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735269789;
	cv=none; b=CXYucMmCX7YUdDceSqmcyH4Bnbeo72V4q7r2UBPRXEDbOjwJp1b4YOmkK/EQCKDmuVxT9gzljhUAfIifsT9lNCQ5wOhJ/02qjjnshieBPWlUzqjLxS1dGPonmqfWtEazfew0AdQOE2tCp6gDaC+lcXnCJM9ivil1d+CDR68R+bNna//h0udXIh3iKHVufLEaccdLVNTcrjAvSFlCRc+G7hWOIn2aEuSLZ+TLgZ+YwQ5B8IaHWgm8h26tiB1Arv8J4CZVnGvkIr3SAI8NF/LGswDx0hnzjsCA6rSPyF22jOLPoZdr8O8w/Tbr5B7Lw69GnlBUjbUvZje+ncx2xmXsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735269789; c=relaxed/relaxed;
	bh=GBUCN/dT/+LjApBLY70GChmQ3HYMxMbbxyRIqO99c4M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=EA0G+Js4dkKpTyV5/zURn3W/v6x+eV3xVPh0ESWfADRamiQCIkfdwfEOd1EdAkat/Kb3wriIc8iMlse6rTeI9JUcaeOzq8aipLw+uqcEXBnvYhUPM2wCnBwXrS6k041a87RNmsQ39jn55b2kmwAKl7+kzi8zzYlaHji4th5EC+S/sxCTXQedLUDsi5R7cBI0u24dv0NsA9c5vf1Poc56kLA7P/rIoXn1cKeHV9zlAHDlfunMCLw8bboK0ubL1zAbzpIHUemDlPuJhsOy9cPKZ1Ya44z9X5W7jy+qqcgcrLZzKKy7+zPUD0DyyIYoDNv6amQHTtXjX4gGZ1/O8rRJ2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hia1Ml+8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=ivan.zundel11@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hia1Ml+8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=ivan.zundel11@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YK9mr2Ykkz2xGC
	for <openbmc@lists.ozlabs.org>; Fri, 27 Dec 2024 14:23:08 +1100 (AEDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e53a5ff2233so5728876276.3
        for <openbmc@lists.ozlabs.org>; Thu, 26 Dec 2024 19:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735269785; x=1735874585; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GBUCN/dT/+LjApBLY70GChmQ3HYMxMbbxyRIqO99c4M=;
        b=hia1Ml+85zcq9KK9Re2dJ3mopYqT2v5mrzGjXXYqW68PRzKHiivA5zg47pWCb0rP7I
         QVf8H+Za22L0x/F+WzjU2Ekm40mDHnfRU7bRmdrNYPooaOVDySB1PwLwwww9xqKdAeUF
         xOeh5JOGGLegW2Tqb/Ns0/wX4sbv/oYcOiguCpdRohIi0W6psPofjmNghpXQ9n7SPFS3
         1zfGOAleSzMiAKyaLOSXB/o0giXoQAJYO2Aeyn1tnVJjEbyZpEtpeg44zqVtUUSEsi5k
         JJwv2VRcA3d3WLx5TGTYpd/XcGY/DeZ28IfAJ4tSTPlgQFSBy325F6MgMX9WNIKIGMsl
         Q13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735269785; x=1735874585;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GBUCN/dT/+LjApBLY70GChmQ3HYMxMbbxyRIqO99c4M=;
        b=GTFsdju/n74hVhJgPqi+GCRD6hDshZ7GNXmKusUfKBzusTq2e6Vwfiys6tgWGhgwt6
         zwG0Sj+JZpzP/ogvmFT6Mps6SdsPhg7Ksi74aQP/NydD2vUKXVX889zqcPoDJhca93Y+
         DnSaoM8X8wkhF7cza67KCXGJlSZwpZ5lY71MJnfjTO4arl5z4eMKsU2VZAQBVoDPlLbM
         wT4EWZRgDcDokL7nL8MObb6wXcY97pjeuNLfun2OveqIzWH5dAc9FtFgW5u6RTooyn2Y
         8nXQ0DMpCubU9WJtS+4CW+T1sbAaB/5zysMCgsgH5vtFizZg4EDPgrgPozM5A3F4sZe9
         fmSQ==
X-Gm-Message-State: AOJu0YygI5Gd/TaicKS5E6i7XvQj2D8By/KNzfz0A4Tn/laGm3dKP5tw
	EwBojY2K/TFnYhUnqrjJR+d7blsRGCabUvJ6AfFevTKwHWsiSsJmvJk+I3WFNsyT4ejsydJhwZY
	EdlwWRD5A7K6rVYfYQoSLrAq84W7JE14=
X-Gm-Gg: ASbGnctBOovPDii0+ZncjtnFODmm7rmBzB1OMVxdt9Fo5OfBdEFUimMgkGpJzhFleaw
	5UV69y8+Cgmj5byzCCD5/mgxhpOGc5KN/9WM/Fs8OtTawSesrSlevIG6M9pc82rUcF0ON4g==
X-Google-Smtp-Source: AGHT+IH5gZSgtl3BpSjn6hXrV3KZqv7zZl8om68rQ5crhvgo+2Lq/Fm8rrRNW3WBlOdbzzjHP/UXu/rCNZCu6dKrtlc=
X-Received: by 2002:a05:6902:704:b0:e39:8d87:f146 with SMTP id
 3f1490d57ef6-e538c22410dmr20812044276.22.1735269785302; Thu, 26 Dec 2024
 19:23:05 -0800 (PST)
MIME-Version: 1.0
From: Ivan <ivan.zundel11@gmail.com>
Date: Thu, 26 Dec 2024 22:22:29 -0500
Message-ID: <CAJAqOU0+_PYs-53wPzu4xB3O347C-5VpW5hKp6ZM9ef0bSF17Q@mail.gmail.com>
Subject: meta-amd
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000247eb2062a37fb05"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 06 Jan 2025 10:12:37 +1100
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
Cc: supreeth.venkatesh@amd.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000247eb2062a37fb05
Content-Type: text/plain; charset="UTF-8"

Hi,
I recently purchased a SP5 machine and I'm trying to update the bmc since
it's not detecting a lot of the hardware due to some issues. Is there any
way to compile the OpenBMC for this ruby machine or if you could send me a
compiled build? I don't have internal access so it's erroring out.

Thank you!

root@ruby-208c:~# cat /etc/os-release
ID=openbmc-phosphor
NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
VERSION="v2.11.0.15b"
VERSION_ID=v2.11.0.15b
PRETTY_NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)
v2.11.0.15b"
BUILD_ID="v2.11.0.15b"
OPENBMC_TARGET_MACHINE="sp5"
root@ruby-208c:~#

--000000000000247eb2062a37fb05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>I recently purchased a SP5 machine and I&#39;m try=
ing to update the bmc since it&#39;s not detecting a lot of the hardware du=
e to some issues. Is there any way to compile the OpenBMC for this ruby mac=
hine or if you could send me a compiled build? I don&#39;t have internal ac=
cess so it&#39;s erroring out.=C2=A0</div><div><br></div><div>Thank you!</d=
iv><div><br></div><div>root@ruby-208c:~# cat /etc/os-release<br>ID=3Dopenbm=
c-phosphor<br>NAME=3D&quot;Phosphor OpenBMC (Phosphor OpenBMC Project Refer=
ence Distro)&quot;<br>VERSION=3D&quot;v2.11.0.15b&quot;<br>VERSION_ID=3Dv2.=
11.0.15b<br>PRETTY_NAME=3D&quot;Phosphor OpenBMC (Phosphor OpenBMC Project =
Reference Distro) v2.11.0.15b&quot;<br>BUILD_ID=3D&quot;v2.11.0.15b&quot;<b=
r>OPENBMC_TARGET_MACHINE=3D&quot;sp5&quot;<br>root@ruby-208c:~#<div class=
=3D"gmail-yj6qo"></div><div class=3D"gmail-adL"><br></div></div></div>

--000000000000247eb2062a37fb05--
