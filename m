Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 337DD355793
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 17:20:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFB701Clbz30Fc
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 01:20:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 308 seconds by postgrey-1.36 at boromir;
 Wed, 07 Apr 2021 01:20:33 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFB6n6NVzz2yx4
 for <openbmc@lists.ozlabs.org>; Wed,  7 Apr 2021 01:20:32 +1000 (AEST)
Received: from mail-oi1-f174.google.com ([209.85.167.174]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MMY9X-1lBr3w2Vmx-00JYsW for <openbmc@lists.ozlabs.org>; Tue, 06 Apr 2021
 17:15:19 +0200
Received: by mail-oi1-f174.google.com with SMTP id i81so15450243oif.6
 for <openbmc@lists.ozlabs.org>; Tue, 06 Apr 2021 08:15:18 -0700 (PDT)
X-Gm-Message-State: AOAM533TeZbVAD4e54mF9oiAKWCp7AdBA3BuiCqFMMyas3swAq18g2b1
 M8hLSnltZUWfe3NloIeQiwP6gP/fpNUxws5bxS8=
X-Google-Smtp-Source: ABdhPJz4slBAtMkWReqWmn9qjq3arsJPPMq5eMKJmxc8Fy+6BZN/lNC6TLdMMNWBQOCPC67UyuJWAc0FKYC/hZSiCXo=
X-Received: by 2002:aca:5945:: with SMTP id n66mr3568287oib.11.1617722117908; 
 Tue, 06 Apr 2021 08:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
In-Reply-To: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 6 Apr 2021 17:15:01 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0VfnUucvZNkA9PdxrWiYUOkisV00v-375PmgQYp4aXoQ@mail.gmail.com>
Message-ID: <CAK8P3a0VfnUucvZNkA9PdxrWiYUOkisV00v-375PmgQYp4aXoQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Initial support for Nuvoton WPCM450 BMC SoC
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hbe3BZXxbLdHGOP9SQ/RYT0g3wZHHkf0ju0uNmdcKHsIrjXWD6p
 S1BI5oBZWSLRokCQCAC9e5xGcTtkvybMUrn73VeovP89yGGPth14uFoao8Z03SZ4Z9350lx
 b6xxeW/DBV7fgrsmAqZ1QppsYgYozkVAhMBHYNBsBY6v03IfDdvQYccS1Sm8NW/4UpDYw7k
 sGgkPdTxXgsk/31Q4hUPQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rDwQA4ujJEo=:bnE5LIt9tYheajRI9g+OkW
 eC6+g8MAZJII4awXwKQX1VTEJ6W9W+KjKYXQw24WB59ZRdH8A6Phjtfs6T2GmQht0lGVQnYA+
 hxkwT55jdPYG3T/IbLKDz6ssnAochODE+qdht15XFZHeExC3fRiEcfl2EAINcw7W8mhdOlvYJ
 Ci6PHnAZ+9IXyP6w5ZR4dAr+GpfdXcNLpBHTDNtHG1/iGIS9MJgrFc5Fc4QEd3uPiIJg72i6R
 6OpvD1BxM4jeiRlW6g5QWFaTUitQJPcLR0JstuocNzVDcIsZrxA92uSWjyS331fkXygJE7sRj
 f4vEf7rajZc8Y7B28Gj70sLNt65MB82Ilxq8aF/gC6xy2s/awTHzC4Pgv/yb/olS/RG1Gjyy7
 bG6ndql/9cDVvOi4bVLnI+PNUxpFDV/DeNVB/wQ68SukRLNeDaKD28n1to7bgJkqxhk+AbRTG
 PZQZ8mToaw1KJnQkkLbt1Qp83tLszo6Xcl7tVCnrJQk1UYWrErTjg5MS+d+ynOVWpwuheftIU
 I8nzmrxnXzumaCY7KVVA4ZM26bqD3JkqJsTxHpPPfPG1zmKGuUJ6rDXFcRYvbXk5HIuquLobP
 waLRckyx78wzNRWul93vVVQbpuDP72RdwY
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
Cc: DTML <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 6, 2021 at 2:09 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> This series adds basic support for the Nuvoton WPCM450 BMC SoC. It's an o=
lder
> SoC but still commonly found on eBay, mostly in Supermicro X9 server boar=
ds.
>
> Third-party documentation is available at: https://github.com/neuschaefer=
/wpcm450/wiki
>
> Patches 1-4 add devicetree bindings for the WPCM450 SoC and its various p=
arts.
> Patches 5-7 add arch and driver support. Patches 8 and 9 add a devicetree=
 for
> the SoC and a board based on it. Patch 10 finally updates the MAINTAINERS=
 file.
>
> Patch 2 requires "dt-bindings: arm: Convert nuvoton,npcm750 binding to YA=
ML"
> (https://lore.kernel.org/lkml/20210320164023.614059-1-j.neuschaefer@gmx.n=
et/)

Hi Jonathan,

It appears these patches are doing roughly the right thing, and we may stil=
l
be able to get them into v5.13, but I'm not sure what your plan for maintai=
ning
them is. The two options are that you either send your patches to be picked=
 up
by Joel, or you send everything directly to soc@kernel.org once it's fully
reviewed.

I only noticed your series when patch 9/10 made it into the soc@kernel.org
patchwork because of the Cc, but none of the other ones did.

If you end up with the second option, we can go through what this involves
off-list.

Regarding the Cc:soc@kernel.org, please add that only for patches that
are already reviewed and ready to be picked up, ideally with a cover letter
that describes what the plan is for merging. If you need me to review the
platform code, use my arnd@arndb.de or arnd@kernel.org addresses.

          Arnd
