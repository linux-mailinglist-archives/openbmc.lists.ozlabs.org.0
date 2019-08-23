Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 638149B259
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 16:43:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FPKL4dXhzDqYC
	for <lists+openbmc@lfdr.de>; Sat, 24 Aug 2019 00:43:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lbKFVyZi"; 
 dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FPJZ4Y3dzDqNm
 for <openbmc@lists.ozlabs.org>; Sat, 24 Aug 2019 00:42:54 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id c2so5695213plz.13
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 07:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=A7sUtVpfmF/41ipaSd9wMJMexTrsTx0kQOfHApsvUdg=;
 b=lbKFVyZioEMBrBJvPYxgXoENg8IZ3GSKFsRBbbrhRAahCQoh0jgFaK+QDztXwBNU4t
 GZchrneXBDOQ2eTh7jCeJ4XGv9QuHG7hMzCxPF5I+FpEJp9UiYUyaAFJ08RR8eEC1kGo
 fbmb08Y7w/Cvwz5u99DX7MY7WPCQCuY/3VA2P0RTXyBGJKoxXoCC01yqM5qOW8A5RR5O
 0oyXOP9D5SSzbVHwrTe0TO1BCfkJRYW7e+MiNlFODVhavVqc+Ow3HeXWpm71HAcDTLHJ
 qUlX+1kVy9/A/bqhZQrlSRD3HSIXSyRUnf5djvqlxoDosCoF490q9TZL/b7OjmuK8kNk
 Cbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A7sUtVpfmF/41ipaSd9wMJMexTrsTx0kQOfHApsvUdg=;
 b=rApgl+NyL7+usuUbkcm1bjhgflQT1kFIJP9Q9SlmJM+gtb5E0MOqR9RStm656RSh7E
 BCkXm3fht1sZgYFyF4+jSFUIBzE1O0m+o5eihmOq7IzlKlrUiyhBC3glWnsZ1bhvBhMK
 T+3bIV3SwFXC5NwAMgKCzVyRtOhULPA4Tm+ylaZvXa9N8cP0YX2d3HtAyHI4GzUHlBiQ
 AJC2tX7R+TjQwVO7WPtcLJF9BEthjCKJfBaCoFSeH3fG9s1e89/7WDHxVLsy6NceM+us
 hxP8UJ43gXD+z2TKiO5SuWen7bvrAfvNRmppyisFM41lo8mE6yKA8+VB/EtvqPM448K4
 ahtw==
X-Gm-Message-State: APjAAAVYvojVGGfxBQ2/PAfdUhpmYCHXXCH7OXTi4nkw5/uMJj8u2HnH
 zMW5G1A8MAeVYvBzTcmDwyopT7CfxWfu9eTBmTy90Q==
X-Google-Smtp-Source: APXvYqw0VoljExyte2N+QYdqwszuecXk7WRCKw5HetHHXIt5rL5bc7KeD1Z2aksWQZOpMtML17yNVmhmHTnCFWCqz9M=
X-Received: by 2002:a17:902:a9c3:: with SMTP id
 b3mr5163114plr.179.1566571371647; 
 Fri, 23 Aug 2019 07:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR03MB4068E6EB742A7088B92362A7AEA40@HK0PR03MB4068.apcprd03.prod.outlook.com>
In-Reply-To: <HK0PR03MB4068E6EB742A7088B92362A7AEA40@HK0PR03MB4068.apcprd03.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 23 Aug 2019 07:42:40 -0700
Message-ID: <CAO=notyaNX1JO2S6AdJd39oP-JqKef62G5w=2h2j-AXCrz1-WQ@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash: A problem in BMC FW update over LPC
To: CS20 KWLiu <KWLIU@nuvoton.com>, Benjamin Fair <benjaminfair@google.com>
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
Cc: =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?Q29yZXkgQ2hlbiAo6Zmz5b+X6YqYKQ==?= <Corey.Chen@quantatw.com>,
 CS20 CTCchien <CTCCHIEN@nuvoton.com>,
 =?UTF-8?B?U2FtdWVsIEppYW5nICjmsZ/pqI/lhYgp?= <Samuel.Jiang@quantatw.com>,
 =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 23, 2019 at 4:13 AM CS20 KWLiu <KWLIU@nuvoton.com> wrote:
>
> Hello Patrick:
>
>
>
> We are currently trying to enable the BMC FW update over LPC on our platf=
orm (nuvoton BMC), but we encounter a problem with BIOS.
> The BIOS engineer has reserved memory region as mmio space, but we couldn=
't see any data change in this region during run burn_my_bmc.
> We have checked the BMC setting(in lpc_nuvoton.c and LDN SHM) but we coul=
dn't identify the root cause of this problem.

+Benjamin Fair

I don't know the Nuvoton BMC that well, but I do know that I tested it
on a system we have that uses it.  I'm adding Benjamin as he's more
familiar with any nuances associated with Nuvoton's BMC.

>
>
>
> Is there any settings we lost?
>
>
>
> Thanks,
>
> Joseph
>
> ________________________________
> The privileged confidential information contained in this email is intend=
ed for use only by the addressees as indicated by the original sender of th=
is email. If you are not the addressee indicated in this email or are not r=
esponsible for delivery of the email to such a person, please kindly reply =
to the sender indicating this fact and delete all copies of it from your co=
mputer and network server immediately. Your cooperation is highly appreciat=
ed. It is advised that any unauthorized use of confidential information of =
Nuvoton is strictly prohibited; and any information in this email irrelevan=
t to the official business of Nuvoton shall be deemed as neither given nor =
endorsed by Nuvoton.
