Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B869A10A8
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 07:07:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JrGK6xS6zDrLw
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 15:07:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ulm0yyVn"; 
 dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JrFq076rzDrLK
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 15:07:20 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id b1so2173225otp.6
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 22:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Z4DkL96xQPlCPYXi6YpI+dIcvVZXQDG4/+giUizZ4FM=;
 b=Ulm0yyVnj4ntHhpLR6Jo/pLhuPnwDBFjKyINT4H3dEzz/1XYuQoNwvKmbY6AhNAeRK
 jI7xjBiV3MFd81229yVi49UH0r7m1iS91MC1oZiXS4HaeAPyacIN693G8O7ScO21iVkO
 NLWvRj1qaEtaSG1MRwo/BR2zUTNKfxbletkbbHU5gL8UoxmfY8eiC1X99Flwm4N/HHi0
 5Rl9XR4Mrwp2TCWbVluIGR1BG78NyJXHDx5S60BYoFxJh8GK43EaDmEHZc68rHAuxcrU
 hVXzAfnKkooYeKkcwIuSbtC9iMlcZzdSD5Mw0xCMOk+c/BqIRNjUDVfqHVzsMeNaEEii
 ByGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Z4DkL96xQPlCPYXi6YpI+dIcvVZXQDG4/+giUizZ4FM=;
 b=o20eMheot3WoulSXn2jC6TX+VyC72+y3yk2Wfw+U7h9jkc85sYv9q5+dcqCp7rBxgN
 avo5yPHI6v4TtYoF6yWRKstyMAdHMHiFXdwKkwB41U48qauKtBDevhushCAIIuzc12YG
 g+NvoyYSIUToFGGw2egUK0GxO7uu7uT8PkSR2kcXsx//3WF3AeU/ShaOzAx9XSK8LeAU
 nGGVsL37VBmed37vLlhr7ysJxmeGTrSyN3oSMNujob/hWzAZt6REUAOQGGwbHx1DkAtr
 if2sGGcdeu+XHxDkl2tovYC1d8Wf9Yr5b3AMRtZSTKYQn5lKnHzCii/wojMDbz2bYjPb
 bSUg==
X-Gm-Message-State: APjAAAWgsDxlP6pKPGpwfRpc2OzbCVBN4IUv9y208il99l4JI4Is1Kco
 kGEAkjgn4cqwryOs8eB0fV827PfS9kw6rmZs2V8v1J/a
X-Google-Smtp-Source: APXvYqzpU1aQ+BbqIXlYe0uBriicHPmnJhrBzMf2S5AB9JVQHm6gaEETtC9BqcxNE+i50ov5da2M1BnAAsMioqMsY/s=
X-Received: by 2002:a9d:65c4:: with SMTP id z4mr5783690oth.115.1567055235220; 
 Wed, 28 Aug 2019 22:07:15 -0700 (PDT)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Thu, 29 Aug 2019 05:05:26 +0530
Message-ID: <CAE33tLGxcBFHYzXQ7Uqdg03ZibvS4busoJT=iGTwLMb8TMD-2g@mail.gmail.com>
Subject: Enable KCS interface in zaius
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000a3885d05913a7a59"
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

--000000000000a3885d05913a7a59
Content-Type: text/plain; charset="UTF-8"

Hi all,

I am using server platform with Intel processor and Aspeed AST-2500 BMC.
OpenBMC firmware with zaius configuration is used for BMC.

root@zaius:~# cat /etc/os-release
ID="openbmc-phosphor"
NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
VERSION="0.1.0"
VERSION_ID="0.1.0"
PRETTY_NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)
0.1.0"
BUILD_ID="20190506124713"
OPENBMC_TARGET_MACHINE="zaius"


/sys/firmware/devicetree/base/ahb/apb/lpc@1e789000/lpc-bmc@0/kcs1@0/status
/sys/firmware/devicetree/base/ahb/apb/lpc@1e789000/lpc-bmc@0/kcs2@0/status
/sys/firmware/devicetree/base/ahb/apb/lpc@1e789000/lpc-bmc@0/kcs3@0/status
/sys/firmware/devicetree/base/ahb/apb/lpc@1e789000/lpc-host@80/kcs4@0 all
are in disabled state.

Found /sys/bus/platform/drivers/ast-kcs-bmc driver

How to enable KCS interface?





Thanks,
Akash

--000000000000a3885d05913a7a59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div>I am using server platfor=
m with Intel processor and Aspeed AST-2500 BMC. OpenBMC firmware with zaius=
 configuration is used for BMC.<br><br>root@zaius:~# cat /etc/os-release <b=
r>ID=3D&quot;openbmc-phosphor&quot;<br>NAME=3D&quot;Phosphor OpenBMC (Phosp=
hor OpenBMC Project Reference Distro)&quot;<br>VERSION=3D&quot;0.1.0&quot;<=
br>VERSION_ID=3D&quot;0.1.0&quot;<br>PRETTY_NAME=3D&quot;Phosphor OpenBMC (=
Phosphor OpenBMC Project Reference Distro) 0.1.0&quot;<br>BUILD_ID=3D&quot;=
20190506124713&quot;<br>OPENBMC_TARGET_MACHINE=3D&quot;zaius&quot;<br><br><=
br>/sys/firmware/devicetree/base/ahb/apb/lpc@1e789000/lpc-bmc@0/kcs1@0/stat=
us<br>/sys/firmware/devicetree/base/ahb/apb/lpc@1e789000/lpc-bmc@0/kcs2@0/s=
tatus<br>/sys/firmware/devicetree/base/ahb/apb/lpc@1e789000/lpc-bmc@0/kcs3@=
0/status<br>/sys/firmware/devicetree/base/ahb/apb/lpc@1e789000/lpc-host@80/=
kcs4@0 all are in disabled state.<br><br>Found /sys/bus/platform/drivers/as=
t-kcs-bmc driver<br><br>How to enable KCS interface?<div><br></div><div><br=
></div><div><br></div><div><br></div><div><br></div><div>Thanks,</div><div>=
Akash</div></div>

--000000000000a3885d05913a7a59--
