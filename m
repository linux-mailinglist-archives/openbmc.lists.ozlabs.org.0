Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF815A419C
	for <lists+openbmc@lfdr.de>; Mon, 29 Aug 2022 05:53:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGGks6061z3bl6
	for <lists+openbmc@lfdr.de>; Mon, 29 Aug 2022 13:53:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EbOKh9LM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EbOKh9LM;
	dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGGk30Fcnz3bkb
	for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2022 13:52:58 +1000 (AEST)
Received: by mail-ed1-x52b.google.com with SMTP id b16so8581675edd.4
        for <openbmc@lists.ozlabs.org>; Sun, 28 Aug 2022 20:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=i3P9yvcZ5w9JMjlHaA5/F93BbKF3hEM1ahs4PE9M3sU=;
        b=EbOKh9LMbPDhquOkY6YMTz7GEGWR8BQdmUe/hFPRalUfSmCBlFoBUeVaRDfwPdTYaV
         tW0Ke+svFy/1TG35d4XkmsssGORHSWaWeQSJGYLARCGoyZekbQVmVCzkyKsJUs8Kbz50
         13OVjkFXLZiHB/zBnBRgwyiBwb0DGcWicq0vxESy5yojgC5M+ig19TPHSHLQZ5BOVW98
         i5XBk/IOxwBBpBz6cQ2j/GDO00HBpM/Z7aWO8iJ4mTvN2IJb+bzs/m9cKSr8hDXeC9eK
         1jihznrGnU21jYVBlVrhl/WnVScOON0o8Yd2PtBg7CqNE70hpQn1y4ifwYZVvYXVRe9e
         +3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=i3P9yvcZ5w9JMjlHaA5/F93BbKF3hEM1ahs4PE9M3sU=;
        b=pSt1+YUbsB2R2H3iOvQpw6vPsqlBd/aLk9JkWzaIqtreTqNSa+5Ttlx3cqWIL6OQ7o
         9gbzlRnx8h9YbyejC+Mb5ODVWgGmcYKP4iptCOvPn16Oh5n7ibHYq5qqPqZZ2Kjj0JSN
         clDtzzYE8nOF9XK8j3yC0CyrqF7ZfymnOgl6efKYLLSl4wCAVvrV66mqNc6Jky4l1siE
         41VYQkh+Y9py0RtHIjAz/Ci+HziCFelYEi5G9dBfFO6JwIJQC3E6EILojLLbcctnSwRH
         aZjcC1P53twnLe6SdgzUzRS3hU/CnbHj1V7malYlwopEpxF38shSS7RGlvJo2H0TstN7
         il6A==
X-Gm-Message-State: ACgBeo1YVJPo75CvXsaq8tsWx0ox/TaV84jRflozGselALLKttQNlNd7
	TPhlNdq6l2VwCCc8MBJvPRYxCtYmtHgnr3dam14=
X-Google-Smtp-Source: AA6agR7gHwwO7J0rRiChvfQJve8VQ06faGb/93y5NKqE+1wlyC2GzzLvQxic3/P0jIdT/P1vktF+OzV/JS5XKJ3fcFI=
X-Received: by 2002:a05:6402:34cd:b0:448:8286:23f0 with SMTP id
 w13-20020a05640234cd00b00448828623f0mr1259550edc.40.1661745173471; Sun, 28
 Aug 2022 20:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220816094641.8484-1-milkfafa@gmail.com> <20220816094641.8484-3-milkfafa@gmail.com>
 <20220818144442.GB1829017-robh@kernel.org>
In-Reply-To: <20220818144442.GB1829017-robh@kernel.org>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Mon, 29 Aug 2022 11:52:42 +0800
Message-ID: <CADnNmFqPmr7Af1ROALPbfoj73p5d1bKjhYV+MuO9KhCQMk=FAQ@mail.gmail.com>
Subject: Re: [PATCH v13 2/3] dt-bindings: edac: nuvoton: Add document for NPCM
 memory controller
To: Rob Herring <robh@kernel.org>
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
Cc: CS20 KWLiu <KWLIU@nuvoton.com>, tony.luck@intel.com, rric@kernel.org, Benjamin Fair <benjaminfair@google.com>, devicetree <devicetree@vger.kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, KFTING <KFTING@nuvoton.com>, YSCHU@nuvoton.com, Borislav Petkov <bp@alien8.de>, ctcchien@nuvoton.com, James Morse <james.morse@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Marvin Lin <kflin@nuvoton.com>, linux-edac <linux-edac@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

Thanks for the review.

Regards,
Marvin
