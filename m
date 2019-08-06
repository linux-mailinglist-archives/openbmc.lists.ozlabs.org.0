Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7957B831E1
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2019 14:52:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462vfp4JmszDr2y
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2019 22:52:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=santosh.puranik.ibm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TXO1L1Rv"; 
 dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462vdk01n6zDqtp
 for <openbmc@lists.ozlabs.org>; Tue,  6 Aug 2019 22:51:18 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id b13so41464786pfo.1
 for <openbmc@lists.ozlabs.org>; Tue, 06 Aug 2019 05:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=IlcXiWAn5/2OfkY3mSD7jUi4TeWY8OWa0irwaWzw2Y0=;
 b=TXO1L1Rv3g8n3TiuVyUS6xI68lzZauW2coiBORvozY7N0NsKSo/rDStzAV/nVkg29A
 ZMw3bir9gnL6SZXnx708whOTZoBcEuEz/MNO43QD+xiNgGyl5eCpowGMUXfXm4xrbnM5
 vF4NO4hlE01QAZOcf98q91+awM9FLOEWzvhZLI+JhMFtMKBe4MSIs5mqtzLJqJWlQpBb
 xt6E+O2O0CurBS2HUljn8qEATc6smCnZt0/Ti44kB+h+PHzUq6grec3phTkdSZMRAv/5
 Q0DR8YtGEz3ZG/TA60VQo12ss7kyCE+TnUaeM49SZPFGN5delJZutTGMm+IcprlIRjQe
 iMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=IlcXiWAn5/2OfkY3mSD7jUi4TeWY8OWa0irwaWzw2Y0=;
 b=BsS//1vwfLBwYcXxfugXV05qwSJICjU47KBlaTRk2UjHItbgn9aOqzYVu5J25taufV
 hjMqHDEVAxs/9oKLWlZjDbtIjTSS5MD2IiRsYj3b7ZpP7DqHvbcvSvPC9tPLLPH9R9J4
 Zx5wZHIOwKv5ac5ohrg3utoMyztSK1LDrRrE9uOCA58F1vVqQLAd7FHbkLvBYZHq8rs4
 QApg6g7riXASOJm9uHPLOs4H74gQH03tR4LOLTWkH7qdliji/22gktUC09V9ls7+x42b
 ngyV4LyT09mKZpZG0DvoOqxBzm/ZPmLCukSVslKf+rCR+1YcMPQae2MfXmd4/mtXZOtG
 l8sQ==
X-Gm-Message-State: APjAAAVQZb9umYF/ENWy28gUVHw+cHNuqZAJRLCP2QHLmcaLkX1XLiZm
 rl+jgQZ8e6WzsVsmVNI3vWY=
X-Google-Smtp-Source: APXvYqx6RQruCY9O343AA/OY9IC2s6K+r3h5kuiJEH0VkL/WawLMwJkuWt6+puPyi/0Ck5ehjuvzEA==
X-Received: by 2002:a65:6288:: with SMTP id f8mr2873541pgv.292.1565095873422; 
 Tue, 06 Aug 2019 05:51:13 -0700 (PDT)
Received: from [192.168.1.15] ([183.82.20.208])
 by smtp.gmail.com with ESMTPSA id k22sm94418536pfk.157.2019.08.06.05.51.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 05:51:12 -0700 (PDT)
To: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
Subject: New Repo Creation Request
Message-ID: <8b047191-7648-587a-2b14-8cbb94aaf1c7@gmail.com>
Date: Tue, 6 Aug 2019 18:21:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
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

Hi Brad,

Could you create two new repositories:

ipz-vpd-parser : Parser application for IPZ format VPD.

keyword-vpd-parser : Parser application for keyword format VPD.

The design document that details these applications is here:

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22491

Thanks,

Santosh

