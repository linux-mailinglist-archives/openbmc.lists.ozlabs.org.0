Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 308CD34B827
	for <lists+openbmc@lfdr.de>; Sat, 27 Mar 2021 17:36:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F74HL1854z302W
	for <lists+openbmc@lfdr.de>; Sun, 28 Mar 2021 03:36:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.179;
 helo=mail-oi1-f179.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F74H94MtQz30DX
 for <openbmc@lists.ozlabs.org>; Sun, 28 Mar 2021 03:36:37 +1100 (AEDT)
Received: by mail-oi1-f179.google.com with SMTP id n8so8930696oie.10
 for <openbmc@lists.ozlabs.org>; Sat, 27 Mar 2021 09:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qFbUkW6r9j3+DNwYmMXAzHmOSal7Nsz8qw3jTrj+nfQ=;
 b=BwML1KEiMgkhDDau+8XCCsoKhjgMgRIc5q9tYtYkdebvos1y3fA1ZGOJkaUVZWIKpI
 0jKhE1mlYIs1xZn3Z3K6BgXq/GO7PfygCnK0uBEdjZ3jfBjqKTgWa2G0z5h4ZdkbMXyH
 sQdAdOMae2OYob0A3xm0S5/DWAL86surBuLo/EvLwhNfdqPVZSDPyUr4DEItWhfKYwsZ
 GWscQ4nJjwYsxfcHar43Nm86a/huX8eYKpeAG+KdYJ1a1oWNTIVRj2vxpLpE0BIURQ18
 ESTum8FGtE0WEFrO3y+NBHkulYbbQchc2Bkwjtw+cNWI/MDYF8sr7GtcW3bkx07757WG
 a4zQ==
X-Gm-Message-State: AOAM5338uPX7ChGWkm8SspDaFtPbu8pFdQfwpRFAYDrTZsiA4Z/hkhZr
 YgBZ0GAFdmf5OEIzlftQFA==
X-Google-Smtp-Source: ABdhPJzIlSKn0efAGI+v5EEMnYuN1WqKZ85QmF8LK5oghKxGT+1ZrJfmZHWAtr8G6EtMOvPqUL10Qg==
X-Received: by 2002:aca:3bc4:: with SMTP id
 i187mr14140035oia.174.1616862994960; 
 Sat, 27 Mar 2021 09:36:34 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.140])
 by smtp.gmail.com with ESMTPSA id o6sm3082470otj.81.2021.03.27.09.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 09:36:34 -0700 (PDT)
Received: (nullmailer pid 211432 invoked by uid 1000);
 Sat, 27 Mar 2021 16:36:31 -0000
Date: Sat, 27 Mar 2021 10:36:31 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 02/14] dt-bindings: arm: npcm: Add nuvoton, wpcm450
 compatible string
Message-ID: <20210327163631.GA211376@robh.at.kernel.org>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
 <20210320181610.680870-3-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210320181610.680870-3-j.neuschaefer@gmx.net>
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
Cc: devicetree@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 20 Mar 2021 19:15:58 +0100, Jonathan Neuschäfer wrote:
> The WPCM450 is an older BMC SoC in the Nuvoton NPCM family, originally
> marketed as Winbond WPCM450.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
> 
> This patch requires "dt-bindings: arm: Convert nuvoton,npcm750 binding to YAML"
> (https://lore.kernel.org/lkml/20210320164023.614059-1-j.neuschaefer@gmx.net/)
> ---
>  Documentation/devicetree/bindings/arm/npcm/npcm.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
