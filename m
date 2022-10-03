Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3A45F2918
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 09:13:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MgsWQ30Nkz3cCh
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 18:13:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=l88RbzHg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=l88RbzHg;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MgsVm0DS5z3c6R
	for <openbmc@lists.ozlabs.org>; Mon,  3 Oct 2022 18:13:03 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id f11so12644435wrm.6
        for <openbmc@lists.ozlabs.org>; Mon, 03 Oct 2022 00:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=nDboZZGHGeAHL82X5/dO+JkNFzrbLVo3wssgtIEFvL0=;
        b=l88RbzHgGG+PMtBcjlBhamSKcfKon2vVSnvpnRok4I4Y+FOWymy0Ok9+4QjC25VT+c
         us8kRcKtMauOWJv6n5ZvG2utsEfF/clDDJ4zorPIzR/DObyx3S0Ivly0kjWfIFCLBHMl
         BJnnewrH7ONJbtSOc2nGnD75Quz8aTS9qWkdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=nDboZZGHGeAHL82X5/dO+JkNFzrbLVo3wssgtIEFvL0=;
        b=AdLkKU9W3VQmcBL9xBea8VBiczCH++BTg7R5itVk90UrSwtl4aIJT14wkUl78qlFbC
         0LqI5NyzzIfg9001c8bw7+O/w2g7Xsqxvqx4IN8NWDjc/l2qXOk0cQ41JSXHHRJZEqL3
         6CRaNJ2MaSY+NZYv+yhY2aNrpW+Ywkd/L4mkdW687t9dt1O42yCkehd1EXApOwXd0dzE
         iT9BmV4uH9QlN2q3XJni1nlKgh26j/fkSDfhXg3pqNpLKAcEVZsZxsDZbRdHVoQ6VSdi
         k1xnvLGWe8afvaDI5muEYDf6R4OeqcNNa1XfxbqqbVEXK6gG8c/OY/3FsuQqIg/dbH65
         Cy7Q==
X-Gm-Message-State: ACrzQf2w6EZFip7ljajRzTWdybVRhzOdv/5gXuo5CvHQ9lfT/0uoij+v
	q0StPO/PpK4C4Q5z1RnflYYdbZmApRTuWymMiaY=
X-Google-Smtp-Source: AMsMyM7z79XYLFv8C+L2iVUCK9GWrcIWX4GjU/v+F7Cu1Skg4mwh2lxOmMtuXkewrin9MpM19253XVlzrhss+WWo0XE=
X-Received: by 2002:a5d:4ec3:0:b0:22e:2f18:35cc with SMTP id
 s3-20020a5d4ec3000000b0022e2f1835ccmr4988959wrv.628.1664781178633; Mon, 03
 Oct 2022 00:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <Yzda9uALobTbT7B/@hatter.bewilderbeest.net> <CA+J-oUuhA_akVPbTp=ARqJOaaFp6j43QakSiyjMiNz8NGpVZYQ@mail.gmail.com>
 <HK0PR06MB2834AE1581020A5B7CE191839C5B9@HK0PR06MB2834.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB2834AE1581020A5B7CE191839C5B9@HK0PR06MB2834.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 3 Oct 2022 07:12:47 +0000
Message-ID: <CACPK8XfYg9SO81=1B1TVy0NO7LzMWc7TsRXVEFcN7c+0J-31hQ@mail.gmail.com>
Subject: Re: [Phishing Risk] [External] AST2500 u-boot breakage with CONFIG_RAM=y
To: Dylan Hung <dylan_hung@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Zev Weiss <zev@bewilderbeest.net>, Andrew Jeffery <andrew@aj.id.au>, ChiaWei Wang <chiawei_wang@aspeedtech.com>, Zhang Jian <zhangjian.3032@bytedance.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 3 Oct 2022 at 04:09, Dylan Hung <dylan_hung@aspeedtech.com> wrote:
>
> Hi Zev, Zhang,
>
> Aspeed recommends using "CONFIG_RAM=n" on AST2500 since platform.S is created by Aspeed.

Can you send a fix to your SDK (which I will rebase into the openbmc
tree) that makes it clear that CONFIG_RAM=n means it will use
platform.S?

It would be even better if there was only one way to do the DRAM
training in the tree. Could Aspeed look at improving this?

Cheers,

Joel
