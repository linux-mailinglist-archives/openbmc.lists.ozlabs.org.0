Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3802D53A8EB
	for <lists+openbmc@lfdr.de>; Wed,  1 Jun 2022 16:17:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCrnZ0b8Mz3fkB
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 00:17:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EphygKhl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EphygKhl;
	dkim-atps=neutral
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCrhf22d0z3gYV
	for <openbmc@lists.ozlabs.org>; Thu,  2 Jun 2022 00:13:06 +1000 (AEST)
Received: by mail-qv1-xf36.google.com with SMTP id cv1so1534810qvb.5
        for <openbmc@lists.ozlabs.org>; Wed, 01 Jun 2022 07:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=2mrveSjBmQYRvMJMr8hQ24brKbV3xWcbAK6suJqgs6I=;
        b=EphygKhl2kHWzZ6x1NVVCIZSWDapUBsKrPWSsOF9wIc8bwJN7TkmmZMKdcBWqPJA9b
         FWTwo27knmuYM/yJIH5/WhoFcPJtks9cD+bRkexjl3idGMgEHePN1MiPHldT3W6h1cBn
         OCBAcLaya1pY2TzbQCot9Kvt4peQbB/hV6gnwJXnnjSEzGY/gR4nWFNSjW/gNBa1/Zof
         opJI7kXtt9wLBRnYGJzwPa6isMBR8I4K3DRka03nNFh9CSRtJdSo78N3Xmr9pMGMGTki
         C67Nj9KxmKiSILc7WzmG2TIDwdzilFcu8IdoGWs4fcpqG2fY11PWuo8xqmrdti4NTct5
         np5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=2mrveSjBmQYRvMJMr8hQ24brKbV3xWcbAK6suJqgs6I=;
        b=zTIw9+vqVbQhFV0zdPAdTvly0SOSjsO7yZRFHro5133tscx9xxb26lvQVEbO+gVAzH
         hPcdZMEYcXSJS5BpJU7AV2y0dnrqvpSe/6Oqxywfp52BgzMcqj0+cCz05QQFxzCQCQYe
         5TsHd9fV3Wi4RKIZRJ2NE+QDs8pE1kx6wpu4j6lXhz27/QBSJzKsllKGhTxPQwEP5Ldm
         kUAbiUrR2eAhVtIgBgUn/8rAehgrhvz/V+qsBwe5vnbsDZQE/x+nnj6rJ8Q/32P81lyH
         bmYsawq05IYbAK3vyrySqNL88RgAsuQskRqVK2GEmX2d+t66WjI8GmZzLJkeAfI/In26
         yCTw==
X-Gm-Message-State: AOAM532vpPAgN7RHAiCCrZe6R32ni4mD7SveXk0J8bkeL9pph+f4xQU4
	tPtgr533fEnLI/6SEYC5cGA=
X-Google-Smtp-Source: ABdhPJxTDecE9+tcJi3HQDbvoa2vQFg+AVLxu8jq9kpSPPFDsRNnJ+j9G3aHp2bFSdWq2ITgWtrmIg==
X-Received: by 2002:a05:6214:2a8e:b0:464:5b2f:76bf with SMTP id jr14-20020a0562142a8e00b004645b2f76bfmr9452932qvb.60.1654092782588;
        Wed, 01 Jun 2022 07:13:02 -0700 (PDT)
Received: from smtpclient.apple ([98.15.2.247])
        by smtp.gmail.com with ESMTPSA id n79-20020a374052000000b0069fc13ce23dsm1295302qka.110.2022.06.01.07.13.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Jun 2022 07:13:01 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Updated links on dev-environment.md
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <Ypaf3wQAL2qxrqf9@heinlein.stwcx.org.github.beta.tailscale.net>
Date: Wed, 1 Jun 2022 10:13:00 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <A2A27144-E639-462C-9079-42FBFBD5BCDC@gmail.com>
References: <CAG3oxEfmZ2OsE=nGWXnD_4opkiKC7dMi7+wzqo_3dqN37aAT8g@mail.gmail.com>
 <Ypaf3wQAL2qxrqf9@heinlein.stwcx.org.github.beta.tailscale.net>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>, Jonathan Arias <jonathanarias@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On May 31, 2022, at 7:08 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Mon, May 30, 2022 at 12:56:54PM -0500, Jonathan Arias wrote:
>=20
> Hello Jonathan,
>=20
> Trimmed out a bit of your message and cc'd the ML.  It's best to use =
the
> ML for assistance.
>=20
>> Anyway, I  was following the guide here
>> =
https://github.com/openbmc/docs/blob/master/development/dev-environment.md=

>> But some of the links for the toolchains are broken, was hoping you =
knew
>> where I could find them?
>>=20
>> For example,  this toolchain link is broken below.
>>=20
>> wget
>> =
https://jenkins.openbmc.org/job/latest-master-sdk/label=3Ddocker-builder,t=
arget=3Dromulus/lastSuccessfulBuild/artifact/deploy/sdk/oecore-x86_64-arm1=
176jzs-toolchain-nodistro.0.sh
>>=20
>> I went to https://jenkins.openbmc.org/job/latest-master-sdk/ to look =
for
>> it, but that project is disabled, so no artifacts.
>=20
> It looks like Andrew disabled this on 2022-04-09.  I'm not sure the
> reason why.  Hopefully he can elaborate.

oops, I had disabled during the prep for the server transition but never =
re-enabled.
It=E2=80=99s back up and running now.

>=20
> --=20
> Patrick Williams

