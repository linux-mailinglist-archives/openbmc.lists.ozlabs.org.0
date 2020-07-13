Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C721021E303
	for <lists+openbmc@lfdr.de>; Tue, 14 Jul 2020 00:31:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5JK854SMzDqZP
	for <lists+openbmc@lfdr.de>; Tue, 14 Jul 2020 08:31:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231;
 helo=mail-oi1-x231.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mbL/dEhn; dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5JJ25HgvzDqXv
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jul 2020 08:30:26 +1000 (AEST)
Received: by mail-oi1-x231.google.com with SMTP id t198so12351297oie.7
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jul 2020 15:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1TsU3jt6Ivm8SPsHm+yKGjAgUy6BIYZwzUpa8XEBtkY=;
 b=mbL/dEhnVj97FSxpm4ZITgsp7UnhdSvewV2Iu8TSCMiMGDgPCGgKAwrPQsib9GSBeP
 Ljz7nI8EayNdxaGVne8IrHHdTYYV+pb+K3SDBIPE86dhAxhkqx4l68RsO5GonqkOLq0w
 GZJIsmeA+uuraWrvnILx7AIsWTMRBkF+TiV5U5fyiIYiLI7QuhAH/rjt9PlacwwkNzSl
 0iVVRqqMk0ev96XSqDMFumu6bM2RqrLZVnn1q9cOICw8ZhvH/mJWgJTARQKmJPzUDqcp
 /kAXjkJ0t9WZz1AAeI1xBP9xAYZCJKW7ML7RzJjxktiYDeT0Fx2wHm6QJxQC29Tf7LQa
 0Ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1TsU3jt6Ivm8SPsHm+yKGjAgUy6BIYZwzUpa8XEBtkY=;
 b=ESEhXMeamNUhu4ebP5UD2L+iHciSg22JUSEpPbvfifsnCcFXhGCIt5zPAfDvZAhVKn
 vR3HRMmck0vvBCoQdDIpZuKpEyuGGGASqEjBYtxCh2KSFxkvKdJFcD8bTZ+9mB5bOl42
 JyPzZbfkwwTqgSVdtRZWt5/EkmtJC/jbinrE7NrLeU7E3ttndo8kr4qYOBkGT6WXap5I
 ct2n2uwzJosgSSAf2Nx0KmaJVEcT1YZU8+WRDpKdZzcbGcycqxwu2KHH3i+VSiwSdm+4
 +a918xSyRF/2y3AbWYdWW70CjhuVMmVZQTMWmb5nGXiAbKvjXKSALW9fp5qF8FzarwHx
 uyUA==
X-Gm-Message-State: AOAM530iJmCxnr9N2Ar6gtdBxTjzBLq8ZQCxPkGbmMppuHTw84SpQrOk
 xaCiq06mia7/Iv7CfIknvio=
X-Google-Smtp-Source: ABdhPJx0yqJutL2v7obvB9hjfP4q+7xnQuwkeLYHK5wqKnH4l38/vCKXFNVNe9ZPHXPbBqh9eYQMHg==
X-Received: by 2002:aca:cc90:: with SMTP id c138mr1299396oig.153.1594679424141; 
 Mon, 13 Jul 2020 15:30:24 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id k126sm3004855oib.52.2020.07.13.15.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 15:30:23 -0700 (PDT)
Subject: Re: Twitter's OpenBMC CCLA
To: Matthew Singer <msinger@twitter.com>, openbmc@lists.ozlabs.org,
 manager@lfprojects.org
References: <CAK6+DXQWUAthDvp8yk8w-ejVb=mvzOy+zmqq6FyqLckmp_s0jQ@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <5d162762-9b1b-a7cf-42ce-a7a9b77aae55@gmail.com>
Date: Mon, 13 Jul 2020 17:30:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK6+DXQWUAthDvp8yk8w-ejVb=mvzOy+zmqq6FyqLckmp_s0jQ@mail.gmail.com>
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
Cc: Nik Johnson <njohnson@twitter.com>, Carlos Rios <crios@twitter.com>,
 Varun Sampat <vsampat@twitter.com>, Alwin Joseph <alwinj@twitter.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/10/20 5:11 PM, Matthew Singer wrote:
> Hello All,
> 
> We are excited to join the project as an adopter and contributor.  
> Today, I'm happy to share Twitter's signed CCLA to contribute to the 
> OpenBMC Project.

Great! Thanks for signing, everything looks fine. Your CCLA has been 
accepted.

> I'd also like to introduce our core team members who work on OpenBMC:  
> Varun Sampat, Alwin Joseph, and Nik Johnson.

Welcome everyone!

Kurt Taylor (krtaylor)

> We look forward to working with this group!
> 
> Matt Singer

