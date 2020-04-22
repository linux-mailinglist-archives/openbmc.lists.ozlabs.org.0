Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 868861B49E8
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 18:11:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496lm96SG5zDqv4
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 02:11:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EY2GOFye; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496lZN4gnvzDqTK
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 02:02:35 +1000 (AEST)
Received: by mail-oi1-x22a.google.com with SMTP id x10so2459413oie.1
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 09:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=fEtKPg32ljn1stbDRIyyeEl78Q6p27wVcaNA3+YICKA=;
 b=EY2GOFyerU7/PIg3N2CROIy+HKzVpW7ZCMq3viIvC42hIJadRyc0huepDE2wzqaguw
 QV99Y461BqadiSjigrox2TSvbVQOZ3yr4BVE+Q81MXUL0O0bHr5bgaBDA0S1PbUgc9CB
 vPQ0cmh1WNt0o+2ykBUHqojDFDJ8EnLvCFFHR64YpqeoF92irxcnriU/DU0G+EDDh//D
 eIDDhb2iFwggp2yfh69zG529ozAnBqGiys/3UTLaUh9OprPOZJWumRo2o00FxnJiT5xy
 80iEjkFwHmzUCVGLyauzwJm67CyGM6wDyHO9X5QCXAopC0xXy7/rU3yTzQdi4rWyqOUu
 8umA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=fEtKPg32ljn1stbDRIyyeEl78Q6p27wVcaNA3+YICKA=;
 b=d755PjXOS/3tQqihstkSuHdQQcNPg4okHHNPtzJ21PFJDIVnuQNykfkmDGNs7s9vu9
 HPTKMKvafYbHUaPdbdpom109ziUOP8dwQgkSHCHTvjCtDU7r9NnlZPEHOh2+Ye3BFQOR
 MrFwNFsSnRPCaH3HNh/yBVToj//PzQKvt4Hqzn/GcKCg+hBHeq9VO0IosCMTu6baT8j5
 RIXQdZXupTsLa5uBZWzjt9t72VIZDTjshZzVvvVKibpWi2LdN276hGNnnnYrzyWmeY4y
 ehGt/b2Q0p29+9U+pM2/vnuihADrIPwrulzy/vyceKkYEcRn30oyxHOuc1akyjmwZAFS
 kYYw==
X-Gm-Message-State: AGi0PuZNV3FUFdGBwLuGQz84W+YLtwDs1COZf3gRSjUyFl0g0B45sQ+7
 x5bZv7IitJVTenNCmgwvkg2fYv3u2ig=
X-Google-Smtp-Source: APiQypK/c6YrV0t1gSpq1f3DAwSic5Oc97SKLB88RKxotOGhK+n2y6Oupaomxa9RA9QZGTz4EkNICQ==
X-Received: by 2002:aca:5613:: with SMTP id k19mr1789417oib.148.1587571351393; 
 Wed, 22 Apr 2020 09:02:31 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:28dd:4ed0:302:40d3])
 by smtp.gmail.com with ESMTPSA id 61sm1604451oty.56.2020.04.22.09.02.30
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Apr 2020 09:02:30 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Adding new machine in CI, Tacoma
Message-Id: <7386475E-19B2-442F-97C4-B5CAF6FCD92F@gmail.com>
Date: Wed, 22 Apr 2020 11:02:29 -0500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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

Hi All,

IBM has created a new system called witherspoon-tacoma. It=E2=80=99s =
based on our
Witherspoon system but it uses an AST2600 instead of an AST2500. We=E2=80=99=
re
utilizing the larger emmc based flash that comes with it to add =
additional
functions (like mctp/pldm).

Witherspoon is currently the system that we run all meta-* commits =
through on HW
CI. I=E2=80=99m looking to transition our HW CI to this new Tacoma based =
system. It will
be faster (the AST2600 gets to Ready state 4x faster then the AST2500, =
and the
emmc code update is also quite a bit faster), and it will test more =
OpenBMC
functions.

The first step is adding this new Tacoma machine to our CI compile. When =
adding
a new system, it=E2=80=99s always nice to remove one. Once we fully =
switch over to
Tacoma I think we can remove Witherspoon, but until then we=E2=80=99ll =
need both. On my
chopping block would be Zaius, Romulus, or Palmetto but I know in the =
past all
have been requested to stay so I think for now we=E2=80=99ll just deal =
with the
addition.

If anyone has thoughts or concerns, let me know.

Andrew=
