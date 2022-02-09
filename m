Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E544AFF66
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 22:47:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvD4Z700Vz3cBx
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 08:47:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.181;
 helo=mail-oi1-f181.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvD4G5JxWz2xtp
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 08:47:08 +1100 (AEDT)
Received: by mail-oi1-f181.google.com with SMTP id q8so3951719oiw.7
 for <openbmc@lists.ozlabs.org>; Wed, 09 Feb 2022 13:47:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TZ46TlKYTshX8RZZRBiPJL78zWYqEMH2598Ii/qKUQk=;
 b=S017Td0R1PyZY7tkZdtrGYXfXet43zJeI4EFxuO+vexb2O5irlY01fQcq+Nf/gmuYI
 f3x9USaDIYrCWqQJ9SN8dNl0nnRxy5WocBC/lqS1A13HBTZXr9rwsyRpNkMPWbXtiUsj
 RV2qD2DbNBXVwjI9BYHTZZK8VHUa94gA2IgpVshUv9ocSC7uwB+dai5JeZWz8rT73iqw
 7NfrIkEEF7u+c9A3o2nRDu2oU1R9JmTSmAJxdS8Fhx78gCdIL9YpTWali18NijTO6918
 W20XmoSLf32gczsKEYW97V/tjtwBQytsOG4xqjmnZX7qB2nfZPRgZe3BCqX2qbrcAfip
 Y3pg==
X-Gm-Message-State: AOAM532bEcD4OONb4xM2ST5P+M0z7WNtHoVOGl0GdfJwfwxuJaqqKK2Y
 rci4CdIqHQ+pWJitz2ELcw==
X-Google-Smtp-Source: ABdhPJwpcX+N4A3zDGD6/nUyulsEBel70rjWAgq7gY68Z5+BPGUcC7Y+GrNoFz+69YEbfiaxWQKtvg==
X-Received: by 2002:a05:6808:168b:: with SMTP id
 bb11mr2361167oib.116.1644443226592; 
 Wed, 09 Feb 2022 13:47:06 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id z4sm7026854ota.7.2022.02.09.13.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 13:47:05 -0800 (PST)
Received: (nullmailer pid 980191 invoked by uid 1000);
 Wed, 09 Feb 2022 21:47:04 -0000
Date: Wed, 9 Feb 2022 15:47:04 -0600
From: Rob Herring <robh@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: add nxp,pca9541
 release-delay-us property
Message-ID: <YgQ2WJp8v53+5LE5@robh.at.kernel.org>
References: <20220201001810.19516-1-zev@bewilderbeest.net>
 <20220201001810.19516-3-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220201001810.19516-3-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-i2c@vger.kernel.org, Peter Rosin <peda@axentia.se>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 31 Jan 2022 16:18:10 -0800, Zev Weiss wrote:
> This property can be used to reduce arbitration overhead on busy i2c
> busses by retaining ownership for a brief period in anticipation of
> another transaction in the near future.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  Documentation/devicetree/bindings/i2c/nxp,pca9541.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
