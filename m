Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FE36D9D9B
	for <lists+openbmc@lfdr.de>; Thu,  6 Apr 2023 18:35:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsnDC4N3Mz3fVS
	for <lists+openbmc@lfdr.de>; Fri,  7 Apr 2023 02:35:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hrpzqdMr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=sunithaharish04@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hrpzqdMr;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsnCb5lSYz30Bp
	for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2023 02:34:50 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id w4so37975310plg.9
        for <openbmc@lists.ozlabs.org>; Thu, 06 Apr 2023 09:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680798887;
        h=content-language:content-transfer-encoding:mime-version:user-agent
         :date:message-id:to:subject:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SaF+xh5hYpCf8LlyAGmnz3Bt5Zwa/ourtX4VXKMB4fQ=;
        b=hrpzqdMrW+2z4loKb/ie/gfgrPRVzrH93duU2rbIlz1gLmtxt5W72Yrqe7sl1G147n
         tstDoQ9ZwUfh92xTepwpzex8w1k4GFf3SBpSS+0a5qGxzgiODbQQ8fRyRDK5PqYbYQfk
         leCiWsetJ9XgoLkkSY1cNJjyAeOLMqJm79okQUEIpp3qSaa4Sk1uZVZjO3GHVi9a61Yq
         TzC2g0LhTRo2jILKk/Vgbbt98mhAhWtK8JInBUu0Cq+d2t3WgrG4A5QdSxppopPFvMll
         Ma69LYVhkTxZ09nE2A7TLpOFyWnpbaRpxJ7A6uziEggKGwEhS5Z7uB8HEI1rf+PpGKEX
         7sUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680798887;
        h=content-language:content-transfer-encoding:mime-version:user-agent
         :date:message-id:to:subject:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaF+xh5hYpCf8LlyAGmnz3Bt5Zwa/ourtX4VXKMB4fQ=;
        b=gQspEEfSeJx8fGtl+MZEJpqthxjuTJeR1TUUgfunkRJhBX4Yxvki9OromiSgQ4SaxG
         roN3K3UFa5qTLyty12RmuWtFRBvfl34c3zzU4J9c2TvmYHbFR4TjqMsA5nSXF/TVoqMF
         Hcakf8Qeb+6tlGanWTMj0bdAHdoysWLm+aAdptUHtdivbxvk+XahQnYybES4091yQc1t
         +wFH4EEb6hi1amlES/LYLzp3EC3Gbyddgd6O967hj3yrIFXEE/T9yvT/KE8EKyyFn31E
         6H9X+iOfAkQRMv8ywy6QZFYd2z5tuQpxm8+3bWcQQr6MMXVQPwxyE1rIHTIlXLtT0ICE
         unZQ==
X-Gm-Message-State: AAQBX9cfVoB8s5aVEHC+HnJf+g0pS3gWHx6M2oVAJ4WKJJLx/pMRmmkV
	TfHfh7wIf8xOQt/Y5Tizz6yWCamOLgdAKQ==
X-Google-Smtp-Source: AKy350aYXVBEqTWc8K5vJ5YeRIOOsYRWVZAMq5RZMF8Gxk+xYeMV/PZAZqsnfUjf/d0t+25z0OX4Kw==
X-Received: by 2002:a17:90b:4f86:b0:23d:35d9:d05b with SMTP id qe6-20020a17090b4f8600b0023d35d9d05bmr11864212pjb.14.1680798886394;
        Thu, 06 Apr 2023 09:34:46 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.105.124])
        by smtp.gmail.com with ESMTPSA id d4-20020a17090ac24400b0022be36be19asm1370616pjx.53.2023.04.06.09.34.44
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 09:34:45 -0700 (PDT)
From: Sunitha Harish <sunithaharish04@gmail.com>
Subject: Support IPv6StaticDefaultGateways on OpenBMC
To: openbmc@lists.ozlabs.org
Message-ID: <c885c490-796d-f9e4-f463-414ca1f49045@gmail.com>
Date: Thu, 6 Apr 2023 22:04:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Team,

This is about supporting IPv6StaticDefaultGateways parameter on OpenBMC.

Currently we can configure the Static IPv6 network via bmcweb, and that 
gets the network interface setup and user can connect to the BMC via 
this IPv6 network.

There is no support for setting up the Static Default IPv6 gateway via 
redfish. Its been implemented as a read-only property at bmcweb, and we 
can only retrieve a single dynamically assigned IPv6 gateway address via 
redfish's "IPv6DefaultGateway" property.

There is support to set single IPv6 default gateway at phosphor-networkd 
and dbus applications via dbus calls though. But as per the IPv6 
requirements & DMTF schema standards, the IPv6StaticDefaultGateways is 
an array of IPv6Address + prefixLength parameters. So i believe, this 
has to be implemented as a "creatable" object via bmcweb + networkd + dbus.

Please share your views as how to support multiple default IPv6 gateways 
set & get at BMC via redfish.

Thanks & regards,
Sunitha


