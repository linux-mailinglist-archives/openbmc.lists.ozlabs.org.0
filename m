Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD1252AFD9
	for <lists+openbmc@lfdr.de>; Wed, 18 May 2022 03:20:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2wC33pfgz3bq9
	for <lists+openbmc@lfdr.de>; Wed, 18 May 2022 11:19:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.176;
 helo=mail-oi1-f176.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2wBl6245z3bdM
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2022 11:19:41 +1000 (AEST)
Received: by mail-oi1-f176.google.com with SMTP id w123so990330oiw.5
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 18:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Kfb+7u6Uw6v+2PpmyDRwb+eNAw16/Ib/MlO+j8uqovw=;
 b=WtUhpDE6RzY+hvFjMEsgqcNDRoanT+13PhFQN7Md8vhIxr4ZcPIxpHoY1iJmh1STaL
 PRwSRes8GaAJHaZzpGL/FfiFTgAbFK+eJSBT7rr97WMd4Jiyd71scG62w+lbNcuKWtKn
 hCVVglhpQwWli93rnEtPqjmAAYMrjoAsLnxTww3An9hY52DhJKCiU1zNTQQyTZjP4rh8
 gEMTzbzzY5MlAUy6DccdVwPnr/wEALtph1Pl20ZsSIoW1c+Yeyo3G6cvAOj9qkQCCqUs
 VR8xG6YvjGmgCynkDtgTaaxP5qYGViradZ+qaqsCBHUDv6mGsWiWMoVUmIGsyFJCbppb
 rbIw==
X-Gm-Message-State: AOAM533ofQgV/w4JBlvGiejsQ1f1mA10P7LdCr8zX/TekCSC2wAkVF+m
 Nwu5OQmc9qTrjze38dfswQ==
X-Google-Smtp-Source: ABdhPJxXkFtw6rUqISK+0opSZFzVWDAiZPa07vOB/cSPlSN2Ohjk1gBwlQ/V2zVbJXsoWuWsG4waQw==
X-Received: by 2002:a05:6808:178d:b0:326:6f83:13f3 with SMTP id
 bg13-20020a056808178d00b003266f8313f3mr12056249oib.0.1652836779088; 
 Tue, 17 May 2022 18:19:39 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j3-20020a4ab1c3000000b0035eb4e5a6d6sm407380ooo.44.2022.05.17.18.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 18:19:38 -0700 (PDT)
Received: (nullmailer pid 2013008 invoked by uid 1000);
 Wed, 18 May 2022 01:19:37 -0000
Date: Tue, 17 May 2022 20:19:37 -0500
From: Rob Herring <robh@kernel.org>
To: Medad CChien <medadyoung@gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: rtc: nuvoton: add NCT3018Y Real Time
 Clock
Message-ID: <20220518011937.GA2012974-robh@kernel.org>
References: <20220517092927.19537-1-ctcchien@nuvoton.com>
 <20220517092927.19537-3-ctcchien@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517092927.19537-3-ctcchien@nuvoton.com>
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, YSCHU@nuvoton.com, benjaminfair@google.com,
 devicetree@vger.kernel.org, avifishman70@gmail.com, venture@google.com,
 openbmc@lists.ozlabs.org, KFTING@nuvoton.com, JJLIU0@nuvoton.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, tali.perry1@gmail.com,
 ctcchien@nuvoton.com, KWLIU@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 17 May 2022 17:29:25 +0800, Medad CChien wrote:
> Document devicetree bindings for the Nuvoton NCT3018Y Real Time Clock.
> 
> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> ---
>  .../bindings/rtc/nuvoton,nct3018y.yaml        | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
