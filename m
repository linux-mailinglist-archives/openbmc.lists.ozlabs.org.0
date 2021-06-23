Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A533B1D13
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 17:03:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G962g5Mp8z308V
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 01:03:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mNYhNH2s;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=parishrutb@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mNYhNH2s; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G962N2Rp1z2xZZ
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 01:02:51 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 m15-20020a17090a5a4fb029016f385ffad0so1581893pji.0
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 08:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Ew1tWlEOk7EJ/CsBUwPJyJyj2u6p1PJCJprglyAgg8k=;
 b=mNYhNH2sgoD91t3abCDDCzDMAAmRiRi24N0z+N0LunRsi5bYGnvxWGENkPkiETfMwT
 08pY2pwTE6I/Con4JnxZ6vschqM+0jZZDKSp/e40/UintfPAvWQVDdxovTn/At/GYmHt
 p5mGXvBsNu3OtA2tVtfOYjM51FXmjQHvvNU7Ckb0NjA5aEWWopNe0fAbd0cfcx0Q7UUM
 +GWfGDAbKKBlLazA1r0a6LbaHPqe3kKdc/Qgvg0aNXGWosN5vRCG7YzQWs/9oAPdRGh7
 jvhpWFzRfWRwDihv02HYXRPFOdaTk1caaiboRrc5z3dtstyGzdfuuJfgMHiVigzhdX7N
 CSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Ew1tWlEOk7EJ/CsBUwPJyJyj2u6p1PJCJprglyAgg8k=;
 b=Dgyen4vlHAlvapbgwQln/zrqzsR5BxnjJ43vTKxo23p3rZHTWbq+kFwqGIHNxotuVE
 FsZ4D5TwZtewI0K8rO6493AMlf38nCarImpx2Ys4JYrIG2FtIhHoYPBtJMHBEqjtLHA9
 9Qyp5Ln+loNRSV38RIOTZ7i6BLRzZ59g+GFChB8fg7/DOfqhkFprZFTzW3ukoabF/8X+
 iugmKf+t4GDuVsxnilyhlWQkq3iL+Zn3IMZ6RGReKjnLA+KB42Vrh0IlRUfco4/npq0u
 XngdL2E9bRsVrzs8NXczmvooue9CxK9V0np8mMeVmmI/OjnysQULFepEu8JeYjaWe/3w
 4clA==
X-Gm-Message-State: AOAM5338zYtfOlZM26syyVEiPbtLL8w0QtxqoJbCKAlakVfUSY7cpEGc
 2xvwJ4QPrONYKkt4xlL7Mcv7HhLkYoDx/D6add075N8Zy5Q=
X-Google-Smtp-Source: ABdhPJxtSZQadWV9QpgsFGNfiUO9X/6w2uzYNH8Qx6i+CoSAMTRcAwArP6yT1ZbK8GaFZYNwdm8xSoevk54jyYyx74Q=
X-Received: by 2002:a17:90a:c08e:: with SMTP id
 o14mr5590042pjs.159.1624460566898; 
 Wed, 23 Jun 2021 08:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <CA+FKyEWij7a8=zLY_3c5FPPDmsucaePSebzSFZ1oo3ZHF8MKcw@mail.gmail.com>
In-Reply-To: <CA+FKyEWij7a8=zLY_3c5FPPDmsucaePSebzSFZ1oo3ZHF8MKcw@mail.gmail.com>
From: Parishrut Bhatia <parishrutb@gmail.com>
Date: Wed, 23 Jun 2021 20:32:35 +0530
Message-ID: <CA+FKyEWvcQ=e-P2QifEEutj=Z1u77RDJp8pUEE0aMXgUXbvWxw@mail.gmail.com>
Subject: Requesting feedback on in-progress GUI designs (Event logs,
 Hidden logs)
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000000ab18205c5703396"
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

--0000000000000ab18205c5703396
Content-Type: text/plain; charset="UTF-8"

Hello,

Requesting feedback on the current iteration of new PCIe Hardware Topology
screens in the WebUI:
https://github.com/openbmc/webui-vue/issues/66

Thanks in advance
*Parishrut Bhatia*
User Experience Designer | IBM iX, Bangalore

--0000000000000ab18205c5703396
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div class=3D"gmail_quote"><div dir=3D"ltr"><div><br=
></div><div>Requesting feedback on the current iteration of new PCIe Hardwa=
re Topology screens in the WebUI:</div><div><a href=3D"https://github.com/o=
penbmc/webui-vue/issues/66">https://github.com/openbmc/webui-vue/issues/66<=
/a></div><div><br></div><div dir=3D"ltr">Thanks in advance<br></div><font c=
olor=3D"#888888"></font><div><div dir=3D"ltr" data-smartmail=3D"gmail_signa=
ture"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><di=
v dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"background-c=
olor:rgb(255,255,255)"><font style=3D"font-size:12.72px" face=3D"tahoma, sa=
ns-serif"><b>Parishrut Bhatia</b></font></span><div style=3D"font-size:12.7=
2px"><span style=3D"color:rgb(102,102,102)"><span style=3D"background-color=
:rgb(255,255,255)"><span style=3D"font-family:tahoma,sans-serif;font-size:s=
mall">User Experience Designer | IBM iX, Bangalore</span></span></span></di=
v><br><div style=3D"font-size:12.72px"><br><br></div></div></div></div></di=
v></div></div></div></div></div></div></div></div>
</div></div>

--0000000000000ab18205c5703396--
