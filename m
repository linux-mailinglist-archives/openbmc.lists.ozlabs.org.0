Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4F634B831
	for <lists+openbmc@lfdr.de>; Sat, 27 Mar 2021 17:37:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F74JZ2FcVz3c15
	for <lists+openbmc@lfdr.de>; Sun, 28 Mar 2021 03:37:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.170;
 helo=mail-oi1-f170.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F74JL3QfYz3bs3
 for <openbmc@lists.ozlabs.org>; Sun, 28 Mar 2021 03:37:38 +1100 (AEDT)
Received: by mail-oi1-f170.google.com with SMTP id x207so8984030oif.1
 for <openbmc@lists.ozlabs.org>; Sat, 27 Mar 2021 09:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RnOFizufyIzLXsx9L23De4K+FgNMVS+9BTUlSwp8+vY=;
 b=KqFcIEHeKsfMykNYcQ19DzltL/tGrAodkt94J2LwW3AU7ntv0nf+W29CaoRKhTq9i4
 wIkdwDaGoQOCK/bjDtm7SXX1hzjGHeFogJP8lNg1Sh11Ce5CsufBZ5YnmF1bvhXhWNw7
 ZwrIx6Udnd665AF0XVZSjTBhBrvEAqVxCFoSaHZiBMFLyEmjIDYEYcRGSd+SOCB45pQB
 HUUkorCkjmX8okeKrOKkdstVCGuwgoikdnVeRk11squsG6QwBaUwjFJoLu31hVnzy4iG
 3PKijIcHeYt/E4lku/kskN9UCQwkEmExFCtN2hYpTRgiQ7+7AqjIAbcDnZb8txtbkhWi
 OzCQ==
X-Gm-Message-State: AOAM530Kd+5YRcnElp+YsVM82eXuRxQG14Q2N5WmoyxgpbCa9JLVSNFq
 NOJdXhj8dSepFhicp0HeW8iLKIgGCg==
X-Google-Smtp-Source: ABdhPJwMW+5msovF4j3LhZVPkAZxnjhyXEJfi28WekI0rNOvvjcMhtfDXWeZQcP+h8f1pRC42DQUZA==
X-Received: by 2002:aca:90a:: with SMTP id 10mr13640983oij.35.1616863056268;
 Sat, 27 Mar 2021 09:37:36 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.140])
 by smtp.gmail.com with ESMTPSA id d24sm2826126otf.12.2021.03.27.09.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 09:37:35 -0700 (PDT)
Received: (nullmailer pid 212999 invoked by uid 1000);
 Sat, 27 Mar 2021 16:37:33 -0000
Date: Sat, 27 Mar 2021 10:37:33 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 04/14] dt-bindings: serial: 8250: Add nuvoton, wpcm450-uart
Message-ID: <20210327163733.GA212953@robh.at.kernel.org>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
 <20210320181610.680870-5-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210320181610.680870-5-j.neuschaefer@gmx.net>
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
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 20 Mar 2021 19:16:00 +0100, Jonathan Neuschäfer wrote:
> Add a compatible string for the UART inside the Nuvoton WPCM450 SoC.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
