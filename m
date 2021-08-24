Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ACA3F5CF6
	for <lists+openbmc@lfdr.de>; Tue, 24 Aug 2021 13:13:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gv60h4jlVz2yKQ
	for <lists+openbmc@lfdr.de>; Tue, 24 Aug 2021 21:13:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=LYuLqloO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=LYuLqloO; dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gv60D6Mzcz2xYP
 for <openbmc@lists.ozlabs.org>; Tue, 24 Aug 2021 21:12:38 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id
 g66-20020a9d12c8000000b0051aeba607f1so36421514otg.11
 for <openbmc@lists.ozlabs.org>; Tue, 24 Aug 2021 04:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mbU3qOfnLW40pm1kpn9kdS5yM45ubrmpqGuussQSDeM=;
 b=LYuLqloOHXDaUHeP8OTqg191eaOpjyy4CnsLw1WrqamTddwXwAsqYe70FMBIB3tl3u
 ptp6/Luo+1yAINfAhlb44ahjFUezuBO6pV7inC5niIWBV2HGcS6rZThxX2bUEwBSQwn7
 X8fU/E0A2ghGVIBluLFovdstDHiZRmrders48TpeN9SJdhk3HY+A2MKVE3E/rjOr55Kg
 h37QVapx8iCvr5sFGVjilm7qyJ4emb3ZULJQCps3bKX2cU31BplFpVz3asHmnyeWlMUp
 q4wyJLHHXFmHq6WIcCzHWnqcbBIDkyT+6gNQiE8lj0/CnpcTDRNYGxgwPTjZBn/VHdwO
 M00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mbU3qOfnLW40pm1kpn9kdS5yM45ubrmpqGuussQSDeM=;
 b=BZ3eQ4FnSvsLaAVwHVyKtI1F8+hh9LIiQ7JADIUUCQ8DBF9SDIcSrwDWbiQpQX3Qjk
 zucSOCtqr+ATvGoGkA1zvc5BDL8boDQh+RRLd5HqejDM8WoR6d050JSGpTUuRNegQTet
 zybOC3FQX1wzDan+xaTnV4KABIG/p4EVndIs2IImq7uw8qiNpN0tt8kl98d9jNEbPurs
 Rb4jOMvKr9qihPVuFPvmnl2o601SEjnNKbsRIPZlEsQxQVtQ8Qv7K+SDYg4oX17RS/yc
 Pu2BKbrFB3hzBCwNFcDDM7l0HXBCIOdU3TBi7Ho2N02tCYdCy6AhwByo3ki2zcs7D7Jy
 8j9g==
X-Gm-Message-State: AOAM530yxy6otyhk6o0T3Sy4Bnv/rFETN27aNe8tJtZ6JknHCuFGEVy4
 Ed8axCAb/ad5FowcomEZA6qm7IsVQvxiAhATGOyW5w==
X-Google-Smtp-Source: ABdhPJwTUgIcMx57eITIvgih+ddO1lOC9XaGdNpLlMDZdfPro1bKnuw/My1Emj7wsOWXSPOe0dvJ8asmkWrAFMkofcQ=
X-Received: by 2002:a05:6808:1294:: with SMTP id
 a20mr2415109oiw.4.1629803554150; 
 Tue, 24 Aug 2021 04:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB2625A93112522EE203DE926995C59@HK0PR04MB2625.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB2625A93112522EE203DE926995C59@HK0PR04MB2625.apcprd04.prod.outlook.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 24 Aug 2021 19:12:23 +0800
Message-ID: <CAGm54UEXUyeE3QYpNMT3r7SmcafiwS7OjHv1K3pW9W0Eo4GCSQ@mail.gmail.com>
Subject: Re: [External] Unfound interface
 "xyz.openbmc_project.Channel.ChannelAccess" in phosphor-network
To: =?UTF-8?B?SGFydmV5IFd1ICjlkLPltIfntq0p?= <Harvey.Wu@quantatw.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "apparao.puli@linux.intel.com" <apparao.puli@linux.intel.com>,
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>,
 =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

There is a patch at
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-comm=
on/recipes-network/network/phosphor-network/0003-Adding-channel-specific-pr=
ivilege-to-network.patch
that implement the feature.
It would be appreciated for Intel to upstream the patch.

On Tue, Aug 24, 2021 at 5:29 PM Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=AD) <Ha=
rvey.Wu@quantatw.com> wrote:
>
> Hi Apparao, All,
>
>
>
> When I use ipmi command to =E2=80=9CSet Channel Access of Non-Volatile Se=
ttings=E2=80=9D, it always return =E2=80=9CUnspecified error=E2=80=9D and c=
annot update non-volatile json file.
>
> After debugging, it seems doesn=E2=80=99t have the interface =E2=80=9Cxyz=
.openbmc_project.Channel.ChannelAccess=E2=80=9D in =E2=80=9Cxyz.openbmc_pro=
ject.Network=E2=80=9D service in my system.
>
>
>
> Do I miss something in phosphor-network setting? It seems like this inter=
face is unused in current openbmc.
>
>
>
>
>
> Best Regards
>
>
>
> Harvey Wu
>
>



--=20
BRs,
Lei YU
