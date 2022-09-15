Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E835B9ED5
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 17:33:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MT1Rz3bm0z3blF
	for <lists+openbmc@lfdr.de>; Fri, 16 Sep 2022 01:33:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pCUVJ9rG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pCUVJ9rG;
	dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MT1RY6x3vz3bZ2
	for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2022 01:32:39 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id a2so6961682lfb.6
        for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2022 08:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=U+P1XsJEjyhssNFIw2V/Ruo8ThfD2OQAFkoZFpUdVpY=;
        b=pCUVJ9rGy1Tvyva9Dm25gB4VlaexZ5Lh70qUKUiAU7AFEhWo4A7EgFfbTMG1K++pMx
         TuoPikVBM0WbdIxzS3Tv97n/jAS1hC/WAdOOJhzoDs4mWES1Z+CtzatDZuUZi5syTb3M
         gKrLxaMFgodnIsPddCT1PzxQLfdj67QVlmx93u5MXkYCnSa83MIGFCsGbuzLYX37430k
         VdZ6w8NqFjMSj/L+8/R9ZkbnBSZ1Ur9SgBZXV50Vlz664NNvMCZoPUIjWqsaNf4TtaVS
         JKM/Fn+/DtPv+4N1/rxlPVYq2KJa4e5fbTqNMBYGSGVfEGSxdCloD4eS68DYh11OT3VM
         s4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=U+P1XsJEjyhssNFIw2V/Ruo8ThfD2OQAFkoZFpUdVpY=;
        b=FL+bZaDiDGvgdbzV5WMQempTcw+syhdZ0Fsa3M1jDTUtP2vKOylzHi85fHAFCqjCu6
         lYDuBpqLw/Y8Sm13OlgiO2MsKogJON2uQqTwiRqgC/pb49WjkowugiXLtAqv9t9KMhBW
         vxTSGfE+lUGvFrNEIleZEAXspfXPktwH+4HKtHMKFO26C6Zgjy/I66GhRaGMFrCFPjtP
         aIo+P6a1xLflAqyTFzIF1SogO9+B0+gopYcnCJ66rdz+wZUE3w4z+T4k6f1qeG+5dn4e
         Bqnhp9f/pPQrJ25cKs7dQ4LUlaSko6IQT/mzI59NV5JUunPgO8hplwHR4htzC7u3UYev
         NpFQ==
X-Gm-Message-State: ACrzQf0YzDHLxzq1X0CBfJkZaITReARrUscuG6wvADuoabo9k8ny8Y/e
	fMzTkmvbkdpmooDDx/CjSZI=
X-Google-Smtp-Source: AMsMyM4yS3uginOEchTLygRbJMNleZOnpklekNWjYvgrJxwFkY/zvrBxyvwBlgNLV30ecwjV+MWYjw==
X-Received: by 2002:a05:6512:3f8b:b0:492:d1ed:5587 with SMTP id x11-20020a0565123f8b00b00492d1ed5587mr158388lfa.355.1663255955408;
        Thu, 15 Sep 2022 08:32:35 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id f3-20020a05651c02c300b0025fdf1af42asm3189721ljo.78.2022.09.15.08.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 08:32:34 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 28FFWVEH021896;
	Thu, 15 Sep 2022 18:32:32 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 28FFWVKx021894;
	Thu, 15 Sep 2022 18:32:31 +0300
Date: Thu, 15 Sep 2022 18:32:31 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Re: SATA hotplug notifications for BMC inventory updates
Message-ID: <YyNFj1bQLAUtnwFz@home.paul.comp>
References: <YxXZeFQhJWDSHSVf@home.paul.comp>
 <2cdb6ea6-fc85-9835-d410-01195148a3eb@intel.com>
 <Yxin03RwpUvVPsAy@home.paul.comp>
 <2f56b77e-a7a2-3577-c868-90fa6226f483@intel.com>
 <Yxr6OmHDrzQVSaYr@home.paul.comp>
 <89592b7f-784c-d94c-8a81-57cb49a3bcce@intel.com>
 <a1414f37-6d90-4a56-ac9b-089dac21f00f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1414f37-6d90-4a56-ac9b-089dac21f00f@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Jason,

Thank you very much for the reply, please see inline.

On Fri, Sep 09, 2022 at 03:19:45PM -0600, Bills, Jason M wrote:
> > The transition to RAID controller has initiated an investigation into
> > what Intel may be willing to enable regarding OBMC.
> 
> I have reached out to some of our RAID team internally.  They have a
> software-based management solution that they use, today, but it only covers
> NVMe-MI based drives.
> 
> I also asked about documentation that may help with this, but since they
> only support NVMe-MI, they don't have much info about SATA support.

I have seen the Intel VROC slides [0], and they mention some
facilities for integration with BMCs. I assumed they're generic for
all the hardware handled by VROC (including SATA as RSTe was
apparently made part of VROC) but now that I re-read it, I see "NVMe
RAID BMC OOB management via OS, UEFI OOB management coming with Intel
VROC 8.0" is apparently NVMe-specific.

So even if this is not useful for Tioga Pass it would still be nice to
support this feature from OpenBMC side for the next generation
servers, and we plan to work on that.

> I'd als recommend contacting your Intel support representative to ask about
> relevant documentation.

Due to the horrible actions of Russia we are no longer permitted to
talk to the Intel support representatives. So we have to count on open
documentation and communication, and we are willing to share
everything useful with the OpenBMC upstream.


[0] https://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/vroc-overview.pdf
-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
