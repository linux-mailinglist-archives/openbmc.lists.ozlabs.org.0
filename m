Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E48CD4C4B9F
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 18:07:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4x6W6fmMz3c5g
	for <lists+openbmc@lfdr.de>; Sat, 26 Feb 2022 04:07:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YGNpHyBl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=YGNpHyBl; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4x672LwJz2xsr
 for <openbmc@lists.ozlabs.org>; Sat, 26 Feb 2022 04:07:24 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id s1so5443399wrg.10
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 09:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WB5L24J+r3LaBAtUYOewfzVpv4xCweO60X/neQXDjW4=;
 b=YGNpHyBloMoOXXV/AszGwoQe8GoC3XQxOnZLO8EzrqUeYHwk5ggcukwYnZu06oxiKL
 qLitvoJOQQ2ys1IYbBOmW3f8t8qCzlUpwhrarVBGA5VdQyWJEx9verxbSM4GL5B9nM4j
 xn9tylXLFi94D1Ghat23Lh1t3fZiz8sAEXcBEOfmxJ4rMFjlThWiiiYKtSWPnaAo4QV0
 gpZFTX3sR79Y9tVh93tL/k404FBxQPMlBAeKmYMEdJCC+/chLo+PqrYnq7niGwC5itA/
 /kPuXwZgfNd/azR2iUQsnrq5V3ou7+kryO5zjj2vBjB9HR9cWTy2jNJCDwQQz2UHEwtT
 wgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WB5L24J+r3LaBAtUYOewfzVpv4xCweO60X/neQXDjW4=;
 b=cGsCem3Z+udMn8MmbxNQQzCg0kt0L7D4d9a5lAWaVuJHkdRngkqHA8swYwqzFPUASY
 mBlOSan8vCGTbHt8P6/6io/VlKzCWAb8HLLcdcUIo9VTjgdW4ZUsijpZHD9+5R/zVoKm
 rOp2UDb/QWp1RI8ML8SK2IXnVqXgGmHvZfZfUq5xMlzMdnzneq+r7JBUHTnhA24RA2OL
 b2yrI3/4bCMMNHNkZGgEwghzoT4cwjG+Vl0PajFPrVaLlrCy7w4W1xJ3gXwYGbj5Ow9Y
 9CWXFa+akHDJLlK0U6L/pbhNN6DxFIA/+EDIiefEqqJKPL32LzCkTublz/BB3GZRM+y9
 E9BQ==
X-Gm-Message-State: AOAM532rzh85a8pIUSDVne2OYDTnDXgcjTVWKBltaY3Ws+7NNbVBFkRF
 IlwqS8wpBVpj4r1fgm67zWyHxJXu6urIgTogxnl7wVlmx4+HjA==
X-Google-Smtp-Source: ABdhPJxCUZ7DDQtDkXK5FcFi3zEZr86AhI/xPf49seoHeTAohc4fSDGmu3YtWHRO7wJl+SrcVX65fPeHUFjLcaUJ4fI=
X-Received: by 2002:a05:6000:18a5:b0:1eb:93a3:ebcb with SMTP id
 b5-20020a05600018a500b001eb93a3ebcbmr6819876wri.291.1645808841492; Fri, 25
 Feb 2022 09:07:21 -0800 (PST)
MIME-Version: 1.0
References: <BYAPR11MB33494E24397F5FEBF895988EE23E9@BYAPR11MB3349.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB33494E24397F5FEBF895988EE23E9@BYAPR11MB3349.namprd11.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Fri, 25 Feb 2022 09:07:10 -0800
Message-ID: <CAH2-KxDrH_5_euhyoD5de0QvuTo1+UEonCrTx3gHBJh11CHbvQ@mail.gmail.com>
Subject: Re: Redfish-Service-Validator fail to validate Oem
To: "Zhang, ShuoX" <shuox.zhang@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Feb 25, 2022 at 2:03 AM Zhang, ShuoX <shuox.zhang@intel.com> wrote:
>
> Hi all,
>
>       Why does the Redfish-Service-Validator tool fail to validate Oem, the namespace OemManager has the node OpenBmc in OemManager_v1.xml.
>
>

The OEM schemas we have were not built to the odata standard, and
therefore do not pass the service validator in most cases.  There were
enough bugs that I even made a topic on github for that class:
https://github.com/openbmc/bmcweb/issues?q=is%3Aissue+is%3Aopen+label%3A%22OEM+schema%22

If you're interested in trying to get patches to fix some of them,
please take a look at the above list and feel free to start wherever
you like.


>
>         <Schema xmlns=http://docs.oasis-open.org/odata/ns/edm Namespace="OemManager">
>
>             <ComplexType Name="Oem" BaseType="Resource.OemObject">
>
>                 <Annotation Term="OData.AdditionalProperties" Bool="true" />
>
>                 <Annotation Term="OData.Description" String="OemManager Oem properties." />
>
>                 <Annotation Term="OData.AutoExpand"/>
>
>                 <Property Name="OpenBmc" Type="OemManager.OpenBmc"/>
>
>             </ComplexType>
>
>
>
>
>
> Oem.OpenBmc
>
> [JSON Object]
>
> none
>
> Yes
>
> FAIL
>
> ERROR - Type OpenBmc not found under namespace OemManager in schema of parent
> ERROR - Links.ManagerInChassis: Linked resource reports version #Chassis.v1_16_0.Chassis not in Schema localFile:./SchemaFiles/metadata/Chassis_v1.xml
> ERROR - Links.ManagerForChassis[0]: Linked resource reports version #Chassis.v1_16_0.Chassis not in Schema localFile:./SchemaFiles/metadata/Chassis_v1.xml
> ERROR - Oem.OpenBmc: This type is invalid none
>
>
>
> "Oem": {
>
>         "@odata.id": "/redfish/v1/Managers/bmc#/Oem",
>
>         "@odata.type": "#OemManager.Oem",
>
>         "OpenBmc": {
>
>             "@odata.id": "/redfish/v1/Managers/bmc#/Oem/OpenBmc",
>
>             "@odata.type": "#OemManager.OpenBmc",
>
>             "Certificates": {
>
>                 "@odata.id": "/redfish/v1/Managers/bmc/Truststore/Certificates"
>
>             },
>
>             "Fan": {
>
>                 "@odata.id": "/redfish/v1/Managers/bmc#/Oem/OpenBmc/Fan",
>
>                 "@odata.type": "#OemManager.Fan",
>
>
