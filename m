Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 115969FD062
	for <lists+openbmc@lfdr.de>; Fri, 27 Dec 2024 06:10:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YKD8D5nQBz3by8
	for <lists+openbmc@lfdr.de>; Fri, 27 Dec 2024 16:10:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735276201;
	cv=none; b=i8yO6WqzF2uqzYJvnTOQXdiuc4KAtr6FgXW0uPFdaY9XzcMo0vTJT15lG2peENU1UQ3JldFnuAOyvq1RF03SubSZN+zFoJMICx09XYjAU0IMctjEWVtfC4PNZjn3GfY8wRcAkJKHOil+Tf0bPvJ8HWx5YjVaOX52zic6RDFtbkGygsj4ycgmB1sTVcVT8uw+ZOJqcU2ARL75DdYKyDUTFXd2123pJV9LOZubBVW5x+09OQ+v8mq9N9dy6kx8wXxpnoyifv0VAHpBThSYGBNjx/8/+IGks4+WcsFkFuAczqAVZZxvzZEJLcQopPiuceF1+vsHzn1ffCZb1Db4ADc3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735276201; c=relaxed/relaxed;
	bh=jkA6lA8RReLTwKfbsn0vhV1ONgCxkz1Sn0d6TO7kAbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GeVwKgynat3BoX0enAPoUS1yzoe17ojiVbqptrNrKW0Lo+/0itaaVIgMvoLsr3a3eLpG0mMfziUd0hcpN40ELC5P/we5XGLgEWpZ5gJdP4nd2Qcv+ZQeVADVdIPLZJ25IDHmbrBHzZYvTx078Fou3h2lQ/SSk3uuR0oKvUMcmdz0NqqxPmcFLJUB5c0oh7KRenChrkgCkmsC9PD0P2PLJtYkPIqLXJkxHTOlTXlzcOQESmPJLL8E18Qa4M6O7FG1XkyHo5ac8WIOnTYPxsgxKcxE/JhHOGDZ/nhbMojjmIW0NJbv1VKz+FWQZ4HJXt2E5h0/bGb6N1YCEFqc3CJPFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OB5Z13bh; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OB5Z13bh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YKD871ph6z2xQC
	for <openbmc@lists.ozlabs.org>; Fri, 27 Dec 2024 16:09:57 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aaec111762bso827112466b.2
        for <openbmc@lists.ozlabs.org>; Thu, 26 Dec 2024 21:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735276191; x=1735880991; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkA6lA8RReLTwKfbsn0vhV1ONgCxkz1Sn0d6TO7kAbs=;
        b=OB5Z13bh1SBovybJ9gmeH0XfqnwRKnS9doQXSSsKmDjIjdQkQiYOAtn3yP0iNNK9r0
         LGhyEP2yYyWlKw37kekSZXe2QimKt3XvLurzBeGP41BGuyJ3IXyAh+zblDLiKr8mckTC
         fkXz+bhhVFgwQmDhpb8o/qZj4SiQLXRCK/FbRQsOiQNq753zq167J/NUoA77bvx/Ppuu
         6lewFwMVFWfcd0hCR/JwvpHHGodcp2FKQfOEf98tqdBS+JdPPsqQKU0UU3Z5DG8BHZoR
         CzgWB3K6HhVxAzXR96eLoYXyTcxYubbqSn/cwzetNMxV+ld709JB2TBl+Nlpki5DWrhv
         k0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735276191; x=1735880991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jkA6lA8RReLTwKfbsn0vhV1ONgCxkz1Sn0d6TO7kAbs=;
        b=e20TrSwW8YF2snqWFbq+xtzdlz1yGiZ2bRFbOkgV01x/YF9lRQMiuuA8Om13XTBVtC
         91HJJZL/3htSdVCOsKM7fkWnzLlTrJxyN5ToUibRmQRX97s64yBFdJNXTF9bAQmXZMAG
         CkCh6u9JUBVXa+TfjYOdI+ip4oQGvnh/ciSCLUQ5zTM9ypxFHk4AaKhe43+zcCsPWsTf
         oxCNF+S6uCQ/wC24gY5pucYVB84FMfFEaA79bj7+Azrgk43OPATIUIrqfmRbqCuhJO8/
         MqalLwl+rgwc+ZleAKZ7P25yFgltz6QfcBl8DgFTT4/UTp+vYaUToUftCA2AzGdx1tHf
         FKIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWQA8du7WzLmRHjUW4ix/elOo7G6b2Z6C5ZoW/NiJ+Fz8CF0A3D1LUcluHwFKbRoUh8aXLnrQF@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyrEVzzqyXavTWznknQWp1LZG9qQPZznNgQgVpdY3Wd1Z8vEn1n
	KUDirQxqQf/BHoSESuTDiqgw3tMEIDgBw81JF84S4goVfKi4hLir2ebveVewQijSvg2ngeEsfDC
	fYzlbvlHcFPUSWZgwWdx0DHAOFA==
X-Gm-Gg: ASbGnctxbkcGLZ8C5mLpkq1WaIKGuqrDIU2kwErks5kIrXGkv0KQXieXWmoZN6vkW7H
	q8RXQhkgk/MvzE+VdB1x5xoDm378hJY2C7lAePREgxgejDmyb7psID7eBqpk7INqsU34JNA==
X-Google-Smtp-Source: AGHT+IEds2dZaHEPeu/D6ebVHi4huNz1VbBxEqE4a5w9T8VrokPShR30889qGxR9zDyTpipR+RaXcVthIWLNtZjlceY=
X-Received: by 2002:a17:907:2ce6:b0:aae:c9bf:41b3 with SMTP id
 a640c23a62f3a-aaec9bf461emr1262225466b.37.1735276190748; Thu, 26 Dec 2024
 21:09:50 -0800 (PST)
MIME-Version: 1.0
References: <20241219090859.18722-1-kfting@nuvoton.com> <kixnc5uo5yryn5zszx3khqx77cfieeq6fnamebrw2sne3kxnwd@4cc3zfajrpo6>
In-Reply-To: <kixnc5uo5yryn5zszx3khqx77cfieeq6fnamebrw2sne3kxnwd@4cc3zfajrpo6>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 27 Dec 2024 13:09:39 +0800
Message-ID: <CACD3sJYDbxoZtV2-mjU15sPWyWnwifEDsUKfBZ9bTF8AWhgnTA@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] i2c: npcm: read/write operation, checkpatch
To: Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andi:

Thanks for the help and guidance from you and other reviewers alone the way=
.

Thank you again.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=888:52=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> > Charles Boyer (1):
> >   i2c: npcm: Enable slave in eob interrupt
> >
> > Tyrone Ting (3):
> >   i2c: npcm: Modify timeout evaluation mechanism
> >   i2c: npcm: Assign client address earlier for `i2c_recover_bus()`
> >   i2c: npcm: use i2c frequency table
>
> merged to i2c/i2c-host.
>
> Thanks,
> Andi

Thank you.

Regards,
Tyrone
