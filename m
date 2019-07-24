Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0443672F86
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 15:07:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45twc515nRzDqMd
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 23:07:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kwFzGcub"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45twb16yykzDq74
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 23:06:21 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id j11so23495464otp.10
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 06:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yW1QK/xb/vhiINCxe1DRUYkZzYZj6FDJc1h3pIjvHEk=;
 b=kwFzGcubZmdDk35IQoXU4ABnXjmfoeYwS1wgN0CU1HUsFv5wbnlwF8EcsUW3/Bkm5n
 igkGQwn/tyotcPT2z8S1f73zpZ5nzIBWhPjS2fdvpyR/HC6sg7m3+yOlK+Rc0twwqWA8
 JjejvPgeX5BPA95hbiG74RGx9Ff9OCADnJRjqfcRAn1BA429/20SpKuUrkxLtHQxvYlI
 zdF/6PG2cr9u6bMFe4ta2VVBBbiTo9A03zjTubmZqqaiwhOZIgDMVO7g21tmZcB0eYUW
 kKLKmh4PhoWJ1HrDmUVbTUJ7/sL6Kc5XnBDkROsaVTxCl2tLyadThw7326ZtHWLaHwks
 QB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yW1QK/xb/vhiINCxe1DRUYkZzYZj6FDJc1h3pIjvHEk=;
 b=YHNricCFu0xNGuH9mjR93ebSSYNHjV083nh8MLKhRMY9GWAwqfq62SwvfvcDDJwcVq
 a6waiikAjC1H3+7USX5ARlzEIYa3a3+zk2W1Yqmxw0K17KJ+10dSbkcunwYQM9VQyBGc
 95jDUWjhX5aoRw4xRWYa+UKID5D8DWDeDfc2N+MMF+tB/zTieD4yu/QFsuhqKO61SP87
 p29ocv4bQVcolQYaSCjvPRY88vU+Ee5QUn4TomgpsYcUfQzZ7MsdU03wbWiPBu6+S7eS
 umq6D5f/XXDnSGRN5Axn0UoPBhFbMZcXlm5sSmrtYG0yQxdE6UTfjHuZm5PKIDIGV9bN
 +zQQ==
X-Gm-Message-State: APjAAAXoim9jl+CF1CK4xuBm6ZhrBqVo9pZD8PJD77sJUgYk/hklgYIS
 twBZNynAOdBhlPiXKrcbtQUrja2Z3jUthjSIo08PGpmT55s=
X-Google-Smtp-Source: APXvYqxcxYKkgaxPx4NDBZ53yyiPsA90wgP1ISDX+hnODz2SrLsGxlxftEw4lNH/2vnicNcRAw0lstvDgoHZ/EislS4=
X-Received: by 2002:a9d:5512:: with SMTP id l18mr28980930oth.260.1563973578215; 
 Wed, 24 Jul 2019 06:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <CH2PR04MB6933DAF6642B253AA3527F6FB9C60@CH2PR04MB6933.namprd04.prod.outlook.com>
In-Reply-To: <CH2PR04MB6933DAF6642B253AA3527F6FB9C60@CH2PR04MB6933.namprd04.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 24 Jul 2019 08:06:02 -0500
Message-ID: <CALLMt=rA2-fKW=cPyCh25uH8YM-ufs0x=ZCwSso+du5h_-TBPA@mail.gmail.com>
Subject: Re: Is there any documents about configurations/YAML files
To: Brad Chou <bradc@hyvedesignsolutions.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jul 24, 2019 at 4:17 AM Brad Chou <bradc@hyvedesignsolutions.com> wrote:
>
> Hi All,
> I see there is a /recipes-phosphor/configuration/ folder contained many xxx-ipmi-xxx YAML files.
> I tried to read it but still have no clear idea about how each YAML is for what feature.
> Also each YAML seems to have its own syntax, but have no documents or comments to describe how to use it.
> This can be a problem when somebody tries to add a new configuration on another machine.
> Can anyone who has familiar with those YAML files can provide some simple guide/documents to let me getting  started ?
> Many appreciated.

Documentation is definitely always a struggle, especially with
how quickly things change in OpenBMC. Like the recent addition
of that configuration directory probably hasn't made its way into
the docs yet. The goal is that this document be the main entry point
for people creating a new system:
https://github.com/openbmc/docs/blob/master/development/add-new-system.md

Tom, Vernon, Emily, any better documentation out there describing those
yaml files that are used by IPMI?

Any help with the add-new-system.md would be much appreciated.

>
> Thanks.
