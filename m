Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2011B4B001
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 04:28:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45T84f6SVnzDqWM
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 12:28:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="eeQ07ava"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45T84244vxzDqW4
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 12:27:30 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id m29so18112728qtu.1
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 19:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/q+Ja1O5ABwjBPAeOpN13Ty91npHj8EIcL6KoUCSVdE=;
 b=eeQ07avaczpQhfoiINmrb3daL29cP1LRQ6ik7stVEysDZXQ1Atk1GmJ76oETnvORL8
 QYj4xpkOuXrYeiO20oFllCNeA67O0Q5idztP9CJdpRXtfMqqHRDYxsYKpW5RuxgaDDyo
 djmieUyE2KvCSWVQBKZoJWT3v8pUuUGspjgJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/q+Ja1O5ABwjBPAeOpN13Ty91npHj8EIcL6KoUCSVdE=;
 b=MSsdTKnntAxdHNGubY5EkePVKmuogG0j8wWOLCRAwF8e6ufpbs+K6tYHCwLqcSHdw2
 kxIZhywmpCKtb37LiICAR6gICfvUNGPofjHb06UeTY6l4OiSRJJdFDxN20p2sdp3J6z8
 XdieCRvs24LYbZ1sulpHzDLf64+ozrefWGZoa9AHMJp8dyxnYgPxou/mUdK9fL7g2F27
 +L/0egVV14iUnjxXcaFazO+kmK9RvZpbtDfr/7DWrU2/0PzbAFgPXpj3TJP/Ia+uMca4
 KyTVdoXRh/naWQzxmjdT+koPQyWfDYMS/SrYKWfZFy8atJ4i8VT+0g5Jru1sUtXh9K5K
 yyOQ==
X-Gm-Message-State: APjAAAUPus450JPz1/oMJIt9cC+dXoK5VzP8wtfOGIuYiJvqnsLgowuu
 kh5bskD5heDa9tKVzXVcGSd7p1rPxsFqRugFhfw=
X-Google-Smtp-Source: APXvYqxZS5rZs+KP8KgezcadtqNjXjQIyRBh6YbcwI8amDx4KDzXqgb0L3xpV9LPhaMnV7IxRRAPbsRDaJcIaQpzTQs=
X-Received: by 2002:a05:6214:1306:: with SMTP id
 a6mr17736750qvv.38.1560911246381; 
 Tue, 18 Jun 2019 19:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190618013720.2823-1-sam@mendozajonas.com>
 <2dda04ee-d0d4-be7b-b29d-bcde5c21656a@kaod.org>
In-Reply-To: <2dda04ee-d0d4-be7b-b29d-bcde5c21656a@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jun 2019 02:27:15 +0000
Message-ID: <CACPK8XczCRWwPLCB=JivaDdJ5jTnriLVhtL2aBinQ=ZYbm0=Xw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] NC-SI PHY Support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, Simon Glass <sjg@chromium.org>,
 joe.hershberger@ni.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 18 Jun 2019 at 08:35, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 18/06/2019 03:37, Samuel Mendoza-Jonas wrote:
> > This series introduces support for the NC-SI protocol to u-boot,
> > functionality which so far has only been available in vendor trees.
>
> Would it be complex to add a romulus DT and config file ?

I think it's a great idea to follow up with that. I suggested Sam
focus on the network and ftgmac100 parts of NCSI first.

We will need to add support for the NCSI clocking in addition to the
device tree and config.

Cheers,

Joel
