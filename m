Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B64A2948EF
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 09:33:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGMfk1R8VzDqXQ
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 18:33:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::433;
 helo=mail-wr1-x433.google.com; envelope-from=tajudheenk@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rKhXha/y; dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGMdy2rjlzDqVT
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 18:32:29 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id j7so1741241wrt.9
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 00:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NpBfdgRNHt00G2jidhciRwpnjNAAaPp9oB0hGlwgnkk=;
 b=rKhXha/y4RxOk6YQFA9bI4/9y/K+kuSm11UDv6Samu14in6TqHn1dJV/YUjU3RA0ZO
 GfFb6wPm8eC9zOc657iOVHy8fiAosP6blkyoe789GoHGjnRcyZniH4cnEEPMwZhgytat
 j4EPS0n/nIFoookkwedTGtY3b0rlomKy60N0W5/15wHHHJmXLkEXcNklv1EpV8NGaHrm
 uEnFcctezKDBB0TDvo4DUjVRbbGRTNxtz2/0V3Oykt8nYR01XUvKVI5xX6BTitvxxCmf
 usbrIcom+ugxI92XPqOv4x/G7foJVyqdmc9HLhhNFE4QvEVfEDLeJl7fj1X/lnH0blGd
 8yJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NpBfdgRNHt00G2jidhciRwpnjNAAaPp9oB0hGlwgnkk=;
 b=dFIWPwd0+B+M3mILx/QlZ2WuRcijtRXHYbZSUbYZNnnMTxgUniLphtjV2coTZdwdlR
 nQ+rBjwZaElvxGWmg4fUd1ioq9a2wUYW6wMNvKfWjNDpVnaVvAsVnEYwsjXZbnDTqACQ
 /XlIToCZrcW0uF1XBFS8dGTk/9SE0pQlRE7YGDGPLjy2gq7rqN5RtBzpeJ6T84k4ypdb
 FMvABg0253//eTi500qNb7qMS/gAICABDalnAOLvJXymuiQ+LIFfePb6qDEv1t62iAZG
 Q232QtB6f1o5nblnhtQg2tfHAWqD/rg+vix9hf8ObAS3Ai9ZV/NsJ477zCQyMwDTsLAp
 KETQ==
X-Gm-Message-State: AOAM531a6G489RVTQvNmzeKlQUurtEy+2aANsLG5ltMc/FzaBXm4xs/w
 egrbRvPxAHIvqspQYhGJQAoLDNPTDk37alw7T+o=
X-Google-Smtp-Source: ABdhPJwyCOtV/IzqDAPNhWxnZuGYPsV7TPj8PwOQE4wPAKoBaqm5OYpjImTMsKAAQH5Hz+VKeF3Fn6ueDg6d2iAgFck=
X-Received: by 2002:adf:9c19:: with SMTP id f25mr2965028wrc.366.1603265544079; 
 Wed, 21 Oct 2020 00:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <60926e52-9d00-2b20-e8ac-7fd515ddac78@yadro.com>
In-Reply-To: <60926e52-9d00-2b20-e8ac-7fd515ddac78@yadro.com>
From: Thaj <tajudheenk@gmail.com>
Date: Wed, 21 Oct 2020 13:02:13 +0530
Message-ID: <CAH2KKeaBMhU3XDADDE0ieqRRhNBiF57-9rUi+Go-SSJCGG-GBA@mail.gmail.com>
Subject: Re: Installing Windows Server 2019 from a remotely mounted ISO
To: Alexander Amelkin <a.amelkin@yadro.com>
Content-Type: multipart/alternative; boundary="0000000000003c4c9605b2295941"
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000003c4c9605b2295941
Content-Type: text/plain; charset="UTF-8"

Hi Alexander, I am also facing the same issue. Did you find any
workaround for this ?

On Mon, May 25, 2020 at 4:04 PM Alexander Amelkin <a.amelkin@yadro.com>
wrote:

> Hi all!
>
> We're trying to install Windows Server 2019 from an ISO image mounted as
> remote media via OpenBMC WebUI.
>
> The Windows installer boots, but then says that a media driver is missing.
>
> Are there any hints on how to accomplish the task?
>
> Attached is the screenshot of the message we get with Windows Server 2019.
>
> With best regards,
> Alexander.
>
> P.S. We're using Intel-BMC version of OpenBMC for the task, but it looks
> like the remote media part is more or less the same.
>
>

--0000000000003c4c9605b2295941
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alexander, I am also facing the same issue. Did you fin=
d any workaround=C2=A0for this ?</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Mon, May 25, 2020 at 4:04 PM Alexander A=
melkin &lt;<a href=3D"mailto:a.amelkin@yadro.com">a.amelkin@yadro.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi all=
!<br>
<br>
We&#39;re trying to install Windows Server 2019 from an ISO image mounted a=
s <br>
remote media via OpenBMC WebUI.<br>
<br>
The Windows installer boots, but then says that a media driver is missing.<=
br>
<br>
Are there any hints on how to accomplish the task?<br>
<br>
Attached is the screenshot of the message we get with Windows Server 2019.<=
br>
<br>
With best regards,<br>
Alexander.<br>
<br>
P.S. We&#39;re using Intel-BMC version of OpenBMC for the task, but it look=
s <br>
like the remote media part is more or less the same.<br>
<br>
</blockquote></div>

--0000000000003c4c9605b2295941--
