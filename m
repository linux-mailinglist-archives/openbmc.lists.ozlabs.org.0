Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 421A37425C7
	for <lists+openbmc@lfdr.de>; Thu, 29 Jun 2023 14:20:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RV1lqe1x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsHb31Bfsz3bYx
	for <lists+openbmc@lfdr.de>; Thu, 29 Jun 2023 22:20:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RV1lqe1x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::929; helo=mail-ua1-x929.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsHZR3qxgz30fp
	for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2023 22:19:42 +1000 (AEST)
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-78cee27c08aso200936241.2
        for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2023 05:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688041179; x=1690633179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TGv78mKGzB1Ok9tyfdClls4DVuXjLXhxTceQ76I/LfY=;
        b=RV1lqe1xUgZ170NuxsH+Zfi6fdVox6x1HcE5zlTgTdOOf+DwUdy6UhEleH1Yiyqi/B
         qwV8T/rZRq7Bl+yOrz0+an491UMneurdnbcq42CjpAUGoLcNM/2sg7dmTgsgSJ50TUE5
         a7TaS8GXWBQ2hK4oVtvkEyc4utf5efp2og9SvsmQhXe0beL/0cFflVJ9Flr8LU0BQQLx
         vk8lpYgyDk4YtjiIMtWw4mKTzBCm33gX+dq3DjBbIdTLIAGhDtm1FuXzvuMVBUIbgHV9
         9CUtrttt9LTRnfuxxJHV0IKoZtAvL32vMVoROfqm5kmS3L5UzrJfqnfyFQhl+ayPIls4
         tTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688041179; x=1690633179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGv78mKGzB1Ok9tyfdClls4DVuXjLXhxTceQ76I/LfY=;
        b=IchUpjvwYapE0lmnFBjCuiO/5Ax6845xQ2tNg/j4o+Cvrg/mGcPdloJ/qrWwJyqhky
         LT72LxMGujHg4Tkw7aIhJS4Bbb5K+Ijvp7Bkn5lii5NlYZA8RfR3iE8Cwc26CtvFUd+r
         AnhLUKU3EQSeXc9DAyzJ2FR9Jbb3/lswH/3TF2wsYGXB1iOZ7Y/I5pxIiw5x+iBLf+DG
         0lOr+tt/baI4P0dOzDYeRIcR0Ap+EI/azPF1x28hfwIkl2od5lFol+W8KJM93M/5QWts
         J+0fMBH1OlFOW57PFeKjHrAwyTXEnEJoMdYSktG7692hzKptArnACEgc1I/5bVe7yG66
         5i+w==
X-Gm-Message-State: AC+VfDzyvHTrnClub3HDwqYSS521eJnXQCsIZVHpklx61pgMzTcSAY62
	0ZZhN+hPfDwanXJNVWVIIPYv7sAmjd6xf4bNkp4=
X-Google-Smtp-Source: ACHHUZ6v6+1aaPN/DZCIV2mVThVjW3Ef7xPdSSOAu5cyWd8b4TbcBikkHfY5x7c4ThKdZr4KjZhxvpm+j5T7sx/1v6s=
X-Received: by 2002:a67:ea8f:0:b0:443:6b64:aed4 with SMTP id
 f15-20020a67ea8f000000b004436b64aed4mr7137772vso.26.1688041178729; Thu, 29
 Jun 2023 05:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230207091902.2512905-1-milkfafa@gmail.com> <20230207091902.2512905-4-milkfafa@gmail.com>
 <867ec517-ef29-e8ac-8e0c-6f7ca440cf3d@linaro.org> <CADnNmFpf8kMeHYrUcab5Mg3P0zZ=kUi3o8bLCz-EdyAHVKoLNw@mail.gmail.com>
 <c4676e35-322c-7091-65d0-4e50ba04ca85@xs4all.nl>
In-Reply-To: <c4676e35-322c-7091-65d0-4e50ba04ca85@xs4all.nl>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Thu, 29 Jun 2023 20:19:27 +0800
Message-ID: <CADnNmFrw08stAZ8BvpP7y6EyrG7Dd_UQ9em8QqvghVLQmQmwdQ@mail.gmail.com>
Subject: Re: [PATCH v11 3/7] dt-bindings: arm: nuvoton: Add NPCM GFXI
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, kwliu@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-media@vger.kernel.org, tali.perry1@gmail.com, andrzej.p@collabora.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, mchehab@kernel.org, kflin@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Hans,

Sorry for the late response.


> > I'll move it to Documentation/devicetree/bindings/soc/npcm/nuvoton,gfxi.yaml.
>
> v12 still has this in the old location, so it appears you forgot this.

Thanks for the reminder, v13 will correct the path.

Regards,
Marvin
