Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5772CA2DF7
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 06:01:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KQlk4bZhzDrg4
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 14:01:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IDD/87/f"; 
 dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KQkn1JzwzDrg1
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 14:01:04 +1000 (AEST)
Received: by mail-ot1-x32f.google.com with SMTP id r20so5664777ota.5
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 21:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=WpwlJiW9xWTYWfsVe4D7gsXpfkhB37sJOHFi65QYkbc=;
 b=IDD/87/f/lWJMddlsLmmAd/xv8ghGtda2/b/tQ4/S20kiC4rNMnKRTEKHfmCUfICQc
 Ofq1OjyAbGRm7q5NANtnTFYkiBwItlB+7QBxLl4im2UrM4p593wKfVGOw0SPbKUX19o9
 28mTqEhZMfkPl3+kt5Lxz5NsWBXrD2zlSf72R9zXxkDac+pJ95pzv99WrTWxslXYrsLI
 i3NY2brwkk2cmhS1Kkpvk0tYQkht0PFJyCsSnH9Shbq6fjixN7DsQaq4XWKq5eLq+RDU
 EmjVcQ0UmJhVCvnUB0+oEb//6it9BiGqvnxpHug2SqeIFhGfqqsks2ZjrU3qfmzFr9ni
 3inw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=WpwlJiW9xWTYWfsVe4D7gsXpfkhB37sJOHFi65QYkbc=;
 b=AQA/xRMlybh26SoznK8R72A+fcNup9BGGDvWChqvCPLLcad1qzUlqM9T7iMWv8nqxD
 5kDPFCRjYXcfJxxsXxx4PLxyeECbGulpUrnNtH9jh/V/dm7IZZyGABuvUdnQSEJZy8T8
 ZSFRPp5zDQEYy9dyqmL2mX1D4qJf11lqaWdeypxclrIwe2aDyfqchp04/qa05MsvyVlL
 Xqx231yZDCUxIv5TcNXglwVf19xdfZNvJSIbAalSh53NiTOFpWhX0FFmumKlYN6Zj4e3
 UFoawBzrit497SUtIIEK3C4lvrqyLXn2XSL1M7310ZRNoPV9D9lFSRuqT4b/OPPIBfwm
 Va2g==
X-Gm-Message-State: APjAAAUiER+n0Uy54gk5b4QRl1SwsR+kpYDHIl4m/n9RFdSPjk5fZIJo
 Q0x1bX9o9m0OLDwVfr9cXpmaZcqUFFS8QyIWsVhLsotk
X-Google-Smtp-Source: APXvYqx98/q5kH/BBqjVzMd947ok9wQQPHMQQCugF1IBEVNlzofDapaYUV8GdiDgfQ7cI9Sx8yTqtcuvqDmXI4r2nvs=
X-Received: by 2002:a9d:65c4:: with SMTP id z4mr10014566oth.115.1567137661131; 
 Thu, 29 Aug 2019 21:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAE33tLGxcBFHYzXQ7Uqdg03ZibvS4busoJT=iGTwLMb8TMD-2g@mail.gmail.com>
In-Reply-To: <CAE33tLGxcBFHYzXQ7Uqdg03ZibvS4busoJT=iGTwLMb8TMD-2g@mail.gmail.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Fri, 30 Aug 2019 09:29:11 +0530
Message-ID: <CAE33tLG6bt-jfGZxpKdASJ03trBvdKB6m-G9zfGgcSD4QFJ+1A@mail.gmail.com>
Subject: Re: Enable KCS interface in zaius
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000009b217205914dab25"
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

--0000000000009b217205914dab25
Content-Type: text/plain; charset="UTF-8"

I changed *PREFERRED_PROVIDER_virtual/obmc-host-ipmi-hw =
"phosphor-ipmi-kcs"* in the machine configuration file
/meta-openpower/conf/machine/include/openpower.inc.

Now /bin/kcsbridged is created in file system. But IPMI commands using
ipmitool is not working.

