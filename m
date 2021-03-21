Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E362F3430CE
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 05:00:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F33ny6pMNz2yhr
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 15:00:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UVm3+kSW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UVm3+kSW; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F33nj5BVRz2xZH
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 15:00:39 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so6821723pjb.0
 for <openbmc@lists.ozlabs.org>; Sat, 20 Mar 2021 21:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:cc:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=05wtTUWhAFSXSt8xP3f62zkcdn/UStAyPDnpyyX8VDs=;
 b=UVm3+kSWB6djF+mvy77LRxVlPs9HWIA1+PgqrT49WJPulaxQtD3etmeFdgvESCBAz0
 khVYywakbyAvryS2dsgIngyQy16tlL/+d9UTaxXB46hVUEuzYT1yebHT685PIY+jzRBI
 3Qcc6K/CQ/bmSViqAJQ2cEYM1HlCQBFjbTOj/xc3oRgTqvNjwlViROqk+yGe1vNu6irJ
 2uXBEsDysAw0p4MoZ+0ChNdVZr9q+sbzbGLJVqYcS3ZWI6CIUeEUAkvJLR9L3viUc0o1
 peANvwFURmEcdEwDMpqrc+gBap6KO9LqcK2Kgw1i73mKHrrfUPhUKiKn2pRrCqDbn61K
 o4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=05wtTUWhAFSXSt8xP3f62zkcdn/UStAyPDnpyyX8VDs=;
 b=paLNEMhCtK2SZFUpYs+YmxQ2cEQLEfR2VWI57gHeNpsp063DmW/dp2FH+HNiG04s3y
 WhB1iVJjVh0K5U1ltBLjsEeFILpdHbFrFwTvWHpBqnUf3O0OkrM91R8Oc3NCdL9XSQtQ
 e+rkiUW5P+kDqUr7AUBIrOzZC59w9Z2G/5+LNpBkCa+ZFP8mXSCv6c+5P6Fkk5WRtjhD
 KDeMIfm7IRAfbOxZ2VQfMbAQe4KmBMZiGN9HJ1HcWSpz+RiHBd9OFtONPCCjDzsKtBUI
 ZRHMHOnYS1P/ycSnk1FmbaAejKOyYS+X6Pd9WgiTgW7OAzEtGOAnfnIR8FzH6O0uwa4u
 LVUQ==
X-Gm-Message-State: AOAM530kvK8tZZOJQVIYPVV4k/MBjkL7KiKd3/e2khmNewQdu2ynG8Wy
 nkRA2jt2e9LZKZqAIROypOw=
X-Google-Smtp-Source: ABdhPJzMrwHIrvt37XkupaKqYiCKR8J9ejohz73V/ArCqaBwXcf258wgbFzVvtRAyD0sqMylSMZE+A==
X-Received: by 2002:a17:902:be0c:b029:e6:f0b:91ab with SMTP id
 r12-20020a170902be0cb02900e60f0b91abmr21342093pls.2.1616299235788; 
 Sat, 20 Mar 2021 21:00:35 -0700 (PDT)
Received: from [192.168.0.103] ([124.123.104.18])
 by smtp.gmail.com with ESMTPSA id p17sm9542846pjv.49.2021.03.20.21.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 21:00:35 -0700 (PDT)
To: openbmc@lists.ozlabs.org
From: Sunitha Harish <sunithaharish04@gmail.com>
Subject: UnitTest using the /tmp file system
Message-ID: <158971a4-119a-eeb4-bf83-72ed17e29d9f@gmail.com>
Date: Sun, 21 Mar 2021 09:30:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: deepak.kodihalli.83@gmail.com, edtanous@google.com,
 bradleyb@fuzziesquirrel.com, gmills@us.ibm.com, geissonator@yahoo.com,
 ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

This is regarding the unit tests in various repos under openbmc like: 
phosphor-bmc-code-management, phosphor-logging, phosphor-networkd, pldm 
etc . I have seen the testcases using the /tmp filesystem to create the 
directories/files when the UT is run.

I followed the similar way of writing the UT in one of my commits 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/37352 .  As per 
the review comments in this commit, using the /tmp file system for UT is 
anti-pattern, and this needs to be changed by mocking the same. I agree 
that this is a valid thing to do.

Now this email is to discuss why this was originally done? Can the 
community come-up with a generalized solution for this ?

Thanks & regards,
Sunitha




