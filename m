Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 216DC2F4EB0
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 16:31:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGBHh0kfjzDqQX
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 02:31:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qVkg+GAA; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGBDV206bzDrT8
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 02:28:41 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id d203so2522156oia.0
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 07:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=sj8aa8EHoOZo1PeinUrc+9ca97NR0MWgvuYD75nNd9Y=;
 b=qVkg+GAAhOLnK6LRewByogwRF3OjcML93nZ+PBBwvI3Ca7180S9Y8NX1DSGPhJlCQ0
 +BAn6/l+adOYJ/etmwQvz9MyTB2uqMpYGHFt0lqCyYX4TUYNWlkDw0qM/wuACif4LZCm
 Pu/sB+mM2Ifi6NqjJE5S7IrCXTF4NTHu6bbByz4rHmYYBpryBp4SkupdQk4azV62Rhhr
 tqP+p87MFSGuXyXHMq2yeGM1TJw7hhVp/g6tEFMIyRwr9OjlooxgRFVz347Jaocz4ZHp
 hTMCdO83LnGKuClYsCazFuycHQJzYQqdro3C70VLfpuYjWpV0LFI9YcAFtBJMdhi4Vjh
 pkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sj8aa8EHoOZo1PeinUrc+9ca97NR0MWgvuYD75nNd9Y=;
 b=Vbas4SGJIxdWXI4ijQwg1TKxxTY22VbceKYg6wcK1vzt1BRrB38xe4d3rXeQ+TJuv7
 /h+DIJUmt+HzQB7MTHwfhk81g/BPPKpi0l22lM33YxlMbFj+6RJWjVc0l2zOt8Xv4ysH
 TiulBbLIG+5eTvto9fK/+UtfS5nsjXJJ9AKafQY2Pv8s9qU5v9EMbFDR/D19RhwDrzk0
 2Cfo6RYoCeOUMNL9GmNJvTV0y06f99MIihWgo3oczZYOdBUOEQpw6ko50SGoYWJBt4hx
 ys1ZuC8eJ3Z3Z0xK+s3ObvTTBXkt8hFkMfmk37sABl5m+kQyl2yvr7H5LkT2muTjETUL
 8sDA==
X-Gm-Message-State: AOAM532p2ZMgzrfcUAmgYtsDO31JqKqDw00xZjlmKqjY7HXesqYYOMsv
 AdubUTQn2ULDUCwxBKGdPGERPf0krKHAeg==
X-Google-Smtp-Source: ABdhPJz08D9QZPBwOnVnwH3ryJ5/8cS/FvYgE1yWCD4fVEhsePCDYkKu1/mI2ooGhoRqcmzM0TcnvQ==
X-Received: by 2002:aca:48c4:: with SMTP id v187mr1481066oia.37.1610551714808; 
 Wed, 13 Jan 2021 07:28:34 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id 31sm443627otd.24.2021.01.13.07.28.33
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 07:28:34 -0800 (PST)
Subject: Re: Call for volunteers
To: openbmc@lists.ozlabs.org
References: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <4ada67b0-ab36-e216-5695-2eda77f51c3d@gmail.com>
Date: Wed, 13 Jan 2021 09:28:33 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
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

On 1/11/21 4:09 PM, Brad Bishop wrote:
> Hello OpenBMC-ers!
> 
> Your TSC has been aware of the problem of fragmentation in our project 
> for some
> time.  Fragmentation is a loose term - for the purposes of this note 
> consider
> it to be any time contributor efforts in the community are duplicated 
> without
> thought given to maintenance and/or compatibility.
> 
> To begin to address this issue the TSC is looking for volunteers to 
> serve on a
> "repository review forum" to which the TSC will initially delegate its
> authority in the areas of:
> - new repository creation
> - placement of contributed new function into existing repositories
> 
> The TSC fully expects the scope of this forum to quickly grow into the 
> role of
> a traditional TSC providing frequent, technical oversight to project
> contributors.  The current TSC will continue to serve the project in 
> terms of
> governance, advocacy and industry exposure - and likely get a rename 
> (OpenBMC
> Board? or OpenBMC Steering Committee?) in the process.

Great idea! :)

My vote: "OpenBMC Board"

That would make it seamless to transition into a different open source 
funding model in the future if the project decides to do so.

Kurt Taylor (krtaylor)

> The new forum would meet periodically or at the demand of other forum 
> members
> to:
> - raise the forums combined awareness of new function under development
>    (information exchange)
> - build a consensus within the forum on where the function should exist
> - inform the function contributor and the rest of the community of the 
> decision
> 
> A successful forum would be a forum that can simultaneously encourage the
> contribution of new and innovative solutions to existing problems without
> introducing complexity to the project as a whole.
> 
> A successful forum member will have previously demonstrated a breadth of
> understanding of the upstream OpenBMC codebase through:
> - frequent participation in peer review, the mailing list, IRC, and 
> Discord.
> - submission of high quality designs and code to upstream OpenBMC
>    (github.com/openbmc)
> - a history of working with and guiding less experienced OpenBMC developers
>    in a timely manner, enabling them to come up to speed quickly.
> 
> If you are interested in serving the project in this manner, please 
> reply to
> submit yourself as a candidate.
> 
> -brad, on the behalf of the OpenBMC TSC

