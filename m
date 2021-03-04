Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5291C32D1DD
	for <lists+openbmc@lfdr.de>; Thu,  4 Mar 2021 12:36:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrpjH2kmpz3cjV
	for <lists+openbmc@lfdr.de>; Thu,  4 Mar 2021 22:36:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Oy53s1c1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::830;
 helo=mail-qt1-x830.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Oy53s1c1; dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Drpj33d74z30Ml
 for <openbmc@lists.ozlabs.org>; Thu,  4 Mar 2021 22:36:05 +1100 (AEDT)
Received: by mail-qt1-x830.google.com with SMTP id 18so17453620qty.3
 for <openbmc@lists.ozlabs.org>; Thu, 04 Mar 2021 03:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ohk1yoZGnA5/ojRuFH+f5cppPvcAH/9C8qmadXwPn5E=;
 b=Oy53s1c12QByGlgGNm475/u3xTgqhRpunuUvMTcZtfcPBogbmnSV0IGCcebQBwUVWx
 /6EA93Fd6U3FPWtsGSD2yjIrtYhlitSN7oxkdWRTKKzHEpw+/KAMHWLIPvs1pMjWItKE
 41847yWG8+TNn8rBHZacPlaORQOBTrKJGAM+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ohk1yoZGnA5/ojRuFH+f5cppPvcAH/9C8qmadXwPn5E=;
 b=gMlPeyUZeR9mNC1pAomK9jm4862QNamRt/O3le8Z/VW/ZZ0B4gR6Tyi1/Lk1KulADv
 cPW9ej/Kx75QmpYzCePCCY/W2ibZSIRwmsBA01Bo63plSKW9F/dXgRAWFrmzbjgyQzBd
 QlKwG4++YNZqRPw65228XCOwDdMuxTpa28A2eYpeUSU2tDFgFz2yUxJ5NORh7WU3HUp6
 LVJEArmPhkMD/18DFNGTe1BcMkDWhb6l46skfpIyCspTGCWfDbJgwhZhzzAuZjAuotk0
 /kLhq1ReQi6Y/L8/TLdya4BHStPqBoX6l6VztzLYQGxni9pfvIPos9Ft9Gh220IUvtxz
 xajg==
X-Gm-Message-State: AOAM5329B6bi2GwljgJug7bc314hqNYlnJ6MkwHrkp4INQU3VhhXkUhv
 todmJ5cthRYRJyIbZ7gz1k/EOozNnQISFqRcI8uR8/u3Rxs=
X-Google-Smtp-Source: ABdhPJzN7lVgLDR6kOVg3BY0BxslN2ndf0W897XzU9b+k/wUAG2AZ8/QAmSNbpxBy6MAxan72vwJqZSFih30wIPpaH0=
X-Received: by 2002:ac8:1201:: with SMTP id x1mr2200865qti.135.1614857761394; 
 Thu, 04 Mar 2021 03:36:01 -0800 (PST)
MIME-Version: 1.0
References: <!&!AAAAAAAAAAAuAAAAAAAAAO4CP8j4rjtAsuu29GjYeJQBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAAAmHSaeuedKS6yz7kuXUVsVAQAAAAA=@phytium.com.cn>
In-Reply-To: <!&!AAAAAAAAAAAuAAAAAAAAAO4CP8j4rjtAsuu29GjYeJQBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAAAmHSaeuedKS6yz7kuXUVsVAQAAAAA=@phytium.com.cn>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Mar 2021 11:35:49 +0000
Message-ID: <CACPK8XdL2JDQj_jiTDtfue_8sfrnrYQNje1JAti6LFPe8OvMcQ@mail.gmail.com>
Subject: Re: [OpenBMC]: Porting OpenBMC to a aarch64 SoC
To: wangmin@phytium.com.cn
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?5YiY5YuH6bmP?= <liuyongpeng@phytium.com.cn>, shuyiqi@phytium.com.cn
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, 4 Mar 2021 at 09:56, <wangmin@phytium.com.cn> wrote:
>
> Hi folks,

Please post using plain text when sending mail to open source mailing lists=
.

I've moderated this one post through., but you will need to sign up to
the list for future posting.

>
>
>
> I am trying porting OpenBMC to a aarch64 SoC.  Just to clarify, the porti=
ng work makes OpenBMC to run on a aarch64 machine. But there are many error=
s during the porting process. Currently, the linux kernel and OS had been s=
uccessfully compiled by using the configuration, while the u-boot failed to=
 be compiled.

Great!

> ubuntu@ubuntu:build$ bitbake obmc-phosphor-image

> ERROR: u-boot-aspeed-sdk-1_v2019.04+gitAUTOINC+09e0e88ee0-r0 do_compile: =
oe_runmake failed
>
> ERROR: u-boot-aspeed-sdk-1_v2019.04+gitAUTOINC+09e0e88ee0-r0 do_compile: =
Execution of '/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux=
/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/temp/run.do_compile.=
5502' failed with exit code 1:

You are trying to build u-boot for the ASPEED platform. This will not work.

You will need to add your own BSP layer to target your SoC, in the
same way we have meta-aspeed and meta-nuvoton. This will contain your
u-boot port, your kernel tree, and any other SoC specific tools.

Cheers,

Joel
