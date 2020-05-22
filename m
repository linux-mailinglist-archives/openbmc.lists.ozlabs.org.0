Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 949411DDF66
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 07:33:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SwBT3C99zDqxV
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 15:33:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Xmw7VPgN; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Sw9g3wRBzDqSh
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 15:32:39 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id y198so4719096pfb.4
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 22:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=o6S9tIJV/pRjRyq27/CakGyNUyKN6A9nMB7tOlhJunI=;
 b=Xmw7VPgNgOSK0AfKwHvuaqhbwTeu84umJQiNqK8f80glPgQNt9xoPszEoHlQJwBePW
 iiUQ88LFjfm2NMH9FuRK2DRTZORrUCL5uaeLbs12gq5TM79PSz23aOjMoSNNHM5ESSFb
 BQb8Mnc+GYpPzbUYy6H9jIDH5gy8vMfX5FNTrg4ixiPYBDoxOFRzhKJLbKr7ERzAxGJC
 hszMsbxxc3oJSgOUF/rUbZqWJ7g5j/0V50tqyD7Oe/8X6SXXgWPi5EFqujYtAw2fsuUr
 Z3R5YNb8EpGayfuA8Tw111au5G1WwVHLuJJ41ReZMLKyq8iLvNXBjvL2g2UFqb2OqOa9
 iqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=o6S9tIJV/pRjRyq27/CakGyNUyKN6A9nMB7tOlhJunI=;
 b=GT1bjW1SsUkoMGLSMr+28GBV7l1SRpVWexzYF7li7MYoJ6YjetSzQA1QoEwTT7y8Lg
 D8Dax8/wiYs6AM+NSEwQFPkuPj6JiKXRl0Vk8BI03OLNT0nOt7IlHa8RYq8sYbfFOMR3
 Y3nec4SJSeNq9ENm+uHp0a/8jyLGyjV7mTfPjOhZWFpSBDF9SeR/Sl66U3YSxy2EcFFz
 pNFA6GByAmpfSu42Gt7qnAWuqL8oo0U375y2WFWwDjctsnLbwh5YYqZchsKUvFQUQk12
 CFLd9Xn/pcVB77bxQOkKx5Qod+HgvNeYofGTNHFHyurzA9ccT2yH0ZZMgeOZtJ10W687
 IRtQ==
X-Gm-Message-State: AOAM5313u4UOb05f9diY4NN5YBEXoNagwlUXB3Bg13fjCgXt22mhKVNZ
 yLXNPNNe09SLgwraLilwtj6Xf5IU
X-Google-Smtp-Source: ABdhPJyO/iqYZ1ASWYCmKm8psnTNUTMa88i9TrIfyz9bsGAg1KXPl8WoNrGHJkOc6qEr7M1FTTOIUA==
X-Received: by 2002:a63:a101:: with SMTP id b1mr12249538pgf.292.1590125555007; 
 Thu, 21 May 2020 22:32:35 -0700 (PDT)
Received: from ?IPv6:2409:4071:e12:ff20:80b:9988:5778:c978?
 ([2409:4071:e12:ff20:80b:9988:5778:c978])
 by smtp.gmail.com with ESMTPSA id h4sm5688405pfo.3.2020.05.21.22.32.32
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 22:32:34 -0700 (PDT)
From: Sunitha Harish <sunithaharish04@gmail.com>
Subject: Introducing IBM OEM
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <477b1d3a-214f-0e25-2062-c2f69f06279f@gmail.com>
Date: Fri, 22 May 2020 11:02:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
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

Hi,

IBM's management console has some requirements , which are only specific 
to IBM. For these, we will need to add some OEM parameters. These 
usecases IBM specific. Since these are not in the interest of the 
community , we are planning to introduce the "Oem-IBM" - similar to the 
"Oem-OpenBMC".

Any feedback is welcome.

Thanks & regards,
Sunitha


