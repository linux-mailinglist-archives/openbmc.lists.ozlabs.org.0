Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E451745C
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 10:59:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zVlF3K9mzDqGn
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 18:59:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12e; helo=mail-it1-x12e.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SlSiMJqo"; 
 dkim-atps=neutral
Received: from mail-it1-x12e.google.com (mail-it1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zVkT01hrzDq6Q
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 18:58:24 +1000 (AEST)
Received: by mail-it1-x12e.google.com with SMTP id q132so2811616itc.5
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 01:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wvN0+DbmYhp6RL82UZcZ1w9xJ0eqOGlWfc7ADMERmbc=;
 b=SlSiMJqom/Oh9x5AbhZE2hO3AtJrSYbT4ljeQ4HofqXZTVSrf940OmY8I/MCEQRd3+
 jkxl7mhoUUlkfTxr3+MeZKVpibdVHPsaNYGs3rSpV16woAHBsySbzqetNhIzmxBCY7ot
 h+1GKFi+qFUWPvMyOGf9qLqUDC57Rtf/h6pqLtsDsFtUWvzZOSD+R979dKHp1fXUBuHs
 X3fhzGMZVK7p0xI0QdnRNadBid16M+4z+9Z8M8mf8S3FQD9zsCzVzHCotax+N9VNjZGS
 ZSqrO4qUR5dM8T8BuFJwxBylchTsfHFGt8kmYyVihVZKaCTlvM+bcxcjJeogEpJx58Pk
 Ym5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wvN0+DbmYhp6RL82UZcZ1w9xJ0eqOGlWfc7ADMERmbc=;
 b=gvEcKTCI+jd9s7cJdKh7+WnMoWfRcjZ6sRFsRXPCCkp4CDlFGF7IOcyi2vDi9T4cM+
 E2rcr82NSEv0RXF10GnZELjp0twyophsFQ1SVelxxHErUoOYwKsIiOza9kl2nga8n8El
 KeXq3ZkXSZGo6jroOesARnO5wilMRMZLxnGHpYNZ3do5DXmP/9+lHLULqlLIg/SQoifF
 qmRjoY37H5blb78J5Wr0kyPSp+6aWY/HRmify1s/x7ImvTd0WpHKv848zSJ+uzNkUBfP
 jiwTkFGpVflArFIzCy3rd5XlWxsonAepAN9nAhjuTu2qqXrofkeKUpAvbqzG1CTXUW7o
 SOqA==
X-Gm-Message-State: APjAAAV5KtzjwiiweKYL0Bn3aZCBo2sHI1qmqQdNYGh1thUeQ4X64uaZ
 0/KNvh9M2uEn1jqz+wYl6TX4qq0iOjDFTarLAYQ=
X-Google-Smtp-Source: APXvYqyI9sPjyRWA/Sy1hHhHXJT6GTgaAF8FtGAMHNkSdQ7Ddk2e0wjNV6i0UIEp6w3Vm9T6Rwx8FNGoUbHshCGf4fg=
X-Received: by 2002:a24:9f45:: with SMTP id c66mr2518050ite.178.1557305903052; 
 Wed, 08 May 2019 01:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=oNUnnPHXnbybAPAvdq9PvxHe4B3GiX0BYw6rdoXgDqw@mail.gmail.com>
 <CACPK8XcjuXuqejZ4oabLTE-Nv3+JXZ1Zn3qkeT3P1akpR9yFbA@mail.gmail.com>
 <CAARXrtk_AOkHQU09YO1rAzo7A4BbMw0gts+5r3jLK7upyJGXXw@mail.gmail.com>
 <CACPK8Xdcxss9XFEuMoL7Av=P8-ZSuUUY=LmpzT3b_0g=Ls=VNQ@mail.gmail.com>
In-Reply-To: <CACPK8Xdcxss9XFEuMoL7Av=P8-ZSuUUY=LmpzT3b_0g=Ls=VNQ@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 8 May 2019 16:58:07 +0800
Message-ID: <CAARXrtm1wqok-KZCK0r=1cWGx9rVX_EPfftMh3DVZOPLYhEDtQ@mail.gmail.com>
Subject: Re: Proposal for removing legacy code update services
To: Joel Stanley <joel@jms.id.au>
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

> Does it affect the on-device update method of putting images in
> /run/initramfs and rebooting?

No, it doesn't.
You could still update code by putting images in /run/initramfs and reboot.
