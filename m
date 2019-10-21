Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1351FDEB89
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2019 14:03:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xZzf1NwFzDqVL
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2019 23:03:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=tyler.sabdon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cje1Ry4a"; 
 dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xZyP0vnhzDqC5
 for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2019 23:02:33 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d22so6539920pls.0
 for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2019 05:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=61BObdNGVU4T2pRFM8FeAseClEHSxSEJ2Mu1KqafRN0=;
 b=cje1Ry4aBAUbfR9JFRwGrsCEh9kxDLuN9+Ywey2vxc4oBNL/SsbEols5/leOLVxMzo
 9LY4i6fN3so1qs30CG9taliVvPLLSv3ywfON/XgE6sNaAAnkjao7RzFPFBnhAYTHH1Zj
 lMsSyIEFzV8bCZkzv6DX2VXDqzzqWnBoxtQ1DVHocskCrSEqS7RJRai4aUoAiP5XL1c4
 zOZGR7Jmsbr0t8sOACBD9hYIMcqTmGGGe0SD2bq4y6kV5UB4/QUpm+lIMEE2DoaTJmyr
 gM9hAKuNkwDdGnPH+ZFN8vVVYttbF9G9WZD/GYnSb1jDw0I8485BFQw43v+5crumB6rk
 kwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=61BObdNGVU4T2pRFM8FeAseClEHSxSEJ2Mu1KqafRN0=;
 b=Ws3/kx+Oxh3V3pC0EiKS2xskus9yjo11tLwm6I8JT9fZPW49V0MUYqgJ505o0EkxZs
 jwU7GvUtuUrUnUWD2jL2G+KR61dWjcVnCcr0Jrehsii4ouxChJxoBj+/7MUHD0ACsqbT
 hxcfb+ve5e70Bu5u9uc6nBVEaMj8+cFhttoY7QDkjzo/Vr/ACstw/184ugv4uZ7HwjnP
 UD85zAQ/UpVj06lDB3HhRFckiLIHI8h6Lt6S4VYLIlqSWp6J7RO4uQrHo1wlx4oc/R7j
 2f4IA1XL3gBw8iRgO0eYKw7KuIzXRFHY1fleNrxTCEpy9exPoeprLsfmBTodIPk8gbHS
 Wjdw==
X-Gm-Message-State: APjAAAX/p/cgkEhLxJW2eQ+TR0lzQU3pXHawkxM7qTFKI/+RMnGPe3TA
 Hd34UzchpsSfIgYHz3csxw9XxBnpHCXJ8Dor5xPK/w==
X-Google-Smtp-Source: APXvYqwdBlmMlPbx6whbK/nFAFmB5SWb9IUL6Ff2/GSwGXXIbllSjX5vt6U6fX9s3QZw8XjvL8ZozGYK2GZyZJbW/g4=
X-Received: by 2002:a17:902:7c8a:: with SMTP id
 y10mr12790848pll.115.1571659349853; 
 Mon, 21 Oct 2019 05:02:29 -0700 (PDT)
MIME-Version: 1.0
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Mon, 21 Oct 2019 20:01:52 +0800
Message-ID: <CAO9PYR+FgeBr1su+xWy22kjAzPY7sEYreA4f2xCcMrgzHm3avw@mail.gmail.com>
Subject: run ikvm in qemu
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000418ca105956a7551"
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

--000000000000418ca105956a7551
Content-Type: text/plain; charset="UTF-8"

Hi all:
    I know openbmc release KVM over IP but I did't have any bmc board yet.
Is it possible run ikvm function in qemu which simulated ast2500?

Tyler

--000000000000418ca105956a7551
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all:<div>=C2=A0 =C2=A0 I know openbmc release KVM over =
IP but I did&#39;t have any bmc board yet. Is it possible=C2=A0run ikvm fun=
ction in qemu which=C2=A0simulated ast2500?</div><div><br></div><div>Tyler<=
/div></div>

--000000000000418ca105956a7551--
