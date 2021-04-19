Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D22A0364DC4
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 00:42:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPMJh5hGSz2yxx
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 08:42:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=EhtpX9mO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82a;
 helo=mail-qt1-x82a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=EhtpX9mO; dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPMJS6wnTz2xVt
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 08:42:14 +1000 (AEST)
Received: by mail-qt1-x82a.google.com with SMTP id m16so26755142qtx.9
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 15:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Vefsx3Vfq1yUbJBlnJZpmirNcBYH/7eGfhcA0M49Wg=;
 b=EhtpX9mOwVApB4zqCpjSB3poFa92fFamvtS2ae4dSroIX04dRXqHy9bWHZF4WXTebT
 FtA2YF6q31Ygnnb2BheVyfF3GMFYZNGPMt/fCLUnFvnikvEwHM1aHj3VeLEmyfj+tMkr
 hy0l/1jr2XzQvYVuuP142QHLCaRt3Xr+7BfJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Vefsx3Vfq1yUbJBlnJZpmirNcBYH/7eGfhcA0M49Wg=;
 b=I4tKevDrDA2UH7FKHUg1Q1MBVNTwFszcQ8oDv+W6C22ync7Pur5hYloavo4AHfekAa
 kDhpAN4iIP7x5jYW0au5FDL9t5QAF8KJkukLMMd+JsCdjoSiIBJ5H75lkvLt68lBRLLi
 z/Rt7dfB6Yj2ijVshngWJ6e4o+EbsfMa0jKClZMlnyJS5o9xCZ0nE+xrgTADju6esVBN
 JeCw6R3z9Z9vaLrUFdVUFvrIGhN08U62FWHfb33hkH+XmHN9AL0lYesJlrzXQjVr7w/6
 DZ94JcmF4hxD5wLz54gn9eSqeGXZNYCPwOTNIcRUR10ZZ4d9T/8tVCcYYYKY82rDlETb
 w5dw==
X-Gm-Message-State: AOAM531gZxXZ5G9LZN2L0z+8TN+Y65TxfvjHNOJIft49z5IPm2ZKPulc
 qC9zSKtybMqtuHhbBU8dDfAOGBbfUiyWnAXgpw0=
X-Google-Smtp-Source: ABdhPJxJ6a55qKeq5FpGBwXOFNqPUKnCQoFfS3i91jNADCuuhnTgXBV5QAaWfKH6/H7CHRnAWUKpzZh1ZdD7jtVqhko=
X-Received: by 2002:a05:622a:589:: with SMTP id
 c9mr14087563qtb.363.1618872130652; 
 Mon, 19 Apr 2021 15:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210419184533.4058-1-mohaimen.alsamarai@fii-na.com>
In-Reply-To: <20210419184533.4058-1-mohaimen.alsamarai@fii-na.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 19 Apr 2021 22:41:58 +0000
Message-ID: <CACPK8XdrTURBPZ5CcFr7H50=TfTFrOizbO7-qzjDqoB+U1Tcog@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8] Add device tree for the Kudo BMC. Kudo is
 an Ampere (Altra) server platform manufactured by Fii and is based on a
 Nuvoton NPCM730 SoC.
To: "mohaimen.alsamarai@fii-na.com" <mohaimen.alsamarai@fii-na.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vivekanand Veeracholan <vveerach@google.com>,
 Lancelot Kao <lancelot.kao@fii-usa.com>,
 Benjamin Fair <benjaminfair@google.com>,
 Mustafa Shehabi <Mustafa.shehabi@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On Mon, 19 Apr 2021 at 18:45, mohaimen.alsamarai@fii-na.com
<mohaimen.alsamarai@fii-na.com> wrote:

Please include a commit message here.

Also note that this targets dev-5.8, which is no longer maintained.
Please target dev-5.10 or mainline for your patch.

> Signed-off-by: mohaimen.alsamarai@fii-na.com <mohaimen.alsamarai@fii-na.com>

This person needs to fix their git config:

 git config --global user.name "Mohaimen Alsamarai"

> Signed-off-by: Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>
> Signed-off-by: Lancelot Kao <lancelot.kao@fii-usa.com>
