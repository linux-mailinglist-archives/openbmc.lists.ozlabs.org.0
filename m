Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F26305F9F09
	for <lists+openbmc@lfdr.de>; Mon, 10 Oct 2022 15:02:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmJwS6vpNz3dqV
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 00:02:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ebX7d6St;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ebX7d6St;
	dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmJvs4ypMz3c5G
	for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2022 00:01:43 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id q9so20199933ejd.0
        for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2022 06:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E8Jjr1RJl+ZdRt0o4JcYHzYyppV5ZU4L+MLr7qEV0+g=;
        b=ebX7d6StlNsgXLP2HmfTJ00C+dB3uaaJS7q8fhrsUBcOn0mz4qOZm/xTvKfp6eFl2B
         Q9YdDh3gZbm/zAyT8PHS366S0tmIlYtSNIeNj8aynG1AVxPoWyf+RZ/xdjjtJP3nZVlF
         E4ktcpmfWYskopVt3gzHBvAh8dOsY3RFpQm4jiPMnfDfrqT3wPpIbqITzy8YqI0mJ97Q
         R501TJ5ESB/U4GqeckRS1KgYP/yODUsN4zf/vyrwTMTnpxK2kwhViNgXw0My/5PFtmAa
         KiCdFOLHUo9ZcbMj7pK8yftTUqQJ3m5T1KrS94EjdfdJYdzFnZPqSG9LAtfZliSxmqaS
         V+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8Jjr1RJl+ZdRt0o4JcYHzYyppV5ZU4L+MLr7qEV0+g=;
        b=U1HSjbfI6DhjNacYmIjkBTJmkmum0G2jCLpcK06QXb3w7P3Ewt78FOHnVaTjcCr7jc
         Gmmkn6EQzzO1wqlz1L/8xyHRGejveRPTJz30AFnAamtz1BrQ4/gSnwtUV9X+/dVD+j5e
         pAwNIz8aimVhEnhXmFeeL3QeEXcEh1sj7zSpUzZWtounmZLVC74sWny43ChY90shq0GD
         HuC/7VOOJs9WvKcHKXeazOEHWjCR2sCHvaijXJrJgyms25PG6MrjHD2lOSRdYZrEPROo
         GyTcad12eEJsGIQl1XgVEYG01p3bXyU85DqyGbBc1lLd9H9msGAew/xoiFXE2Y2zI4qg
         jsRg==
X-Gm-Message-State: ACrzQf0tZjAH1O0Cpoe9RBiXIi7wi5K9nYwKGofxMUTYz8Gz3P9iLaqY
	Xkgh/H4I7h3iugJ9Qn5KaJOUDMmjL/A+jwmvsDFmCrYg2Cw=
X-Google-Smtp-Source: AMsMyM4o+Rsee0DxPNe44lFARn7fZ24Cw7raR/9gK5qapvTlsdvlXqxJqfAbpdlWSKKSBe/4aPhA9/Ctbqkcpzu8Duk=
X-Received: by 2002:a17:907:60cb:b0:785:4ec0:551f with SMTP id
 hv11-20020a17090760cb00b007854ec0551fmr14480369ejc.179.1665406896767; Mon, 10
 Oct 2022 06:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221007025413.3549628-1-milkfafa@gmail.com> <Y0AsbVvZA+VQVfcP@probook>
In-Reply-To: <Y0AsbVvZA+VQVfcP@probook>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Mon, 10 Oct 2022 21:01:25 +0800
Message-ID: <CADnNmFq-_pVFSDRFJ07HAt0Z+=CMwbHaiSPamaJiUXOU9haD-g@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Support Nuvoton NPCM Video Capture/Encode Engine
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org, tmaimon77@gmail.com, kflin@nuvoton.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jonathan,

Previous patchset was aimed for torvalds/linux and we would also like
to upstream to openbmc/llinux.
So this new v1 patchset is specifically aimed for openbmc/linux branch dev-6.0.
https://github.com/openbmc/linux/tree/dev-6.0

Regards,
Marvin
