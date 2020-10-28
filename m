Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 044DC29D0DB
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 16:52:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLtNt2G1XzDqSx
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 02:51:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235;
 helo=mail-oi1-x235.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cImNwsJT; dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLtN34dRGzDqRs
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 02:51:15 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id y186so37340oia.3
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 08:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gfUPO9yRUZLG0W9JQPQq/0E4FpWJN3Qv9WgEkFBz2pY=;
 b=cImNwsJT7wlOMVsDRHq3iP//9Os1Tjb3a8legNbF1sW9U7iQT4ukklATvfqnzXr2mQ
 4FeQ0A/tlogl078x2HS/8XtuuEpiVPN53ywe6rewRXKmFWZzrkMGopVou8BBGfPNAVje
 EqKRoGSQJCP8Twotw6h5E65GIDXNC3lBCyQRQWdEfKmzyd2IGmRcOFd1vDdtsyOR2t85
 9BJg4msabQu6EUBzaE+/ZmO8dO9NBIohSt4fWdQrzn3rN83JUVU2l64k62OZrgTW5Iyg
 iaJOlk2zI5Q7x+PrBIsy1EKdkX0PDKuF+6o94bxrEzwa7d6/+fH+x+3YYGIpKuU+mg0Q
 yvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gfUPO9yRUZLG0W9JQPQq/0E4FpWJN3Qv9WgEkFBz2pY=;
 b=RXPr+CD660mDwwSt4qlg/ci0U4tOtIOaJ61BGpvNzraEAtp4Jw97kxlUbiuJLHYjsw
 d8Npzc9eYAs3rXJeDsxKLW7T0G4X6CUo4flZxtLtJV6iPdaLrQo7hqh8Uxby8qnAkdCt
 QHAEAjgnVWKBemgKls+JpRmdPTvYZmh38rKXQkLWRoV/ZNnQPkUGGmB3g1qLLQls7BsT
 ryx5XUj12Gb0Mva9q/Xw2FEA6YLOEH06GAsbVwzfTDeusg6ICIUmGKtvSRJK/1RcuqdR
 pIFqtDpslvVWPuBHcSSxoWRq5L2Lgre0k4mNYz2TKaUxfSg+TnuHo2fsS9In8KuxrGdA
 wtFQ==
X-Gm-Message-State: AOAM533U2sfTOaUwa5FSizLUlo9xP2CdtX6ulOQxfDJolnT3SjrtrWtS
 iy47E9gE8e5WajuGwsNsPo8=
X-Google-Smtp-Source: ABdhPJz4yn8je6gSjyBw42q7GnltakEzuM91vcCwO6o25lYf0YsbDY0SM5f2X5yTk/uTVm/daWyinQ==
X-Received: by 2002:aca:a9c8:: with SMTP id s191mr15736oie.11.1603900271709;
 Wed, 28 Oct 2020 08:51:11 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id f142sm2770288oib.10.2020.10.28.08.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 08:51:11 -0700 (PDT)
Subject: Re: I just want to join the openbmc developer community
To: James Mihm <james.mihm@gmail.com>, =?UTF-8?B?5p2o5YuH5YW1KOacq+WyqSk=?=
 <moyan.yyb@alibaba-inc.com>
References: <8da567c0-b5a4-47c0-90d6-d2de96ae99e5.moyan.yyb@alibaba-inc.com>
 <CADy_Pt3ukjs64bRkuEBB699cuvNadzatsBmQ_prSWWTokB0uhQ@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <beb7063a-f3ff-1de0-130e-0f98c3f35729@gmail.com>
Date: Wed, 28 Oct 2020 10:51:10 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CADy_Pt3ukjs64bRkuEBB699cuvNadzatsBmQ_prSWWTokB0uhQ@mail.gmail.com>
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
 openbmc <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?5p2O5b+X5YW1KOi+ueiNkik=?= <zhibing.lzb@alibaba-inc.com>,
 =?UTF-8?B?5p2O576/KOS5ieWkqSk=?= <yitian.ly@alibaba-inc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/27/20 9:02 PM, James Mihm wrote:
> Welcome Moyan,
> 
> If you plan to contribute code, please download and complete the CCLA at 
> https://github.com/openbmc/openbmc/files/1860741/OpenBMC.CCLA.pdf, and 
> mail to this mailing list.
> Then those developers listed in the CLA will be able to submit code 
> changes. See https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md 
> for more information.
> 
> There are several workgroups for the project that you can participate 
> with. See https://github.com/openbmc/openbmc/wiki for more information.
> 
> James.
> 

Thanks James, my simplistic filters missed this email.

Moyan, feel free to contact me if you have any questions with the CCLA.

Kurt Taylor (krtaylor)

> 
> On Tue, Oct 27, 2020 at 6:31 PM 杨勇兵(末岩) <moyan.yyb@alibaba-inc.com 
> <mailto:moyan.yyb@alibaba-inc.com>> wrote:
> 
>     Hi，
>          my name is moyan,who is  workinig for alibaba company.  My
>     compay just want to join the openbmc developer community, and i have
>     subscribed to openbmc by accessing the website of 
>     "https://lists.ozlabs.org/listinfo/openbmc".So, what should i do next?
> 
>     Thank you.
> 
> 
>     -------------------------------------------------------------------------------------
>     杨勇兵（末岩）
>     基础架构事业群-计算与存储事业部-服务器产品
>     邮箱：moyan.yyb@alibaba-inc.com <mailto:moyan.yyb@alibaba-inc.com>
>     Mobil:182-6717-9546
>     办公地点：浙江-杭州-余杭-EFC英国中心34楼
>     -------------------------------------------------------------------------------------
>     本邮件及其附件含有阿里巴巴集团的商业秘密信息，仅限于发送给上面地址中
>     列出的个人和群组，禁止任何其他人以任何形式使用（包括但不限于全部或部
>     分地泄露、复制或散发）本邮件及其附件中的信息，如果您错收本邮件，请您
>     立即电话或邮件通知发件人并删除本邮件。
>     This email and its attachments contain confidential information from Alibaba Group, which is intended only for the person or entity whose address is listed above. Any use of information contained herein in any way (including, but not limited to, total or partial disclosure, reproduction or dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this email in error, please notify the sender by phone or email immediately and delete it.
> 
> 

