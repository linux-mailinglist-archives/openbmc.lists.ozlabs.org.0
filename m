Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAC74DC385
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 11:02:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK2kz3lFfz30CS
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 21:02:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HLs9FneR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b33;
 helo=mail-yb1-xb33.google.com; envelope-from=tyler.sabdon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HLs9FneR; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK2kY6YWvz3069
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 21:02:28 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id v35so9185767ybi.10
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 03:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=cMLjzJefK1zDVWxuTxUVJaetTqm0Mk0SxwcRRb7tcwI=;
 b=HLs9FneRPtZQlEdYbMx2ceRHomZtCnSUthl1+3WIYvsTK7nl9SJG+3LlSybhIBpN0v
 T7Y7i6OW99enviQTRrbhmt5WDrgtWXzPUZ8UKiOg3J44x2Vxci/3dhk8IeM7xnd/KzZ2
 w56uiPK5iKJYblFjeufSQ2q5JPFCx6H8lUkGUlM4N1mc9py/8AYFdMDy3Mf5BUeCqbgi
 iYxDqmIm8MjlNjmy1wuCN6fg54I6KxaY3YL3aow6O4YcCZvgRWiim45uCmsQHyJK1PZR
 4cg+O3llJ6MG7yaGqqy1x4lD/44FaFyXZwq8wHOClK4gdW9xQx6gPgJuw2T17//Q2XRZ
 G2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cMLjzJefK1zDVWxuTxUVJaetTqm0Mk0SxwcRRb7tcwI=;
 b=IN+v5EfNsj5U3Llw6YjXvPllOwrchE/S2SdDpoZ7F9rlsWKgdYBpriot6s9TKkeJDP
 ldxWnt1zJ/nr3JeO/82348ZiS7BgvExGr25NUgcoKP/3D/XHc2hJXi8BjLRww9TPwwcO
 bUu0gVyX3bypUrkBHXhQnS3YTqrlRwIMjtaeqK5jfHH3OhoQtTV5CdgkPLlr/zu92n64
 WSdW1Gy6hb7aqNNufm8wxh0qmfK5HJ75Njl6bIB4hJOWesziLZ5d94EijxxHBMAdbrNJ
 iSkk3D0DX0M0iIkEMDitDrRG0vFG84n41CgeMT/Sjjr6JyIqiPkH/puukm5jDKjywaln
 D2Sg==
X-Gm-Message-State: AOAM5311MDFFB4F+R3eWcRNGYsDivxsXBoVKwH7c+ZcFurhZERGsS8an
 gkjsheOPWEte7ghNdxyo13IYqeD3mIA6Q44vKKn9TIMr
X-Google-Smtp-Source: ABdhPJzTa0kXYQRXUlzKikyreTQwrpvbNc+VYetoDOGPqzn4kRwp/9igtzcVHlLMApCipqcHxQtWjevPtzEErMb+Umw=
X-Received: by 2002:a25:838c:0:b0:633:883b:b411 with SMTP id
 t12-20020a25838c000000b00633883bb411mr4142485ybk.92.1647511345606; Thu, 17
 Mar 2022 03:02:25 -0700 (PDT)
MIME-Version: 1.0
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Thu, 17 Mar 2022 18:02:14 +0800
Message-ID: <CAO9PYRLE+ZirKtvjG2GU7AQqJdxVOuUG6M_N39Q0zHKNEiUO9w@mail.gmail.com>
Subject: Sensor reading and monitoring
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000084b13105da67201e"
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

--00000000000084b13105da67201e
Content-Type: text/plain; charset="UTF-8"

Hi All:
    I try to deploy openbmc on my platform and I have an question. I found
there are more then one application to read and monitor sensor such as
phosphor-hwmon and dbus-sensors. Could someone recommand what is the best
application combination for sensor reading, monitoring and sel generation,
both discrete and threshold sensor supported, on Aspeed/x86 platform?

Tyler

--00000000000084b13105da67201e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All:<div>=C2=A0 =C2=A0 I try to deploy openbmc on my pl=
atform and I have an question. I found there are more then one application =
to read and monitor sensor such as phosphor-hwmon and dbus-sensors. Could s=
omeone recommand what is the best application combination for sensor readin=
g, monitoring and sel generation, both discrete and threshold sensor suppor=
ted, on Aspeed/x86 platform?=C2=A0</div><div><br></div><div>Tyler</div></di=
v>

--00000000000084b13105da67201e--
