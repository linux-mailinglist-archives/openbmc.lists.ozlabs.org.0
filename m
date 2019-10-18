Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6662ADBB41
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 03:14:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vSjR0T5rzDr2p
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 12:14:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="jZOd+bDR"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vShl43Z9zDqbp
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 12:13:27 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id 3so6706958qta.1
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 18:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ba7ZvRqvOk/GR16cTrAeHxE+0CHzBVCkGwWqd66a1fA=;
 b=jZOd+bDR9CS/O30sjWF+an19LgMGPqD4y0UUOYevfisOouAZxHPrtwoRfJEcvNcYuc
 xUtxrpwyjXBsJe3fPaGXHL43WnkH/IJAf0oduZw5Jf2B1gahbNwbEKIIe7NWWJe+4PMi
 GUfwCouRWd2/f90+6nP8L4+oMR4JCbG0ROsHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ba7ZvRqvOk/GR16cTrAeHxE+0CHzBVCkGwWqd66a1fA=;
 b=iXNv8lnpfMYkr7OBspeIse55tlkDL+B8iyqAXIHKckdyKrj+XL1HlviMkO9oAhZK2+
 LxUIasJiGdL/CeKXRH5rT26zf4xb35YpgGX8UMKG59GFAKhf6x4owSt+/iFo6JrtJYFm
 EEGxBFmQaVYbm6J+6q6DwsGEZ4F4t0zttDrn3STKuV9LIodubxiET0zZWLQx3g+H/O+V
 CquLyfywZbG7FgAw+WJKlhSX72LB0ezNnPsDX/7Tvv2RiIfdsxGXM1On1yoad0Bzr4WM
 zfx1I5W4imLbh/EtOokynNYdxTgt26gd2nrYLsEwth+mPHvgKpcpFhM5aWKs1xHxPbtG
 64zA==
X-Gm-Message-State: APjAAAXhQmn9Exi5B0KzANIXoUa5OL0XNhXw3dHlzlOLDKRPDHUnxyp2
 f9geczo3LOrax0zC9+RomV4uLOCZOONuY0G13PQ=
X-Google-Smtp-Source: APXvYqz+Fbl/wZUBBDdtX01MeTqsYU9KsyFSh2IiTzi9k3bJJAKs7dPyt06M5+Q338IMBM2pS5nuzzYiHQezb5HVG24=
X-Received: by 2002:ac8:6a06:: with SMTP id t6mr7085258qtr.169.1571361203375; 
 Thu, 17 Oct 2019 18:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191017181412.30038-1-bradleyb@fuzziesquirrel.com>
In-Reply-To: <20191017181412.30038-1-bradleyb@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 18 Oct 2019 01:13:11 +0000
Message-ID: <CACPK8XdKNiq6xT5y14haEpu2tWPvgOaopD74W7KT7fZ_x3=0+g@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3] ARM: dts: aspeed: rainier: Enable VUART1
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 17 Oct 2019 at 18:13, Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> Like most OpenPower machines the VUART is expected to be at /dev/ttyS5
> for communication with the host over LPC.
>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Merged, thanks.
