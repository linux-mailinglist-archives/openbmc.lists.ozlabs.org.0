Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1D996456
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 17:27:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CZRh1RmmzDqgk
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 01:27:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SrtCqF9p"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CZJn5Kf6zDqX9
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 01:21:45 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id c81so3576191pfc.11
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 08:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=MJt24EPy43Ti5EtCu4AqEKxniVOrhxVv02Gleo5IXyE=;
 b=SrtCqF9pPnng7ehiqNQgq73kEhqLuhCwqieKSAEaSvgM23Ld7sPB5E1MwQCM6rBqBE
 nqmNgyz4x/nxY4sF9m29OUz7Q8LcQesHeXcjY5dDR/poJ+uuGoar38LR4oSXQQbNi7h8
 NC2Gmvd7gVALP/tUWbPViXAR+Q0UMpmmYgw8Ifjl1MPhUE+f4LAio38eFt3bo7fid0jk
 DuuI61zdjgYUyQuD/Fbs/mNe1ZXXj5DtM9P1PH6dtY10xMKyWCGV1DKpj1cizs/ndrTQ
 BLWALERkRMpKMX4SP267bTOSwNXQI1JFEtEj/4LVICaNPpCOiKJdchjzLRYBdjqovWE3
 K8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition:user-agent;
 bh=MJt24EPy43Ti5EtCu4AqEKxniVOrhxVv02Gleo5IXyE=;
 b=aAxvfTxH5mP6BNPAUeqRhaMHmIJBAeG6QXNO2ZkO5JKT//+K9sPOmPF+H54GZP8B7L
 zzyVv4+wXoga3AdQE5SI/oeui/r2EuMcLHED7BzCGlNuG0p7xUzgmf0kW+TT67VYiRyk
 kx//Hmv8ATSv6jh396HZFSYdoaNS3AJrww4YzZ4KVMsz3JxuWDQO+taCH2JZGvtR3w3V
 BNYMZE32DOkQAo5nWN7ibM49f3K+0iwdT7lnMRZ7Wz+gKo/m8sSPxuTz6X5ZJMt6KYyk
 fCOZtRpfGJV8GDPno7Ish+EesnTCqsS+0tXY5hdMYJfFDZ86BBMwvNpFHHKH2tZ/hP4I
 IxQg==
X-Gm-Message-State: APjAAAWo1kN5mkkEDCiTY88JM0jDGMm5kKRE4m4TxIJCCroR+tN8BX+T
 uYtXLE9TK6gMli9aDmh+C5Y=
X-Google-Smtp-Source: APXvYqyye+f2ZvNPRYjsHLx9yEZsbjtsiD/vrXS+OvTR4qsU+Ap8Rb5ttF0FQamv2w/cdmS4Sjesdg==
X-Received: by 2002:a63:b20f:: with SMTP id x15mr25966808pge.453.1566314501422; 
 Tue, 20 Aug 2019 08:21:41 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id w2sm513828pjr.27.2019.08.20.08.21.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Aug 2019 08:21:40 -0700 (PDT)
Date: Tue, 20 Aug 2019 08:21:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: John Wang <wangzqbj@inspur.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: Add ipsps1 as a trivial device
Message-ID: <20190820152140.GA13677@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, trivial@kernel.org,
 openbmc@lists.ozlabs.org, duanzhijia01@inspur.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 19, 2019 at 05:14:25PM +0800, John Wang wrote:
> The ipsps1 is an Inspur Power System power supply unit
> 
> Signed-off-by: John Wang <wangzqbj@inspur.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Aplied to hwmon-next. If someone else wants to take it, please
let me know and I'll drop it.

Thanks,
Guenter

> ---
> v6:
>     - No changes
> v5:
>     - No changes
> v4:
>     - Rebased on 5.3-rc4 instead of 5.2, No changes
> v3:
>     - Fix adding entry to the inappropriate line
> v2:
>     - No changes.
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 2e742d399e87..870ac52d2225 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -104,6 +104,8 @@ properties:
>            - infineon,slb9645tt
>              # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
>            - infineon,tlv493d-a1b6
> +            # Inspur Power System power supply unit version 1
> +          - inspur,ipsps1
>              # Intersil ISL29028 Ambient Light and Proximity Sensor
>            - isil,isl29028
>              # Intersil ISL29030 Ambient Light and Proximity Sensor
> -- 
> 2.17.1
> 
