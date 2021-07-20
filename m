Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBB63CF67B
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 10:58:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTXg1248qz306r
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 18:58:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FvlEnK4u;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FvlEnK4u; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTXfj0BRbz2xxg
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jul 2021 18:57:48 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id i5so34729836lfe.2
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jul 2021 01:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=uCqvGeHySCSFMMq3w4sJfcDlXQ7AiLLiF3gATgf+Ifw=;
 b=FvlEnK4u4X76GJl9+tB8BkgNEKQScapAb69ktEaEuhVI8BzaDBegGNpqGQkDf6D9x7
 c73/S6JBFvnAEP0UJyMIKqs115VTinzY3e+3D5BA+NEHQjuKYe/F+IKcTWn342+yvX5f
 POZ53vFDdDH5B+/fClezX5Yn4HsQorl7wUyHgG4Y2OlA51Jau7kWmompK9L58XN5Cu+i
 xvF/vYlk6u1zZgvyFoSa51HtwnZt2lloF8Kp+7Zh9RiHHMToXagb8Kpz6s1gBCrvzXof
 SXTFP9LR2w0jPoVeuWp56B+irKdOTKS1cFygNbG4tgv7LCRSNPzRM7cu4n3jJn/lmtzI
 89yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=uCqvGeHySCSFMMq3w4sJfcDlXQ7AiLLiF3gATgf+Ifw=;
 b=htRxMyzp6YNlFP6sUMhrGTpEvsenje8Fm+tjSENnvT/pclDxPdUGW0zhnSy8FkvSnD
 vUfvJhuwh4Fu2qb1d7Sp6j5xdWjf0rOhoqBRG/rc8Y+CEUfrzpGJoNGRkjBcDl9NU+hp
 rnsYV9DUUFUdCxb/NPZAmidOlLtywhmHJM202wq3HARfhihlv0Gxi2WbDqboplENoKBG
 WFqbVEqp7JXu/cIGBZS6iqN8aoyfd3PdresX2TUIi7HXXHK5SDX8G2t9oK4f5S7bMsLe
 b+24nGxiA4200actYgIP5nLqG0tX4RsPohtofa3eDbBWP2Tvg3O31Ulr3Eba4TsRAnuU
 7gQw==
X-Gm-Message-State: AOAM5333gJ8zXrN3xte6X5hobhSQT74/vnZiOtSAPklrzWPjxHasxd6w
 BYgBTRBJ+vrdnSV5ie8vI7sxbgkQzWo=
X-Google-Smtp-Source: ABdhPJyqGd87jg1O2T5XUBKYUEaSQcOy3QuyYbwmNP3nmj7gagQ2cv9KIu9Bc8zIm5Wbmh8CRrZhIg==
X-Received: by 2002:a05:6512:1385:: with SMTP id
 p5mr21934836lfa.447.1626771460968; 
 Tue, 20 Jul 2021 01:57:40 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id g17sm2337682ljm.28.2021.07.20.01.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 01:57:40 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 16K8vbw0004703; Tue, 20 Jul 2021 11:57:38 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 16K8va1J004702;
 Tue, 20 Jul 2021 11:57:36 +0300
Date: Tue, 20 Jul 2021 11:57:36 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: openbmc@lists.ozlabs.org, Yong Li <yong.b.li@linux.intel.com>
Subject: xyz.openbmc_project.BeepCode and PSUSensors
Message-ID: <20210720085736.GD875@home.paul.comp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Zhikui Ren <zhikui.ren@intel.com>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

Commit 3046a0242cfde0cbf871f632c2c143b48ac30c71 introduced support for
doing RPC to xyz.openbmc_project.BeepCode , but I do not see any
daemon claiming that bus mentioned anywhere.

As the result, the log gets these ugly messages:

beep error (ec = generic:113)

What am I missing? Is there a dependency someone has forgotten to add
for dbus-sensors? Or is this support runtime-optional and the error
should be handled appropriately to not spam the logs?

Where's the daemon handling xyz.openbmc_project.BeepCode anyway? Quick
search didn't let me find any sources for that.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
