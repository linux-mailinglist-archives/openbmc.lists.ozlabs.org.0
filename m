Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D65190104
	for <lists+openbmc@lfdr.de>; Mon, 23 Mar 2020 23:18:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mTKQ0yrvzDqpH
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 09:18:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HvJZsrcM; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mTJk6qVQzDql0
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 09:17:26 +1100 (AEDT)
Received: by mail-ot1-x329.google.com with SMTP id c9so5015142otl.12
 for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2020 15:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pfO/LsE5BEpDlN+9XFcZMFrheT23ddi997sWwNOeAuk=;
 b=HvJZsrcMKVIU9S3spXDwwPx7CW1ZMunWku6d9u5WIGIYmy/gorXBoLqxHwqzH10j4u
 1FRcmh7G771apyGMVTInE+avB+ZR6CFfuM+R/jrB7bTN1n4+T2IEwFJZrph+eZf62b0I
 iMMHPDdyUbM+DjTp2fos9uWzqCH4kH3km8YkXIqiOVwTooPtIcZf3T8ZJl/9AnzNjWSI
 eelUvx6GacLn5bUivoru+fEpNuUXGlSE9hovQXENM3v1P3221eg92q2tfAsLf/3Ljf3m
 0R86BUbeEJYORKqGm8G6k5zdih5dpiTr5t8XJk/Mnaz+DltkmiCWXxFNSXsi/Icd4W1k
 xMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pfO/LsE5BEpDlN+9XFcZMFrheT23ddi997sWwNOeAuk=;
 b=AsaPMNkaafr4FIdg7+asMmKlC8HPDu3xbUJ5bbBu4o4M08eTmuS2NkynCmifGPvfnv
 MZsIIgfUo3OWll+8KEjo5zSFbYlxBW0tNXm6Hs/zCtBgt4Y5sr37winkmKnKC4cydMNe
 BmQXD3DfeK/4+R+D114oGRzyuI889BRhsqDiHw1+31o60BSi6niErDMvNQuQpl+Y8/QE
 11MpVNFtQpZUBPYv5sLnhz7nlcl0gmArakNa5KvR8ql8ow/PTJmg00m6E+8Rn4fCHDCb
 Pjqrga83Bokq3JNhUHYh4CuQYr8xhwPPIq10FQ7rdQtHUQSuv88yIfh87oljitr/kL2v
 v66g==
X-Gm-Message-State: ANhLgQ18tVyZY71qiBojfugxFt8wnBn2h02gs0D/8xUcKxZfm3uDYoY9
 HUkcvyL8sWhAIbTMWvjwQxlMgQ0YD+k=
X-Google-Smtp-Source: ADFU+vv++/5ovSxRxHbZxxC0MQ7hXnGb2Bvy5MPy3mNwQQeA03pMxWQ29qgSuUGsoRoUT+OpJLTOGg==
X-Received: by 2002:a9d:7a4e:: with SMTP id z14mr20320210otm.78.1585001842863; 
 Mon, 23 Mar 2020 15:17:22 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id i17sm1549283otc.16.2020.03.23.15.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2020 15:17:21 -0700 (PDT)
Subject: Re: Wiwynn CCLA Schedule A update 2020-03-16
To: Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>,
 Openbmc <openbmc@lists.ozlabs.org>
References: <HK0PR02MB3556092B78902EA62BAF33D0FAF90@HK0PR02MB3556.apcprd02.prod.outlook.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <d0744602-31bc-f9de-17fb-659d07c6ec74@gmail.com>
Date: Mon, 23 Mar 2020 17:17:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <HK0PR02MB3556092B78902EA62BAF33D0FAF90@HK0PR02MB3556.apcprd02.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: "LF_OpenBMC.WYHQ.Wiwynn" <LF_OpenBMC.WYHQ.Wiwynn@Wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/16/20 12:48 AM, Delphine Chiu/WYHQ/Wiwynn wrote:
> Hi Kurt,
> 
> Please find the updated Schedule A of CCLA from Wiwynn.

Received and entered. Thanks for the update!

Kurt Taylor (krtaylor)

> 
> Thanks,
> 
> Delphine
> 

