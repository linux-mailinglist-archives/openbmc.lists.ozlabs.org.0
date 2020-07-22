Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BA4229EC3
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 19:52:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBjjS4hyZzDr3G
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 03:52:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kKZHpBo4; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBjhj4JfMzDqyJ
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 03:52:05 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id 8so1906086pjj.1
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jul 2020 10:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VC6lV5F5+i8HDKqSmPxP1I4p/LgwyLnug16D6d1PVyI=;
 b=kKZHpBo4CQ+y4LykxD9UMVwxZ+R/k2LEyZwIiK/93zYXHiUEF3wTt3Hj3EEsIuUWy3
 vmL6yHpomSw8MvEiXdOZvArfm9Q/fd+NxN4YEPctpe6GXSAsOj7eCJT+SOeWGRNuLUg6
 WwxXR5+Zb4vMtgwTRcKJHkjlQ+1MFXZsu5vgcmUAElWKyadJQ3j+WqAhzPm7ozU+hubk
 eNhYqke69jVpU3o55r4z9tw0s2CTh7G+Rf676Or5+rPzTBf571559YqrSE9I9m7VNSPA
 tFzIbJ2s/ihyJNNtJ2YnRyHoDOzpvoTxgosN0QWo7wShZ9YvsEqyN/QGn0PxzI6XGjbj
 FMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VC6lV5F5+i8HDKqSmPxP1I4p/LgwyLnug16D6d1PVyI=;
 b=ARHbHywZqovAPh4631rm9sI3zO0pYzDo1OTzb8cCPUpWFNIzmBsJRAnvETA7NO/94L
 5PS7T82l7+Z3VEDsR0ZBqXPOFgFFoe1ObHAR1GhNr3JWBzwJ+oDYJeY/71dSjjttiwwi
 mqfA5iLSHyrgbBgaxs5wmYGcpFrz4JrgL6TeVKLsANTBigcRKFgsSTKbrJ6j8W/16Bgh
 8Mt4uWkv2PBK+KnFQcpdMxyAu5em7FuDWEfTIv7JzNfSf/SpqNVcLUTwQ0O54C9dmhVT
 SiPk8vkH2IFUqn+hzTNcbwT/klAa4N9H2U2R02F2wN7z0oI0CQN6Uo5tgSpU+D1bA525
 kllQ==
X-Gm-Message-State: AOAM532Ld51LlXcYBQL832BegRjtOpjmZc6zJNbKR6d3roRjl5bvkNQJ
 0rlZLBrNuAZo0pwf56x92Xc=
X-Google-Smtp-Source: ABdhPJwe0UbchiujPpnj1rR04T4k8XmsCEapPISPNbWEde+vgatnHHXDaRpZjWDSrXnocLrz1I7UWQ==
X-Received: by 2002:a17:90a:2681:: with SMTP id
 m1mr474245pje.204.1595440321961; 
 Wed, 22 Jul 2020 10:52:01 -0700 (PDT)
Received: from cnn ([112.133.236.103])
 by smtp.gmail.com with ESMTPSA id 66sm241938pfg.63.2020.07.22.10.51.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Jul 2020 10:51:59 -0700 (PDT)
Date: Wed, 22 Jul 2020 23:21:54 +0530
From: Manikandan <manikandan.hcl.ers.epl@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: add multi-host support in the phosphor-post-code-manager
Message-ID: <20200722175154.GA23254@cnn>
References: <20200720160013.GB17117@cnn>
 <20200721152016.GL3922@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721152016.GL3922@heinlein>
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
Cc: openbmc@lists.ozlabs.org, velumanit@hcl.com, kuiying.wang@intel.com,
 manikandan.e@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 21, 2020 at 10:20:16AM -0500, Patrick Williams wrote:
> On Mon, Jul 20, 2020 at 09:30:13PM +0530, Manikandan wrote:
> > Approach 1: << run the multiple process >>
> > 
> > Create and run the multiple phosphor-post-code-manager process to handle each host postcode history.
> 
> I would lean towards this implementation because I think it is more
> flexible in the long term.  Some multi-host systems are hot-pluggable
> such that you do not statically know how many you're going to have.  In
> some cases you have cards that take up two or three slots, so you really
> don't know the correct topology until you've done discovery.

   Thanks Patrick. 

   Our platfrom is also based on hot-pluggable multi-host(four) card in chassis. 
   we have either four host in slots or 2 host with two device card hardware topology.
   As you mentioned above on multi-process , Do we need to start and stop each instance based 
   on host present in the slot at start-up and runtime.
      
   For example if only 2 host connected in slot with other slots empty, do we need to start only 2 instance
   and stop the instance when corresponding host card removed from slot at run time.

   I understand that you are refering the same design implemented in x86-power-control 
   and obmc-console for multi-host..
      
> 
> -- 
> Patrick Williams


