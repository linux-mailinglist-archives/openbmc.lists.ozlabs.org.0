Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7002D9FF
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2019 12:07:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DRGm3K4DzDqL9
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2019 20:07:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::132; helo=mail-it1-x132.google.com;
 envelope-from=tyler.sabdon@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LmniPp4M"; 
 dkim-atps=neutral
Received: from mail-it1-x132.google.com (mail-it1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DRGC5YYszDqFp
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 20:07:14 +1000 (AEST)
Received: by mail-it1-x132.google.com with SMTP id h20so2730969itk.4
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 03:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=U2jcK5ZfhaDmPQoABYQPL2AHjRySCrT3U8u8PBn3I3Q=;
 b=LmniPp4MXws68DKphRR4qTGygyuaTs10E9Ovlknd95vPs9vpPC7H/30Xr32Mam4fbr
 pI1QIlU4Z8RxWeWf/ys2t/1m8iojWGpAEqcoB8QyRwT6P4AxfWYXzmFGCx4FoG5ERKuP
 r2rmc1ejX/1i/+Ac2um/0SJVnAxLAgZXDC6Z+mAhRgBe6tvyRqMJfJdNH8hL0WcOQZp0
 WgekuuQbi3EIhYwrKds/0UlqwASO6S3iT+zqsdxCofzeFOOjnXJJDX1ErZolNCfLA8es
 WlK4DK1vT2CYEA91m/MyQcFSAfInSQUhM8531R2jgA6XQE8OQtpMsRKqEiSmTzVK/yiq
 NYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=U2jcK5ZfhaDmPQoABYQPL2AHjRySCrT3U8u8PBn3I3Q=;
 b=nuaQdGrOPObiNkCjqettopUfvRmI/ZPB5CYQkzkf4zlQ3S2vP2nx+nbUVHsNZPeF62
 K9ith4CF+evvJPGBgOMpSPxIMRyzY6tMep5PDJr0gaUCwPvRWsDNBfAIpADgKSJ1lAh0
 oQP0q8uW/y+z/YGCP6EZeZR1AduVpIw5FrpDPrn0shAwKWnuLybzDktjY3Cerm5eM2ty
 lOp4fYVMEhr+PLDefwvO8cEDz7gM5x9SSylahwBs3K2TgngzRBFVoxBhJ2LjrPwlz8Fl
 6vjuXF8XFrrCrizBqeMsmCby24hJOU2Ow/QB6trHD6oCPGS1g0Y1B8x5ZBo+HyEtsXg5
 KBNw==
X-Gm-Message-State: APjAAAVhMuHz73w/VBPIQG0pOjDPVod9qypPEG7HD94zPNH1hGWey4TB
 28dDzzgnJNcnM2OPHlLI2IlAEzlqHWhLDy/Quc7lrN16
X-Google-Smtp-Source: APXvYqzYgxyKbllwuJHYCFgAjPaYvqbsvdCbH4HIc3dc+YPr+SwQUvFUJWyiFVketKvCclG7zejpmUuDEhJOGVXnBks=
X-Received: by 2002:a02:3b12:: with SMTP id c18mr40565869jaa.44.1559124430377; 
 Wed, 29 May 2019 03:07:10 -0700 (PDT)
MIME-Version: 1.0
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Wed, 29 May 2019 18:07:12 +0800
Message-ID: <CAO9PYRLdxqjbMHgsMoEY7m0ygwchLQk=7GOQr_itjqor=AMqfA@mail.gmail.com>
Subject: Flash bmc fail due to partition incorrect
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000d5572f058a03f10a"
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

--000000000000d5572f058a03f10a
Content-Type: text/plain; charset="UTF-8"

Hi all:
    I encounter bmc firmware update fail issue and message is "Verify
error: update: --no-flash --ignore-mount --no-save-files --no-restore-files
--no-clean-saved-files\nERROR: Unable to find mtd partition for
image-bmc.\n".

I check my flash partition and found that I lost "bmc" partition as below:


I tried to add bmc partition in dts
&bootspi {
        status = "okay";
        flash@0 {
                status = "okay";
                m25p,fast-read;
                label = "bmc";
                spi-max-frequency = <50000000>;
#include "openbmc-flash-layout.dtsi"
        };
};

but there still is no "bmc" partition. Could someone give any suggestion?
thanks.

Tyler

--000000000000d5572f058a03f10a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all:<div>=C2=A0 =C2=A0 I encounter bmc firmware update =
fail issue and message is &quot;Verify error: update: --no-flash --ignore-m=
ount --no-save-files --no-restore-files --no-clean-saved-files\nERROR: Unab=
le to find mtd partition for image-bmc.\n&quot;.</div><div><br></div><div>I=
 check my flash partition and found that I lost &quot;bmc&quot; partition a=
s below:</div><div><br></div><div><br></div><div>I tried to add bmc partiti=
on in dts=C2=A0</div><div>&amp;bootspi {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 sta=
tus =3D &quot;okay&quot;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 flash@0 {<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&=
quot;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m25p,fast=
-read;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 label =3D=
 &quot;bmc&quot;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 spi-max-frequency =3D &lt;50000000&gt;;<br>#include &quot;openbmc-flash=
-layout.dtsi&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>};<br></div><div><b=
r></div><div>but there still is no &quot;bmc&quot; partition. Could someone=
 give any suggestion? thanks.</div><div><br></div><div>Tyler</div></div>

--000000000000d5572f058a03f10a--
