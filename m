Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE79276161
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 21:50:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxTLW4cZxzDqg3
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 05:50:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dmAwRiFo; dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxTHx72LwzDqfc
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 05:48:28 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id u25so898780otq.6
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 12:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=zXXxgKUWjcEGxLP/l6TbMW2/Veit69sY/ftb0ClcFGQ=;
 b=dmAwRiFovUluDRPDpMPnxpWWpEj6wE9HGLOwQOllGR57IOiaSbnH4nSTKqn7zDejcy
 Zb5rig+xLNx75kPpZ4Fvy1j8WqzeOtLZKEhf6jdFV5FjZRKXYJPQdfx7/s0uxLjHGNTW
 /dLa86FbB34YfsNqY24fDWQOwFl4UkhBdCtNEE2VpkkHkg5vZirU3hw4eF2bMrGCJXXO
 ixf+EYt64cg8yiTFxJ6t0wnnLD71+Da1qDBM02/PBskCRR3ievdkp3x7zyiwdKxAJ9H3
 wDwMjE51zz3fhRBsG1IAgU+J+jPlNvaKDnklcuzP7lIDm7o13WqSnDLmx0ddDebwq2X0
 pzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=zXXxgKUWjcEGxLP/l6TbMW2/Veit69sY/ftb0ClcFGQ=;
 b=nRQjHZVAJ0cHm4msT+5W1g8Q3xxcnXMU//NtsUDyIwsFvmKNMjA4zws8H7E6+b1H45
 XN+D+jK8cLPIR+vm4wRlThkcX3AqYSnAZj4wdzvk90LXWGBwiKg5zFUVKL0ZU/FglPi8
 7AdLRVN+gxkvGytufDmIhjiDoWrH2/LqKFSwrbhVCD+CbCbR4QeQZw51QYw8aBXxmq99
 Y1HxikmbaxoorG8WGpCfzx57NU7Vv4Y61TsGBW9cdx6KPI7HL/pfPtU461DAS0e/LSNQ
 tood+H1RFGsTmeXi7uRexPp+5Bh0uzZ3zDG/mRhgdWesn9yMkAgd9sjHYF3Lr425zCHp
 gt+w==
X-Gm-Message-State: AOAM532haTy7B1/4IHwlwP/ZhgVDsaPT+y/xrfwLgj3NuBFHO/1m7Pex
 DqjaRBbp3WIiEVA0DbNkX6Q=
X-Google-Smtp-Source: ABdhPJxHKhyg6f6pElgdvZzUf/J0omlf5rwwSsnu0arLpq3ncTWqgv1jELAg3WIqUZieH5MyVtyXnQ==
X-Received: by 2002:a05:6830:1d96:: with SMTP id
 y22mr817519oti.243.1600890504201; 
 Wed, 23 Sep 2020 12:48:24 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id z10sm196269ooz.14.2020.09.23.12.48.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 12:48:23 -0700 (PDT)
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: Action: OpenBMC community messaging survey
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <19c81092-8639-ce87-2515-c77ef7ae9001@gmail.com>
Date: Wed, 23 Sep 2020 14:48:22 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hello everyone,

I am doing a survey. If you DO NOT use IRC, would you start 
communicating regularly with the community if we used a different 
messaging platform? Maybe some other reason?

I am not suggesting anything at the moment, just looking at ways to 
remove any communication barriers and improve open designs and development.

If you DO NOT USE IRC regularly, please follow this link for a short 
survey. It is completely anonymous and will remain open until 12:00pm 
Central, Monday September 28th.

https://www.surveymonkey.com/r/33BVDR6

THANKS!

Kurt Taylor (krtaylor)
