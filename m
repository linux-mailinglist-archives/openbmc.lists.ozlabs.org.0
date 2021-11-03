Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D412443CBA
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 06:32:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hkb4z6LHnz2xtW
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 16:32:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=My3bvg3Q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29;
 helo=mail-qv1-xf29.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=My3bvg3Q; dkim-atps=neutral
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hkb4c0H1tz2xYL
 for <openbmc@lists.ozlabs.org>; Wed,  3 Nov 2021 16:32:15 +1100 (AEDT)
Received: by mail-qv1-xf29.google.com with SMTP id g25so1700292qvf.13
 for <openbmc@lists.ozlabs.org>; Tue, 02 Nov 2021 22:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rnb59w6Xzs13/8+G1cLeMR9w/s64xAZ+gafv9v1Yq/g=;
 b=My3bvg3Qrx9QApolZPpnOllfcyZunoKDBFjW0st1PN1/lLan9mUeu1/NY4vsbgHJj6
 EAdc4bVC7i2k2KR7LPoPv6yHjEzBY13bENImO6LTkzaApSotnVyxNIjISwB2JTXai0iM
 Y1hJeX4MHI7urCjRS/vkkGSe+d63LyCakPyLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rnb59w6Xzs13/8+G1cLeMR9w/s64xAZ+gafv9v1Yq/g=;
 b=43spO/U7qNzKHb/79mL83v0cwXOWR+SuyzsQKq0qX+O7iBHjpuDfoW54duVkzcq7xC
 j4vdE1EoU4AlxZ1bIsNm/+jAXtYkgQ3oFlkjlo2riz2c+mpNnvo9VenND5bMvsyTBP84
 l4h4j86wMP+HgXdDDtMgCS6zzo31OtsQ0Babxs6dNWTvMjMoouroxzBS0qyi2iLKjXje
 Ghafhh5/HD0hWUyYI0RwT+JplOPp4kC7YZu0KCy3+kESnuLQLcSyY45LUqZM+6oDu2cl
 6dwD/hrFNzUmXRmuh2HnJ53O+yIso3igrlz/qOS+ooizj3wBVEDeCfphHePjX1vNJ2Qb
 CIlQ==
X-Gm-Message-State: AOAM532B1JoaEPSx+XI0W+G+DYDG3OvmLlgp1jNkieGMnopSKlKCDkd5
 hFC+S309P9T4ON81XY9lpxXdU534eXeyzbmYVL3N+W95
X-Google-Smtp-Source: ABdhPJzD67LRExkNfMqIiX+FFpCj+2hGizDZ4C8JoKmhoRPluyHP9hmnnxOIpK/yaU1CcpsRTZC7FCWSK/uNwPlO24U=
X-Received: by 2002:a05:6214:5002:: with SMTP id
 jo2mr40404285qvb.27.1635917530242; 
 Tue, 02 Nov 2021 22:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XcnJ1HLgxdCVMvZ5Z82uxakeBqPWf7+J3QT_o8jp3c_qg@mail.gmail.com>
In-Reply-To: <CACPK8XcnJ1HLgxdCVMvZ5Z82uxakeBqPWf7+J3QT_o8jp3c_qg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 3 Nov 2021 05:31:58 +0000
Message-ID: <CACPK8XfLw7TTBmKUMzrcmtDnLHbO2+CMz-en3BUoKZdcOyA2yA@mail.gmail.com>
Subject: Re: Kernel moving to Linux v5.15
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 1 Nov 2021 at 07:16, Joel Stanley <joel@jms.id.au> wrote:
>
> The openbmc kernel will move to a v5.15 base. There are 73 patches in
> the tree, not counting changes that will be merged in v5.16 which have
> been backported.
>
>  https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48487

This has now been merged. Please address patches to the dev-5.15 tree.

>
> I have rebased all patches from dev-5.14, but have not tested or
> bumped Nuvoton as no one has done any development there since the last
> rebase.

Tomer has contacted me off list with plans to resume upstream development.

Cheers,

Joel
