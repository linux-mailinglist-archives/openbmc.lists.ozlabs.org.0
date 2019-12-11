Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 309C311AAFC
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 13:33:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XxCw4p0DzDqnw
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 23:33:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=tyler.sabdon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VMD/FZL7"; 
 dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XxBJ08j1zDqC7
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 23:31:35 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id l24so10713765pgk.2
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 04:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/c/kRO9+2qVCIcbPZa4KFTB4fCEGiWGSdVwCdEawRHg=;
 b=VMD/FZL7WGEtyraPqvpgj6AZnJThBO/dpXWLGdZ3ts0R3Qyoere5xmItR+jAfntA8T
 C29PNQWBvLw7AjBIGwTLbdR1oWpI9KBTLv8+MRu6rDVGfZzSsYgsaEewsMj6On+OQ6Cg
 9y5+t+uDqfId5+5XnhF2AOKAJhLYAUgxBvEmUlYt6BhuTpoE/BYLUWXR/tok7s3UCEIO
 kt8yyMOIKEPkPnS99nyzhsBfb1REcObfyeKBteDke5JRrB6I/4KD7NCmbg8ColL+c9Hx
 n4BH+nRGJxPDaR50SRM2fm+4GDR3MHhKboGGwLWfYt9OUA9cFSUCf2iFjSP3pmPHpyZL
 Foog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/c/kRO9+2qVCIcbPZa4KFTB4fCEGiWGSdVwCdEawRHg=;
 b=grNkgUxpixNebKDOBlIP722yVQYsB2pYxlI9/vUkAaHjGVM51T2u1P9sGyVTwPc7yb
 v5uEJUoHaKda/2yAwkCEBoQRiSXesfmn6Ca9dbxlFMOMc0YYV58sfV9yeCocXkKf6ZEo
 6yp5F4VN8vGjhbe132qg/1CrVUMZlaBGDlr4DIyz0AmFQTD2VfE5o/q+6FeiIJlEoQTN
 xd3FQh/sWdMB/KAK/47ndgb196AiyIozpv551794xXExu9LclyGZ6Kx++ZGoPHAvzQRW
 HOjT2xmXKZNtQVJCIexgKt0eORl0bXLg1/D7jHPhVmjYK3fK5kCY3jRodbzZh3Q5L9M2
 vyyg==
X-Gm-Message-State: APjAAAVvJ2U/SAdvVqdTMANy7eMXmR58zY1Jeur8bXv9AhvD+ECE7J6W
 z0tOZ723giNTjFvK9igdQU+s4e0hQS1XsgK5MyWYEoCC
X-Google-Smtp-Source: APXvYqypJw0oYHVOEGR22+jskNmApYAyIguHtqxRKzsC9sR+A7m8f+phUpzRFsB3LpUN7QSeAFjuuUReBpv9zN1jyds=
X-Received: by 2002:a63:8f46:: with SMTP id r6mr3833208pgn.51.1576067491037;
 Wed, 11 Dec 2019 04:31:31 -0800 (PST)
MIME-Version: 1.0
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Wed, 11 Dec 2019 20:31:19 +0800
Message-ID: <CAO9PYRL-M2ZjPr6R+V+isDiFttkpbp2hWNHQVsPxFOV6G+mtOA@mail.gmail.com>
Subject: SLPD multicast support
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000f203d805996cceae"
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

--000000000000f203d805996cceae
Content-Type: text/plain; charset="UTF-8"

Hi All:
    I have a management tool to discovery service in a subnet by slp
multicast. But I can't find any openbmc server. I check
https://github.com/openbmc/slpd-lite and find that slpd-lite didn't support
multicast but unicast. I am confused that how to leverage unicast slp in
openbmc? What is the service name in openbmc? Could someone example a slp
usage scenario in openbmc? thanks.

Tyler

--000000000000f203d805996cceae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All:<div>=C2=A0 =C2=A0 I have a management tool to disc=
overy service in a subnet by slp multicast. But I can&#39;t find any openbm=
c server. I check=C2=A0<a href=3D"https://github.com/openbmc/slpd-lite">htt=
ps://github.com/openbmc/slpd-lite</a>=C2=A0and find that slpd-lite didn&#39=
;t support multicast but unicast. I am confused that how to leverage unicas=
t slp in openbmc? What is the service name in openbmc? Could someone exampl=
e a slp usage scenario in openbmc? thanks.</div><div><br></div><div>Tyler</=
div></div>

--000000000000f203d805996cceae--
