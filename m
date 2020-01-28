Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F8E14C064
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 19:53:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486bNr5xJMzDqMg
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 05:53:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=bVKQ8dau; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486bN44md9zDqLj
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jan 2020 05:52:44 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id dw13so1461725pjb.4
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 10:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=cEDbcV49yFhoYu/n5CXy+IM0ZWGeriQ4zpDcDitGvJg=;
 b=bVKQ8dau2gUX9dh8CUuf2+5ES7qjmKxgMCOsSVXLhLpPi3TAkMiBgRJEfgLUROs9v1
 Ry753FFBAERsAGFQKgoSgk5xmHTunflT1mMXNqFgMe6F0P/Sqk4qxxbHeu4bsKBYnCLd
 vLNF99YtKme3GEJ6XLfuJdy4XjNkH32dnGA1rDXYzWyRjSzy2tXH2to36MRTnkdMMTDz
 cYC7SlE1Xr8nQXcpzWPhk8DBWm22njtKOPLAljplTBQxx4o8RkanZvcfsS1jYqb3oEgk
 96M2m0gd0LrQB7u8lerBGYfcdB+vjrzCKn3dqhZT8Tc4xU/l5L75VxbNT2znY+IUqpkG
 p65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=cEDbcV49yFhoYu/n5CXy+IM0ZWGeriQ4zpDcDitGvJg=;
 b=rNEBIaOB4C+DC4ef8LwkHFVAhJCiwhI1Xihjr7zmWWNbzCExWJt5RaVZvZ31CS3/2+
 bZMWZDqTiTb50mXiEkGNArZzT1jVIh5HIpFlRPndzRS3sNN5mcCdWgsO6tejZBjZVxqY
 Ls/skc6lB1bVpQ2K6PjTWSOgkjkN0BG0h9liX0OTDU5YfGgiz7D8Q/8+yNINEzjDrAKt
 upFAqocwhdCzQlA8wN+qgq14LecXFILqoVUGjjwNAh9C7d3JCZhPRcUD7S9SRgbkpV0J
 rJlufvhu0aGsrQfobFUzee/JrSSrAjyPbrRxADGschi0CuujLVlvejaSms5riW8PQX6d
 M05w==
X-Gm-Message-State: APjAAAVlftHwY5l0brqIIk0OwonQ9dM3DMotNOOFVjOiKe74e+Shj53F
 daywHxHep+Y9yeesNjIMWHK43Fp4Ucm5awbULaGoyJfn
X-Google-Smtp-Source: APXvYqySl7lFFVfblx01C2i9rlbCME0nzjtKgyb1gXQJh5AV/gWH9Nejc+hoN08UOrL/0Z7SrPBBJHQCh98Ufar6KEI=
X-Received: by 2002:a17:90a:3aaf:: with SMTP id
 b44mr6503354pjc.9.1580237560588; 
 Tue, 28 Jan 2020 10:52:40 -0800 (PST)
MIME-Version: 1.0
References: <KU1PR02MB23578F78D2A753E043F702A0EA0B0@KU1PR02MB2357.apcprd02.prod.outlook.com>
In-Reply-To: <KU1PR02MB23578F78D2A753E043F702A0EA0B0@KU1PR02MB2357.apcprd02.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 28 Jan 2020 10:52:29 -0800
Message-ID: <CAO=notwh0AjrQ4oBS5gD8WYwX7MH6Cy6sJUWHC-bWQ6=_hT7bA@mail.gmail.com>
Subject: Re: Need help on the following error
To: "Sujoy Ray/WYUS/Wiwynn" <Sujoy_Ray@wiwynn.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jan 27, 2020 at 2:25 PM Sujoy Ray/WYUS/Wiwynn
<Sujoy_Ray@wiwynn.com> wrote:
>
> Hi Patrick,
>
> Wiwynn is trying to use the burn_my_bmc tool and I am wondering is you co=
uld please help me to resolve the following error. I am trying to run the t=
ool with following parameters and seeing the error below. I am very new to =
OpenBMC and looking for some help.
>
>
>
>
>
> burn_my_bmc --command update --interface ipmipci --image /usr/local/bin/t=
est.bin --sig /usr/local/bin/test.sig --type image
>
> /flash/image not found
>
> Exception received: Goal firmware not supported
>
>
>
> I looked into the implementation and it seems the function is returning f=
alse.

The firmware handler must not be present on the BMC.  Likely not a
valid configuration in the BMC image.  Please provide details for how
you configured phosphor-ipmi-flash, such as your bbappend file
enabling the different aspects to it.

I'm on paternity leave right now, so this will probably be my only
correspondence for at least another week.

>
>
>
>
>
> It would be helpful if you please provide some guidance=E2=80=A6.
>
>
>
> Thank you again.
>
> Sujoy.
>
>
>
>
>
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------
>
> This email contains confidential or legally privileged information and is=
 for the sole use of its intended recipient.
>
> Any unauthorized review, use, copying or distribution of this email or th=
e content of this email is strictly prohibited.
>
> If you are not the intended recipient, you may reply to the sender and sh=
ould delete this e-mail immediately.
>
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------
