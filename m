Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD256DD10B
	for <lists+openbmc@lfdr.de>; Tue, 11 Apr 2023 06:40:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwY6Q0vJtz3cMH
	for <lists+openbmc@lfdr.de>; Tue, 11 Apr 2023 14:39:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=gGu1uhuk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=gGu1uhuk;
	dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PwY5t3W5Gz2yPD
	for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2023 14:39:29 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id dm2so17293343ejc.8
        for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2023 21:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1681187964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ynv+c1uDD/dX+srL/F3UqJNCXqr4FtkcsXibUM8a7+c=;
        b=gGu1uhukSdvnPnjP4NKlE3X5QbjJWCw0jrPvlmtf7QzCmDkCtmyE0cb5Cs0YFvM5tQ
         yeef7RciYCPGXkaV4XWopHqBNJmj10CemeEDZX01uXunlmBkNHPKTizmUGclE7mYXMxZ
         Oi6AWLvBYtQEN+Q+ShP5fyHf0um62DIXdCg2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681187964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ynv+c1uDD/dX+srL/F3UqJNCXqr4FtkcsXibUM8a7+c=;
        b=ad2khh1oD8zo+VcP5qf9K380sUAn6DN71deqAPe1UN483p/WHe8jcXCF52xBUHwZM3
         PW7ppT3YvCeop2B4ByUMuIvd27zxGdOjDuLMgjn87/XQAsi6kdZuLPaNwesPSzZCzcZG
         NDR07rch/cFYwC/8qGOU1asmnoCbX4zM6XRCo6cX4IlN9QuhyMkm4TuZyq368/nDwM6E
         MSG4klL2Qghmg1QnaLONJm5mv9fYhJry8dHe3GhOvs0HMD5BXcgfC4FKky7CZBHv1w55
         KQ0Ij2q4NuxDdzmEjIJaoYSzPW3dGX3QxEsKvOlx7FkADOZHFlRqVMVccuQR38DIhWid
         460w==
X-Gm-Message-State: AAQBX9eHfnAbU/yPCVQqBtD5ICryiqbxDs56fO9bZifgZSC4T/O4bBnY
	w+FYirTkle8oJJPTakh8E7obhfFL85XQVyRRwSPykiTQH3I=
X-Google-Smtp-Source: AKy350YKaTdOb9BU2KBe8kG3Lc572OimqTI6dIPeT2az0swlFfVrQBEY89l8jJsGglyLCTTGaSTUNO5vlj8jeNsT8ds=
X-Received: by 2002:a17:907:970c:b0:8f5:2e0e:6def with SMTP id
 jg12-20020a170907970c00b008f52e0e6defmr5470748ejc.0.1681187964146; Mon, 10
 Apr 2023 21:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <191F3605-11DF-4870-AB07-B4A31169B3D2@hpe.com> <CACPK8Xd2kGxq1sb7DKZ0qXoinYygk6WvPTVqy84kgznGrBPdOA@mail.gmail.com>
 <4044DFC4-7175-4E59-9A99-2EE355FF415D@hpe.com>
In-Reply-To: <4044DFC4-7175-4E59-9A99-2EE355FF415D@hpe.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 11 Apr 2023 04:39:12 +0000
Message-ID: <CACPK8Xdvcs2LTSdqWcEW-Ppp8NEf=xBkgAw8ytF8Vm=AAVENUA@mail.gmail.com>
Subject: Re: GXP support into OpenBMC kernel
To: "Verdun, Jean-Marie" <verdun@hpe.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Hawkins, Nick" <nick.hawkins@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 5 Apr 2023 at 23:40, Verdun, Jean-Marie <verdun@hpe.com> wrote:
>
> Hi Joel,
>
> Thanks for your answer. Here is the process that I propose, let me know i=
f that doesn't match your expectation.
>
> - We keep upstreaming into 6.2x and we will warn you about need to backpo=
rt (I hope it will be easy but I think it will be the case)

You can't upstream to 6.2, that is already released. Did you mean
mainline? That would be 6.4, although realistically if you don't have
patches merged yet then you're targeting 6.5.

> - In parallel, we start enabling some of our gen11 machines into openbmc =
repo and point to standard openbmc kernel. We have decided to have a fine g=
rain process to upstream and do it one step at a time. That might look like=
 a little bit overkill, but I think that will be efficient.

Yes, that's a good plan.

I've picked all of the GXP patches from mainline that were merged
after 6.1 that I could find. Take a look here, if it looks okay I'll
merge them into the openbmc tree:

 https://github.com/shenki/linux/commits/dev-6.1

> - When we identify potential bottleneck, we discuss through the mailing l=
ist about them, and get your feedbacks on how to process.
>
> We would like to apply the same approach with u-boot, if that is ok for y=
ou

u-boot is a bit harder. I would prefer not to apply them to the 4 year
old aspeed tree, as that is already too old. Instead we could start a
new branch based on the most recent release.

Cheers,

Joel
