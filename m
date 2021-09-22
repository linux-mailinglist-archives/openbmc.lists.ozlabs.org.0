Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 366A941418A
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 08:09:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDntr1HtJz2ynf
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 16:09:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fQAkE+88;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fQAkE+88; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDntN4bM8z2xrP
 for <openbmc@lists.ozlabs.org>; Wed, 22 Sep 2021 16:09:00 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id c1so1762029pfp.10
 for <openbmc@lists.ozlabs.org>; Tue, 21 Sep 2021 23:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tdC7oGhajRK1bGAJUBAVaujmo4XyXzBpt4ZGqujBiso=;
 b=fQAkE+88hkcgwOy8E9IlTmoUTsIsz5xsfGTw10C/nYLP2yC92nT8gVXqacPyZaG3dj
 w2OFuO3OtV/A9LTwWIR4HtB5YsH5G4J48b9vmVxf9v3v2tlznQ1QMvYIWkNFRd8cRyRP
 WfkOFzyyl8kD1fUWTz957rkMzHP2eqsgrgCKX9MvNHzGYxad29M9Cb7IEScoR3VElNht
 2I66hAyKwT2Lk8qjGZSsFik7NtfOzRBMmeEMvtSMrgqzBBL+oHwfWATRpRU0Mn3qaasN
 aCaIdTabOP0jIkudM7JLmVvVuvr4XE0ncDsdsWL2H9DGjOiBNmKysgKK1TDcK138juit
 V4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tdC7oGhajRK1bGAJUBAVaujmo4XyXzBpt4ZGqujBiso=;
 b=lWMNh0qerd+ZEn0H51XiU8gltME9FPTUK+NxWnKuRls5ufaC9wgE/IrvpEBrRE1IV3
 YEEV5WP778NvJ6mQ+9UzPUPjLehBID1GZ4cPeqGaR9UCEEvVJbTJNIvCwDd/7kFDsOjw
 OLX1a/N3H+/MRmFsn6L3VQfJK1C8fXVMgkkrBS1SYV0pVyKMhedUiFL4trxzqzDg1I9I
 3rJSw2WRUDg1/mYnYs89ch+uTHJg97ugAOJ8JC4zGhenKSRD8QZ1tuUti3fO2/oYQfyK
 SUn12fjJlIqiah71m51Q0/957C6FYco5atxk7kicUrhW6bdZmpFIo6EVU66DYat0CT5S
 +o9Q==
X-Gm-Message-State: AOAM532hsukeR9RnHPzd/Pb3+OCNCB0z+FlpEE6Teykq3Yhb4ceAZYRA
 xpLaua0dOHKkgcKG5XEmfmM=
X-Google-Smtp-Source: ABdhPJzvkRIXlQlI1oBZZcxFwdCAPPMcqdcvJ8FGH08wI4opyS9P976Kqhbw0voBeQNkI1Lp144cSw==
X-Received: by 2002:a63:7211:: with SMTP id n17mr31420123pgc.456.1632290935673; 
 Tue, 21 Sep 2021 23:08:55 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-92-48-112.hsd1.ca.comcast.net.
 [73.92.48.112])
 by smtp.gmail.com with ESMTPSA id j23sm1060473pfr.208.2021.09.21.23.08.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 Sep 2021 23:08:55 -0700 (PDT)
Date: Tue, 21 Sep 2021 23:08:49 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: Kernel moving to Linux v5.14
Message-ID: <20210922060848.GA31321@taoren-ubuntu-R90MNF91>
References: <CACPK8XdMu_xc+3dp7T57azkMp==1W5xpt6t=bSZWiNaA7vDJ2A@mail.gmail.com>
 <CACPK8Xeu_3y4Mnsk-_rzWRQsx0nY=0cuqkM4FGoz_sbhOZ3BCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xeu_3y4Mnsk-_rzWRQsx0nY=0cuqkM4FGoz_sbhOZ3BCQ@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 22, 2021 at 12:24:46AM +0000, Joel Stanley wrote:
> On Tue, 14 Sept 2021 at 02:11, Joel Stanley <joel@jms.id.au> wrote:
> >
> > The openbmc kernel will move to a 5.14 based tree for Aspeed and
> > Nuvoton machines.
> >
> >     linux-openbmc: Move to Linux v5.14
> >
> >     This moves the OpeNBMC kernel to a v5.14 base. There are 78 patches in
> >     the tree, plus a the MCTP core and device tree changes that were merged
> >     in v5.15 which have been backported.
> >
> > https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/46847
> 
> This has now been merged. Thank you to those who reviewed the change.
> 
> Please address future kernel changes to the dev-5.14 tree.
> 
> Cheers,
> 
> Joel

Thanks Joel for carrying and backporting the patches. I'm also porting
Linux v5.14 to Facebook OpenBMC tree and these patches are very helpful.


Cheers,

Tao
