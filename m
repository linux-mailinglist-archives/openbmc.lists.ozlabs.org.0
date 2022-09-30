Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7AD5F2951
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 09:17:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mgsc82363z3blV
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 18:17:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=atrustcorp-com.20210112.gappssmtp.com header.i=@atrustcorp-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=YLrpkC9t;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=neutral (access neither permitted nor denied) smtp.mailfrom=atrustcorp.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=mark.chuang@atrustcorp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=atrustcorp-com.20210112.gappssmtp.com header.i=@atrustcorp-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=YLrpkC9t;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf1JJ4NXpz2xjw
	for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 16:57:34 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id i6so3481924pfb.2
        for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 23:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atrustcorp-com.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=c87dJl2PGwigZik8ti8FFoYjGi/lHiQNXgd4iM9oYoI=;
        b=YLrpkC9t+A2jYbMH0iijJ/4srDlSr68IUXMP6FlVi8xiEKzEoLZuWXn4+ziB/g6HDQ
         MQ5EaZmDoxuDPnd1s0LX+FTxnwg8xJ7aUTjAo3IqZIrc9jY1WfaYKuOyVkcQQXdx3IC+
         awIlBRe0qAQekgNxMT0TMzpPdXYSjueXwJs1MR3yM4OCnK8FWmrELuqppqlH6SjBUie/
         l6HXImZ8D+Ul0LcutOsuujKx8BrAJa5g5M9iGbN6XO3zsV33c5FGTWQN7GTHsnxnnR4I
         0ZVDfDHFPXSiQmiwEdRVT38TTlALIkHYOn8JwMWuGhSKDjB6+n+mPPAs3Mtx5WYEP7/e
         xxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=c87dJl2PGwigZik8ti8FFoYjGi/lHiQNXgd4iM9oYoI=;
        b=nvRAYKLSPGvSH4UO6S+yiwxcOcFcsglNgqc0Dv4jwUQ9XcIbfcYIa3eT7A+FmuohcX
         Nh5HDP74Qactdu56UDMUn8/Ixjgz9pQC/RvI0XY6OiUzTunpvtx5Lav6hLDQtGSCDzWS
         Qt6w1WchH5FNYPRzBEfqqshppkXYVA9hLVLM/jX+8KHkDoOdguivP0QvhZEFcd59UkjV
         8BBoAQwKT905/0CHthZV6afUD92+cvdUYmZ7ciRYOsmMmXyJn6vAzEMc4WPjj1F0b1a1
         oiuw70Zph+HZb1KdIXGYRZMwkhHjTVrcu2eQD0Tsk7PgX72UXwcWCnNUUPRYzVCnnALa
         zOdQ==
X-Gm-Message-State: ACrzQf2X5IOr/tZO9PVp3uNBx9A5oRM6bIMFUTk8IGTGU2MuwLy+Cs+y
	IEPNy77RbK4ze6IK6sOuKRRpdttpToAO5g4mLae4oJ0Zit1xGw==
X-Google-Smtp-Source: AMsMyM7cnuIwt+b7BqHuxeFzIMUAsikMxf8S6FfMX47CSjaZoyd5+CZEtNvA61c0oV/wKKFeID07AZC+pdEfA7ovXus=
X-Received: by 2002:a65:408b:0:b0:42a:55fb:60b0 with SMTP id
 t11-20020a65408b000000b0042a55fb60b0mr6307586pgp.431.1664521051067; Thu, 29
 Sep 2022 23:57:31 -0700 (PDT)
MIME-Version: 1.0
From: Mark Chuang <mark.chuang@atrustcorp.com>
Date: Fri, 30 Sep 2022 14:57:19 +0800
Message-ID: <CACGzOBdou00Tn0Lv_LueninhQ+tuBxJogBo4+0m6fEw-c5y0hg@mail.gmail.com>
Subject: How to configure 'Video input from DVO' on OpenBMC?
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000f86bce05e9df818e"
X-Mailman-Approved-At: Mon, 03 Oct 2022 18:17:26 +1100
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

--000000000000f86bce05e9df818e
Content-Type: text/plain; charset="UTF-8"

Hi,
Ast2500 support 3 paths
 1. Video output
 2. Graphics CRT output
 3. Video input from DVO

I have a project which needs to use 'Video input from DVO'.
I try to set pinctrl VPI24 and set SCU2C[17:16]=10, but KVM still is no
display.
Is there an example to configure this function for me to refer to?

Regards,
Mark

--000000000000f86bce05e9df818e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi,=
<br>Ast2500 support 3 paths<br>=C2=A01. Video output<br>=C2=A02. Graphics C=
RT output<br>=C2=A03. Video input from DVO<br>=C2=A0<br>I have a project wh=
ich needs to use &#39;Video input from DVO&#39;.<br>I try to set pinctrl VP=
I24 and set SCU2C[17:16]=3D10, but KVM still is no display.<br>Is there an =
example to configure this function for me to refer to?<br clear=3D"all"></d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Regards,</div><div class=3D=
"gmail_default" style=3D"font-size:small">Mark</div><div dir=3D"ltr" data-s=
martmail=3D"gmail_signature"><div dir=3D"ltr"><b><span><font color=3D"#8888=
88"><span><font color=3D"#888888"><span><font color=3D"#888888"><span><font=
 color=3D"#888888"><span><font color=3D"#888888"><span><font color=3D"#8888=
88"><span><font color=3D"#888888"><span><font color=3D"#888888"><span><font=
 color=3D"#888888"><span><font color=3D"#888888"><span><font color=3D"#8888=
88"><span><font color=3D"#888888"><span><font color=3D"#888888"><span><font=
 color=3D"#888888"><span><font color=3D"#888888"><font size=3D"-1"><span><f=
ont color=3D"#888888"><span><font color=3D"#888888"></font></span></font></=
span></font></font></span></font></span></font></span></font></span></font>=
</span></font></span></font></span></font></span></font></span></font></spa=
n></font></span></font></span></font></span></font></span></font></span></b=
></div></div></div>

--000000000000f86bce05e9df818e--
