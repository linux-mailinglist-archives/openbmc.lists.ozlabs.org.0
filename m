Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C05494EAE4D
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 15:20:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSVZ15dJwz2yHD
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 00:20:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lf6UdkMw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Lf6UdkMw; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSVYb243yz2xMQ;
 Wed, 30 Mar 2022 00:20:34 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A50A9B816FB;
 Tue, 29 Mar 2022 13:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079B3C2BBE4;
 Tue, 29 Mar 2022 13:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648560029;
 bh=vcBGlG+sqaPt0UpTdoZ2lc9iEFALH1pzWeKYoBtVGc0=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=Lf6UdkMwpGMKF/bCzH0duecbGSrWXhu70CtFUq2mNv7IsC6370BCiPtfWXaI+yKF/
 UQxjxo/5ELIHPpruCIzbUN34wBvgy5Fc7eS22PnhD5aL+YcFYfFaN/O+tr+ZmUM+S5
 A/HxyRRfNmBU9vHwyfdDK7puvv8H+mPmsnx7QORDs2EqLL+mvW+oCz1joHCa6v9S30
 zZSq7JcFWt8iEt24hFmi80tnq5vNy7tr3oSE2yE/htc0EfUX3gZEr+PbO1Xh/RhzQv
 IsUb015h84Gz6Om/nGHx49iikUSPAbDyLFfT+LjbZl0E6DwqI3AOYIbHwd8W8xbJcf
 NtJzDPqA8j7Dw==
Message-ID: <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
Date: Tue, 29 Mar 2022 15:20:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Language: en-US
To: Ansuel Smith <ansuelsmth@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@dh-electronics.com, linux-mediatek@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-oxnas@groups.io, linux-arm-msm@vger.kernel.org,
 linux-unisoc@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-realtek-soc@lists.infradead.org
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220328000915.15041-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 28/03/2022 02:09, Ansuel Smith wrote:
> Hi,
> as the title say, the intention of this ""series"" is to finally categorize
> the ARM dts directory in subdirectory for each oem.
> 
> The main reason for this is that it became unpractical to handle 2600
> dts files and try to even understand/edit/check the situation for a
> specific target.
> 
> In arm64 we already have this kind of separation and I honestly think
> that this was never proposed for ARM due to the fact that there are
> 2600+ files to sort and the fact that it will be a mess to merge this
> entirely but IMHO with a little bit of effort we can finally solve this
> problem and have a well organized directory just like arm64.
> 
> Some prerequisite on how this work was done:
> - This comes entirely from a python script created by me for the task.
>   linked here [1]
> - I had to manually categorize all the different arch in the makefile
>   based on the oem. I searched every arch on the internet trying to
>   understand the correct oem. I hope they are correct but I would love
>   some comments about them.
> - This current ""series"" is all squashed in one big commit to better
>   receive comments for this. The final version ideally would have all
>   changes in separate commits. The script can already do this, it's just
>   commented.
> 
> Here is a list of some discoveries while doing all the sorting.
> These are totally additional reason why we need this.
> 
> While creating the script I discovered some funny things:
> - We have orphan dts! There are dts that are never compiled and are
>   there just for reference. We would never have noticed this without this
>   change and probably nobody noticed it. They are currently all listed
>   in the python script.
> - We have dtsi shared across different oem. My current solution for them
>   is: NOT SORT THEM and leave them in the generic directory and create a
>   link in each oem dts that points to these dtsi. This is to try in
>   every way possible to skip any additional changes to the dts.
>   Current dtsi that suffers from this are only 3. (listed in the script)
> - arm64 dts and dtsi reference ARM dts. Obviously this change would cause
>   broken include for these special dtsi. The script creates a dependency
>   table of the entire arm64 directory and fix every broken dependency
>   (hoping they all use a sane include logic... regex is used to parse
>   all the different dependency)
> 
> So in short the script does the following steps:
> 1. Enumerate all the action to do... (dts to move, scan dependency for
>    the dts...)
> 2. Generate the arm64 dependency
> 3. Creates the Makefile
> 4. Generate the Makefiles for the current oem
> 5. Move all the related dts and dtsi for the current oem
> 6. Check broken dependency and fix them by editing the dts and writing
>    the correct include (or fix any symbolic link)
> 
> This is an output that describes all the things done by the script [2]
> 
> I really hope I didn't commit any logic mistake in the script but most
> of the work should be done.
> 

+Cc Arnd and Olof,

Ansuel,
Thanks for you patch. Please cc the SoC maintainers in such submissions.
It seems that you got some quite nice discussion, but still the core
folks are not Cced, so no one would be able to take your patch...

I am pretty sure we were discussing such split idea in the past and it
did not get traction, but I cannot recall the exact discussion.

To me the idea is good but will cause huge `git am` conflicts.
Cherry-picks, backports and merges should nicely detect path renames,
but git am (and b4 am) I think cannot.

Best regards,
Krzysztof
