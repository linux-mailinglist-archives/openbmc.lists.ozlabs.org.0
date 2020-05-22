Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E236E1DDC3D
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 02:37:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Sncl5K1rzDqHK
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 10:37:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c42;
 helo=mail-oo1-xc42.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=d2d5pHqW; dkim-atps=neutral
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Snbt723czDqs1
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 10:36:26 +1000 (AEST)
Received: by mail-oo1-xc42.google.com with SMTP id i9so1839218ool.5
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 17:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=xSRCZVVcT4MoyU/XsxYFuPWbzEvu20RDcPiObyWJMSI=;
 b=d2d5pHqWasTt4Yuf9b193SRomUsX/4uVRcPv9Fgszgf8vjJOSnWGUYyXzGDTxpPam9
 PkXoUWEwRWr2+2JOgmHYUiRunOTwCukNsfNYoFrrMEXRjzMc3lL5z8yyMJHW89plGh5N
 q4iUpNiqNAb+5pfI/K4wNBdEIr9l5t88APaOJuBGa6oM+0kp9cvSJC45USEq6X156dWu
 cRxqf6dupAAKQrb5Se7OjxHXBf4/tqX1acfrBROfeeVxgMHHbHwhYG7lMPCxkkzS/ZFP
 dlVw3SlYq+Otl+skUGj2vf2/LK4/z1LZXIQNmMR8m4l6p9T4HjdCX7HEl6+N7AGmQZ48
 RRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=xSRCZVVcT4MoyU/XsxYFuPWbzEvu20RDcPiObyWJMSI=;
 b=aOMgXaLJvsxpDCzXVmZ0VSZhfg/MFnlQBIZPtIbD79OelbjM6xlP7bu0HVLjYdC0Tz
 GEXVhEC1Zkdr/KP1JGuRd6QilssLgZP44Uodwx4Q2079whnVBkFgOcOLmocg/6KEk/Kh
 Sz4QBOlw9ZhpHbhTFtMIR3Xygld3WApKQC2UA2fwz3Kn6adgi6sLsKkfXe7JJTVrrsXE
 OdjLAkoGQsdQ2xiewK2CCfx+UsFQUZsQqlQevy24dVszIHQEJqjxJuZSn9kOp1CjyVNk
 +4XrTJ9hk+n/fTPlN6WLL1nz+ur/fagqFsSVrKCDhzJO02b7HYOV9XFg3ppI8kAuhFQ0
 NpqQ==
X-Gm-Message-State: AOAM532n2SgcZCaBMjg8f91mNMSsfA9u62NlW5vxl7wZtpLAphOPaDBQ
 +vgBenb5BzeWCXCE9lVOqMfJ7fkEmEw=
X-Google-Smtp-Source: ABdhPJyhc7kVsd7PamO1kWzPYODrdSIVucNNkuyOWSvDaVtGFKulmGQ8eEN47A6ue3ZVEWiikI59IA==
X-Received: by 2002:a4a:d043:: with SMTP id x3mr1062623oor.17.1590107783334;
 Thu, 21 May 2020 17:36:23 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:3d6c:fa93:bfa1:70e4])
 by smtp.gmail.com with ESMTPSA id f5sm1719916oig.32.2020.05.21.17.36.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 May 2020 17:36:22 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Upstream Yocto Bringing in GCC 10
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <20200518000811.GI1166713@heinlein>
Date: Thu, 21 May 2020 19:36:22 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <2E02F120-7D24-48BE-AFD8-9A7ADD0F08E5@gmail.com>
References: <9871E71B-5B1F-4172-9F41-454F8C1F644D@gmail.com>
 <20200518000811.GI1166713@heinlein>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On May 17, 2020, at 7:08 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Sun, May 17, 2020 at 12:19:39PM -0500, Andrew Geissler wrote:
>> Ready or not, this weeks upstream update brought in GCC 10 (along =
with the normal slew of new packages).
>=20
> Alright!  The great thing about GCC 10.x is that it brings in support
> for most of C++20, including co-routines.  Looking forward to playing
> around with it.

It took a few more patches but GCC 10 is now in openbmc master.
Our unit test CI framework has also been updated to run with GCC 10.

We also migrated from clang-8 to clang-10 in CI so you may want
to take a look at a recommended clang format update in this commit:
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32696=20

You may see some new CI fails with your existing code. It could be
the clang format noted above or some code that is not exercised
as a part of our normal machine builds. If you hit an issue, it=E2=80=99s
probably been fixed somewhere in our code base already so
browse over this commit list for your issue:
=
https://gerrit.openbmc-project.xyz/q/topic:%22upstream%22+(status:open%20O=
R%20status:merged)=20

There were a lot of include related issues where you just need
to include the needed header files.

Andrew

>=20
> --=20
> Patrick Williams

