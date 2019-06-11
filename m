Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD4B3C569
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 09:51:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NMd470W9zDqZV
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 17:51:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=tyler.sabdon@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RrUJ3ezy"; 
 dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NMcT1f4pzDqLV
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 17:50:32 +1000 (AEST)
Received: by mail-io1-xd2c.google.com with SMTP id s7so9070181iob.11
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 00:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2SPxpHDrmDPr5zLHcWbMciQ+mCs4hG7SY7KoK6UJw+U=;
 b=RrUJ3ezy/7hm+1MsMGG2eA+HWqjyU8KirM3PPWoD+UplLw+Pd87hBgEjdxcKsKk9Wu
 IksFIe4mby8K6a/2nLVDHTzEOFdgN3rsouNaAV50r+i03B9mV79NrQ0jCea0KmdTJa8I
 VgyuxbSr6nbYqUe1/Y3/+E7ZeoRXhTEhmv4bW7D/CyGwgHvnH6hLG2tGLHE1BKvKZ4uE
 ddmgsajxu07RXJbI/JwZ2U8l7Pn09+vRb1PqfiBDSYUUB/2Qrkfhs+sVE3oSRqcRZhU3
 LJF3Aq0y9Rurv2+EmVnsxpqj+00Wbvm/kOFOKaJChgRFmxg+LWR6HSVg1TLq0cEkQLtH
 Sb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2SPxpHDrmDPr5zLHcWbMciQ+mCs4hG7SY7KoK6UJw+U=;
 b=LeYX1zW8IRTxMYalTK9YAM2kRe8fBtxP4lzaWUJmjQMppJyz5UQzU+XWIRGM6oRqAK
 sQGx/9BB5fk5VKYqZaz53AtYvETShQEcTDfG+vFxWeVyQKLRG5KWHptULsnwAtQnz7vc
 bkDmM1vlhscqLGvzcNjl5bXMK+OSZBcfcrP5QNxoOPxDSTTaCYIhGyCqyjUmiF+9T6/2
 STQSO5vmkJqBjtLHD6dwoVPlgaHC7r5DMoMQXhVvdIlYj4L016UFLFaXBGtnqcnGbHQh
 wDuOHmuA6XHybXsGlYp9B/XkcqtzOhZsaO9F4m0/CE8EgFVeo9XNKaGrPwVClChQtxRA
 wOAA==
X-Gm-Message-State: APjAAAUiGE/Yp/s7eaTLXeGm9rpuRxhFB1wOMiWHuDvthx3fLGrymVz9
 yVs60hWB8w1JmlM7MyBYcOHFlEH7ew2g7ZjBLbPQtzOg
X-Google-Smtp-Source: APXvYqwY1B5CbzvHJHUWC33yxtZL9YLgoMc1BVJ7n2gOiqn0Kaw7MkR0xQAyteJE0v3OriDK9S293M9cAi56yKQyX7Q=
X-Received: by 2002:a5e:8618:: with SMTP id z24mr44769946ioj.174.1560239429298; 
 Tue, 11 Jun 2019 00:50:29 -0700 (PDT)
MIME-Version: 1.0
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Tue, 11 Jun 2019 15:50:28 +0800
Message-ID: <CAO9PYRKE6kPUKNm-PcuqvxGGrgAFobu1vH67kWOMcG4Gm=Kj2Q@mail.gmail.com>
Subject: Some question about dbus-sensors repo
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000f2b1eb058b078c52"
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

--000000000000f2b1eb058b078c52
Content-Type: text/plain; charset="UTF-8"

Hi all:
    I am investigating dbus-sensors recently and I have lot of
questions(Sorry I am not familiar with it :(

In dbus-sesnsor,
struct peci_rd_pkg_cfg_msg msg;
msg.addr = config.addr;
msg.index = PECI_MBX_INDEX_DDR_DIMM_TEMP; <==== why use dimm temp to get
cpu temp?
msg.param = rank;
msg.rx_len = 4;
if (!ioctl(file, PECI_IOC_RD_PKG_CFG, &msg))
{

Could someone give me a hint? thanks.
Tyler

--000000000000f2b1eb058b078c52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all:<div>=C2=A0 =C2=A0 I am investigating dbus-sensors =
recently and I have lot of questions(Sorry I am not familiar with it :(</di=
v><div><br></div><div>In dbus-sesnsor,=C2=A0</div><div>struct peci_rd_pkg_c=
fg_msg msg;<br>msg.addr =3D config.addr;<br>msg.index =3D PECI_MBX_INDEX_DD=
R_DIMM_TEMP; &lt;=3D=3D=3D=3D why use dimm temp to get cpu temp?<br>msg.par=
am =3D rank;<br>msg.rx_len =3D 4;<br>if (!ioctl(file, PECI_IOC_RD_PKG_CFG, =
&amp;msg))<br>{<br></div><div><br></div><div>Could someone give me a hint? =
thanks.</div><div>Tyler</div><div></div></div>

--000000000000f2b1eb058b078c52--
