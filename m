Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB9F2EC7E4
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 03:03:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DB8fG3MGPzDqlZ
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 13:03:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=brandonkim@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=KVX45KiG; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DB8dR2gZczDqbr
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2021 13:02:47 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id d189so5686145oig.11
 for <openbmc@lists.ozlabs.org>; Wed, 06 Jan 2021 18:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5soZ2oQBAC39UIU80KC1IT2VsE5AtkzvpgFvP9nSwJg=;
 b=KVX45KiGGYblRfQZdQf/q7K3FWAcHatdDzcJLbQgaENbMdlZww6HGvxtubOgOpctyM
 oD4OL4jl/pGWr5bvG7Q3VkfvSCI4ma4dIGxz1BWiAMWDlu4Zba/FlmuI4uO9PvmvrABy
 AFXwDGBGtXeMmyliRzyzdkDcDIV+Q+Mp1JTJsATUXvVFiRdbYHwmFPEGL8lygnWwOVHZ
 4wtDILXkwDmCg24vCamezNS4OUS8dFZisR0Y4r8dnA6XrCt2pt+pQZNIcgtb1oo80uLO
 hkv+BhjN/P/KyOPnCJRgU0FtfPtcnx5j/ce1dCYgTP6FVYlvy+KYKm2Xoh53ZgDev79C
 nXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5soZ2oQBAC39UIU80KC1IT2VsE5AtkzvpgFvP9nSwJg=;
 b=E24V08KTFSnLKJi4PkWJK/WTQ4Qf3Y6sz9iKgE7EcLIBe/1m3b0GwuNTjzxDqF9bCY
 5nqWddw/L7P4438kWUJx6alt0eOVRA6c5kH4n6xv9s5LkPztGJS5AJh6/QsJe+y54NIA
 pLbDO8nfBjJpLTYlwlxqUjZsF9qVqIVI/K5CAtRj8hzncaXEXQwVuyujKkWeCpF3Hv6t
 Nta6FJR2jSxQ09GkxUD66srdvn9jG5URKBG1RLkBZU9RE7+lS6hm29nXOJKTrtVhtWXS
 i4ncfCLZwj5ChSIicswDQWfmN/dhL9gn227PbJc8GBnkFb/fJtvWhFmeilirtM3jK1A3
 VNZg==
X-Gm-Message-State: AOAM531ZYTGhc6pvQ6/FWCGxiPJma+IGP2zUmgQu7vNpTKSFiVO5xU9Z
 R6Jt249sZbAenL4xNrp0OCdLzfybCnZwvo0bX6YXNyFJvQs=
X-Google-Smtp-Source: ABdhPJzbx9wNSaM5EzHFrVP3STcYyKz6SV77KIJ/GQk4BkjQUWEFHJ1jLRbr97lAcm/T0zpYyC6b7rwu3GZ5zxCrxbQ=
X-Received: by 2002:aca:1a09:: with SMTP id a9mr7648oia.12.1609984963709; Wed,
 06 Jan 2021 18:02:43 -0800 (PST)
MIME-Version: 1.0
From: Brandon Kim <brandonkim@google.com>
Date: Wed, 6 Jan 2021 18:02:32 -0800
Message-ID: <CALGRKGOb2jRTgVxpiH_36W6c5ft5faXPkATaXApXdNiQqd0knQ@mail.gmail.com>
Subject: Error Reporting and Decoding from Intel-based CPU (PECI daemon)
To: "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000db5d2d05b845d597"
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

--000000000000db5d2d05b845d597
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

I was wondering if there were any ongoing efforts for a daemon using PECI
for error reporting and decoding from the host CPU to the BMC (possibly
from Intel?).

I see openbmc/peci-pcie which seems to be only for using PECI for PCIe
devices.

Any pointers / updates would be greatly appreciated!

Thanks,
Brandon

--000000000000db5d2d05b845d597
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div>I was wondering if there w=
ere any ongoing efforts for a daemon using PECI for error reporting and dec=
oding from the host CPU to the BMC (possibly from Intel?).</div><div><br></=
div><div>I see openbmc/peci-pcie which seems to be only for using PECI for =
PCIe devices.</div><div><br></div><div>Any pointers / updates would be grea=
tly appreciated!</div><div><br></div><div>Thanks,</div><div>Brandon</div></=
div>

--000000000000db5d2d05b845d597--
