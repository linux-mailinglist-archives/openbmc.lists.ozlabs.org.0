Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F86A2456A
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2025 23:56:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YlB840dvLz3c86
	for <lists+openbmc@lfdr.de>; Sat,  1 Feb 2025 09:56:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b34"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738364161;
	cv=none; b=PGvBO1SEabq4N24W7+Wip51DvHuniMU+HzPBi2Uo1CDkmlzi+4hcga8qcHEGQN0Naqox8J3H4QxExGqfWPo2FGoGvW+ySiK+yXdkApsD5yG0LZPzzEgGsfdePcTt9HUXkTEYyexeW8tymSSZQHLbIp5Ai3wAZdbQjrlf4/ElnKoOEmgVpTta7SO59wAGrVe2BxkHcBQsHp+7KeRrD8/h/koez1J97GAIt/W7AaZYj8CNpgt2icUBljcZOH67Rz4n27klwOGrt3ovDbQNkgPjSgYD7IXRrAvkRybopQ/PwJSVGRB3kt32QKwwitRpdbkpRm4zFQUpVpNeFXIey2SXcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738364161; c=relaxed/relaxed;
	bh=DNH+dcpOk3NNREXIMj9oFLujMTahnuE+440gR1UD7G4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Yxf0Ko9Nhk/NgbtuPLmOsmknxQajuEAW0f6N/Adh7kl3SC6lvjCF0hOJTtjExYZqGLZBt0M2l1MWH5tPXQrWel21GeXnQFosnK2wv3F2ph2RgSXnQxTiYfCbbb+NrLFK5xolU1/cnMtpiGfwqBjKuZlGwtjNViSQdcS0WlVCxeUP26XkRb/ZoCXcTwsFhXXWDglfNknFjmO1cjdf/cX7PUGCStaJDGyBnxS2y2/YrKo3QWvhpbrjtSuU1G0vXXA1tHY1l6bcQvqIr/M3xqkxxoIXmElqG0k4vHn5ZREjyNyKUiSWGs/8HJp4Yyz3zkuE/WMTX38tLm47veAgJ4GyOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=aeoncomputing.com; dkim=pass (2048-bit key; unprotected) header.d=aeoncomputing-com.20230601.gappssmtp.com header.i=@aeoncomputing-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Svhp9u2J; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=jeff.johnson@aeoncomputing.com; receiver=lists.ozlabs.org) smtp.mailfrom=aeoncomputing.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=aeoncomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aeoncomputing-com.20230601.gappssmtp.com header.i=@aeoncomputing-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Svhp9u2J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=aeoncomputing.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=jeff.johnson@aeoncomputing.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YlB7z5xZSz2yFB
	for <openbmc@lists.ozlabs.org>; Sat,  1 Feb 2025 09:55:59 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e58a6c467d8so421724276.3
        for <openbmc@lists.ozlabs.org>; Fri, 31 Jan 2025 14:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aeoncomputing-com.20230601.gappssmtp.com; s=20230601; t=1738364156; x=1738968956; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DNH+dcpOk3NNREXIMj9oFLujMTahnuE+440gR1UD7G4=;
        b=Svhp9u2JGphyty+IPNFdFuKIpF3EaUNkXkiNhIh+1DoY/XkTXEAIl23YmTAJ6q+kE+
         MbvQCrU150xd4TgjTBw1hkjxfWOqMtwNnOgqXTiRRmNA8Rfheeb44fwa5f70LggkQ4z/
         32rvTZxWWtM14ycB/G9EgdwKBTr0ToVj19PC5FDYmFofCR948myGSuBm4Os/noM4aaHG
         Ogcs/OdifXJwjPd/rE/PEEPwZmhn+YQe8EpYvPOSS42f9yuV8CCgNd+uIuHiloOoJ/Qx
         HVa5z97n1s0vEKQf1Bfq4ieDAuTNOC3BXTsPQj99PC8vos/tATbg203bwmKsvHOCkhQ8
         iAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738364156; x=1738968956;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DNH+dcpOk3NNREXIMj9oFLujMTahnuE+440gR1UD7G4=;
        b=BBlmgB/nsIppbsDvl/+egKXOslNOkOSJ8rnIiHgmkzJcMfR2Xh5EhnQcntePa5TlVM
         QAZiAbm4gnl06CcNaLb3w6g70E7OjDS4Gd13avaTzJPKTYbyrbdDwMJC+kz6vFnON8r/
         Keb3287hca8FAYZNw6t6tEJP5tGVrYB99PCJtdVCjRIeOaGsyQ3VCjxZ62vJJ9m2sFm/
         8Vrgq4mBC5K/1ysItA1ZLlO5mDGa7HGYTSwltf9XBXUuZs68zj37RnrrdMzIj/9F8tfJ
         Zenc4JQl0TFaHl2+BOaf71PLsdZ2297fl8RGY4EVejPB49r7WsOsbUCaWscf1miXegHB
         oSCg==
