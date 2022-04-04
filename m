Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B924F0FEC
	for <lists+openbmc@lfdr.de>; Mon,  4 Apr 2022 09:20:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KX2HG6L25z2yHD
	for <lists+openbmc@lfdr.de>; Mon,  4 Apr 2022 17:20:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GFYuWrj4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c;
 helo=mail-ej1-x62c.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GFYuWrj4; dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KX2Gr3rTtz2x9F
 for <openbmc@lists.ozlabs.org>; Mon,  4 Apr 2022 17:20:04 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id a6so6988655ejk.0
 for <openbmc@lists.ozlabs.org>; Mon, 04 Apr 2022 00:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=mGG8RnoZi7BJXkUf96mnIBVmKPIUpY8G58qrnnDCK9I=;
 b=GFYuWrj4Ar7vE9lvK26JxrnGEBtgAXt3Zs0LRgolkZ4y4zatZoPmPdcMHax41c1Aax
 CBWBeugD9lx6OSmL5LZnTn/B188Iy9z4HXRVM+zlNOEgFUwG8yiMxQrnowTyOj7Y1vu+
 PssXRwAnbgYgZN4GIyhJrR8z4CSCup3VUUU20G2hPZddzRMTff4PlzRWXgT3MRcpiw6w
 n/BA6CNAtRYsHi/tLJ8hiB2VKjeKfq0gpSZTExZjpDCsZzHSl26m0aljDLeLSDeK80Xa
 0xy9xJ46Z08Th+hAz36wh4fsrF3JlPD8qemh3w7XhDEhjyGiUADITqhoEaUaoW56rt1J
 vvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=mGG8RnoZi7BJXkUf96mnIBVmKPIUpY8G58qrnnDCK9I=;
 b=0hO4WZbkJZ2kORP5v1O70IPSM1bU2Qc4W91C+2CUiAQhe3B5dCMumy4bI77zidpqrr
 gnn0DmpaIXR7sFJmPHnCMq0xlozOzMqEmgMuHRyph2VPQ8VS3rBRNy4w9x+3Dxobyp9z
 sPWtczze88MVJLvDf6kBS5wjKztfMww8uGGkBHM3zezvlX/aoydIcg11MjK7UJ96xtY9
 kciP9sGJF4P8wYadS+47G2zw0Rehd7VVl/ds2VR1PN8OP8w2He8tn05lt+KomukqatLS
 4nobJgpVHqDS9GzdFx4U7vV9zJgT4r7ZKu0+uZlzMvEu7E5MYljfCuCRqIMARp9VcKI+
 tGLg==
X-Gm-Message-State: AOAM532K3f2d4uLyKtrb6RkbtmiJUeKidHPO5ahunsOmbXIOo0yelvT6
 MjOQ7ys1i+kSAFDgJDhdifqZXQ/8EmBAEd4M1CEOTzZCt0c=
X-Google-Smtp-Source: ABdhPJwdjA0y1fUdpwRB1LCbXRHV3m3N+uvCvaT8QsBT99507vyyC8H1MQQPVX2+k8lr44oQKQe2Vryam7sVLVMrq4Y=
X-Received: by 2002:a17:907:7244:b0:6df:fb38:1d02 with SMTP id
 ds4-20020a170907724400b006dffb381d02mr9514511ejc.453.1649056800069; Mon, 04
 Apr 2022 00:20:00 -0700 (PDT)
MIME-Version: 1.0
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Mon, 4 Apr 2022 12:49:49 +0530
Message-ID: <CAA7Tbctgg9YJPTRcYCwkucajTvk-AUNeHJ9_=MD5dpvxF5D0ZA@mail.gmail.com>
Subject: IPMI Restriction Mode
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000c85d6e05dbcef44b"
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
Cc: anoo@us.ibm.com, Amithash Prasad <amithash@fb.com>,
 deepak.kodihalli.83@gmail.com, velumani.hcl@gmail.com, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c85d6e05dbcef44b
Content-Type: text/plain; charset="UTF-8"

Hi All,

        IPMI Restriction mode support has been added for host machines
which support IPMI.

https://github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/host-template.yaml#L61

        How IPMI restriction mode support can be added for other than host
devices (IPMI based devices). Ex Debug card.  ?

        Could you please provide any suggestions or any docs ?

Thanks,
Kumar.

--000000000000c85d6e05dbcef44b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div>=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 I=
PMI Restriction mode support has been added for host=C2=A0machines which su=
pport IPMI.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://=
github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523acc4ffade05e6/me=
ta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/host-templ=
ate.yaml#L61">https://github.com/openbmc/openbmc/blob/7298b2478ec25cc181412=
4af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settin=
gs-defaults/host-template.yaml#L61</a></div><div><br></div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 How IPMI restriction mode support can be added for other=
=C2=A0than host devices (IPMI based devices). Ex Debug card.=C2=A0 ?</div><=
div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Could you please provide any=
 suggestions or any docs ?</div><div><br></div><div>Thanks,</div><div>Kumar=
.</div></div>

--000000000000c85d6e05dbcef44b--
