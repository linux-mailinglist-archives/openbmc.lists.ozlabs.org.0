Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA5A628E0
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 21:01:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jFD62BV1zDqQD
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 05:01:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RI3IX3wn"; 
 dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jFC43ck7zDqB9
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2019 05:00:32 +1000 (AEST)
Received: by mail-io1-xd29.google.com with SMTP id k20so37646785ios.10
 for <openbmc@lists.ozlabs.org>; Mon, 08 Jul 2019 12:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=EFm1zjU3ivw4r7wE2K3KiUjutSzw+vpUcfyjxfDHyMg=;
 b=RI3IX3wn/+ti911iRTuXo/eg8aE8hwXPeHqv3OcaQSFQBwwMAtNFd/X5xt/6qWBwSL
 41olDUNKiwnQUr9ONSoB3tb29TbpS+xge75LJQkK7LJGQ4ovBALVSA0ulDk9urPQI0LN
 NfIeF6XbrNJYGPwQSZ/l1wb3tJ0Jm3GNc029TJljRd9oHOC32pd9Yjc0hx4SOD+mvSvh
 aPxwohoKhQ9t470EUhtv7Hkk6BjGdl5zbQc2hWGVdT2VvQYlIVa70U2gUJ2mD4RJdVeA
 K7hzqdVJioYoONDR8mqjCh5y28UskZNBar+N84SJ8k7zFSTnSIoA6gaJzqo1I4rw4bPd
 kLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=EFm1zjU3ivw4r7wE2K3KiUjutSzw+vpUcfyjxfDHyMg=;
 b=GIDbbIz7JQDrSMW/vjlf5FlTcuG/TDwhwgmeNn7/Z5kTvC1KGm7ejGDEq86kHAB0K8
 N11bUUZ64K3z0rXoGUsDEP42+ScKPm2hFD0uZZ/wBbXHXh6lZpnYS8GiXKvoC2S7B4ZK
 BRcIMq9dULvoGpqzJxIgmYPq/64oGFqk0svoi6uc2Wm5IXSIfUGUKktKXdMoQZ88sewP
 mBPQnZnpBPZmIDAHuAK1ysViMfMfsp2WEtV7mylTJ4qd9C4GuAOzPO6mF8rRskzClJ6I
 WLY7KWGSFSYij66dvssDNgIVkO3L+E0tgtpWIkNmYdsZWx7FKhsM3F0Z6jcJnyLT3aaH
 gZqg==
X-Gm-Message-State: APjAAAVVR3QNM+ra/WrQz5LZSM931Z6iH70eflXJ1SO9hB12C4CYn5ZO
 tewK0WKE54dfSY4oWUA9LlFJVu3J
X-Google-Smtp-Source: APXvYqxrnQ0sByze6OBUdFpoQg5V3SKYiCgILzWWa7vcgxRoL8xmDEQ3sxAVUSHzI6T6JKzydgTiBw==
X-Received: by 2002:a5d:9703:: with SMTP id h3mr2703150iol.152.1562612429068; 
 Mon, 08 Jul 2019 12:00:29 -0700 (PDT)
Received: from krtaylors-mbp.austin.ibm.com ([2620:1f7:8b5:2842::32:7e])
 by smtp.gmail.com with ESMTPSA id k5sm22689361ioj.47.2019.07.08.12.00.28
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 12:00:28 -0700 (PDT)
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: 2.7 Release: Freeze Week - What to do
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <2061b2a4-5308-0d65-ad52-4a4ad4dbaca5@gmail.com>
Date: Mon, 8 Jul 2019 14:00:27 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
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

Soon we will branch a 2.7 release candidate. <UPDATE: done, see email 
from Brad> Here are some things to prepare for:

1) Start testing the release candidate as soon as possible - please post 
results to IRC or email, openly discuss any problems that you find on 
your system.

2) Clean up documentation, bring old docs current, add documentation for 
new functionality.

3) Send me any input for release notes that did not make it in a release 
feature (github issue)

4)Bug cleanup/feature (issue) cleanup, add comments, indicate state - if 
something didn't make it in the release, please let me know first and/or 
come to a release planning meeting and we'll take care of it.

5) Master will not be frozen, so new functionality can continue to make 
progress, but please take some time in the next couple of weeks to test 
or contribute docs, etc

Remember: communicate outside your organization MUCH more than you think 
you need to - use IRC, send email, share what you are doing and where 
you are with it!

Happy 2.7 release month!
Kurt Taylor (krtaylor)
