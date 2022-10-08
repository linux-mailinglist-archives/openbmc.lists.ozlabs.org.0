Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA555FAA82
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 04:11:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmfRZ0JNjz3bqw
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 13:11:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LgM0Jr7I;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2a; helo=mail-vk1-xa2a.google.com; envelope-from=sivaprasadsubramaniyam@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LgM0Jr7I;
	dkim-atps=neutral
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ml9Pm6NQLz3bry
	for <openbmc@lists.ozlabs.org>; Sun,  9 Oct 2022 03:20:10 +1100 (AEDT)
Received: by mail-vk1-xa2a.google.com with SMTP id e5so3512821vkg.6
        for <openbmc@lists.ozlabs.org>; Sat, 08 Oct 2022 09:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pOaKDEzkolnfW1iFoTFhg39KfgRv/xHfYlYUOxXTaoo=;
        b=LgM0Jr7IPS/ZTmhsjTxA4tIw7mJw0NKmpuVBbn6D3yul3jBV42o1gqxMGqe9ngYewB
         mOkVWUeZWzE0Gkol7Fzq2+ECbBOGYrCJxlfhyuZ+BCsUbXoxf1WYhWAs7bRaOHGMReKP
         PruYstP/o4qto9kTFOZddN3hLVlnSTmsGg6Nt5TpjrrzUMORx7EhwdcdShyNwpd7vcX5
         neSEClBroRoqKnr5fSOk/RoPa5+rKZ0mgnAfEGmxe5HFlI15wHWlSfocWhIMvQ8+HTFf
         1YbWFHgCmmncEukuvJG3hf83kREZGs2Ib/iUoE0/2QuV3tym5JJao9lwovs4V4Z9qnW0
         mRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pOaKDEzkolnfW1iFoTFhg39KfgRv/xHfYlYUOxXTaoo=;
        b=UlP8HTyLirySapFK7lQeLIuzYcaxm1HeosCguqWvCF1Z3WNXYUaupDJjHpSYbeUW5t
         IXVKHfj8wvaxs/vt1YMbPI8FANok5iAHLp89ZCkrI31VSxTsBD5cyFtNfbhDmCPPN1Xe
         LG1iQrRvvPFOMaQ8w6xD8vOFvD1GaSlzZ2w+fZb5KwyUCCLQy/KSRZBrY2NP+fXEFbZ2
         vKb+/AveHp1Sl2GBAHtj9wo3d5PlfjO3HbMarx49rNDBMbiOzdp7XJy0oL9+dWwwIros
         TQV5JhKb04GlggK6Bh1HUTzHgD9fh81tVFIze1de+kIaAN8efBaJ9ErT16F7JDA1KUVT
         CKDQ==
X-Gm-Message-State: ACrzQf0wSxO4BQFxrVmipRdKE9ycl7NQyQ8zjNaPvkVy1dqFdSOUojao
	2QRjAm6DEG6b9amnKCwcS/AGN2q9vp7xVrLB/fARosTt
X-Google-Smtp-Source: AMsMyM4fRRWhQxfaDJOcvIq50QPu4AIUKDT2EKWBzNClJh4ZcaxtT8yTjKqoTZy7BKQzwUzWsSLBEMvv/M3JbDEVU2A=
X-Received: by 2002:a1f:de86:0:b0:3ab:c79:e3af with SMTP id
 v128-20020a1fde86000000b003ab0c79e3afmr5631428vkg.9.1665246002869; Sat, 08
 Oct 2022 09:20:02 -0700 (PDT)
MIME-Version: 1.0
From: Sivaprasad Subramaniyam <sivaprasadsubramaniyam@gmail.com>
Date: Sat, 8 Oct 2022 21:49:50 +0530
Message-ID: <CAHYfTohqs1AzbmfqEjrA5qdm5OGnb0ny+55M_xdSxOE5Qcj43g@mail.gmail.com>
Subject: Guidance to execute oem commands
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000076fa4205ea884c9c"
X-Mailman-Approved-At: Tue, 11 Oct 2022 13:11:26 +1100
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

--00000000000076fa4205ea884c9c
Content-Type: text/plain; charset="UTF-8"

Hi Sir,
I am new to openbmc.

I am trying to create separate .so file for oem commands.

I able to see .so file on /usr/lib/ipmi-provider also

But try to test using ipmitool then throwing invalid cmd.

Can you guide me to resolve this issue?
Let me know how ipmitool using phosphor-ipmi-host & intel-ipmi-oem?

Thanks,
Vss

--00000000000076fa4205ea884c9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Sir,<div dir=3D"auto">I am new to openbmc.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">I am trying to create separate .so =
file for oem commands.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I=
 able to see .so file on /usr/lib/ipmi-provider also</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">But try to test using ipmitool then throwing i=
nvalid cmd.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Can you guid=
e me to resolve this issue?</div><div dir=3D"auto">Let me know how ipmitool=
 using phosphor-ipmi-host &amp; intel-ipmi-oem?</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Vss</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><br></div></div>

--00000000000076fa4205ea884c9c--
