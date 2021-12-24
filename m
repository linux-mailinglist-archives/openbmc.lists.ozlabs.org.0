Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A5147EEDF
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 13:49:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JL6MR1hShz2ywF
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 23:49:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D/aW1z4S;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=D/aW1z4S; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JL6Lz1QHjz2xrP
 for <openbmc@lists.ozlabs.org>; Fri, 24 Dec 2021 23:48:56 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id k21so18995999lfu.0
 for <openbmc@lists.ozlabs.org>; Fri, 24 Dec 2021 04:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=v+mZYXTQKznIg9SZmOXXFiIw1yGNzCJVjxa42Xo/8kw=;
 b=D/aW1z4SXBfsU0FwgvS+I1lgS5GNVgEtSeWGfSunXS17GtRfgpivZm9Gi3kEsPCOnk
 6bUHZTq4Q5iBLJblWhCxNgWhLjsxCrryllpKsTE5vAkyrgW4Gz/qCnp4k6xN2FaKg5Ou
 KoWGu9nfpg1MTR2YmlJ7rb7SEzz3KDijXAOvqIOi8P9Bfv201+jjQSaWct9wRfjyKS5p
 w92FSQr9SpDv+/0vjqAKfMJ3N/wGprLYvswkDklaztfyJ8UZcmckRx8YwtKc+o2p3iIc
 5eHIusfjVtXCih4Q9dAVSG0n1E6qWSppWIZOFXwXhE9iDyLMXs2M3r1beOHj6gCJSYPw
 htng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v+mZYXTQKznIg9SZmOXXFiIw1yGNzCJVjxa42Xo/8kw=;
 b=LO94HPt6x1yDT1k4MpsoXI7ukA6tJqbL7DRb8z/0IWnokz1fEaQmowZds6GyYcChfO
 9ghjs5PZ1lSIPu//U2MnPw0Gojl5eRKTATTyB6+8BLU70PKxD/aA9ACaSWIZYqhnOlBm
 XwUEAWv3521Jh5xNBsDp/XuyHzft6yZVF/obMuAKYYFQz43AgDzKxMhY7o62jL3bJrYe
 RopcbJlhEO/BFuZeeaDgT/gNY9E+W3l1EuAzuEvBgkwbar5Bb5XI3g2pWubXJuUC/+Nl
 ClZR96DqFFadL15ox+nDQlgNvAsZNHy8eULLXdz7hSnKBwnfWi06rBtL27+1AK2NfnGZ
 qO6A==
X-Gm-Message-State: AOAM531diTfdnLLPd/m7j1ZGA26I7tXyISRbSn+vZc6sz6p1LZ2K+sI+
 wpkH6MCCPWh9vIVQD6hya/I=
X-Google-Smtp-Source: ABdhPJyYUKFpNhu5MLWWLcaJu7sB5CgIS+fNrv2VAASc83XCDyuPKOZBtuXuep8FGijIcjmn41PCjQ==
X-Received: by 2002:a05:6512:21ab:: with SMTP id
 c11mr4823069lft.181.1640350133185; 
 Fri, 24 Dec 2021 04:48:53 -0800 (PST)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id e14sm775430ljn.78.2021.12.24.04.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 04:48:52 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 1BOCmobH004225;
 Fri, 24 Dec 2021 15:48:51 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 1BOCmn5M004224;
 Fri, 24 Dec 2021 15:48:49 +0300
Date: Fri, 24 Dec 2021 15:48:49 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Ed Tanous <edtanous@google.com>
Subject: Re: sdbusplus reading InterfacesAdded issue: not all variants are
 created equal
Message-ID: <YcXBsQYyi3L1c3rO@home.paul.comp>
References: <YcSZlt4HPeBO3sL3@home.paul.comp>
 <CAH2-KxCD+MKnva7S2iO_iqnQbDKAhJEqMgjV-A_Fn6JZWeEUcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH2-KxCD+MKnva7S2iO_iqnQbDKAhJEqMgjV-A_Fn6JZWeEUcA@mail.gmail.com>
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

Hello Ed,

On Thu, Dec 23, 2021 at 10:14:02AM -0800, Ed Tanous wrote:
> > So what is the correct method of using statically-typed sdbusplus APIs
> > to parse such a "dynamic" reply?
> 
> I haven't looked at the code in question, but we hit the same thing in
> bmcweb, and solved it by just doing the unpack manually from the
> message, which lets you directly unpack into whatever structure you
> want.

I see, you had to dynamically parse it by implementing
read*FromMessage ad-hoc functions as the nature of that case is
inherently dynamic.

Thank you for the example, I hope your mail will surface in the
Internet search results when the next dev starts scratching the
head. And then probably sdbusplus API will be extended to cover the
usecase if it's needed by more than bmcweb.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
