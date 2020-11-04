Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 847C82A657C
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 14:47:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CR7HZ35w7zDqY5
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 00:47:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::331;
 helo=mail-ot1-x331.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MirXHHcI; dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CR7BZ6mZzzDqZw
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2020 00:42:45 +1100 (AEDT)
Received: by mail-ot1-x331.google.com with SMTP id n15so19290572otl.8
 for <openbmc@lists.ozlabs.org>; Wed, 04 Nov 2020 05:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nEw5gR0bWKGK6RPVmvB6RwKpnBTyTwn1aW8Gb3JRUjo=;
 b=MirXHHcI+HSgU62kJe7JRsLCzOnNvrfeqNsphH5IYaz8WozJMWz2KE3NbrsBXjBKvd
 XaIQXUexbd4x25vPbWCKwtNA8isuymEodUDDCw9i/b/mBSRa74kwO/bw9YFykQDXXEzj
 RLAdJ53TiuJmRtTGQ+/rdonlJJwHZCfqMbVc9cX8c8pVGpF0dEqVxFF1PYYIfaJIaPdX
 3BrqTVDd7Gh8AMbHdVnK12otSkUrzpbd4EEYRnGDk+GXaLYnrX6xM/Gupy8tExaSCHM+
 iC0aat2aDyl5YMPYYBhkdjVCbVYjD3SHkSgLO/CpD7Hx19al8I5ufNgJZ1C7rqAqNQh2
 k9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nEw5gR0bWKGK6RPVmvB6RwKpnBTyTwn1aW8Gb3JRUjo=;
 b=WyKqhT4CjvlrxHmY0xVnTgyxsahNfPU5a8/wp3kQD44S7g3aPaDpj2QtVyvPRvgI9v
 v2PyiBQHy+GRWC3DpvvcbxpeCq8djxYjYGfXSZBFQlDGVJQgCK5CehHXM9khXItYSDIV
 Uy9zzmYFXP7Oa2Ef7T0ZHjRZinL6vWsOutdooaOuCSmVWr6km0qU59CRBYlgdnWOupVP
 5BD99xItN4vcDJrTGPPg7cHe8L+Kb4OpkGFBjwSYQjqBLptadifIzXWKyyz2jT4hYmCG
 p82KbCGSZ6NbL4TXS0NnTXB+MGDRSo3WwM4xf2IHCrpMW/pY9+OL0WZ9l1gKA0dY9cex
 Wqhg==
X-Gm-Message-State: AOAM533otzO4ricDUV9b4cnxgMg940s5i1YTnXQ5c8j7fYHjmYxDJCwE
 T34TK5K7gbxZA2hxrwRhPP8=
X-Google-Smtp-Source: ABdhPJzu3xudaJ6AKUnyExnN3Pwf7Ek+QnvIOzisVik7E0ZSqqib4URtOldZEVDGFGsLLkxihmhprA==
X-Received: by 2002:a05:6830:615:: with SMTP id
 w21mr10892045oti.126.1604497361751; 
 Wed, 04 Nov 2020 05:42:41 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id 4sm436830oij.40.2020.11.04.05.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 05:42:40 -0800 (PST)
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8mkkganVzdCB3YW50IHRvIGpvaW4gdGhlIG9wZW5i?=
 =?UTF-8?Q?mc_developer_community?=
To: =?UTF-8?B?5p2o5YuH5YW1KOacq+WyqSk=?= <moyan.yyb@alibaba-inc.com>
References: <8da567c0-b5a4-47c0-90d6-d2de96ae99e5.moyan.yyb@alibaba-inc.com>
 <CADy_Pt3ukjs64bRkuEBB699cuvNadzatsBmQ_prSWWTokB0uhQ@mail.gmail.com>
 <beb7063a-f3ff-1de0-130e-0f98c3f35729@gmail.com>
 <32fea865-04f1-4927-bb3e-77d650098d28.moyan.yyb@alibaba-inc.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <964928d9-3751-3a7e-7b06-fe35d238cb9f@gmail.com>
