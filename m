Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FBEAF0A1
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 19:45:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SXWJ3HNhzF1SB
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 03:45:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ls1qQ0lp"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SXVS2gZpzF13w
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 03:45:03 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id g13so21355283qtj.4
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 10:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L4r53n/P52k/vYYolZeiKK/H7mhZ1KJWLKwBDL6C9e8=;
 b=ls1qQ0lpetrvsynn4WMzXwuEjZVGCN8cseIZ59ZahIHBmS6B+Y+jmN9jB7WLaB1mai
 0Q5FnB8uBveAZ0TzylAMrzp1cqssPS+nA1EvbDQTrQOnHCJjSfR8w6vLNxMzpRz3BxFV
 c99HAlXXCgegK7SwMb/zm2uY4Krgww+eeqepc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L4r53n/P52k/vYYolZeiKK/H7mhZ1KJWLKwBDL6C9e8=;
 b=OGZx/sdT+kOXONqmNsihmgbTIdnOumlLjQ9a6qvPeV6AcSTY1+faDrW4R+AulAlsYa
 dwoNbiQQRNHt24zv5FILWBC2PGlWlO+kFJoKSH6QUJT112skd6NBIcl+cknDfygNnR1i
 gv8qR+pqXI6q4wQSauGCzwWoR7F8yd6cNQAUm9V+YDauI3zfZ7NGEPSolUVKAHFkOC6f
 62dopguoOxWVOgQyRY8QOezUtjax6mn4MYg7KalGRFr5SaCwrtKyUM9N2+gMrqX+nLcr
 kZY1GD5pBJmdlK27ncb0FiWCYr5THc5xCZePjeg7KYNipKxBH0kiWoOhAWZ9/oOlNXhn
 dPRQ==
X-Gm-Message-State: APjAAAVWZtMqqbbyu/q5fqu0TZRQ+vNDx8CVXuMpV8XMdfX9d4HT3jI8
 B5skn1BqEuUDbZsMpepbAIIVkR3c6Q/UhO/2O44=
X-Google-Smtp-Source: APXvYqz2IgcI6DihTUPsaOg0ni/OsP7whnMQNZgjRxeJt4dxpiN5zoiVXqD1lsesyaN7iche2w3esddrvc5G6C8sAWI=
X-Received: by 2002:aed:2ce7:: with SMTP id g94mr30407173qtd.255.1568137500145; 
 Tue, 10 Sep 2019 10:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <1567629311-7553-1-git-send-email-eajames@linux.ibm.com>
 <1567629311-7553-2-git-send-email-eajames@linux.ibm.com>
 <a01c913e-1ae9-4aad-83a3-dec3dbd5b7f4@www.fastmail.com>
 <d6ee4952-6d29-b0e9-08d1-6647472a2dad@linux.vnet.ibm.com>
In-Reply-To: <d6ee4952-6d29-b0e9-08d1-6647472a2dad@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 10 Sep 2019 17:44:47 +0000
Message-ID: <CACPK8XeWTB+ONK5p39Cj0rSGaB40pTSjVsCx7fYNCsdM8cx1EA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.2 2/2] i2c: Aspeed: Add AST2600 compatible
To: Eddie James <eajames@linux.vnet.ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 5 Sep 2019 at 19:10, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>
>
> On 9/4/19 10:02 PM, Andrew Jeffery wrote:
> >
> > On Thu, 5 Sep 2019, at 06:05, Eddie James wrote:
> >> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > Have you tested this on hardware? What was the outcome?

When probing I see these invalid resource warnings:

[    7.179489] aspeed-i2c-bus 1e78a080.i2c-bus: invalid resource
[    7.183615] aspeed-i2c-bus 1e78a080.i2c-bus: i2c bus 0 registered
(byte mode), irq 25

Can you please fix those?

Cheers,

Joel
