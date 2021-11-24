Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F23FD45B739
	for <lists+openbmc@lfdr.de>; Wed, 24 Nov 2021 10:17:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hzb4J6bRsz2ywB
	for <lists+openbmc@lfdr.de>; Wed, 24 Nov 2021 20:17:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bbTzQhfK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d;
 helo=mail-ed1-x52d.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bbTzQhfK; dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hzb3v5LzPz2yLJ
 for <openbmc@lists.ozlabs.org>; Wed, 24 Nov 2021 20:16:41 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id v1so7369528edx.2
 for <openbmc@lists.ozlabs.org>; Wed, 24 Nov 2021 01:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=HSFeKh7c6k2mxTKS0/Esde/7VUIDk11GUAXijoCqSoo=;
 b=bbTzQhfKpBZZ/bH14mb4g95XokOYAahnsO1Al4Volqc7/ctMj3+YyusPqWj2tnMtJD
 kfLGPGl8tMutU38TRkNrwbOwa9D8ZVBk2g5cH3YCfWPP695Pj8l01tkcEaCz1DQEMJZ5
 1BCqEqgmoyZTenjejHAH1+DOh2rWuny6F3HXgxGl8TjNoFE/R2oiIhWwMbaWYK68U4N0
 Zp/DHTbFMofM/IA+4YtK7gAlbkAMLS3CdF/a/qClYxva8CAZchV2YrnMXK5ZTb+MTzvR
 JkPy2lIGme49W5UHAfnieCRIa/h+NPANf6pdBYDz1vSpC140bReF8KcI6+5js1q+88QC
 Irpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=HSFeKh7c6k2mxTKS0/Esde/7VUIDk11GUAXijoCqSoo=;
 b=a+oBfA4M0eRN0/V6UeWzNMZW7TKmY1zWGKPbXjAxFmw8paR2ko2FXtwOfExNN+Jux+
 63l6E/WAAaEEcXis45/G39JyZ80QVCYOzH3eGR/6eO10dmis6OuAHkod1OXQlpt8KZHv
 xX+IQqUXmHVUHj7JhOmaE8hlnlqT8VyyMdjM8Wb7x3elD9HpjPqJjzNIBmROb2GfIpE3
 yfHPYpept6ogyHiFg5XuhN3HfqekWeJxaSCEl+82vi1NORK8otdB/Aa9ndEQiJaQpilX
 NMwY5ko4rqOPbHhmFeeDreClyYVmMwz/SE9kEeLGUKzgwbPvgIfx93RSKLIi9H4wemv6
 Csnw==
X-Gm-Message-State: AOAM5315Ym1dtDaBErMr8GQnTgatPPMouSfxBiuGDE9xzgrZcO453YJ2
 uQOaxuxtImFa/q393NcmAhXRfCv/4r+y2L2NxoMyUkNHY4A=
X-Google-Smtp-Source: ABdhPJxj2N/s0Q6CnJ2oPxOU05sLazKeL7hvaTJ7QGFp+qOdXUqSM3PIS++JvHSA2GXYdvj6m1fM4G2trEsjAZuPKhw=
X-Received: by 2002:a17:907:9723:: with SMTP id
 jg35mr18896838ejc.329.1637745394204; 
 Wed, 24 Nov 2021 01:16:34 -0800 (PST)
MIME-Version: 1.0
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Wed, 24 Nov 2021 14:48:30 +0530
Message-ID: <CAA7Tbcuhk3tY-XBw2C6xtV9MEsp-Ba2GW8PZpVqj2YQNcrHb6Q@mail.gmail.com>
Subject: FRU Device type one byte or Two byte Validation
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000074435405d1855032"
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, vernon.mauery@linux.intel.com,
 Ed Tanous <ed@tanous.net>, Amithash Prasad <amithash@fb.com>,
 velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000074435405d1855032
Content-Type: text/plain; charset="UTF-8"

Hi All,

       We would like to validate our NIC FRU device type as 8 bit (one
byte) or 16 bit(two byte).

       This device type validation for our FRU is platform specific logic.
This was implemented in the machine layer.

       We wanted to interlink this logic with entity-manager code to get
the device type.

       Could you please provide the suggestions on get the device type in
entity-manager.

       Please refer below link for existing devicebit validation in
entity-manager.

https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp#L430

Thanks,
Kumar.

--00000000000074435405d1855032
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0We w=
ould like to validate our NIC FRU device type as 8 bit (one byte) or 16 bit=
(two byte).=C2=A0</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0This =
device type validation for our FRU is platform specific logic.=C2=A0 This w=
as implemented in the machine layer.=C2=A0</div><div>=C2=A0=C2=A0</div><div=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0We wanted to interlink this logic with entity-m=
anager code to get the device type.</div><div><br></div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0Could you please provide the suggestions on get the device typ=
e in entity-manager.</div><div>=C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Please refer below link for existing devicebit validati=
on in entity-manager.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https=
://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp#L430">ht=
tps://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp#L430<=
/a></div><div><br></div><div>Thanks,</div><div>Kumar.</div></div>

--00000000000074435405d1855032--
