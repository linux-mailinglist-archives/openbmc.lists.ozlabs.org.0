Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 106B68486FF
	for <lists+openbmc@lfdr.de>; Sat,  3 Feb 2024 16:10:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lc6iLTeN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TRx0X73QWz3cJ0
	for <lists+openbmc@lfdr.de>; Sun,  4 Feb 2024 02:10:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lc6iLTeN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TRwzm248Qz3bwX
	for <openbmc@lists.ozlabs.org>; Sun,  4 Feb 2024 02:09:56 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d780a392fdso25714885ad.3
        for <openbmc@lists.ozlabs.org>; Sat, 03 Feb 2024 07:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706972993; x=1707577793; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y83Ve4uLOGO1Q1NCgtGVhF9CxcVhuT/kEdq7RalQ3Lw=;
        b=lc6iLTeNhU40xamp0I5GXTP1s/tQPumN3GJ0mUQNt0nYi1f02pTSlmiRjQMMobYHw3
         Bl7C0plkGrmRxtLXpzylu27BOTByAKcrgtVQVz13RaPrviIE2PGf9wUeYtI33o4igPOB
         l6tBT0tescR7kJwSifAshpRo/R4hLQU0uHpETYtHlAhgdCXU18GPYZBd8H7NYZSDX2IR
         hLMuG/iaUn+/w77tX8EhagKSzvL2iHcW9bcWEcwmsGx8FWlDdl4W+Gq0hvL1Z1tLQAJ6
         lsL29w3UXF8BBsvmzf2XyN1ChYFPWZf9jcNkBIZbn+rg5muC0DfzecBVdC9mJS8kO5/d
         u7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706972993; x=1707577793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y83Ve4uLOGO1Q1NCgtGVhF9CxcVhuT/kEdq7RalQ3Lw=;
        b=ByG3KhViRpLBbOxHMoxhgXm3rwz1P8KhcbbT+Z9kOrUVcl7+BU/70VSPfSwXQ7OIvg
         muAmnkGgzSv65CVWobNf6eF1GH4/EGfqUs0w1PN+9VTrrmEeF0HWRs4MPvHhwnhija87
         Q6mcXLer9goW3Qn5qhlXjVaGHbwCQe4oqlAcuDpdHsYr8c/KcoCW01LKTq8ywEE+kWLM
         yfC5MiHREZg+Pxs14GiMUZ2Y/rYO3UIes1I8VgRM120lcFo8qsNX+lahWpjovbkSJdty
         aCjpcqpr8LrYsVIlmz+lHLO6737jbLNVxbWO2kWFf4zfs60NG+0V2Lt7WPIMTwuNItoU
         0MJA==
X-Gm-Message-State: AOJu0YyUz8r2Pmeft6pt88gOxn/dfpIvq6jBYHsVyZNNx0sNvSatxaV1
	puWzKQVl1RvxBs18l0BxczQ4HiGM7pEdPIvcwk7ctRJWVyLxL22C
X-Google-Smtp-Source: AGHT+IG3vELmvhTEQC3aDsXeNDl+XOLOu+5Y28d4UGVx1cpRm8e3bTPKToV6F+6k0h4JcfJSawTByA==
X-Received: by 2002:a17:902:6b8a:b0:1d8:e4b8:95dc with SMTP id p10-20020a1709026b8a00b001d8e4b895dcmr6447144plk.41.1706972993536;
        Sat, 03 Feb 2024 07:09:53 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV6R3KrGu18pkdWp5X+zu2s9nKiSurYWIo5X4HUN1wO+X1iU2BRAy+vmLwO0O5gPMcEMMHkAIVMqN+jJtfyM1w8TyC6YwjdLkACDkXusqdLpAPzCBBjY/kJoATE8/R46HozV0jKWLkF2C/gF8RFgBMrw31kti4A7n0L8r8yMnpW4gUnqDwUl4cmW0Nk1Wp+7GSga1dxgEomJPw8H707TuKyE8HaBLUJVHxdRMa2nLH3F58EdL1LZNsnaU7x96oo3szK5+vHAa3hAmUFvm9hlkLnHj45UuebI9muViDVPfRo30J+DyJ904dDfT6krVamYtGsqIGp1kJZOA8wNDFLzO0h562PiTvmNRLsHaZ3xN6W1GsjrlM88Hs/N3OblnX3l0381U7ayD83gWvQKQNxwh6zeMjue8b1VNxTUVWPKyCkFwnnYsCwk0wiqNyWAcfLcVQY9Jc1oXTFnGH66iUGlfLnOa+Wh6NjADrzQirhk5yprQcyrTqjiD/uSVs5JkN8HhrAYmgEIFOhtj4krJXXgYYS6NxGhdI7Nca1R6JqBrQ0TfM3qFcDg08=
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902d3cd00b001d93966b2acsm3360202plb.143.2024.02.03.07.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 07:09:53 -0800 (PST)
Date: Sat, 3 Feb 2024 07:09:52 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: baneric926@gmail.com
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
Message-ID: <5dd9d5f8-c909-4245-b37f-cfb0a8096a50@roeck-us.net>
References: <20231222013352.3873689-1-kcfeng0@nuvoton.com>
 <20231222013352.3873689-2-kcfeng0@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231222013352.3873689-2-kcfeng0@nuvoton.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Dec 22, 2023 at 09:33:50AM +0800, baneric926@gmail.com wrote:
> From: Naresh Solanki <naresh.solanki@9elements.com>
> 
> Add common fan properties bindings to a schema.
> 
> Bindings for fan controllers can reference the common schema for the
> fan
> 
> child nodes:
> 
>   patternProperties:
>     "^fan@[0-2]":
>       type: object
>       $ref: fan-common.yaml#
>       unevaluatedProperties: false
> 
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>

Unfortunately the dt maintainer's Reviewed-by: tag on the latest version
of the fan schema patch got lost. I am not sure if I can add that back
in on my own without violating some rules. That will need to get resolved
before we can move forward with these patches.

Guenter
