Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6347645D66F
	for <lists+openbmc@lfdr.de>; Thu, 25 Nov 2021 09:47:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0BMS2mLRz3054
	for <lists+openbmc@lfdr.de>; Thu, 25 Nov 2021 19:47:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=haVnaQ+Y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=haVnaQ+Y; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0BM35W6Hz2yHC
 for <openbmc@lists.ozlabs.org>; Thu, 25 Nov 2021 19:46:53 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id bu18so14601753lfb.0
 for <openbmc@lists.ozlabs.org>; Thu, 25 Nov 2021 00:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QwT++hdtOWltO2JOIAQpuf0fwWnIiRaBBzirsjHEAp4=;
 b=haVnaQ+YNTRyOmJJ+malwbKJKoYr/bLAHytmSYeViQnT/VOXB7LTfpnembY4VSn81H
 1z0Aoru1hjs28Iw3IJ1Ig9anU/guicgBmL60t8ZVqrLTSpLfUPD/5boiWRy6IHvr3kt5
 91Jcdh8mVjsCJyDestSOFW61PQ5r7QOIA4I58kZZC4ZTwVMwD+hLFZIzyf/UgkOQeskz
 yUakgmcdcpzp/TezGKEKU4vlZAtfou7QTRMGgdOqTAS5mp3Ur2+m6d2DXff3ZuJretV+
 bwAKz0LICSvrROdFxdtK2Ka5Pu2Z7JCIIwY5ZoQ+Cb5B6T5Y4V8YhoJKoX7tlu5ul8KU
 eqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QwT++hdtOWltO2JOIAQpuf0fwWnIiRaBBzirsjHEAp4=;
 b=w7jzFsua0vnLJy7dmcyp3ovLcBQxWFm8a8vEfmNlpOHeJxMVBlZ5LRasfqtAaeUYeQ
 kh0x1KxZVhNqXHMiXEiKdvSxhSuXzsuchGh7qbRgRfSHRcVH76/RfPd99qed3zEL5Uji
 ZkdPMF+lmfW/Lx+FsLFpc8IahQxndQQqGlR/uMcHc3kL8ZdoPM22TsjDc39YWGwzKO0d
 d2oIg0IaQ+FXUroIQCULzJGcbBty3h9NSzZpCHb6iqHuKOJPfUGjKhv/8S1JtPCeogDs
 uXZBw0ZCFpH/1XULgAqeXzzX4+1S65zkr58ak35aqce9BwcKfTnqG7JRNKsRw54sBT5N
 9CUA==
X-Gm-Message-State: AOAM530jgISmbfr4zUl/hknlDZfGclu/DVMkjq8PL2GER0UFFfVwun6H
 F+3gwojYoXlevUPrkjK5qZ4=
X-Google-Smtp-Source: ABdhPJxUofj65D8PQR0ZCcBqxtteSm87Fl3kY2x5B45eXyOI1yjXhSc1cdpy1Lni4dTotuOv3Vv92w==
X-Received: by 2002:a19:4895:: with SMTP id
 v143mr21159591lfa.142.1637830006169; 
 Thu, 25 Nov 2021 00:46:46 -0800 (PST)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id q3sm211071lfe.48.2021.11.25.00.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 00:46:44 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 1AP8kf23023917; Thu, 25 Nov 2021 11:46:42 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 1AP8kenO023916;
 Thu, 25 Nov 2021 11:46:41 +0300
Date: Thu, 25 Nov 2021 11:46:40 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Landon <cld795@163.com>
Subject: Re: openBMC pwm-fan control policy
Message-ID: <20211125084640.GA22508@home.paul.comp>
References: <mailman.0.1637828525.15424.openbmc@lists.ozlabs.org>
 <217ffd16.389b.17d5636abb5.Coremail.cld795@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <217ffd16.389b.17d5636abb5.Coremail.cld795@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, Nov 25, 2021 at 04:29:23PM +0800, Landon wrote:
> Can it be linked with temperature and current? Whether the pwm-fan output can be
> controlled by the corresponding temperature and current?
> Are there any instructions or references?

https://github.com/openbmc/phosphor-pid-control should be flexible
enough for the purpose. Is it missing something you need?

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
