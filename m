Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D4DA1C9A
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 16:23:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46K4b34170zDrpW
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 00:23:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MKs2mnFu"; 
 dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46K4XM5rRszDrcN
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 00:20:51 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id w2so2165730pfi.3
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 07:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uTTwVwZZmDQxeToBwJItnBWZtlRH+kWjkcHyxtxpcUs=;
 b=MKs2mnFuG6o2gAuyMEY434V/NJNZ93uQpONfzKTrcUkQt3RhICasoaPDLmMvW7+9CP
 cAG3Obj7/m4JhFdJdyDp/L+LHY4WApmYOPlBOxhv2tmVvIe//MPDBppYSa7yzeFrLzG2
 LWPf92yzV0gcSW9weccaKJF6mNptNtzlc0P4TqCd6jlgBOKFf5YE07Fc6IFTgwwDXX6U
 Jdn+/OEbGeoGBZL7+T493mpzd1WHnkKP9NVcm2UVYekAO81X6AGHr3MkNe+TBa+9tS5V
 +GuhIq9OsxzaTH9otwiCpJ9HnkUP/1MLzlvaAsq0c/gek5S74y5PsyCxYJi3X6jL5zaf
 0Szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uTTwVwZZmDQxeToBwJItnBWZtlRH+kWjkcHyxtxpcUs=;
 b=lxD+3D82MybgX0cccTsqI8SSE1ZREZUGluhS2W6weJu2lG0Jbpnav0CPPDSwQnyYiL
 aSEXGzmX1o2E2996DZxRkSNkxIeMym9LSCQrvWlC/063QZk5Zyd8kiuzBoeW70RqiR9C
 ZXX0O4XuQOGw50NBxQX+dZ+ikjDhAwOhVwzYgP0DnDpbdI+73Or2JdDd8aFLH6ynt7Fx
 icEt+jiw5cEwwudVUelOGvtiZj6WJC4CfhLklxlSfpQKYR6IvOXMy+WftsSTI7rI5J/J
 c9U92D8k21M7ppq8td/qKaOrK2+5GH9QkO90+UJD7SwxWFo63ecRVHRjD6DSgVYZdqHj
 kztg==
X-Gm-Message-State: APjAAAW+dLvwsrL/zodmQRw6kSmVEPbQeF8NqOONU75r9xPi5UmEqbfR
 O1wt4nsOrr5Lj5wV4C6lK17vrLi8AL2dW0C0vD2ubw==
X-Google-Smtp-Source: APXvYqztoR1NTXMRB4lCBzxbXfEATRKeRB+jE92W6GZiefFYlN0U7PRp7HpYeESJE82MHuFynIOjVQZ4EWfhj7aAta8=
X-Received: by 2002:a63:1f1f:: with SMTP id f31mr6189673pgf.353.1567088447101; 
 Thu, 29 Aug 2019 07:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <MN2PR04MB666928CBD20DF6A0D894273FCDA20@MN2PR04MB6669.namprd04.prod.outlook.com>
In-Reply-To: <MN2PR04MB666928CBD20DF6A0D894273FCDA20@MN2PR04MB6669.namprd04.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 29 Aug 2019 07:20:35 -0700
Message-ID: <CAO=notycWLR-DH=OxR7ssM+pwQttf6L=qVW42Q7Fko-WOgdetA@mail.gmail.com>
Subject: Re: phosphor-ipmi-kcs(kcsbridge) is not included in image.
To: Zheng Bao <fishbaoz@hotmail.com>
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

On Thu, Aug 29, 2019 at 12:54 AM Zheng Bao <fishbaoz@hotmail.com> wrote:
>
> Hi, All,
> I tried intel/s2600wf and faceboot/tiogapass, but neither of the final image has kcsbridge.
>
> I checked both machine/xxx.conf and found the line
> PREFERRED_PROVIDER_virtual/obmc-host-ipmi-hw = "phosphor-ipmi-kcs".
>
> It seems that it should be built and included in the image.
>
> Anything wrong? Thanks.

I ran into the same issue a while ago and didn't have the bandwidth at
the time to debug it.
I ended up explicitly adding the appropriate package to my images via:


meta-MACHINENAME/recipes-phosphor/image/obmc-phosphor-image.bbappend
OBMC_IMAGE_EXTRA_INSTALL_append_MACHINENAME = " phosphor-ipmi-kcs"



>
> Joe
