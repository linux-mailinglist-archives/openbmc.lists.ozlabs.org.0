Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE82432BB4
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 04:11:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYHL155CFz3cPR
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 13:11:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=J6IeIICw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=J6IeIICw; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYHJs26ljz2ynK
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 13:10:36 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id v17so17055309qtp.1
 for <openbmc@lists.ozlabs.org>; Mon, 18 Oct 2021 19:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rRMmi0U8C71fd5FkrakG0ey0gucjpwC4q5MJuGNaig8=;
 b=J6IeIICwLxLok+o/ntgYlC79P8ZE4jSsdRiFjYkWytqql3NcQBIg5qc95IO9TVVnuK
 TxaattXPIK3VbG8aFDQULaScLCBPAMKLIGlfBzngAB11OkTXa8wVbnuNFHBYrQtv8Ave
 dOJMVOUIOtY2gwc17+CsTdpoMPVjUzvdX9slA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rRMmi0U8C71fd5FkrakG0ey0gucjpwC4q5MJuGNaig8=;
 b=V9LMzOfgr9yP+fsncKHaoBIfZUQg9wbqP+bMaRnbVjR70lLLiuyGhU/4eYMGhcygRX
 5qhljDTk1xYXf82vyhlnm7mu5oItd7f1JWVAX1HVxYg56PRTqXUSj7rXFbgTRqCHjqOm
 QKtPbDpoPITchFs/PJMw5iiQuGsAMVBS9p9xEFUNdZWQcd/1ZuBuBgbb61XpLL/TAkhI
 NWhCS3ONHzwL6eliiFudK9eJ4qmYLiNDPbtPBtxUjsjZtbCqI3VzjbQ5MgETWObOEt82
 H8FW2rh1tvGzAfS+thwOSxXfD/rv0azbupV+CgvwRNlD4Tlbto4NmQAaTH07gFcdWbq2
 VdQA==
X-Gm-Message-State: AOAM532lTEH0TTdSQTAx9/dyk3eFqKgG6Rivr1vvQU+bnzhY8PlPXh0C
 XUufspej7zG4w14sy1Lrl+zSgI7ebN91aIq2oas=
X-Google-Smtp-Source: ABdhPJyVGG0B4I40xh6wig/H5l4gXYo790/8qEI25cowmumI3Ru0SI53HkkLCwSZgVBYC8ea4b71vrbWKtTA6allRsk=
X-Received: by 2002:a05:622a:1006:: with SMTP id
 d6mr14599433qte.259.1634609432378; 
 Mon, 18 Oct 2021 19:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <3a7fed78df06416da20ec72f14111c97@inventec.com>
 <e57d58c0b44b4a289c580e188f7d5580@inventec.com>
 <CACPK8XeZ9esWimkv+RbeP3xyohzcPiUkXFhDWqB6ANjJ0aBvHw@mail.gmail.com>
 <CACPK8XdzUf9nK_PNQcEJCs+9fMv-J=ZP4hetQ2ofbB=5GGALXw@mail.gmail.com>
 <dc78dc3324284fbaa45da37fb1ac4798@inventec.com>
In-Reply-To: <dc78dc3324284fbaa45da37fb1ac4798@inventec.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 19 Oct 2021 02:10:20 +0000
Message-ID: <CACPK8Xf0wJZSGqu5i_+Aank6gUob9YfK+dDicuNHM71k4L13Zw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Adding Inventec Transformers BMC
To: =?UTF-8?B?TGluLlRvbW15U0Mg5p6X5LiW5qy9IFRBTw==?= <Lin.TommySC@inventec.com>
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
Cc: =?UTF-8?B?WWUuVmljIOiRieWuh+a4hSBUQU8=?= <ye.vic@inventec.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 19 Oct 2021 at 02:06, Lin.TommySC =E6=9E=97=E4=B8=96=E6=AC=BD TAO
<Lin.TommySC@inventec.com> wrote:
>
> Hi Joel,
>
> Could you give some hint on how to upgrade to v5.15-rc1? I don't see this=
 tag in upstream github https://github.com/openbmc/linux.

You can find it in Linus' tree here:

git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t

The latest commit is v5.15-rc6, which is fine to test with. Or you can
check out v5.15-rc1 and apply your patch on top.

Cheers,

Joel
