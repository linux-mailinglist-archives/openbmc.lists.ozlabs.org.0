Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BE3877BF5
	for <lists+openbmc@lfdr.de>; Mon, 11 Mar 2024 09:54:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=w6YF2xFX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtVvZ20H3z3dKY
	for <lists+openbmc@lfdr.de>; Mon, 11 Mar 2024 19:54:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=w6YF2xFX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.133; helo=out30-133.freemail.mail.aliyun.com; envelope-from=guoheyi@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtVtz06fWz3020
	for <openbmc@lists.ozlabs.org>; Mon, 11 Mar 2024 19:54:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1710147235; h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
	bh=ZSq6W9e4lWnBmGAc85HDV05eA2V1iMo/Dqwen+3FSmU=;
	b=w6YF2xFXCoABAsmOBG3IrJCPURJ/Zer0QSp7d5ViMrLCrZLJLl5AfPDAcW13D+cimnb8uGr5BJtEdeJ/lCEqLLTzUtphn8pkSaksMaJ902nI1TgYvF7Yxjt1o3e5f2B8UpJNZGcUh+dGZ0dk7KBeh+HBPGJIPxaFb4JexbnVhZ8=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R541e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=guoheyi@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0W2EPo62_1710147233;
Received: from 30.221.145.13(mailfrom:guoheyi@linux.alibaba.com fp:SMTPD_---0W2EPo62_1710147233)
          by smtp.aliyun-inc.com;
          Mon, 11 Mar 2024 16:53:53 +0800
Message-ID: <027f9e46-67ff-4c15-a59f-53c044291812@linux.alibaba.com>
Date: Mon, 11 Mar 2024 16:53:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Heyi Guo <guoheyi@linux.alibaba.com>
Subject: [ikvm] Centos enters blank screen when keeping pressing certain key
To: OpenBMC List <openbmc@lists.ozlabs.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

Test ikvm with Centos stream 9, and configure "Power Saving 
Options"->"Screen Blank" with 1 minute, we found ikvm will enter blank 
screen when we keep pressing one certain key, like space key. However 
the situation won't happen when using a physical USB keyboard.

Is there anyway to keep active from the point of view of the host OS for 
this test case?

Thanks,

Heyi

