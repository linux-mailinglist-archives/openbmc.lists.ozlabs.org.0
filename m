Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E51EC19DB4F
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 18:19:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v4s31mbKzF0Vv
	for <lists+openbmc@lfdr.de>; Sat,  4 Apr 2020 03:19:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DdFDFz2q; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v4rG0LY3zDrhk;
 Sat,  4 Apr 2020 03:19:07 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id l22so6526435oii.12;
 Fri, 03 Apr 2020 09:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=vfUcEFpIecfa5phk+Cj5BK1agH676+gFMqNkyPySnNU=;
 b=DdFDFz2q+lRpwrK421yRNEfez1sLOWU8raR7jvvY4t65RJ615jwCRUugHdjp3QECXD
 9DA4Q0scR3LkOWuReNJy0sSDlq9CWoI18F15XqJHgA70pA1+vTdRwywrhjpQRrvnTi0W
 IsQZLbSGEOkB3r/mu/JNCjQJwqxdRjSP3UmWlPvEsjpKiZNL4QZVA/QzaCYZlzKMoqQj
 4/O4fPQ/pFvR9y6uWk5Fj92HR/5uCnjXe1t/LJkam4NgoHlgStWB5nFZNvr1zb3oBQHD
 3GMW3cwIyHjpFgV3PIVkl2+JjMM+p0s5BnOQtUVxsUYiruJU44hwkraKGaiurzcYL47T
 ljsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=vfUcEFpIecfa5phk+Cj5BK1agH676+gFMqNkyPySnNU=;
 b=FxJ75lizRjfCIBhmkbmfm0ua3CkmEgeLRNNw4znZ12huaVaQauuguGZNfIePAn38fY
 2rfbdA4XBawyEpdWMXgM5dP9FSMmRJCI+UGeDr/ljTVj24rNY7lJq3xVpUlJo19G+QcG
 HnzdudBYPhkOAAwaIJ4qbK0E/kJF+uUDNYVXmrtky4P2fHObUwhxcVyF7Z+4QIC/Is30
 eT14B4U3J4rrxyO1Zwrv5irSfhEHtAjTp5W02/ZwQ8Dz11en+uM6gZsJgwt5t1M6Ox47
 cc31F+Je1/gDxIByVv9LhzlP4aLFSneN9NoRpPkb1Ge+1jAWT41AczhJYgxOPdKZylDa
 ruqQ==
X-Gm-Message-State: AGi0PuZ3MplEkUyIZy15Zja9qPgvDUPONsvk1rpwL6yXKQfOn4iYVDlD
 sw18pjV1UdDFnxLVSVlviUFKBUQu2cHRFw==
X-Google-Smtp-Source: APiQypLdIe/bnR5Sgh9v1UByIaBo9hKSJA7hdJa7okRoa7dJKQmZWyXte4DCMLxfGDR33+o59+3cYw==
X-Received: by 2002:aca:acc2:: with SMTP id v185mr3748001oie.27.1585930744166; 
 Fri, 03 Apr 2020 09:19:04 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:4ee:b6ec:777a:fdfb])
 by smtp.gmail.com with ESMTPSA id i17sm2193668otc.16.2020.04.03.09.19.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Apr 2020 09:19:03 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: zaius: Add gpio line names
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <48c9bd0e-3b5c-4f76-830f-4b0bd962148b@www.fastmail.com>
Date: Fri, 3 Apr 2020 11:19:02 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <270714A1-2910-4B84-86B6-46177F439A52@gmail.com>
References: <20200306170218.79698-1-geissonator@yahoo.com>
 <20200306170218.79698-2-geissonator@yahoo.com>
 <294a52cd-2f60-41e5-a58f-a74151a83b08@www.fastmail.com>
 <9360D2B2-8242-4BA1-BF06-8916E87EDE67@gmail.com>
 <48c9bd0e-3b5c-4f76-830f-4b0bd962148b@www.fastmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Apr 2, 2020, at 7:51 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
>=20
>=20
> On Tue, 31 Mar 2020, at 04:46, Andrew Geissler wrote:
>>=20
>>=20
>>> On Mar 26, 2020, at 6:20 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>>>=20
>>>=20
>>>=20
>>> On Sat, 7 Mar 2020, at 03:32, Andrew Geissler wrote:
>>>> Name the GPIOs to help userspace work with them. The names describe =
the
>>>> functionality the lines provide, not the net or ball name. This =
makes it
>>>> easier to share userspace code across different systems and makes =
the
>>>> use of the lines more obvious.
>>>>=20
>>>> Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
>>>=20
>>> So we're creating a bit of an ad-hoc ABI here between the DT and =
userspace.
>>>=20
>>> Where are we documenting it?
>>=20
>> Yeah, so far it=E2=80=99s basically design by precedent. If you want =
your OpenBMC
>> function to work then follow the standards we're setting in other =
dts=E2=80=99s.
>>=20
>> Is there a good place to document this? I could create a OpenBMC =
design
>> doc but that would not address non-OpenBMC areas.
>=20
> Don't let perfect be the enemy of good enough :) Lets document it in =
OpenBMC
> and then look at alternatives if we find it's necessary. I don't think =
we will given
> that the contract is between the kernel and OpenBMC userspace.

Ok, I put a doc up for review here:
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/30988

>=20
> Andrew

