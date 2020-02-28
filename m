Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0661787EA
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 03:02:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XHF354XmzDqFC
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 13:01:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=grantpeltier93@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=X1NUSuNE; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TmYF0cXlzDrNg
 for <openbmc@lists.ozlabs.org>; Sat, 29 Feb 2020 10:52:16 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id j9so2495807pfa.8
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 15:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lObB5JCBCZhDuMW6ABx5wSPImicEEseX7SpFIrRo5gQ=;
 b=X1NUSuNESyn6IgvOLEv8n+zxO0ae3gnQQLrKpGT8U2+ycsKzztwAf9UQQwCCgKMaHC
 oq5DP4fJieJ3KkJCPQgqG4j+2sxH7jFUE3Daxal6PNHMAwdZzNvCQWdSwsTUCZ9ASuxe
 VvuflLRdiy+jXFNXF7yERmnENZsJUCPpEzMP7rrlND66XXedcgcrl5rbXhwf1p+sw69d
 8oEh45xhjCQFK9afR2pnX74Bgt1dwbig8bPXs3+6Tf45dR6LsQWLAUofF7/m1ZqPG2YE
 8zthovU0LcQEPaI8105kHJ4gQcVZFKlPdWVmYkff41yTg872HHClowdiGfTcy57h7TNU
 qFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lObB5JCBCZhDuMW6ABx5wSPImicEEseX7SpFIrRo5gQ=;
 b=gNhEvIvk7NpKupuf0Et1qhGw3ABLrAoMxtTxY3VBOj0vqmkKpwZHwgHaFXaDpCd6bI
 UGC/Ip5IS4/8/9PphWVuj/HXQYlefbBNvHJPQ51BVgAEGGdPPjLnOD+KSiQpQIG/ls0E
 +5sJ44CrZzlVzGsMPtxnOnJPaKMgIT+cBJZo0uCidmvqLt8fYyQD8MyLs7HjMzY4tG5e
 EDIWGeiR+8FQug+/Eslv4eiEMzsq6gGLCmPMn/65bpxwYJlCK6SH1RmEWcSBzwVuysFF
 htt1r305OsLRmdIV8T8mJ4eSDFgcnIvEhxkR/jVZsuUNbBd5xJBH/owWLRKK6e0snFpr
 B2Sg==
X-Gm-Message-State: APjAAAXzoRq+FaTeCD2pVy9YpBLkaRzwGJdFIVzya9gVqzMMQc7rQmlE
 qOku93to5dDfzQXOu6pMgbk=
X-Google-Smtp-Source: APXvYqyhMt+jHV/EGDHeeKnn4DGz2gcI8obZzx0YM7gVZ547xqjm80CytqPCRWNKTG/JChQb3KdxZQ==
X-Received: by 2002:a63:5f51:: with SMTP id t78mr7033121pgb.362.1582933933245; 
 Fri, 28 Feb 2020 15:52:13 -0800 (PST)
Received: from raspberrypi (72-48-120-28.static.grandenetworks.net.
 [72.48.120.28])
 by smtp.gmail.com with ESMTPSA id x26sm12623982pfq.55.2020.02.28.15.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 15:52:12 -0800 (PST)
Date: Fri, 28 Feb 2020 17:52:06 -0600
From: Grant Peltier <grantpeltier93@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (pmbus) Add support for 2nd Gen Renesas digital
 multiphase
Message-ID: <20200228235206.GA3468@raspberrypi>
References: <20200228212349.GA1929@raspberrypi>
 <20200228225848.GA14676@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200228225848.GA14676@roeck-us.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 04 Mar 2020 12:57:21 +1100
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
Cc: linux-hwmon@vger.kernel.org, zaitsev@google.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, adam.vaughn.xh@renesas.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Guenter,

Thank you for your expedient review. I will need to consult with my
coworkers to determine a more appropriate driver name. In the meantime I
will make the desired changes and I will also create a document for the
driver, which I will submit as a linked but separate patch.

With regard to the part numbers, this family of parts is currently in
the process of being released and we have not yet published all of the
corresponding datasheets. However, I have been assured that all of the
parts listed are slated to have a datasheet published publicly in the near
future.

Thank you,
Grant
