Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCD71F6005
	for <lists+openbmc@lfdr.de>; Thu, 11 Jun 2020 04:32:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49j7D95gxpzDql2
	for <lists+openbmc@lfdr.de>; Thu, 11 Jun 2020 12:32:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633;
 helo=mail-ej1-x633.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=cA1f+6m7; dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49j7CR1PlkzDqgd
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 12:31:28 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id x1so4821463ejd.8
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2020 19:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tiDO9q2QMuR8VrDTbteqVaNIUD8du6SQMlLyMWk4r8E=;
 b=cA1f+6m7059vHVaIXmapHlyIuRHYnVJJfT2YErrIDcDQnD9lk0K1F8tZijA+w7IbIi
 PTcN98q9htWGWXO9oKC6IwNobfXQ6HXeybMhvIp3n4TvRc0vrPayw31M6Efy79czHZxd
 qOmu7W0yVYcowPmUK6VkdJrnH7sZMQR+Udw6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tiDO9q2QMuR8VrDTbteqVaNIUD8du6SQMlLyMWk4r8E=;
 b=ZCH5xFm8/qXZ4y/KZEGyh9TpL3zWNzzOnBgwKVzPNyY+qwqnzx3uRmqWDS54hXpClF
 2vK+665YbVDd8GKyMkeM2b6NHrLURmbSuhF76j2rf9Xoj6YHwRFXXexb3fhwef1NaaT3
 HXMkWD01PAg7mEIa9oYSwGYozJjmBpF5d5QgoheQvmt1bcQO7+YvKTP2Ia4o+PAJ09M1
 udOOdsTgIhjaPRsal1DAJeCOU0rhmiqy76k5xd/5ZNvbPIkKI3JkOHOkmRyhddP1VwR7
 6dcN0J12LzXsaFuDnRIUZo0Qau1MgKEksDGYRxLk4hcOOaBFm1ofB+CbFfS8mdT3Zjb/
 ZrIQ==
X-Gm-Message-State: AOAM533Iim+tZWj2LRLxZ1xdcmPm1p+KQHQWHWzL5YZouygcKwOpNuTt
 a4KE87raaupb6TGzQFcGoI+Zn0tCDIMOQO6RTVG5QgBZIQo=
X-Google-Smtp-Source: ABdhPJwadqO2XHeGRMWrdBQqf2DRPFCLpTfqYY2o68axH1GN6oJBFiUs+kPggH551WxG/mH2qwgLyd+rfOcXHbatYKo=
X-Received: by 2002:a17:906:4944:: with SMTP id f4mr6212404ejt.3.1591842680132; 
 Wed, 10 Jun 2020 19:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <BN6PR08MB25631071D6E7B9C868D4417194830@BN6PR08MB2563.namprd08.prod.outlook.com>
 <BN6PR08MB25631A343FBF33C46F74324B94800@BN6PR08MB2563.namprd08.prod.outlook.com>
In-Reply-To: <BN6PR08MB25631A343FBF33C46F74324B94800@BN6PR08MB2563.namprd08.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 Jun 2020 02:31:08 +0000
Message-ID: <CACPK8XfkyfOCHQ-gqrSJXn5LUP9x6F0WAFT-gsBsLejVY=XbEQ@mail.gmail.com>
Subject: Re: [OPENBMC] Bitbake error:Nothing
 RPROVIDES'virtual=p9-vcs-workaround'
To: Solon Fan <Solon.Fan@flex.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 11 Jun 2020 at 01:52, Solon Fan <Solon.Fan@flex.com> wrote:
>
> Hi,All!
>
>
>
> I tried to add a new system followed by the below link guide.
>
>
>
> https://github.com/openbmc/docs/blob/master/development/add-new-system.md
>
>
>
> But I meet the below error,I am new to yocto,have you meet the same error?Any suggestions could be shared?

meta-openpower/recipes-phosphor/host/p9-vcs-workaround.bb was removed
in 389a7046dffd "openpower: Remove VCS workaround service".

I suggest rebasing your changes on the latest master, or at least a
commit after 389a7046dffd.

Cheers,

Joel

>
>
>
> solon@solon-Precision-WorkStation-T5500:~/work/OPENBMC/openbmc$ bitbake obmc-phosphor-image
> Loading cache: 100% |#############################################################| Time: 0:00:01
> Loaded 3901 entries from dependency cache.
> Parsing recipes: 100% |###########################################################| Time: 0:00:04
> Parsing of 2591 .bb files complete (2590 cached, 1 parsed). 3902 targets, 355 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'virtual-p9-vcs-workaround' (but /home/solon/work/OPENBMC/openbmc/meta-openpower/recipes-phosphor/host/p9-vcs-workaround.bb RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'virtual-p9-vcs-workaround' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['virtual-p9-vcs-workaround']
> NOTE: Runtime target 'p9-vcs-workaround' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['p9-vcs-workaround', 'virtual-p9-vcs-workaround']
> NOTE: Runtime target 'virtual-obmc-host-ctl' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['virtual-obmc-host-ctl', 'p9-vcs-workaround', 'virtual-p9-vcs-workaround']
> ERROR: Required build target 'obmc-phosphor-image' has no buildable providers.
> Missing or unbuildable dependency chain was: ['obmc-phosphor-image', 'virtual-obmc-host-ctl', 'p9-vcs-workaround', 'virtual-p9-vcs-workaround']
>
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
>
>
>
> Kind Regards
>
>
> Solon Fan
> CCS Design BMC
>
> 4F, Bldg. 10, No. 3000 Longdong Ave.,
> Pudong New District, Shanghai 201203, China
> direct: +86 021 20821600 Ext 1402
> mobile: +86 18606220885
>
>
>
>
>
> Legal Disclaimer :
> The information contained in this message may be privileged and confidential.
> It is intended to be read only by the individual or entity to whom it is addressed
> or by their designee. If the reader of this message is not the intended recipient,
> you are on notice that any distribution of this message, in any form,
> is strictly prohibited. If you have received this message in error,
> please immediately notify the sender and delete or destroy any copy of this message!
