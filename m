Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E34E313AC
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 19:20:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FrmZ5rxZzDqZw
	for <lists+openbmc@lfdr.de>; Sat,  1 Jun 2019 03:19:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oQt8IruY"; 
 dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Frm3520pzDqMF
 for <openbmc@lists.ozlabs.org>; Sat,  1 Jun 2019 03:19:27 +1000 (AEST)
Received: by mail-oi1-x236.google.com with SMTP id u64so8312903oib.1
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 10:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fQr2rHn4GGGnvKpXNydzlJauGjHzBrUcdm9nfT7ejdM=;
 b=oQt8IruYuvAsOLId/ONmGCOYdGmIN59fSZ85lqJV/uIMjztUPiLztfs/JJErd/xOk9
 HtpGu/7F1L8q6MQGHixBgeupKIGE33VeXMXMiJtuKFdawjLmk4nHV0RAsVhEx/S0PcdW
 ksy27oE2M/LEPRTZ5bQubQxFvGEh6oOMYu5+AfWJDKBtG1oRqq4Jta7friqe0g28go7T
 7jxGhMYgJDAbU3LrSgHgcjpbbjZYgejLOOeeHqwQ4bJ8BLDparwok6TEnDxa6GEzsL3v
 7mbrKl4ssUVT8Y9JsRui4bL58F/AKnjLfDYIAI1upgkdrhHCw2VVZtLVcDcSXK6XEvS7
 muRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fQr2rHn4GGGnvKpXNydzlJauGjHzBrUcdm9nfT7ejdM=;
 b=aqXZYB2PdHEqjnOnMxR9piblJeIWnlVS+udEpalmcrn/3UjNw52c/ub44+cBZyOezA
 RfguOCwgrZyNaTHlW3HNjy24r/qbAD2d3CdtGzEbFpkDkxwOY0AYsn8OhsvaMfoGgyHj
 doXvBX5kslH2rBsg6p8BhOc9cebtJL3XTjeRKE+vmlYUL2uvehywAXttCaI81pAZ9IQl
 lKfpLz8ItFUvEPSRnOzmr3Rdyux+yTo25sr6CoQsiLTmFPHkVhQsPYD+qvERtMh6CsXw
 D89ZFTFdRDR79Wib40cFl8BQLJFcT/d4mYwXNVqmNq0g6pDsR4LeB1bf7rq147Z9H21C
 ycvw==
X-Gm-Message-State: APjAAAWSWSFApbjVx5Z/7Zvba5JlLzSwx6auyiqG3zbFkz4pOedLy7Q0
 O5N7Iyzldwp3IstSe5bycPY=
X-Google-Smtp-Source: APXvYqwPWCHMNRFn86ThDB8eLX2qR/2dTz5GtCtwu5dQp2v7U3/9hLBlwebI/D5DAYsQL1lI/l9Qyg==
X-Received: by 2002:aca:47d5:: with SMTP id u204mr6486028oia.83.1559323163882; 
 Fri, 31 May 2019 10:19:23 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id v20sm2102129otk.66.2019.05.31.10.19.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 May 2019 10:19:23 -0700 (PDT)
Subject: Re: Signed CLA from Wistron
To: Claire_Ku@wistron.com
References: <96a177bb54474ad0944934a0efe8ddf6@wistron.com>
 <CALVHhedPVn8bkC3hed9_6w6O9YDhw==T_vrwSfS4+gnEUnFfQQ@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <dc4eea14-ace1-1ad6-e1d7-3e0a4a9787a3@gmail.com>
Date: Fri, 31 May 2019 12:19:22 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CALVHhedPVn8bkC3hed9_6w6O9YDhw==T_vrwSfS4+gnEUnFfQQ@mail.gmail.com>
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
Cc: Mike Dolan <manager@lfprojects.org>, openbmc@lists.ozlabs.org,
 Timothy_Huang@wistron.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/30/19 4:16 PM, Mike Dolan wrote:
> Hi, this file does not appear to be signed.

Welcome! I have received the signed version. Your CCLA has been accepted.

Kurt Taylor (krtaylor)

> 
> Thanks,
> 
> Mike
> 
> On Wed, May 29, 2019 at 5:39 AM <Claire_Ku@wistron.com 
> <mailto:Claire_Ku@wistron.com>> wrote:
> 
>     Dear Sir/Madam,____
> 
>     __ __
> 
>     Here is the signed CLA from Wistron Corporation.____
> 
>     Please help to approve it.____
> 
>     Thank you very much.____
> 
>     __ __
> 
>     Yours faithfully,____
> 
>     Claire Ku____
> 
>     __ __
> 
>     *---------------------------------------------------------------------------------------------------------------------------------------------------------------*
> 
>     *This email contains confidential or legally privileged information
>     and is for the sole use of its intended recipient. *
> 
>     *Any unauthorized review, use, copying or distribution of this email
>     or the content of this email is strictly prohibited.*
> 
>     *If you are not the intended recipient, you may reply to the sender
>     and should delete this e-mail immediately.*
> 
>     *---------------------------------------------------------------------------------------------------------------------------------------------------------------*
> 

