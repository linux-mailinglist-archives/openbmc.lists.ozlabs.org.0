Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 070A0269E56
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 08:21:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrClp3sPJzDqRm
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 16:20:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AlkGYir+; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrCkv5kkrzDqCh
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 16:20:05 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id c196so1362549pfc.0
 for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2020 23:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=elF/vGl/jwxZbSpEqcSn5zQaLpcjhyDOSUwmb4BM0dk=;
 b=AlkGYir+yRjORYGwXv/zwHZbv0XGhrJtjoVmXGb1X0WSyXO9v2O6mFwHI3h7qP5RBj
 JtpixGJzvM/RxxbqK9bxRoEbUw22FaEQqaj5U31k46Xllib4atge/m6JghfmHamnMLfP
 hlRsqe0z6xnk/ZcUvKa6U6icYAR0va6OdkFPh/VKsITArQCAr3AAtQxr7Eug5XhMwjbx
 ErWoeNwnRkC70lKWYGs+ttxJEm9YW7dJ7y0AQiq1Ke0cGyTOILJwFLI3DKIpIcW1cfg2
 FHatl9HtwEdqSVvw16ogBpMAdvjgswgvTxUc3fyLFKtGjlKKyJXKEoz0uhimwCyKWwtR
 IU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=elF/vGl/jwxZbSpEqcSn5zQaLpcjhyDOSUwmb4BM0dk=;
 b=EblAnmre3izA44qQMWoXhp59X7VWP6f9dEWMbEmBItx7q4b7Hk72pHwFNc+AyF3lzg
 9sT4e4IONDxqdLz+tz2TNMPaF/GGi1395fa4UauXhGc2KaUNyU0Kpr7NUyBuePd4D9AE
 zHe8zXa+caPFVhdnBN2R1kaRWaEj1BKrLF+rU5xfNACSIVJ6ERfwq14Nj6d9jNCFytEk
 v/J8eI5lZxeyLPwhJHZUWTK7NjB/i10lSulS34mZJHcRuE4eM9nZ9dE5sZpRb36gR4SM
 DTPgD8L6l5aaWo/p0XFhFC1gFEAB2aN/ZKtCvcOdJYpYjxEvtBXYvGdiRvvGFhQKhy5w
 kcPw==
X-Gm-Message-State: AOAM5303a6TQntgf4phQ/bB0iSJOS+I/CcyHF96NwfQ76xuRcdU6ck/g
 qCTztKrMslfMCRl3zpQwNU+VzAwpqzFAyA==
X-Google-Smtp-Source: ABdhPJwtMOkQS1EAcKpiwoSt4WSTfhxv2LnLdNjWeWnpXdDf7brc0m9nnyIDevDV/9oVwoAyPwFRmA==
X-Received: by 2002:a63:1c18:: with SMTP id c24mr13666024pgc.30.1600150801469; 
 Mon, 14 Sep 2020 23:20:01 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.104.218])
 by smtp.gmail.com with ESMTPSA id j144sm12482834pfd.106.2020.09.14.23.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 23:20:01 -0700 (PDT)
Subject: Re: bmcweb : https client support
From: Sunitha Harish <sunithaharish04@gmail.com>
To: apparao.puli@linux.intel.com, openbmc <openbmc@lists.ozlabs.org>
References: <5c93d1fa-102b-61a1-1dd8-4a371d7c2a2a@gmail.com>
Message-ID: <84607e86-b9f9-cf02-9971-71df98878b85@gmail.com>
Date: Tue, 15 Sep 2020 11:49:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5c93d1fa-102b-61a1-1dd8-4a371d7c2a2a@gmail.com>
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

Hi Apparao,

Any information on this? We are looking for this change with high priority.

Thanks & regards,
Sunitha


On 11-09-2020 17:03, Sunitha Harish wrote:
> Hi Apparao,
>
> This is about the https client support at bmcweb. Commit: 
> https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/31735/. IBM is 
> interested in this commit. We have a use-case requiring the redfish 
> client to be able to subscribe for event notifications over secure 
> channel.
>
> Can you please share your plan to get this commit to the master? Do 
> you have plans to implement the client certificate support as well ?
>
> Thanks & regards,
> Sunitha
>
>
>
