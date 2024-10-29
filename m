Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A219D9B40F7
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2024 04:18:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcwSX476Mz3byZ
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2024 14:18:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730171898;
	cv=none; b=d1GjOGoHPupgF+ikyj8vFzl763KJ/c0/JRDQol+ifEMRZQHNd7aKvoVNmZyz0BT2inYThMhSnqXHVBduFN0tnqGasPIM9OGfZesbR5tsEFI/RLZrMEbZJINq//o767j24szL3L635AEskCosgsUYod48Em2fJHZZWohiW4XS4FyG+xM1IwTnL8TvxxCqgI5LgEsvd79XKLzFmOwLLIrUUbEAfYaBtiRrRjXzAm5yu2DKOP/g0V16OOtZIEjD8PoFQkGKrFuqAe2262zVX5j1vR/0073kwbfVnxSUQoMIKzWYTgKOvXZdXhQyexJrzGFPSqDjOteLgZwrUJdzOGSglw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730171898; c=relaxed/relaxed;
	bh=4DB8H15eCUSSiB1CaFfkcHdTxJhVwXWqtikSy1y1Tyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQQx2ifPogOlwfEuMVX8LzFxX1g/z4CEPmED/C30Hh9cEBpq0ZBPb9I5nNNEDCMw2s3vJfXcBDNMZjelV5R8EB2gVKjwgtBzatbiYT7tlFCpIfF/nmzkmuuLTn8qCby8AB0f7U4rHpirKNIW90cFwhWbuaQvV8cJFXmRvmF1fWfiJEg3THEMvZMyfRuWUS3ZjkyRTNki/y/sDR6glzeNniT18+b1rT624f7wdrf9om1sAwkWP9yR0jOrirxV7Q0F8BeJ48hXrWcVjam1HdqwANu2rDccmv1nQQPs3/pwEG99qJ7FlPJl63TTKGofzWGVFn9cAdPFmc6aZBYZlYpd8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Kx1TrdSs; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Kx1TrdSs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcwSS2YjRz2yQJ
	for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2024 14:18:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4BC9D5C578B;
	Tue, 29 Oct 2024 03:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DB2C4CECD;
	Tue, 29 Oct 2024 03:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730171892;
	bh=09v15yyCBOFMI6JleIGqkpIoxG3wjbCI5gVlVGW47Cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kx1TrdSssXIxSXb2I/gpWcYafqt1xofFk96gnaItYBJkVk2nmeklG7rbwlzyHkrZI
	 Wfsq9PSuyHlNYaDQGkUDlckQuANn33UaHmIIP4ym3klb7fI+XmDlbH+DnKTw8K7qsd
	 EpIgBnMBAL8rFve5QSM3sEzLPHrFwALf2W784MXk=
Date: Tue, 29 Oct 2024 04:17:58 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Subject: Re: [GIT PULL] PECI changes for v6.13-rc1
Message-ID: <2024102950-pectin-embassy-6c8d@gregkh>
References: <bb5eaca8dc2ea5b8e900efbccd53b3d991da753d.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb5eaca8dc2ea5b8e900efbccd53b3d991da753d.camel@intel.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 25, 2024 at 10:54:13AM +0000, Winiarska, Iwona wrote:
> Hi Greg!
> 
> Please pull PECI update for Linux v6.13.
> 
> Thanks
> -Iwona
> 
> The following changes since commit 42f7652d3eb527d03665b09edac47f85fb600924:
> 
>   Linux 6.12-rc4 (2024-10-20 15:19:38 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwi/linux.git tags/peci-next-6.13-rc1

Pulled and pushed out, thanks.

greg k-h
