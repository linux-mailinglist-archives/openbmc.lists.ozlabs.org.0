Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4124B248DD6
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 20:19:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWK254jDDzDqW5
	for <lists+openbmc@lfdr.de>; Wed, 19 Aug 2020 04:19:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=u6baKcq1; dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWJdS2Sw0zDqsX
 for <openbmc@lists.ozlabs.org>; Wed, 19 Aug 2020 04:01:47 +1000 (AEST)
Received: by mail-oi1-x230.google.com with SMTP id l84so18677185oig.10
 for <openbmc@lists.ozlabs.org>; Tue, 18 Aug 2020 11:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=X3pwLY+yCrykp9jXz8SksFDUDqbAjhADNwb2ztbLNbA=;
 b=u6baKcq1bsR6HTKNbV0rCQgWdNdPWG4/MTBWyetvLtq9zwg9MmYD2W4oGsW9roo7cZ
 k9hOQ7KY8v8tjIi/JBSxlkSZfefOs3Ew7iqxe1z7+bEGUIKXO6aHDF/1xmz3/LoYcvfp
 w4YL7FiBbgMzeVp9og65KM/jXV5dwYaQmQoA3atkvanhTRWgzvaSTI3EgGE75e/XfFJY
 MPqvNyi1BO+A06VpHDYUsHItQZW+dbTEKVKW9Jr+u4kTCfkf+Nz8l4VKYPPGuKzS22qh
 IhsE3jwu++2TQZmaqkUrWrEuGgOUQI3NfAlDbRxCNl0EgJR193/lzVrx+AMwrpyeyTCG
 i8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X3pwLY+yCrykp9jXz8SksFDUDqbAjhADNwb2ztbLNbA=;
 b=eFc07Hj6v7Ag5vxVjMwM9XZhJu9NFOVaOvfnBnmk7yw7zLlYKLEnpZSoE3EUYlOs+G
 ERm6t8nwz8tFs+EVKj0TuQvYImgL6y7TbjZ+E86JNz2Ud4T+IltKW0/X8STbQgbT3i2G
 OuVYNDwrau6R4dTPiYOQAaQXj/qFbrk85vhSJbPFaVps9ocuGXSbRbz3KeYKBBM+rKft
 btbBSFKdJjzd7quoAS6Ks/y+blfcyxZvU3FinvVw2JRd/a2q44dPopS0hkTSUeR6sMQv
 +Px29RFZCtSnL/Ge1o0YNQXYCPQeaEo/sa54vc9mAONOitq7UrBzo1dbUSn5GMTAA4+7
 Pe+w==
X-Gm-Message-State: AOAM533/8ibiWeinm2zhJobfC7yhPYsZDcjYvkobCp3JPiicCfwnvDV5
 fslQslHcI0mn1rjqC7UhJTolcx0yhqSmPQ==
X-Google-Smtp-Source: ABdhPJw9HjhJgB48tdqGhePiL6A98bILtqOC9O/HFqLDMriBeRuKSqrGsjk9HPvOlFwYqVGAU/vPag==
X-Received: by 2002:a05:6808:8ef:: with SMTP id
 d15mr888234oic.134.1597773702142; 
 Tue, 18 Aug 2020 11:01:42 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id g1sm4066783ots.35.2020.08.18.11.01.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2020 11:01:41 -0700 (PDT)
Subject: Re: Bytedance's CCLA Schedule A update 2020-08-12
To: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <CAGm54UHjx2Mtrw19zfjqo2Mq05wyZkdusCcj+23ckzDPDYc_Dw@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <bda80a20-a9df-d272-8a29-5b47cec034bf@gmail.com>
Date: Tue, 18 Aug 2020 13:01:40 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAGm54UHjx2Mtrw19zfjqo2Mq05wyZkdusCcj+23ckzDPDYc_Dw@mail.gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/17/20 12:32 AM, 郁雷 wrote:
> Hi,
> 
> This is an update of Schedule A from Bytedance.
> Please help to review and update it.

Received. Looks good, thanks for keeping this updated!

Kurt Taylor (krtaylor)

> 
> Thanks!
> 

