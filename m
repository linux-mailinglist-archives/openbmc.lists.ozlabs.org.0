Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F0072D872
	for <lists+openbmc@lfdr.de>; Tue, 13 Jun 2023 06:22:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fNlOANzP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgFlB1GpGz307y
	for <lists+openbmc@lfdr.de>; Tue, 13 Jun 2023 14:22:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=preetieljoseph@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fNlOANzP;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qdl9x680Tz3dwy
	for <openbmc@lists.ozlabs.org>; Sun, 11 Jun 2023 03:21:57 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2564dc37c3eso1450003a91.0
        for <openbmc@lists.ozlabs.org>; Sat, 10 Jun 2023 10:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686417715; x=1689009715;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KBsvq6sb8OdRHTVprkSiDnlFXG2C9+Zyk6F1TGVNipU=;
        b=fNlOANzPBLJeREnAyCHrjSQQkbrskhPS8mC+NrsOFMOz85wTUdOij+cpsItHleuXsn
         SQPG/0SW+pwHFO4YS1ZnT/TLOR2RnBherWNHlpY2mWk/o2AVWqJiXt0pztdpWT2NrPVI
         2GpYm5wj83dXCj/sXsgIiTGEc9uN5Y9+/QMzAOHRxTG3VqKIe1oWeCaiNDfe1Jqp1LKF
         9+hSwV/WjoZj56SEiwmWnS2sFQYnU1iN7CncR3zhZlxju4VTV6KUdflp2U9AsFSr7xuo
         FGI2FyS3qsr87xjoSeSJ9b4dwLyptZ0q2OrG7obyzMzJo4t7YBfSVEr3xKI4uCbXKgad
         gtfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686417715; x=1689009715;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KBsvq6sb8OdRHTVprkSiDnlFXG2C9+Zyk6F1TGVNipU=;
        b=ifxJrrhwTmuBAho35kXXib5XA5617GvJm3n3+WkaXGeIi2TUkWhnpn2ZvZyHsFd2Wp
         7ghNGiSPDyDp9b/SkVtyRLXz0f/zjaalEC9kANCSs8iHgAma9rR4dhrm/4kAJy9WJH2i
         O81hfjuWRi56cmcj7nHZ0SDOERKFV26TWIkE+zUS/7V8nOlf6oapdy1YKyBp3C8ISs/X
         lw2VoGEcQJhVl3Cuu5YSEmwPTno7CxaxNFE+zMm2cVePKmDPSxjmRvA8DZbmwxCZyGgM
         iXYV0paEGEJuXa7ZJcEInWQUppXjA0bzf9tfCfvvaQZWtnEZNoWlEEWpMxzyh5dGmRHW
         bMIA==
X-Gm-Message-State: AC+VfDwe2RqYeimt4SHMYGbvcTXW0VGm49DS1j0R7LNNY89CQxOsCKZ8
	vHuxPjFjm3eFg/USSEhSF/DQx2qo4OXakRIYC+KMBa4coxI=
X-Google-Smtp-Source: ACHHUZ7kl0VRmcFRniFbU/v1bKiTgXxZOPVu4PQL8TbsrtI/golssr7L26UTZdROi5AxslTCKezu7f+h7bUwhpAGt3Y=
X-Received: by 2002:a17:90a:194:b0:253:2816:2a12 with SMTP id
 20-20020a17090a019400b0025328162a12mr6065385pjc.14.1686417714653; Sat, 10 Jun
 2023 10:21:54 -0700 (PDT)
MIME-Version: 1.0
From: preeti joseph <preetieljoseph@gmail.com>
Date: Sat, 10 Jun 2023 22:51:43 +0530
Message-ID: <CAEmKmDLhj0TQy55NMTJiHxhp1CU7rPLv1c7=Q5TNLeUsvpzEiA@mail.gmail.com>
Subject: Getting error: could not open device at /dev/ipmi0
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000d3307d05fdc9b804"
X-Mailman-Approved-At: Tue, 13 Jun 2023 14:20:08 +1000
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

--000000000000d3307d05fdc9b804
Content-Type: text/plain; charset="UTF-8"

Hello,

I am booting Open BMC on Intel's DDR5 server motherboard Eaglelake with
Saphire Rapid processor.
Selected target hardware as evb_ast2600 using command . setup evb_ast2600.
Build command used is "bitbake obmc_phosphor_image"

Though Open BMC is booting to shell on this platform, I am unable to use
IPMI tools. This is the error I am getting: "could not open device at
/dev/ipmi0 or /dev/ipmi/0 or /dev/ipmidev/0". Also, in the BIOS setup menu,
BMC interface is not detected.
If I boot the default Intel Open BMC that came along with the board, I am
able to access the IPMI device.

Please advise if it could be any configuration issue.

Thank you,
Preeti Joseph

--000000000000d3307d05fdc9b804
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I am booting Open BMC on Intel&#=
39;s DDR5 server motherboard Eaglelake with Saphire=C2=A0Rapid processor.=
=C2=A0</div><div>Selected target hardware=C2=A0as evb_ast2600 using command=
 . setup evb_ast2600.</div><div>Build command used is &quot;bitbake obmc_ph=
osphor_image&quot;</div><div><br></div><div>Though Open BMC is booting to s=
hell on this platform, I am unable to use IPMI tools. This is the error I a=
m getting: &quot;could not open device at /dev/ipmi0 or /dev/ipmi/0 or /dev=
/ipmidev/0&quot;. Also, in the BIOS setup menu, BMC interface is not detect=
ed.</div><div>If I boot the default Intel Open BMC that came along with the=
 board, I am able to access the IPMI device.</div><div><br></div><div>Pleas=
e advise if it could be any configuration issue.</div><div><br></div><div>T=
hank you,</div><div>Preeti Joseph</div><div><br></div></div>

--000000000000d3307d05fdc9b804--
