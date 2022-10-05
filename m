Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ABE5F5D66
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 01:55:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjWfc1FYwz3c3Z
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 10:55:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KSYASXbb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KSYASXbb;
	dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjWf16W6Hz2xKN;
	Thu,  6 Oct 2022 10:55:05 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id l27so172389qtv.4;
        Wed, 05 Oct 2022 16:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XThhC9U9uKIxJQZ665eKAgfnugmApozs76ScmLZwBk=;
        b=KSYASXbbQEnw9dIt1qkDOuDA0+QasmExuyaVSAsBd91F6GmYOyH0wPFBbWUd2SDuPt
         Kd3u4wpivOfmtt4sWJlNrFFkqqvV8f0DLJWsedYyEQOqFKG+4wYoNjmU7UYmwonJVgba
         UcykNav6fHuYOn2yHnk2YZrMx+dCZo4vkbYcBCbl5DKSGnKd0K3+enoOoQAZ5rYJdP8F
         Eialm1q0BgCKh4h3pSS8fGqJqacuW9K5WknGiJPDgtOre9+AO9L9f09d5iCjyJTo5rlg
         xCxAG2+koKTtIHDpzRUMp5XtfSIe8foYuVUlkWUe0f/R5mxhDmn31CETqJUaSCXCWqAX
         7OWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0XThhC9U9uKIxJQZ665eKAgfnugmApozs76ScmLZwBk=;
        b=2w7YnFLjqDrfHUihEl1Y2zRWeTmg70+CYQ5A/HCLVmmj1ItlKWIT8MEUjynPH4h+2K
         Qpf5hutSwfdqCmpME5Jl4G1HCtSBGEhvc7URIum5iXmdRA/C0u53c4CsLPBPAJYR4Avq
         4UhsS4yKqdNTnr+4VHjndaeYt4L4vTmwCAu+p88c6vwtV95RtjgYujHGln1fFrUxoTAO
         njRNfG6B0vAGxlzcxZO8swmDDjthdm4gpuBTsSjaAZkpKNDaihtf3oOzIwxI0Dao0Ebv
         H5iu121t4d7R4RJZZhsh55WHb4lpVdN/iJT3fA0LDnkLf9Z4JCZtD02owLLdPND/EUWQ
         50yg==
X-Gm-Message-State: ACrzQf3WLTOwdD1bRI4sn1ih0HtLv28riAcY2jre7Z6ztTfhF73AI5oG
	6vfbYpPt+yE/ii6jn3hSVg==
X-Google-Smtp-Source: AMsMyM4eROnmK5/Ehiq7Es0N/CNTVAElIT81oT1dQCstYathZwqVIbJlW0dOv1IpRAIF68hTPKC4ZA==
X-Received: by 2002:ac8:7d13:0:b0:35c:e54e:9c8 with SMTP id g19-20020ac87d13000000b0035ce54e09c8mr1590034qtb.320.1665014102301;
        Wed, 05 Oct 2022 16:55:02 -0700 (PDT)
Received: from serve.minyard.net ([47.184.185.126])
        by smtp.gmail.com with ESMTPSA id bi27-20020a05620a319b00b006ce611aef61sm19661018qkb.95.2022.10.05.16.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 16:55:02 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:2d13:71e3:7ea0:219])
	by serve.minyard.net (Postfix) with ESMTPSA id 22E3F180015;
	Wed,  5 Oct 2022 23:55:01 +0000 (UTC)
Date: Wed, 5 Oct 2022 18:54:59 -0500
From: Corey Minyard <minyard@acm.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH] ipmi: kcs: Poll OBF briefly to reduce OBE latency
Message-ID: <Yz4ZU8Ron/b9GV6p@minyard.net>
References: <20220812144741.240315-1-andrew@aj.id.au>
 <08c20621-e75d-4a72-82e6-b1980304e20a@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08c20621-e75d-4a72-82e6-b1980304e20a@app.fastmail.com>
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
Reply-To: minyard@acm.org
Cc: linux-arm-kernel@lists.infradead.org, openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 06, 2022 at 09:42:57AM +1030, Andrew Jeffery wrote:
> Hi Corey,
> 
> On Sat, 13 Aug 2022, at 00:17, Andrew Jeffery wrote:
> > The ASPEED KCS devices don't provide a BMC-side interrupt for the host
> > reading the output data register (ODR). The act of the host reading ODR
> > clears the output buffer full (OBF) flag in the status register (STR),
> > informing the BMC it can transmit a subsequent byte.
> >
> > On the BMC side the KCS client must enable the OBE event *and* perform a
> > subsequent read of STR anyway to avoid races - the polling provides a
> > window for the host to read ODR if data was freshly written while
> > minimising BMC-side latency.
> 
> Just wondering whether you're happy to pick this one up? I haven't seen 
> it hit the IPMI tree yet.

Sorry.  It's in my tree for 6.2 right now.

I can't push it up to for-next until 6.1-rc1 comes out.

-corey

> 
> Cheers,
> 
> Andrew
