Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4485753AD0D
	for <lists+openbmc@lfdr.de>; Wed,  1 Jun 2022 20:51:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCyt30WRNz3bll
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 04:51:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.181; helo=mail-oi1-f181.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCysl0F6Xz3bl7
	for <openbmc@lists.ozlabs.org>; Thu,  2 Jun 2022 04:51:22 +1000 (AEST)
Received: by mail-oi1-f181.google.com with SMTP id u140so3827082oie.3
        for <openbmc@lists.ozlabs.org>; Wed, 01 Jun 2022 11:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O4z4N6i9xomFIEVTjR+Dhz8QGgdya/AgUb+aDwmZcCs=;
        b=OY35xapRW+ZGLnFbl4qOZIG19VlC7JyI8RCXRfi1gcoX/fnVoQjVC2o0sSiVeW2AiB
         GapbBMTGSKC7TL4IQaXoNRJA86Uwm/1vYv5x0vRjq4CwT26qw2xGe8e1NLnZ4nN5KF8c
         DUbY7Loc2/YrVXOAhfj4Juq9w7knK+RhcM06kdP3m8EzWZH/gR8kgxedTK10ULVHQlmi
         viH8Qvu5TlNrmAodJblJ5XjAPiI3lc9FG2WWaPkXzt+wtgS4z3Pq9/mnyYinEgrGHyKU
         eeY/Bxn40SNU+EcDR0mg20BKBXSndzJc8FLebNQwbGZxrKlOQn+7TMK55HmNMSUA8yIQ
         7klQ==
X-Gm-Message-State: AOAM532y0oxgjQulSETiNqMC5GJyRid0TpI13ZZat8FElJuFqt4uHVyL
	CCvWGD+j7UUGWwMVwMpalQ==
X-Google-Smtp-Source: ABdhPJwkkTU9SfqBYEX0qew2XvLefev6XgeAjr4IaPvilbM4y/HGxZWgiQlKzhPkscCe0k2lk5WE6w==
X-Received: by 2002:a05:6808:3084:b0:32b:14f8:1ab with SMTP id bl4-20020a056808308400b0032b14f801abmr16038012oib.223.1654109478925;
        Wed, 01 Jun 2022 11:51:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ay31-20020a056808301f00b00328c9e63389sm1352957oib.11.2022.06.01.11.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 11:51:18 -0700 (PDT)
Received: (nullmailer pid 215240 invoked by uid 1000);
	Wed, 01 Jun 2022 18:51:17 -0000
Date: Wed, 1 Jun 2022 13:51:17 -0500
From: Rob Herring <robh@kernel.org>
To: medadyoung@gmail.com
Subject: Re: [PATCH v3 1/3] dt-bindings: rtc: nuvoton: add NCT3018Y Real Time
 Clock
Message-ID: <20220601185117.GA215023-robh@kernel.org>
References: <20220527084647.30835-1-ctcchien@nuvoton.com>
 <20220527084647.30835-2-ctcchien@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220527084647.30835-2-ctcchien@nuvoton.com>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, YSCHU@nuvoton.com, tmaimon77@gmail.com, KFTING@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, tali.perry1@gmail.com, ctcchien@nuvoton.com, benjaminfair@google.com, KWLIU@nuvoton.com, a.zummo@towertech.it
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 27 May 2022 16:46:45 +0800, medadyoung@gmail.com wrote:
> From: Medad CChien <ctcchien@nuvoton.com>
> 
> Document devicetree bindings for the Nuvoton NCT3018Y Real Time Clock.
> 
> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> ---
>  .../bindings/rtc/nuvoton,nct3018y.yaml        | 44 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

