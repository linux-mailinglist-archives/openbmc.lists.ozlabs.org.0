Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EFA470CD1
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 23:06:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9lP56JNCz3c9d
	for <lists+openbmc@lfdr.de>; Sat, 11 Dec 2021 09:06:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.48; helo=mail-ot1-f48.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9lNp0t01z3bNy
 for <openbmc@lists.ozlabs.org>; Sat, 11 Dec 2021 09:06:32 +1100 (AEDT)
Received: by mail-ot1-f48.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso10977849otf.12
 for <openbmc@lists.ozlabs.org>; Fri, 10 Dec 2021 14:06:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zGf/38Vwo8eR5gshSlfvh26HPD1VlHPaMv5irQiJzic=;
 b=MZBdpkUeEKY/vfvx9JwdbHb5nwzdgQPkrMO+hkih/ufz0zL84JaIcj+ptomfXIi9B4
 vf0e2AdODb9ezCMUe8S72feIOtxe7cjA5gd3T8bxiy3/KPT3cuPLlAejg1QtbR96+J8S
 GgXaoM3TQ3diCwLlxaPRmhq3gK+xr9Lo3fBJQq+06cvaRHuBno9aewiprt9UquvLjLHa
 2sPSzI7KjHvlN7jiySIKYM54kwnptPnDW95XwdcFh2bqwUL1PsZfddoeQtiOR+s8YpL5
 Bnq7bv7r2A5Ip/yg13d6up8Px1YlqejIKY2darNg8HIR9/TvggDppx1/TLcMk+yJYkTy
 IhkA==
X-Gm-Message-State: AOAM530OLGs3EnY1LeIEJLpNd5dJzczHFDrs1CEABC0hdy2HDqnag8d/
 jx1+2vbZdnIZ634JiLh57i8m6iO2Uw==
X-Google-Smtp-Source: ABdhPJydz0gR7yjLFC5bPmusOYQaEY/qraySMB9ap370KXzu4GwifsBe02pFaB1/RrFgq9JjcMaZmA==
X-Received: by 2002:a05:6830:1d87:: with SMTP id
 y7mr13041702oti.269.1639173989753; 
 Fri, 10 Dec 2021 14:06:29 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l23sm758023oti.16.2021.12.10.14.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 14:06:29 -0800 (PST)
Received: (nullmailer pid 2011299 invoked by uid 1000);
 Fri, 10 Dec 2021 22:06:28 -0000
Date: Fri, 10 Dec 2021 16:06:28 -0600
From: Rob Herring <robh@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v4 2/2] dt-bindings: add Delta AHE-50DC fan control module
Message-ID: <YbPPZISviJxKsK15@robh.at.kernel.org>
References: <20211208213703.2577-1-zev@bewilderbeest.net>
 <20211208213703.2577-3-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208213703.2577-3-zev@bewilderbeest.net>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, openbmc@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 08 Dec 2021 13:37:03 -0800, Zev Weiss wrote:
> This is the integrated fan control module of the Delta AHE-50DC Open19
> power shelf.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
