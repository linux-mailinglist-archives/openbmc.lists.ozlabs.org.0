Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E81203EABFB
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 22:41:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlzBT5qpkz3bSt
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 06:41:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=0XiCpajq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=0XiCpajq; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlzB43YPnz2yWr
 for <openbmc@lists.ozlabs.org>; Fri, 13 Aug 2021 06:41:30 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id m17so8628469ljp.7
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 13:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2rqT8t7ux/Tq/EADFg1unZd0vA+hq4iN0Jx1UJJ+SVY=;
 b=0XiCpajqJTrYFH/B4MkQh/JRTOIB1bKLp1N6cCVPb2UO8xp4pK7A+8kjuBtOTVcyfe
 W1E4uSVg4qZGzon0y3KdYg0mtOHRdPulFTut+eDJN69USSviSnWBO+d46pNyrl2Parug
 sIXA7wMqrd5XAqRuHOgu5wNfmkeTzI4x9jgNrMOG4A1MBazidR71pjQtV4WKyDEO1qaY
 Syx+PKT9md9HBNl39uUk/ypOpJT4qG6hzSEYjwZXV8jr6oPeHioVZ1nbW5vNYhi2Q1zz
 tZHpIHK+6aY+hYSdMVRJ9HKdTkhq/w+CikWL5J36WdssrbbVWaNioAEKvxirC7NzG4sR
 1THQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2rqT8t7ux/Tq/EADFg1unZd0vA+hq4iN0Jx1UJJ+SVY=;
 b=FifLfHAoffWU9pndz+ubYwjzujBDw8uPHD6Mgxd6o/wMifk25gRKqlyO9t3ecc4DyD
 kIrBWuEjqITulO9DuAfI5iAE+Y4bh1PV0TJTRV3VayjgitoFyCqvf8PO4X+992k5gIuP
 WnHF+FyJW7twlpLS4ZA8s4JGMyxNIJlqE6pMenFDDHEDCdZ1B1zQ8507AP3NAfIGtiys
 Fjaac0IsnLuEq9r7bEVk1PshZEBHpJEhQHtEAffGIFg+dXvEmCUiF3L6mnTfcb1OWiap
 cYPDEvB3iTZnEyKPEjdBxSt+dEqaDXbxQwbzwMwiGN0s2sapCN/U2ULAbC19GdUyUozK
 vhtg==
X-Gm-Message-State: AOAM5323tQvbQiMdgBo/5MtjWfLyl6f16LpeKn4YFM1WZI0lQG+qJnhy
 tzXCj0alKwZwKBoiZI6RMwlDUl1CkP0TlJIfWSpVyQ==
X-Google-Smtp-Source: ABdhPJysG70gDBBZMPDaQ2yR5R8IhRS+K7+Fw1YjZTITzJ8Le/b809bz/EUV8BqiIiSyBH5BUletHvW6vrjK6vcksis=
X-Received: by 2002:a2e:b88f:: with SMTP id r15mr100397ljp.306.1628800886722; 
 Thu, 12 Aug 2021 13:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAKJqRLVQYxzFEUOe=jF93dVvR86JJWk_uO9KnVLriJ+jDdkDVA@mail.gmail.com>
 <95593cd9-a394-1388-d227-f54f05c6b2ba@yadro.com>
In-Reply-To: <95593cd9-a394-1388-d227-f54f05c6b2ba@yadro.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 12 Aug 2021 13:41:15 -0700
Message-ID: <CACWQX81EWvBY=g+weGJHbxA2NWzujeHrHFBA9Cbv0=0OMGya1g@mail.gmail.com>
Subject: Re: Turning off the D-Bus REST API by default
To: "i.kononenko" <i.kononenko@yadro.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>, 
 Derick Montague <Derick.Montague@ibm.com>
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
Cc: Ali Ahmed <ama213000@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 12, 2021 at 1:32 PM i.kononenko <i.kononenko@yadro.com> wrote:
>
> Ali,
>
> On 12.08.2021 17:10, Ali Ahmed wrote:
>
> > After this commit to use phosphor-webui or D-Bus REST, you will need
> > to set -Drest=enabled in your bbappend. Note: webui-vue uses Redfish
> > and will not be impacted. Let me know if you have any concerns.
>
> As far I knew, the webui-vue uses REST API to retrieve the TPM status.
> Please, look to the link below [1]

@gunnar @derick  isn't this against one of the primary design goals of
webui-vue?  Was it intentionally merged?  It seems like having
webui-vue rely on dbus-rest just keeps digging the hole deeper on this
initial thing, which is getting dbus-rest disabled by default.

>
> Links:
> [1]  https://github.com/openbmc/webui-vue/blob/6dba4be6125c10210bafa030ac17737d3a9b28b8/src/store/modules/Operations/BootSettingsStore.js#L73
> >
> > -Ali Ahmed
> >
>
> --
> Best regards,
>
> Igor Kononenko
