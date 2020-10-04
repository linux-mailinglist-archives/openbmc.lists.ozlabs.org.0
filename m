Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7332829BC
	for <lists+openbmc@lfdr.de>; Sun,  4 Oct 2020 11:05:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C3yW04wh6zDqKW
	for <lists+openbmc@lfdr.de>; Sun,  4 Oct 2020 20:05:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=nishikawa.shun@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=puW/6Fv2; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C3yV038QSzDqFv
 for <openbmc@lists.ozlabs.org>; Sun,  4 Oct 2020 20:04:35 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id j8so1803514pjy.5
 for <openbmc@lists.ozlabs.org>; Sun, 04 Oct 2020 02:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=ziaHSs7xDrLUN81wnDlKEBZ8yjciDQ8P7+PCM+Ndu/U=;
 b=puW/6Fv2MfUtmqJI+zTqwO7whjtWxvPVxHXEOpzAgfGTHRyFu88ji5NT9x7oHTrmdg
 j8wmWJAfxnWenzWA2SycyhvDsomsgwRM6RAVI4QUEBtB6cNMW6Bc9cJvhIa5psDtEdrT
 3Tn3riBNY/XuoxhzSo5MTZgsQVTwC7V9QX9/iKju9RhLSg3ATto9NSOTRsfvuBot1kQh
 F1xvjgDGI0Sl0lDsl6efpj/E8uOXV90sASseZUaMxcNE3FWNcT+iBYFumtqCHvIBJ84U
 arWPC7m7Q0adpx5Im3MVH+OcLXT7GA/sjiIEqnkFrhqzLnCxd2cX69FE6kHFrzXnWy//
 cDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=ziaHSs7xDrLUN81wnDlKEBZ8yjciDQ8P7+PCM+Ndu/U=;
 b=uLokwNxmVNN6/8rXGzZ136Jio0VDMkO/1eOr/WCgoztVToJ9r7wW6GnJzUaJPyTLbC
 396p8qD4YmcixW60JUBudPezjHRhkTzp66UrSSPXa1QLTbzEI9H4F7HcZrazIdP7jccP
 6j8M3NLhFOHBBneaYoFo85ktnrk9ThjFtb72sKNADv0Sf4O8RXCt9iAR0a6hBMspmo9G
 GT5k6cVQZ+kA85UU2IgMlPFFpJPwOeFTAyjWpPivYWcAidWOTdJzKwwSadysUD4GGIxY
 GqMseSVl1ACScib3IvehSmhZLO4kuG4eGznQo6DEqXwq6CNefhp3K3PKPGkeyH9m6wAA
 rJnw==
X-Gm-Message-State: AOAM532016drvsbqZx4hURdoFTtJFTlPC2qV9c1dFu7A5YUEuhqHgEs9
 sabhQ/LwhhuSvn8UP9OF5uI=
X-Google-Smtp-Source: ABdhPJzQxyrpqLkjwUhmVWk1zBUlCwTSg6H3oqoBd14xcZUttpbW3mz2wlaLlHadIaqOwYVe4+TuEg==
X-Received: by 2002:a17:90a:9ab:: with SMTP id
 40mr10645768pjo.26.1601802270179; 
 Sun, 04 Oct 2020 02:04:30 -0700 (PDT)
Received: from ?IPv6:2405:6587:4e80:3b00:803e:6f21:2019:1757?
 ([2405:6587:4e80:3b00:803e:6f21:2019:1757])
 by smtp.gmail.com with ESMTPSA id a2sm8036766pfk.201.2020.10.04.02.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Oct 2020 02:04:29 -0700 (PDT)
To: openbmc@lists.ozlabs.org
From: "S.Nishikawa" <nishikawa.shun@gmail.com>
Subject: LED accessed via I2C
Message-ID: <1ef07be4-6706-5071-f992-acbc43e2116f@gmail.com>
Date: Sun, 4 Oct 2020 18:04:26 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
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

Hi,

In our hardware, the Alert LED is attached to the end of the CPLD and is 
accessed via I2C. I think phosphor-led-sysfs controls LEDs with GPIO, 
but how can I control the LED beyond I2C?

Thanks,
----
Shunpei Nishikawa
