Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 630D23B37FB
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 22:38:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9sRL0zC9z3bvX
	for <lists+openbmc@lfdr.de>; Fri, 25 Jun 2021 06:38:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RwDkdXd1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d;
 helo=mail-yb1-xb2d.google.com; envelope-from=priyankapillai1206@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RwDkdXd1; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9sR46vXSz3093
 for <openbmc@lists.ozlabs.org>; Fri, 25 Jun 2021 06:38:22 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id s129so1225472ybf.3
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 13:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=IklKpZPeclNgIkVhJcSl++4STeWcr3H4PTVMR/s+eX8=;
 b=RwDkdXd1eNfNdSDSpTWvn2b0d835xFuFAj9FdU/dZvkemHBIE8co1v6epKEfouLoSW
 S/Wi2D0IaSWJwVbj1xZwD1B+lM3dOJchKEuU/SWryQJQDSLPs15os8WK+imivYnrW2u/
 ueGFyZkkl6QZ89U+zu7wnnhpuUwDTmvIpxkVflkPAKII06FcSEh4l6ZTa/XR69sKiAAt
 AjPIgb4ZRvr1Y7+UPLs4TgrJPcn6CkZuWRQA6l0mVTPP5WkLtMLwyfmS/z4l1qbMVGSy
 5Mv997Kuj1H7FN83MaIwjoAEawIv+OX5Himnp2esG3xP60AvOV12tqcJ5zxwlo1lWL58
 wzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IklKpZPeclNgIkVhJcSl++4STeWcr3H4PTVMR/s+eX8=;
 b=P2QoSSvm+2ghvyJjdGKRj+ARcq6mAbOtumJFrNu1BaO+KzpC+V6aBWmtf21NRsyWGl
 GX7xpgnIBlttjIAVxocresJT2hJgD9JSLIdFSf51OWzNOl/E2clDgmgHut1WYqLag6VW
 EN7VGazotKWsDD6TmUILN+wYyw2VY/J/h5gtFZO78nrXEPy48+cP2t/VcsMfvILLosOC
 P/vUuDSSgwalbOd9bQWc1VOn0zOJnOotRFBACgbri4jXiI89L0V75wVeVFVLf0HyJtVM
 KXsNmBW/rXs1YH92VuSMyMpvRFyrHT+06spOJx2vs2cSaXhOwdosoEeIm1NwbbaU34wu
 BIxA==
X-Gm-Message-State: AOAM531uHY/C09HtKqSzLzwPIT5AQMHpoFyOVpb+PoQVgWeOGWhZ0LCp
 LEWstZ4h9kU1RPI1NzIkme9PGuMddiVfQzbnJ3qQ0Qd1wRJHfw==
X-Google-Smtp-Source: ABdhPJxLWMLqGZobqw5u1io/rusq/ZHolW8Lc33lZGqw++K4iZlFC6/dtCponX+JFHl0lQaA8KvknQBQ0HAW8NJ+oJU=
X-Received: by 2002:a25:2b45:: with SMTP id r66mr8076491ybr.390.1624567098328; 
 Thu, 24 Jun 2021 13:38:18 -0700 (PDT)
MIME-Version: 1.0
From: Priyanka Pillai <priyankapillai1206@gmail.com>
Date: Fri, 25 Jun 2021 02:08:07 +0530
Message-ID: <CAJCnuYkhk_C1eaS=nUPZ4ZwtC+joWuBoOUWoh2E8chMG5Wb6Jg@mail.gmail.com>
Subject: Requesting feedback on in-progress GUI designs (Bios settings)
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000cf4cb005c5890072"
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

--000000000000cf4cb005c5890072
Content-Type: text/plain; charset="UTF-8"

Hello,

Requesting feedback on the new design of *Bios Settings - Logical Memory
Block Size, System Memory Page Setup, I/O adapter enlarged capacity*
screens in the WebUI:
https://github.com/openbmc/webui-vue/issues/69

Regards,
Priyanka Pillai
User Experience Designer | IBM iX, Bangalore

--000000000000cf4cb005c5890072
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Requesting feedback o=
n the new design of <i>Bios Settings - Logical Memory Block Size, System Me=
mory Page Setup, I/O adapter enlarged capacity</i>  screens in the WebUI:<b=
r><a href=3D"https://github.com/openbmc/webui-vue/issues/69">https://github=
.com/openbmc/webui-vue/issues/69</a></div><div><br></div><div>Regards,<br><=
/div><div><div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Priyan=
ka Pillai<br><div style=3D"font-size:12.72px"><span style=3D"color:rgb(102,=
102,102)"><span style=3D"background-color:rgb(255,255,255)"><span style=3D"=
font-family:tahoma,sans-serif;font-size:small">User Experience Designer | I=
BM iX, Bangalore</span></span></span></div><div style=3D"font-size:12.72px"=
><br></div></div></div></div></div></div></div></div></div></div></div></di=
v></div>

--000000000000cf4cb005c5890072--
