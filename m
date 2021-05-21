Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B80C238BC2E
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 04:01:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmVFR55pyz307S
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 12:00:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=An1xKWU/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=An1xKWU/; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmVF66HK4z2yXk;
 Fri, 21 May 2021 12:00:41 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id 69so10144734plc.5;
 Thu, 20 May 2021 19:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9fB9txKIQZNMl67yv7ERq72Q+6wcnvrLhnIU26tnTf4=;
 b=An1xKWU/mWO08cY0cP24LyKkNnOv5zCCLUdnglRtraCTvQQzxVh9tTfYP1YanUjoR8
 gFtYTxBnypDtTZJxyxQ1tMDJtzdMMTs5rHApnAEd/aQWzVn+hLHmzuypSaML2xrdpRCW
 +atdTnZ2DCoPjdD9qdm1EhlEDGaoVnmocolZmRF7sErnz5ofewaQGpXASxT8QxwUiUai
 nj86+/F36GPfLpYIIDyoKPdhyetIbbr07I+lFT1YwrnBmgBe0t2Svn7GZ5BNKqRlLY2/
 CGzlvZ+aIKnYSNNGv4xYAR9uUG2Ao2Igzhd1uppZXRCZB6hTlZNwDp4EPHaQ6nKsT/a/
 loIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9fB9txKIQZNMl67yv7ERq72Q+6wcnvrLhnIU26tnTf4=;
 b=BkDy8MSW83QIJyucQ2Nc+AVSUeGYCld3t6oKY2qNEL9ZgeK/s5I9y7+zzqVpYdV0qr
 OzeTsoo7cllvYRqQvX7OemmG14/8Mp4p6UKtUqqyMkw/YKzP3tXRo6dlNQhyCkLcyQb6
 A7aKKRG3vmAXNt5I57U7Fkw6u7F6vww8UgzlXpwUXvZL1i1foyTWHswAWJ37AuzgN5aO
 WHvjCIXi9VVRkbTxXKZSWHW6R/pzkkLMS7Lhy7jluEAnrGcLpriJYwgXlDNt0moOzjuM
 Rcpiu22fe/OEbx6KhC917pH0wTMwhYAPTq42WBlBSXgsjUErs06UKcNDoIXc2MBtCepg
 m+Og==
X-Gm-Message-State: AOAM531cL9gZQ9nP2ABuFFA227+dXHYncWS/d7q2MVC/iP27r+1mV+jb
 q9hA9dZqGkUEBzM9rLi49Cs=
X-Google-Smtp-Source: ABdhPJwBofzBAXoo5pDmXX4ye8/TsvSpB7pKcMIb3pVYhLkIdagqbQ5wvHtXHUJZRNsbTl2FgNx8tA==
X-Received: by 2002:a17:90a:f811:: with SMTP id
 ij17mr8130069pjb.63.1621562439317; 
 Thu, 20 May 2021 19:00:39 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id w74sm2869555pfd.209.2021.05.20.19.00.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 May 2021 19:00:39 -0700 (PDT)
Date: Thu, 20 May 2021 19:00:34 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>
Subject: Re: [PATCH 1/3] i2c: aspeed: avoid new registers definition of AST2600
Message-ID: <20210521020033.GB19153@taoren-ubuntu-R90MNF91>
References: <20210519080436.18975-1-jamin_lin@aspeedtech.com>
 <20210519080436.18975-2-jamin_lin@aspeedtech.com>
 <CACPK8XdNXiGMQZOtsfMMK+w_PSvO20XT8B9MG+rGhdjYoV4ZuQ@mail.gmail.com>
 <20210520033140.GA3656@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520033140.GA3656@aspeedtech.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Rayn Chen <rayn_chen@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jamin,

On Thu, May 20, 2021 at 11:31:41AM +0800, Jamin Lin wrote:
> The 05/19/2021 22:59, Joel Stanley wrote:
> > On Wed, 19 May 2021 at 08:05, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
> > >
> > > The register definition between AST2600 A2 and A3 is different.
> > > This patch avoid new registers definition of AST2600 to use
> > > this driver. We will submit the path for the new registers
> > > definition of AST2600.
> > 
> > The AST2600 v9 datasheet says that bit 2 selects between old and new
> > register sets, and that the old register set is the default.
> > 
> > Has the default changed for the A3?, and the datasheet is incorrect?
> > 
> > Does the A3 still support the old register set?
> > 
> We suggest user to use the new i2c driver for AST2600 and we will sumbit
> it. This driver is used to AST2500 and AST2400 SOCs. Change this
> driver to check global register of i2c to avoid user build the wrong driver. 

If I understand correctly, the answer implies old register set is still
supported in A3 although aspeed suggest people using the new driver/mode?

Can you please share more context behind the suggestion? Such as new
register mode has better performance? Or some known issues that were
deteted in old mode are fixed in new register mode?


Cheers,

Tao
