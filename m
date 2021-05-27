Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BAA3926BC
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 07:05:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrG301S3pz2yyK
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 15:05:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=nx/kbKb9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=ckimchan17@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nx/kbKb9; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrG2h0B42z2xfx
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 15:04:41 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d16so2705169pfn.12
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 22:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=I2udizpPEiQxhF6khf4hrt6J+xNU4qFZR3tyK9fHW3I=;
 b=nx/kbKb9MT7gCt920umBSF+L9LWLn1t2YFHfcouIBd9IE7paXygUwQbh+pvkBnjtQH
 pNk7ppzmP1ZYyQsAz1QM3euMqcUgxxbsh/ntQ/6Ka3TEFo0wkxNEfFLxtNl6NPQqbhw4
 aZGKwVY3iUaqs37Jr23K7rGIXNarGIyned3DbHZ7HfH5zC0Jgp54EEY1GJg0XqenTQSp
 bldphdU4cCsEKWL/zMthXasjMh1dgv6zTtfWqQHazuZTVwM/0CqSPMILDkX8KkABPQMJ
 zqe2Aignhfsy+Vg+w/aCpOLacxHr+in05D5qNs2pVpeX8KSmDH+6a9/idq6sGj8ZYv/M
 TDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=I2udizpPEiQxhF6khf4hrt6J+xNU4qFZR3tyK9fHW3I=;
 b=LQ1e+Zjsknewcd41DwNOgtIXk7K4oablFCAgkSLBnoYDFJ2dcxcjmN6FCSmAuGuGKH
 NhpvWpO6sWrxQkU7oMvtC46jNjB/HrLiNq570Yisl8gmQt2IxabxnTODp6uHF/cbxX+z
 F+zUiB+q40jqCk2dCRzenPMJTH9fD0FDPZbTt1hSwERo24vaCPsxnfDFuuXjKZPpacqn
 Q8YnHI7gigHPA+nqmfEjiqplIMSV7ggpOM36dGxoUQdAxpT7yDdi5aDOuxuGrGs5es9O
 sSS5bpvIJdG2AWxcEz0Z0zrU/3lNFjCOoBiTu/YD+L7eG68IQ6ynZf3Nyyzakid9Wv6A
 OKGg==
X-Gm-Message-State: AOAM533AyRdC709dPEsz9f+9nqFPOeRqszJef9Tee0jedMLEf+wNS3TA
 AzumpPX9KVQFgjTTtTCgWi1Dv67HVUainA==
X-Google-Smtp-Source: ABdhPJzjr5jECWmsKg0+SCFCI67J1pBEFwPqwMKU7kjwCGAau+pyzIXvKO+KH7Sac+1Cj7RBb7+L2w==
X-Received: by 2002:aa7:9632:0:b029:2dc:6ef5:b1d3 with SMTP id
 r18-20020aa796320000b02902dc6ef5b1d3mr1982902pfg.53.1622091879451; 
 Wed, 26 May 2021 22:04:39 -0700 (PDT)
Received: from [192.168.12.20] (36-224-29-112.dynamic-ip.hinet.net.
 [36.224.29.112])
 by smtp.gmail.com with ESMTPSA id l192sm767162pfd.173.2021.05.26.22.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 22:04:39 -0700 (PDT)
To: openbmc@lists.ozlabs.org
From: Jeff <ckimchan17@gmail.com>
Subject: How to submit meta subfolder
Message-ID: <fd2a0d0e-988c-8bab-aedd-1253ba7042ef@gmail.com>
Date: Thu, 27 May 2021 13:04:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
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
Cc: jeff9_chan@asrockrack.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

We would like to submit meta-asrockrack as a sub folder of openbmc.

I followed the steps describe in the document to add remote server:
      git remote add gerrit ssh://openbmc.gerrit/openbmc/meta-asrockrack

when I tried to push it I got below error:
     fatal: project openbmc/mata-asrockrack not found
     fatal: Could not read from remote repository.

     Please make sure you have the correct access rights
     and the repository exists.

Could you help?


Jeff

