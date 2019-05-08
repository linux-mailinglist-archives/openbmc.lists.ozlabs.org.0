Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CC316F6F
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 05:22:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zMGH146KzDqNk
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 13:21:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=tyler.sabdon@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lBwndPlY"; 
 dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zMFX35PCzDqLP
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 13:21:17 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id v9so12113406ion.11
 for <openbmc@lists.ozlabs.org>; Tue, 07 May 2019 20:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=RDcuVT9gPSlVdG8y0cqpBzibKp7Fz9nQ7029Kh0XiII=;
 b=lBwndPlYMEQWm8Rr2o7stXdBdNDql9SOFTBdM713QyM2i1c8OzzDnbIVD+cqbSwSB3
 G3zRcVA002B3cK1ThIoUtoB4egiX5U73HNCHYUl730Zbz35qXXVnzkgfdYHgRGxoPvXp
 M1p73dm3aowhXJyXPVMlirTwFhjXf8mAuyqYFlfiy8chRb19KLo+7Vlq0GYYfFdsZ0Ok
 1yKhCU5Z9f79VuSsN8khnC/Pa6r1x+YLnfAJKhnPPAkkHCIrDqlefGkZuDeLJ31xKit+
 Dk5b71GpT+neNncny5AblhsgKcevpJi+tO+tSkooJxZxs1LkqhVwjlvNjFNUaioBTLsN
 hLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=RDcuVT9gPSlVdG8y0cqpBzibKp7Fz9nQ7029Kh0XiII=;
 b=lZ6QAHE9t3bKhYpMVGVCEKsWdSdTeFB5RbIs8GV/UiI+/9uN2hMnF/9r1D8Xdkco1X
 XFDh9IBMzS0cEr6sE6OPCkqIBa5+L/SNptjsM3Fl/eW5wCzvaY7tDvMH47VoX0TymzDb
 m02jaG+bhc5ySDERAPoAMHWOtCdNUl0E/XwiCWM7pQrZ2x5ChGsm/sYNPQknTrUvCIY4
 h4Kt+0Jqi1j0smNOwhQACkBv6NgoycOBdgjYSokSz2CCZkb2QDH+Pxx0214jK7CgQpnw
 Jzl/Fjzv1JB/BKhnwupjONt0VtSfuS6U1jd3ErZN+sRJ0q05TxnqFh3k2Yy3FynoQ4nF
 uITQ==
X-Gm-Message-State: APjAAAXDChIAwSZmruK46o+v7CZVZV4ZXlfn12VjFEkGG50ua7LJiqBR
 3eyNnPqjjW06178S9CfCmRH4OYNTm9kU0J/KZ5dIfQ==
X-Google-Smtp-Source: APXvYqwEC2KDIlxRISyGaj0uKNnxkKZySHJ+t3AoZwLx/jKj7gmrnVsibyXm62O7yBlVdUJZ5kOSXO27jx0m2ZiZi3c=
X-Received: by 2002:a05:6602:8f:: with SMTP id
 h15mr23411966iob.117.1557285673187; 
 Tue, 07 May 2019 20:21:13 -0700 (PDT)
MIME-Version: 1.0
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Wed, 8 May 2019 11:21:14 +0800
Message-ID: <CAO9PYRL4Pr2hV=Hz5dvTJzhx-x9WPJL12qZEKuh+DiCWx2RMww@mail.gmail.com>
Subject: Is there Intel node management support?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000005d3d19058857d3ca"
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

--0000000000005d3d19058857d3ca
Content-Type: text/plain; charset="UTF-8"

Hi all:
    Is there any package support Intel node management in current openbmc
or plan to support it?

BR,
Tyler

--0000000000005d3d19058857d3ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all:<div>=C2=A0 =C2=A0 Is there any package support Int=
el node management in current openbmc or plan to support it?</div><div><br>=
</div><div>BR,</div><div>Tyler=C2=A0</div></div>

--0000000000005d3d19058857d3ca--
