Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 524F52657A9
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 05:48:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnhYq1RbFzDqjb
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 13:48:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=QUHWqKkn; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnhY65krBzDqbt
 for <openbmc@lists.ozlabs.org>; Fri, 11 Sep 2020 13:47:54 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id gr14so11910314ejb.1
 for <openbmc@lists.ozlabs.org>; Thu, 10 Sep 2020 20:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=txhjVE9JEN76/PXL9etO+vqJsqxPHvLNU8oSXERI7iQ=;
 b=QUHWqKknNG0tyTJOThrzeFyipTP58KCCupawGZSVa38XOisZmeJLD4y/+iRCkYAJ6C
 lnN5p7eUUvxNOTnAIdTQ65oxG0/chBYKp9Rs3MTtQTNxC3fKhIw/R9VzMz/5DyzhN2I0
 OZ+cRCRR9BmbLYqwfYjHlQBCaiF2UV+3awuvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=txhjVE9JEN76/PXL9etO+vqJsqxPHvLNU8oSXERI7iQ=;
 b=J0DtJXRTWEX/7bion0Afqo5BGzT6+MrdV8rm2lG4g9w7gFeGfpiN5qsb9HB46Wqmky
 g1q8Qoxb6BwsRICWkxLxY+p9YZJXKdnWSbCU14NbtBxnzo3i0vC+f7WwvexV017+crB3
 BY6CIdYwC1WBi0T/+Xq60tM+yEKj99+uK4DCX0CvZrP7mDh52THdRlO1MJ61/bvNN70M
 u7Y0oiGIqpx+bKAdfmf/kbXqfIM9cf4bKEbTRL+Ye2NVmyj3lgQSiyWGYqInyQf8ASlP
 i1zTuVtDZF87ulTHvaH7NdkG5u1YrMo8EXEEnjCqrBjzeoWu3Z/K4ifmyUiuQj6e7Wch
 qywg==
X-Gm-Message-State: AOAM530sUzm7fwbEF0SS6nnSExze96M60eWjr/Qzaeopbd9I5LCbOOMq
 r5G7fV4/OHyYBlyYRqnnWNbMZs4HYjMuOfVYUGE=
X-Google-Smtp-Source: ABdhPJw9gYYQnXwjiDX1ysCA4H0aUWtSvYNNw3g2GH1lwrVHQAUqy64IkCYWcl90VkFYq3OLZRhOHE7e0wIIK5wqc1Y=
X-Received: by 2002:a17:906:8401:: with SMTP id
 n1mr133182ejx.215.1599796070371; 
 Thu, 10 Sep 2020 20:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <AT5PR8401MB12193C196089B8572EE50F05D82D0@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
 <5b0e1534-379a-837c-89be-53ef74049fc8@linux.vnet.ibm.com>
 <d6f36d91-5456-c40f-68a6-bd6998fda69d@linux.ibm.com>
 <AT5PR8401MB121967BF331D182D97CA4089D8290@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
 <a900b4df-0fc7-4763-9b4e-3ab5d4d6e309@www.fastmail.com>
In-Reply-To: <a900b4df-0fc7-4763-9b4e-3ab5d4d6e309@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Sep 2020 03:47:38 +0000
Message-ID: <CACPK8XczcDAiuTK7FhazysaN=Sotd5BEJSdJ5wAEUOK_h_5wMA@mail.gmail.com>
Subject: Re: How to comprehensively search the OpenBMC Archives
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>, "Muggeridge,
 Matt" <matt.muggeridge2@hpe.com>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 10 Sep 2020 at 03:36, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Wed, 9 Sep 2020, at 07:52, Muggeridge, Matt wrote:
> > I am impressed Joseph!  Thank you.  That certainly highlights the
> > lengths others have gone to for a comprehensive search feature.
> >
> > There is a lot of very valuable content locked up in these archives.
> > I'm hopeful admins will agree that comprehensive searching of the
> > archives needs to be made easier and more accessible to the masses.
>
> Maybe we should set up a public-inbox instance?
>
> https://public-inbox.org/README.html
>
> lore.openbmc.org?

I was thinking about this the other day. Given qemu is hosted on
lore.kernel.org, I think we could do the same.

I'll contact the lore-man about it.

Cheers,

Joel

>
> Andrew
>
> >
> > Matt.
> >
> > > -----Original Message-----
> > > From: Joseph Reynolds <jrey@linux.ibm.com>
> > > Sent: Wednesday, 9 September 2020 7:25 AM
> > > To: Gunnar Mills <gmills@linux.vnet.ibm.com>; Muggeridge, Matt
> > > <matt.muggeridge2@hpe.com>; OpenBMC Maillist
> > > <openbmc@lists.ozlabs.org>
> > > Subject: Re: How to comprehensively search the OpenBMC Archives
> > >
> > > On 9/8/20 1:51 PM, Gunnar Mills wrote:
> > > > On 9/3/2020 6:14 PM, Muggeridge, Matt wrote:
> > > >>
> > > >> Is there a more comprehensive/reliable way to search through these
> > > >> mamil archives?
> > > >>
> > >
> > > I used the following (bash) script to download the entire openbmc email
> > > archive to my workstation's storage.  (And then I use my local search
> > > capability (grep,  spotlight search, Windows-f, etc.) to locate the desired
> > > content.
> > >
> > > - Joseph
> > >
> > > wget --no-check-certificate
> > > INVALID URI REMOVED
> > > 3A__lists.ozlabs.org_pipermail_openbmc&d=DwID-
> > > g&c=C5b8zRQO1miGmBeVZ2LFWg&r=Xhm647cJDeqUETccV2yvBRCeNJXBtz6
> > > 14MxJzMR9PZk&m=tjRnWO2f8md0hwPIF4dbkqaJbj-
> > > OhYZN2fNFoROxHeM&s=oUgen4rG7u90Uby5812hA_y0dDnG41oD1ZuA4K7K
> > > NiU&e=
> > > set -x
> > > for f in $(grep '<td>.*.txt.gz' index.html | cut -d\" -f2); do
> > >    wget --no-check-certificate
> > > INVALID URI REMOVED
> > > 3A__lists.ozlabs.org_pipermail_openbmc_-24f&d=DwID-
> > > g&c=C5b8zRQO1miGmBeVZ2LFWg&r=Xhm647cJDeqUETccV2yvBRCeNJXBtz6
> > > 14MxJzMR9PZk&m=tjRnWO2f8md0hwPIF4dbkqaJbj-
> > > OhYZN2fNFoROxHeM&s=AVV8sFghgocf1nC9Vf7UGQtg9m1A63Yeux7DAywt
> > > cRs&e=
> > >    gunzip "$f"
> > > done
> > >
> > >
> > > > +1. Could we look at moving to Mailman v3 and like
> > > > INVALID URI REMOVED
> > > 3A__docs.mailman3.org_projects_hyperkitty_en_latest_&d=DwID-
> > > g&c=C5b8zRQO1miGmBeVZ2LFWg&r=Xhm647cJDeqUETccV2yvBRCeNJXBtz6
> > > 14MxJzMR9PZk&m=tjRnWO2f8md0hwPIF4dbkqaJbj-
> > > OhYZN2fNFoROxHeM&s=HWwrQzEzVNtANfa8DBfvdGnK_2nRlSp-
> > > peNmEl1y6n0&e=  ?
> > > >
> > > >
> > > >> I have been using google to search the archives, but have noticed the
> > > >> results are not complete.
> > > >>
> > > >>
> > > >
> >
> >
