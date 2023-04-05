Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 223586D8B1B
	for <lists+openbmc@lfdr.de>; Thu,  6 Apr 2023 01:34:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsLZ86y99z3fC2
	for <lists+openbmc@lfdr.de>; Thu,  6 Apr 2023 09:34:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=hNj7a2qm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=hNj7a2qm;
	dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsLYd05Sjz3cCF
	for <openbmc@lists.ozlabs.org>; Thu,  6 Apr 2023 09:33:56 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id t10so144976051edd.12
        for <openbmc@lists.ozlabs.org>; Wed, 05 Apr 2023 16:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1680737627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUAjlPJEyOzZJ5YuAhSAM41QnQ1PGA8lTF+NMd5A8V0=;
        b=hNj7a2qmo6UljW4kdIBqDt/yBN1Fka616gqP4R0PItkwOTKZK3lLKWe6KaLoEfdhvO
         YXiXCzaeDchjROrwFG4iylWtb2vAq/4e8EvWz4uwQIy9ZZw6Tt9A+L55BkvQfAwNv3JP
         9eWBjSHBbl8zvS/9BA8aTLYoXGkIynXtoCFdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680737627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUAjlPJEyOzZJ5YuAhSAM41QnQ1PGA8lTF+NMd5A8V0=;
        b=y5M3WCIhntt6QwWJ8i1DQ60/d1/0q3EyJdAOPP9NC0p9NNU2isHZCZ9e+x0S/FnqvC
         Q2yV/Vk+AnIKcoz9S34sPvOWUK8QTTPSptqeShbFrCN640u5JD0l1nDGZGn+Ty5d8CaL
         6OqpJw9Hb1XEDHC2V3mpmoSBy7jednNtid3E6OQeTqyGn4ScxeDdorHQMsBbP4E/AIis
         EOkiRJmRG0DQaUGjvB6iEB9uirgziwBT8zX7XS6TTSfGAxdGVwZYA3JgVJiRjwVraAGg
         DAmXP+8pnO1ixNhcLKnDzY4GTviPwkt1XxRZiI4zEtnwRnFr4/EpelmVzSdZ8e+YBmDM
         h4XQ==
X-Gm-Message-State: AAQBX9chcUUAsdteWs+b3BJ8GEhp9lQXv+xQ9c84xdGPzwpT6pDDlXUJ
	3jayn4FvJQ4a+dW0ChOQcNMpOEBPkS0BVzXN49sgc82K
X-Google-Smtp-Source: AKy350Zq4GALODgwBNa9UqashWRCqk+n6PxLn+iONLHT6TnVqU78gGWALhIUswNKb+zfsxFVfuxbKk9kvkLrWpMnuSI=
X-Received: by 2002:a17:907:2075:b0:947:72cd:9325 with SMTP id
 qp21-20020a170907207500b0094772cd9325mr2541570ejb.15.1680737627167; Wed, 05
 Apr 2023 16:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <191F3605-11DF-4870-AB07-B4A31169B3D2@hpe.com>
In-Reply-To: <191F3605-11DF-4870-AB07-B4A31169B3D2@hpe.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 5 Apr 2023 23:33:35 +0000
Message-ID: <CACPK8Xd2kGxq1sb7DKZ0qXoinYygk6WvPTVqy84kgznGrBPdOA@mail.gmail.com>
Subject: Re: GXP support into OpenBMC kernel
To: "Verdun, Jean-Marie" <verdun@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Hawkins, Nick" <nick.hawkins@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 5 Apr 2023 at 21:34, Verdun, Jean-Marie <verdun@hpe.com> wrote:

> We made tremendous progress during the past year regarding the enablement=
 of GXP into the linux kernel. We followed a path to directly upstream into=
 the linux kernel, and we will probably pursue that approach as nick has es=
tablished contacts with the various kernel maintainers including you. We ar=
e getting used to the process even if it has been a rollercoaster initially=
.

Great work. I saw you presented your work recently and read some good
feedback on social media.

> Would you like us to rely on OpenBMC linux kernel, or just what is availa=
ble upstream, to avoid to backport our stuff ? We are open to both option, =
even if I rather prefer option 1, as it will lower workload to everybody.

For now we will stay with the 6.1 tree, as it is a LTS upstream and
there's still some groups who chose to maintain their own patches on
top of the openbmc tree who are only just catching up. The intent of
the openbmc tree is to avoid this fragmentation, and have our work
progress all in one place.

I would be happy to take backports of anything that you have upstream
into 6.1. We can also take work in progress drivers that are on the
upstream lists, as long as we all agree that work will continue to get
that code into mainline.

Cheers,

Joel
