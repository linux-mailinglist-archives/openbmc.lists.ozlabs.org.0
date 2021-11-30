Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7DD4628E9
	for <lists+openbmc@lfdr.de>; Tue, 30 Nov 2021 01:10:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J32gH2jmsz3bYW
	for <lists+openbmc@lfdr.de>; Tue, 30 Nov 2021 11:10:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.45; helo=mail-ot1-f45.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J32g26L08z2xsC
 for <openbmc@lists.ozlabs.org>; Tue, 30 Nov 2021 11:10:38 +1100 (AEDT)
Received: by mail-ot1-f45.google.com with SMTP id
 x19-20020a9d7053000000b0055c8b39420bso27869190otj.1
 for <openbmc@lists.ozlabs.org>; Mon, 29 Nov 2021 16:10:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BfT/WXu+oBPn90BqESxoluCQ1NS0bMYxKosATh1kf4c=;
 b=AKnItvPW9MrsKyOHW48Z7G3GzFnotFmZYc/FL7gfTe+4a7YKpGRL8d2qB9zjXu+GzM
 xXY32pxEx2iKOjSLuuNztJ8gxrE2eXM1AxnKFYlW2kebWVcvIfCclhwkR9583kQxyfhQ
 HpKMUCOeKPa8MdqqM662qOhbJus8uGOM4RIg25USJTFxUzowWlPEM7TQKlTiX6o0RBVC
 nSIyA2FiyPsF55lXchKtEMRG6MtLC6a5xVqb2L/hV7y2iMRYWbG2jNZtm3Ry1ore15hR
 RF81FdatjE5UY9xOZBCXv1v/Zu3Z1mHpHWouZqTP1valg/r/aTGuQpwaqETSw9E3mbKd
 mm9A==
X-Gm-Message-State: AOAM533O1XHcDnAbffLAnOKu6ACKW/EeRVstVVS24v6rECft2evJPHhE
 Z2oW7uG8HgxPe17CTuYPvA==
X-Google-Smtp-Source: ABdhPJztnm7QqJ7ifzj6MRk5SqJtMNEAD0q+7CcbJ3DOuN6q6VkYTx1+zVsSpQaR+kiuFw2WnWvXew==
X-Received: by 2002:a9d:2077:: with SMTP id
 n110mr46214184ota.261.1638231036370; 
 Mon, 29 Nov 2021 16:10:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s9sm2998557otg.42.2021.11.29.16.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 16:10:35 -0800 (PST)
Received: (nullmailer pid 868068 invoked by uid 1000);
 Tue, 30 Nov 2021 00:10:35 -0000
Date: Mon, 29 Nov 2021 18:10:35 -0600
From: Rob Herring <robh@kernel.org>
To: Andrei Kartashev <a.kartashev@yadro.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: vendor-prefixes: add YADRO
Message-ID: <YaVr+2iGzeWNYF0G@robh.at.kernel.org>
References: <20211119120057.12118-1-a.kartashev@yadro.com>
 <20211119120057.12118-2-a.kartashev@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119120057.12118-2-a.kartashev@yadro.com>
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
Cc: andrew@aj.id.au, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 19 Nov 2021 15:00:56 +0300, Andrei Kartashev wrote:
> Add vendor prefix for YADRO (https://www.yadro.com/)
> 
> Signed-off-by: Andrei Kartashev <a.kartashev@yadro.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
