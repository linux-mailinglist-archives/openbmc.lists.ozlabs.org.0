Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D4010CE7
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 20:52:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vSDz6jWGzDqFZ
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 04:52:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="u3kvnI+q"; 
 dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vSD90rrGzDq83
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 04:51:36 +1000 (AEST)
Received: by mail-io1-xd36.google.com with SMTP id a23so15604398iot.4
 for <openbmc@lists.ozlabs.org>; Wed, 01 May 2019 11:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=O1JzAXXevZg+4tjDmUyWTc/vdwT1YURHzquj5F4vqbI=;
 b=u3kvnI+qNp/9sdqgocth31QsEbFne0hSBl4vMRCU5hvr47N404SzZKKC7Rg/jIaiFJ
 Xpf1HMMzRdCJD4PTPODvNQLxy6vW40y+pL5EyAsXNgBcjRbe5p8ZkxplANz+QXQJ/S0b
 xqs3Sl5ULoToXTMdLwzp+wAboevaRDjLyPTwpLgnsNZz7U2PXyQjsBxJwLAT4Ih5Kn4x
 1krghsMBzYmUwRaINqQlskDOez9lO2EDVFJ20jfJlInrITseEKsXCqVYxAQqcQG+0fE3
 lKWq5+y5NT2Ff0ZbkeeEuPHLU2hPn1NtlodKEiDbTaMF4gPQhpOZJE08oARkqqfT4Yr2
 nQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O1JzAXXevZg+4tjDmUyWTc/vdwT1YURHzquj5F4vqbI=;
 b=dSzo+ss2ZwXZJpf2gWhL6riCNGOapQDZzHLyiPqz5aN7sCqXNpv113haAH+kQwI5Se
 ebqTndqlHqJBFjQglbyluDZDXx7HXTLp7mh/X0qjabz3PNtBdZpqSx5tKtxxHgOX2IDg
 HRv/hiGdU5S1Lmqcgu3/h6RPnwwbAUcilOf9kUfj4hmc6CTZcpmBrAhRUvHC4Y1RwK0t
 mjfmMn1/Xx1Odv/Eip9LT4PJEfaxIzVl2oLe0wCLIaTGKmAqQMYiW5Z49zZC0dPJvreh
 bpH3nUby3gFnEQpQdGdwLyztHwF/l/WYiwV8gznJAmgtM5/SYyHiTkUBk1O12SxqTEes
 5o5Q==
X-Gm-Message-State: APjAAAV32wTe6O1YmJY8OAL5f2OEwdO8RPnXklofdzj49Hz8Un/rkp+p
 WGh+1U8WuXj42+wIm6u9kREg7Z9t
X-Google-Smtp-Source: APXvYqxvq5oLOgadPgsgzddwccbg8GrmK0I+egxfLOIFw2WKeAZrTs2PHlnXeJXpBykzJlIh8BdocA==
X-Received: by 2002:a6b:6e0f:: with SMTP id d15mr3558344ioh.116.1556736693060; 
 Wed, 01 May 2019 11:51:33 -0700 (PDT)
Received: from krtaylors-mbp.austin.ibm.com ([2620:1f7:8b5:2842::31:1be])
 by smtp.gmail.com with ESMTPSA id 187sm3499390ity.43.2019.05.01.11.51.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 May 2019 11:51:32 -0700 (PDT)
Subject: Re: CLA concerns
To: Timothy Pearson <tpearson@raptorengineering.com>, openbmc@lists.ozlabs.org
References: <757768607.3289093.1556696321378.JavaMail.zimbra@raptorengineeringinc.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <fcc815f6-00cb-c0db-7517-62a761f144c8@gmail.com>
Date: Wed, 1 May 2019 13:51:30 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <757768607.3289093.1556696321378.JavaMail.zimbra@raptorengineeringinc.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Timothy, You are absolutely right to examine the CLA/CCLA IP terms 
and make sure that they are compatible with your product legal team.

I am not an attorney, but do have several years experience with these 
things. See my questions/comments below inline.

On 5/1/19 2:38 AM, Timothy Pearson wrote:
> All,
> 
> While we would like to upstream the Talos II / Blackbird BMC patches to the OpenBMC project, our legal folks will not approve the CLA.  The main concern is the patent section, since our mainboards do contain patented technology that is not part of OpenBMC, but that OpenBMC may interface with.  We are not trying to upstream any code that would result in patent action, but are very concerned that the CLA would end up granting a license for the patented technology that exists outside of OpenBMC, merely because the OpenBMC codebase is able to interface with that external technology.

Is the concern about releasing IP about the interface, in that it might 
give clues to what/how the patented technology operates? What if that 
interface was abstracted in some way and kept in a downstream private 
(behind your firewall) fork of OpenBMC that you built and supported for 
your customers?

This is a typical practice for keeping company value-add or patented 
technology separate from the upstream open code base.

> 
> The specific clause in question is:
> "...or by combination of Your Contribution(s) with the Work to which such Contribution(s) were submitted."
> 
> This is ambiguous enough that legal is concerned an external entity wishing to clone the patented technology from our mainboards without a license would simply be able to merge our contributions with their own de novo code duplicating parts of the patented technology, then claim a license for the patents was automatically granted by the CLA.  As such, we are currently blocked from upstreaming code to OpenBMC, despite the fact that our patches are freely available under GPL and MIT licenses, and that those patches are not covered by any of our patents (past or future).

Patches/features contributed to OpenBMC should not contain any patented 
technology. Any value-add or patented technology that you have should be 
kept in your downstream fork (see above).

> 
> Is there a way to clean up the patent section of the CLA to make it clearer that only the patches submitted are released from patent infringement claims, and that any third party modifications to those patches (or to the codebase created in part by those patches) must still be cleared by their respective authors / maintainers not to infringe on the patent rights of other contributors to the codebase?

You can imagine that requiring a developer to clear modifications of 
patent infringement would be a monumental task to burden the repo 
maintainer with on a per-patch basis. As said above, any patch that 
would require this special treatment should be kept in a downstream 
product fork.

I would like to learn more about this, and help if I could. Apologies in 
advance if I have misunderstood any of your points.

Kurt Taylor (krtaylor)

> 
> Thank you!
> 
> --
> Timothy Pearson
> Raptor Engineering, LLC
> https://www.raptorengineering.com
> +1 (415) 727-8645
> 

