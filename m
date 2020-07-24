Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C78622CAE3
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 18:23:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCvd15F66zF1D5
	for <lists+openbmc@lfdr.de>; Sat, 25 Jul 2020 02:23:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jkgXgbjE; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCvb26gFPzF1Cr
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jul 2020 02:21:18 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id l6so4718433plt.7
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 09:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qTKp2BiA02dbmcPG/b/URCvsCKdYuLMrCa6faCKLfAI=;
 b=jkgXgbjEZc06ctI9PUj/JdO7KGjYTIkYNg4P1dOTBqd5INBOjETfm6h89RNaKb/d/8
 1Vd4w3l79mcNAQnmhu3GpTKj1mq6vQPp3lOTVeHireiweupsQO9HSknwQ2pXyhmZp/EY
 ke4dyeloSOIUXuuc4KOyDUoGDEXBklIy5Vz3ryyvKvN/zzjO6KtWEppysMxQdLq6l/AP
 D7hMOnRYMeYVqy7FSXTtarCNw94ib+4Lu/Oeb3QoHJxshMTzTQSVkrs9/XDU8my81X8W
 FDTdPX16RyGu6khRTOgnkxjV7x4Yti8r5zkcxy/FedC8dBfceg3EMn/FDPk3SaqXSm4g
 epIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qTKp2BiA02dbmcPG/b/URCvsCKdYuLMrCa6faCKLfAI=;
 b=tPc75kryfW8I/HN7mGwfmUas/zzjSxm8X0Nlo+ancCz/zA+5vbRfP9uHymNvrnUW+O
 MOGzzfLLksd6unYXELwTqG86GBH+KqLFIthi97zeWjPO4OA2N4DHbTy0Q5O9kz+UhyID
 VPLLqdbPOlfitbyiCTE/y4wl5hnxL/fyLOWe/FB3KH7VIbOZgczvBvmB7H/tT37RIVu0
 tmmw0crw7Zc5sFtWiJ47rjVmch/NQKyXTB/ch8jmEoB2gj406MdX2dw4E2FokWOIu2zP
 5/l0tuBTVnURGFIuXG3zjSsIeKJ4btw6aBpqJLMpmWtJRv3pIT8lgtUr1GdfNGlF/0vh
 prYQ==
X-Gm-Message-State: AOAM530/VwK21WguHLF8t82ilbH6mYb15c4VDxbIO8qhiqSZKkmPMt7j
 DTEdw0zCE29mcItoVO14UOE=
X-Google-Smtp-Source: ABdhPJwmJA2TT4LNRHmP9m7mbfhyunvwIuADzRZakxP007M2DkyrcYZwk3u7hXSHQAOWkrOMWvC1EA==
X-Received: by 2002:a17:90a:fd03:: with SMTP id
 cv3mr6062076pjb.111.1595607675808; 
 Fri, 24 Jul 2020 09:21:15 -0700 (PDT)
Received: from cnn ([112.133.236.18])
 by smtp.gmail.com with ESMTPSA id w4sm6718641pfd.39.2020.07.24.09.21.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jul 2020 09:21:15 -0700 (PDT)
Date: Fri, 24 Jul 2020 21:51:10 +0530
From: Manikandan <manikandan.hcl.ers.epl@gmail.com>
To: "Ren, Zhikui" <zhikui.ren@intel.com>
Subject: Re: add multi-host support in the phosphor-post-code-manager
Message-ID: <20200724162110.GA9905@cnn>
References: <20200720160013.GB17117@cnn>
 <DM6PR11MB441079DE8A76ECF6C35E185094780@DM6PR11MB4410.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB441079DE8A76ECF6C35E185094780@DM6PR11MB4410.namprd11.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "velumanit@hcl.com" <velumanit@hcl.com>, "Wang,
 Kuiying" <kuiying.wang@intel.com>,
 "manikandan.e@hcl.com" <manikandan.e@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 21, 2020 at 05:10:04PM +0000, Ren, Zhikui wrote:
> I would think that one process to handle all post-code is a cleaner design.

   Thanks Ren for comments.

   As Patrick mentioned on different hardware toplogy and hot-plug-able 
   concept matches with our platform.
 
   As per my undersatnd on recent multi-host feature such as  
   obmc-console, host-logger and x86-power-control implemented based on the multi-process.

   I will update design doc in Gerrit to discuss to further on single or multi-host approach. 
 
> 
> -----Original Message-----
> From: openbmc <openbmc-bounces+zhikui.ren=intel.com@lists.ozlabs.org> On Behalf Of Manikandan
> Sent: Monday, July 20, 2020 9:00 AM
> To: openbmc@lists.ozlabs.org
> Cc: Wang, Kuiying <kuiying.wang@intel.com>; velumanit@hcl.com; manikandan.e@hcl.com
> Subject: add multi-host support in the phosphor-post-code-manager
> 
> Hi All,
> 
>  We woukld like to get opion on below multi-host support approaches.
> 
> Background :
> ------------
>   The Phosphor-post-code-manager supports only host to store/retrieve the host postcode history.
> 
> Approaches:
> -----------
> Approach 1: << run the multiple process >>
> 
> Create and run the multiple phosphor-post-code-manager process to handle each host postcode history.
> 
>    xyz.openbmc_project.State.Host0.Boot.PostCode
>    xyz.openbmc_project.State.Host1.Boot.PostCode
>    xyz.openbmc_project.State.Host2.Boot.PostCode
>    xyz.openbmc_project.State.Host3.Boot.PostCode
> 
> Approach 2: << pass number of host to single process >>
> 
> Pass number of host to single process phosphor-post-code-manager to register dbus object and handle each host postcode.
> 
>    xyz.openbmc_project.State.Host0.Boot.PostCode
>    xyz.openbmc_project.State.Host1.Boot.PostCode
>    xyz.openbmc_project.State.Host2.Boot.PostCode
>    xyz.openbmc_project.State.Host3.Boot.PostCode
> 
> 
> Thanks
> Mani.E
