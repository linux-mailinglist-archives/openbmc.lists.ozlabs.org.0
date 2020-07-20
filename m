Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E69ED22668C
	for <lists+openbmc@lfdr.de>; Mon, 20 Jul 2020 18:04:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9RP71XfBzDqfS
	for <lists+openbmc@lfdr.de>; Tue, 21 Jul 2020 02:04:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cag5lvwj; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9RJv6pPHzDqNF
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jul 2020 02:00:24 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d1so8872352plr.8
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jul 2020 09:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=vbEKGfJeGT8FtfQc5tbb58WsrzZlL590vII3/ZOrzZ8=;
 b=cag5lvwj2WFZbIiVh5O/JBZ+tajLq6fhFEoR8eBqXQiFH8kVTunu+nSi4mcyGt+zfw
 GtLSeBGSbHslx251sDSP2wJPO/m5XMWimJtSmLseypoJ/v+ffGFdJsGFOomVOmvYPC3z
 AfM8uaBIBQw6YwTWyyr9pnkK3xuzwPRz/eoegE2VpUPiZJQlJK0lwu/DMSTf7406PBcw
 Xr4/h/fFyNXRCw1LShB+TPEUzQd2VapcCCFcAoovabrvWKnH576KZ5OSwB5hKOmix6zP
 OleVyCoIVvgvVGIZqG/1KqBJIQ9daZlhqLX1MbKKG+J0lVJ07eKtS7KLAXQpaPdQGoKH
 /3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=vbEKGfJeGT8FtfQc5tbb58WsrzZlL590vII3/ZOrzZ8=;
 b=OKYPq+G1P7n0+0hA8VVkojrlNUBWWulpubNuaTWrRsF5miN7r6/4Ai25RDhDqiJ2cy
 6a/DfRGJqEF9yXpD/2SJ7aiQiEDLUX9n69a6iQDuLyBcU3CAnEnfgeTlJ/o8XqNqfsd9
 yKFwqo2dhHJK6HgfE3kZSlR/wnXXE74QuR1RWSjFp0zPQMZAp3fe6kbUzem8DoGLnn2e
 4Nvkt3cuaNLo37gY/ALwSySL3RJwaDeHLs4X6ZyJsiXXaMDOsuZCGisYBJi8F0rj46Ql
 SZzL+ETt04/n2V9I5hoGKQoGIIm/rf6ZIrl+vPo6jsfXMfZxDDQ5w+ju4NTrwvGZkyUQ
 z5Zw==
X-Gm-Message-State: AOAM533niFIJw5AzIbeWaDqqJ3yKvoFWKYRv9P3zOAWqOXmvGbgRoYsZ
 I+XU0PZv68pYkRo6ZyUqJmMLYFkU6JM=
X-Google-Smtp-Source: ABdhPJwOr6rJLtk6LzsypD6JsQhi2oVi09IaS2AXj1GOZXdYKzbmOx22O6Kue4pIFSfeJoGjwjapdQ==
X-Received: by 2002:a17:90a:1f87:: with SMTP id x7mr50449pja.101.1595260819921; 
 Mon, 20 Jul 2020 09:00:19 -0700 (PDT)
Received: from cnn ([2402:3a80:469:7682:2490:98cd:681b:5963])
 by smtp.gmail.com with ESMTPSA id y18sm17156717pff.10.2020.07.20.09.00.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Jul 2020 09:00:19 -0700 (PDT)
Date: Mon, 20 Jul 2020 21:30:13 +0530
From: Manikandan <manikandan.hcl.ers.epl@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: add multi-host support in the phosphor-post-code-manager
Message-ID: <20200720160013.GB17117@cnn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: kuiying.wang@intel.com, velumanit@hcl.com, manikandan.e@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi All,

 We woukld like to get opion on below multi-host support approaches.

Background :
------------
  The Phosphor-post-code-manager supports only host 
to store/retrieve the host postcode history.

Approaches:
-----------
Approach 1: << run the multiple process >>

Create and run the multiple phosphor-post-code-manager process to handle each host postcode history.

   xyz.openbmc_project.State.Host0.Boot.PostCode
   xyz.openbmc_project.State.Host1.Boot.PostCode
   xyz.openbmc_project.State.Host2.Boot.PostCode
   xyz.openbmc_project.State.Host3.Boot.PostCode

Approach 2: << pass number of host to single process >>

Pass number of host to single process phosphor-post-code-manager to register dbus object 
and handle each host postcode.

   xyz.openbmc_project.State.Host0.Boot.PostCode
   xyz.openbmc_project.State.Host1.Boot.PostCode
   xyz.openbmc_project.State.Host2.Boot.PostCode
   xyz.openbmc_project.State.Host3.Boot.PostCode


Thanks
Mani.E
