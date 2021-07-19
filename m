Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E80D83CD566
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 15:03:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GT28D42Gbz30HK
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 23:03:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=MxeTrDVC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633;
 helo=mail-ej1-x633.google.com; envelope-from=vkrk.user@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MxeTrDVC; dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GT27w293fz2yZ6
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jul 2021 23:02:51 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id bu12so28662720ejb.0
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jul 2021 06:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=UNbGmx8HMkpLflrmN2zNX+ak7K+l20NvmSf2BEEM4j0=;
 b=MxeTrDVC09DMKC8Pl16X55+j3SwO3OQq8hmM4k9cp5NQsE4HSKeR2N8DMZO7wCzNIC
 vktsNrWQgk5zwdyVP/4ca4UIBHNimnRvSFK/l+vwb6C8a/8506P+BTx3lurFnrkn87nn
 qq05YEKibmGl6EfHOdC7x3o15Lq8kH6H1NpxxRZdoDQCtSn8xpzpJNtPqE1Tvd1PpKxf
 6EvfvrH17ODdM1KHlETw4r97+ll8NAkkoc9DPGptPdbDDBpdCglGI+qGbOrKTeAoXPqC
 pdYGY9fdVt/lINDprACH/i6kajIU6UsmVSu7zlXaEoOJcUpoQLBOwXUZ9WWYfg/vDgFB
 BIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UNbGmx8HMkpLflrmN2zNX+ak7K+l20NvmSf2BEEM4j0=;
 b=VVUpOJa4NybHAzu143VqCJXS2rqK1oL14eOq7VwIJbBZWm+/8INs0RBq3FXBLEfFq/
 h2qDae4ry7TXu4E8xXL5CzEBnnj7Nsr1B4GHmJuI5T7QqLbSUP1xWa0oNbv010z4kyzC
 orRpd3tR/Ru2ZGuoBl60qa5gf3XxNjC9MS1nJVw0foxxFioCWR0PDu+2Yllu4MCQF4BK
 hZ9oe9/9uvnbG8e+EtYv5Po2iI32wSTp+9T2NEjIYnaPP3L0qpP4eDI4cBcz+LfjUaLd
 JsJcxd/w9XVG/oL1RgVXXpSsHAZ/JpmSNqBavl9Deph+gB4TZMjdvNB7HIEqx2GYO6UE
 CIgA==
X-Gm-Message-State: AOAM533NXD3yPTWhBTqXtW7Wb87Xwcm4WNzHYzKx7WBLrtYSy5SvoDMI
 mwsaoBX3rguEO1maFQVqdwJEM34br3VoSUj0pOG5L22h8L0=
X-Google-Smtp-Source: ABdhPJyFFxNZowyAmzSEfsTZtuA3miHxL8/8m/keZJbwLebttohALWj2rziNuYit+whN4ZIhuV3LLtC8bprGfIr5g84=
X-Received: by 2002:a17:907:a05c:: with SMTP id
 gz28mr27566362ejc.56.1626699765111; 
 Mon, 19 Jul 2021 06:02:45 -0700 (PDT)
MIME-Version: 1.0
From: VINOTHKUMAR RK <vkrk.user@gmail.com>
Date: Mon, 19 Jul 2021 18:32:34 +0530
Message-ID: <CAHf5cscRkiCHw9HmJncTuA9E1dZDmEYTvkhkH4dF-nZcpEDnaA@mail.gmail.com>
Subject: AST2600: Linux driver support for SPI controller
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000a7e06405c7798d78"
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

--000000000000a7e06405c7798d78
Content-Type: text/plain; charset="UTF-8"

Hello all,

This is regarding SPI controller driver support in OpenBMC.
Here is the scenario: Three devices connected *over same SPI controller* as
mentioned below:

Firmware SPI Memory Controller (BSPI): (0x1E620000):
    - Flash 0 (CS0)
    - Flash 1 (CS1)
    - MCU/CPLD (CS2)

When I look at the OpenBMC Linux repository, I could find 'aspeed-smc.c'
driver under the MTD subsystem, so this seems to work only for flash
devices.

Do we've any other driver support or a solution to handle all the three
devices? Any help/suggestions would be appreciated.


Regards,
Vinoth Kumar RK

--000000000000a7e06405c7798d78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hello all,<div><br></div=
><div><div>This is regarding SPI controller driver support in OpenBMC.</div=
><div>Here is the scenario: Three devices connected <b><i><u>over same SPI =
controller</u></i></b> as mentioned below:</div><div><br></div><div>Firmwar=
e SPI Memory Controller (BSPI): (0x1E620000):</div><div>=C2=A0 =C2=A0 - Fla=
sh 0 (CS0)</div><div>=C2=A0 =C2=A0 - Flash 1 (CS1)</div><div>=C2=A0 =C2=A0 =
- MCU/CPLD (CS2)</div><div><br></div><div>When I look at the OpenBMC Linux =
repository, I could find &#39;aspeed-smc.c&#39; driver under the MTD subsys=
tem, so this seems to work only for flash devices.</div><div><br></div><div=
>Do we&#39;ve any other driver support or a solution to handle all the thre=
e devices? Any help/suggestions would be appreciated.</div></div><div><br><=
/div><div><br></div><div>Regards,</div><div>Vinoth Kumar RK</div></div></di=
v></div>

--000000000000a7e06405c7798d78--
