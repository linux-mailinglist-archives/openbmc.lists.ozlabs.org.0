Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE3B273A7E
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 08:02:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwW1q5nmLzDr09
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 16:02:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634;
 helo=mail-ej1-x634.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=KVOeWwL5; dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwW104BfbzDqmj
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 16:02:10 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id z22so21037793ejl.7
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 23:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p2eKNYJFpWe4E6nHom1K/Yh9lLZJZTmquPArhIgd3cE=;
 b=KVOeWwL5jTCiWZDxx/ciihs78EPlvVdjIYrTHTPN/3Eg85sdYIEEloUic4m+Kv+RMw
 NWoiXJN+XY29FMnYo8n1GhMxm1CgHioopFNbR+byNkkpRjhACLhq8N5b5ylC1/AqDIyY
 zrPxhXqEsKZ8OVEap+jG9t9Hb8pgyUHpBjjc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p2eKNYJFpWe4E6nHom1K/Yh9lLZJZTmquPArhIgd3cE=;
 b=eOf1jBRDvcaPXzB605ojqsDYLQ6lr2BIZFWD9crngBumjGu08bnMrzxu03myM/TaEp
 M+dP5z4Q30kMobUH3jdFx7lj/brCyrP368ECJ/Yq/B4gqEuGVoWs7mtE0bl9vtKB3BKI
 T/g47rEILxDSGoMgEemTH8Ex3x+gLwOO+AnbjOgH84lbG3D1d/GqC0G9qg/+RJeLThPG
 47HYTVWyuwhwYMHFVPPnFoj+P6/mKT/gJz08bTqurKRvWZ7yqd+bA9nci3H5YqcqriJ6
 2RUri7Q7VeXFU40lZ2uPxDpC7ruSZaKi7Xqto3SoOwKo+5aYgCm5/qNFqB7FGrtb5Nx1
 IflA==
X-Gm-Message-State: AOAM531srIBBZMMNDgHOYsDCrZyXc1H/94DDgBVhxtIFKb0Kn5CUnvaO
 S95d5z/Vl2gmEITa5HbfmMScHtuwOguhjgG6iLoS/Fn9t3I=
X-Google-Smtp-Source: ABdhPJyb+cwlODyahNY0jtvpjAKPBpaGLnLdNdYk1pn4Au/QeZBvl2ysASNIOzGKU8vpwd7PuIr9gdky2bu44I/lz1s=
X-Received: by 2002:a17:906:e918:: with SMTP id
 ju24mr3057012ejb.442.1600754523846; 
 Mon, 21 Sep 2020 23:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <AT5PR8401MB12193C196089B8572EE50F05D82D0@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
 <5b0e1534-379a-837c-89be-53ef74049fc8@linux.vnet.ibm.com>
 <d6f36d91-5456-c40f-68a6-bd6998fda69d@linux.ibm.com>
 <AT5PR8401MB121967BF331D182D97CA4089D8290@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
 <a900b4df-0fc7-4763-9b4e-3ab5d4d6e309@www.fastmail.com>
 <CACPK8XczcDAiuTK7FhazysaN=Sotd5BEJSdJ5wAEUOK_h_5wMA@mail.gmail.com>
In-Reply-To: <CACPK8XczcDAiuTK7FhazysaN=Sotd5BEJSdJ5wAEUOK_h_5wMA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 22 Sep 2020 06:01:52 +0000
Message-ID: <CACPK8XdWozzt=n2tpyqnncTSGSjRxnNpnb_Sa_z4rjS2A=NNEw@mail.gmail.com>
Subject: Mailing list archive on lore.kernel.org/openbmc
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Gunnar Mills <gmills@linux.vnet.ibm.com>,
 "Muggeridge, Matt" <matt.muggeridge2@hpe.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 11 Sep 2020 at 03:47, Joel Stanley <joel@jms.id.au> wrote:
> > Maybe we should set up a public-inbox instance?
> >
> > https://public-inbox.org/README.html
> >
> > lore.openbmc.org?
>
> I was thinking about this the other day. Given qemu is hosted on
> lore.kernel.org, I think we could do the same.
>
> I'll contact the lore-man about it.

We now have the openbmc list archived at
https://lore.kernel.org/openbmc. This contains all of the history, and
will receive all future email.

Have a read about lore to learn about the features it offers. Most
importantly, it has a super fast web interface for searching.

 https://www.kernel.org/lore.html

Cheers,

Joel
