Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 994D71AE480
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 20:12:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493kh80vKGzDsGD
	for <lists+openbmc@lfdr.de>; Sat, 18 Apr 2020 04:12:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d36;
 helo=mail-io1-xd36.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=dWRYfTH3; dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493kgP5VwzzDqMy
 for <openbmc@lists.ozlabs.org>; Sat, 18 Apr 2020 04:11:26 +1000 (AEST)
Received: by mail-io1-xd36.google.com with SMTP id u11so3316040iow.4
 for <openbmc@lists.ozlabs.org>; Fri, 17 Apr 2020 11:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5HGxSMAYM0kehnpFQiunSeVu+2gt2qakXMmZC/8L/iU=;
 b=dWRYfTH3IE4OKjPYHoWRfSZiiLPdZPHSfme+1wyZWei+jPyLQZPchfYsjw958bzZZU
 mG4eOSpwigqoAqWXL9votrh/+0EBldUp9c1T9WzHq/xXoRiFSM3njXyC4B79EDffH0tp
 7vsMgwSb9ZfVlVT8IAvRL3tFfobVZ8b/F5elyRWDlcThEoR5mMqJCZqqJggSDVzcjNLT
 jW1p3fdLw+vMD7VDxrCRq6/0Iie7zNZ2z/NQKWYaEELxwxCOIpIliOcHo8fnZdQ/Gaba
 H5twCQD0zXpLM1mFnqK9RY2au2PUunvboqtP+RmVox2apHJCUOycJE01cKFIx5A/C9MO
 3N7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5HGxSMAYM0kehnpFQiunSeVu+2gt2qakXMmZC/8L/iU=;
 b=kPKLkhohjXN1yJpZD+NyIOhfQH27nrhx+uE+V0UulIq8z1daxspjFGBah5vMpclG52
 3C+ukTO0x96oHocHT1e+xwm/LZBoHWZnP5HEe6bd8I1JKTseK1xQqf3j5a0Qa+RDjN6i
 WJk+V8/+t5QcebpDTLfCK6MzCaZeR2EAZBDqZudADxkdLGKUQAVKoi++nUYPJieYeyAw
 STUvtXpFkohr8eWiQnBaGyV8X52wVyKHYVhdz6X65t09EBZ32Vt8Ghh4zPnMb/fXnbEH
 kQGTBFnDnzoq7gbp4Id4kDGhm3x1XfBhPGB2gI0Z4u9rVORTmUkbheFfoiVvw2waB2Vs
 apug==
X-Gm-Message-State: AGi0Puao/zzPOEuK/z5zX0EnSaEvTBHcYGyJ0ln+tFhTzrnB3ZvebmmL
 iFeStfJwNpAkN98chq4/mTYW+TxWUzsEcgy/pnKH3A==
X-Google-Smtp-Source: APiQypK2nRPG3OfnAXSrFUTwQCBPtImtzkbzQNmEypIad75Qdx2AU4aLLaP8lsVN+GSMFrq3hSwQq0qXakJOGVJAGFY=
X-Received: by 2002:a05:6602:15c4:: with SMTP id
 f4mr3546861iow.108.1587147082498; 
 Fri, 17 Apr 2020 11:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <0F332F74-FF51-4239-8B52-2EBA770AE6CC@fb.com>
 <8022481D-7C72-4A7B-AF9C-D144177B4C88@fb.com>
 <CH2PR21MB1510E11F9772C45D12EEA0F1C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <82E67AAA-1BD8-41D8-BE27-966F840236E2@fb.com>
 <CH2PR21MB1510AEF844D82AC9D897B902C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <4770a42d-d012-4e95-9347-d5c287c2e288@www.fastmail.com>
 <5CD00373-FD92-4E57-90C5-21FB8AD6DD25@fb.com>
 <CADKL2t5r0tCSOLiwovjiqvbV8_oCdJSSnGcekWZkGQb7JFDZBg@mail.gmail.com>
 <B555CC60-3770-454E-813B-5F00783E97C7@fb.com>
In-Reply-To: <B555CC60-3770-454E-813B-5F00783E97C7@fb.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Fri, 17 Apr 2020 11:10:46 -0700
Message-ID: <CADKL2t6zJU_rQ+di7FNjjSHq=xo5ig=-u_GBrR51C6DaLQJ0-w@mail.gmail.com>
Subject: Re: nvme sensors
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Neeraj Ladkani <neladk@microsoft.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 17 Apr 2020 at 11:05, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 4/16/20, 4:35 PM, "Benjamin Fair" <benjaminfair@google.com> w=
rote:
>
>     On Thu, 16 Apr 2020 at 16:15, Vijay Khemka <vijaykhemka@fb.com> wrote=
:
>     >
>     > Currently, dbus-sensors support reading NVME sensors via mctp only.=
 It uses
>     > libmctp and some of smbus patch from Intel. It also uses slave mque=
ue mctp
>     > kernel driver which is not upstream.
>     >
>     > So currently it is not matured and fully upstreamed.
>     >
>     > James, how can we use this without mctp. I don't see any non mctp s=
upport like
>     > Sending direct smbus command, please advise if I missed it.
>
>     If you want to use NVME-MI without MCTP, this use case is supported b=
y
>     phosphor-nvme. It makes direct SMBus calls.
>
> Ben, thanks I see that but it needs certain GPIOs like PwrGd, presence an=
d I am trying to find if
> Our platform support any such GPIOs.

If your platform doesn't have these GPIOs, we should be able to make
phosphor-nvme more flexible and not require them. It was designed for
one system at first with the expectation that it could become more
general over time.

>
>     >
>     > Regards
>     > -Vijay
>     >
>     >
>
>
