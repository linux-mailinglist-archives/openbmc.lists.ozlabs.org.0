Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 763C07D5CE2
	for <lists+openbmc@lfdr.de>; Tue, 24 Oct 2023 23:05:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SFPj73qfcz3cPN
	for <lists+openbmc@lfdr.de>; Wed, 25 Oct 2023 08:05:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.161.51; helo=mail-oo1-f51.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFPhp4ZgHz2xgw
	for <openbmc@lists.ozlabs.org>; Wed, 25 Oct 2023 08:05:12 +1100 (AEDT)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5842ea6f4d5so2712079eaf.2
        for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2023 14:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698181508; x=1698786308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9Jm9ApzQsIzZy9Gg4QWmLADDrD7P3P/rQ+FPHDJPLY=;
        b=Dvwhulm5M0qNNaqvvv3dqL6clscvlX2SeziJlJ3fgBgPZFJS60IWB2RlcuhhboJ++t
         DjZKNuOqOY57XLlvSkrDPWYj0fv3wQCEq6GMK9kyCEzR8S61oChXqzcrJz7q/ja7TGiy
         iG1y5vlQree9UEXx8LNP9k02CYPN4IdAGe7S8zOn4tbZ5ZC2yIvxc7tfL6/JdwmiiCRl
         IIweBTpcjhE8zbzaTaHbKo01GEjPhPCItsV79ImkoyG3ytoWn+Ukrcl9mIOQHKR/QwcT
         XdiJ95Z924/ve/Zw6HFV3u3k1HuDZTjV89f7fAfGy6hHXSym7ezKlWqH49QspU/pCvHW
         /isQ==
X-Gm-Message-State: AOJu0YxlMYWqG7y/RnscU22MGhKgOgJgeO5GURFc9QS7lEzW3hAlnfbu
	8XvfXY1qwtmPEopXd4PdRIrw3BMe0Q==
X-Google-Smtp-Source: AGHT+IF7Nx137HVm0cdS3eQV3tQRM+AfGLBpEp3+amIbNonfpHoo43OeYB/YL3TfKLtWBudotEAICg==
X-Received: by 2002:a4a:da54:0:b0:571:28d5:2c71 with SMTP id f20-20020a4ada54000000b0057128d52c71mr12909779oou.2.1698181508427;
        Tue, 24 Oct 2023 14:05:08 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e22-20020a4a5516000000b0057e54da7201sm2178503oob.35.2023.10.24.14.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 14:05:07 -0700 (PDT)
Received: (nullmailer pid 591081 invoked by uid 1000);
	Tue, 24 Oct 2023 21:05:06 -0000
Date: Tue, 24 Oct 2023 16:05:06 -0500
From: Rob Herring <robh@kernel.org>
To: Jim Liu <jim.t90615@gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: gpio: add NPCM sgpio driver bindings
Message-ID: <169818150576.590864.5480268670179831271.robh@kernel.org>
References: <20231024090631.3359592-1-jim.t90615@gmail.com>
 <20231024090631.3359592-2-jim.t90615@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024090631.3359592-2-jim.t90615@gmail.com>
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
Cc: devicetree@vger.kernel.org, linus.walleij@linaro.org, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Tue, 24 Oct 2023 17:06:29 +0800, Jim Liu wrote:
> Add dt-bindings document for the Nuvoton NPCM7xx sgpio driver
> 
> Signed-off-by: Jim Liu <jim.t90615@gmail.com>
> ---
> Changes for v6:
>    - Drop quotes for $ref
>    - Add and drop '|' for description
>    - Add space after 'exposed.'
>    - remove status
> Changes for v5:
>    - remove bus bus-frequency
>    - modify in/out description
> Changes for v4:
>    - modify in/out property
>    - modify bus-frequency property
> Changes for v3:
>    - modify description
>    - modify in/out property name
> Changes for v2:
>    - modify description
> ---
>  .../bindings/gpio/nuvoton,sgpio.yaml          | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

