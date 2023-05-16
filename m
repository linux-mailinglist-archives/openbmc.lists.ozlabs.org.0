Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FADD70443C
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 06:12:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QL2rm6QvTz3f5l
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 14:12:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=k0W2ia7Q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=k0W2ia7Q;
	dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QL2rC4kpsz3bYW
	for <openbmc@lists.ozlabs.org>; Tue, 16 May 2023 14:12:10 +1000 (AEST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50bc5197d33so24776693a12.1
        for <openbmc@lists.ozlabs.org>; Mon, 15 May 2023 21:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1684210323; x=1686802323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E3fCy6msPfiKC4guhwKpXMV6cPCGNx/cErFtumfMCj4=;
        b=k0W2ia7QmwecWuo5oemoOvqIxv2L98ZE3yrPTXciFpyRXrb8h77TY7xrx+KlXPklqs
         oEc+JYvIl2/bI+9+lniSOp/CUengXwDWJ8tMHEhFBKiZld7TRXLzyfxsIq5/u1Mnc+mt
         nlycO7lL4vaENhABMCVSS8yFv2yO3omstnfBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684210323; x=1686802323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3fCy6msPfiKC4guhwKpXMV6cPCGNx/cErFtumfMCj4=;
        b=H3VofPmec1/eS1eAxbzy7KtVzYSP3wICX2BY2LgDKaSnJZXxcBrFLpCZ3knwzuptki
         /SOKU04SUtM7+Gw0k84J0MUVNU/uRCu7TzMpjj5L9jzIXfsInTXLgGuCG4dzBTLMpaW3
         dRoAXI8/UXYUAi/2u7/QhFe3SIzhb4o4IxJDQ1AdgksQvkE07onU/E8dVXviA7qvhueU
         UdqNcuG9R6Alqc63PwOHDxlevkLOqnO0M7eW0HeNDyQfs6UpDZG7kozkC8keGEywx8D4
         YVjmLg6dQRyOSWI/iVhBUunizKunAxhtZQG4S8ggl5yLti5rbTacMo0Eco/j3KqZ8jl9
         svOw==
X-Gm-Message-State: AC+VfDynTEMt91pMvtzLHZ9+V8BYsJm5hvJ3EynRjUas5caGQx0e65Zd
	Njb5Q0X0hGp0M6BsKlSRnK95Yy6Sp7gE9tTbWbwpRQqwVxk=
X-Google-Smtp-Source: ACHHUZ6ysAFx3NNsd+9N5hLoRPlbKnhIOTQndk5D1tCLTxISFtxAX58fjIlwvo3ZftrQynWZ6O9wAScvAd9FrDGzCes=
X-Received: by 2002:a17:907:c10:b0:95e:e0fa:f724 with SMTP id
 ga16-20020a1709070c1000b0095ee0faf724mr33497548ejc.39.1684210323246; Mon, 15
 May 2023 21:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <BM1PR01MB24676E7E8F7FB0BD7B71E6F185769@BM1PR01MB2467.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <BM1PR01MB24676E7E8F7FB0BD7B71E6F185769@BM1PR01MB2467.INDPRD01.PROD.OUTLOOK.COM>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 May 2023 04:11:51 +0000
Message-ID: <CACPK8XfGBncVe3M2k0kALYwY1yN=a35f=Ee3m7SzEdO6nU_FOg@mail.gmail.com>
Subject: Re: how to bring up OpenBMC on Renode
To: Shubhabrata Bose <shubhabrata.bose@tcs.com>
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

On Tue, 9 May 2023 at 11:45, Shubhabrata Bose <shubhabrata.bose@tcs.com> wrote:
> How to bring up OpenBMC on a Renode Simulator (https://renode.readthedocs.io/en/latest/introduction/supported-boards.html) ??

>
> The target hardware that I am interested is AST2600 but looks like its not in the renode list.

I'm not aware of anyone using renode for openbmc or ast2600 work. If
you would like to bring up a model I would suggest talking to the
renode community.

The openbmc project has experience using qemu. We have most of the
ast2600 devices modelled there.

There's some documentation here:

 https://github.com/openbmc/docs/blob/d1d05ee639c0295bc84f989ab996098b5feb9157/development/dev-environment.md?plain=1#L141

And the upstream documentation:

https://www.qemu.org/docs/master/system/arm/aspeed.html

Cheers,

Joel
