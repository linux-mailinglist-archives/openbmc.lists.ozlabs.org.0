Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A392F7BF15F
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 05:23:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JIxhRmlj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Lpd3yknz3cP7
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 14:23:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JIxhRmlj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0HhT0zFTz2yN3
	for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2023 23:49:28 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3231df054c4so885871f8f.0
        for <openbmc@lists.ozlabs.org>; Tue, 03 Oct 2023 05:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696337363; x=1696942163; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dlhxrmRkRpeN3OD8U4BACgAdd1QbrxInrsx8HMZ5kJg=;
        b=JIxhRmljG3gFRwGQGJioo6W9ZLjqDWIgZWMPHncGvaD9jTMBF2GlV7aE9PznllXpd3
         +ZJwDiE6IplC0zXNXGxfO/PrgbBI+BMd1hrdsSk/Mp5pA8LJEHggwDaxhTtEpUGDNx3N
         VS1q3xYx2kaxxP+XAqkb0N6LkwRPEVYMnMsu8ucAiGBP9xzIMTo1SdrzMZ/koxqiJi0F
         NCF8Rki39wTAGL66eMYQ05YBQ+akdI5x07DamgegTarLFOzWUPzoQcBJqQvKiDg35zwa
         JxvKKpr5mT3sEiYtTU5zg/cDJQtaCpnjIM27I8ei4p1QF4vBLVVJuMbtBX+09AjbJD8s
         3/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696337363; x=1696942163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlhxrmRkRpeN3OD8U4BACgAdd1QbrxInrsx8HMZ5kJg=;
        b=U3danDrBsDW6xsEPgJTo59RRg31VEBal9L+7ZEGzoIs6TfFhJyNxmDK8SfzTuSJOHB
         6j67sJYQOaKEn4VMGf02RxV8Dw1xrJVMBAffMyZ+7emdMYeJcyQlZVRsnrrcceH+2Z6h
         SoJYaG+tfTgcRzWLVpJEIZMxtia1ovkET1MpQ+BQLIhn2MOctEFt+v/9xyQI0sWXaoKX
         9zZdPwms36Uq8FgHRoWYP9xbsymkRm0XrI+QHK/mdvfXoSJDXPkihhX+Ho72+E8JcaEf
         +DBo+CWr2yaItmjSQICVVSqzQlbT10JbDcPFsQEGzyAP/aBIJeWyvrgOPKrmzPNKIWPw
         96aA==
X-Gm-Message-State: AOJu0YzdBZe9hiwebOeUmPjNvycb5YWQpMdBPIYjW75V8tu9vZzvokF3
	UI7McACxWiQHuL77e0RFKa/GUw==
X-Google-Smtp-Source: AGHT+IHaooNR/TbU/A9B5ajdiCBcPIbTQ8DPZxIgHjk9yBVQj+gRRRWDV1SLznjSXOlY8aO5drEItQ==
X-Received: by 2002:adf:f302:0:b0:320:b2a:4ea6 with SMTP id i2-20020adff302000000b003200b2a4ea6mr13526615wro.9.1696337363023;
        Tue, 03 Oct 2023 05:49:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v8-20020adfe4c8000000b003247d3e5d99sm1522305wrm.55.2023.10.03.05.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 05:49:22 -0700 (PDT)
Date: Tue, 3 Oct 2023 15:49:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kun-Fa Lin <milkfafa@gmail.com>
Subject: Re: [PATCH] media: nuvoton: npcm-video: Fix IS_ERR() vs NULL bug
Message-ID: <dd71316e-18e6-47a4-a267-67328b1a1158@kadam.mountain>
References: <3134a802-75fe-49f3-bcd6-06addc2ffaf5@moroto.mountain>
 <CADnNmFrOeGxUL1U9eJngKpMpoVVZXN4Owxxo9Ee18tEYxZ6FhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnNmFrOeGxUL1U9eJngKpMpoVVZXN4Owxxo9Ee18tEYxZ6FhQ@mail.gmail.com>
X-Mailman-Approved-At: Tue, 10 Oct 2023 14:15:35 +1100
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
Cc: Joseph Liu <kwliu@nuvoton.com>, openbmc@lists.ozlabs.org, kernel-janitors@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Marvin Lin <kflin@nuvoton.com>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 03, 2023 at 08:02:33PM +0800, Kun-Fa Lin wrote:
> Hi Dan,
> 
> Thanks for the patch.
> 
> > The of_parse_phandle() function returns NULL on error.  It never returns
> > error pointers.  Update the check accordingly.
> 
> Commit message contains some redundant whitespaces.
> 

I have no idea what you're talking about?  Are you talking about two
spaces after a period?  :P

regards,
dan carpenter