Is it possible to enable kcs interface in zaius?

Thanks,
Akash

On Thu, Aug 29, 2019 at 5:05 AM AKASH G J <akashgj91@gmail.com> wrote:

> Hi all,
>
> I am using server platform with Intel processor and Aspeed AST-2500 BMC.
> OpenBMC firmware with zaius configuration is used for BMC.
>
> root@zaius:~# cat /etc/os-release
> ID="openbmc-phosphor"
> NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
> VERSION="0.1.0"
> VERSION_ID="0.1.0"
> PRETTY_NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)
> 0.1.0"
> BUILD_ID="20190506124713"
> OPENBMC_TARGET_MACHINE="zaius"
>
>
> /sys/firmware/devicetree/base/ahb/apb/lpc@1e789000/lpc-bmc@0/kcs1@0/status
> /sys/firmware/devicetree/base/ahb/apb/lpc@1e789000/lpc-bmc@0/kcs2@0/status
> /sys/firmware/devicetree/base/ahb/apb/lpc@1e789000/lpc-bmc@0/kcs3@0/status
> /sys/firmware/devicetree/base/ahb/apb/lpc@1e789000/lpc-host@80/kcs4@0 all
> are in disabled state.
>
> Found /sys/bus/platform/drivers/ast-kcs-bmc driver
>
> How to enable KCS interface?
>
>
>
>
>
> Thanks,
> Akash
>

--0000000000009b217205914dab25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>I changed <b>PREFERRED_PROVIDER_virt=
ual/obmc-host-ipmi-hw =3D &quot;phosphor-ipmi-kcs&quot;</b> in the machine =
configuration file /meta-openpower/conf/machine/include/openpower.inc.</div=
><div><br></div><div>Now /bin/kcsbridged is created in file system. But IPM=
I commands using ipmitool is not working.</div><div><br></div><div>Is it po=
ssible to enable kcs interface in zaius?</div><div><br></div><div>Thanks,</=
div><div>Akash<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Aug 29, 2019 at 5:05 AM AKASH G J &lt;<a hr=
ef=3D"mailto:akashgj91@gmail.com">akashgj91@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>=
Hi all,</div><div><br></div>I am using server platform with Intel processor=
 and Aspeed AST-2500 BMC. OpenBMC firmware with zaius configuration is used=
 for BMC.<br><br>root@zaius:~# cat /etc/os-release <br>ID=3D&quot;openbmc-p=
hosphor&quot;<br>NAME=3D&quot;Phosphor OpenBMC (Phosphor OpenBMC Project Re=
ference Distro)&quot;<br>VERSION=3D&quot;0.1.0&quot;<br>VERSION_ID=3D&quot;=
0.1.0&quot;<br>PRETTY_NAME=3D&quot;Phosphor OpenBMC (Phosphor OpenBMC Proje=
ct Reference Distro) 0.1.0&quot;<br>BUILD_ID=3D&quot;20190506124713&quot;<b=
r>OPENBMC_TARGET_MACHINE=3D&quot;zaius&quot;<br><br><br>/sys/firmware/devic=
etree/base/ahb/apb/lpc@1e789000/lpc-bmc@0/kcs1@0/status<br>/sys/firmware/de=
vicetree/base/ahb/apb/lpc@1e789000/lpc-bmc@0/kcs2@0/status<br>/sys/firmware=
/devicetree/base/ahb/apb/lpc@1e789000/lpc-bmc@0/kcs3@0/status<br>/sys/firmw=
are/devicetree/base/ahb/apb/lpc@1e789000/lpc-host@80/kcs4@0 all are in disa=
bled state.<br><br>Found /sys/bus/platform/drivers/ast-kcs-bmc driver<br><b=
r>How to enable KCS interface?<div><br></div><div><br></div><div><br></div>=
<div><br></div><div><br></div><div>Thanks,</div><div>Akash</div></div>
</blockquote></div></div>

--0000000000009b217205914dab25--
