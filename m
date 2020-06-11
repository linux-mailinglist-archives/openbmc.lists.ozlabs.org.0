Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC791F6342
	for <lists+openbmc@lfdr.de>; Thu, 11 Jun 2020 10:05:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jGd32B8VzDqTG
	for <lists+openbmc@lfdr.de>; Thu, 11 Jun 2020 18:05:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531;
 helo=mail-ed1-x531.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=b9xD3guB; dkim-atps=neutral
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jGby4Gt3zDqTG
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 18:04:46 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id p18so3268289eds.7
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 01:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZizhS2xyS/yYNk4tJyepzP+3/4Kn7voQM1iOq/TnfEA=;
 b=b9xD3guB3n6TKXyidhFvJ4PYIIY10+LrSI7xiws17fJPqcChbzDItXRFXG4yHO0G//
 uwZn0qIJpdOB0odIkYeXyTwG8YMC25yYRB8bptrGpsl5nKta9hgwBP6CB5sDiIAqCa5/
 ja949roeS4Fs/kY04Bx3TT6NjAKrJP860Yz0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZizhS2xyS/yYNk4tJyepzP+3/4Kn7voQM1iOq/TnfEA=;
 b=ngQuRPMrgNf8ZeyvpAOgbs4g1tYeeHaqQitXsQYWgte1eTn9pffMpo/MDgmndC9vme
 zR65NWjON7AdnWexSe57UX0DmrNA1KGX/h2eBnEQvHrNjdDaFJJx6fJ6Vx2zYLd8Jqe8
 Z988GzsyTAxu6P3t7DoigyECKOZWhIWJGoWxgPGZW3+xbNzvDcrzdA8cNSlOnN6czp5H
 ivO5CbWeD6zCBvdsRFx9BioMVNEVygX4T3r9yUmg8OefMo+HLtaxcLTcSqxWG8Z++QuD
 YkL8ZSHRquALu6ko0dBzRKRj3y1aAL7EpqtGibSk2d7qP0TnCypEH/NQUyO8cP0TIAaZ
 Pgxw==
X-Gm-Message-State: AOAM531KgsrtB6EYo0Z54a+RbO9WdWRQvjio35Vtzz7LqHwZ/i+PHdUf
 f6YtY+jJKB6vJ9YoGoO9AdCkm3/Zg7dt3gbqCqM=
X-Google-Smtp-Source: ABdhPJzDbD+kt3Oz29enMyJ/g5wFw6ZRedyYnd6YCMYLm5nis0M6MnXItCoy7yc5qVqoflOVXZBoSByWY2mtpoAknQs=
X-Received: by 2002:aa7:dc50:: with SMTP id g16mr6170677edu.318.1591862680204; 
 Thu, 11 Jun 2020 01:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <BN6PR08MB25631071D6E7B9C868D4417194830@BN6PR08MB2563.namprd08.prod.outlook.com>
 <BN6PR08MB25631A343FBF33C46F74324B94800@BN6PR08MB2563.namprd08.prod.outlook.com>
 <CACPK8XfkyfOCHQ-gqrSJXn5LUP9x6F0WAFT-gsBsLejVY=XbEQ@mail.gmail.com>
 <BN6PR08MB2563011EFD8DE16180A9637994800@BN6PR08MB2563.namprd08.prod.outlook.com>
In-Reply-To: <BN6PR08MB2563011EFD8DE16180A9637994800@BN6PR08MB2563.namprd08.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 Jun 2020 08:04:28 +0000
Message-ID: <CACPK8XeE=wMEaETV-SENztgLbMdWPDkR9=p3Y65r+yvRdMhvRw@mail.gmail.com>
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

On Thu, 11 Jun 2020 at 07:59, Solon Fan <Solon.Fan@flex.com> wrote:

> I modified below file, the build error not occurs again.-[ERROR: Nothing RPROVIDES 'virtual-p9-vcs-workaround'],for your reference.
>
> ~/meta-romulus-prime/recipes-phosphor/host/p9-host-start.bbappend
>
> Change
> RDEPENDS_${PN}remove_romulus = "p9-vcs-workaround"
> to
> RDEPENDS${PN}remove_romulus-prime = "p9-vcs-workaround"

You shouldn't need this code at all, as the vcs workaround was removed
from the tree. If you rebase your changes on the latest master you
should notice the error goes away.

Regardless, I'm glad you got it working.

Cheers,

Joel
