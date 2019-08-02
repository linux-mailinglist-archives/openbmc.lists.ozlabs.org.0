Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A84B17E7BD
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 04:10:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4609c55tx0zDqdT
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 12:10:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EXQho9da"; 
 dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4609bL5DNVzDqcJ
 for <openbmc@lists.ozlabs.org>; Fri,  2 Aug 2019 12:09:50 +1000 (AEST)
Received: by mail-io1-xd34.google.com with SMTP id q22so29027564iog.4
 for <openbmc@lists.ozlabs.org>; Thu, 01 Aug 2019 19:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=znlkUg9D2VJ/vBvH6EGqW1tFN/5KJRBSPvZZGdg8dBo=;
 b=EXQho9daY/Eri2efmGNbkFPXy+bnaVqGSEXwcOi0CcWQp11lS9MYWNRESfbxRpLlMl
 +ISenpWesEobQ8WS4HHivfwItqdMNo4AFRE2RzIAe0WNtFm1BZ89tgZuAbkxBwKlrm3W
 v/WESs4w7xNWep2Z2Ut5h2CmUHCAvj6FC3CCiOexDs5dnloXPXdGakdbTMqtvjEjP1zy
 QzKMPTaWg7dCdzgdS/sLSjXshIKSAHnbwYb1LaMkqutP3iXltpyc2pjn+79N3QqwhIMR
 tC+Zf7g1v1le/oZZceJHaeAEXPlmNo2WnaMfewr6yscnyLEeG0wNLt2tOy/0hXv0JV/E
 +PbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=znlkUg9D2VJ/vBvH6EGqW1tFN/5KJRBSPvZZGdg8dBo=;
 b=PIXD3qRQHb2eMjkUHx9mmnk8wN4yceuK4WlOva1zBpX0QOp6clcpqckJqlbCqUawC4
 37gt6Y4mSbDlDi5eE6Ya2w3+9XQYb1llT7mYbX3Ao07+L5Mr2LN6eDfoWoiXKZgNeUTc
 9b+mOLVXL/C6CenJ4mo5tZIQEFB91SmTAIB0bo3yGQ2LDqv+tU37hNX7g6SVoriwcNbv
 LaFU/7E0afELNcvHODwK5ovfO2tGI9PGdJgdto7397aBOfoerIcgIu43OXfxIxB2MgzJ
 ydhjv9C9KmSHGBF1MDgsb1eBqj5vftcDDO/uN4p/Vyzbk3eiqHaX+awsLbZW3yzXoIYJ
 utiQ==
X-Gm-Message-State: APjAAAXhzevmUQLGcYz1eM6WQD07PdQ6tGdv5vhe5OQWrkVDFCOz0yct
 qYlSJPvv0MGtCz1QAqL0JbpnwN3JFMeQdds4GjQ=
X-Google-Smtp-Source: APXvYqyjQNboCSrL8YJaTDbaXPqCenKM2JQE8ryKQOZirTCeR77R7T0G2EGT4j4/pzKHqbM76MAYPBjU0+YVzgMv+mI=
X-Received: by 2002:a6b:901:: with SMTP id t1mr8118093ioi.42.1564711786260;
 Thu, 01 Aug 2019 19:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <A6540D28-604F-4057-8065-0EB20BFE92A5@fb.com>
In-Reply-To: <A6540D28-604F-4057-8065-0EB20BFE92A5@fb.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 2 Aug 2019 10:09:35 +0800
Message-ID: <CAARXrtn6OqU9P5MEbZ9znetZ5f115vyZ8NYr0e_P79PFdG1ChA@mail.gmail.com>
Subject: Re: Small help on trivial issue
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I did not check the code details, but from the description, it is likely du=
e to
the global variable's initialization order in a shared library.

Basically, you need to specify `__attribute__((init_priority(101)))` for yo=
ur
global variables.

Please check below commit for details and how to manually specify the init
order for such variables.
https://github.com/openbmc/phosphor-host-ipmid/commit/4b0ddb68b4e7642035858=
9213bc400155fa12e43


On Fri, Aug 2, 2019 at 4:12 AM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Team,
>
> I am having small issue of global json object corruption and I am unable =
to find reason for it. I am defining a global json object (nlohmann::json a=
ppSelData) at the start of file. I am initializing this object in register =
function and accessing this in different functions defined in same shared l=
ibrary. While accessing in different function, it doesn=E2=80=99t hold init=
ialized data. This is failing in my storagecommands.cpp for IPMI.
>
>
>
> Then I created a separate new file selcommands.cpp and did the same opera=
tion, it works here as expected. So I am wondering why it is failing in exi=
sting file vs new one. Looks like there are some header included in existin=
g file is messing it up but I have no clue yet. This only happens with json=
 object.
>
>
>
> For your reference, I am attaching both below files
>
> Storagecommands.cpp =E2=80=93 where this fails
>
> Selcommands.cpp =E2=80=93 where it works.
>
>
>
> I know it is a debug issue and I have been struggling last 2 days so thou=
ght of asking for help to team. Any help here would be appreciated.
>
>
>
> Regards
>
> -Vijay