X-Gm-Message-State: AOJu0Yw/9l18gw4n9c9MaFy1pTFsDHs8pwnrerrDu+7kqzTzObfrX11y
	AFjPAEUqFem552QLWkvr+QWOubgT3fI93FY6g4O+HTY0NRXKxZ5bR3P2G4jEh2rKS8hQ08YxiHE
	aknv0DR64Io0V96/ueIc+jBg2BGF0/gFKYZ2Aiy2vKYb6u/TyFGtDHA==
X-Gm-Gg: ASbGnct8bruKWIqXtsLhO7KrwTR0tUtc0nZT7820TznbuhjDX5wVdzJCibut6AU5qQ4
	vPgTVH43s36l6fW7sA+S3UAQmI0OfD4nFXYWVFEAkCVsO9X+umI7gbqH6lLIPinwmwRfrqhYo
X-Google-Smtp-Source: AGHT+IEXxcC8s1jKszCkP9mR8qHGPODLsa+lJ7boQbRkmfUD/79GhwYrGpcpoLj5VlDKIHwU7bpimxKX2604CEWoYe4=
X-Received: by 2002:a05:690c:39a:b0:6ef:9c5e:5c7c with SMTP id
 00721157ae682-6f8c1ae9bc9mr28353967b3.0.1738364156224; Fri, 31 Jan 2025
 14:55:56 -0800 (PST)
MIME-Version: 1.0
From: Jeff Johnson <jeff.johnson@aeoncomputing.com>
Date: Fri, 31 Jan 2025 14:55:45 -0800
X-Gm-Features: AWEUYZmtsxIGtMhn-IF2FYzGmwhrEspJxfjMJQPTgjerNKx26PK_E6SeUGSfjGU
Message-ID: <CAFCYAsdBV+j-7quHMMrRSmghFJL_MfeuDO5ufLMbbcQgpO45AQ@mail.gmail.com>
Subject: Question regarding OpenBMC crashing and messages of U-Boot SPL
 Already initialized
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000005c3bb062d0872ee"
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

--00000000000005c3bb062d0872ee
Content-Type: text/plain; charset="UTF-8"

Greetings,

I'm seeing random crashing of openbmc 2.16.0-dev on an ASpeed AST2600. I am
trying to make sense of what I am seeing. Most of my experience is in the
x86 arch world, not Arm.

OpenBMC is running on ASpeed AST2600 devices, not QEMU. If I log console,
when a device crashes I see the below in the console log. Why would the SPL
be repeated trying to load when the system (BMC) is already up at init
level 3?

Thanks in advance for any feedback.

--Jeff

#--start console output--
[  OK  ] Started Phosphor Inband IPMI.
[  OK  ] Started Phosphor Time Manager daemon.
         Starting Phosphor IPMI KCS DBus Bridge...
