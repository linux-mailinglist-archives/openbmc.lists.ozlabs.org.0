Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AF12CC21A
	for <lists+openbmc@lfdr.de>; Wed,  2 Dec 2020 17:21:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmPNs34mtzDr0X
	for <lists+openbmc@lfdr.de>; Thu,  3 Dec 2020 03:21:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=voh//a8Q; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmPMt1w5bzDqmC
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2020 03:20:40 +1100 (AEDT)
Received: by mail-yb1-xb2f.google.com with SMTP id k65so2120539ybk.5
 for <openbmc@lists.ozlabs.org>; Wed, 02 Dec 2020 08:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zOZVRxVHMk1aYSOyo45mTjsZMuSpVZk+EBKMdvqves8=;
 b=voh//a8QkyS5+ICHtcfnOwM2rCUYNgJHAEWHz/283Ks/Akuq97AxXNvt4PMBeMueAi
 uuqRbTeGfcfI13nkbJ/MgIRa+sOMfP55K5y/2KZhFkuuAcFbLib+XLjTZIeQMnHDaD0r
 Md18T/6h7a5T30JYnOCWKqbhlB6fjW9eB6QOvOyEi4WSjizEFcXaRhBApudHo16McqTL
 VWrOdyY65yPWZUhSKdqM2vcycRgj9RokEUTz+ZjwV/97t73exbopno46x6BX8cltzjJ5
 qJH5mxz28VreDyyEYRFw4a9odh7PpPDBRKOinleqYoREQmGxr/VbXn0Sn9aQ6/bCnEnK
 ORjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zOZVRxVHMk1aYSOyo45mTjsZMuSpVZk+EBKMdvqves8=;
 b=syc5j8uffZPpJMFt0NmJZj4lln5UXLiY3cAQyZpn/Rrzbq1HCkyVMeMhNnvc1tRaHg
 C2apSDjUTFrfO7T+n15MeFPRtedTeAuMfzeBTlOUqBL46bQB9ix21UEd2XE5RDwcMtvn
 DDacP88PGILqCao3Tv620sN8aR1T42Mkg4op2XAfcK/LrNkZcfbczKwT+rspA5wwL8sZ
 NgCH0janQqZPyQiaYK1j1RQFh4tVKWR8ZpyiGbHN5glUEhPZHxelQlktwIg2aQ6/tMWq
 HtDsjph8RI/NMy8vILicwx/sZkWwNyCZ7qy/P8deQA69ydpwaz6c2QVpPDub+7EoLEkp
 5C6Q==
X-Gm-Message-State: AOAM530Nkq/AkO9GpKN069lyY8WOd2nrPRFKohdC02OxMVIdmY4/atSI
 onrMgDxQzxVxcc6UlN38E9TXJCcfkm7rkEkSHIFEQQ==
X-Google-Smtp-Source: ABdhPJxdrmumIvQHpheZFFelwGO1MOKIXXf4Q80Jx8HMhuYks7lh6s2IGVCOO4cMHs3vXS+5/mNgGx4deQOgB+mF59Y=
X-Received: by 2002:a25:5806:: with SMTP id m6mr5268562ybb.449.1606926035281; 
 Wed, 02 Dec 2020 08:20:35 -0800 (PST)
MIME-Version: 1.0
References: <HK0PR04MB29643B6D1550EC772A099250FDF30@HK0PR04MB2964.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB29643B6D1550EC772A099250FDF30@HK0PR04MB2964.apcprd04.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 2 Dec 2020 08:20:24 -0800
Message-ID: <CACWQX82=MG2kMPyBei7zp1P8jik0Ay4ZpjyxNkyi+U31nwNx-w@mail.gmail.com>
Subject: Re: Add version info in the fan - json config
To: Kumar Thangavel <thangavel.k@hcl.com>
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Dec 1, 2020 at 10:08 PM Kumar Thangavel <thangavel.k@hcl.com> wrote=
:
>
> Classification: Public
>
> Hi All,
>
>
>
>         Shall we have a new field =E2=80=9Cversion=E2=80=9D in the fan co=
ntroller part in the Entity-Manager json file to identify the versions of t=
he each fan controller updates.
>
>
>
>         This will give us the idea about which versions we are using and =
fan config updates and tracking.

Generally this is better tracked using the version of OpenBMC being
loaded than what version of the config files have been loaded.  While
this makes it a little bit of a pain for debug when loading multiple
copies of the same version, it helps us avoid having to track any
per-file version information.

With that said, how would you imagine the version information would be
exposed to the user?  What value would it serve to a user that's
unable to update the files (except through a firmware update).

>
>
>
>         So, dbus-sensors/FanMain.cpp code should be updated to handle thi=
s version info for the fan.
>
>
>
>         Please let us know if any comments on this.
>
>
>
> Thanks,
>
> Kumar.
>
>
>
>
>
> ::DISCLAIMER::
> ________________________________
> The contents of this e-mail and any attachment(s) are confidential and in=
tended for the named recipient(s) only. E-mail transmission is not guarante=
ed to be secure or error-free as information could be intercepted, corrupte=
d, lost, destroyed, arrive late or incomplete, or may contain viruses in tr=
ansmission. The e mail and its contents (with or without referred errors) s=
hall therefore not attach any liability on the originator or HCL or its aff=
iliates. Views or opinions, if any, presented in this email are solely thos=
e of the author and may not necessarily reflect the views or opinions of HC=
L or its affiliates. Any form of reproduction, dissemination, copying, disc=
losure, modification, distribution and / or publication of this message wit=
hout the prior written consent of authorized representative of HCL is stric=
tly prohibited. If you have received this email in error please delete it a=
nd notify the sender immediately. Before opening any email and/or attachmen=
ts, please check them for viruses and other defects.
> ________________________________
