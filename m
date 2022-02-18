Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FDC4BBD24
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 17:15:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0cGp4ZFtz3cRg
	for <lists+openbmc@lfdr.de>; Sat, 19 Feb 2022 03:14:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hYYpMUUx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c31;
 helo=mail-oo1-xc31.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hYYpMUUx; dkim-atps=neutral
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0cGP4yK7z3bT5
 for <openbmc@lists.ozlabs.org>; Sat, 19 Feb 2022 03:14:37 +1100 (AEDT)
Received: by mail-oo1-xc31.google.com with SMTP id
 e19-20020a4ab993000000b0031a98fe3a9dso4047238oop.6
 for <openbmc@lists.ozlabs.org>; Fri, 18 Feb 2022 08:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=26syt6HH8kByy09+7A6wZwBSfFFGH6TD0TcsakW00q0=;
 b=hYYpMUUx2I5NmdkU4tYMnHdP+B8fez1eB2iSHQITk2P0d3htPExT9+TzkqTvEsd21O
 5KrLNs6oyDAzdMqhQVPy88xWG4OgILukJHmXPB8X/2WwoZ5x/YY2Nlv3Sxzi3dazlkr4
 wNvR0UtbPiQLaCoJIzQhMOKTD2YVvKsq/Qzq0CEkZq0SjgwoH4CSIZ7NzvNCZdoKc2qF
 AmRwjYi6Tx7whBMAl772yhSW+rTwBBRrWncgmrUH/lniWHVLUKoUnpU75n9SW9+mGOt3
 iz857ifoClF2ToL2wK6csjZnLWMJpMca79HNZXawQZk1H7VTqMUDUfEI0PcYJKE2TJSO
 HrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=26syt6HH8kByy09+7A6wZwBSfFFGH6TD0TcsakW00q0=;
 b=yV/88x+p0EtBo0+dNTXPVt84NFGnA5/Fg4tRoxfeEW38knAeFljUuX+a5G19FDzgKO
 T/MKpiAFwi33o38hSkcwX8eloigg+otVUFN4dddPYbf9I1Lqhc69SH+adQ/miABruiut
 Q5zgSWMYK88HvZJGw04psvwj1kPGpWAIJBpiPjKmhh6B5HF4YyXuJFdirK0/YJxJzuBe
 GXUr7dF89zHHrWNMR3q0KGpog/flatHxcYWm0dtEPV5gv6FSpwzSVtIOvUhW55dkSzOI
 JjVPD5a13j80vfr0bz6g9EQ6s2ZB1M27kcolfgtE/Ls8JAI61dyyNzT6Uest7epA/YOl
 s/rg==
X-Gm-Message-State: AOAM530xH2giiTGAkwQ4DhIu7m6CBF3fuj6nVGFa4f8j8JVLnR1Dp+h8
 Ugo5xDmSAik9koJHfWY40hsfrjtGAWqSFw==
X-Google-Smtp-Source: ABdhPJzI1o5SZmZsfNm9VKcE4PVzNXwWbR+I3p1I2p6ctavEt0oqlKyVeW1PL20kRfnrDVGZf/W7cQ==
X-Received: by 2002:a05:6870:3b17:b0:d2:c539:d045 with SMTP id
 gh23-20020a0568703b1700b000d2c539d045mr3070958oab.235.1645200875526; 
 Fri, 18 Feb 2022 08:14:35 -0800 (PST)
Received: from smtpclient.apple ([2600:1700:19e0:3310:9897:e47:cce9:6ba8])
 by smtp.gmail.com with ESMTPSA id u32sm2334905oiw.28.2022.02.18.08.14.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Feb 2022 08:14:34 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Check on bypass phosphor-discover-system-state@.service if BMC
 not boot from A/C
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <f5183918-e83d-0ba3-397f-bdddccebb8d7@amperemail.onmicrosoft.com>
Date: Fri, 18 Feb 2022 10:14:33 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <800B86CE-ABA2-4867-AC6C-8B0D1F3A48FE@gmail.com>
References: <f5183918-e83d-0ba3-397f-bdddccebb8d7@amperemail.onmicrosoft.com>
To: Thang Nguyen OS <thang@amperemail.onmicrosoft.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Feb 18, 2022, at 1:36 AM, Thang Nguyen OS =
<thang@amperemail.onmicrosoft.com> wrote:
< snip>
> # busctl get-property xyz.openbmc_project.State.BMC =
/xyz/openbmc_project/state/bmc0 xyz.openbmc_project.State.BMC =
LastRebootCause
>=20
> s "xyz.openbmc_project.State.BMC.RebootCause.POR"
>=20
> I would like to check if you have any idea on how to use the above =
information to prevent the power restore policy executed in case of BMC =
reboot.
>=20
Sounds a lot like what I=E2=80=99m doing in =
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-state-manager/+/5070=
6. IBM has a requirement to not
start power restore policy when the system is reset due to a pinhole =
reset. I imagine you could just add a check like mine for yours as well.

>=20
>=20
> Thanks,
>=20
> Thang Q. Nguyen=20
>=20

