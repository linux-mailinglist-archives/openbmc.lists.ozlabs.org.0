Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB53F067F
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 20:58:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4770pp5zwWzF3Hs
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 06:58:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4770p609x1zDsMs
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 06:58:04 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id r24so2445472otk.12
 for <openbmc@lists.ozlabs.org>; Tue, 05 Nov 2019 11:58:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=x/Pqzh0wjtCm8/DGrbF/d0ukivugFZC6wp2pNvyyKqU=;
 b=uPQLl8KrNeUeqcdNZrME/0kTYiVdhXUcwXapASqPcoZRXyzGHGHo2Ak9+K16JYckO5
 S4Tv58D1p9/a1bi3D654KcUCJTXCXWqWz2bdK+eMOzA7XpacNXgvxM+1Yh8Oq94izyVm
 t1OHveyZ6kP5Avgqmzuqmgttu9eoah8k5c2YRjD1eqNAklXxX3L1pTHoETYGHKojKveg
 ZMCVEZ7bISrS4nP2E0KDhcxBlxobUhGZoYyL88nNaH+9d5s2a9ZG9dCNNyBmMYrXi49u
 ZnFn60wXOPiNP+wc1Fk0gMtJVSO+QtVKtGN42vP4xNuTZpAIZITEPxRz8fNOiuzNrJyo
 bL6w==
X-Gm-Message-State: APjAAAXg20U5ai1vh402JRa8SLDi1txAE0+DB7n0obMi07deIT/Zewdh
 4gJtE4jKToCBVxXJqxXv7w==
X-Google-Smtp-Source: APXvYqzVTpLLqzm+L3XsD+1vas5TRGDVn3vLjnHeqDn40MYgszVtjMGB2hevWDiXQ0kvMy5d6Dbxrg==
X-Received: by 2002:a9d:5617:: with SMTP id e23mr3940969oti.208.1572983881547; 
 Tue, 05 Nov 2019 11:58:01 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c20sm1533138otm.80.2019.11.05.11.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 11:58:00 -0800 (PST)
Date: Tue, 5 Nov 2019 13:58:00 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v3 1/3] dt-binding: reset: add NPCM reset controller
 documentation
Message-ID: <20191105195800.GA16739@bogus>
References: <20191031135617.249303-1-tmaimon77@gmail.com>
 <20191031135617.249303-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191031135617.249303-2-tmaimon77@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, benjaminfair@google.com,
 avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 31, 2019 at 03:56:15PM +0200, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM reset controller.

'dt-bindings' for the subject.

> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/reset/nuvoton,npcm-reset.txt     | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
> 
> diff --git a/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
> new file mode 100644
> index 000000000000..6e802703af60
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
> @@ -0,0 +1,32 @@
> +Nuvoton NPCM Reset controller
> +
> +Required properties:
> +- compatible : "nuvoton,npcm750-reset" for NPCM7XX BMC
> +- reg : specifies physical base address and size of the register.
> +- #reset-cells: must be set to 2
> +
> +Optional property:
> +- nuvoton,sw-reset-number - Contains the software reset number to restart the SoC.
> +  NPCM7xx contain four software reset that represent numbers 1 to 4.
> +
> +  If 'nuvoton,sw-reset-number' is not specfied software reset is disabled.
> +
> +Example:
> +       rstc: rstc@f0801000 {
> +               compatible = "nuvoton,npcm750-reset";
> +               reg = <0xf0801000 0x70>;
> +               #reset-cells = <2>;
> +               nuvoton,sw-reset-number = <2>;
> +       };
> +
> +Specifying reset lines connected to IP NPCM7XX modules
> +======================================================
> +example:
> +
> +        spi0: spi@..... {
> +                ...
> +                resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_PSPI1>;
> +                ...
> +        };
> +
> +The index could be found in <dt-bindings/reset/nuvoton,npcm7xx-reset.h>.
> --
> 2.22.0
> 
> 
> 
> ===========================================================================================
> The privileged confidential information contained in this email is intended for use only by the addressees as indicated by the original sender of this email. If you are not the addressee indicated in this email or are not responsible for delivery of the email to such a person, please kindly reply to the sender indicating this fact and delete all copies of it from your computer and network server immediately. Your cooperation is highly appreciated. It is advised that any unauthorized use of confidential information of Nuvoton is strictly prohibited; and any information in this email irrelevant to the official business of Nuvoton shall be deemed as neither given nor endorsed by Nuvoton.


We can't accept patches with this footer.

Rob

