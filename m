Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0842134B830
	for <lists+openbmc@lfdr.de>; Sat, 27 Mar 2021 17:37:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F74JG0G7Vz3bs3
	for <lists+openbmc@lfdr.de>; Sun, 28 Mar 2021 03:37:34 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F74J41yklz2xy9
 for <openbmc@lists.ozlabs.org>; Sun, 28 Mar 2021 03:37:24 +1100 (AEDT)
Received: by mail-ot1-f45.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso8203455otq.3
 for <openbmc@lists.ozlabs.org>; Sat, 27 Mar 2021 09:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vgFEHGoYmLfdBLAiP7XDtRZUaEmAlO6eOy14gTHW2m4=;
 b=R8Sv3Pp/MO/eHQDnSspMydJOXOhClvqHWr5pM3I07rqgrae7jR71L6qn4tnWf6FIGY
 1CgUE6YHjIe1lTatTKDTvmzRFLSwbbyJgYFirVCk3qzEIDL6VHlh7iGA04nDL2pQqX5P
 twFWMKFdMg7RIjJD64Ns0VbAEh7ic8HpRvf//en5HCI1k9k1yqPqmVzPfDf4UxV1DBX2
 TVJjPIPnA8ksszHL2fzyQlKTW3L+YuM/Id+cw0EeD1o01x7AfDc8EfVSXVkUpN7oqfuG
 quRWB4wySVu4hgN90aHDMDBqTiHwlviaig/Nn1RdzhduSt6OthjiqG7fmWW0s44fZk7A
 lH9w==
X-Gm-Message-State: AOAM531ArsnXED+QuCqlbYUP1YCBqCFGE9tj79It8v+KbWvvp9RF0nsO
 NOFDTE8td49hISEMcQAtDw==
X-Google-Smtp-Source: ABdhPJy5jLXhU+gItOWEzaeGYu0Cpa2unmGzWLkGH1VfRQypN0ck9cBpQp1VmdkOoH/lBtGW5GYcZA==
X-Received: by 2002:a05:6830:109:: with SMTP id
 i9mr16302124otp.47.1616863041915; 
 Sat, 27 Mar 2021 09:37:21 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.140])
 by smtp.gmail.com with ESMTPSA id z199sm1643158ooa.39.2021.03.27.09.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 09:37:21 -0700 (PDT)
Received: (nullmailer pid 212517 invoked by uid 1000);
 Sat, 27 Mar 2021 16:37:16 -0000
Date: Sat, 27 Mar 2021 10:37:16 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 03/14] dt-bindings: interrupt-controller: Add nuvoton,
 wpcm450-aic
Message-ID: <20210327163716.GA212468@robh.at.kernel.org>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
 <20210320181610.680870-4-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210320181610.680870-4-j.neuschaefer@gmx.net>
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
 Avi Fishman <avifishman70@gmail.com>, Marc Zyngier <maz@kernel.org>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Patrick Venture <venture@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 20 Mar 2021 19:15:59 +0100, Jonathan Neuschäfer wrote:
> The WPCM450 AIC ("Advanced Interrupt Controller") is the interrupt
> controller found in the Nuvoton WPCM450 SoC and other Winbond/Nuvoton
> SoCs.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  .../nuvoton,wpcm450-aic.yaml                  | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/nuvoton,wpcm450-aic.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
