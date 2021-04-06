Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B841B3555D5
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 15:56:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF8GJ5P69z30Gt
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 23:56:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=KWmB3H7T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com;
 envelope-from=richard.purdie@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=KWmB3H7T; 
 dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF8G5686kz2ydJ
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 23:56:43 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id f12so8362213wro.0
 for <openbmc@lists.ozlabs.org>; Tue, 06 Apr 2021 06:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Kha0YLKsmFPgyIWC3Znvlx7ctD42xNHdRbLWPz1xnsA=;
 b=KWmB3H7TPT/DSOKLm9gAgzBf3NlKAIglqeDtDMgU13TbFxdfhmg1DnQ4D7WaVW08ah
 SedSFb2+HONlDzfw7XcGbbsZTn3SHU+6QYKuxxYaE58bhmb1E7Xs/iBLP3YKGhOnZ2ss
 yO/umR4NLzKj/grX8/9RnOZnxwaWd5D62DTk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Kha0YLKsmFPgyIWC3Znvlx7ctD42xNHdRbLWPz1xnsA=;
 b=cLzN6gn6u9UUwCA2MG3W9chElAgzX9NwRpnNFNkXDuMJ1pr0C0Ak0jaiUt0pQvri2O
 B/h0AlQRIYMmpW6JyWg/nAXZmDa6rUaLI7weAZ6POtWiBtqPzrM8WzeX6Hd0hoYlkLHx
 BZuPHDZ14xlsmIBB8e1DQrn2Vutlh3vSy0UoTz/PyIKIVCAwp74o4tkwBAIEZbeXx4k6
 OzK9B//G+kzNd/HhQuipabGpTTITPMn0o2RlWWu6mVcp34KJyuHsQkZ3bCHXmbVas8JO
 MPMW+GoK2XCQfuPo5AqcLl283zGHu/L0KlAnLhTGn+BLxFd4sKAXfmHIGvajQ/LJLSy5
 zlAw==
X-Gm-Message-State: AOAM531r+KMDob4NKv/7T9+08bxVV4QPw//J0BTolUXhFm+nnb9QrusS
 k23bbDcocQ37RinjeE3tVXXWig==
X-Google-Smtp-Source: ABdhPJzks2GFk8M+VQX6tcFcBfks/e5S/vvnPgJb2KA7R8K5aLUHTmnNuvive5HcXsuGIJllM3o7Lg==
X-Received: by 2002:adf:aa9d:: with SMTP id h29mr13859489wrc.98.1617717400879; 
 Tue, 06 Apr 2021 06:56:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7a9e:d3b:5548:6469?
 ([2001:8b0:aba:5f3c:7a9e:d3b:5548:6469])
 by smtp.gmail.com with ESMTPSA id d2sm17338690wrs.10.2021.04.06.06.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 06:56:40 -0700 (PDT)
Message-ID: <859e51dbbe40cb44fefb3a53e7c032fa1d4b79a3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 0/4] u-boot: Support for SPL verified boot
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, 
 openembedded-core@lists.openembedded.org
Date: Tue, 06 Apr 2021 14:56:39 +0100
In-Reply-To: <c6e39587-2a84-fe75-5311-81be9f5fae84@linux.vnet.ibm.com>
References: <20210326201410.13906-1-klaus@linux.vnet.ibm.com>
 <f303476a66be3cc3beea01d3a71e2db1ef1d44c4.camel@linuxfoundation.org>
 <c6e39587-2a84-fe75-5311-81be9f5fae84@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2021-04-06 at 10:21 -0300, Klaus Heinrich Kiwi wrote:
> 
> On 4/6/2021 7:57 AM, Richard Purdie wrote:
> > On Fri, 2021-03-26 at 17:14 -0300, Klaus Heinrich Kiwi wrote:
> > > This patch series aims at extending U-Boot's verified boot support to
> > > also include SPL.
> 
> > > Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> > 
> > I've merged this, I wanted to say a big thanks for writing some test cases
> > for these code paths. It should start to help a lot in this area in the
> > future. I'm going to be asking that future fixes in this area add/improve
> > test cases to cover issues too.
> > 
> 
> 
> Thanks Richard.
> 
> FYI, there's a patch I sent recently with relatively important fixes (for some
> corner cases) that should apply on top of the patches above:
> 
> Subject: [PATCH] uboot: Fixes SPL verified boot on corner cases
> Date: Mar 31, 2021
> 
> I'd recommend applying that patch as well, before yocto / other projects start
> pulling from oe-core.

Thanks, it didn't apply 100% cleanly which is why I'd deferred it but I've got
to apply and am testing...

Cheers,

Richard

