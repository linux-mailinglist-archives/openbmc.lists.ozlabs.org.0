Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D61522E3FD
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 04:29:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFNzh6H0WzDrCX
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 12:29:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22d;
 helo=mail-oi1-x22d.google.com; envelope-from=suresh.11v@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SJrRKLkt; dkim-atps=neutral
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCx5447CJzDrSq
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jul 2020 03:28:52 +1000 (AEST)
Received: by mail-oi1-x22d.google.com with SMTP id x83so8614159oif.10
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 10:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LECeIUquZkdSYcTLY7+MC2231l7CESC3KN1/VeuJ1bM=;
 b=SJrRKLktfOXoMP18gxYt+6L60ol1/syU5GReIjYmmH7gM/moVEi0gYqAp5Ve/z/hIH
 XSfdoGbDPrhhU6Ufig9FmBzcV5+p+EgRq5IBwjdGhWSzbaEB5ZcsZFkDx41PfKW5oed/
 +CI6C244n0EF2yKXXUb2oDMSZDLk5HPWj2Ye+SLvVGjbJo5MSCTd5/ZuoaI+asD5j1y1
 u7ZQ0u+HKPjjCtsKShE2S8LU0bFIeCJMFSgsCwA7GN3iOWTP73X7Qyg2dWqr2UY5Mz01
 v/LLK+7v71hWqOZYFtiXQQlH0G8F6+Cif2soly3ftGBA9oGbiBPmvWXGnbcWkQp8QOxF
 15UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LECeIUquZkdSYcTLY7+MC2231l7CESC3KN1/VeuJ1bM=;
 b=FBNjXhSaV66AbVCz48M/YmC5g1L8BGf2YF7UF+MLJTFpqSXZnG8lI/UecfWW2Bzw0X
 6gDpvJ5K/gFc2hPTiCL9vtEFLBRde6w7W5IEf1CLJ/KJBxOpGvnhuhuD6XomHss+zmIP
 mEK6l7q3TTPH7TG/UEXMqB1Ca4iI6YbGEAsKWWMJePGLCI5jvW9ZgGmlMMfAWoa+XnYI
 Ftfb2HIWZ7M9n8nziotgu1ewUDxebEw7yeKmUCYa5FXZeJPqQ7+gP92Tlo56yDgkq24n
 JzBjPYlSSY3u9IdLKQUnkoIWp6DS1RA1jv09RcKgUqokMAOLSD2BO/v2mF6f0Dh0REV7
 0WlQ==
X-Gm-Message-State: AOAM531TmXqAr5uoyciOQhAQzTf5XKValcDDeckFzijzxzvdIPh/Wo7i
 TLqDQGtGOk/ar4OZ2iB8FjGIMCynQlcMHN3czZk4FJDt
X-Google-Smtp-Source: ABdhPJxj6MubdTPqGDsuqi8SMd7xlx42vn+eNUfhDDSTSbZ51hkN4h8+ioTAmNbZsoT3BXaFsrvzYd19dZ87MLVf0Ys=
X-Received: by 2002:aca:4b88:: with SMTP id y130mr8821886oia.36.1595611727644; 
 Fri, 24 Jul 2020 10:28:47 -0700 (PDT)
MIME-Version: 1.0
From: suresh v <suresh.11v@gmail.com>
Date: Fri, 24 Jul 2020 22:58:36 +0530
Message-ID: <CAAO56wvAvc-__MdzQriFt4xze1HMRaToozqGL2ephXuMhYJmnA@mail.gmail.com>
Subject: Reg Backplane Inventory Support in Open BMC
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000039cb3a05ab334e0d"
X-Mailman-Approved-At: Mon, 27 Jul 2020 12:27:30 +1000
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

--00000000000039cb3a05ab334e0d
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm Suresh looking for frame work support of backplane inventory via side
band I2C from base board management controller in Open BMC. If there are
any support in case, can you please give me some pointers to start of
looking at it?

Thanks,
Suresh

--00000000000039cb3a05ab334e0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m =
Suresh looking for frame work support of backplane inventory via side band =
I2C from base board management controller in Open BMC. If there are any sup=
port in case, can you please give me some pointers to start of looking at i=
t?<br><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=
=3D"auto">Suresh</div></div></div>

--00000000000039cb3a05ab334e0d--