[  OK  ] Started Network IPMI daemon.
         Starting VES Ethernet over USB gadget device...
[  OK  ] Started Phosphor IPMI KCS DBus Bridge.
[   32.252854] configfs-gadget.usbnet gadget.0: HOST MAC 4e:96:48:66:73:d7
[   32.260416] configfs-gadget.usbnet gadget.0: MAC d6:a8:1f:95:d9:0a

Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) nodistro.0
localhost ttyS4

localhost login: root
Password:
root@localhost:~# BP0c00

U-Boot SPL 2019.04 (Oct 08 2021 - 00:31:50 +0000)
already initialized,
U-Boot SPL 2019.04 (Oct 08 2021 - 00:31:50 +0000)
already initialized,
U-Boot SPL 2019.04 (Oct 08 2021 - 00:31:50 +0000)
already initialized,
U-Boot SPL 2019.04 (Oct 08 2021 - 00:31:50 +0000)
already initialized,
U-Boot SPL 2019.04 (Oct 08 2021 - 00:31:50 +0000)
already initialized,
U-Boot SPL 2019.04 (Oct 08 2021 - 00:31:50 +0000)
already initialized,
U-Boot SPL 2019.04 (Oct 08 2021 - 00:31:50 +0000)
already initialized,

--00000000000005c3bb062d0872ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Greetings,</div><div><br></div><div>I&#39;m seeing ra=
ndom crashing of openbmc 2.16.0-dev on an ASpeed AST2600. I am trying=C2=A0=
to make sense of what I am seeing. Most of my experience is in the x86 arch=
 world, not Arm.</div><div><br></div><div>OpenBMC is running on ASpeed AST2=
600 devices, not QEMU. If I log console, when a device crashes I see the be=
low in the console log. Why would the SPL be repeated trying to load when t=
he system (BMC) is already up at init level 3?</div><div><br></div><div>Tha=
nks in advance=C2=A0for any feedback.</div><div><br></div><div>--Jeff</div>=
<div><br></div><div>#--start console output--</div><div>[ =C2=A0OK =C2=A0] =
Started Phosphor Inband IPMI.<br>[ =C2=A0OK =C2=A0] Started Phosphor Time M=
anager daemon.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Phosphor IPMI =
KCS DBus Bridge...<br>[ =C2=A0OK =C2=A0] Started Network IPMI daemon.<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting VES Ethernet over USB gadget dev=
ice...<br>[ =C2=A0OK =C2=A0] Started Phosphor IPMI KCS DBus Bridge.<br>[ =
=C2=A0 32.252854] configfs-gadget.usbnet gadget.0: HOST MAC 4e:96:48:66:73:=
d7<br>[ =C2=A0 32.260416] configfs-gadget.usbnet gadget.0: MAC d6:a8:1f:95:=
d9:0a<br><br>Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) n=
odistro.0 localhost ttyS4<br><br>localhost login: root<br>Password:<br>root=
@localhost:~# BP0c00<br><br>U-Boot SPL 2019.04 (Oct 08 2021 - 00:31:50 +000=
0)<br>already initialized,<br>U-Boot SPL 2019.04 (Oct 08 2021 - 00:31:50 +0=
000)<br>already initialized,<br>U-Boot SPL 2019.04 (Oct 08 2021 - 00:31:50 =
+0000)<br>already initialized,<br>U-Boot SPL 2019.04 (Oct 08 2021 - 00:31:5=
0 +0000)<br>already initialized,<br>U-Boot SPL 2019.04 (Oct 08 2021 - 00:31=
:50 +0000)<br>already initialized,<br>U-Boot SPL 2019.04 (Oct 08 2021 - 00:=
31:50 +0000)<br>already initialized,<br>U-Boot SPL 2019.04 (Oct 08 2021 - 0=
0:31:50 +0000)<br>already initialized,</div><div><br></div></div>

--00000000000005c3bb062d0872ee--
