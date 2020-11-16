Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FF22B3E6D
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 09:20:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZMSZ5Dc8zDqRR
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 19:19:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=qwaveinc.in (client-ip=2a00:1450:4864:20::32b;
 helo=mail-wm1-x32b.google.com; envelope-from=radhika@qwaveinc.in;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=qwaveinc.in
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=qwaveinc-in.20150623.gappssmtp.com
 header.i=@qwaveinc-in.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=TznVqiH4; dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZMRq5MVbzDqG9
 for <openbmc@lists.ozlabs.org>; Mon, 16 Nov 2020 19:19:12 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id s13so22744401wmh.4
 for <openbmc@lists.ozlabs.org>; Mon, 16 Nov 2020 00:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qwaveinc-in.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=NiEtC63tijdzFylXn1dAnJU5+HfWwtmIQmdock6vcPI=;
 b=TznVqiH4vWeycTRwA8+spPRbfricj8Crtzcp9uoWVCWHF5X0hsZs6s8dg8ruznyCnE
 Rqtn/2N9stWtdOdGg5FVagcVeE7qRh9iGnIsJHHGrJbQlC0NJnbnTLWjfmSXDbNTmaQK
 9f5nbnrcC31X9ZG82d44nRBJvqFseNAULYR1EiMT2SExP9P6kowNuw34uz30Dmz6npzh
 wllGxe3JjyaI3AgbohddWcRG92xyxkW2ZRmY8OhwKR0L/zLV6qrULv07tfB56DO9Eo99
 2KmOzXjYluH9P4T4Sovw8xTvf1jRocVwlz7bo7/6OtY17lep3XOWhKXUWOJ6CCqU0aYu
 Pn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NiEtC63tijdzFylXn1dAnJU5+HfWwtmIQmdock6vcPI=;
 b=qZt+NeFe8IM8rvamz8G2RhkHKP70OA3w/Yu31OBsju+7PG0ahCgDeKpppeT1VbE8fl
 rZTg/HEzEeqbHQdTYe02V96mYuriNLo/epEIbSB4gtoeE7xUKhWoytM20HAtrpWbGxwK
 UxSpWCDViGNzTgHFJ53YPfesP4mubVmgiqPlMHcc/RzzSdGU9PhTK5fzv3YJu+D+y/7A
 V+DnmzCPY2AK5kxlZpPAFsqSrKfNcskMrVxboyALHByyafeQj48M1IQxbG2+MISrhLmP
 FFo2HIxcei0xz8EycjyHPdtRHdAZoAc4VGegS4Sxek5P/0cNtxBqgtd0hgi2ohE4nEbh
 hVlQ==
X-Gm-Message-State: AOAM532I5Gp3SmJvsspphcF3rbH0Gyj/Enomh+Ts+KQ3lVYuO4RNeRqa
 4QO60uFDxt+VlvBheyZIfMpVAU483WopSUi2iGYWou+4uV+l7HxI
X-Google-Smtp-Source: ABdhPJw3oAmIVX0s6eaZ1UVKUdiyXKrDecNplkea/fGc2febPFp0deO7mRn7VVRLEQ2HD/aUamyxYMm/HuVusH0NeKc=
X-Received: by 2002:a1c:4b10:: with SMTP id y16mr13922794wma.10.1605514745124; 
 Mon, 16 Nov 2020 00:19:05 -0800 (PST)
MIME-Version: 1.0
From: Radhika Pradeep <radhika@qwaveinc.in>
Date: Mon, 16 Nov 2020 13:48:53 +0530
Message-ID: <CAFMA7evG_dq+GOOk+PCJxVdU7UxAi9FuY_=VOzO0WzuUn=DgcA@mail.gmail.com>
Subject: SETTING UART2 AS DEFAULT SERIAL CONSOLE_AST2520 BMC BOARD
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000010ba8c05b43508d4"
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

--00000000000010ba8c05b43508d4
Content-Type: text/plain; charset="UTF-8"

Hi ,

We have a BMC board based on the AST2520 with UART2 set as serial
console.We are using the openbmc codebase based on ast2500 with aspeed-g5.

Since the default uart console is set to uart5 we are not able to get the
serial console output.

We just got a "mw" command used in uboot to change the register for UART5
TO IO2 routing which can only be done temporarily.

Because we have the console connected to UART2 only. So we need to get the
console output at UART2 each time the board boots up.

Could you please provide us with the information on how to change routing
permanently or the information about  the file which can be modified to
change the register values permanently to get the uart2 console output.?


Thanks and Regards,

Radhika

--00000000000010ba8c05b43508d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hi ,</p>
<p><font size=3D"2"><span style=3D"font-family:verdana,sans-serif">We have =
a BMC board based on the=20
AST2520 with UART2 set as serial console.We are using the openbmc=20
codebase based on ast2500 with aspeed-g5.</span></font></p><font size=3D"2"=
><span style=3D"font-family:verdana,sans-serif">
</span></font><p><font size=3D"2"><span style=3D"font-family:verdana,sans-s=
erif">Since the default uart console is set to uart5 we are not able to get=
 the serial console output.</span></font></p><font size=3D"2"><span style=
=3D"font-family:verdana,sans-serif">

</span></font><p><font size=3D"2"><span style=3D"font-family:verdana,sans-s=
erif">We just got a &quot;mw&quot; command used in uboot to change the regi=
ster for UART5 TO IO2 routing which can only be done temporarily.</span></f=
ont></p><font size=3D"2"><span style=3D"font-family:verdana,sans-serif">
</span></font><p><font size=3D"2"><span style=3D"font-family:verdana,sans-s=
erif"><span>Because we have the console connected to UART2 only. So we need=
 to get the console output at UART2 each time the board boots up.</span></s=
pan></font></p><font size=3D"2"><span style=3D"font-family:verdana,sans-ser=
if">
</span></font><p><font size=3D"2"><span style=3D"font-family:verdana,sans-s=
erif"><span>Could
 you please provide us with the information on how to change routing=20
permanently or the information about=C2=A0 the file which can be modified t=
o=20
change the register values permanently to get the uart2 console output.?</s=
pan></span></font></p><font size=3D"2"><span style=3D"font-family:verdana,s=
ans-serif">
</span></font><p><font size=3D"2"><span style=3D"font-family:verdana,sans-s=
erif"><br></span></font>
  <font size=3D"2"><span style=3D"font-family:verdana,sans-serif"><span></s=
pan></span></font></p><font size=3D"2"><span style=3D"font-family:verdana,s=
ans-serif">
</span></font><p><font size=3D"2"><span style=3D"font-family:verdana,sans-s=
erif"><span>Thanks and Regards,</span></span></font></p><font size=3D"2"><s=
pan style=3D"font-family:verdana,sans-serif">
</span></font><p><font size=3D"2"><span style=3D"font-family:verdana,sans-s=
erif"><span>Radhika</span></span></font><font face=3D"verdana, sans-serif">=
<span style=3D"font-family:=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94,serif;font-=
size:16px"><span style=3D"font-family:Calibri,sans-serif" lang=3D"EN-US"><s=
pan style=3D"font-weight:bold"><br>
        </span></span></span></font></p>
</div>

--00000000000010ba8c05b43508d4--
