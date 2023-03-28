Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCC66CC852
	for <lists+openbmc@lfdr.de>; Tue, 28 Mar 2023 18:44:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmFrT6jhwz3cf6
	for <lists+openbmc@lfdr.de>; Wed, 29 Mar 2023 03:44:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m0LKJMZ9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=satishroyal4u@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m0LKJMZ9;
	dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmFqt092Jz3cV8
	for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2023 03:43:37 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id d17so12882202wrb.11
        for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2023 09:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680021811;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7OM3SJHzqmrPgZzViU6VGDZ2UL1XMcbPuIZi6vuJOxU=;
        b=m0LKJMZ9lu5bIDOPKrSnQoW0EMzoO0wjqU8YbVA7ugTwXDPt8SULIJ2aw9MV5/bTSB
         GNeDivxBG2FRWDEg7S9KY+xS9d9K4q3rasRRj0J1m9w5ENMrpVGFQvnzROM9DvwmkzRk
         G9i+mw/tP1FHwCu9pHlL7LFoLu5+kdtmHvZINUISd/P3rPxq0O+GBlr4Eff9T8rfvfTY
         pRE9x81o2vcP0Otmvuy2exrBOhEq/AuMe5gAYa3mCwFBgvz5vcpH0adVcFduhZ/pURid
         zpZf10XZNIGtEXWwcrXw/iL/fnimGnWzpBinFvnruiohJIgBNe0tQg5W+GaPiN3qrIYo
         Z60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680021811;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7OM3SJHzqmrPgZzViU6VGDZ2UL1XMcbPuIZi6vuJOxU=;
        b=5pEjSBMQqNEh7OGP8w4kJ+Mm1OO9yi+f+47zg49wkIjQmD45gxDxUJ2c+qfQ7Fp1lR
         N6CmeLnIH/n9dg4wU2r23lsXy9bMtH8uChz9eNQqvBWFQ8Odotxv5CCImJeAW8GZ7HGu
         V7AtkmTeADBnPmtxvkQppZASS1+bRufG7v7o03mOk2eFJNzchks0tgr5LhXc18vq6hqb
         LvlbaJYA5BaVtFvJHnZK/Od0T9CrsLXyg0rodPRvXHis5nyuhrhVlVLj5teROXkp2bpX
         1KK7ODsSVekEdJY/23s5gEgHpHmMibhZDoGEBTMt5lrUR8ofJzVv2ASR3wqT5CdLECtM
         Ch9Q==
X-Gm-Message-State: AAQBX9dLCaz7/cgkC/Ez7RAEm96BAommt+cMHAFXyGfXHQKgP3B0sCF6
	zJ7EJfhCOptUFsxMLPv5ywPpMoJ7A0HoAaR/n4UB08sY3TtnyGYO
X-Google-Smtp-Source: AKy350bgaD69/yq64FFsjWrnWyYTsC0TiiwQ657zgvP4INGdD8oJ/ooPAF0YUFs4bdIEo2dsh9NzKvOjD8EAJcfK5sc=
X-Received: by 2002:a5d:644b:0:b0:2da:f0b5:258f with SMTP id
 d11-20020a5d644b000000b002daf0b5258fmr3330869wrw.9.1680021810840; Tue, 28 Mar
 2023 09:43:30 -0700 (PDT)
MIME-Version: 1.0
From: Satish Yaduvanshi <satishroyal4u@gmail.com>
Date: Tue, 28 Mar 2023 22:13:20 +0530
Message-ID: <CAGugOWsUK=2gE6iBiumKukO87b_cgAm2eT+Y=su1PPWow1-S8Q@mail.gmail.com>
Subject: Containerization Enablement in OpenBMC firmware
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000040060d05f7f88fbf"
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

--00000000000040060d05f7f88fbf
Content-Type: text/plain; charset="UTF-8"

Hi,

I would like to know is there any future plans to containerize the  apps
and services of OpenBMC firmware

Thanks,
Satish Kumar

--00000000000040060d05f7f88fbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I would like to know is there any f=
uture plans to containerize the =C2=A0apps and services of OpenBMC firmware=
<br clear=3D"all"><div><br></div><div dir=3D"ltr" class=3D"gmail_signature"=
 data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">=
<div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><d=
iv>Thanks,</div><div>Satish Kumar</div></div></div></div></div></div></div>=
</div></div></div></div></div>

--00000000000040060d05f7f88fbf--