Date: Wed, 4 Nov 2020 07:42:39 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <32fea865-04f1-4927-bb3e-77d650098d28.moyan.yyb@alibaba-inc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?B?5bi455CzKOeJueedvyk=?= <terui.cl@alibaba-inc.com>,
 James Mihm <james.mihm@gmail.com>,
 =?UTF-8?B?5p2O5b+X5YW1KOi+ueiNkik=?= <zhibing.lzb@alibaba-inc.com>,
 openbmc <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?5p2O576/KOS5ieWkqSk=?= <yitian.ly@alibaba-inc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/4/20 3:21 AM, 杨勇兵(末岩) wrote:
> Hi James & krtaylor，
>      Here is the CCLA, and please help to check。
> Thanks.

Your CCLA has been accepted, welcome Alibaba!

Kurt Taylor (krtaylor)

> 
> 
>     ------------------------------------------------------------------
>     发件人：krtaylor <kurt.r.taylor@gmail.com>
>     发送时间：2020年10月28日(星期三) 23:51
>     收件人：James Mihm <james.mihm@gmail.com>; 杨勇兵(末岩)
>     <moyan.yyb@alibaba-inc.com>
>     抄　送：常琳(特睿) <terui.cl@alibaba-inc.com>; openbmc
>     <openbmc@lists.ozlabs.org>; 李羿(义天) <yitian.ly@alibaba-inc.com>;
>     李志兵(边荒) <zhibing.lzb@alibaba-inc.com>
>     主　题：Re: I just want to join the openbmc developer community
> 
>     On 10/27/20 9:02 PM, James Mihm wrote:
>      > Welcome Moyan,
>      >
>      > If you plan to contribute code, please download and complete the CCLA at
>      > https://github.com/openbmc/openbmc/files/1860741/OpenBMC.CCLA.pdf, and
>      > mail to this mailing list.
>      > Then those developers listed in the CLA will be able to submit code
>      > changes. See https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md
>      > for more information.
>      >
>      > There are several workgroups for the project that you can participate
>      > with. See https://github.com/openbmc/openbmc/wiki for more information.
>      >
>      > James.
>      >
> 
>     Thanks James, my simplistic filters missed this email.
> 
>     Moyan, feel free to contact me if you have any questions with the CCLA.
> 
>     Kurt Taylor (krtaylor)
> 
>      >
>      > On Tue, Oct 27, 2020 at 6:31 PM 杨勇兵(末岩) <moyan.yyb@alibaba-
>     inc.com
>      > <mailto:moyan.yyb@alibaba-inc.com>> wrote:
>      >
>      >     Hi，
>      >          my name is moyan,who is  workinig for alibaba company.  My
>      >     compay just want to join the openbmc developer community, and i have
>      >     subscribed to openbmc by accessing the website of
>      >     "https://lists.ozlabs.org/listinfo/openbmc".So, what should i do next?
>      >
>      >     Thank you.
>      >
>      >
>      >     -------------------------------------------------------------------------------------
>      >     杨勇兵（末岩）
>      >     基础架构事业群-计算与存储事业部-服务器产品
>      >     邮箱：moyan.yyb@alibaba-inc.com <mailto:moyan.yyb@alibaba-
>     inc.com>
>      >     Mobil:182-6717-9546
>      >     办公地点：浙江-杭州-余杭-EFC英国中心34楼
>      >     -------------------------------------------------------------------------------------
>      >     本邮件及其附件含有阿里巴巴集团的商业秘密信息，仅限于发送给上
>     面地址中
>      >     列出的个人和群组，禁止任何其他人以任何形式使用（包括但不限于
>     全部或部
>      >     分地泄露、复制或散发）本邮件及其附件中的信息，如果您错收本邮
>     件，请您
>      >     立即电话或邮件通知发件人并删除本邮件。
>      >     This email and its attachments contain confidential information from Alibaba Group, which is intended only for the person or entity whose address is listed above. Any use of information contained herein in any way (including, but not limited to, total or partial disclosure, reproduction or dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this email in error, please notify the sender by phone or email immediately and delete it.
>      >
>      > 
> 

