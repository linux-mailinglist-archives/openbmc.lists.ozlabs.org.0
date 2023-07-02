Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26487744E0F
	for <lists+openbmc@lfdr.de>; Sun,  2 Jul 2023 16:15:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NpObGSVM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvB0l06QGz3bNj
	for <lists+openbmc@lfdr.de>; Mon,  3 Jul 2023 00:15:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NpObGSVM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvB093RTpz30Kf
	for <openbmc@lists.ozlabs.org>; Mon,  3 Jul 2023 00:15:05 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b69a48368fso54346911fa.0
        for <openbmc@lists.ozlabs.org>; Sun, 02 Jul 2023 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688307298; x=1690899298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Opz511r+vchZJJjWWWL1W8FxkA7pRTLlQCXebL0fo08=;
        b=NpObGSVME9Dk9ZbUx6Z/jbdYP5amDTOgByGSYHWGAbWItlWa8/UDR5JKgxTZEnhlJH
         al6Bgc1soRQlYtZ0k3yYEHar6agsLjdwnVPQVK0g7TxuF4QhheMeErQ5ExnaXKemA9st
         44hak25y6U+vBHqOUMbIwp6uRV3QyxGLe2vZ7bCPLCka0F6SmUtQW8FE/WdX2FsXp22r
         1LOfV/+itoR30uF8ft1K9vM6iK2zft0vbpIgQ5dqIjbVDULGTKm2dRPQo1gzxJLCOMIk
         dVHcPmEpInK1VbOP9vTuK4mV7rtNzgJboqzkGwjCwPmo0sgppihSyeTcBRYc9O5wgVXJ
         P47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688307298; x=1690899298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Opz511r+vchZJJjWWWL1W8FxkA7pRTLlQCXebL0fo08=;
        b=EorJ+6ezQCr6ZLOA4OS9ecBXGlqD+5lzuuL8RS8gHv69oUcHJyMppdypziNcYskhpV
         Jdoyvf99VoabSFNM4hWcjd9yEWpIygiIojwQ1vdOv1nWFaCEwXysqXu83hA/GTGEEIBu
         JSoIxRzMI/+4qKNys+4kLzKz32Mf7lf72TcnuNcIdQ+gSta0kQjFySTkO+G0K7smJuea
         HLMeOSAHjjE0MxyzglQMLTUN3rTuDcyUoXJBopse9nnwygYYdZ4nmzYFrJ2yt5qulKYT
         77tJrIXa4gxmYB3wfd5wsJnK1W0FZpcbIl+FJgek75AWqt5D4wzkLBLy2Qkr3oz7bPav
         0ZBg==
X-Gm-Message-State: ABy/qLYcHHIFuWkgEzaeY2VkfntcuMEw8hXNyXKYhYAN9a+XjGma7GCD
	CxIPQz8wyrFmXg+9n89tgJFzu/RQ1DgfK7wa7BM=
X-Google-Smtp-Source: APBJJlELwNViyYnUvfOEnaRNVI3JlGBqINBju8wuYaKVlMDJqM+tqoKMZNCYjHfPaepTM2JFn8qluPanszqfpdN7KcU=
X-Received: by 2002:a2e:95d9:0:b0:2b5:8153:deb3 with SMTP id
 y25-20020a2e95d9000000b002b58153deb3mr5470856ljh.4.1688307298088; Sun, 02 Jul
 2023 07:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230628090404.234965-1-tmaimon77@gmail.com> <20230628090404.234965-2-tmaimon77@gmail.com>
 <815354f2-1503-4455-1e54-41978216d777@kernel.org>
In-Reply-To: <815354f2-1503-4455-1e54-41978216d777@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 2 Jul 2023 17:14:46 +0300
Message-ID: <CAP6Zq1gvAsTuyf9u0NNg7w-VcJ-EKmRnap9+=pxB2jm0ViZmTA@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.1 v1 1/2] dt-bindings: Add bindings for peci-npcm
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, kfting <warp5tw@gmail.com>, Iwona Winiarska <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

This patch sends to the OpenBMC Linux kernel and not to the Linux
kernel vanilla upstream, this is why I added in the message dev-6.1
and only send it to the OpenBMC mail list, please ignore it.
https://github.com/openbmc/linux

Thanks,

Tomer


On Sun, 2 Jul 2023 at 12:30, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 28/06/2023 11:04, Tomer Maimon wrote:
> > Add device tree bindings for the peci-npcm controller driver.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > Signed-off-by: kfting <warp5tw@gmail.com>
> > Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
> > Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
>
> My patch tracker found it, but the commit msg suggests this is not for
> Linux. I mean, you did not intend this patch to be merged into Linux
> kernel, right? Cover letter does not explain here anything.
>
> If so, please ignore.
>
> If not and you actually added some dev-6.1 by mistake, then regular
> disclaimer follows:
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC.  It might happen, that command when run on an older
> kernel, gives you outdated entries.  Therefore please be sure you base
> your patches on recent Linux kernel.
>
> You missed at least DT list (maybe more), so this won't be tested by our
> tools. Performing review on untested code might be a waste of time, thus
> I will skip this patch entirely till you follow the process allowing the
> patch to be tested.
>
> Please kindly resend and include all necessary To/Cc entries.
>
>
> The sad part is that I already said it to Iwona. I wonder if all the
> comments were ignored or something was fixed?
>
> Best regards,
> Krzysztof
>
