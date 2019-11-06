Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4E3F176F
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 14:40:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477SNL5kRfzF52w
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 00:40:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::336;
 helo=mail-ot1-x336.google.com; envelope-from=akashgj91@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YfoSLEQK"; 
 dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477SLQ2FChzF3sM
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 00:39:06 +1100 (AEDT)
Received: by mail-ot1-x336.google.com with SMTP id r24so4545864otk.12
 for <openbmc@lists.ozlabs.org>; Wed, 06 Nov 2019 05:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Wp/vTAq2Y2Tscn4dj/aaerJokvG4y5J+vjxllnYQswQ=;
 b=YfoSLEQK2HIEP2T9ptowoyieCNpGNe8P+TQ4jUOYBPdURH6XeztvmAVkGPa9a8Hokq
 21aQVfOWx47WtbPDAWXHGbkvu4fHRfq2lXnwZie/qbLYlhIbFmVgkQPPos7jYrKqU7O5
 0oRJ+mB2jrT7onKwJU5E1dDitDl/HoosjX506mJ4BWb2ktFvFuC1r2z1xBbwO5K7daKN
 tP/U1rylgSW+XJsScx+a54fnvHWVhZVk+7xHvGyH8YJnIv+xNpQB0Z91MKg1C5lpWrWj
 6JdE51d0OZVjaJo4WHeSrswh4ygiT2CCwUbZc0M34cYnL0SYFXwKcZ4eyDWoHms+kfRH
 2ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Wp/vTAq2Y2Tscn4dj/aaerJokvG4y5J+vjxllnYQswQ=;
 b=tZSXuNdWeAAFanNmX4AtHWUtppJ8CdOfRk2hiLeJJpaK3pi7a5U03NGNzSK5syKh0l
 AOhRea65IikSCbvIgzbn4vZSL3Hi2EbMFKsyWFHvq+QT2t/+QDdUNg4o/w2a/jwRKLop
 oRZMFPuOJvjSXUxQWi4xgePvqn9i/EpIbeO5pTepZz0smXwSIHYWMYej8XWbvkrLIOx7
 Dmxtr73q8zpyJxzZ469CeekdkcHPfN1ZRtYwd+8hvE/XZpEu4bJXP/gdx88Hby//8hbg
 vlUtiEae1gVTWhVDTGuzSKshHycoVUoKlvIMb82ezbKjxtcRgVDaJC1yqGqfzJHhCc4N
 NijQ==
X-Gm-Message-State: APjAAAUoIn9vVxipAIQkGkKWfRWNOd6GB2VRbUY/udQhCb2188YjNk03
 VeKQ8BBEqrEoj0HlfPqsvKbvSv9Sjiiwt5WVj30dirwh
X-Google-Smtp-Source: APXvYqyMKiw/PG9CL9Yau+l15BOwlBCQVqiwU9E5UZaGY7DjrOENfDAQCazs6FgPq1M7Eb3g5M+ku8fCIeEH3TTn+Eg=
X-Received: by 2002:a05:6830:12c7:: with SMTP id
 a7mr1958760otq.308.1573047541238; 
 Wed, 06 Nov 2019 05:39:01 -0800 (PST)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Wed, 6 Nov 2019 19:09:26 +0530
Message-ID: <CAE33tLFmxAxOGze5+rf20w-nBBBqOFzkLu5dbsXsKCWTeV5i0Q@mail.gmail.com>
Subject: No login prompt on obmc-console
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000e90f7a0596adabf6"
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

--000000000000e90f7a0596adabf6
Content-Type: text/plain; charset="UTF-8"

Hi all,

We are using BMC Aspeed AST-2500 in our motherboard with OpenBMC firmware.
'obmc-console' is used to get host messages over BMC. obmc-console.conf
looks like




*lpc-address = 0x3f8sirq = 4local-tty = ttyS4local-tty-baud = 115200*

BIOS serial redirection is enabled over COM port 0 (0x3f8, sirq=4,
baudrate=115200) for super-IO.

We are getting BIOS debug messages, grub entries on BMC. But Linux booting
is very slow, it is not printing systemd status messages(OK/FAILED) on
serial console. Also is not giving login prompt on the serial console over
BMC.

Please someone help to resolve the problem.


Thanks and Regards,

Akash

--000000000000e90f7a0596adabf6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br><br>We are using BMC Aspeed AST-2500 in our mot=
herboard with OpenBMC firmware. &#39;obmc-console&#39; is used to get host =
messages over BMC. obmc-console.conf looks like <br><br><i>lpc-address =3D =
0x3f8<br>sirq =3D 4<br>local-tty =3D ttyS4<br>local-tty-baud =3D 115200</i>=
<br><br>BIOS serial redirection is enabled over COM port 0 (0x3f8, sirq=3D4=
, baudrate=3D115200) for super-IO.<br><br>We are getting BIOS debug message=
s, grub entries on BMC. But Linux booting is very slow, it is not printing =
systemd status messages(OK/FAILED) on serial console. Also is not giving lo=
gin prompt on the serial console over BMC.<br><br><div>Please someone help =
to resolve the problem.</div><div><br></div><div><br></div><div>Thanks and =
Regards,</div><div><br></div><div>Akash<br></div></div>

--000000000000e90f7a0596adabf6--
