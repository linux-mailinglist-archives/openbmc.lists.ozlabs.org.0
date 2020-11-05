Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A502A8208
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 16:20:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRnKB3PQSzDr45
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 02:20:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::129;
 helo=mail-il1-x129.google.com; envelope-from=shakeebbk@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Tv86LIzN; dkim-atps=neutral
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRmQ35twhzDqcT
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 01:39:55 +1100 (AEDT)
Received: by mail-il1-x129.google.com with SMTP id g15so1560253ilc.9
 for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2020 06:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=9HnBCmEeYeyKStugc6AeRGSghTod1ER7lmLlJf01E6M=;
 b=Tv86LIzNZSVVpAEp2YBOx3TUV4kYcpdCdU3AbIN72dGkYHzSakeXmIswfYVJnRPyd5
 bQhP73B4aTeg49qqTX050DOwnx8SpBovlnP1P6UJaHpUeoP/jZ8BdfH45Nvc6qHB1Lsl
 HS4iZ5TqibXLksvCgenkDPZ9uuplDuh0QcQYnTbKCr77PhQ9zIkfzSCi2l5AufA8J10b
 29aIlJMPhgRAhNl05H5UhSKnO3YDcmZw9qXOOUqeI0O/Bloc2iuVYKNxCe68SY/Anw0i
 ujt6U5t9up/tMtLZe5AlW7NO6aYBxUYRYlvxJuqIW/c7poeR6r/D9/0uw3vt1la03nQU
 a+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9HnBCmEeYeyKStugc6AeRGSghTod1ER7lmLlJf01E6M=;
 b=E+lhJJ7RtAY9yF9R43SZZ3wTTanHM0sK295dcnc9MriJMAMD5m5CrBBBcKSlvsjD0C
 P0uf/V5fI0NoudD4CoI5IVyIz51olamtOnbU7XyffqeH6HQ30714E9LKkUWM/l7zw6xd
 u5Xs8pbsTAqo/+zEWG5cHTT4Gksyk1QnVbtDTO1s07HBFjRv0w8IzHB54mcx8iD+94RE
 WUEvTRto+ACQ4h/hw6vuQE+GsD2B9FuHXK8JLqAPYRKidPuNRdt/ePmxjL4Wnns+8zIR
 heC5KUw98HNJneTruy71lAhUU6RPM4F8jcaEGJuSRdB41DMyFuieVqWMgQZ8+Id9Snqj
 khGQ==
X-Gm-Message-State: AOAM532kpuInXCNDj28ApMOESk0LHDXMXx3RZn7OVgp2f0mg9P4jJiAG
 fxEaYts0VOvJ8mJv3hq7XIifzmR1/FtxXEmlygqJtGIQFtirJg==
X-Google-Smtp-Source: ABdhPJxsyXF4bM41/CfQDvcc1IRD6neqGdnpeBDKY/QcETeemXWHirRJmJY3rtm/1pGn26l4N+Z+fnfpCzXMOmrvWx8=
X-Received: by 2002:a92:c529:: with SMTP id m9mr1928415ili.195.1604586738789; 
 Thu, 05 Nov 2020 06:32:18 -0800 (PST)
MIME-Version: 1.0
From: Shakeeb B K <shakeebbk@gmail.com>
Date: Thu, 5 Nov 2020 20:02:07 +0530
Message-ID: <CABYu0Wjn-YB4HO37nkxoJyq8EW6=bV4P5EZiHij0y3SxEYVEkw@mail.gmail.com>
Subject: Firmware Version in ipmi mc info
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000093b3d105b35cf693"
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

--00000000000093b3d105b35cf693
Content-Type: text/plain; charset="UTF-8"

Hi All,

Currently the ipmi handler for "mc info" command depends on the "Version"
property on interface xyz.openbmc_project.Software.Version.
But this is getting populated only on the image update path by
phosphor-bmc-code-mgmt.
Shouldn't the version be set on a normal boot as well? Is this a gap in
current implementation?

Thanks,
Shakeeb

--00000000000093b3d105b35cf693
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>Currently the ipmi handler for =
&quot;mc info&quot; command depends=C2=A0on the &quot;Version&quot; propert=
y on interface=C2=A0xyz.openbmc_project.Software.Version.=C2=A0</div><div>B=
ut this is getting populated only on the image update path by phosphor-bmc-=
code-mgmt.</div><div>Shouldn&#39;t the version be set on a normal boot as w=
ell? Is this a gap in current implementation? </div><div><br></div><div>Tha=
nks,</div><div>Shakeeb</div></div>

--00000000000093b3d105b35cf693--
