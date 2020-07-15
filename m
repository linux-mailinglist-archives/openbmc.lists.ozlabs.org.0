Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7B2220CCC
	for <lists+openbmc@lfdr.de>; Wed, 15 Jul 2020 14:18:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6Gcz0S7czDql8
	for <lists+openbmc@lfdr.de>; Wed, 15 Jul 2020 22:18:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a;
 helo=mail-ej1-x62a.google.com; envelope-from=qweran@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jnWBof+y; dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6Gc62fc5zDqdS
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2020 22:17:36 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id dr13so1939695ejc.3
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2020 05:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=hah0+3fkElklJFKk3D7NnWFSzQag5OPkY8zTnUUJ8yY=;
 b=jnWBof+yYxPtc9EMYhoccLG8DSI87WWwMI+RUUadgc45e7VgQXBB4bUMq3gcDg6V/I
 DwpP5XqI42XILB0m6slt0defr5llKag5SdbYxsMVicPF0sGT1qTQ68cG0hQSRzKbdigK
 piXq1UOOtZlNhmI5Bhxf+vkd/Qp8yfVXCZxRwQZEKRwgh3EiLv6hqQIIbeoLIaXCaX7O
 WBgtYxsohd142IXQ3ghvHM8Ft8+S+Lr8JhjpAssCwRllWVZ5kf07Z7PI/zjtT7THzyfz
 I/lbdKLIzQAMXCzJiRdnz51kwYSTk/IZRJKMO1sTi6qmK1OA2f2GmQK3zh1W3jUNPu1O
 C9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hah0+3fkElklJFKk3D7NnWFSzQag5OPkY8zTnUUJ8yY=;
 b=gvdF1kLSM18EHq3t87aa45a0fHCOcoKm2j9HBFFeVDOasefj7ujBKZKimFOyhYGBrB
 m46tB0HxNDjEIBHwuVXV30K/FbPKL7Tlr9DpV8qqLBouhua5w/Age8fjO7TlfLwL1XAr
 K8tAF3Ix/ti1FtK0iSuslcGkQoyYS2S5oAlJTHY4w3NNA6CZrthcHgYlAzjBqZpCMwF8
 cNXab2+mfQVQrJjrR/3X1yIBIzUrSasVh0o5jwzTxfSpgSlJOlBMSlrgIVEVij1IyAkC
 x25ewQwFHhf9E6Lsm/X7Jo3vqqTMP2TRciqclkIP7NFYm7flkPGp6JuYD3kglmgBMQEV
 j32Q==
X-Gm-Message-State: AOAM533wfaEw8lLxKHlsaAuHXNCV75mZLDxSYKPujmF+j0/+BlF42v+9
 euMLMQScr9Yfnzz5brfEpeUf4ozEzq/+E5Rx03Vztg==
X-Google-Smtp-Source: ABdhPJzo/JO9ZPfYpMxXNw3U2CeIfkm+Pc9dYJAQ/2DbnjQSsWUbuNmHGD8HUYPVh2oOlwrk+kDN8s7odBnlI1QX90Q=
X-Received: by 2002:a17:906:511:: with SMTP id
 j17mr9453416eja.434.1594815451787; 
 Wed, 15 Jul 2020 05:17:31 -0700 (PDT)
MIME-Version: 1.0
From: Ilya Gousev <qweran@gmail.com>
Date: Wed, 15 Jul 2020 15:17:20 +0300
Message-ID: <CACS57oWum6NJghyv8904M+-GzrYy=LD93wvizGo8RagHOkOSZQ@mail.gmail.com>
Subject: Tiogapass build
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000007c75e205aa79e8dc"
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

--0000000000007c75e205aa79e8dc
Content-Type: text/plain; charset="UTF-8"

Hi!

I have tried to touch Tiogapass (by Wiwyn).
I have added the devices for KVM. And it works.
Now i want to get information about hardware (for example CPU and DIMM
imformation, like model, clocks, etc.). How i can get it? Only from IPMI
stack (like KCS)?

Ilya

--0000000000007c75e205aa79e8dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi!</div><div><br></div><div>I have tried to touch Ti=
ogapass (by Wiwyn).=C2=A0</div><div>I have added the devices for KVM. And i=
t works.<br></div><div>Now i want to get information about hardware (for ex=
ample CPU and DIMM imformation, like model, clocks, etc.). How i can get it=
? Only from IPMI stack (like KCS)?</div><div><br></div><div>Ilya<br></div><=
/div>

--0000000000007c75e205aa79e8dc--
