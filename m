Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6527ADFF6D
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 10:29:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y6B06PK1zDqLs
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 19:29:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=tyler.sabdon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QXDfEkT2"; 
 dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y69G6sZBzDqGW
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 19:28:50 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id r1so9482007pgj.12
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 01:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=zYIg2xFSsgX+lDC4k19pQebOaNIhWW+hsOy7Is1IBfc=;
 b=QXDfEkT2zF5VHp3NMCB6B2YlCKi3p4N8UVDcC4dK0mC777wzEBYh7+RJVR21UA7bCO
 P7OA2vcI86wjulOm4iBuF4RRErzNZOf5k22ukrrcHGeEieLYoRsvw+gDmrF8wxYWhcrV
 eOqS2ljRaJnRLCecQtRAQLLgAQ4d2yZYvUMAyRCRYqHTx744LsqcB5oCi4ZqgHz7xI7e
 9VNTNzwyNzBQOW0En339G1aGS7RS/CrnThfVNgRn+ZJ8R1Pd38+reUhk/WKD5mzvYONC
 pMoDKfE7yDeZcHJrUkv6qMjsG1jvTIluZ2Mi8Pbqpj3DWmD1RCz6uVBkpuL0wqJbL3bT
 s+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zYIg2xFSsgX+lDC4k19pQebOaNIhWW+hsOy7Is1IBfc=;
 b=aNoSDPPbvxwsvq2TlBuKMVa1prjVTUYp93TnQV6ba4uUKsjsmGR+P6txc76ZZ8/XA2
 UtbDwY65YEPO7cqhkEpXVMt9ISc6gF+VSCYVZeSgVQ/lUtJx2NAkLYAMFzDF3sXQVGDZ
 LNyKQA1Ibo2MM56fc/VQknjg6bqNkiu0cgaYDUXtXp8AoaujKjWxpvC6+P1SI5gHGFBk
 zAZpZu2XEHB8SKhuxFX2U2W3PvZIxv5UhXgNbDCwW1AShZaF9G35+K57so+Z942dYYrR
 +HqheyrRzNFVBytMgbhvyXCxIt9NI9GWSUjWGFthBjxyK+E7QFamt379FgdQZHN3UBAb
 aBKg==
X-Gm-Message-State: APjAAAWEKfkBtIa2pxlUUn/YVNNPit49qGJzWTGGOGrS8NjlrnTXf4ie
 J6VnRtpvgThm+5EGx9d62+nPhGUwFtePJc8jcJwH5i4Y
X-Google-Smtp-Source: APXvYqwGe/ch0n+kLJwP6QsKg1bHnmLVmz7bhvPf2xQmnH2ZHl9tr6NGv1wxOAoYUtugBf3us0G8azNscAf+mCJDQoE=
X-Received: by 2002:a17:90a:17c4:: with SMTP id
 q62mr3058950pja.83.1571732926306; 
 Tue, 22 Oct 2019 01:28:46 -0700 (PDT)
MIME-Version: 1.0
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Tue, 22 Oct 2019 16:28:08 +0800
Message-ID: <CAO9PYRJk09g_NbpCWOedcFpeqbcec=jptfiOerO8TPDKGChOgQ@mail.gmail.com>
Subject: There is no image generated while build ast2500 evb
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000c122e305957b96fc"
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

--000000000000c122e305957b96fc
Content-Type: text/plain; charset="UTF-8"

Hi All:
    I build openbmc latest version, just clone openbmc master branch, and
do following command:
export TEMPLATECONF=./meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf
. openbmc-env
bitbake obmc-phosphor-image.
After build successfully, there is no file "flash-evb-ast2500" and any
*.mtd file in /openbmc/build/tmp/deploy/images/evb-ast2500. Could someone
help to build ast2500 evb image? thanks.

Tyler

--000000000000c122e305957b96fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All:<div>=C2=A0 =C2=A0 I build openbmc latest version, =
just clone openbmc master branch, and do following command:</div><div><div>=
export TEMPLATECONF=3D./meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf</div=
><div>. openbmc-env</div></div><div>bitbake obmc-phosphor-image.</div><div>=
After build successfully, there is no file &quot;flash-evb-ast2500&quot; an=
d any *.mtd file in=C2=A0/openbmc/build/tmp/deploy/images/evb-ast2500. Coul=
d someone help to build ast2500 evb image? thanks.<br></div><div><br></div>=
<div>Tyler</div><div>=C2=A0=C2=A0 =C2=A0</div></div>

--000000000000c122e305957b96fc--
